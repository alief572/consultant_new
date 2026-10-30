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

$hide_jurnal_pph21 = 'd-none';
if (!empty($list_jurnal_pph21) && $list_jurnal_pph21['nominal_pph'] > 0) {
    $hide_jurnal_pph21 = '';
}
?>

<link rel="stylesheet" href="https://cdn.datatables.net/2.1.7/css/dataTables.dataTables.min.css">
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />

<style>
    .btn {
        border-radius: 10px;
    }

    .dropdown-menu {
        top: 100%;
        position: absolute;
        overflow: auto;
    }

    .pd-5 {
        padding: 5px;
    }

    .form-inline .form-control {
        width: auto;
        /* Let elements adjust automatically */
        max-width: 100%;
        /* Prevent overflow */
    }

    .form-inline {
        display: flex;
        /* Use flexbox for better alignment */
        justify-content: flex-start;
        /* Align items to the left */
        flex-wrap: nowrap;
        /* Prevent wrapping to the next line */
    }

    .top-total-project {
        width: 280px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 15px;
    }

    .pd-5 {
        padding: 5px;
    }

    .valign-top {
        vertical-align: top;
    }

    .mt-5 {
        margin-top: 5px;
    }

    .dropdown-menu {

        position: absolute;
        top: 100%;
        /* Position below the button */
        right: 0;
        /* Align with left edge */
    }

    .d-none {
        display: none;
    }
</style>


<link rel="stylesheet" href="<?= base_url('assets/css/erp_mock.css') ?>">
<?php
$noBonCount = 0;
foreach (($datalist_item ?? []) as $alurItem) {
    $alurExpense = $datalist_item_expense[$alurItem['id_detail_kasbon']] ?? null;
    if ($alurExpense && ((float) $alurExpense['qty_expense'] * (float) $alurExpense['nominal_expense']) > 0 && empty($list_bukti_penggunaan_by_detail[$alurItem['id_detail_kasbon']])) {
        $noBonCount++;
    }
}
$alurRejected = !empty($header->reject_reason) && empty($header->sts_req) && (string) ($header->sts ?? '') !== '1';
$alurApproved = (string) ($header->sts ?? '') === '1';
$alurClass = $alurApproved ? 'ok' : ($alurRejected ? 'rej' : 'cur');
$alurText = $alurApproved ? 'Approve - ' . ($header->approved_date ?? '') : ($alurRejected ? 'Reject - ' . ($header->rejected_date ?? '') . ' - ' . $header->reject_reason : 'Menunggu keputusan');
$alurBadge = $alurApproved ? ['bd-ok', 'Disetujui'] : ($alurRejected ? ['bd-rej', 'Ditolak'] : ['bd-wait', 'Menunggu Approval']);
$tipeLabels = ['1' => 'Subcont', '2' => 'Akomodasi', '3' => 'Others', '4' => 'Lab', '5' => 'Subcont Tenaga Ahli', '6' => 'Subcont Perusahaan'];
$tipeTag = (string) ($tipe ?? '') === '2' ? 'tg-akom' : 'tg-oth';
?>
<div class="mk">
<?php if ($noBonCount > 0): ?>
<div class="banner-red"><i class="fa fa-exclamation-circle"></i><div><b><?= (int) $noBonCount ?> item belum punya bukti nota.</b> Pertimbangkan reject dan minta pemohon melengkapi bukti.</div></div>
<?php endif; ?>

<div class="card">
    <div class="card-h"><span><i class="fa fa-info-circle"></i> Alur Approval</span><span class="bd <?= $alurBadge[0] ?>"><?= $alurBadge[1] ?></span></div>
    <div class="tl">
        <div class="st ok"><b>Pelapor</b>Submit &middot; <?= html_escape($header->created_date ?? '') ?><?= !empty($pelapor) ? ' &middot; ' . html_escape($pelapor) : '' ?></div>
        <div class="st <?= $alurClass ?>"><b>Approval</b><?= html_escape($alurText) ?></div>
    </div>
</div>

<div class="card">
    <div class="card-h"><span><i class="fa fa-briefcase"></i> Proyek &amp; SPK: <a><?= html_escape($list_budgeting->id_spk_penawaran ?? '') ?></a></span></div>
    <div class="spk">
        <div class="g">
            <div><div class="k">Nomor SPK</div><div class="v b"><i class="fa fa-table"></i> <?= html_escape($list_budgeting->id_spk_penawaran ?? '') ?></div></div>
            <div><div class="k">Project Leader</div><div class="v"><i class="fa fa-user-o"></i> <?= html_escape(ucfirst($list_budgeting->nm_project_leader ?? '')) ?></div></div>
            <div><div class="k">Customer</div><div class="v"><i class="fa fa-building-o"></i> <?= html_escape($list_budgeting->nm_customer ?? '') ?></div></div>
            <div><div class="k">Sales Representative</div><div class="v"><?= html_escape(ucfirst($list_budgeting->nm_sales ?? '')) ?></div></div>
            <div><div class="k">Nama Proyek / Paket</div><div class="v"><?= html_escape(!empty($list_budgeting->nm_paket) ? $list_budgeting->nm_paket : ($list_budgeting->nama_project ?? '')) ?></div></div>
            <div><div class="k">Periode Pelaksanaan</div><div class="v"><span class="cal"><i class="fa fa-calendar-o"></i> <?= html_escape(($list_budgeting->waktu_from ?? '') . ' - ' . ($list_budgeting->waktu_to ?? '')) ?></span></div></div>
        </div>
        <div class="addr"><div class="k">Alamat Proyek</div><div class="v"><?= html_escape($list_budgeting->alamat ?? '') ?></div></div>
    </div>
    <div class="fgrid">
        <div class="fg"><label>No. Expense</label><input class="in" readonly value="<?= html_escape($header->id) ?>"></div>
        <div class="fg"><label>Nomor Pengajuan (Kasbon)</label><div style="padding-top: 4px;"><span class="pill"><i class="fa fa-tag"></i> <?= html_escape($id_header) ?></span> <span class="tg <?= $tipeTag ?>"><?= html_escape($tipeLabels[(string) ($tipe ?? '')] ?? '') ?></span></div></div>
        <div class="fg"><label>Pemohon</label><input class="in" readonly value="<?= html_escape($pelapor ?? '') ?>"></div>
    </div>
    <div class="fg"><label>Keterangan Laporan</label><textarea class="in" readonly rows="2"><?= html_escape($header->keterangan_laporan ?? '') ?></textarea></div>
</div>

<form id="data_form">
    <input type="hidden" name="id_expense" value="<?= $header->id ?>">
    <input type="hidden" name="id_header" value="<?= $id_header ?>">
    <input type="hidden" name="id_spk_budgeting" value="<?= $id_spk_budgeting ?>">
    <input type="hidden" name="id_spk_penawaran" value="<?= $id_spk_penawaran ?>">
    <input type="hidden" name="id_penawaran" value="<?= $id_penawaran ?>">

    <div class="card">
        <div class="card-h"><span><i class="fa fa-list"></i> Rincian Item Realisasi: <?= html_escape($title_header) ?></span></div>
        <div class="tw">
            <table class="rt">
                <thead>
                    <tr>
                        <th rowspan="2" style="width: 40px;">No.</th>
                        <th rowspan="2" style="min-width: 190px;">Nama Item</th>
                        <th colspan="3" class="gk"><i class="fa fa-info-circle"></i> Kasbon (Pagu Awal)</th>
                        <th colspan="3" class="gr"><i class="fa fa-check"></i> Expense Report (Realisasi Aktual)</th>
                        <th rowspan="2" style="min-width: 150px;">Bukti Nota</th>
                        <th rowspan="2" style="min-width: 150px;">Keterangan</th>
                    </tr>
                    <tr>
                        <th class="gk">Qty</th><th class="gk">Nominal (Rp)</th><th class="gk">Total (Rp)</th>
                        <th class="gr">Qty</th><th class="gr">Nominal (Rp)</th><th class="gr">Total (Rp)</th>
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
                        $rowZero = ((float) $item['qty_kasbon'] <= 0);

                        echo '<tr class="' . ($rowZero ? 'zero' : '') . '">';

                        echo '<td>';
                        echo $item['no'];
                        echo '<input type="hidden" name="detail_subcont[' . $item['no'] . '][id_detail_kasbon]" value="' . $item['id_detail_kasbon'] . '">';
                        echo '</td>';

                        echo '<td class="l">' . html_escape($item['nm_item']) . '</td>';

                        echo '<td class="nr">';
                        echo number_format($item['qty_kasbon'], 2);
                        echo '<input type="hidden" name="detail_subcont[' . $item['no'] . '][qty_kasbon]" value="' . $item['qty_kasbon'] . '">';
                        echo '</td>';

                        echo '<td class="nr">';
                        echo number_format($item['nominal_kasbon'], 2);
                        echo '<input type="hidden" name="detail_subcont[' . $item['no'] . '][nominal_kasbon]" value="' . $item['nominal_kasbon'] . '">';
                        echo '</td>';

                        echo '<td class="nr">' . number_format($item['qty_kasbon'] * $item['nominal_kasbon'], 2) . '</td>';

                        echo '<td>';
                        echo '<input type="text" name="detail_subcont[' . $item['no'] . '][qty_expense]" class="in auto_num text-right qty_expense" value="' . $qty_expense . '" data-no="' . $item['no'] . '" style="width: 78px;" ' . $readonly_qty . '>';
                        echo '</td>';

                        echo '<td>';
                        echo '<input type="text" name="detail_subcont[' . $item['no'] . '][nominal_expense]" class="in auto_num text-right nominal_expense" value="' . $nominal_expense . '" data-no="' . $item['no'] . '" style="width: 128px;" ' . $readonly_nominal . '>';
                        echo '</td>';

                        echo '<td class="nr">' . number_format($total_expense, 2) . '</td>';

                        echo '<td>';
                        if (isset($list_bukti_penggunaan_by_detail[$item['id_detail_kasbon']])) {
                            foreach ($list_bukti_penggunaan_by_detail[$item['id_detail_kasbon']] as $bp) {
                                echo '<span class="chip"><a href="' . base_url($bp->upload_file) . '" target="_blank" title="' . html_escape(basename($bp->upload_file)) . '"><i class="fa fa-folder-o"></i> ' . html_escape(basename($bp->upload_file)) . '</a></span>';
                            }
                        } elseif (((float) $total_expense) > 0) {
                            echo '<span class="nobon">Belum ada bukti</span>';
                        } else {
                            echo '<span style="color: #97a3ab;">-</span>';
                        }
                        echo '</td>';

                        echo '<td>';
                        echo $keterangan !== '' ? html_escape($keterangan) : '<span style="color: #97a3ab;">-</span>';
                        echo '<textarea class="hidden" readonly>' . html_escape($keterangan) . '</textarea>';
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
            </table>
        </div>
        <div class="totbox">
            <div>Total Kasbon <span class="v col_ttl_kasbon"><?= number_format($ttl_kasbon, 2) ?></span></div>
            <div>Kelebihan Kasbon <input type="text" name="kelebihan_kasbon" class="v auto_num kelebihan_kasbon" value="<?= $kelebihan_kasbon ?>" readonly></div>
            <div>Total Expense Report <span class="v col_ttl_expense_report"><?= number_format($ttl_expense_report, 2) ?></span></div>
            <div>Kelebihan Expense <input type="text" name="kelebihan_expense" class="v auto_num kelebihan_expense" value="<?= $kelebihan_expense ?>" readonly></div>
            <div>Selisih <span class="v col_selisih"><?= number_format($header->selisih, 2) ?></span></div>
            <div>Kontrol <input type="text" name="kontrol" class="v kontrol" value="<?= number_format($header->selisih, 2) ?>" readonly></div>
        </div>

        <?php if (!$newExpenseFlow): ?>
        <div class="fgrid" style="margin-top: 14px;">
            <div class="fg">
                <label>Bukti Pengembalian</label>
                <?php
                if (count($list_bukti_pengembalian) > 0) {
                    echo '<button type="button" class="mkb b-blue b-sm" data-toggle="modal" data-target="#dialog-popup">';
                    echo '<i class="fa fa-list"></i> List Bukti Pengembalian';
                    echo '</button>';
                }
                ?>
            </div>
            <div class="fg">
                <label>Bank</label>
                <select name="bank" class="in select2" onchange="set_jurnal()">
                    <option value="">- Pilih Bank -</option>
                    <?php
                    foreach ($list_bank  as $item) :
                        $selected = '';
                        if ($header->id_bank == $item->id) {
                            $selected = 'selected';
                        }
                        echo '<option value="' . $item->id . '" ' . $selected . '>' . $item->nama_bank . ' - ' . $item->rekening . ' - ' . $item->nama . '</option>';
                    endforeach;
                    ?>
                </select>
            </div>
        </div>
        <?php endif; ?>
    </div>

    <div class="card">
        <div class="card-h"><span><i class="fa fa-book"></i> Jurnal <span class="bd bd-draft" style="margin-left: 6px;">Preview: disimpan setelah approval</span></span></div>
        <div class="tw">
            <table class="jt">
                <thead>
                    <tr>
                        <th>Tanggal Jurnal</th><th>COA</th><th>Nama Company</th><th>Nama Account</th><th>Deskripsi</th><th>Debit (Rp)</th><th>Kredit (Rp)</th>
                    </tr>
                </thead>
                <tbody class="tbody_jurnal">
                </tbody>
                <tfoot>
                    <tr class="tt">
                        <td colspan="5" style="text-align: center;">Total Balancing Jurnal</td>
                        <td class="r ttl_debit">0.00</td>
                        <td class="r ttl_kredit">0.00</td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <div class="card <?= $hide_jurnal_pph21 ?>">
        <div class="card-h"><span><i class="fa fa-book"></i> Jurnal PPh 21</span></div>
        <div class="tw">
            <table class="jt">
                <thead>
                    <tr>
                        <th>Tanggal Jurnal</th><th>COA</th><th>Nama Company</th><th>Nama Account</th><th>Deskripsi</th><th>Debit (Rp)</th><th>Kredit (Rp)</th>
                    </tr>
                </thead>
                <tbody>
                    <?= $list_jurnal_pph21['hasil'] ?? '' ?>
                </tbody>
                <tfoot>
                    <tr class="tt">
                        <td colspan="5" style="text-align: center;">Balancing</td>
                        <td class="r jurnal_pph_debit"><?= number_format(0) ?></td>
                        <td class="r jurnal_pph_kredit"><?= number_format($list_jurnal_pph21['nominal_pph'] ?? 0) ?></td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <input type="hidden" name="ttl_debit">
    <input type="hidden" name="ttl_kredit">

    <div class="card">
        <div class="fg">
            <label for="reject_reason">Reject Reason</label>
            <textarea class="in" id="reject_reason" name="reject_reason" placeholder="Wajib diisi jika Reject"></textarea>
        </div>
    </div>

    <div class="btn-row" style="margin-bottom: 20px;">
        <a href="<?= base_url('approval_expense_report_project') ?>" class="mkb b-red"><i class="fa fa-angle-left"></i> Back</a>
        <button type="button" class="mkb b-red reject"><i class="fa fa-times"></i> Reject</button>
        <button type="button" class="mkb b-green approve"><i class="fa fa-check"></i> Approve</button>
    </div>
</form>
</div>

<div class="modal modal-default fade" id="dialog-popup" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style='width:70%; '>
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel"><span class="fa fa-users"></span>&nbsp;List Bukti Pengembalian</h4>
            </div>
            <div class="modal-body" id="ModalView">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Document Link</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $no = 1;
                        foreach ($list_bukti_pengembalian as $item) {
                            echo '<tr>';
                            echo '<td class="text-center">' . $no . '</td>';
                            echo '<td><a href="' . base_url($item->document_link) . '" target="_blank">' . $item->document_link . '</a></td>';
                            echo '</tr>';

                            $no++;
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal modal-default fade" id="dialog-popup2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style='width:70%; '>
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel"><span class="fa fa-users"></span>&nbsp;List Bukti Penggunaan</h4>
            </div>
            <div class="modal-body" id="ModalView">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Document Link</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $no = 1;
                        foreach ($list_bukti_penggunaan as $item) {
                            echo '<tr>';
                            echo '<td class="text-center">' . $no . '</td>';
                            echo '<td><a href="' . base_url($item->upload_file) . '" target="_blank">' . $item->upload_file . '</a></td>';
                            echo '</tr>';

                            $no++;
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="<?= base_url('assets/js/autoNumeric.js'); ?>"></script>
<script src="https://cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script>
    set_jurnal();

    $(document).ready(function() {
        $('.auto_num').autoNumeric();
        $('.select2').select2({
            width: '100%'
        });
    });

    $(document).on('submit', '#frm-data', function(e) {
        e.preventDefault();

        Swal.fire({
            icon: 'warning',
            title: 'Are you sure ?',
            text: 'This data will be saved !',
            showCancelButton: true
        }).then((next) => {
            if (next.isConfirmed) {
                var formData = new FormData($('#frm-data')[0]);

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
                                title: 'Success !',
                                text: result.pesan
                            }).then((lanjut) => {
                                window.location.href = siteurl + active_controller + 'add/' + '<?= urlencode(str_replace('/', '|', $id_spk_budgeting)) ?>';
                            });
                        } else {
                            Swal.fire({
                                icon: 'warning',
                                title: 'Failed !',
                                text: result.pesan
                            });
                        }
                    },
                    error: function(result) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error !',
                            text: 'Please try again later !'
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
        // Strip all characters but numerical ones.
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
        // Fix for IE parseFloat(0.55).toFixed(0) = 0;
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
            var nominal_expense = get_num($('input[name="detail_subcont[' + i + '][nominal_expense]"]').val());

            ttl_expense_report += (qty_expense * nominal_expense);
            ttl_kasbon += (qty_kasbon * nominal_kasbon);

            selisih += ((qty_kasbon * nominal_kasbon) - (qty_expense * nominal_expense));
        }

        $('.col_ttl_expense_report').html(number_format(ttl_expense_report, 2));
        $('.col_ttl_kasbon').html(number_format(ttl_kasbon, 2));
        $('.col_selisih').html(number_format(selisih, 2));
    }

    $(document).on('click', '.approve', function(e) {
        e.preventDefault();

        var id_header = $('input[name="id_header"]').val();

        var bank = $('select[name="bank"]').val();

        if (!<?= $newExpenseFlow ? 'true' : 'false' ?> && bank == '') {
            Swal.fire({
                icon: 'warning',
                title: 'Warning !',
                text: 'Bank must be choosen !',
                showConfirmButton: false,
                showCancelButton: false,
                timer: 3000
            });

            return false;
        }

        Swal.fire({
            icon: 'warning',
            title: 'Are you sure ?',
            text: 'This data will be approved !',
            showCancelButton: true
        }).then((lanjut) => {
            if (lanjut.isConfirmed) {
                var formdata = $('#data_form').serialize();
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'approve_expense_report',
                    data: formdata,
                    cache: false,
                    dataType: 'json',
                    success: function(result) {
                        if (result.status == '1') {
                            Swal.fire({
                                icon: 'success',
                                title: 'Success !',
                                text: result.msg,
                                showConfirmButton: false,
                                showCancelButton: false,
                                timer: 3000
                            }).then((next) => {
                                window.location.href = siteurl + active_controller + 'approval_expense_report_project';
                            });
                        } else {
                            Swal.fire({
                                icon: 'warning',
                                title: 'Failed !',
                                text: result.msg,
                                showConfirmButton: false,
                                showCancelButton: false,
                                timer: 3000
                            });
                        }
                    },
                    error: function(result) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error !',
                            text: 'Please try again later !',
                            showConfirmButton: false,
                            showCancelButton: false,
                            timer: 3000
                        });
                    }
                })
            }
        });
    });

    $(document).on('click', '.reject', function(e) {
        e.preventDefault();

        var id_header = $('input[name="id_header"]').val();
        var reject_reason = $('textarea[name="reject_reason"]').val();

        if (reject_reason == '') {
            Swal.fire({
                icon: 'warning',
                title: 'Warning !',
                text: 'Reject reason must filled !',
                showConfirmButton: false,
                showCancelButton: false,
                timer: 3000
            });

            return false;
        }
        Swal.fire({
            icon: 'warning',
            title: 'Are you sure ?',
            text: 'This data will be rejected !',
            showCancelButton: true
        }).then((lanjut) => {
            if (lanjut.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'reject_expense_report',
                    cache: false,
                    data: {
                        'id_header': id_header,
                        'reject_reason': reject_reason
                    },
                    dataType: 'json',
                    success: function(result) {
                        if (result.status == '1') {
                            Swal.fire({
                                icon: 'success',
                                title: 'Success !',
                                text: result.msg,
                                showConfirmButton: false,
                                showCancelButton: false,
                                timer: 3000
                            }).then((next) => {
                                window.location.href = siteurl + active_controller + 'approval_expense_report_project';
                            });
                        } else {
                            Swal.fire({
                                icon: 'warning',
                                title: 'Failed !',
                                text: result.msg,
                                showConfirmButton: false,
                                showCancelButton: false,
                                timer: 3000
                            });
                        }
                    },
                    error: function(result) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error !',
                            text: 'Please try again later !',
                            showConfirmButton: false,
                            showCancelButton: false,
                            timer: 3000
                        });
                    }
                })
            }
        });
    });

    function set_jurnal() {
        var id_expense = "<?= $header->id ?>";
        var id_header = "<?= $id_header ?>";
        var id_bank = $('select[name="bank"]').val();
        var id_penawaran = $('input[name="id_penawaran"]').val();

        $.ajax({
            type: 'post',
            url: siteurl + active_controller + 'set_jurnal_expense',
            data: {
                'id_expense': id_expense,
                'id_header': id_header,
                'id_bank': id_bank,
                'id_penawaran': id_penawaran
            },
            cache: false,
            dataType: 'json',
            success: function(result) {
                $('.tbody_jurnal').html(result.hasil);
                $('.ttl_debit').html(number_format(result.ttl_debit));
                $('.ttl_kredit').html(number_format(result.ttl_kredit));

                $('input[name="ttl_debit"]').val(result.ttl_debit);
                $('input[name="ttl_kredit"]').val(result.ttl_kredit);
            }
        });
    }
</script>