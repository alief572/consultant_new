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

expect_flow(Expense_project_flow::normalizeConsultantCompany('1', 'STM-Vuca'), 'Vuca', 'Normalize 1 to Vuca');
expect_flow(Expense_project_flow::normalizeConsultantCompany('4', 'Vuca'), 'Vuca', 'Normalize 4 to Vuca');
expect_flow(Expense_project_flow::normalizeConsultantCompany('6', 'STM-Sustain'), 'Sustain', 'Normalize 6 to Sustain');
expect_flow(Expense_project_flow::normalizeConsultantCompany('3', 'Sustain'), 'Sustain', 'Normalize 3 to Sustain');
expect_flow(Expense_project_flow::normalizeConsultantCompany('7', 'STM'), 'STM', 'Normalize 7 to STM');
expect_flow(Expense_project_flow::normalizeConsultantCompany('2', 'Calibration'), 'Calibration', 'Fallback to company name');
expect_flow(Expense_project_flow::normalizeConsultantCompany('', 'Custom Corp'), 'Custom Corp', 'Empty ID uses name');

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
    [[], 'New'],
    [['sts' => null], 'Draft'],
    [['sts_req' => 1], 'Waiting Approval'],
    [['sts' => 2], 'Rejected'],
    [['reject_reason' => 'Revisi'], 'Rejected'],
    [['sts' => 1, 'reject_reason' => 'Penolakan pembayaran'], 'Approved'],
    [['sts' => 1, 'return_status' => 'waiting_return'], 'Approved'],
    [['sts_req' => 1, 'reject_reason' => 'Catatan lama'], 'Waiting Approval'],
] as $case) {
    expect_flow(Expense_project_flow::kasbonStatus($case[0])['label'], $case[1], 'Kasbon status');
}

foreach ([
    [['sts' => null], 'Menunggu Diajukan', 'unsubmitted', 'Draft Expense', 'bd-draft'],
    [['sts_req' => 1], 'Menunggu Diajukan', 'unsubmitted', 'Menunggu Approval Expense', 'bd-wait'],
    [['sts' => 2], 'Menunggu Diajukan', 'unsubmitted', 'Expense Ditolak', 'bd-rej'],
    [['reject_reason' => 'Revisi'], 'Menunggu Diajukan', 'unsubmitted', 'Expense Ditolak', 'bd-rej'],
    [['sts' => 1], 'Menunggu Diajukan', 'unsubmitted', 'Menunggu Diajukan Finance', 'bd-pend'],
    [['sts' => 1, 'rp_status' => 'pending'], 'Menunggu Approval', 'pending', 'Menunggu Approval', 'bd-appr'],
    [['sts' => 1, 'rp_status' => 'approved'], 'Disetujui', 'approved', 'Disetujui', 'bd-ok'],
    [['sts' => 1, 'rp_status' => 'rejected', 'rp_rejected' => true], 'Menunggu Diajukan', 'unsubmitted', 'Menunggu Diajukan Finance', 'bd-pend'],
] as $case) {
    $status = Expense_project_flow::reimbursementStatus($case[0]);
    expect_flow($status, $case[1], 'Expense determines reimbursement status');
    $presentation = Expense_project_flow::reimbursementPresentation(array_merge($case[0], ['monitoring_status' => $status]));
    expect_flow($presentation['group'], $case[2], 'Reimbursement group');
    expect_flow($presentation['label'], $case[3], 'Reimbursement presentation label');
    expect_flow($presentation['badge'], $case[4], 'Reimbursement presentation badge');
}

foreach (['-1', 'abc', '1.234', '999999999999999999999'] as $invalid) {
    try {
        Expense_project_flow::cents($invalid);
        throw new LogicException('Accepted invalid money');
    } catch (InvalidArgumentException $expected) {
    }
}
echo "Expense project policy tests passed\n";
