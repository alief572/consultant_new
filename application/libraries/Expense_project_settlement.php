<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once __DIR__ . '/Expense_project_flow.php';

class Expense_project_settlement
{
    private $db;
    private $finance;
    private $gl;
    private $checkedTransactions = false;
    const HEADER = 'kons_tr_expense_report_project_header';
    const RETURNS = 'kons_tr_expense_project_return';
    const HISTORY = 'kons_tr_expense_project_return_history';

    public function __construct($params = [])
    {
        $ci = $params['ci'] ?? get_instance();
        $this->db = $ci->db;
        $this->finance = $params['finance'] ?? ($ci->load->database('sendigs_finance', true)->database ?: DBSF);
        $this->gl = $params['gl'] ?? $ci->load->database('gl_sendigs', true)->database;
        foreach ([$this->finance, $this->gl] as $schema) {
            if (!preg_match('/^[a-zA-Z0-9_]+$/D', $schema)) {
                throw new RuntimeException('Schema tidak valid.');
            }
        }
    }

    private function query($sql, $args = [])
    {
        $result = $this->db->query($sql, $args);
        if ($result === false) {
            throw new RuntimeException('Penyimpanan atau pembacaan data gagal.');
        }
        return $result;
    }

    private function one($table, $where, $lock = false)
    {
        $clauses = [];
        foreach ($where as $key => $value) {
            $clauses[] = "`$key` = ?";
        }
        $rows = $this->query('SELECT * FROM ' . $table . ' WHERE ' . implode(' AND ', $clauses)
            . ($lock ? ' FOR UPDATE' : ''), array_values($where))->result_array();
        if (count($rows) !== 1) {
            throw new RuntimeException('Data tidak ditemukan atau referensi tidak unik.');
        }
        return $rows[0];
    }

    private function write($table, array $data, $where = null)
    {
        $ok = $where === null ? $this->db->insert($table, $data) : $this->db->update($table, $data, $where);
        if (!$ok) {
            throw new RuntimeException('Penyimpanan data gagal.');
        }
        return $this->db->insert_id();
    }

    private function transaction(callable $action)
    {
        if (!$this->checkedTransactions) {
            foreach ([[ $this->db->database, self::HEADER ], [ $this->db->database, self::RETURNS ],
                [ $this->db->database, self::HISTORY ], [ $this->finance, 'tr_jurnal' ],
                [ $this->finance, 'tr_expense' ], [ $this->finance, 'tr_expense_detail' ]] as $table) {
                $engine = $this->query('SELECT ENGINE FROM information_schema.TABLES WHERE TABLE_SCHEMA=? AND TABLE_NAME=?', $table)->row_array();
                if (!$engine || $engine['ENGINE'] !== 'InnoDB') {
                    throw new RuntimeException('Tabel settlement wajib tersedia dan memakai InnoDB.');
                }
            }
            $this->checkedTransactions = true;
        }
        $debug = $this->db->db_debug;
        $this->db->db_debug = false;
        if (!$this->db->trans_begin()) {
            $this->db->db_debug = $debug;
            throw new RuntimeException('Transaksi database tidak dapat dimulai.');
        }
        try {
            $result = $action();
            if (!$this->db->trans_status()) {
                throw new RuntimeException('Transaksi gagal disimpan.');
            }
            if (!$this->db->trans_commit()) {
                throw new RuntimeException('Transaksi database gagal dikomit.');
            }
            return $result;
        } catch (Throwable $error) {
            $this->db->trans_rollback();
            throw $error;
        } finally {
            $this->db->db_debug = $debug;
        }
    }

    public function header($id, $lock = false)
    {
        return $this->one(self::HEADER, ['id' => $id], $lock);
    }

    public function isNew($header)
    {
        return (int) ($header['flow_version'] ?? 1) === 2;
    }

    public function assertEditable(array $header, $actor, $allowManage = false)
    {
        if (!$this->isNew($header) || (!$allowManage && (string) $header['created_by'] !== (string) $actor)
            || (string) $header['sts'] === '1' || (string) $header['sts_req'] === '1') {
            throw new RuntimeException('Laporan tidak dapat diubah oleh pengguna ini atau sedang diproses.');
        }
    }

    private function context($kasbonId)
    {
        $kasbon = $this->one('kons_tr_kasbon_project_header', ['id' => $kasbonId]);
        $quotation = $this->one('kons_tr_penawaran', ['id_quotation' => $kasbon['id_penawaran']]);
        $company = $this->one('kons_tr_company', ['id' => $quotation['company']]);
        return [$kasbon, $company];
    }

    public function items($kasbon)
    {
        $type = (string) $kasbon['tipe'];
        $specs = [
            '1' => ['subcont', 'aktifitas', 'kons_tr_spk_budgeting_aktifitas', null],
            '2' => ['akomodasi', 'akomodasi', 'kons_tr_spk_budgeting_akomodasi', 'kons_master_biaya'],
            '3' => ['others', 'others', 'kons_tr_spk_budgeting_others', 'kons_master_biaya'],
            '4' => ['lab', 'lab', 'kons_tr_spk_budgeting_lab', 'kons_master_lab'],
            '5' => ['subcont_tenaga_ahli', 'subcont', 'kons_tr_spk_budgeting_subcont_tenaga_ahli', 'kons_master_tenaga_ahli'],
            '6' => ['subcont_perusahaan', 'subcont', 'kons_tr_spk_budgeting_subcont_perusahaan', 'kons_master_subcont_perusahaan']
        ];
        if (!isset($specs[$type])) {
            throw new RuntimeException('Jenis kasbon tidak didukung.');
        }
        list($suffix, $key, $budgetTable, $master) = $specs[$type];
        $rows = $this->query('SELECT * FROM kons_tr_kasbon_project_' . $suffix . ' WHERE id_header=?', [$kasbon['id']])->result_array();
        $items = [];
        foreach ($rows as $item) {
            $id = $item['id_' . $key];
            if ($budgetTable && empty($item['custom_' . $suffix])) {
                $budget = $this->one($budgetTable, ['id_spk_budgeting' => $kasbon['id_spk_budgeting'], 'id_' . $key => $id]);
                $id = $budget['id'];
            }
            if (isset($items[$id])) {
                throw new RuntimeException('Referensi item kasbon ganda.');
            }
            $coa = '5101-01-03';
            if ($master) {
                $mapping = $this->one($master, ['id' => $item['id_item']]);
                $coa = !empty($mapping['no_coa']) ? $mapping['no_coa'] : $coa;
            }
            $items[$id] = ['coa' => $coa, 'qty' => $item['qty_pengajuan'], 'price' => $item['nominal_pengajuan']];
        }
        return $items;
    }

    public function calculation($kasbonId, array $details)
    {
        list($kasbon, $company) = $this->context($kasbonId);
        $items = $this->items($kasbon);
        $costs = [];
        $actual = 0;
        $advance = 0;
        $seen = [];
        foreach ($items as $item) {
            $advance += Expense_project_flow::product($item['qty'], $item['price']);
        }
        foreach ($details as $detail) {
            $id = $detail['id_detail_kasbon'];
            $amount = Expense_project_flow::product($detail['qty_expense'], $detail['nominal_expense']);
            if (!$amount && !isset($items[$id])) {
                continue;
            }
            if (!isset($items[$id]) || isset($seen[$id])) {
                throw new RuntimeException('Item expense tidak sesuai kasbon atau duplikat.');
            }
            $seen[$id] = true;
            $coa = $items[$id]['coa'];
            $costs[$coa] = ($costs[$coa] ?? 0) + $amount;
            $actual += $amount;
        }
        return compact('kasbon', 'company', 'costs', 'actual', 'advance');
    }

    public function prepareInput(array $post, $actor, $allowManage = false)
    {
        $details = $post['detail_subcont'] ?? [];
        $calc = $this->calculation($post['id_header'], $details);
        $kasbon = $calc['kasbon'];
        if ((string) $kasbon['sts'] !== '1' || (!$allowManage && (string) $kasbon['created_by'] !== (string) $actor)) {
            throw new RuntimeException('Kasbon belum disetujui atau bukan milik pengguna ini.');
        }
        $items = $this->items($kasbon);
        foreach ($details as &$detail) {
            $item = $items[$detail['id_detail_kasbon']] ?? ['qty' => 0, 'price' => 0];
            $detail['qty_kasbon'] = $item['qty'];
            $detail['nominal_kasbon'] = $item['price'];
        }
        unset($detail);
        $post['detail_subcont'] = $details;
        foreach (['id_spk_budgeting', 'id_spk_penawaran', 'id_penawaran', 'tipe'] as $key) {
            $post[$key] = $kasbon[$key];
        }
        $post['bank'] = '';
        return [$post, $calc];
    }

    public function lockKasbon($id)
    {
        $this->one('kons_tr_kasbon_project_header', ['id' => $id], true);
        $existing = $this->query('SELECT id FROM ' . self::HEADER . ' WHERE id_header=? FOR UPDATE', [$id])->num_rows();
        if ($existing) {
            throw new RuntimeException('Kasbon sudah memiliki laporan. Revisi laporan yang tersedia.');
        }
    }

    private function journalRow($coa, $debit, $credit, array $company, $date)
    {
        $account = $this->one($this->gl . '.coa_master', ['no_perkiraan' => $coa]);
        return ['coa' => $coa, 'nm_coa' => $account['nama'], 'id_company' => $company['id'],
            'nm_company' => $company['nm_company'], 'tgl_jurnal' => $date,
            'debit' => Expense_project_flow::amount($debit), 'kredit' => Expense_project_flow::amount($credit)];
    }

    public function journals(array $calc)
    {
        $rows = [];
        $s = Expense_project_flow::settlement($calc['advance'], $calc['actual']);
        foreach ($calc['costs'] as $coa => $amount) {
            if ($amount) {
                $rows[] = $this->journalRow($coa, $amount, 0, $calc['company'], date('Y-m-d'));
            }
        }
        if ($s['refund_debit']) {
            $rows[] = $this->journalRow('1103-01-15', $s['refund_debit'], 0, $calc['company'], date('Y-m-d'));
        }
        if ($s['receivable_credit']) {
            $rows[] = $this->journalRow('1103-01-14', 0, $s['receivable_credit'], $calc['company'], date('Y-m-d'));
        }
        if ($s['payable_credit']) {
            $rows[] = $this->journalRow('9999-99-99', 0, $s['payable_credit'], $calc['company'], date('Y-m-d'));
        }
        return $rows;
    }

    public function preview($kasbonId, $details = null)
    {
        if ($details === null) {
            $header = $this->one(self::HEADER, ['id_header' => $kasbonId]);
            $details = $this->query('SELECT * FROM kons_tr_expense_report_project_detail WHERE id_header_expense=?', [$header['id']])->result_array();
        }
        return $this->journals($this->calculation($kasbonId, $details));
    }

    public function previewResponse(array $rows)
    {
        $html = '';
        $debit = $credit = 0;
        foreach ($rows as $row) {
            $html .= '<tr>';
            $html .= '<td class="text-center">' . htmlspecialchars($row['tgl_jurnal'], ENT_QUOTES, 'UTF-8') . '</td>';
            $html .= '<td class="text-center">' . htmlspecialchars($row['coa'], ENT_QUOTES, 'UTF-8') . '</td>';
            $html .= '<td>' . htmlspecialchars($row['nm_company'], ENT_QUOTES, 'UTF-8') . '</td>';
            $html .= '<td>' . htmlspecialchars($row['nm_coa'], ENT_QUOTES, 'UTF-8') . '</td>';
            $html .= '<td>' . htmlspecialchars($row['nm_coa'], ENT_QUOTES, 'UTF-8') . '</td>';
            $html .= '<td class="text-right font-bold">' . number_format((float) str_replace(',', '', $row['debit']), 2) . '</td>';
            $html .= '<td class="text-right font-bold">' . number_format((float) str_replace(',', '', $row['kredit']), 2) . '</td>';
            $html .= '</tr>';
            $debit += Expense_project_flow::cents($row['debit']);
            $credit += Expense_project_flow::cents($row['kredit']);
        }
        return ['hasil' => $html, 'ttl_debit' => $debit / 100, 'ttl_kredit' => $credit / 100];
    }

    private function saveJournals($id, $phase, array $rows, $actor)
    {
        $reference = 'EXP2-' . $phase . '-' . substr(hash('sha256', $id), 0, 32);
        foreach ($rows as $index => $row) {
            $row += ['no_jurnal' => $reference . '-' . ($index + 1), 'no_transaksi' => $id,
                'jenis_transaksi' => $phase === 'RETURN' ? 'Pengembalian Expense Project' : 'Expense Report Consultant',
                'keterangan' => $row['nm_coa'] . ' - ' . $id, 'sts' => '0',
                'created_by' => $actor, 'created_date' => date('Y-m-d H:i:s')];
            $this->write($this->finance . '.tr_jurnal', $row);
        }
        return $reference;
    }

    public function approve($id, $actor)
    {
        return $this->transaction(function () use ($id, $actor) {
            $header = $this->header($id, true);
            if (!$this->isNew($header)) {
                throw new RuntimeException('Laporan menggunakan flow lama.');
            }
            if ((string) $header['sts'] === '1') {
                return;
            }
            if ((string) $header['sts_req'] !== '1') {
                throw new RuntimeException('Laporan belum diajukan untuk approval.');
            }
            $details = $this->query('SELECT * FROM kons_tr_expense_report_project_detail WHERE id_header_expense=? FOR UPDATE', [$id])->result_array();
            $calc = $this->calculation($header['id_header'], $details);
            if ($calc['actual'] !== Expense_project_flow::cents($header['total_expense_report'])
                || $calc['advance'] !== Expense_project_flow::cents($header['total_kasbon'])) {
                throw new RuntimeException('Total laporan berbeda dari rincian kasbon. Revisi laporan terlebih dahulu.');
            }
            $existing = $this->query('SELECT id FROM ' . $this->finance . '.tr_jurnal WHERE no_transaksi=? AND jenis_transaksi=?', [$id, 'Expense Report Consultant'])->num_rows();
            if ($existing) {
                throw new RuntimeException('Jurnal laporan sudah tersedia; periksa sebelum approval.');
            }
            $this->saveJournals($id, 'APPROVAL', $this->journals($calc), $actor);
            $difference = $calc['advance'] - $calc['actual'];
            if ($difference > 0) {
                $this->write(self::RETURNS, ['expense_id' => $id, 'amount' => Expense_project_flow::amount($difference), 'status' => 'waiting_return']);
            } elseif ($difference < 0) {
                if (strlen($id) > 50) {
                    throw new RuntimeException('Nomor Expense melebihi kapasitas referensi Finance.');
                }
                $user = $this->one('users', ['id_user' => $header['created_by']]);
                $reimburseAmount = Expense_project_flow::amount(-$difference);
                $desc = 'Reimbursement / Lebih Bayar Kasbon ' . $header['id_header'] . ' - ' . $calc['kasbon']['deskripsi'];
                $this->write($this->finance . '.tr_expense', [
                    'no_doc' => $id,
                    'tgl_doc' => substr($header['created_date'], 0, 10),
                    'nama' => $user['nm_lengkap'],
                    'status' => 2,
                    'created_by' => $user['username'],
                    'created_on' => date('Y-m-d H:i:s'),
                    'approved_by' => (string) $actor,
                    'approved_on' => date('Y-m-d H:i:s'),
                    'jumlah' => $reimburseAmount,
                    'kurang_bayar' => $reimburseAmount,
                    'total_kasbon' => Expense_project_flow::amount($calc['advance']),
                    'informasi' => mb_substr('Lebih Bayar - ' . $calc['kasbon']['deskripsi'], 0, 250),
                    'bank_id' => $calc['kasbon']['bank'],
                    'accnumber' => $calc['kasbon']['bank_number'],
                    'accname' => $calc['kasbon']['bank_account'],
                    'id_kasbon' => $header['id_header'],
                    'project_consultant' => '1',
                    'no_expense_consultant' => $id,
                    'sts_finance' => '1',
                    'app_finance_date' => date('Y-m-d H:i:s'),
                    'sts_reject' => 0,
                    'sts_reject_manage' => 0
                ]);
                $this->write($this->finance . '.tr_expense_detail', [
                    'tanggal' => date('Y-m-d'),
                    'no_doc' => $id,
                    'deskripsi' => mb_substr($desc, 0, 2000),
                    'qty' => 1,
                    'harga' => $reimburseAmount,
                    'total_harga' => $reimburseAmount,
                    'keterangan' => mb_substr($desc, 0, 2000),
                    'status' => 2,
                    'expense' => $reimburseAmount,
                    'kasbon' => 0,
                    'qty_kasbon' => 0,
                    'nominal_kasbon' => 0,
                    'qty_expense' => 1,
                    'nominal_expense' => $reimburseAmount,
                    'created_by' => $user['username'],
                    'created_on' => date('Y-m-d H:i:s'),
                    'id_kasbon' => $header['id_header'],
                    'req_payment' => 0
                ]);
            }
            $this->write(self::HEADER, ['sts' => '1', 'sts_req' => null, 'reject_reason' => '',
                'approved_by' => $actor, 'approved_date' => date('Y-m-d H:i:s')], ['id' => $id]);
        });
    }

    public function requestApproval($id, $actor, $allowManage = false)
    {
        return $this->transaction(function () use ($id, $actor, $allowManage) {
            $header = $this->header($id, true);
            $this->assertEditable($header, $actor, $allowManage);
            $this->write(self::HEADER, ['sts_req' => '1', 'reject_reason' => ''], ['id' => $id]);
        });
    }

    public function reject($id, $actor, $reason)
    {
        return $this->transaction(function () use ($id, $actor, $reason) {
            $header = $this->header($id, true);
            if (!$this->isNew($header) || (string) $header['sts'] === '1' || (string) $header['sts_req'] !== '1' || trim($reason) === '') {
                throw new RuntimeException('Laporan tidak dapat ditolak atau alasan belum diisi.');
            }
            $this->write(self::HEADER, ['sts' => null, 'sts_req' => null, 'reject_reason' => $reason,
                'rejected_by' => $actor, 'rejected_date' => date('Y-m-d H:i:s')], ['id' => $id]);
        });
    }

    public function banks()
    {
        return $this->query('SELECT a.id,a.rekening,a.nama,a.coa_bank,b.nama_bank FROM ' . $this->finance
            . '.ms_bank a LEFT JOIN ' . $this->finance . '.list_bank b ON b.id=a.bank WHERE a.deleted=?', ['0'])->result_array();
    }

    public function listing($actor, $finance = false)
    {
        return $this->query('SELECT h.*,r.amount,r.status AS return_status,r.bank_id,r.transfer_date,r.submitted_at,r.verified_at,r.rejection_reason,k.deskripsi,u.nm_lengkap'
            . ' FROM ' . self::HEADER . ' h JOIN ' . self::RETURNS . ' r ON r.expense_id=h.id'
            . ' JOIN kons_tr_kasbon_project_header k ON k.id=h.id_header LEFT JOIN users u ON u.id_user=h.created_by'
            . ' WHERE h.flow_version=2' . ($finance ? '' : ' AND h.created_by=?') . ' ORDER BY h.created_date DESC', $finance ? [] : [$actor])->result_array();
    }

    public function monitoring($actor, $allowAll = false)
    {
        $rows = $this->query('SELECT h.id,h.id_header,h.sts,h.sts_req,h.reject_reason,h.approved_date,h.selisih,h.sts_reject,h.sts_reject_manage,h.reject_reason AS finance_rejection_reason,k.deskripsi,e.id AS expense_id,e.status AS expense_status,p.id AS payment_id,p.no_request,p.status AS payment_status,p.keterangan,p.nm_company,p.jumlah'
            . ' FROM ' . self::HEADER . ' h JOIN kons_tr_kasbon_project_header k ON k.id=h.id_header'
            . ' LEFT JOIN ' . $this->finance . '.tr_expense e ON e.project_consultant=\'1\' AND e.no_expense_consultant=h.id'
            . ' LEFT JOIN ' . $this->finance . '.request_payment p ON p.tipe=\'expense\' AND (p.no_doc=h.id OR (e.id IS NOT NULL AND p.ids=CAST(e.id AS CHAR)))'
            . ' WHERE h.flow_version=2 AND h.selisih<0' . ($allowAll ? '' : ' AND h.created_by=?') . ' ORDER BY h.created_date DESC',
            $allowAll ? [] : [$actor])->result_array();
        foreach ($rows as &$row) {
            $row['monitoring_status'] = Expense_project_flow::reimbursementStatus($row);
        }
        return $rows;
    }

    public function returnDetail($id, $actor, $finance, $allowAdmin = false)
    {
        $header = $this->header($id);
        if (!$this->isNew($header) || (!$finance && !$allowAdmin && (string) $header['created_by'] !== (string) $actor)) {
            throw new RuntimeException('Laporan tidak dapat diakses.');
        }
        $return = $this->one(self::RETURNS, ['expense_id' => $id]);
        $history = $this->query('SELECT h.*, u.nm_lengkap FROM ' . self::HISTORY . ' h LEFT JOIN users u ON u.id_user = h.actor WHERE h.expense_id=? ORDER BY h.id DESC', [$id])->result_array();
        $journals = [];
        if ($return['status'] === 'completed') {
            $journals = $this->query('SELECT * FROM ' . $this->finance . '.tr_jurnal WHERE no_transaksi=? AND jenis_transaksi=? ORDER BY id',
                [$id, 'Pengembalian Expense Project'])->result_array();
        } elseif ($return['bank_id']) {
            list($kasbon, $company) = $this->context($header['id_header']);
            $bank = $this->one($this->finance . '.ms_bank', ['id' => $return['bank_id']]);
            $amount = Expense_project_flow::cents($return['amount']);
            $journals[] = $this->journalRow($bank['coa_bank'], $amount, 0, $company, $return['transfer_date']);
            $journals[] = $this->journalRow('1103-01-15', 0, $amount, $company, $return['transfer_date']);
        }
        return compact('header', 'return', 'history', 'journals');
    }

    public function submitReturn($id, $actor, $bankId, $date, $amount, $file)
    {
        return $this->transaction(function () use ($id, $actor, $bankId, $date, $amount, $file) {
            $header = $this->header($id, true);
            $return = $this->one(self::RETURNS, ['expense_id' => $id], true);
            if (!$this->isNew($header) || (string) $header['created_by'] !== (string) $actor || $return['status'] !== 'waiting_return') {
                throw new RuntimeException('Pengembalian tidak dapat diajukan.');
            }
            if (Expense_project_flow::cents($amount) !== Expense_project_flow::cents($return['amount'])) {
                throw new RuntimeException('Nominal harus sama dengan seluruh sisa kasbon.');
            }
            $parsed = DateTime::createFromFormat('!Y-m-d', $date);
            if (!$parsed || $parsed->format('Y-m-d') !== $date || $date > date('Y-m-d') || $date < substr($header['approved_date'], 0, 10)) {
                throw new RuntimeException('Tanggal transfer harus sejak approval sampai hari ini.');
            }
            $bank = $this->one($this->finance . '.ms_bank', ['id' => $bankId, 'deleted' => '0']);
            $this->one($this->gl . '.coa_master', ['no_perkiraan' => $bank['coa_bank']]);
            if (!$file) {
                throw new RuntimeException('Bukti transfer wajib diunggah.');
            }
            $this->write(self::RETURNS, ['status' => 'waiting_verification', 'bank_id' => $bankId,
                'transfer_date' => $date, 'submitted_at' => date('Y-m-d H:i:s'), 'rejection_reason' => null], ['expense_id' => $id]);
            $this->write(self::HISTORY, ['expense_id' => $id, 'action' => 'submit', 'actor' => $actor,
                'created_at' => date('Y-m-d H:i:s'), 'bank_id' => $bankId, 'transfer_date' => $date, 'file_path' => $file]);
        });
    }

    public function verifyReturn($id, $actor, $approve, $note, array $checks, $allowAdmin = false)
    {
        return $this->transaction(function () use ($id, $actor, $approve, $note, $checks, $allowAdmin) {
            $header = $this->header($id, true);
            $return = $this->one(self::RETURNS, ['expense_id' => $id], true);
            if (!$this->isNew($header) || (!$allowAdmin && (string) $header['created_by'] === (string) $actor)) {
                throw new RuntimeException('Tidak boleh memverifikasi laporan sendiri.');
            }
            if ($approve && $return['status'] === 'completed') {
                return;
            }
            if ($return['status'] !== 'waiting_verification') {
                throw new RuntimeException('Pengembalian tidak sedang menunggu verifikasi.');
            }
            if (!$approve) {
                if (trim($note) === '') {
                    throw new RuntimeException('Alasan penolakan wajib diisi.');
                }
                $this->write(self::RETURNS, ['status' => 'waiting_return', 'rejection_reason' => $note,
                    'bank_id' => null, 'transfer_date' => null, 'submitted_at' => null], ['expense_id' => $id]);
            } else {
                foreach (['amount', 'date', 'received'] as $check) {
                    if ((string) ($checks[$check] ?? '') !== '1') {
                        throw new RuntimeException('Seluruh checklist verifikasi wajib dicentang.');
                    }
                }
                $detail = $this->returnDetail($id, $actor, true);
                if (count($detail['journals']) !== 2) {
                    throw new RuntimeException('Jurnal pengembalian tidak lengkap.');
                }
                $reference = $this->saveJournals($id, 'RETURN', $detail['journals'], $actor);
                $this->write(self::RETURNS, ['status' => 'completed', 'verified_by' => $actor,
                    'verified_at' => date('Y-m-d H:i:s'), 'journal_reference' => $reference], ['expense_id' => $id]);
            }
            $this->write(self::HISTORY, ['expense_id' => $id, 'action' => $approve ? 'verify' : 'reject',
                'actor' => $actor, 'created_at' => date('Y-m-d H:i:s'), 'note' => $note]);
        });
    }
}
