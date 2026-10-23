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
        'kons_tr_penawaran', 'kons_tr_company', 'users', 'menus', 'permissions', 'request_payment'];
    foreach (['subcont', 'akomodasi', 'others', 'lab', 'subcont_tenaga_ahli', 'subcont_perusahaan'] as $suffix) {
        $sourceTables[] = 'kons_tr_kasbon_project_' . $suffix;
    }
    foreach (['aktifitas', 'akomodasi', 'others', 'lab', 'subcont_tenaga_ahli', 'subcont_perusahaan'] as $suffix) { $sourceTables[] = 'kons_tr_spk_budgeting_' . $suffix; }
    foreach (['biaya', 'lab', 'tenaga_ahli', 'subcont_perusahaan'] as $suffix) { $sourceTables[] = 'kons_master_' . $suffix; }
    foreach ($sourceTables as $table) { $admin->query("CREATE TABLE `$source`.`$table` LIKE `db_consultant_new`.`$table`"); }
    foreach (['request_payment', 'tr_jurnal', 'ms_bank', 'list_bank', 'tr_expense', 'tr_expense_detail'] as $table) {
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
            $row = ['id_header' => $kasbon, 'id_' . $key => $id, 'id_spk_budgeting' => $budget,
                'qty_pengajuan' => '1', 'nominal_pengajuan' => '500000', 'total_pengajuan' => '500000'];
            if ($type !== 1) { $row['id_item'] = '1'; }
            $row['custom_' . $suffix] = $item === 2 ? 1 : 0;
            $insert('kons_tr_kasbon_project_' . $suffix, $row);
            if ($item === 1) {
                $budgetSuffix = $type <= 4 ? $key : $suffix;
                $insert('kons_tr_spk_budgeting_' . $budgetSuffix, ['id' => $id + 10000000, 'id_spk_budgeting' => $budget, 'id_' . $key => $id]);
                $id += 10000000;
            }
            $insert('kons_tr_expense_report_project_detail', ['id_header_expense' => $expense, 'id_header_kasbon' => $kasbon,
                'id_detail_kasbon' => $id, 'qty_expense' => '1', 'nominal_expense' => $item === 1 ? (string) min(600000, $actual) : (string) max(0, $actual - 600000)]);
        }
        $insert('kons_tr_expense_report_project_header', ['id' => $expense, 'id_header' => $kasbon,
            'flow_version' => $version, 'total_kasbon' => '1000000', 'total_expense_report' => $actual,
            'selisih' => 1000000 - $actual, 'sts_req' => '1', 'created_by' => '990001', 'created_date' => date('Y-m-d H:i:s')]);
        return $expense;
    };

    foreach (range(1, 6) as $type) {
        foreach ([800000, 1000000, 1200000] as $actual) {
            $id = $fixture($type, $actual);
            $service->approve($id, '990002');
            $service->approve($id, '990002');
            ensure_settlement((string) $service->header($id)['sts'] === '1', 'Approved type ' . $type);
            $totals = $connection->query("SELECT SUM(debit) d,SUM(kredit) c FROM `$finance`.tr_jurnal WHERE no_transaksi=?", [$id])->row_array();
            ensure_settlement($totals['d'] === $totals['c'], 'Balanced journal');
            $piutang = $connection->query("SELECT kredit FROM `$finance`.tr_jurnal WHERE no_transaksi=? AND coa='1103-01-14'", [$id])->row_array();
            ensure_settlement(Expense_project_flow::cents($piutang['kredit']) === 100000000, 'Receivable credit full advance');
            if ($actual < 1000000) {
                $kelebihan = $connection->query("SELECT debit FROM `$finance`.tr_jurnal WHERE no_transaksi=? AND coa='1103-01-15'", [$id])->row_array();
                ensure_settlement(Expense_project_flow::cents($kelebihan['debit']) === (1000000 - $actual) * 100, 'Kelebihan debit');
            }
            ensure_settlement((int) $scalar('SELECT COUNT(*) n FROM kons_tr_expense_project_return WHERE expense_id=?', [$id]) === ($actual < 1000000 ? 1 : 0), 'Return created once');
            ensure_settlement((int) $scalar("SELECT COUNT(*) n FROM `$finance`.tr_expense WHERE no_expense_consultant=?", [$id]) === ($actual > 1000000 ? 1 : 0), 'Finance tr_expense created once');
            ensure_settlement((int) $scalar("SELECT COUNT(*) n FROM `$finance`.tr_expense_detail WHERE no_doc=?", [$id]) === ($actual > 1000000 ? 1 : 0), 'Finance tr_expense_detail created once');
        }
    }
    ensure_settlement((int) $scalar('SELECT COUNT(*) n FROM request_payment') === 0, 'Never insert into local request_payment');
    ensure_settlement(count($service->listing('990003')) === 0, 'Other users cannot list returns');
    ensure_settlement(count($service->monitoring('990003')) === 0, 'Other users cannot monitor reimbursements');

    foreach (range(1, 6) as $type) {
        $zero = $fixture($type, 0);
        $connection->delete('kons_tr_expense_report_project_detail', ['id_header_expense' => $zero]);
        $service->approve($zero, '990002');
        ensure_settlement((int) $scalar("SELECT COUNT(*) n FROM `$finance`.tr_jurnal WHERE no_transaksi=?", [$zero]) === 2, 'Zero realization posts 1103-01-15 and 1103-01-14');
        ensure_settlement($service->returnDetail($zero, '990001', false)['return']['amount'] === '1000000.00', 'Entire unused advance remains receivable');
    }
    $tampered = $fixture(2);
    $connection->update('kons_tr_expense_report_project_header', ['total_expense_report' => '1'], ['id' => $tampered]);
    reject_settlement(function () use ($service, $tampered) { $service->approve($tampered, '990002'); });
    ensure_settlement((int) $scalar("SELECT COUNT(*) n FROM `$finance`.tr_jurnal WHERE no_transaksi=?", [$tampered]) === 0, 'Tampered header must not post');
    $editable = $service->header($fixture(3));
    $connection->update('kons_tr_expense_report_project_header', ['sts_req' => null], ['id' => $editable['id']]);
    $editable = $service->header($editable['id']);
    $service->assertEditable($editable, '990001');
    reject_settlement(function () use ($service, $editable) { $service->assertEditable($editable, '990003'); });
    $service->requestApproval($editable['id'], '990001');
    reject_settlement(function () use ($service, $editable) { $service->assertEditable($service->header($editable['id']), '990001'); });
    reject_settlement(function () use ($service, $editable) { $service->reject($editable['id'], '990002', ''); });
    $service->reject($editable['id'], '990002', 'Revisi nota');
    $service->assertEditable($service->header($editable['id']), '990001');
    $service->requestApproval($editable['id'], '990001');
    $service->approve($editable['id'], '990002');
    reject_settlement(function () use ($service, $editable) { $service->assertEditable($service->header($editable['id']), '990001'); });

    $id = $fixture(2);
    $service->approve($id, '990002');
    reject_settlement(function () use ($service, $id) { $service->returnDetail($id, '990003', false); });
    reject_settlement(function () use ($service, $id) { $service->submitReturn($id, '990001', 1, date('Y-m-d'), '100000', 'test.pdf'); });
    reject_settlement(function () use ($service, $id) { $service->submitReturn($id, '990003', 1, date('Y-m-d'), '200000', 'test.pdf'); });
    reject_settlement(function () use ($service, $id) { $service->submitReturn($id, '990001', 999, date('Y-m-d'), '200000', 'test.pdf'); });
    reject_settlement(function () use ($service, $id) { $service->submitReturn($id, '990001', 1, '2026-02-30', '200000', 'test.pdf'); });
    $journalCount = (int) $scalar("SELECT COUNT(*) n FROM `$finance`.tr_jurnal WHERE no_transaksi=?", [$id]);
    $service->submitReturn($id, '990001', 1, date('Y-m-d'), '200000', 'first.pdf');
    ensure_settlement((int) $scalar("SELECT COUNT(*) n FROM `$finance`.tr_jurnal WHERE no_transaksi=?", [$id]) === $journalCount, 'Upload must not post journal');
    reject_settlement(function () use ($service, $id) { $service->verifyReturn($id, '990001', true, '', ['amount' => 1, 'date' => 1, 'received' => 1]); });
    reject_settlement(function () use ($service, $id) { $service->verifyReturn($id, '990002', true, '', []); });
    reject_settlement(function () use ($service, $id) { $service->verifyReturn($id, '990002', false, '', []); });
    $service->verifyReturn($id, '990002', false, 'Nominal pada bukti tidak sesuai', []);
    $detail = $service->returnDetail($id, '990001', false);
    ensure_settlement($detail['return']['status'] === 'waiting_return' && count($detail['history']) === 2 && !$detail['journals'], 'Rejected proof remains in history only');
    $service->submitReturn($id, '990001', 1, date('Y-m-d'), '200000', 'second.pdf');
    $service->verifyReturn($id, '990002', true, '', ['amount' => 1, 'date' => 1, 'received' => 1]);
    $service->verifyReturn($id, '990002', true, '', ['amount' => 1, 'date' => 1, 'received' => 1]);
    ensure_settlement((int) $scalar("SELECT COUNT(*) n FROM `$finance`.tr_jurnal WHERE no_transaksi=?", [$id]) === $journalCount + 2, 'Verification posts exactly two rows once');

    $id = $fixture(3, 1200000);
    $service->approve($id, '990002');
    $monitor = array_values(array_filter($service->monitoring('990001'), function ($row) use ($id) { return $row['id'] === $id; }))[0];
    ensure_settlement($monitor['monitoring_status'] === 'Terkirim ke Finance', 'Initial status in tr_expense');
    $expRow = $connection->query("SELECT id FROM `$finance`.tr_expense WHERE no_expense_consultant=?", [$id])->row_array();
    $connection->insert($finance . '.request_payment', [
        'no_doc' => $id, 'ids' => (string) $expRow['id'], 'tipe' => 'expense', 'nama' => 'Tester',
        'tgl_doc' => date('Y-m-d'), 'keperluan' => 'Test Lebih Expense', 'jumlah' => 200000, 'currency' => 'IDR',
        'status' => '0', 'created_by' => 'tester', 'created_on' => date('Y-m-d H:i:s')
    ]);
    foreach ([['status' => 0, 'no_request' => null], ['status' => 0, 'no_request' => 'PGJ-TEST'], ['status' => 1, 'no_request' => 'PGJ-TEST'], ['status' => 0, 'no_request' => null, 'keterangan' => 'Ditolak - ajukan ulang']] as $payment) {
        $connection->update($finance . '.request_payment', $payment, ['no_doc' => $id]);
        $monitor = array_values(array_filter($service->monitoring('990001'), function ($row) use ($id) { return $row['id'] === $id; }))[0];
        ensure_settlement($monitor['monitoring_status'] === Expense_project_flow::reimbursementStatus(array_merge($monitor, ['payment_status' => $payment['status'], 'no_request' => $payment['no_request']])), 'Live finance status');
        ensure_settlement((string) $service->header($id)['sts'] === '1', 'Payment rejection must not reopen expense');
    }
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
