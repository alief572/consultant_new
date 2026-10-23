<?php $paymentCounts = array_count_values(array_column($reimbursements, 'monitoring_status')); ?>
<section class="erp-card erp-list" data-erp-list aria-labelledby="reimbursement-list-title">
    <header class="erp-section-heading">
        <h3 id="reimbursement-list-title">Penggantian biaya oleh perusahaan</h3>
        <p class="erp-section-description">Pantau selisih pengeluaran yang diteruskan ke Request Payment Finance.</p>
    </header>
    <p class="erp-note"><strong>Disetujui belum berarti sudah dibayar.</strong> Pemantauan di sini berakhir pada approval Request Payment.</p>
    <div class="erp-toolbar">
        <div class="erp-filter-field erp-search-field">
            <label for="reimbursement-search">Cari reimburse</label>
            <input id="reimbursement-search" type="search" data-erp-search placeholder="No. dokumen, company, atau keperluan" aria-controls="reimbursement-table" autocomplete="off">
        </div>
        <div class="erp-filter-field">
            <label for="reimbursement-status-filter">Status Request Payment</label>
            <select id="reimbursement-status-filter" class="erp-toolbar-select" data-erp-status aria-controls="reimbursement-table">
                <option value="">Semua status (<?= count($reimbursements) ?>)</option>
                <?php foreach (['Terkirim ke Finance', 'Menunggu Diajukan', 'Menunggu Approval', 'Disetujui'] as $label): ?><option value="<?= html_escape($label) ?>"><?= html_escape($label) ?> (<?= $paymentCounts[$label] ?? 0 ?>)</option><?php endforeach; ?>
            </select>
        </div>
        <p class="erp-list-count" role="status" aria-live="polite"><span data-erp-visible><?= count($reimbursements) ?></span> dari <?= count($reimbursements) ?> laporan</p>
    </div>
    <div class="erp-ledger-scroll" role="region" aria-label="Daftar reimburse, geser untuk melihat semua kolom" tabindex="0">
        <table id="reimbursement-table" class="table erp-table erp-ledger">
            <thead><tr><th scope="col">Expense / Kasbon</th><th scope="col" class="erp-money">Hutang expense (Rp)</th><th scope="col">Status</th><th scope="col">Keperluan</th><th scope="col">Company</th><th scope="col">Approval expense</th><th scope="col">No. pengajuan</th><th scope="col">Keterangan Finance</th></tr></thead>
            <tbody>
            <?php foreach ($reimbursements as $item):
                $status = $item['monitoring_status'];
                $style = $status === 'Disetujui' ? 'completed' : ($status === 'Menunggu Approval' ? 'review' : ($status === 'Terkirim ke Finance' ? 'waiting' : 'neutral'));
                if (!in_array($status, ['Disetujui', 'Menunggu Approval', 'Menunggu Diajukan', 'Terkirim ke Finance'], true)) $style = 'neutral';
            ?>
                <tr data-payment-status="<?= html_escape($status) ?>" data-erp-row="<?= html_escape($status) ?>">
                    <td><span class="erp-document"><?= html_escape($item['id']) ?></span><span class="erp-document-secondary"><?= html_escape($item['id_header']) ?></span></td>
                    <td class="erp-money"><?= number_format(-$item['selisih'], 2) ?></td>
                    <td><span class="erp-status erp-status-<?= $style ?>"><?= html_escape($status) ?></span></td>
                    <td><?= html_escape($item['deskripsi']) ?></td><td><?= html_escape($item['nm_company'] ?? '-') ?></td>
                    <td><?= html_escape($item['approved_date']) ?></td><td><?= html_escape($item['no_request'] ?? '-') ?></td>
                    <td><?= html_escape($item['keterangan'] ?? '-') ?></td>
                </tr>
            <?php endforeach; ?>
            <?php if (!$reimbursements): ?>
                <tr><td class="erp-empty" colspan="8"><strong>Belum ada penggantian biaya yang diajukan</strong><p>Laporan yang disetujui dengan realisasi melebihi kasbon akan otomatis muncul di sini.</p></td></tr>
            <?php else: ?>
                <tr class="erp-filter-empty" data-erp-empty hidden><td class="erp-empty" colspan="8"><strong>Tidak ada reimburse yang cocok</strong><p>Ganti kata pencarian atau pilih status lain.</p><button type="button" class="erp-filter-reset" data-erp-reset>Reset pencarian dan status</button></td></tr>
            <?php endif; ?>
            </tbody>
        </table>
    </div>
</section>
