<?php
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

$hide_jurnal_pph21 = 'd-none';
if (!empty($list_jurnal_pph21) && $list_jurnal_pph21['nominal_pph'] > 0) {
    $hide_jurnal_pph21 = '';
}
?>

<link rel="stylesheet" href="https://cdn.datatables.net/2.1.7/css/dataTables.dataTables.min.css">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<link rel="stylesheet" href="<?= base_url('assets/css/expense_report_project.css') ?>">

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
    <input type="hidden" name="id_header" value="<?= $id_header ?>">
    <input type="hidden" name="id_spk_budgeting" value="<?= $id_spk_budgeting ?>">
    <input type="hidden" name="id_spk_penawaran" value="<?= $id_spk_penawaran ?>">
    <input type="hidden" name="id_penawaran" value="<?= $id_penawaran ?>">
    <input type="hidden" name="tipe" value="<?= $tipe ?>">

    <!-- 1. SPK Project Information Card -->
    <div class="erp-card">
        <div class="erp-card-header">
            <h4 class="erp-card-title">
                <i class="fa fa-briefcase"></i> Proyek & SPK: <span class="text-primary"><?= (isset($list_budgeting)) ? $list_budgeting->id_spk_penawaran : '' ?></span>
            </h4>
            <div>
                <a href="<?= base_url('expense_report_project/add/' . urlencode(str_replace('/', '|', $id_spk_budgeting))) ?>" class="erp-btn erp-btn-sm erp-btn-default">
                    <i class="fa fa-arrow-left"></i> Kembali ke Kategori SPK
                </a>
            </div>
        </div>
        <div class="erp-card-body">
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
        </div>
    </div>

    <!-- 2. Real-Time Stat Summary Cards -->
    <div class="erp-stat-deck">
        <!-- Card 1: Kasbon Awal -->
        <div class="erp-stat-card kasbon">
            <div class="erp-stat-label">
                <span>Total Kasbon Awal</span>
                <i class="fa fa-ticket text-muted"></i>
            </div>
            <h3 class="erp-stat-value" id="card-stat-kasbon">Rp 0.00</h3>
            <div class="erp-stat-subtext">Pagu kasbon yang telah dicairkan</div>
        </div>

        <!-- Card 2: Total Realisasi -->
        <div class="erp-stat-card realisasi">
            <div class="erp-stat-label">
                <span>Total Realisasi Aktual</span>
                <i class="fa fa-calculator text-primary"></i>
            </div>
            <h3 class="erp-stat-value" id="card-stat-expense">Rp 0.00</h3>
            <div class="erp-stat-subtext">Rincian pengeluaran fisik yang dilaporkan</div>
        </div>

        <!-- Card 3: Selisih Dinamis (Refund vs Reimburse) -->
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
                <i class="fa fa-info-circle"></i> Input Qty dan Nominal pada kolom <strong>Realisasi Aktual</strong>
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
                            <th class="text-center" rowspan="2" width="220">Bukti Nota</th>
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
                            $readonly_qty = '';
                            $readonly_nominal = '';

                            if ($item['qty_kasbon'] <= 0) {
                                $readonly_qty = 'readonly';
                            }
                            if ($item['nominal_kasbon'] <= 0) {
                                $readonly_nominal = 'readonly';
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
                            echo '<input type="text" aria-label="Kuantitas realisasi item ' . $item['no'] . '" inputmode="decimal" name="detail_subcont[' . $item['no'] . '][qty_expense]" class="form-control erp-input-sm auto_num text-right qty_expense" value="' . $item['qty_kasbon'] . '" data-no="' . $item['no'] . '" onchange="hitung_total(' . $item['no'] . ')" ' . $readonly_qty . '>';
                            echo '</td>';

                            echo '<td class="col-expense-input">';
                            echo '<input type="text" aria-label="Harga satuan realisasi item ' . $item['no'] . '" inputmode="decimal" name="detail_subcont[' . $item['no'] . '][nominal_expense]" class="form-control erp-input-sm auto_num text-right nominal_expense" value="' . $item['nominal_kasbon'] . '" data-no="' . $item['no'] . '" onchange="hitung_total(' . $item['no'] . ')" ' . $readonly_nominal . '>';
                            echo '</td>';

                            echo '<td class="col-expense-input">';
                            echo '<input type="text" name="detail_subcont[' . $item['no'] . '][total_expense]" class="form-control erp-input-sm auto_num text-right font-bold" value="' . ($item['qty_kasbon'] * $item['nominal_kasbon']) . '" data-no="' . $item['no'] . '" onchange="hitung_total(' . $item['no'] . ')" readonly>';
                            echo '</td>';

                            // Bukti Penggunaan (Modern Dropzone)
                            echo '<td width="220" style="vertical-align: top;">';
                            if ($item['qty_kasbon'] > 0 && $item['nominal_kasbon'] > 0) {
                                echo '<input type="file" id="input-bukti-file-' . $item['no'] . '" class="input-bukti-file" data-no="' . $item['no'] . '" multiple style="display: none;">';
                                echo '<button type="button" class="erp-dropzone-box dropzone-item" id="dropzone-bukti-' . $item['no'] . '" data-no="' . $item['no'] . '" aria-label="Unggah nota item ' . $item['no'] . '">';
                                echo '<i class="fa fa-cloud-upload"></i>';
                                echo '<span class="erp-dropzone-text">Unggah Nota</span>';
                                echo '<span class="erp-dropzone-subtext">JPG, PNG, PDF (Max 2MB)</span>';
                                echo '</button>';
                                echo '<div id="container-bukti-list-' . $item['no'] . '" class="erp-file-chips"></div>';
                            } else {
                                echo '<div class="text-center text-muted" style="font-size: 11px; padding: 5px;">-</div>';
                            }
                            echo '</td>';

                            // Keterangan
                            echo '<td width="180">';
                            echo '<textarea aria-label="Catatan pengeluaran item ' . $item['no'] . '" class="form-control erp-textarea-sm" name="detail_subcont[' . $item['no'] . '][keterangan]" ' . $readonly_nominal . ' rows="3" placeholder="Catatan pengeluaran..."></textarea>';
                            echo '</td>';

                            echo '</tr>';

                            $ttl_kasbon += ($item['qty_kasbon'] * $item['nominal_kasbon']);
                            $ttl_expense_report += ($item['qty_kasbon'] * $item['nominal_kasbon']);
                            $count_no++;
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
                            <td class="text-right font-bold col_selisih">0.00</td>
                        </tr>
                    </tfoot>
                </table>
            </div>

            <!-- Hidden control fields for backend compatibility -->
            <input type="hidden" name="kelebihan_kasbon" class="kelebihan_kasbon" value="0">
            <input type="hidden" name="kelebihan_expense" class="kelebihan_expense" value="0">
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
                            <label class="erp-meta-label" style="margin-bottom: 4px;">Keterangan Kurang Bayar / Alasan Selisih</label>
                            <textarea class="form-control erp-textarea-sm" name="keterangan_kurang_bayar" rows="3" placeholder="Opsional: Tuliskan penjelasan jika pengeluaran melebihi kasbon awal..."></textarea>
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
                <i class="fa fa-book"></i> Preview Jurnal Akuntansi Expense
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
                            <th class="text-right" width="140">Kredit (Rp)</th>
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
            <i class="fa fa-save"></i> Simpan Laporan Expense
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
        $('.auto_num').autoNumeric('init', {
            allowNegative: true,
            minimumValue: '-999999999',
            maximumValue: '999999999'
        });
        $('.select2').select2({
            width: '100%'
        });

        set_jurnal();
        hitung_total(1);
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

    $(document).on('submit', '#frm-data', function(e) {
        e.preventDefault();

        var tipe = "<?= $tipe; ?>";
        var url_dest = 'save_expense_report';

        Swal.fire({
            icon: 'warning',
            title: 'Simpan Laporan Expense?',
            text: 'Pastikan seluruh nota dan angka realisasi telah diinput dengan benar.',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Ya, Simpan!'
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
                    url: siteurl + active_controller + url_dest,
                    data: formData,
                    cache: false,
                    processData: false,
                    contentType: false,
                    dataType: 'JSON',
                    success: function(result) {
                        if (result.status == '1') {
                            Swal.fire({
                                icon: 'success',
                                title: 'Berhasil Disimpan!',
                                text: result.pesan
                            }).then(() => {
                                window.location.href = siteurl + active_controller + 'add/' + '<?= urlencode(str_replace('/', '|', $id_spk_budgeting)) ?>';
                            });
                        } else {
                            Swal.fire({
                                icon: 'warning',
                                title: 'Gagal Menyimpan!',
                                text: result.pesan
                            });
                        }
                    },
                    error: function(result) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Terjadi Kesalahan!',
                            text: 'Silakan coba lagi beberapa saat lagi.'
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
</script>
