<?php
$finance = !empty($finance);
$returnLabels = Expense_project_flow::returnLabels();
$returnBadges = ['waiting_return' => 'bd-pend', 'waiting_verification' => 'bd-ver', 'completed' => 'bd-ok'];
$counts = array_count_values(array_column($returns, 'return_status'));
$returnTabs = ['waiting_return' => 'Perlu Upload', 'waiting_verification' => 'Menunggu Verifikasi', 'completed' => 'Selesai'];
if ($finance) { $returnLabels['completed'] = 'Terverifikasi'; }
$userStatusLabels = ['waiting_return' => 'Menunggu Pengembalian', 'waiting_verification' => 'Menunggu Verifikasi', 'completed' => 'Selesai'];
$isAdminList = method_exists($this->auth, 'is_admin') && $this->auth->is_admin();
?>
<?php if ($finance): ?><link rel="stylesheet" href="<?= base_url('assets/css/expense_report_project.css') ?>">
<link rel="stylesheet" href="<?= base_url('assets/css/erp_mock.css') ?>"><?php endif; ?>
<section class="<?= $finance ? 'mk card' : '' ?> erp-list" data-erp-list <?= !$finance ? 'data-erp-active-status="waiting_return"' : '' ?> aria-labelledby="return-list-title">
    <div class="card-h">
        <span id="return-list-title"><i class="fa fa-undo"></i> <?= $finance ? 'Verifikasi uang pengembalian' : 'Daftar Piutang Kelebihan Kasbon' ?></span>
    </div>
    <?php if ($finance): ?><p class="hint" style="margin: -6px 0 10px;">Periksa bukti dan mutasi rekening sebelum menutup piutang kasbon.</p><?php endif; ?>
    <?php if (!$finance): ?>
    <div class="pills" role="tablist" aria-label="Status pengembalian kasbon">
        <?php foreach ($returnTabs as $key => $label): ?>
        <button type="button" id="return-status-<?= $key ?>" role="tab" data-erp-status-tab="<?= $key ?>" data-erp-empty-label="<?= html_escape('Tidak ada pengembalian pada tab ' . $label) ?>" aria-controls="return-results" aria-selected="<?= $key === 'waiting_return' ? 'true' : 'false' ?>" tabindex="<?= $key === 'waiting_return' ? '0' : '-1' ?>"><?= html_escape($label) ?> <span class="cnt"><?= $counts[$key] ?? 0 ?></span></button>
        <?php endforeach; ?>
    </div>
    <?php endif; ?>
    <div class="dt-top">
        <p class="erp-list-count" role="status" aria-live="polite" style="margin: 0;"><span data-erp-visible><?= $finance ? count($returns) : ($counts['waiting_return'] ?? 0) ?></span> dari <?= count($returns) ?> laporan</p>
        <div class="search-inline">
            <label for="return-search" style="margin: 0; font-weight: 400;">Cari pengembalian</label>
            <input id="return-search" class="in" style="width: 220px; min-height: 28px; padding: 2px 6px;" type="search" data-erp-search placeholder="No. dokumen, pemohon, atau keperluan" aria-controls="return-table" autocomplete="off">
        </div>
        <?php if ($finance): ?><div class="search-inline">
            <label for="return-status-filter" style="margin: 0; font-weight: 400;">Status pengembalian</label>
            <select id="return-status-filter" class="in erp-toolbar-select" style="width: auto; min-height: 28px; padding: 2px 6px;" data-erp-status aria-controls="return-table">
                <option value="">Semua status (<?= count($returns) ?>)</option>
                <?php foreach ($returnLabels as $key => $label): ?><option value="<?= $key ?>"><?= html_escape($label) ?> (<?= $counts[$key] ?? 0 ?>)</option><?php endforeach; ?>
            </select>
        </div><?php endif; ?>
    </div>
    <div class="tw" <?= $finance ? 'role="region" aria-label="Daftar pengembalian kasbon, geser untuk melihat semua kolom"' : 'id="return-results" data-erp-results role="tabpanel" aria-labelledby="return-status-waiting_return"' ?> tabindex="0">
        <table id="return-table" class="dt <?= $finance ? '' : 'pu' ?>">
            <?php if ($finance): ?>
            <thead><tr><th scope="col">Expense / Kasbon</th><th scope="col" class="erp-money">Sisa kasbon (Rp)</th><th scope="col">Status</th><th scope="col">Pemohon</th><th scope="col">Keperluan</th><th scope="col">Bukti dikirim</th><th scope="col">Catatan Finance</th><th scope="col">Tindak lanjut</th></tr></thead>
            <?php else: ?>
            <thead><tr><th scope="col">#</th><th scope="col">No. Expense</th><th scope="col">No. Kasbon</th><th scope="col">Nomor SPK</th><th scope="col">Keperluan / Keterangan</th><th scope="col">Tanggal Approval</th><th scope="col" class="erp-money">Kelebihan Kasbon (Rp)</th><th scope="col">Status</th><th scope="col">Aksi</th></tr></thead>
            <?php endif; ?>
            <tbody>
            <?php foreach ($returns as $item): $status = $item['return_status']; ?>
                <tr data-return-status="<?= html_escape($status) ?>" data-erp-row="<?= html_escape($status) ?>" <?= !$finance && $status !== 'waiting_return' ? 'hidden' : '' ?>>
                    <?php if (!$finance): ?>
                    <td class="rowno"></td>
                    <td><b><?= html_escape($item['id']) ?></b></td>
                    <td><span class="pill"><i class="fa fa-tag"></i> <?= html_escape($item['id_header']) ?></span></td>
                    <td><?= html_escape($item['spk_no'] ?? '-') ?></td>
                    <td><?= html_escape($item['deskripsi']) ?><?php if ($status === 'waiting_return' && !empty($item['rejection_reason'])): ?><br><span style="color: #d9444b; font-size: 10.5px;">Ditolak Finance: <?= html_escape($item['rejection_reason']) ?></span><?php endif; ?></td>
                    <td><?= html_escape(substr((string) ($item['approved_date'] ?? ''), 0, 10) ?: '-') ?></td>
                    <td class="num">Rp <?= number_format((float) str_replace(',', '', $item['amount'])) ?></td>
                    <td><span class="bd <?= $returnBadges[$status] ?? 'bd-draft' ?>"><?= html_escape($userStatusLabels[$status] ?? $status) ?></span></td>
                    <td><a class="mkb <?= $status === 'waiting_return' ? 'b-amber' : 'b-out' ?> b-sm" href="<?= site_url('expense_report_project/return_detail') . '?id=' . rawurlencode($item['id']) . ($isAdminList ? '&amp;finance=1' : '') ?>" aria-label="<?= html_escape('Buka pengembalian ' . $item['id']) ?>"><?= $status === 'waiting_return' ? '<i class="fa fa-upload"></i> Upload Bukti' : '<i class="fa fa-eye"></i> Lihat' ?></a></td>
                    <?php else: ?>
                    <td><b><?= html_escape($item['id']) ?></b><br><span class="pill"><i class="fa fa-tag"></i> <?= html_escape($item['id_header']) ?></span></td>
                    <td class="num erp-money"><?= number_format($item['amount'], 2) ?></td>
                    <td><span class="bd <?= $returnBadges[$status] ?? 'bd-draft' ?>"><?= html_escape($returnLabels[$status] ?? $status) ?></span></td>
                    <td><?= html_escape($item['nm_lengkap']) ?></td><td><?= html_escape($item['deskripsi']) ?></td>
                    <td><?= html_escape($item['submitted_at'] ?? '-') ?></td><td><?= html_escape($item['rejection_reason'] ?? '-') ?></td>
                    <td><a class="mkb <?= $status === 'waiting_verification' ? 'b-blue' : 'b-out' ?> b-sm" href="<?= site_url('expense_report_project/return_detail') . '?id=' . rawurlencode($item['id']) . '&amp;finance=1' ?>" aria-label="<?= html_escape('Buka pengembalian ' . $item['id']) ?>"><?= $status === 'waiting_verification' ? '<i class="fa fa-check"></i> Periksa bukti' : '<i class="fa fa-eye"></i> Lihat detail' ?></a></td>
                    <?php endif; ?>
                </tr>
            <?php endforeach; ?>
            <?php if (!$returns): ?>
                <tr><td class="empty" colspan="<?= $finance ? 8 : 9 ?>"><strong data-erp-empty-title><?= $finance ? 'Belum ada pengembalian untuk diperiksa' : 'Tidak ada pengembalian pada tab Perlu Upload' ?></strong><p><?= $finance ? 'Laporan dengan sisa kasbon muncul setelah disetujui. Verifikasi tersedia setelah pemohon mengirim bukti.' : 'Laporan yang disetujui dengan kasbon lebih besar dari realisasi akan muncul di sini.' ?></p></td></tr>
            <?php else: ?>
                <tr class="erp-filter-empty" data-erp-empty hidden><td class="empty" colspan="<?= $finance ? 8 : 9 ?>"><strong data-erp-empty-title><?= $finance ? 'Tidak ada laporan yang cocok' : 'Tidak ada pengembalian pada tab Perlu Upload' ?></strong><p>Ganti kata pencarian atau pilih <?= $finance ? 'status' : 'tab' ?> lain.</p><button type="button" class="mkb b-out b-sm" data-erp-reset><?= $finance ? 'Reset pencarian dan status' : 'Reset pencarian' ?></button></td></tr>
            <?php endif; ?>
            </tbody>
        </table>
    </div>
</section>
<?php if ($finance): ?><script src="<?= base_url('assets/js/expense_report_project_ui.js') ?>"></script><?php endif; ?>
