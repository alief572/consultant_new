<?php
require_once dirname(__DIR__) . '/application/libraries/Expense_project_flow.php';
if (PHP_SAPI !== 'cli') { exit(1); }
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
$fixture['finance'] = true;
$fixture['return']['status'] = 'waiting_verification';
$fixture['return']['bank_id'] = 1;
$fixture['return']['transfer_date'] = date('Y-m-d');
$fixture['return']['submitted_at'] = date('Y-m-d H:i:s');
$fixture['header']['created_by'] = '2';
$pages[] = $renderer->render('return_detail', $fixture);
view_expect(strpos($pages[1], 'id="return-verify-form"') !== false, 'Finance verification form');
view_expect(strpos($pages[1], 'value="approve" disabled') !== false, 'Checklist required before verify');
$fixture['header']['created_by'] = '1';
$pages[] = $renderer->render('return_detail', $fixture);
view_expect(strpos($pages[2], 'id="return-verify-form"') === false, 'Self-verification must be hidden');
$fixture['finance'] = false;
$fixture['return']['status'] = 'completed';
$pages[] = $renderer->render('return_detail', $fixture);
view_expect(strpos($pages[3], 'id="return-submit-form"') === false, 'Completed return is read-only');
$pages[] = $renderer->render('index', ['returns' => [], 'reimbursements' => []]);
view_expect(strpos(end($pages), 'id="expense-returns"') !== false, 'Return tab');
view_expect(strpos(end($pages), 'id="expense-reimbursements"') !== false, 'Reimbursement tab');
view_expect(strpos(end($pages), 'role="tab" aria-controls="expense-reports" aria-selected="true"') !== false, 'Tab selection is announced');
view_expect(strpos(end($pages), 'id="expense-table-retry"') !== false, 'Failed SPK request offers retry');
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
view_expect(strpos(end($pages), 'Kirim bukti</a>') !== false, 'Pending return has specific action');
view_expect(strpos(end($pages), 'data-erp-empty hidden') !== false, 'Filtered-empty message starts hidden');
view_expect(strpos(end($pages), '<script>test</script>') === false, 'Escape descriptions');
view_expect(substr_count(end($pages), 'data-erp-status-tab=') === 3, 'Owner return list has three status subtabs');
view_expect(strpos(end($pages), 'Perlu Upload') !== false, 'Owner default is upload subtab');
view_expect(strpos(end($pages), 'id="return-status-filter"') === false, 'Owner dropdown is replaced by subtabs');
$pages[] = $renderer->render('reimbursements', ['reimbursements' => [
    ['id' => 'EXP-REIMBURSE', 'id_header' => 'KASBON', 'selisih' => '-200000', 'monitoring_status' => 'Disetujui',
        'deskripsi' => 'Test expense', 'nm_company' => '<script>test</script>', 'approved_date' => '2026-10-23', 'no_request' => null, 'keterangan' => null]
]]);
view_expect(strpos(end($pages), '<script>test</script>') === false, 'Escape Finance company');
view_expect(strpos(end($pages), 'Disetujui belum berarti sudah dibayar.') !== false, 'Approval is distinct from payment');
view_expect(substr_count(end($pages), 'data-erp-status-tab=') === 3, 'Reimbursement has three status subtabs');
view_expect(strpos(end($pages), 'data-erp-active-status="unsubmitted"') !== false, 'Reimbursement defaults to unsubmitted');
view_expect(strpos(end($pages), 'id="reimbursement-status-filter"') === false, 'Reimbursement dropdown is replaced');
$baseReimbursement = ['id' => 'ER-001', 'id_header' => 'KS/2026/001', 'selisih' => '-200000',
    'deskripsi' => 'Test', 'approved_date' => '2026-10-29'];
$pages[] = $renderer->render('reimbursements', ['reimbursements' => [
    array_merge($baseReimbursement, ['monitoring_status' => 'Terkirim ke Finance']),
    array_merge($baseReimbursement, ['monitoring_status' => 'Menunggu Diajukan', 'sts_reject' => 1,
        'finance_rejection_reason' => '<script>test</script>']),
    array_merge($baseReimbursement, ['monitoring_status' => 'Integrasi Finance perlu diperiksa']),
    array_merge($baseReimbursement, ['monitoring_status' => 'Menunggu Approval']),
]]);
$reimbursementPage = end($pages);
view_expect(strpos($reimbursementPage, 'Menunggu Diajukan Finance') !== false, 'Finance queue uses reference label');
view_expect(strpos($reimbursementPage, 'Menunggu Approval Pembayaran') !== false, 'Payment approval uses reference label');
view_expect(strpos($reimbursementPage, 'Menunggu Diajukan <span class="erp-counter-pill">3</span>') !== false, 'Unsubmitted count includes integration warnings');
view_expect(strpos($reimbursementPage, 'Integrasi Finance perlu diperiksa') !== false, 'Integration warning remains visible');
view_expect(strpos($reimbursementPage, 'Ditolak di Request Payment') !== false, 'Payment rejection remains visible');
view_expect(strpos($reimbursementPage, '<script>test</script>') === false, 'Escape payment rejection reason');
view_expect(strpos($reimbursementPage, 'view_expense_subcont/KS%7C2026%7C001') !== false, 'Detail uses encoded kasbon ID');
view_expect(strpos($reimbursementPage, 'fa fa-eye') !== false, 'Detail retains eye icon');
$pages[] = $renderer->render('reimbursements', ['reimbursements' => []]);
view_expect(substr_count(end($pages), 'data-erp-status-tab=') === 3, 'Empty reimbursement list keeps every subtab');
view_expect(strpos(end($pages), 'colspan="9"') !== false, 'Reimbursement empty state spans the action column');
$scripts = [];
foreach ($pages as $page) {
    preg_match_all('/<script\b[^>]*>(.*?)<\/script>/s', $page, $matches);
    foreach ($matches[1] as $script) { if (trim($script) !== '') { $scripts[] = $script; } }
}
echo in_array('--scripts', $argv, true) ? json_encode($scripts) : "Expense project view rendering checks passed\n";
