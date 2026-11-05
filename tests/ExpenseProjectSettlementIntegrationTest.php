<?php
// CLI only. Uses disposable schemas and the real CodeIgniter mysqli driver.
if (PHP_SAPI !== 'cli') { exit(1); }
define('BASEPATH', dirname(__DIR__) . '/system/');
define('ENVIRONMENT', 'development');
function log_message($level, $message) {}
function is_php($version) { return version_compare(PHP_VERSION, $version, '>='); }
function show_error($message) { throw new RuntimeException($message); }
require dirname(__DIR__) . '/application/config/development/database.php';
$configuration = $db['default'];
if ($configuration['hostname'] === '206.84.97.107') {
    $testMysql = @new mysqli('mysql8', 'root', 'root');
    if ($testMysql && !$testMysql->connect_error) {
        $configuration['hostname'] = 'mysql8';
        $configuration['username'] = 'root';
        $configuration['password'] = 'root';
        $configuration['database'] = 'db_consultant_new';
    }
}
require BASEPATH . 'database/DB.php';
require dirname(__DIR__) . '/application/libraries/Expense_project_settlement.php';

function ensure_settlement($condition, $message)
{
    if (!$condition) { throw new RuntimeException($message); }
}
function reject_settlement(callable $operation)
{
    try { $operation(); } catch (RuntimeException $expected) { return; }
    throw new LogicException('Expected operation to be rejected');
}
function connect_settlement($configuration, $source, $finance, $gl)
{
    $configuration['database'] = $source;
    $configuration['db_debug'] = false;
    $configuration['stricton'] = false;
    $connection = DB($configuration, true);
    $connection->query("SET SESSION sql_mode=''");
    $ci = (object) ['db' => $connection];
    return [$connection, new Expense_project_settlement(['ci' => $ci, 'finance' => $finance, 'gl' => $gl])];
}

if (($argv[1] ?? '') === '--worker') {
    list($connection, $service) = connect_settlement($configuration, $argv[2], $argv[3], $argv[4]);
    if ($argv[5] === 'approve') {
        $service->approve($argv[6], '990002');
    } else {
        $service->verifyReturn($argv[6], '990002', true, '', ['amount' => 1, 'date' => 1, 'received' => 1]);
    }
    exit(0);
}

$admin = new mysqli($configuration['hostname'], $configuration['username'], $configuration['password'], $configuration['database']);
$prefix = 'expense_flow_test_' . bin2hex(random_bytes(5));
$source = $prefix . '_source';
$finance = $prefix . '_finance';
$gl = $prefix . '_gl';
$schemas = [$source, $finance, $gl];
$sequence = 100000;
try {
    foreach ($schemas as $schema) {
        ensure_settlement((bool) $admin->query("CREATE DATABASE `$schema`"), 'Create test schema');
    }
    $sourceTables = ['kons_tr_expense_report_project_header', 'kons_tr_expense_report_project_detail', 'kons_tr_kasbon_project_header',
        'kons_tr_penawaran', 'kons_tr_spk_penawaran', 'kons_tr_company', 'users', 'menus', 'permissions', 'request_payment'];
    foreach (['subcont', 'akomodasi', 'others', 'lab', 'subcont_tenaga_ahli', 'subcont_perusahaan'] as $suffix) {
        $sourceTables[] = 'kons_tr_kasbon_project_' . $suffix;
    }
    foreach (['aktifitas', 'akomodasi', 'others', 'lab', 'subcont_tenaga_ahli', 'subcont_perusahaan'] as $suffix) { $sourceTables[] = 'kons_tr_spk_budgeting_' . $suffix; }
    foreach (['biaya', 'lab', 'tenaga_ahli', 'subcont_perusahaan'] as $suffix) { $sourceTables[] = 'kons_master_' . $suffix; }
    foreach ($sourceTables as $table) { $admin->query("CREATE TABLE `$source`.`$table` LIKE `db_consultant_new`.`$table`"); }
    foreach (['request_payment', 'tr_jurnal', 'ms_bank', 'list_bank', 'tr_expense', 'tr_expense_detail', 'tr_rp_pengajuan_h', 'tr_rp_pengajuan_d', 'tr_rp_record', 'tr_rp_reject_log'] as $table) {
        $admin->query("CREATE TABLE `$finance`.`$table` LIKE db_sendigs_ss.`$table`");
    }
    // Recreate pre-migration shape even when the local application has already been upgraded.
    $column = $admin->query("SHOW COLUMNS FROM `$source`.kons_tr_expense_report_project_header LIKE 'flow_version'");
    if ($column->num_rows) { $admin->query("ALTER TABLE `$source`.kons_tr_expense_report_project_header DROP COLUMN flow_version"); }
    $column = $admin->query("SHOW COLUMNS FROM `$finance`.request_payment LIKE 'source_module'");
    if ($column->num_rows) {
        $admin->query("ALTER TABLE `$finance`.request_payment DROP INDEX expense_project_source, DROP COLUMN source_module, DROP COLUMN source_id, DROP COLUMN id_company, DROP COLUMN nm_company");
    }
    $admin->query("CREATE TABLE `$gl`.coa_master LIKE db_sendigs_gl_ss.coa_master");
    $admin->query("INSERT INTO `$source`.menus SELECT * FROM db_consultant_new.menus WHERE link='approval_expense_report_project'");
    $admin->select_db($source);
    $migration = file_get_contents(dirname(__DIR__) . '/application/modules/expense_report_project/sql/settlement_v2.sql');
    $migration = preg_replace('/^--.*$/m', '', str_replace('db_sendigs_ss', $finance, $migration));
    foreach (explode(';', $migration) as $statement) {
        if (trim($statement) !== '') {
            ensure_settlement((bool) $admin->query($statement), 'Migration: ' . $admin->error);
        }
    }
    list($connection, $service) = connect_settlement($configuration, $source, $finance, $gl);
    $insert = function ($table, $values) use ($connection) {
        ensure_settlement($connection->insert($table, $values), 'Fixture insert ' . $table . ': ' . json_encode($connection->error()));
    };
    $scalar = function ($sql, $params = []) use ($connection) { return $connection->query($sql, $params)->row_array()['n']; };
    foreach (['1103-01-14', '1103-01-15', '5101-01-03', '5101-01-05', '9999-99-99', '1101-02-01'] as $coa) {
        $insert($gl . '.coa_master', ['no_perkiraan' => $coa, 'nama' => 'Test ' . $coa]);
    }
    $insert('kons_tr_company', ['id' => '1', 'nm_company' => 'Test Company']);
    $insert('kons_tr_penawaran', ['id_quotation' => 'TEST-Q', 'company' => '1']);
    $insert('users', ['id_user' => '990001', 'username' => 'flow_owner', 'nm_lengkap' => 'Test Owner']);
    $insert($finance . '.ms_bank', ['id' => 1, 'deleted' => '0', 'coa_bank' => '1101-02-01', 'rekening' => 'TEST', 'nama' => 'Company']);
    foreach (['biaya', 'lab', 'tenaga_ahli', 'subcont_perusahaan'] as $suffix) {
        $insert('kons_master_' . $suffix, ['id' => '1', 'no_coa' => '5101-01-05']);
    }

    $fixture = function ($type, $actual = 800000, $version = 2) use (&$sequence, $insert, $service) {
        $number = ++$sequence;
        $kasbon = 'TEST-K-' . $number;
        $expense = 'TEST-E-' . $number;
        $budget = 'TEST-B-' . $number;
        $insert('kons_tr_kasbon_project_header', ['id' => $kasbon, 'id_penawaran' => 'TEST-Q', 'id_spk_budgeting' => $budget,
            'tipe' => $type, 'sts' => '1', 'grand_total' => '1000000', 'created_by' => '990001', 'deskripsi' => 'Test reimbursement']);
        $specs = [1 => ['subcont', 'aktifitas'], 2 => ['akomodasi', 'akomodasi'], 3 => ['others', 'others'],
            4 => ['lab', 'lab'], 5 => ['subcont_tenaga_ahli', 'subcont'], 6 => ['subcont_perusahaan', 'subcont']];
        list($suffix, $key) = $specs[$type];
        for ($item = 1; $item <= 2; $item++) {
            $id = $number * 10 + $item;
            $budgetTable = $type === 1 ? 'kons_tr_spk_budgeting_aktifitas' : 'kons_tr_spk_budgeting_' . $suffix;
            if ($budgetTable) {
                $budgetRow = ['id' => $id, 'id_spk_budgeting' => $budget, 'id_' . $key => $id];
                if ($type === 1) {
                    $budgetRow['create_by'] = 'tester';
                    $budgetRow['create_date'] = date('Y-m-d H:i:s');
                }
                $insert($budgetTable, $budgetRow);
            }
            $rowKasbon = ['id_header' => $kasbon, 'id_' . $key => $id,
                'qty_pengajuan' => 1, 'nominal_pengajuan' => 500000, 'total_pengajuan' => 500000];
            if ($type !== 1) {
                $rowKasbon['id_item'] = '1';
            }
            $insert('kons_tr_kasbon_project_' . $suffix, $rowKasbon);
        }
        $insert('kons_tr_expense_report_project_header', ['id' => $expense, 'id_header' => $kasbon,
            'flow_version' => $version, 'sts' => null, 'sts_req' => '1', 'total_kasbon' => 1000000,
            'total_expense_report' => $actual, 'selisih' => 1000000 - $actual, 'created_by' => '990001', 'created_date' => date('Y-m-d H:i:s')]);
        for ($item = 1; $item <= 2; $item++) {
            $id = $number * 10 + $item;
            $insert('kons_tr_expense_report_project_detail', ['id_header_expense' => $expense,
                'id_detail_kasbon' => $id, 'qty_expense' => 1, 'nominal_expense' => $actual / 2]);
        }
        return $expense;
    };

    // Six categories and three settlement differences (equal, surplus kasbon, reimbursement).
    $journalCount = 0;
    foreach (range(1, 6) as $type) {
        foreach ([1000000, 800000, 1200000] as $actual) {
            $id = $fixture($type, $actual);
            $service->approve($id, '990002');
            $header = $service->header($id);
            ensure_settlement((string) $header['sts'] === '1', 'Approved state set for type ' . $type);
            $journals = $connection->query("SELECT * FROM `$finance`.tr_jurnal WHERE no_transaksi=?", [$id])->result_array();
            $expectedRows = $actual === 1000000 ? 2 : 3;
            ensure_settlement(count($journals) === $expectedRows, 'Expected ' . $expectedRows . ' journals, got ' . count($journals));
            $journalCount += $expectedRows;
            $debit = 0; $credit = 0;
            foreach ($journals as $journal) {
                $debit += Expense_project_flow::cents($journal['debit']);
                $credit += Expense_project_flow::cents($journal['kredit']);
                ensure_settlement($journal['id_company'] === '1', 'Company 1 mapped to id_company 1');
            }
            ensure_settlement($debit === $credit, 'Journal balances for type ' . $type);
            $returnRow = $connection->query('SELECT * FROM kons_tr_expense_project_return WHERE expense_id=?', [$id])->row_array();
            if ($actual === 800000) {
                ensure_settlement($returnRow && (int) Expense_project_flow::cents($returnRow['amount']) === 20000000, 'Return recorded for surplus');
            } else {
                ensure_settlement(!$returnRow, 'No return for balanced or over-spent report');
            }
            $expRows = $connection->query("SELECT * FROM `$finance`.tr_expense WHERE no_expense_consultant=?", [$id])->result_array();
            if ($actual === 1200000) {
                ensure_settlement(count($expRows) === 1, 'Over-spent report inserted into tr_expense');
                ensure_settlement($expRows[0]['project_consultant'] === '1', 'tr_expense marked as consultant');
                ensure_settlement((string) $expRows[0]['status'] === '2', 'tr_expense status 2');
                ensure_settlement((string) $expRows[0]['sts_finance'] === '1', 'tr_expense sts_finance 1');
                ensure_settlement((int) Expense_project_flow::cents($expRows[0]['kurang_bayar']) === 20000000, 'tr_expense kurang_bayar set');
                $detailRows = $connection->query("SELECT * FROM `$finance`.tr_expense_detail WHERE no_doc=?", [$id])->result_array();
                ensure_settlement(count($detailRows) === 1, 'tr_expense_detail inserted');
                ensure_settlement((string) $detailRows[0]['status'] === '2', 'tr_expense_detail status 2');
                ensure_settlement((int) Expense_project_flow::cents($detailRows[0]['total_harga']) === 20000000, 'tr_expense_detail total_harga set');
            } else {
                ensure_settlement(!$expRows, 'No tr_expense for equal or under-budget report');
            }
        }
    }

    // Zero-realization edge case.
    $zeroExpense = $fixture(1, 0);
    $service->approve($zeroExpense, '990002');
    $zeroJournals = $connection->query("SELECT * FROM `$finance`.tr_jurnal WHERE no_transaksi=? ORDER BY id ASC", [$zeroExpense])->result_array();
    ensure_settlement(count($zeroJournals) === 2, 'Zero realization generates refund and receivable journals only');
    ensure_settlement($zeroJournals[0]['coa'] === '1103-01-15', 'Full advance routed to 1103-01-15');
    $journalCount += 2;

    // Reject and resubmit cycle with file upload validation.
    $id = $fixture(2, 800000);
    $service->reject($id, '990002', 'Revisi diperlukan');
    $header = $service->header($id);
    ensure_settlement($header['sts'] === null && $header['sts_req'] === null, 'Rejected resets sts and sts_req');
    ensure_settlement($header['reject_reason'] === 'Revisi diperlukan', 'Reject reason persisted');
    $service->requestApproval($id, '990001');
    ensure_settlement((string) $service->header($id)['sts_req'] === '1', 'Resubmit sets sts_req');
    $service->approve($id, '990002');
    $journalCount += 3;

    // Refund submission with validation and verification.
    reject_settlement(function () use ($service, $id) { $service->submitReturn($id, '990001', 1, '2020-01-01', '200000', 'path/a.pdf'); });
    reject_settlement(function () use ($service, $id) { $service->submitReturn($id, '990001', 1, date('Y-m-d'), '100000', 'path/a.pdf'); });
    reject_settlement(function () use ($service, $id) { $service->submitReturn($id, '990002', 1, date('Y-m-d'), '200000', 'path/a.pdf'); });
    $service->submitReturn($id, '990001', 1, date('Y-m-d'), '200000', 'path/a.pdf');
    ensure_settlement($service->returnDetail($id, '990001', false)['return']['status'] === 'waiting_verification', 'Submitted return awaits verification');

    // Reject verification and verify again.
    $service->verifyReturn($id, '990002', false, 'Bukti tidak jelas', []);
    ensure_settlement($service->returnDetail($id, '990001', false)['return']['status'] === 'waiting_return', 'Verification rejection returns to waiting_return');
    $service->submitReturn($id, '990001', 1, date('Y-m-d'), '200000', 'path/b.pdf');
    reject_settlement(function () use ($service, $id) { $service->verifyReturn($id, '990001', true, '', ['amount' => 1, 'date' => 1, 'received' => 1]); });
    reject_settlement(function () use ($service, $id) { $service->verifyReturn($id, '990002', true, '', ['amount' => 1, 'date' => 1]); });
    $service->verifyReturn($id, '990002', true, '', ['amount' => 1, 'date' => 1, 'received' => 1]);
    $verified = $service->returnDetail($id, '990001', false)['return'];
    ensure_settlement($verified['status'] === 'completed', 'Verified return marked completed');
    $journalCount += 2;
    ensure_settlement((int) $scalar("SELECT COUNT(*) n FROM `$finance`.tr_jurnal") === $journalCount, 'Verification posts exactly two rows once');
    ensure_settlement((int) $scalar("SELECT COUNT(*) n FROM `$finance`.tr_jurnal WHERE no_transaksi=?", [$id]) === 5, 'Report has approve and return journals');

    // AJV journal format checks
    ensure_settlement((int) $scalar("SELECT COUNT(*) n FROM `$finance`.tr_jurnal WHERE no_jurnal NOT REGEXP '^[0-9]{5}-AJV-[IVX]+-[0-9]{2}$'") === 0, 'Journal numbers use the AJV format');
    ensure_settlement($scalar("SELECT COUNT(*) n FROM `$finance`.tr_jurnal") === $scalar("SELECT COUNT(DISTINCT no_jurnal) n FROM `$finance`.tr_jurnal"), 'Journal numbers are unique');

    // An admin can upload and verify the return of a report created by someone else.
    $adminReturn = $fixture(2);
    $service->approve($adminReturn, '990002');
    reject_settlement(function () use ($service, $adminReturn) { $service->submitReturn($adminReturn, '990003', 1, date('Y-m-d'), '200000', 'admin.pdf'); });
    $service->submitReturn($adminReturn, '990003', 1, date('Y-m-d'), '200000', 'admin.pdf', true);
    $service->verifyReturn($adminReturn, '990001', true, '', ['amount' => 1, 'date' => 1, 'received' => 1], true);
    ensure_settlement($service->returnDetail($adminReturn, '990001', true, true)['return']['status'] === 'completed', 'Admin completed a return for another user');

    // The approval screen delegates new-flow reports to the settlement library.
    if (!class_exists('Admin_Controller')) { class Admin_Controller {} }
    require_once dirname(__DIR__) . '/application/modules/approval_expense_report_project/controllers/Approval_expense_report_project.php';
    $approval = (new ReflectionClass('Approval_expense_report_project'))->newInstanceWithoutConstructor();
    $approval->db = $connection;
    $approval->expense_project_settlement = $service;
    $approval->auth = new class { function user_id() { return '990002'; } };
    $approval->input = new class { function post($key = null) { return $key === null ? $GLOBALS['approval_post'] : ($GLOBALS['approval_post'][$key] ?? null); } };
    $callApproval = function ($method, array $post) use ($approval) {
        $GLOBALS['approval_post'] = $post;
        ob_start();
        $approval->$method();
        return json_decode(ob_get_clean(), true);
    };
    $viaScreen = $fixture(2, 800000);
    $kasbonOfScreen = $service->header($viaScreen)['id_header'];
    $response = $callApproval('approve_expense_report', ['id_header' => $kasbonOfScreen]);
    ensure_settlement($response['status'] === 1, 'Approval screen approves a new-flow report');
    ensure_settlement((string) $service->header($viaScreen)['sts'] === '1', 'Approval screen sets the approved status');
    ensure_settlement((int) $scalar("SELECT COUNT(*) n FROM `$finance`.tr_jurnal WHERE no_transaksi=?", [$viaScreen]) >= 2, 'Approval screen posts the journal');
    ensure_settlement((int) $scalar('SELECT COUNT(*) n FROM kons_tr_expense_project_return WHERE expense_id=?', [$viaScreen]) === 1, 'Approval screen creates the return record for surplus kasbon');
    $viaScreenOver = $fixture(3, 1200000);
    $response = $callApproval('approve_expense_report', ['id_header' => $service->header($viaScreenOver)['id_header']]);
    ensure_settlement($response['status'] === 1 && (int) $scalar("SELECT COUNT(*) n FROM `$finance`.tr_expense WHERE no_expense_consultant=?", [$viaScreenOver]) === 1, 'Approval screen routes extra expense to tr_expense');
    $viaScreenReject = $fixture(2, 800000);
    $kasbonReject = $service->header($viaScreenReject)['id_header'];
    $response = $callApproval('reject_expense_report', ['id_header' => $kasbonReject, 'reject_reason' => '']);
    ensure_settlement($response['status'] === 0, 'Approval screen refuses a rejection without a reason');
    $response = $callApproval('reject_expense_report', ['id_header' => $kasbonReject, 'reject_reason' => 'Nota buram']);
    $rejected = $service->header($viaScreenReject);
    ensure_settlement($response['status'] === 1 && $rejected['sts'] === null && $rejected['sts_req'] === null && $rejected['reject_reason'] === 'Nota buram', 'Approval screen rejects with a reason and reopens the report');
    ensure_settlement((int) $scalar("SELECT COUNT(*) n FROM `$finance`.tr_jurnal WHERE no_transaksi=?", [$viaScreenReject]) === 0, 'Rejection posts no journal');

    // Request Payment integration & monitoring lifecycle
    $id = $fixture(3, 1200000);
    $monitorRow = function () use ($service, &$id) {
        return array_values(array_filter($service->monitoring('990001'), function ($row) use ($id) { return $row['id'] === $id; }))[0];
    };
    $connection->update('kons_tr_expense_report_project_header', ['sts_req' => null], ['id' => $id]);
    ensure_settlement($monitorRow()['monitoring_status'] === 'Menunggu Diajukan', 'Draft is visible before Finance integration');
    ensure_settlement(Expense_project_flow::reimbursementPresentation($monitorRow())['label'] === 'Draft Expense', 'Draft expense presentation label');
    $service->requestApproval($id, '990001');
    ensure_settlement($monitorRow()['monitoring_status'] === 'Menunggu Diajukan', 'Requested expense awaits approval');
    ensure_settlement(Expense_project_flow::reimbursementPresentation($monitorRow())['label'] === 'Menunggu Approval Expense', 'Requested expense presentation label');
    $service->reject($id, '990002', 'Revisi');
    ensure_settlement($monitorRow()['monitoring_status'] === 'Menunggu Diajukan', 'Rejected expense awaits resubmission');
    ensure_settlement(Expense_project_flow::reimbursementPresentation($monitorRow())['label'] === 'Expense Ditolak', 'Rejected expense presentation label');
    $service->requestApproval($id, '990001');
    ensure_settlement($monitorRow()['monitoring_status'] === 'Menunggu Diajukan', 'Resubmitted expense awaits approval');
    $service->approve($id, '990002');
    $monitor = $monitorRow();
    ensure_settlement($monitor['monitoring_status'] === 'Menunggu Diajukan', 'Approved expense awaits Finance submission');
    ensure_settlement(Expense_project_flow::reimbursementPresentation($monitor)['label'] === 'Menunggu Diajukan Finance', 'Approved expense presentation label');
    ensure_settlement($monitor['nm_company'] === 'Vuca', 'Company normalized from quotation company');

    // 1. Finance submits batch PGJ-TEST-01
    $connection->insert($finance . '.tr_rp_pengajuan_h', [
        'id' => 1, 'no_pengajuan' => 'PGJ-TEST-01', 'company_nama' => 'Vuca',
        'status' => 'pending', 'deleted' => 0
    ]);
    $connection->insert($finance . '.tr_rp_pengajuan_d', [
        'id' => 1, 'id_pengajuan' => 1, 'no_dokumen' => $id, 'decision' => 'approved'
    ]);
    $monitor = $monitorRow();
    ensure_settlement($monitor['monitoring_status'] === 'Menunggu Approval', 'Pending batch moves to Menunggu Approval');
    ensure_settlement($monitor['no_request'] === 'PGJ-TEST-01', 'No. Pengajuan shown during pending batch');
    ensure_settlement($monitor['keterangan'] === null, 'Keterangan empty during pending batch');

    // 2. Approver rejects batch PGJ-TEST-01
    $connection->update($finance . '.tr_rp_pengajuan_h', ['status' => 'done'], ['id' => 1]);
    $connection->update($finance . '.tr_rp_pengajuan_d', ['decision' => 'rejected'], ['id' => 1]);
    $connection->insert($finance . '.tr_rp_reject_log', [
        'id' => 1, 'no_dokumen' => $id, 'id_pengajuan' => 1, 'no_pengajuan' => 'PGJ-TEST-01',
        'approver' => 'finance_mgr', 'alasan' => 'Kuitansi blur'
    ]);
    $monitor = $monitorRow();
    ensure_settlement($monitor['monitoring_status'] === 'Menunggu Diajukan', 'Rejected RP batch returns to Menunggu Diajukan');
    ensure_settlement($monitor['rp_rejected'] === true, 'rp_rejected flag set');
    ensure_settlement($monitor['no_request'] === null, 'No. Pengajuan reset to null on rejection');
    ensure_settlement($monitor['keterangan'] === 'Kuitansi blur (PGJ-TEST-01)', 'Reject reason with batch number');
    ensure_settlement((string) $service->header($id)['sts'] === '1', 'Expense report remains approved in consultant');

    // 3. Finance resubmits in batch PGJ-TEST-02
    $connection->insert($finance . '.tr_rp_pengajuan_h', [
        'id' => 2, 'no_pengajuan' => 'PGJ-TEST-02', 'company_nama' => 'Vuca',
        'status' => 'pending', 'deleted' => 0
    ]);
    $connection->insert($finance . '.tr_rp_pengajuan_d', [
        'id' => 2, 'id_pengajuan' => 2, 'no_dokumen' => $id, 'decision' => 'approved'
    ]);
    $monitor = $monitorRow();
    ensure_settlement($monitor['monitoring_status'] === 'Menunggu Approval', 'Resubmitted batch moves to Menunggu Approval');
    ensure_settlement($monitor['no_request'] === 'PGJ-TEST-02', 'New No. Pengajuan shown');
    ensure_settlement($monitor['rp_rejected'] === false, 'rp_rejected flag cleared on new batch');
    ensure_settlement($monitor['keterangan'] === null, 'Keterangan reset on new batch');

    // 4. Approver approves batch PGJ-TEST-02
    $connection->update($finance . '.tr_rp_pengajuan_h', ['status' => 'done'], ['id' => 2]);
    $connection->update($finance . '.tr_rp_pengajuan_d', ['decision' => 'approved'], ['id' => 2]);
    $connection->insert($finance . '.tr_rp_record', [
        'id' => 1, 'id_pengajuan' => 2, 'no_pengajuan' => 'PGJ-TEST-02', 'no_dokumen' => $id, 'company_nama' => 'Vuca'
    ]);
    $monitor = $monitorRow();
    ensure_settlement($monitor['monitoring_status'] === 'Disetujui', 'Approved RP batch moves to Disetujui');
    ensure_settlement($monitor['no_request'] === 'PGJ-TEST-02', 'No. Pengajuan preserved');

    $legacy = $fixture(4, 800000, 1);
    reject_settlement(function () use ($service, $legacy) { $service->approve($legacy, '990002'); });
    ensure_settlement((int) $service->header($legacy)['flow_version'] === 1, 'Legacy version preserved');

    $id = $fixture(5, 1200000);
    $connection->query("CREATE TRIGGER `$finance`.fail_expense_test BEFORE INSERT ON `$finance`.tr_expense FOR EACH ROW SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Test rollback'");
    reject_settlement(function () use ($service, $id) { $service->approve($id, '990002'); });
    ensure_settlement((string) $service->header($id)['sts'] !== '1', 'Approval rolled back');
    ensure_settlement((int) $scalar("SELECT COUNT(*) n FROM `$finance`.tr_jurnal WHERE no_transaksi=?", [$id]) === 0, 'Journal rolled back across schemas');
    $connection->query("DROP TRIGGER `$finance`.fail_expense_test");
    $service->approve($id, '990002');

    foreach (['approve', 'verify'] as $operation) {
        $id = $fixture(6, $operation === 'approve' ? 1200000 : 800000);
        if ($operation === 'verify') {
            $service->approve($id, '990002');
            $service->submitReturn($id, '990001', 1, date('Y-m-d'), '200000', 'concurrent.pdf');
        }
        $processes = [];
        for ($i = 0; $i < 2; $i++) {
            $command = implode(' ', array_map('escapeshellarg', [PHP_BINARY, __FILE__, '--worker', $source, $finance, $gl, $operation, $id]));
            $pipes = [];
            $processes[] = [proc_open($command, [0 => ['pipe','r'], 1 => ['pipe','w'], 2 => ['pipe','w']], $pipes), $pipes];
        }
        foreach ($processes as $process) {
            list($handle, $pipes) = $process;
            fclose($pipes[0]);
            $output = stream_get_contents($pipes[1]) . stream_get_contents($pipes[2]);
            fclose($pipes[1]); fclose($pipes[2]);
            ensure_settlement(proc_close($handle) === 0, 'Concurrent worker: ' . $output);
        }
        if ($operation === 'approve') {
            ensure_settlement((int) $scalar("SELECT COUNT(*) n FROM `$finance`.tr_expense WHERE no_expense_consultant=?", [$id]) === 1, 'Concurrent approval creates one tr_expense');
        } else {
            ensure_settlement((int) $scalar("SELECT COUNT(*) n FROM `$finance`.tr_jurnal WHERE no_transaksi=? AND jenis_transaksi='Pengembalian Expense Project'", [$id]) === 2, 'Concurrent verification posts one journal');
        }
    }
    echo "Settlement integration passed: six categories, three differences, ownership, rejection/reupload, Finance monitoring, rollback, concurrent approval and verification.\n";
} finally {
    foreach ($schemas as $schema) {
        if (!preg_match('/^expense_flow_test_[a-f0-9]{10}_(source|finance|gl)$/D', $schema)) { throw new RuntimeException('Unsafe cleanup target'); }
        $admin->query("DROP DATABASE IF EXISTS `$schema`");
    }
}
