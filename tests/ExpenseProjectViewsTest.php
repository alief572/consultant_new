<?php
require_once dirname(__DIR__) . '/application/libraries/Expense_project_flow.php';
if (PHP_SAPI !== 'cli') { exit(1); }
define('FCPATH', dirname(__DIR__) . '/');
function html_escape($value) { return htmlspecialchars((string) $value, ENT_QUOTES, 'UTF-8'); }
function site_url($path) { return '/test/' . $path; }
function base_url($path) { return '/test/' . $path; }
function has_permission($permission) { return true; }
function view_expect($condition, $message) { if (!$condition) { throw new RuntimeException($message); } }
class ExpenseViewFixture
{
    public $auth;
    public function __construct() { $this->auth = new class { public function user_id() { return '1'; } }; }
    public function render($name, array $data)
    {
        extract($data);
        ob_start();
        include dirname(__DIR__) . '/application/modules/expense_report_project/views/' . $name . '.php';
        return ob_get_clean();
    }
}
set_error_handler(function ($severity, $message, $file, $line) { throw new RuntimeException($message . ' at ' . $file . ':' . $line); });
$renderer = new ExpenseViewFixture();
$fixture = ['header' => ['id' => 'TEST<&', 'id_header' => 'KASBON', 'created_by' => '1', 'approved_date' => date('Y-m-d')],
    'return' => ['status' => 'waiting_return', 'amount' => '200000.00', 'rejection_reason' => '<script>test</script>', 'bank_id' => null],
    'banks' => [['id' => 1, 'nama_bank' => 'BCA', 'rekening' => 'TEST', 'nama' => 'Company']],
    'history' => [], 'journals' => [], 'finance' => false, 'settlement_token' => 'TEST-TOKEN'];
$pages = [];
$pages[] = $renderer->render('return_detail', $fixture);
view_expect(strpos($pages[0], 'id="return-submit-form"') !== false, 'Owner must be able to upload');
view_expect(strpos($pages[0], '<script>test</script>') === false, 'Escape finance rejection notes');
view_expect(strpos($pages[0], 'TEST&lt;&amp;') !== false, 'Escape document ID');
view_expect(strpos($pages[0], 'Informasi Laporan') !== false, 'Upload page starts with the report information card');
view_expect(strpos($pages[0], 'Preview Jurnal Pengembalian Kasbon') !== false, 'Upload page previews the return journal');
view_expect(strpos($pages[0], 'Kirim Bukti Transfer') !== false, 'Upload page submit button follows the mockup');
view_expect(strpos($pages[0], 'class="mk erp-return-detail"') !== false, 'Return detail uses the mockup skin');
$fixture['finance'] = true;
$fixture['return']['status'] = 'waiting_verification';
$fixture['return']['bank_id'] = 1;
$fixture['return']['transfer_date'] = date('Y-m-d');
$fixture['return']['submitted_at'] = date('Y-m-d H:i:s');
$fixture['header']['created_by'] = '2';
$pages[] = $renderer->render('return_detail', $fixture);
view_expect(strpos($pages[1], 'id="return-verify-form"') !== false, 'Finance verification form');
view_expect(strpos($pages[1], 'value="approve" disabled') !== false, 'Checklist required before verify');
view_expect(strpos($pages[1], 'Pencocokan Mutasi Rekening') !== false, 'Verification shows the mutation matching panel');
view_expect(strpos($pages[1], 'id="return-mutation-table"') !== false, 'Mutation panel lists the transfer');
view_expect(strpos($pages[0], 'Pencocokan Mutasi Rekening') === false, 'Owner does not see the mutation panel');
$fixture['header']['created_by'] = '1';
$pages[] = $renderer->render('return_detail', $fixture);
view_expect(strpos($pages[2], 'id="return-verify-form"') === false, 'Self-verification must be hidden');
$fixture['finance'] = false;
$fixture['return']['status'] = 'completed';
$pages[] = $renderer->render('return_detail', $fixture);
view_expect(strpos($pages[3], 'id="return-submit-form"') === false, 'Completed return is read-only');
$pages[] = $renderer->render('index', ['returns' => [], 'reimbursements' => []]);
view_expect(strpos(end($pages), 'id="table_expense"') !== false, 'Index lists expense documents');
view_expect(strpos(end($pages), '<th>No Expense</th>') !== false, 'Expense list has the expense number column');
view_expect(strpos(end($pages), 'expense_report_project/pick_spk') !== false, 'Index links to the SPK picker');
view_expect(strpos(end($pages), 'Tambah Expense Report') !== false, 'Index offers Tambah Expense Report');
view_expect(strpos(end($pages), 'id="expense-returns"') !== false, 'Return tab');
view_expect(strpos(end($pages), 'id="expense-reimbursements"') !== false, 'Reimbursement tab');
view_expect(strpos(end($pages), 'role="tab" aria-controls="expense-reports" aria-selected="true"') !== false, 'Tab selection is announced');
view_expect(strpos(end($pages), 'id="expense-table-retry"') !== false, 'Failed SPK request offers retry');
view_expect(strpos(end($pages), 'expense_report_project.css?v=' . filemtime(FCPATH . 'assets/css/expense_report_project.css')) !== false, 'Index loads the current stylesheet version');
view_expect(strpos(end($pages), 'expense_report_project_ui.js?v=' . filemtime(FCPATH . 'assets/js/expense_report_project_ui.js')) !== false, 'Index loads the current UI script version');
$pages[] = $renderer->render('pick_spk', []);
view_expect(strpos(end($pages), 'id="table_spk"') !== false, 'SPK picker table');
view_expect(strpos(end($pages), 'Nomor SPK &amp; Paket') !== false, 'SPK picker shows package');
view_expect(strpos(end($pages), 'kasbon baru') !== false, 'SPK picker shows new kasbon count');
$pages[] = $renderer->render('return_list', ['finance' => true, 'returns' => []]);
view_expect(strpos(end($pages), 'assets/css/expense_report_project.css') !== false, 'Standalone Finance queue loads module styling');
view_expect(strpos(end($pages), 'label for="return-search"') !== false, 'Search has an accessible label');
view_expect(strpos(end($pages), 'Belum ada pengembalian untuk diperiksa') !== false, 'Finance empty state explains queue');
view_expect(strpos(end($pages), 'id="return-status-filter"') !== false, 'Finance keeps its status dropdown');
view_expect(strpos(end($pages), 'data-erp-status-tab=') === false, 'Finance does not receive owner subtabs');
$pages[] = $renderer->render('return_list', ['finance' => false, 'returns' => [
    ['id' => 'EXP<&', 'id_header' => 'KASBON', 'amount' => '200000', 'return_status' => 'waiting_return',
        'nm_lengkap' => 'Owner', 'deskripsi' => '<script>test</script>', 'submitted_at' => null, 'rejection_reason' => null]
]]);
view_expect(strpos(end($pages), 'Upload Bukti</a>') !== false, 'Pending return has specific action');
view_expect(strpos(end($pages), 'data-erp-empty hidden') !== false, 'Filtered-empty message starts hidden');
view_expect(strpos(end($pages), '<script>test</script>') === false, 'Escape descriptions');
view_expect(substr_count(end($pages), 'data-erp-status-tab=') === 3, 'Owner return list has three status subtabs');
view_expect(strpos(end($pages), 'Perlu Upload') !== false, 'Owner default is upload subtab');
view_expect(strpos(end($pages), 'id="return-status-filter"') === false, 'Owner dropdown is replaced by subtabs');
view_expect(strpos(end($pages), 'Kelebihan Kasbon (Rp)') !== false, 'Owner return list shows the surplus column');
view_expect(strpos(end($pages), '<th scope="col">Nomor SPK</th>') !== false, 'Owner return list shows the SPK number');
view_expect(strpos(end($pages), 'Tanggal Approval') !== false, 'Owner return list shows the approval date');
view_expect(strpos(end($pages), 'Pemohon</th>') === false, 'Owner return list drops the requester column');
$financeReturns = $renderer->render('return_list', ['finance' => true, 'returns' => [
    ['id' => 'EXP-F', 'id_header' => 'KASBON', 'amount' => '200000', 'return_status' => 'completed',
        'nm_lengkap' => 'Owner', 'deskripsi' => 'Done', 'submitted_at' => null, 'rejection_reason' => null]
]]);
view_expect(strpos($financeReturns, 'Terverifikasi') !== false, 'Finance list calls completed returns verified');
view_expect(strpos($financeReturns, 'Pemohon</th>') !== false, 'Finance list keeps the requester column');
$pages[] = $renderer->render('reimbursements', ['reimbursements' => [
    ['id' => 'EXP-REIMBURSE', 'id_header' => 'KASBON', 'selisih' => '-200000', 'monitoring_status' => 'Disetujui',
        'deskripsi' => 'Test expense', 'nm_company' => '<script>test</script>', 'approved_date' => '2026-10-23', 'no_request' => null, 'keterangan' => null]
]]);
view_expect(strpos(end($pages), '<script>test</script>') === false, 'Escape Finance company');
view_expect(strpos(end($pages), 'Disetujui belum berarti sudah dibayar.') !== false, 'Approval is distinct from payment');
view_expect(strpos(end($pages), 'Tab ini memantau pengajuan reimburse oleh Finance di Request Payment') !== false, 'Hint mentions Request Payment monitoring');
view_expect(substr_count(end($pages), 'data-erp-status-tab=') === 3, 'Reimbursement has three status subtabs');
view_expect(strpos(end($pages), 'data-erp-active-status="unsubmitted"') !== false, 'Reimbursement defaults to unsubmitted');
view_expect(strpos(end($pages), 'id="reimbursement-status-filter"') === false, 'Reimbursement dropdown is replaced');
$baseReimbursement = ['id' => 'ER-001', 'id_header' => 'KS/2026/001', 'selisih' => '-200000',
    'deskripsi' => 'Test', 'approved_date' => '2026-10-29'];
$pages[] = $renderer->render('reimbursements', ['reimbursements' => [
    array_merge($baseReimbursement, ['monitoring_status' => 'Disetujui', 'sts' => 1]),
    array_merge($baseReimbursement, ['monitoring_status' => 'Menunggu Diajukan', 'reject_reason' => '<script>test</script>']),
    array_merge($baseReimbursement, ['monitoring_status' => 'Menunggu Diajukan', 'approved_date' => null]),
    array_merge($baseReimbursement, ['monitoring_status' => 'Menunggu Approval', 'sts' => 1]),
    array_merge($baseReimbursement, ['monitoring_status' => 'Menunggu Diajukan', 'sts' => 1, 'rp_rejected' => true, 'keterangan' => 'Kuitansi buram (PGJ-0001)']),
]]);
$reimbursementPage = end($pages);
view_expect(strpos($reimbursementPage, 'data-erp-row="unsubmitted"') !== false, 'Expense draft uses unsubmitted group');
view_expect(strpos($reimbursementPage, 'data-payment-status="Menunggu Approval"') !== false, 'Expense awaiting approval');
view_expect(strpos($reimbursementPage, 'Menunggu Diajukan <span class="cnt">3</span>') !== false, 'Unsubmitted count includes draft, rejected expense, and RP rejected');
view_expect(strpos($reimbursementPage, 'data-erp-row="approved"') !== false, 'Approved expense row');
view_expect(strpos($reimbursementPage, 'Expense Ditolak') !== false, 'Expense rejection remains visible');
view_expect(strpos($reimbursementPage, 'Ditolak di Request Payment') !== false, 'RP rejection shows badge');
view_expect(strpos($reimbursementPage, 'Menunggu Diajukan Finance') !== false, 'Finance unsubmitted shows label');
view_expect(strpos($reimbursementPage, '<script>test</script>') === false, 'Escape expense rejection reason');
view_expect(strpos($reimbursementPage, 'view_expense_subcont/KS%7C2026%7C001') !== false, 'Detail uses encoded kasbon ID');
view_expect(strpos($reimbursementPage, 'fa fa-eye') !== false, 'Detail retains eye icon');
$pages[] = $renderer->render('reimbursements', ['reimbursements' => []]);
view_expect(substr_count(end($pages), 'data-erp-status-tab=') === 3, 'Empty reimbursement list keeps every subtab');
view_expect(strpos(end($pages), 'colspan="11"') !== false, 'Reimbursement empty state spans the action column');
view_expect(strpos($reimbursementPage, 'Nomor SPK') !== false, 'Reimbursement list shows the SPK number');
view_expect(strpos($reimbursementPage, 'Tanggal Approval') !== false, 'Reimbursement list labels the approval date');
$budgeting = (object) ['id_spk_penawaran' => 'SPK-1', 'nm_project_leader' => 'pl', 'nm_customer' => 'Cust', 'nm_sales' => 'sales',
    'nm_paket' => 'Paket', 'waktu_from' => '2026-10-01', 'waktu_to' => '2026-10-02', 'alamat' => 'Alamat'];
$formItems = [['no' => 1, 'id_detail_kasbon' => 10, 'nm_item' => 'Uang saku konsultan', 'qty_kasbon' => 2, 'nominal_kasbon' => 100000, 'total_kasbon' => 200000]];
$pages[] = $renderer->render('add_expense_subcont', ['datalist_item' => $formItems, 'id_spk_budgeting' => 'SPK/1', 'id_header' => 'KS-2026-1',
    'id_spk_penawaran' => 'SPK-1', 'id_penawaran' => 'P-1', 'tipe' => '2', 'data_bank' => [], 'list_bank' => [], 'list_jurnal_pph21' => [],
    'list_budgeting' => $budgeting, 'preview_expense_id' => 'ER-2026-00099']);
view_expect(strpos(end($pages), 'name="keterangan_laporan"') !== false, 'Add form asks for the report description');
view_expect(strpos(end($pages), 'ER-2026-00099') !== false, 'Add form previews the expense number');
view_expect(strpos(end($pages), 'KS-2026-1') !== false, 'Add form shows the kasbon number');
view_expect(strpos(end($pages), 'Tiket pesawat') !== false && strpos(end($pages), 'Sewa kendaraan') !== false, 'Akomodasi form lists zero-budget placeholder rows');
view_expect(substr_count(end($pages), 'erp-row-placeholder') === 2, 'Two placeholder rows');
view_expect(strpos(end($pages), 'Preview: jurnal terbentuk setelah approval') !== false, 'Journal preview badge');
view_expect(strpos(end($pages), 'validateExpenseForm') !== false, 'Add form validates before saving');
$pages[] = $renderer->render('add_expense_subcont', ['datalist_item' => $formItems, 'id_spk_budgeting' => 'SPK/1', 'id_header' => 'KS-2026-1',
    'id_spk_penawaran' => 'SPK-1', 'id_penawaran' => 'P-1', 'tipe' => '3', 'data_bank' => [], 'list_bank' => [], 'list_jurnal_pph21' => [],
    'list_budgeting' => $budgeting, 'preview_expense_id' => 'ER-2026-00099']);
view_expect(strpos(end($pages), 'erp-row-placeholder') === false, 'Only Akomodasi gets placeholder rows');
$editHeader = (object) ['id' => 'ER-2026-00098', 'id_header' => 'KS-2026-1', 'tipe' => '2', 'created_date' => '2026-10-30 10:00:00', 'reject_reason' => 'Nota <b>buram</b>',
    'rejected_by' => '', 'keterangan_laporan' => 'Laporan <i>lama</i>', 'keterangan_kurang_bayar' => '', 'flow_version' => 2, 'sts' => null, 'sts_req' => null, 'id_bank' => '', 'selisih' => 0];
$pages[] = $renderer->render('edit_expense_subcont', ['header' => $editHeader, 'datalist_item' => $formItems, 'datalist_item_expense' => [],
    'list_bukti_penggunaan_by_detail' => [], 'list_bukti_penggunaan' => [], 'list_bukti_pengembalian' => [], 'id_spk_budgeting' => 'SPK/1',
    'id_header' => 'KS-2026-1', 'id_spk_penawaran' => 'SPK-1', 'id_penawaran' => 'P-1', 'tipe' => '2', 'data_bank' => [], 'list_bank' => [],
    'list_jurnal_pph21' => [], 'list_budgeting' => $budgeting]);
view_expect(strpos(end($pages), 'ER-2026-00098') !== false, 'Edit form shows the stored expense number');
view_expect(strpos(end($pages), 'Laporan &lt;i&gt;lama&lt;/i&gt;') !== false, 'Edit form prefills and escapes the report description');
view_expect(strpos(end($pages), 'Perbaiki laporan lalu simpan ulang untuk masuk approval dari awal') !== false, 'Edit form explains how to resubmit after rejection');
view_expect(strpos(end($pages), 'Nota <b>buram</b>') === false, 'Edit form escapes the rejection note');
view_expect(substr_count(end($pages), 'erp-row-placeholder') === 2, 'Edit form keeps the Akomodasi placeholder rows');
$scripts = [];
foreach ($pages as $page) {
    preg_match_all('/<script\b[^>]*>(.*?)<\/script>/s', $page, $matches);
    foreach ($matches[1] as $script) { if (trim($script) !== '') { $scripts[] = $script; } }
}
echo in_array('--scripts', $argv, true) ? json_encode($scripts) : "Expense project view rendering checks passed\n";
