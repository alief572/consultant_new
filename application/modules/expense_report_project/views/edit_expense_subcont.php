<?php
$newExpenseFlow = (int) ($header->flow_version ?? 1) === 2;
$ENABLE_ADD     = has_permission('Expense_Report_Project.Add');
$ENABLE_MANAGE  = has_permission('Expense_Report_Project.Manage');
$ENABLE_VIEW    = has_permission('Expense_Report_Project.View');
$ENABLE_DELETE  = has_permission('Expense_Report_Project.Delete');

$title_header = 'Subcont';
if ($tipe == '2') {
    $title_header = 'Akomodasi';
}
if ($tipe == '3') {
    $title_header = 'Others';
}
if ($tipe == '4') {
    $title_header = 'Lab';
}
if ($tipe == '5') {
    $title_header = 'Subcont Tenaga Ahli';
}
if ($tipe == '6') {
    $title_header = 'Subcont Perusahaan';
}

$enb_reject_reason = 'd-none';
if ($header->reject_reason !== '' && $header->reject_reason !== null) {
    $enb_reject_reason = '';
}

$hide_jurnal_pph21 = 'd-none';
if (!empty($list_jurnal_pph21) && $list_jurnal_pph21['nominal_pph'] > 0) {
    $hide_jurnal_pph21 = '';
}
?>

<link rel="stylesheet" href="https://cdn.datatables.net/2.1.7/css/dataTables.dataTables.min.css">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<?= base_url('assets/css/expense_report_project.css') ?>">
<link rel="stylesheet" href="<?= base_url('assets/css/erp_mock.css') ?>">

<style>
    .dropdown-menu {
        top: 100%;
        position: absolute;
        overflow: auto;
    }
    .d-none {
        display: none;
    }
</style>

<form id="frm-data" enctype="multipart/form-data">
    <input type="hidden" name="id_expense" value="<?= $header->id ?>">
    <input type="hidden" name="id_header" value="<?= $id_header ?>">
    <input type="hidden" name="id_spk_budgeting" value="<?= $id_spk_budgeting ?>">
    <input type="hidden" name="id_spk_penawaran" value="<?= $id_spk_penawaran ?>">
    <input type="hidden" name="id_penawaran" value="<?= $id_penawaran ?>">
    <input type="hidden" name="tipe" value="<?= $tipe ?>">

    <!-- 1. SPK Project Information Card -->
    <div class="erp-card">
        <div class="erp-card-header">
            <h4 class="erp-card-title">
                <i class="fa fa-pencil-square-o"></i> Edit Laporan Expense: <span class="text-primary"><?= html_escape($header->id) ?></span>
                <small class="text-muted" style="font-size: 12px; margin-left: 8px;">(SPK: <?= (isset($list_budgeting)) ? $list_budgeting->id_spk_penawaran : '' ?>)</small>
            </h4>
            <div>
                <a href="<?= base_url('expense_report_project/add/' . urlencode(str_replace('/', '|', $id_spk_budgeting))) ?>" class="erp-btn erp-btn-sm erp-btn-default">
                    <i class="fa fa-arrow-left"></i> Kembali ke Kategori SPK
                </a>
            </div>
        </div>
        <div class="erp-card-body">
            <?php if (!empty($header->reject_reason)): ?>
                <?php
                $rejectedByName = '';
                if (!empty($header->rejected_by)) {
                    $rejectedByUser = get_instance()->db->get_where('users', ['id_user' => $header->rejected_by])->row();
                    $rejectedByName = $rejectedByUser->nm_lengkap ?? '';
                }
                ?>
                <div class="alert alert-danger <?= $enb_reject_reason ?>" style="border-radius: 4px; margin-bottom: 16px;">
                    <i class="fa fa-exclamation-circle"></i> <strong>Ditolak<?= $rejectedByName !== '' ? ' oleh ' . html_escape($rejectedByName) : '' ?>.</strong> Catatan: <?= html_escape($header->reject_reason) ?>. Perbaiki laporan lalu simpan ulang untuk masuk approval dari awal.
                </div>
            <?php endif; ?>

            <div class="erp-meta-grid">
                <div class="erp-meta-item">
                    <span class="erp-meta-label">Nomor SPK</span>
                    <span class="erp-meta-value highlight"><i class="fa fa-file-text-o"></i> <?= (isset($list_budgeting)) ? $list_budgeting->id_spk_penawaran : '' ?></span>
                </div>
                <div class="erp-meta-item">
                    <span class="erp-meta-label">Project Leader</span>
                    <span class="erp-meta-value"><i class="fa fa-user"></i> <?= (isset($list_budgeting)) ? ucfirst($list_budgeting->nm_project_leader) : '' ?></span>
                </div>
                <div class="erp-meta-item">
                    <span class="erp-meta-label">Customer</span>
                    <span class="erp-meta-value"><i class="fa fa-building"></i> <?= (isset($list_budgeting)) ? $list_budgeting->nm_customer : '' ?></span>
                </div>
                <div class="erp-meta-item">
                    <span class="erp-meta-label">Sales Representative</span>
                    <span class="erp-meta-value"><?= (isset($list_budgeting)) ? ucfirst($list_budgeting->nm_sales) : '' ?></span>
                </div>
                <div class="erp-meta-item">
                    <span class="erp-meta-label">Nama Proyek / Paket</span>
                    <span class="erp-meta-value"><?= (isset($list_budgeting)) ? ((!empty($list_budgeting->nm_paket)) ? $list_budgeting->nm_paket : (isset($list_budgeting->nama_project) ? $list_budgeting->nama_project : '')) : '' ?></span>
                </div>
                <div class="erp-meta-item">
                    <span class="erp-meta-label">Periode Pelaksanaan</span>
                    <span class="erp-meta-value">
                        <span class="erp-period-pill">
                            <i class="fa fa-calendar"></i> <?= (isset($list_budgeting)) ? $list_budgeting->waktu_from : '' ?> &nbsp;&mdash;&nbsp; <?= (isset($list_budgeting)) ? $list_budgeting->waktu_to : '' ?>
                        </span>
                    </span>
                </div>
                <div class="erp-meta-item" style="grid-column: 1 / -1;">
                    <span class="erp-meta-label">Alamat Proyek</span>
                    <span class="erp-meta-value"><?= (isset($list_budgeting)) ? $list_budgeting->alamat : '' ?></span>
                </div>
            </div>
            <div class="mk" style="margin-top: 16px;">
                <?php
                $infoTipeLabels = ['1' => 'Subcont', '2' => 'Akomodasi', '3' => 'Others', '4' => 'Lab', '5' => 'Subcont Tenaga Ahli', '6' => 'Subcont Perusahaan'];
                $infoTipe = (string) ($header->tipe);
                $infoTagClass = $infoTipe === '2' ? 'tg-akom' : 'tg-oth';
                ?>
                <div class="fgrid">
                    <div class="fg"><label>No. Expense</label><input class="in" readonly value="<?= html_escape($header->id) ?>"></div>
                    <div class="fg"><label>Tanggal</label><input class="in" readonly value="<?= html_escape(substr((string) $header->created_date, 0, 10)) ?>"></div>
                    <div class="fg"><label>No. Kasbon</label><div style="padding-top: 4px;"><span class="pill"><i class="fa fa-tag"></i> <?= html_escape($header->id_header) ?></span> <span class="tg <?= $infoTagClass ?>"><?= html_escape($infoTipeLabels[$infoTipe] ?? $infoTipe) ?></span></div></div>
                </div>
                <div class="fg">
                    <label for="keterangan_laporan">Keterangan Laporan <span class="rq">*</span></label>
                    <textarea class="in" id="keterangan_laporan" name="keterangan_laporan" rows="2" placeholder="Tuliskan keterangan laporan expense..."><?= html_escape($header->keterangan_laporan ?? '') ?></textarea>
                </div>
            </div>
        </div>
    </div>

    <!-- 2. Real-Time Stat Summary Cards -->
    <div class="erp-stat-deck">
        <div class="erp-stat-card kasbon">
            <div class="erp-stat-label">
                <span>Total Kasbon Awal</span>
                <i class="fa fa-ticket text-muted"></i>
            </div>
            <h3 class="erp-stat-value" id="card-stat-kasbon">Rp 0.00</h3>
            <div class="erp-stat-subtext">Pagu kasbon yang telah dicairkan</div>
        </div>

        <div class="erp-stat-card realisasi">
            <div class="erp-stat-label">
                <span>Total Realisasi Aktual</span>
                <i class="fa fa-calculator text-primary"></i>
            </div>
            <h3 class="erp-stat-value" id="card-stat-expense">Rp 0.00</h3>
            <div class="erp-stat-subtext">Rincian pengeluaran fisik yang dilaporkan</div>
        </div>

        <div class="erp-stat-card selisih-pas" id="card-stat-selisih-wrapper">
            <div class="erp-stat-label">
                <span id="card-stat-selisih-title">Status Selisih</span>
                <span class="erp-badge erp-badge-neutral" id="card-stat-selisih-badge">
                    <span class="erp-badge-dot"></span> BALANCE
                </span>
            </div>
            <h3 class="erp-stat-value" id="card-stat-selisih">Rp 0.00</h3>
            <div class="erp-stat-subtext" id="card-stat-selisih-subtext">Pengeluaran aktual tepat sama dengan pagu kasbon</div>
        </div>
    </div>

    <!-- 3. Dual-Block Items Table Card -->
    <div class="erp-card">
        <div class="erp-card-header">
            <h4 class="erp-card-title">
                <i class="fa fa-list-ul"></i> Rincian Item Realisasi: <?= html_escape($title_header) ?>
            </h4>
            <div style="font-size: 11px; color: var(--erp-slate-500);">
                <i class="fa fa-info-circle"></i> Perbarui Qty/Nominal Realisasi dan kelola file bukti nota
            </div>
        </div>

        <div class="erp-card-body" style="padding: 14px;">
            <div class="table-responsive">
                <table class="table erp-table mt-5">
                    <thead>
                        <tr>
                            <th class="text-center" rowspan="2" width="40">No.</th>
                            <th class="text-center" rowspan="2" width="180">Nama Item</th>
                            <th class="text-center th-kasbon-group" colspan="3"><i class="fa fa-lock"></i> Kasbon (Pagu Awal)</th>
                            <th class="text-center th-expense-group" colspan="3"><i class="fa fa-pencil"></i> Expense Report (Realisasi Aktual)</th>
                            <th class="text-center" rowspan="2" width="230">Bukti Nota <span style="color: #d9444b;">*</span></th>
                            <th class="text-center" rowspan="2" width="180">Keterangan</th>
                        </tr>
                        <tr>
                            <th class="text-center th-kasbon-group" width="70">Qty</th>
                            <th class="text-right th-kasbon-group" width="110">Nominal (Rp)</th>
                            <th class="text-right th-kasbon-group" width="120">Total (Rp)</th>
                            <th class="text-center th-expense-group" width="70">Qty</th>
                            <th class="text-right th-expense-group" width="120">Nominal (Rp)</th>
                            <th class="text-right th-expense-group" width="130">Total (Rp)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $ttl_expense_report = 0;
                        $ttl_kasbon = 0;
                        $count_no = 0;

                        foreach ($datalist_item as $item) {
                            $readonly_qty = 'readonly';
                            $readonly_nominal = 'readonly';

                            $qty_expense = (isset($datalist_item_expense[$item['id_detail_kasbon']])) ? $datalist_item_expense[$item['id_detail_kasbon']]['qty_expense'] : 0;
                            $nominal_expense = (isset($datalist_item_expense[$item['id_detail_kasbon']])) ? $datalist_item_expense[$item['id_detail_kasbon']]['nominal_expense'] : 0;
                            $total_expense = (isset($datalist_item_expense[$item['id_detail_kasbon']])) ? $datalist_item_expense[$item['id_detail_kasbon']]['total_expense'] : 0;
                            $keterangan = (isset($datalist_item_expense[$item['id_detail_kasbon']])) ? $datalist_item_expense[$item['id_detail_kasbon']]['keterangan'] : '';

                            if ($qty_expense > 0 || $item['qty_kasbon'] > 0) {
                                $readonly_qty = '';
                                $readonly_nominal = '';
                            }

                            echo '<tr>';
                            echo '<td class="text-center font-bold">' . $item['no'] . '<input type="hidden" name="detail_subcont[' . $item['no'] . '][id_detail_kasbon]" value="' . $item['id_detail_kasbon'] . '"></td>';
                            echo '<td width="180"><strong>' . html_escape($item['nm_item']) . '</strong></td>';

                            // Kasbon Block (Read-only tint)
                            echo '<td class="text-center col-kasbon-tint">' . number_format($item['qty_kasbon'], 2) . '<input type="hidden" name="detail_subcont[' . $item['no'] . '][qty_kasbon]" value="' . $item['qty_kasbon'] . '"></td>';
                            echo '<td class="text-right col-kasbon-tint">' . number_format($item['nominal_kasbon'], 2) . '<input type="hidden" name="detail_subcont[' . $item['no'] . '][nominal_kasbon]" value="' . $item['nominal_kasbon'] . '"></td>';
                            echo '<td class="text-right col-kasbon-tint font-bold">' . number_format($item['nominal_kasbon'] * $item['qty_kasbon'], 2) . '<input type="hidden" name="detail_subcont[' . $item['no'] . '][total_kasbon]" value="' . ($item['qty_kasbon'] * $item['nominal_kasbon']) . '"></td>';

                            // Expense Report Block (Active input)
                            echo '<td class="col-expense-input">';
                            echo '<input type="text" aria-label="Kuantitas realisasi item ' . $item['no'] . '" inputmode="decimal" name="detail_subcont[' . $item['no'] . '][qty_expense]" class="form-control erp-input-sm auto_num text-right qty_expense" value="' . $qty_expense . '" data-no="' . $item['no'] . '" onchange="hitung_total(' . $item['no'] . ')" ' . $readonly_qty . '>';
                            echo '</td>';

                            echo '<td class="col-expense-input">';
                            echo '<input type="text" aria-label="Harga satuan realisasi item ' . $item['no'] . '" inputmode="decimal" name="detail_subcont[' . $item['no'] . '][nominal_expense]" class="form-control erp-input-sm auto_num text-right nominal_expense" value="' . $nominal_expense . '" data-no="' . $item['no'] . '" onchange="hitung_total(' . $item['no'] . ')" ' . $readonly_nominal . '>';
                            echo '</td>';

                            echo '<td class="col-expense-input">';
                            echo '<input type="text" aria-label="Total realisasi item ' . $item['no'] . '" name="detail_subcont[' . $item['no'] . '][total_expense]" class="form-control erp-input-sm auto_num text-right font-bold" value="' . ($nominal_expense * $qty_expense) . '" data-no="' . $item['no'] . '" readonly>';
                            echo '</td>';

                            // Bukti Penggunaan (Existing files + dropzone for new uploads)
                            echo '<td width="230" style="vertical-align: top;">';
                            if (isset($list_bukti_penggunaan_by_detail[$item['id_detail_kasbon']])) {
                                echo '<div class="erp-file-chips" style="margin-bottom: 6px;">';
                                foreach ($list_bukti_penggunaan_by_detail[$item['id_detail_kasbon']] as $bp) {
                                    $ext = strtolower(pathinfo($bp->upload_file, PATHINFO_EXTENSION));
                                    $isImg = in_array($ext, ['jpg', 'jpeg', 'png', 'gif', 'webp']);
                                    echo '<div class="erp-file-chip" id="row-bukti-' . $bp->id . '">';
                                    echo '<div class="erp-file-chip-info" title="' . basename($bp->upload_file) . '">';
                                    echo '<i class="fa ' . ($isImg ? 'fa-file-image-o text-primary' : 'fa-file-pdf-o text-danger') . '"></i> ';
                                    echo '<a href="' . base_url($bp->upload_file) . '" class="erp-file-chip-name ' . ($isImg ? 'btn-preview-receipt' : '') . '" target="_blank" data-src="' . base_url($bp->upload_file) . '" data-title="' . basename($bp->upload_file) . '">' . basename($bp->upload_file) . '</a>';
                                    echo '</div>';
                                    echo '<div class="erp-file-chip-actions">';
                                    echo '<button type="button" class="erp-file-chip-btn del_bukti_penggunaan" data-id="' . $bp->id . '" title="Hapus"><i class="fa fa-trash"></i></button>';
                                    echo '</div>';
                                    echo '</div>';
                                }
                                echo '</div>';
                            }
                            if ($item['qty_kasbon'] > 0 && $item['nominal_kasbon'] > 0) {
                                echo '<input type="file" id="input-bukti-file-' . $item['no'] . '" class="input-bukti-file" data-no="' . $item['no'] . '" multiple style="display: none;">';
                                echo '<button type="button" class="erp-dropzone-box dropzone-item" id="dropzone-bukti-' . $item['no'] . '" data-no="' . $item['no'] . '" aria-label="Tambah nota item ' . $item['no'] . '">';
                                echo '<i class="fa fa-cloud-upload"></i>';
                                echo '<span class="erp-dropzone-text">Tambah Nota Baru</span>';
                                echo '<span class="erp-dropzone-subtext">JPG, PNG, PDF (Max 2MB)</span>';
                                echo '</button>';
                                echo '<div id="container-bukti-list-' . $item['no'] . '" class="erp-file-chips"></div>';
                                echo '<span class="nobon" id="nobon-' . $item['no'] . '" style="display: none;">Bukti nota wajib diisi</span>';
                            } else if (!isset($list_bukti_penggunaan_by_detail[$item['id_detail_kasbon']])) {
                                echo '<div class="text-center text-muted" style="font-size: 11px; padding: 5px;">-</div>';
                            }
                            echo '</td>';

                            // Keterangan
                            echo '<td width="180">';
                            echo '<textarea aria-label="Catatan pengeluaran item ' . $item['no'] . '" class="form-control erp-textarea-sm" name="detail_subcont[' . $item['no'] . '][keterangan]" rows="3" placeholder="Catatan pengeluaran...">' . html_escape($keterangan) . '</textarea>';
                            echo '</td>';

                            echo '</tr>';

                            $ttl_kasbon += ($item['qty_kasbon'] * $item['nominal_kasbon']);
                            $ttl_expense_report += ($total_expense);
                            $count_no++;
                        }

                        $kelebihan_kasbon = ($ttl_kasbon > $ttl_expense_report) ? ($ttl_kasbon - $ttl_expense_report) : 0;
                        $kelebihan_expense = ($ttl_expense_report > $ttl_kasbon) ? ($ttl_expense_report - $ttl_kasbon) : 0;
                        ?>
                        <?php
                        if ((string) ($header->tipe) === '2') {
                            $placeholderExisting = array_map(function ($row) { return strtolower($row['nm_item']); }, $datalist_item);
                            foreach (['Tiket pesawat', 'Sewa kendaraan'] as $placeholderName) {
                                if (in_array(strtolower($placeholderName), $placeholderExisting, true)) {
                                    continue;
                                }
                                echo '<tr class="erp-row-placeholder" style="opacity: 0.6;"><td class="text-center">-</td><td><strong>' . html_escape($placeholderName) . '</strong></td>'
                                    . str_repeat('<td class="text-right">0.00</td>', 6)
                                    . '<td class="text-center text-muted">-</td><td class="text-center text-muted">-</td></tr>';
                            }
                        }
                        ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="4" class="text-right font-bold">Total Pagu Kasbon</td>
                            <td class="text-right font-bold col_ttl_kasbon" style="color: var(--erp-slate-800);"><?= number_format($ttl_kasbon, 2) ?></td>
                            <td colspan="2" class="text-right font-bold">Total Realisasi Expense</td>
                            <td class="text-right font-bold col_ttl_expense_report" style="color: var(--erp-primary);"><?= number_format($ttl_expense_report, 2) ?></td>
                            <td class="text-right font-bold">Selisih Netto:</td>
                            <td class="text-right font-bold col_selisih"><?= number_format($ttl_kasbon - $ttl_expense_report, 2) ?></td>
                        </tr>
                    </tfoot>
                </table>
            </div>

            <!-- Hidden control fields for backend compatibility -->
            <input type="hidden" name="kelebihan_kasbon" class="kelebihan_kasbon" value="<?= number_format($kelebihan_kasbon, 2) ?>">
            <input type="hidden" name="kelebihan_expense" class="kelebihan_expense" value="<?= number_format($kelebihan_expense, 2) ?>">
            <input type="hidden" name="kontrol" class="kontrol" value="0">

            <!-- Flow Policy & Keterangan Kurang Bayar -->
            <div style="margin-top: 18px; padding: 12px 16px; background: var(--erp-slate-50); border: 1px solid var(--erp-slate-200); border-radius: var(--erp-radius);">
                <div class="row">
                    <div class="col-md-7">
                        <span class="erp-meta-label" style="display: block; margin-bottom: 6px;"><i class="fa fa-info-circle text-primary"></i> Ketentuan Penyelesaian Selisih Kasbon</span>
                        <p style="font-size: 12px; color: var(--erp-slate-600); line-height: 1.5; margin: 0;">
                            Jika timbul <strong>Kelebihan Kasbon (Refund)</strong>, sisa uang dikembalikan oleh konsultan setelah laporan diverifikasi melalui tab <em>Pengembalian Kasbon</em>.<br>
                            Jika timbul <strong>Kekurangan Kasbon (Reimburse)</strong>, kekurangan dana otomatis masuk ke antrean <em>Request Payment Finance</em> untuk diganti ke rekening konsultan.
                        </p>
                    </div>
                    <div class="col-md-5">
                        <div class="form-group" style="margin-bottom: 0;">
                            <label class="erp-meta-label" style="margin-bottom: 4px;">Keterangan Kurang Bayar / Alasan Selisih <span class="text-danger" title="Wajib diisi jika ada selisih">*</span></label>
                            <textarea class="form-control erp-textarea-sm" name="keterangan_kurang_bayar" rows="3" placeholder="Wajib diisi jika terjadi lebih kasbon atau lebih expense: tuliskan alasan selisih..."><?= html_escape($header->keterangan_kurang_bayar ?? '') ?></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 4. Journal Accounting Preview Card -->
    <div class="erp-card">
        <div class="erp-card-header">
            <h4 class="erp-card-title">
                <i class="fa fa-book"></i> Preview Jurnal Akuntansi Expense <span class="erp-badge erp-badge-neutral" style="margin-left: 8px;">Preview: jurnal terbentuk setelah approval</span>
            </h4>
        </div>
        <div class="erp-card-body" style="padding: 14px;">
            <div class="table-responsive">
                <table class="table table-bordered erp-table">
                    <thead>
                        <tr>
                            <th class="text-center" width="120">Tanggal Jurnal</th>
                            <th class="text-center" width="100">COA</th>
                            <th>Nama Company</th>
                            <th>Nama Account</th>
                            <th>Deskripsi</th>
                            <th class="text-right" width="140">Debit (Rp)</th>
                            <th class="text-right" width="140">Credit (Rp)</th>
                        </tr>
                    </thead>
                    <tbody class="tbody_jurnal"></tbody>
                    <tfoot>
                        <tr>
                            <th colspan="5" class="text-center">Total Balancing Jurnal</th>
                            <th class="text-right ttl_debit font-bold">0.00</th>
                            <th class="text-right ttl_kredit font-bold">0.00</th>
                        </tr>
                    </tfoot>
                </table>
            </div>

            <input type="hidden" name="ttl_debit">
            <input type="hidden" name="ttl_kredit">
        </div>
    </div>

    <!-- 5. Jurnal PPh 21 Card (Optional) -->
    <div class="erp-card <?= $hide_jurnal_pph21 ?>">
        <div class="erp-card-header">
            <h4 class="erp-card-title">
                <i class="fa fa-percent"></i> Jurnal Pajak PPh 21
            </h4>
        </div>
        <div class="erp-card-body" style="padding: 14px;">
            <div class="table-responsive">
                <table class="table table-bordered erp-table">
                    <thead>
                        <tr>
                            <th class="text-center" width="120">Tanggal Jurnal</th>
                            <th class="text-center" width="100">COA</th>
                            <th>Nama Company</th>
                            <th>Nama Account</th>
                            <th>Deskripsi</th>
                            <th class="text-right" width="140">Debit (Rp)</th>
                            <th class="text-right" width="140">Credit (Rp)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?= $list_jurnal_pph21['hasil'] ?? '' ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="5" class="text-center">Total Balancing PPh 21</th>
                            <th class="text-right jurnal_pph_debit font-bold"><?= number_format(0) ?></th>
                            <th class="text-right jurnal_pph_kredit font-bold"><?= number_format($list_jurnal_pph21['nominal_pph'] ?? 0) ?></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>

    <!-- 6. Form Submission Footer -->
    <div style="margin-top: 25px; margin-bottom: 40px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 10px;">
        <a href="<?= base_url('expense_report_project/add/' . urlencode(str_replace('/', '|', $id_spk_budgeting))) ?>" class="erp-btn erp-btn-default">
            <i class="fa fa-arrow-left"></i> Kembali ke Kategori SPK
        </a>
        <button type="submit" class="erp-btn erp-btn-success" style="padding: 8px 24px; font-size: 13px;">
            <i class="fa fa-save"></i> Perbarui Laporan Expense
        </button>
    </div>
</form>

<!-- Modal Lightbox Pratinjau Nota Gambar -->
<div class="modal fade" id="erpReceiptModal" tabindex="-1" role="dialog" aria-labelledby="erpReceiptModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="erpReceiptModalLabel"><i class="fa fa-picture-o text-primary"></i> Pratinjau Bukti Nota</h4>
            </div>
            <div class="modal-body text-center">
                <img id="erpReceiptModalImg" src="" class="erp-receipt-preview-img" alt="Pratinjau Nota" style="display: none;">
                <div id="erpReceiptModalEmpty" class="text-muted" style="padding: 30px;">
                    <i class="fa fa-file-text-o" style="font-size: 32px; margin-bottom: 8px; color: #94a3b8; display: block;"></i>
                    Tidak dapat menampilkan pratinjau langsung untuk file ini.
                </div>
            </div>
            <div class="modal-footer">
                <a id="erpReceiptModalDownload" href="#" target="_blank" class="erp-btn erp-btn-sm erp-btn-default"><i class="fa fa-external-link"></i> Buka File Asli</a>
                <button type="button" class="erp-btn erp-btn-sm erp-btn-default" data-dismiss="modal">Tutup</button>
            </div>
        </div>
    </div>
</div>

<script src="<?= base_url('assets/js/autoNumeric.js'); ?>"></script>
<script src="https://cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script>
    $(document).ready(function() {
        $('.auto_num').autoNumeric();
        $('.select2').select2({
            width: '100%'
        });

        hitung_total(1);
        set_jurnal();
    });

    var selectedBuktiFilesPerItem = {};

    $(document).on('click', '.dropzone-item', function(e) {
        if ($(e.target).closest('.btn-remove-selected-bukti-item').length === 0) {
            var no = $(this).data('no');
            $('#input-bukti-file-' + no).click();
        }
    });

    $(document).on('change', '.input-bukti-file', function() {
        var no = $(this).data('no');
        if (!selectedBuktiFilesPerItem[no]) {
            selectedBuktiFilesPerItem[no] = [];
        }
        var files = this.files;
        for (var i = 0; i < files.length; i++) {
            selectedBuktiFilesPerItem[no].push(files[i]);
        }
        this.value = '';
        renderSelectedBuktiItem(no);
    });

    $(document).on('dragover dragenter', '.dropzone-item', function(e) {
        e.preventDefault();
        e.stopPropagation();
        $(this).addClass('dragover');
    });

    $(document).on('dragleave dragend drop', '.dropzone-item', function(e) {
        e.preventDefault();
        e.stopPropagation();
        $(this).removeClass('dragover');
    });

    $(document).on('drop', '.dropzone-item', function(e) {
        var no = $(this).data('no');
        var files = e.originalEvent.dataTransfer.files;
        if (files && files.length > 0) {
            if (!selectedBuktiFilesPerItem[no]) {
                selectedBuktiFilesPerItem[no] = [];
            }
            for (var i = 0; i < files.length; i++) {
                selectedBuktiFilesPerItem[no].push(files[i]);
            }
            renderSelectedBuktiItem(no);
        }
    });

    function formatBytes(bytes, decimals = 2) {
        if (bytes === 0) return '0 Bytes';
        const k = 1024;
        const dm = decimals < 0 ? 0 : decimals;
        const sizes = ['Bytes', 'KB', 'MB', 'GB'];
        const i = Math.floor(Math.log(bytes) / Math.log(k));
        return parseFloat((bytes / Math.pow(k, i)).toFixed(dm)) + ' ' + sizes[i];
    }

    function renderSelectedBuktiItem(no) {
        var files = selectedBuktiFilesPerItem[no] || [];
        var html = '';
        if (files.length > 0) {
            for (var i = 0; i < files.length; i++) {
                var file = files[i];
                var isImage = file.type.match('image.*');
                html += '<div class="erp-file-chip">' +
                    '<div class="erp-file-chip-info" title="' + file.name + ' (' + formatBytes(file.size) + ')">' +
                    '<i class="fa ' + (isImage ? 'fa-file-image-o' : 'fa-file-pdf-o') + '"></i> ' +
                    '<span class="erp-file-chip-name">' + file.name + '</span>' +
                    '</div>' +
                    '<div class="erp-file-chip-actions">' +
                    '<small class="text-muted">' + formatBytes(file.size) + '</small>' +
                    '<button type="button" class="erp-file-chip-btn btn-remove-selected-bukti-item" data-no="' + no + '" data-index="' + i + '" title="Hapus"><i class="fa fa-trash"></i></button>' +
                    '</div>' +
                    '</div>';
            }
        }
        $('#container-bukti-list-' + no).html(html);
    }

    $(document).on('click', '.btn-remove-selected-bukti-item', function(e) {
        e.stopPropagation();
        var no = $(this).data('no');
        var index = $(this).data('index');
        if (selectedBuktiFilesPerItem[no]) {
            selectedBuktiFilesPerItem[no].splice(index, 1);
            renderSelectedBuktiItem(no);
        }
    });

    $(document).on('click', '.btn-preview-receipt', function(e) {
        e.preventDefault();
        var src = $(this).data('src') || $(this).attr('href');
        var title = $(this).data('title') || 'Bukti Nota';
        $('#erpReceiptModalLabel').html('<i class="fa fa-picture-o text-primary"></i> ' + title);
        $('#erpReceiptModalImg').attr('src', src).show();
        $('#erpReceiptModalEmpty').hide();
        $('#erpReceiptModalDownload').attr('href', src);
        $('#erpReceiptModal').modal('show');
    });

    $(document).on('click', '.del_bukti_penggunaan', function() {
        var id = $(this).data('id');

        Swal.fire({
            icon: 'warning',
            title: 'Hapus Bukti Pengeluaran?',
            text: 'File bukti ini akan dihapus secara permanen!',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Ya, Hapus!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'del_bukti_penggunaan',
                    data: {
                        'id': id
                    },
                    cache: false,
                    dataType: 'json',
                    success: function(result) {
                        if (result.status == '1') {
                            Swal.fire({
                                icon: 'success',
                                title: 'Berhasil!',
                                text: 'File bukti berhasil dihapus.'
                            }).then(() => {
                                $('#row-bukti-' + id).fadeOut(300, function() { $(this).remove(); });
                            });
                        } else {
                            Swal.fire({
                                icon: 'warning',
                                title: 'Gagal!',
                                text: 'Gagal menghapus file bukti.'
                            });
                        }
                    },
                    error: function(result) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error!',
                            text: 'Silakan coba lagi beberapa saat lagi.'
                        });
                    }
                });
            }
        });
    });

    function refreshNobon() {
        $('input[name^="detail_subcont["][name$="[id_detail_kasbon]"]').each(function() {
            var no = $(this).attr('name').match(/detail_subcont\[(\d+)\]/)[1];
            var tot = get_num($('input[name="detail_subcont[' + no + '][qty_expense]"]').val()) * get_num($('input[name="detail_subcont[' + no + '][nominal_expense]"]').val());
            var has = (selectedBuktiFilesPerItem[no] && selectedBuktiFilesPerItem[no].length > 0) || $(this).closest('tr').find('[id^="row-bukti-"]').length > 0;
            var missing = tot > 0 && !has && $('#dropzone-bukti-' + no).length > 0;
            $('#nobon-' + no).toggle(missing);
            if (!missing) { $(this).closest('tr').removeClass('rowerr'); }
        });
    }
    $(document).on('change input keyup', '.input-bukti-file, .qty_expense, .nominal_expense', function() { setTimeout(refreshNobon, 60); });
    $(document).on('click', '.btn-remove-selected-bukti-item, .del_bukti_penggunaan', function() { setTimeout(refreshNobon, 400); });
    $(document).ready(function() { setTimeout(refreshNobon, 200); });


    function validateExpenseForm() {
        var message = '';
        if ($.trim($('textarea[name="keterangan_laporan"]').val()) === '') {
            message = 'Keterangan Laporan wajib diisi.';
            $('textarea[name="keterangan_laporan"]').focus();
        }
        var ttl_kasbon = 0;
        var ttl_expense = 0;

        $('input[name^="detail_subcont["][name$="[id_detail_kasbon]"]').each(function() {
            var no = $(this).attr('name').match(/detail_subcont\[(\d+)\]/)[1];
            var qty_kasbon = get_num($('input[name="detail_subcont[' + no + '][qty_kasbon]"]').val());
            var nominal_kasbon = get_num($('input[name="detail_subcont[' + no + '][nominal_kasbon]"]').val());
            var qty_expense = get_num($('input[name="detail_subcont[' + no + '][qty_expense]"]').val());
            var nominal_expense = get_num($('input[name="detail_subcont[' + no + '][nominal_expense]"]').val());

            ttl_kasbon += (qty_kasbon * nominal_kasbon);
            ttl_expense += (qty_expense * nominal_expense);

            if (message === '' && qty_expense > 0 && nominal_expense > 0) {
                var has_new_file = selectedBuktiFilesPerItem[no] && selectedBuktiFilesPerItem[no].length > 0;
                var has_saved_file = $(this).closest('tr').find('[id^="row-bukti-"]').length > 0;
                if (!has_new_file && !has_saved_file) {
                    var nm_item = $.trim($(this).closest('tr').find('td:nth-child(2)').text());
                    message = 'Bukti nota wajib diunggah untuk item: ' + nm_item;
                    $(this).closest('tr').addClass('rowerr');
                }
            }
        });

        if (message === '' && ttl_expense <= 0) {
            message = 'Total realisasi harus lebih dari 0.';
        }

        if (message === '' && Math.round(ttl_kasbon * 100) !== Math.round(ttl_expense * 100) && $.trim($('textarea[name="keterangan_kurang_bayar"]').val()) === '') {
            message = 'Keterangan Kurang Bayar / Alasan Selisih wajib diisi karena terdapat selisih antara kasbon dan expense.';
            $('textarea[name="keterangan_kurang_bayar"]').focus();
        }

        if (message !== '') {
            Swal.fire({
                icon: 'warning',
                title: 'Data Belum Lengkap',
                text: message
            });
            return false;
        }

        return true;
    }

    $(document).on('submit', '#frm-data', function(e) {
        e.preventDefault();

        if (!validateExpenseForm()) {
            return false;
        }

        Swal.fire({
            icon: 'warning',
            title: 'Perbarui Laporan Expense?',
            text: 'Data laporan pengeluaran aktual akan diperbarui.',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Ya, Perbarui!'
        }).then((result) => {
            if (result.isConfirmed) {
                var formData = new FormData($('#frm-data')[0]);

                for (var no in selectedBuktiFilesPerItem) {
                    var fileList = selectedBuktiFilesPerItem[no];
                    for (var i = 0; i < fileList.length; i++) {
                        formData.append('bukti_penggunaan_' + no + '[]', fileList[i]);
                    }
                }

                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'update_expense_report_subcont',
                    data: formData,
                    cache: false,
                    processData: false,
                    contentType: false,
                    dataType: 'JSON',
                    success: function(result) {
                        if (result.status == '1') {
                            Swal.fire({
                                icon: 'success',
                                title: 'Berhasil!',
                                text: result.pesan
                            }).then(() => {
                                window.location.href = siteurl + active_controller + 'add/' + '<?= urlencode(str_replace('/', '|', $id_spk_budgeting)) ?>';
                            });
                        } else {
                            Swal.fire({
                                icon: 'warning',
                                title: 'Gagal!',
                                text: result.pesan
                            });
                        }
                    },
                    error: function(result) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error!',
                            text: 'Terjadi kesalahan sistem, silakan coba lagi.'
                        });
                    }
                });
            }
        });
    });

    function get_num(nilai = null) {
        if (nilai !== '' && nilai !== null) {
            nilai = nilai.split(',').join('');
            nilai = parseFloat(nilai);
        } else {
            nilai = 0;
        }
        return nilai;
    }

    function number_format(number, decimals, dec_point, thousands_sep) {
        number = (number + '').replace(/[^0-9+\-Ee.]/g, '');
        var n = !isFinite(+number) ? 0 : +number,
            prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
            sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
            dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
            s = '',
            toFixedFix = function(n, prec) {
                var k = Math.pow(10, prec);
                return '' + Math.round(n * k) / k;
            };
        s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
        if (s[0].length > 3) {
            s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
        }
        if ((s[1] || '').length < prec) {
            s[1] = s[1] || '';
            s[1] += new Array(prec - s[1].length + 1).join('0');
        }
        return s.join(dec);
    }

    function hitung_total(no) {
        var count_no = "<?= $count_no ?>";

        var ttl_expense_report = 0;
        var ttl_kasbon = 0;
        var selisih = 0;

        for (i = 1; i <= count_no; i++) {
            var qty_kasbon = get_num($('input[name="detail_subcont[' + i + '][qty_kasbon]"]').val());
            var nominal_kasbon = get_num($('input[name="detail_subcont[' + i + '][nominal_kasbon]"]').val());

            var qty_expense = get_num($('input[name="detail_subcont[' + i + '][qty_expense]"]').val());
            if (qty_expense <= 0) {
                qty_expense = 0;
            }
            var nominal_expense = get_num($('input[name="detail_subcont[' + i + '][nominal_expense]"]').val());

            var total_expense = parseFloat(qty_expense * nominal_expense);

            $('input[name="detail_subcont[' + i + '][total_expense]"]').val(number_format(total_expense, 2));

            ttl_expense_report += (qty_expense * nominal_expense);
            ttl_kasbon += (qty_kasbon * nominal_kasbon);

            selisih += ((qty_kasbon * nominal_kasbon) - (qty_expense * nominal_expense));
        }

        $('.col_ttl_expense_report').html(number_format(ttl_expense_report, 2));
        $('.col_ttl_kasbon').html(number_format(ttl_kasbon, 2));
        $('.col_selisih').html(number_format(selisih, 2));
        $('input[name="kontrol"]').val(number_format(selisih, 2));

        hitung_kelebihan_dan_control();
        set_jurnal();
    }

    function set_jurnal() {
        var count_no = parseInt(<?= $count_no ?>)
        var id_header = $('input[name="id_header"]').val();

        var kelebihan_kasbon = get_num($('input[name="kelebihan_kasbon"]').val());
        var kelebihan_expense = get_num($('input[name="kelebihan_expense"]').val());
        var kontrol = get_num($('input[name="kontrol"]').val());

        var total_kasbon = get_num($('.col_ttl_kasbon').html());
        var total_expense = get_num($('.col_ttl_expense_report').html());

        var id_bank = $('select[name="bank"]').val();
        var id_penawaran = "<?= $id_penawaran ?>";

        var arr_total_expense = {};
        for (i = 1; i <= count_no; i++) {
            var id_detail_kasbon = $('input[name="detail_subcont[' + i + '][id_detail_kasbon]"]').val();
            var total_expense = get_num($('input[name="detail_subcont[' + i + '][total_expense]"]').val());
            arr_total_expense[id_detail_kasbon] = total_expense;
        }

        $.ajax({
            type: 'post',
            url: siteurl + active_controller + 'set_jurnal_expense',
            data: {
                'kelebihan_kasbon': kelebihan_kasbon,
                'kelebihan_expense': kelebihan_expense,
                'kontrol': kontrol,
                'total_kasbon': total_kasbon,
                'total_expense': total_expense,
                'id_penawaran': id_penawaran,
                'id_bank': id_bank,
                'id_header': id_header,
                'id_expense': $('input[name="id_expense"]').val(),
                'arr_total_expense': arr_total_expense
            },
            cache: false,
            dataType: 'json',
            success: function(result) {
                $('.tbody_jurnal').html(result.hasil);
                $('.ttl_debit').html(number_format(result.ttl_debit, 2));
                $('.ttl_kredit').html(number_format(result.ttl_kredit, 2));
            }
        });
    }

    function hitung_kelebihan_dan_control() {
        var total_kasbon = get_num($('.col_ttl_kasbon').html());
        var total_expense = get_num($('.col_ttl_expense_report').html());

        var kelebihan_kasbon = 0;
        var kelebihan_expense = 0;

        if (total_kasbon > total_expense) {
            kelebihan_kasbon = (total_kasbon - total_expense);
        }
        if (total_expense > total_kasbon) {
            kelebihan_expense = (total_expense - total_kasbon);
        }

        $('input[name="kelebihan_kasbon"]').val(number_format(kelebihan_kasbon, 2));
        $('input[name="kelebihan_expense"]').val(number_format(kelebihan_expense, 2));

        // Update Stat Summary Cards Real-Time
        $('#card-stat-kasbon').html('Rp ' + number_format(total_kasbon, 2));
        $('#card-stat-expense').html('Rp ' + number_format(total_expense, 2));

        var wrapper = $('#card-stat-selisih-wrapper');
        var badge = $('#card-stat-selisih-badge');
        var title = $('#card-stat-selisih-title');
        var valEl = $('#card-stat-selisih');
        var subtext = $('#card-stat-selisih-subtext');

        wrapper.removeClass('selisih-refund selisih-reimburse selisih-pas');
        badge.removeClass('erp-badge-success erp-badge-danger erp-badge-info erp-badge-neutral');

        if (kelebihan_kasbon > 0) {
            wrapper.addClass('selisih-refund');
            badge.addClass('erp-badge-success').html('<span class="erp-badge-dot"></span> REFUND (Sisa Kasbon)');
            title.html('Kelebihan Uang Muka');
            valEl.html('Rp ' + number_format(kelebihan_kasbon, 2));
            subtext.html('<i class="fa fa-arrow-down"></i> Sisa kasbon wajib dikembalikan setelah laporan disetujui');
        } else if (kelebihan_expense > 0) {
            wrapper.addClass('selisih-reimburse');
            badge.addClass('erp-badge-danger').html('<span class="erp-badge-dot"></span> REIMBURSE (Kurang Bayar)');
            title.html('Kekurangan Dana');
            valEl.html('Rp ' + number_format(kelebihan_expense, 2));
            subtext.html('<i class="fa fa-arrow-up"></i> Kekurangan otomatis masuk Request Payment Finance untuk diganti');
        } else {
            wrapper.addClass('selisih-pas');
            badge.addClass('erp-badge-info').html('<span class="erp-badge-dot"></span> BALANCE');
            title.html('Status Selisih');
            valEl.html('Rp 0.00');
            subtext.html('Pengeluaran aktual tepat sama dengan pagu kasbon');
        }
    }
</script>
