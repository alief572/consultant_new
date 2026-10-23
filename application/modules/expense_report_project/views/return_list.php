<?php
$finance = !empty($finance);
$returnLabels = ['waiting_return' => 'Menunggu Pengembalian', 'waiting_verification' => 'Menunggu Verifikasi', 'completed' => 'Selesai'];
$returnStyles = ['waiting_return' => 'waiting', 'waiting_verification' => 'review', 'completed' => 'completed'];
$counts = array_count_values(array_column($returns, 'return_status'));
?>
<?php if ($finance): ?><link rel="stylesheet" href="<?= base_url('assets/css/expense_report_project.css') ?>"><?php endif; ?>
<section class="erp-card erp-list" data-erp-list aria-labelledby="return-list-title">
    <header class="erp-section-heading">
        <h3 id="return-list-title"><?= $finance ? 'Verifikasi uang pengembalian' : 'Pengembalian sisa kasbon' ?></h3>
        <p class="erp-section-description"><?= $finance ? 'Periksa bukti dan mutasi rekening sebelum menutup piutang kasbon.' : 'Kembalikan sisa dana dari laporan yang sudah disetujui. Bukti transfer akan diperiksa Finance.' ?></p>
    </header>
    <div class="erp-toolbar">
        <div class="erp-filter-field erp-search-field">
            <label for="return-search">Cari pengembalian</label>
            <input id="return-search" type="search" data-erp-search placeholder="No. dokumen, pemohon, atau keperluan" aria-controls="return-table" autocomplete="off">
        </div>
        <div class="erp-filter-field">
            <label for="return-status-filter">Status pengembalian</label>
            <select id="return-status-filter" class="erp-toolbar-select" data-erp-status aria-controls="return-table">
                <option value="">Semua status (<?= count($returns) ?>)</option>
                <?php foreach ($returnLabels as $key => $label): ?><option value="<?= $key ?>"><?= html_escape($label) ?> (<?= $counts[$key] ?? 0 ?>)</option><?php endforeach; ?>
            </select>
        </div>
        <p class="erp-list-count" role="status" aria-live="polite"><span data-erp-visible><?= count($returns) ?></span> dari <?= count($returns) ?> laporan</p>
    </div>
    <div class="erp-ledger-scroll" role="region" aria-label="Daftar pengembalian kasbon, geser untuk melihat semua kolom" tabindex="0">
        <table id="return-table" class="table erp-table erp-ledger">
            <thead><tr><th scope="col">Expense / Kasbon</th><th scope="col" class="erp-money">Sisa kasbon (Rp)</th><th scope="col">Status</th><th scope="col">Pemohon</th><th scope="col">Keperluan</th><th scope="col">Bukti dikirim</th><th scope="col">Catatan Finance</th><th scope="col">Tindak lanjut</th></tr></thead>
            <tbody>
            <?php foreach ($returns as $item): $status = $item['return_status']; ?>
                <tr data-return-status="<?= html_escape($status) ?>" data-erp-row="<?= html_escape($status) ?>">
                    <td><span class="erp-document"><?= html_escape($item['id']) ?></span><span class="erp-document-secondary"><?= html_escape($item['id_header']) ?></span></td>
                    <td class="erp-money"><?= number_format($item['amount'], 2) ?></td>
                    <td><span class="erp-status erp-status-<?= $returnStyles[$status] ?? 'neutral' ?>"><?= html_escape($returnLabels[$status] ?? $status) ?></span></td>
                    <td><?= html_escape($item['nm_lengkap']) ?></td><td><?= html_escape($item['deskripsi']) ?></td>
                    <td><?= html_escape($item['submitted_at'] ?? '-') ?></td><td><?= html_escape($item['rejection_reason'] ?? '-') ?></td>
                    <?php
                    $isAdmin = method_exists($this->auth, 'is_admin') && $this->auth->is_admin();
                    $isVerifyRole = $finance || $isAdmin;
                    ?>
                    <td><a class="erp-btn erp-btn-default" href="<?= site_url('expense_report_project/return_detail') . '?id=' . rawurlencode($item['id']) . ($isVerifyRole ? '&amp;finance=1' : '') ?>" aria-label="<?= html_escape('Buka pengembalian ' . $item['id']) ?>"><?= $isVerifyRole && $status === 'waiting_verification' ? 'Periksa bukti' : (!$isVerifyRole && $status === 'waiting_return' ? 'Kirim bukti' : 'Lihat detail') ?></a></td>
                </tr>
            <?php endforeach; ?>
            <?php if (!$returns): ?>
                <tr><td class="erp-empty" colspan="8"><strong><?= $finance ? 'Belum ada pengembalian untuk diperiksa' : 'Tidak ada sisa kasbon yang perlu dikembalikan' ?></strong><p><?= $finance ? 'Laporan dengan sisa kasbon muncul setelah disetujui. Verifikasi tersedia setelah pemohon mengirim bukti.' : 'Laporan yang disetujui dengan kasbon lebih besar dari realisasi akan muncul di sini.' ?></p></td></tr>
            <?php else: ?>
                <tr class="erp-filter-empty" data-erp-empty hidden><td class="erp-empty" colspan="8"><strong>Tidak ada laporan yang cocok</strong><p>Ganti kata pencarian atau pilih status lain.</p><button type="button" class="erp-filter-reset" data-erp-reset>Reset pencarian dan status</button></td></tr>
            <?php endif; ?>
            </tbody>
        </table>
    </div>
</section>
<?php if ($finance): ?><script src="<?= base_url('assets/js/expense_report_project_ui.js') ?>"></script><?php endif; ?>
