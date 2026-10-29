<?php
$paymentTabs = ['unsubmitted' => 'Menunggu Diajukan', 'pending' => 'Menunggu Approval', 'approved' => 'Disetujui'];
$paymentCounts = array_fill_keys(array_keys($paymentTabs), 0);
foreach ($reimbursements as $item) {
    $presentation = Expense_project_flow::reimbursementPresentation($item);
    $paymentCounts[$presentation['group']]++;
}
?>
<section class="erp-card erp-list" data-erp-list data-erp-active-status="unsubmitted" aria-labelledby="reimbursement-list-title">
    <header class="erp-section-heading">
        <h3 id="reimbursement-list-title">Penggantian biaya oleh perusahaan</h3>
        <p class="erp-section-description">Pantau pengajuan dan approval laporan expense dengan realisasi melebihi kasbon.</p>
    </header>
    <p class="erp-note"><strong>Disetujui belum berarti sudah dibayar.</strong> Status mengikuti approval expense; informasi pengajuan pembayaran Finance ditampilkan terpisah.</p>
    <div class="erp-status-tabs" role="tablist" aria-label="Status pengajuan reimburse">
        <?php foreach ($paymentTabs as $key => $label): ?>
        <button type="button" id="reimbursement-status-<?= $key ?>" role="tab" data-erp-status-tab="<?= $key ?>" data-erp-empty-label="<?= html_escape('Tidak ada reimburse pada tab ' . $label) ?>" aria-controls="reimbursement-results" aria-selected="<?= $key === 'unsubmitted' ? 'true' : 'false' ?>" tabindex="<?= $key === 'unsubmitted' ? '0' : '-1' ?>"><?= html_escape($label) ?> <span class="erp-counter-pill"><?= $paymentCounts[$key] ?></span></button>
        <?php endforeach; ?>
    </div>
    <div class="erp-toolbar">
        <div class="erp-filter-field erp-search-field">
            <label for="reimbursement-search">Cari reimburse</label>
            <input id="reimbursement-search" type="search" data-erp-search placeholder="No. dokumen, company, atau keperluan" aria-controls="reimbursement-table" autocomplete="off">
        </div>
        <p class="erp-list-count" role="status" aria-live="polite"><span data-erp-visible><?= $paymentCounts['unsubmitted'] ?></span> dari <?= count($reimbursements) ?> laporan</p>
    </div>
    <div id="reimbursement-results" class="erp-ledger-scroll" data-erp-results role="tabpanel" aria-labelledby="reimbursement-status-unsubmitted" tabindex="0">
        <table id="reimbursement-table" class="table erp-table erp-ledger">
            <thead><tr><th scope="col">Expense / Kasbon</th><th scope="col" class="erp-money">Hutang expense (Rp)</th><th scope="col">Status</th><th scope="col">Keperluan</th><th scope="col">Company</th><th scope="col">Approval expense</th><th scope="col">No. pengajuan</th><th scope="col">Keterangan Finance</th><th scope="col">Action</th></tr></thead>
            <tbody>
            <?php foreach ($reimbursements as $item):
                $presentation = Expense_project_flow::reimbursementPresentation($item);
                $status = $presentation['label'];
                $style = $presentation['style'];
                $rejected = $presentation['group'] === 'unsubmitted' && ((string) ($item['sts'] ?? '') === '2' || !empty($item['reject_reason']));
            ?>
                <tr data-payment-status="<?= html_escape($status) ?>" data-erp-row="<?= $presentation['group'] ?>" <?= $presentation['group'] !== 'unsubmitted' ? 'hidden' : '' ?>>
                    <td><span class="erp-document"><?= html_escape($item['id']) ?></span><span class="erp-document-secondary"><?= html_escape($item['id_header']) ?></span></td>
                    <td class="erp-money"><?= number_format(-$item['selisih'], 2) ?></td>
                    <td><span class="erp-status erp-status-<?= $style ?>"><?= html_escape($status) ?></span><?php if ($rejected): ?><br><span class="erp-status erp-status-error">Expense Ditolak</span><br><?= html_escape($item['reject_reason'] ?? '-') ?><br>Revisi laporan dan ajukan kembali.<?php endif; ?></td>
                    <td><?= html_escape($item['deskripsi']) ?></td><td><?= html_escape($item['nm_company'] ?? '-') ?></td>
                    <td><?= html_escape($item['approved_date'] ?? '-') ?></td><td><?= html_escape($item['no_request'] ?? '-') ?></td>
                    <td><?= html_escape($item['keterangan'] ?? '-') ?></td>
                    <td><a class="erp-btn erp-btn-primary" href="<?= html_escape(site_url('expense_report_project/view_expense_subcont/' . urlencode(str_replace('/', '|', $item['id_header'])))) ?>" aria-label="<?= html_escape('Lihat detail expense report ' . $item['id']) ?>"><i class="fa fa-eye" aria-hidden="true"></i> Detail</a></td>
                </tr>
            <?php endforeach; ?>
            <?php if (!$reimbursements): ?>
                <tr><td class="erp-empty" colspan="9"><strong data-erp-empty-title>Tidak ada reimburse pada tab Menunggu Diajukan</strong><p>Laporan dengan realisasi melebihi kasbon muncul sejak disimpan.</p></td></tr>
            <?php else: ?>
                <tr class="erp-filter-empty" data-erp-empty hidden><td class="erp-empty" colspan="9"><strong data-erp-empty-title>Tidak ada reimburse pada tab Menunggu Diajukan</strong><p>Ganti kata pencarian atau pilih tab lain.</p><button type="button" class="erp-filter-reset" data-erp-reset>Reset pencarian</button></td></tr>
            <?php endif; ?>
            </tbody>
        </table>
    </div>
</section>
