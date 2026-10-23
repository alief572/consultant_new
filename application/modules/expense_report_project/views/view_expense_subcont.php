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

<input type="hidden" name="id_expense" value="<?= $header->id ?>">
<input type="hidden" name="id_header" value="<?= $id_header ?>">
<input type="hidden" name="id_spk_budgeting" value="<?= $id_spk_budgeting ?>">
<input type="hidden" name="id_spk_penawaran" value="<?= $id_spk_penawaran ?>">
<input type="hidden" name="id_penawaran" value="<?= $id_penawaran ?>">

<!-- 1. SPK Project Information Card -->
<div class="erp-card">
    <div class="erp-card-header">
        <h4 class="erp-card-title">
            <i class="fa fa-eye"></i> Detail Laporan Expense: <span class="text-primary"><?= html_escape($header->id) ?></span>
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
            <div class="alert alert-danger <?= $enb_reject_reason ?>" style="border-radius: 4px; margin-bottom: 16px;">
                <i class="fa fa-exclamation-circle"></i> <strong>Catatan Penolakan:</strong> <?= html_escape($header->reject_reason) ?>
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
    </div>
</div>

<!-- 2. Stat Summary Cards -->
<?php
$selisih_val = (float) ($header->selisih ?? 0);
$stat_card_class = 'selisih-pas';
$stat_badge_class = 'erp-badge-neutral';
$stat_badge_text = 'BALANCE';
$stat_title_text = 'Status Selisih';
$stat_subtext = 'Pengeluaran aktual tepat sama dengan pagu kasbon';

if ($selisih_val > 0) {
    $stat_card_class = 'selisih-refund';
    $stat_badge_class = 'erp-badge-success';
    $stat_badge_text = 'REFUND (Sisa Kasbon)';
    $stat_title_text = 'Kelebihan Uang Muka';
    $stat_subtext = 'Sisa kasbon dikembalikan setelah laporan disetujui';
} elseif ($selisih_val < 0) {
    $stat_card_class = 'selisih-reimburse';
    $stat_badge_class = 'erp-badge-danger';
    $stat_badge_text = 'REIMBURSE (Kurang Bayar)';
    $stat_title_text = 'Kekurangan Dana';
    $stat_subtext = 'Kekurangan masuk ke Request Payment Finance untuk diganti';
}
?>

<div class="erp-stat-deck">
    <div class="erp-stat-card kasbon">
        <div class="erp-stat-label">
            <span>Total Kasbon Awal</span>
            <i class="fa fa-ticket text-muted"></i>
        </div>
        <h3 class="erp-stat-value" id="card-stat-kasbon">Rp <?= number_format($header->total_kasbon ?? 0, 2) ?></h3>
        <div class="erp-stat-subtext">Pagu kasbon yang telah dicairkan</div>
    </div>

    <div class="erp-stat-card realisasi">
        <div class="erp-stat-label">
            <span>Total Realisasi Aktual</span>
            <i class="fa fa-calculator text-primary"></i>
        </div>
        <h3 class="erp-stat-value" id="card-stat-expense">Rp <?= number_format($header->total_expense_report ?? 0, 2) ?></h3>
        <div class="erp-stat-subtext">Rincian pengeluaran fisik yang dilaporkan</div>
    </div>

    <div class="erp-stat-card <?= $stat_card_class ?>">
        <div class="erp-stat-label">
            <span><?= $stat_title_text ?></span>
            <span class="erp-badge <?= $stat_badge_class ?>">
                <span class="erp-badge-dot"></span> <?= $stat_badge_text ?>
            </span>
        </div>
        <h3 class="erp-stat-value">Rp <?= number_format(abs($selisih_val), 2) ?></h3>
        <div class="erp-stat-subtext"><?= $stat_subtext ?></div>
    </div>
</div>

<!-- 3. Items Detail Table Card (Read-Only) -->
<div class="erp-card">
    <div class="erp-card-header">
        <h4 class="erp-card-title">
            <i class="fa fa-list-ul"></i> Rincian Item Realisasi: <?= html_escape($title_header) ?>
        </h4>
        <div style="font-size: 11px; color: var(--erp-slate-500);">
            <i class="fa fa-lock"></i> Mode Pratinjau (Read-Only)
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
                        <th class="text-center th-expense-group" colspan="3"><i class="fa fa-check-circle-o"></i> Expense Report (Realisasi)</th>
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
                        $qty_expense = (isset($datalist_item_expense[$item['id_detail_kasbon']])) ? $datalist_item_expense[$item['id_detail_kasbon']]['qty_expense'] : 0;
                        $nominal_expense = (isset($datalist_item_expense[$item['id_detail_kasbon']])) ? $datalist_item_expense[$item['id_detail_kasbon']]['nominal_expense'] : 0;
                        $total_expense = (isset($datalist_item_expense[$item['id_detail_kasbon']])) ? $datalist_item_expense[$item['id_detail_kasbon']]['total_expense'] : 0;
                        $keterangan = (isset($datalist_item_expense[$item['id_detail_kasbon']])) ? $datalist_item_expense[$item['id_detail_kasbon']]['keterangan'] : '';

                        echo '<tr>';
                        echo '<td class="text-center font-bold">' . $item['no'] . '<input type="hidden" name="detail_subcont[' . $item['no'] . '][id_detail_kasbon]" value="' . $item['id_detail_kasbon'] . '"></td>';
                        echo '<td width="180"><strong>' . html_escape($item['nm_item']) . '</strong></td>';

                        // Kasbon Block
                        echo '<td class="text-center col-kasbon-tint">' . number_format($item['qty_kasbon'], 2) . '</td>';
                        echo '<td class="text-right col-kasbon-tint">' . number_format($item['nominal_kasbon'], 2) . '</td>';
                        echo '<td class="text-right col-kasbon-tint font-bold">' . number_format($item['nominal_kasbon'] * $item['qty_kasbon'], 2) . '</td>';

                        // Expense Block
                        echo '<td class="text-center col-expense-input">' . number_format($qty_expense, 2) . '</td>';
                        echo '<td class="text-right col-expense-input">' . number_format($nominal_expense, 2) . '</td>';
                        echo '<td class="text-right col-expense-input font-bold">' . number_format($total_expense, 2) . '<input type="hidden" name="detail_subcont[' . $item['no'] . '][total_expense]" value="' . $total_expense . '"></td>';

                        // Bukti Penggunaan
                        echo '<td width="220" style="vertical-align: top;">';
                        if (isset($list_bukti_penggunaan_by_detail[$item['id_detail_kasbon']]) && !empty($list_bukti_penggunaan_by_detail[$item['id_detail_kasbon']])) {
                            echo '<div class="erp-file-chips">';
                            foreach ($list_bukti_penggunaan_by_detail[$item['id_detail_kasbon']] as $bp) {
                                $ext = strtolower(pathinfo($bp->upload_file, PATHINFO_EXTENSION));
                                $isImg = in_array($ext, ['jpg', 'jpeg', 'png', 'gif', 'webp']);
                                echo '<div class="erp-file-chip">';
                                echo '<div class="erp-file-chip-info" title="' . basename($bp->upload_file) . '">';
                                echo '<i class="fa ' . ($isImg ? 'fa-file-image-o text-primary' : 'fa-file-pdf-o text-danger') . '"></i> ';
                                echo '<a href="' . base_url($bp->upload_file) . '" class="erp-file-chip-name ' . ($isImg ? 'btn-preview-receipt' : '') . '" target="_blank" data-src="' . base_url($bp->upload_file) . '" data-title="' . basename($bp->upload_file) . '">' . basename($bp->upload_file) . '</a>';
                                echo '</div>';
                                echo '<div class="erp-file-chip-actions">';
                                if ($isImg) {
                                    echo '<button type="button" class="erp-file-chip-btn preview btn-preview-receipt" data-src="' . base_url($bp->upload_file) . '" data-title="' . basename($bp->upload_file) . '" title="Pratinjau Nota"><i class="fa fa-eye"></i></button>';
                                }
                                echo '<a href="' . base_url($bp->upload_file) . '" target="_blank" class="erp-file-chip-btn" title="Unduh File"><i class="fa fa-download"></i></a>';
                                echo '</div>';
                                echo '</div>';
                            }
                            echo '</div>';
                        } else {
                            echo '<span class="text-muted" style="font-size: 11px;">-</span>';
                        }
                        echo '</td>';

                        // Keterangan
                        echo '<td width="180">';
                        echo '<span style="font-size: 11px; color: var(--erp-slate-700);">' . (!empty($keterangan) ? nl2br(html_escape($keterangan)) : '<em class="text-muted">-</em>') . '</span>';
                        echo '</td>';

                        echo '</tr>';

                        $ttl_kasbon += ($item['qty_kasbon'] * $item['nominal_kasbon']);
                        $ttl_expense_report += ($total_expense);
                        $count_no++;
                    }

                    $kelebihan_kasbon = ($ttl_kasbon > $ttl_expense_report) ? ($ttl_kasbon - $ttl_expense_report) : 0;
                    $kelebihan_expense = ($ttl_expense_report > $ttl_kasbon) ? ($ttl_expense_report - $ttl_kasbon) : 0;
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="4" class="text-right font-bold">Total Pagu Kasbon</td>
                        <td class="text-right font-bold col_ttl_kasbon" style="color: var(--erp-slate-800);"><?= number_format($ttl_kasbon, 2) ?></td>
                        <td colspan="2" class="text-right font-bold">Total Realisasi Expense</td>
                        <td class="text-right font-bold col_ttl_expense_report" style="color: var(--erp-primary);"><?= number_format($ttl_expense_report, 2) ?></td>
                        <td class="text-right font-bold">Selisih Netto:</td>
                        <td class="text-right font-bold col_selisih"><?= number_format($header->selisih, 2) ?></td>
                    </tr>
                </tfoot>
            </table>
        </div>

        <!-- Flow Policy & Keterangan Kurang Bayar -->
        <div style="margin-top: 18px; padding: 12px 16px; background: var(--erp-slate-50); border: 1px solid var(--erp-slate-200); border-radius: var(--erp-radius);">
            <div class="row">
                <div class="col-md-7">
                    <span class="erp-meta-label" style="display: block; margin-bottom: 6px;"><i class="fa fa-info-circle text-primary"></i> Status Penyelesaian Selisih</span>
                    <p style="font-size: 12px; color: var(--erp-slate-600); line-height: 1.5; margin: 0;">
                        <?php if ($selisih_val > 0): ?>
                            Terdapat <strong>Kelebihan Kasbon (Refund)</strong> sebesar <strong>Rp <?= number_format($selisih_val, 2) ?></strong> yang wajib dikembalikan melalui tab <em>Pengembalian Kasbon</em>.
                        <?php elseif ($selisih_val < 0): ?>
                            Terdapat <strong>Kekurangan Kasbon (Reimburse)</strong> sebesar <strong>Rp <?= number_format(abs($selisih_val), 2) ?></strong> yang diproses melalui Request Payment Finance.
                        <?php else: ?>
                            Pagu Kasbon dan Realisasi Pengeluaran seimbang (Nol Selisih).
                        <?php endif; ?>
                    </p>
                </div>
                <div class="col-md-5">
                    <span class="erp-meta-label" style="margin-bottom: 4px;">Keterangan Kurang Bayar</span>
                    <div style="font-size: 12px; color: var(--erp-slate-700); padding: 6px; background: #ffffff; border: 1px solid var(--erp-slate-200); border-radius: 4px;">
                        <?= !empty($header->keterangan_kurang_bayar) ? nl2br(html_escape($header->keterangan_kurang_bayar)) : '<em class="text-muted">Tidak ada keterangan tambahan.</em>' ?>
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
            <i class="fa fa-book"></i> Jurnal Akuntansi Expense
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

<div style="margin-top: 25px; margin-bottom: 40px;">
    <a href="<?= base_url('expense_report_project/add/' . urlencode(str_replace('/', '|', $id_spk_budgeting))) ?>" class="erp-btn erp-btn-default">
        <i class="fa fa-arrow-left"></i> Kembali ke Kategori SPK
    </a>
</div>

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

<script>
    $(document).ready(function() {
        $('.auto_num').autoNumeric();
        set_jurnal();
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

    function set_jurnal() {
        var count_no = parseInt(<?= $count_no ?>);
        var id_header = $('input[name="id_header"]').val();

        var kelebihan_kasbon = <?= $kelebihan_kasbon ?>;
        var kelebihan_expense = <?= $kelebihan_expense ?>;
        var kontrol = <?= $header->selisih ?>;

        var total_kasbon = <?= $ttl_kasbon ?>;
        var total_expense = <?= $ttl_expense_report ?>;

        var id_bank = "<?= $header->id_bank ?>";
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
