<?php
$paymentTabs = ['unsubmitted' => 'Menunggu Diajukan', 'pending' => 'Menunggu Approval', 'approved' => 'Disetujui'];
$paymentCounts = array_fill_keys(array_keys($paymentTabs), 0);
foreach ($reimbursements as $item) {
    $presentation = Expense_project_flow::reimbursementPresentation($item);
    $paymentCounts[$presentation['group']]++;
}
?>
<section class="erp-list" data-erp-list data-erp-active-status="unsubmitted" aria-labelledby="reimbursement-list-title">
    <div class="card-h">
        <span id="reimbursement-list-title"><i class="fa fa-money"></i> Monitoring Lebih Expense (Reimburse ke Konsultan)</span>
    </div>
    <div class="pills gr" role="tablist" aria-label="Status pengajuan reimburse">
        <?php foreach ($paymentTabs as $key => $label): ?>
        <button type="button" id="reimbursement-status-<?= $key ?>" role="tab" data-erp-status-tab="<?= $key ?>" data-erp-empty-label="<?= html_escape('Tidak ada reimburse pada tab ' . $label) ?>" aria-controls="reimbursement-results" aria-selected="<?= $key === 'unsubmitted' ? 'true' : 'false' ?>" tabindex="<?= $key === 'unsubmitted' ? '0' : '-1' ?>"><?= html_escape($label) ?> <span class="cnt"><?= $paymentCounts[$key] ?></span></button>
        <?php endforeach; ?>
    </div>
    <div class="dt-top">
        <p class="erp-list-count" role="status" aria-live="polite" style="margin: 0;"><span data-erp-visible><?= $paymentCounts['unsubmitted'] ?></span> dari <?= count($reimbursements) ?> laporan</p>
        <div class="search-inline">
            <label for="reimbursement-search" style="margin: 0; font-weight: 400;">Cari reimburse</label>
            <input id="reimbursement-search" class="in" style="width: 220px; min-height: 28px; padding: 2px 6px;" type="search" data-erp-search placeholder="No. dokumen, company, atau keperluan" aria-controls="reimbursement-table" autocomplete="off">
        </div>
    </div>
    <div id="reimbursement-results" class="tw" data-erp-results role="tabpanel" aria-labelledby="reimbursement-status-unsubmitted" tabindex="0">
        <table id="reimbursement-table" class="dt gr">
            <thead><tr><th scope="col">#</th><th scope="col">No. Expense</th><th scope="col">No. Kasbon</th><th scope="col">Nomor SPK</th><th scope="col">Keperluan</th><th scope="col">Company</th><th scope="col">Tanggal Approval</th><th scope="col" class="erp-money">Hutang Expense (Rp)</th><th scope="col">Status</th><th scope="col">No. Pengajuan</th><th scope="col">Keterangan</th></tr></thead>
            <tbody>
            <?php foreach ($reimbursements as $item):
                $presentation = Expense_project_flow::reimbursementPresentation($item);
                $badgeClass = $presentation['badge'] ?? 'bd-draft';
                $badgeLabel = $presentation['label'] ?? '';
                $status = $presentation['label'];
                $expenseRejected = (string) ($item['sts'] ?? '') === '2' || !empty($item['reject_reason']);
                $rpRejected = !empty($item['rp_rejected']);
            ?>
                <tr data-payment-status="<?= html_escape($status) ?>" data-erp-row="<?= $presentation['group'] ?>" <?= $presentation['group'] !== 'unsubmitted' ? 'hidden' : '' ?>>
                    <td class="rowno"></td>
                    <td><b><?= html_escape($item['id']) ?></b> <a href="<?= html_escape(site_url('expense_report_project/view_expense_subcont/' . urlencode(str_replace('/', '|', $item['id_header'])))) ?>" title="<?= html_escape('Lihat detail expense report ' . $item['id']) ?>" aria-label="<?= html_escape('Lihat detail expense report ' . $item['id']) ?>"><i class="fa fa-eye" aria-hidden="true"></i></a></td>
                    <td><span class="pill"><i class="fa fa-tag"></i> <?= html_escape($item['id_header']) ?></span></td>
                    <td><?= html_escape($item['spk_no'] ?? '-') ?></td>
                    <td><?= html_escape($item['deskripsi']) ?></td>
                    <td><?= html_escape($item['nm_company'] ?? '-') ?></td>
                    <td><?= html_escape(substr((string) ($item['approved_date'] ?? ''), 0, 10) ?: '-') ?></td>
                    <td class="num">Rp <?= number_format(-$item['selisih']) ?></td>
                    <td><span class="bd <?= $badgeClass ?>"><?= html_escape($badgeLabel) ?></span><?php if ($presentation['group'] === 'unsubmitted' && (string) ($item['sts'] ?? '') !== '1' && $expenseRejected): ?><br><span class="bd bd-rej" style="margin-top: 4px;">Expense Ditolak</span><br><span style="font-size: 10.5px; color: #d9444b;"><?= html_escape($item['reject_reason'] ?? '-') ?></span><br><span style="font-size: 10.5px;">Revisi laporan dan ajukan kembali.</span><?php elseif ($presentation['group'] === 'unsubmitted' && (string) ($item['sts'] ?? '') === '1' && $rpRejected): ?><br><span class="bd bd-rej" style="margin-top: 4px;">Ditolak di Request Payment</span><?php endif; ?></td>
                    <td><?= html_escape($item['no_request'] ?? '-') ?></td>
                    <td><?= html_escape($item['keterangan'] ?? '-') ?></td>
                </tr>
            <?php endforeach; ?>
            <?php if (!$reimbursements): ?>
                <tr><td class="empty" colspan="11"><strong data-erp-empty-title>Tidak ada reimburse pada tab Menunggu Diajukan</strong><p>Laporan dengan realisasi melebihi kasbon muncul sejak disimpan.</p></td></tr>
            <?php else: ?>
                <tr class="erp-filter-empty" data-erp-empty hidden><td class="empty" colspan="11"><strong data-erp-empty-title>Tidak ada reimburse pada tab Menunggu Diajukan</strong><p>Ganti kata pencarian atau pilih tab lain.</p><button type="button" class="mkb b-out b-sm" data-erp-reset>Reset pencarian</button></td></tr>
            <?php endif; ?>
            </tbody>
        </table>
    </div>
    <p class="hint" style="margin-top: 10px;"><strong>Disetujui belum berarti sudah dibayar.</strong> Tab ini memantau pengajuan reimburse oleh Finance di Request Payment (SENDIGS SS) hingga disetujui pada Approval Request Payment.</p>
</section>
