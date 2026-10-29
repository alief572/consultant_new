<?php
require_once dirname(__DIR__) . '/application/libraries/Expense_project_flow.php';

function expect_flow($actual, $expected, $message)
{
    if ($actual !== $expected) {
        throw new RuntimeException($message . ': ' . json_encode($actual));
    }
}

foreach (range(1, 6) as $type) {
    foreach ([[1000000, 800000, 200000], [1000000, 1000000, 0], [1000000, 1200000, -200000]] as $case) {
        $result = Expense_project_flow::settlement($case[0] * 100, $case[1] * 100);
        expect_flow($result['difference'], $case[2] * 100, 'Difference type ' . $type);
        expect_flow($result['receivable_credit'], $case[0] * 100, 'Advance credit full');
        expect_flow($result['refund_debit'], max(0, $case[2]) * 100, 'Refund debit');
        expect_flow($result['payable_credit'], max(0, -$case[2]) * 100, 'Reimbursement payable');
    }
}
expect_flow(Expense_project_flow::cents('1,000,000.25'), 100000025, 'Money parsing');
expect_flow(Expense_project_flow::amount(100000025), '1000000.25', 'Money serialization');
expect_flow(Expense_project_flow::product('1.50', '100.25'), 15038, 'Decimal quantity');
expect_flow(Expense_project_flow::paymentStatus(['status' => '0', 'no_request' => null]), 'Menunggu Diajukan', 'Unsubmitted');
expect_flow(Expense_project_flow::paymentStatus(['status' => '0', 'no_request' => 'PGJ-1']), 'Menunggu Approval', 'Submitted');
foreach (['1', '2'] as $status) {
    expect_flow(Expense_project_flow::paymentStatus(['status' => $status, 'no_request' => 'PGJ-1']), 'Disetujui', 'Approval is not payment');
}
expect_flow(Expense_project_flow::paymentStatus(['status' => '0', 'no_request' => null, 'keterangan' => 'Ditolak']), 'Menunggu Diajukan', 'Resubmission');
foreach ([
    [[], 'New'],
    [['sts' => null], 'Draft'],
    [['sts_req' => 1], 'Menunggu Approval'],
    [['sts' => 2], 'Ditolak'],
    [['reject_reason' => 'Revisi'], 'Ditolak'],
    [['sts' => 1, 'reject_reason' => 'Penolakan pembayaran'], 'Approved'],
    [['sts' => 1, 'return_status' => 'waiting_return'], 'Menunggu Pengembalian'],
    [['sts' => 1, 'return_status' => 'waiting_verification'], 'Menunggu Verifikasi'],
    [['sts' => 1, 'return_status' => 'completed'], 'Selesai'],
    [['sts_req' => 1, 'reject_reason' => 'Catatan lama'], 'Menunggu Approval'],
] as $case) {
    expect_flow(Expense_project_flow::reportStatus($case[0])['label'], $case[1], 'Report status');
}
foreach ([
    ['Terkirim ke Finance', 'unsubmitted', 'Menunggu Diajukan Finance'],
    ['Menunggu Diajukan', 'unsubmitted', 'Menunggu Diajukan Finance'],
    ['Menunggu Approval', 'pending', 'Menunggu Approval Pembayaran'],
    ['Disetujui', 'approved', 'Disetujui'],
    ['Integrasi Finance perlu diperiksa', 'unsubmitted', 'Integrasi Finance perlu diperiksa'],
] as $case) {
    $presentation = Expense_project_flow::reimbursementPresentation(['monitoring_status' => $case[0]]);
    expect_flow($presentation['group'], $case[1], 'Reimbursement group');
    expect_flow($presentation['label'], $case[2], 'Reimbursement label');
}
expect_flow(Expense_project_flow::reimbursementStatus(['expense_id' => 1]), 'Terkirim ke Finance', 'Keep backend integration state');
expect_flow(Expense_project_flow::reimbursementStatus([]), 'Integrasi Finance perlu diperiksa', 'Missing integration');
foreach (['-1', 'abc', '1.234', '999999999999999999999'] as $invalid) {
    try {
        Expense_project_flow::cents($invalid);
        throw new LogicException('Accepted invalid money');
    } catch (InvalidArgumentException $expected) {
    }
}
echo "Expense project policy tests passed\n";
