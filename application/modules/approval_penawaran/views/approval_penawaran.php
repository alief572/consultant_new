<?php
$ENABLE_ADD     = has_permission('Penawaran.Add');
$ENABLE_MANAGE  = has_permission('Penawaran.Manage');
$ENABLE_VIEW    = has_permission('Penawaran.View');
$ENABLE_DELETE  = has_permission('Penawaran.Delete');

$open_akomodasi = 'd-none';
$open_others = 'd-none';

if (count($list_penawaran_akomodasi) > 0) {
    $open_akomodasi = '';
}
if (count($list_penawaran_others) > 0) {
    $open_others = '';
}
?>
<!-- <link rel="stylesheet" href="<?= base_url('assets/plugins/datatables/dataTables.bootstrap.css') ?>"> -->
<link rel="stylesheet" href="https://cdn.datatables.net/2.1.7/css/dataTables.dataTables.min.css">

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
</style>
<div id="alert_edit" class="alert alert-success alert-dismissable" style="padding: 15px; display: none;"></div>

<div class="box">

    <!-- /.box-header -->
    <div class="box-body">
        <table border='0' style="width: 100%;">
            <tr>
                <td class="pd-5 semi-bold">Number</td>
                <td class="pd-5" width="390">
                    <input type="text" name="id_quotation" id="" class="form-control form-control-sm id_quotation" value="<?= $list_penawaran->id_quotation ?>" readonly>
                </td>
                <td class="pd-5 semi-bold">Date</td>
                <td class="pd-5" width="390">
                    <input type="date" name="tgl_quotation" id="" class="form-control form-control-sm" value="<?= date('Y-m-d', strtotime($list_penawaran->tgl_quotation)) ?>" readonly>
                </td>
            </tr>
            <tr>
                <td class="pd-5 semi-bold">Customer</td>
                <td class="pd-5" width="390">
                    <select name="customer" id="" class="form-control form-control-sm change_customer select_customer" readonly>
                        <?php
                        foreach ($list_customers as $item) {
                            $selected = '';
                            if ($item->id_customer == $list_penawaran->id_customer) {
                                echo '<option value="' . $item->id_customer . '">' . strtoupper($item->nm_customer) . '</option>';
                            }
                        }
                        ?>
                    </select>
                </td>
                <td class="pd-5 semi-bold">Marketing</td>
                <td class="pd-5" width="390">
                    <select name="marketing" id="" class="form-control form-control-sm select_marketing" readonly>
                        <?php
                        foreach ($list_marketing as $item) {
                            if ($item->id == $list_penawaran->id_marketing) {
                                echo '<option value="' . $item->id . '">' . strtoupper($item->nm_karyawan) . '</option>';
                            }
                        }
                        ?>
                    </select>
                </td>
            </tr>
            <tr>
                <td class="pd-5 semi-bold">PIC</td>
                <td class="pd-5" width="390">
                    <input type="text" name="pic" id="" class="form-control form-control-sm pic" value="<?= $list_penawaran->nm_pic ?>" readonly>
                </td>
                <td class="pd-5 semi-bold">Address</td>
                <td class="pd-5" width="390">
                    <input type="text" name="address" id="" class="form-control form-control-sm address" value="<?= $list_penawaran->address ?>" readonly>
                </td>
            </tr>
            <tr>
                <td class="pd-5 semi-bold" valign="top">Informasi Awal</td>
                <td class="pd-5" width="390" valign="top">
                    <table style="width: 100%;" border="0">
                        <tr>
                            <td style="padding: 0.2rem;">
                                <input type="checkbox" name="check_info_awal_sales" id="" class="check_info_awal_sales" <?= ($list_penawaran->tipe_informasi_awal == 'Sales') ? 'checked' : '' ?> disabled> Sales
                            </td>
                            <td style="padding: 0.2rem;">
                                <select name="informasi_awal_sales" id="" class="informasi_awal_sales" disabled>
                                    <?php
                                    foreach ($list_marketing as $item) {
                                        if ($list_penawaran->tipe_informasi_awal == 'Sales' && $item->id == $list_penawaran->detail_informasi_awal) {
                                            echo '<option value="' . $item->id . '">' . $item->nm_karyawan . '</option>';
                                        }
                                    }
                                    ?>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 0.2rem;">
                                <input type="checkbox" name="check_info_awal_medsos" id="" class="check_info_awal_medsos" <?= ($list_penawaran->tipe_informasi_awal == 'Medsos') ? 'checked' : '' ?> disabled> Medsos
                            </td>
                            <td style="padding: 0.2rem;">
                                <select name="informasi_awal_medsos" id="" class="informasi_awal_medsos" disabled>
                                    <?php
                                    if ($list_penawaran->tipe_informasi_awal == 'Medsos' && $list_penawaran->detail_informasi_awal == 'Youtube') {
                                        echo '<option value="Youtube">Youtube</option>';
                                    }
                                    if ($list_penawaran->tipe_informasi_awal == 'Medsos' && $list_penawaran->detail_informasi_awal == 'Instagram') {
                                        echo '<option value="Instagram">Instagram</option>';
                                    }
                                    if ($list_penawaran->tipe_informasi_awal == 'Medsos' && $list_penawaran->detail_informasi_awal == 'Linkedin') {
                                        echo '<option value="Linkedin">Linkedin</option>';
                                    }
                                    if ($list_penawaran->tipe_informasi_awal == 'Medsos' && $list_penawaran->detail_informasi_awal == 'Website') {
                                        echo '<option value="Website">Website</option>';
                                    }
                                    if ($list_penawaran->tipe_informasi_awal == 'Medsos' && $list_penawaran->detail_informasi_awal == 'Facebook') {
                                        echo '<option value="Facebook">Facebook</option>';
                                    }
                                    ?>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 0.2rem;">
                                <input type="checkbox" name="check_info_awal_others" id="" class="check_info_awal_others" disabled> Others
                            </td>
                            <td style="padding: 0.2rem;">
                                <select name="informasi_awal_others" id="" class="informasi_awal_others" disabled>
                                    <?php
                                    foreach ($list_marketing as $item) {
                                        if ($list_penawaran->tipe_informasi_awal == 'Others' && $item->id == $list_penawaran->detail_informasi_awal) {
                                            echo '<option value="' . $item->id . '">' . $item->nm_karyawan . '</option>';
                                        }
                                    }
                                    ?>
                                </select>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="pd-5 semi-bold">Upload Proposal</td>
                <td class="pd-5" width="390">
                    <?php
                    if (
                        $list_penawaran->upload_proposal !== '' &&
                        $list_penawaran->upload_proposal !== null &&
                        file_exists('./uploads/proposal_penawaran/' . $list_penawaran->upload_proposal)
                    ) {
                        echo '<a href="' . base_url('uploads/proposal_penawaran/' . $list_penawaran->upload_proposal) . '" target="_blank" class="btn btn-sm btn-primary">
                            <i class="fa fa-download"></i> Download Proposal
                        </a>';
                    }
                    ?>
                </td>
            </tr>
            <tr>
                <td class="pd-5 semi-bold">Consultation Package</td>
                <td class="pd-5" width="390">
                    <select name="consultation_package" class="form-control form-control-sm change_package select_package" required>
                        <?php
                        foreach ($list_package as $item) {
                            if ($item->id_konsultasi_h == $list_penawaran->id_paket) {
                                echo '<option value="' . $item->id_konsultasi_h . '">' . $item->nm_paket . '</option>';
                            }
                        }
                        ?>
                    </select>
                </td>
                <td colspan="3"></td>
            </tr>
        </table>
    </div>
    <!-- /.box-body -->
</div>

<div class="box">
    <div class="box-header">
        <h4 class="semi-bold">
            Activity List
        </h4>
    </div>

    <div class="box-body">
    <table class="table custom-table">
            <thead>
                <tr>
                    <th class="text-center">Activity Name</th>
                    <th class="text-center">Mandays</th>
                    <th class="text-center">Mandays Rate</th>
                    <th class="text-center">Price</th>
                </tr>
            </thead>
            <tbody class="list_activity">
                <?php
                $ttl_bobot = 0;
                $ttl_mandays = 0;
                $ttl_price = 0;
                $ttl_check_point = 0;
                $ttl_mandays_rate = 0;

                $no_activity = 1;
                foreach ($list_penawaran_aktifitas as $item_aktifitas) {

                    echo '<tr>';

                    echo '<td>' . $item_aktifitas->nama_aktifitas . '</td>';
                    echo '<td class="text-center">' . number_format($item_aktifitas->mandays, 2) . '</td>';
                    echo '<td class="text-center">' . number_format($item_aktifitas->mandays_rate, 2) . '</td>';
                    echo '<td class="text-center">' . number_format($item_aktifitas->total_aktifitas, 2) . '</td>';

                    echo '</tr>';

                    $ttl_bobot += $item_aktifitas->bobot;
                    $ttl_mandays += $item_aktifitas->mandays;
                    $ttl_price += $item_aktifitas->harga_aktifitas;
                    $ttl_check_point += $item_aktifitas->jml_check_point;
                    $ttl_mandays_rate += $item_aktifitas->mandays_rate;

                    $no_activity++;
                }
                ?>
            </tbody>
            <tfoot>
                <tr>
                    <th class="text-center">Total</th>
                    <th class="text-center ttl_act_mandays"><?= number_format($ttl_mandays, 2) ?></th>
                    <th class="text-center ttl_act_mandays_rate"><?= number_format($ttl_mandays_rate, 2) ?></th>
                    <th class="text-center ttl_act_price"><?= number_format($ttl_price, 2) ?></th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>

<div class="box">
    <div class="box-header">
        <h4 class="semi-bold">
            Akomodasi
            <div style="float: right">
                <div class="onoffswitch">
                    <input type="checkbox" name="switch_akomodasi" class="onoffswitch-checkbox" id="switch_akomodasi" <?= ($open_akomodasi == '') ? 'checked' : '' ?>>
                    <label class="onoffswitch-label" for="switch_akomodasi">
                        <span class="onoffswitch-inner"></span>
                        <span class="onoffswitch-switch"></span>
                    </label>
                </div>
            </div>
        </h4>
    </div>
    <div class="box-body box_akomodasi <?= ($open_akomodasi == '') ? '' : 'd-none' ?>">

        <br>

        <table class="table custom-table" style="border-radius: 1px !important; overflow: hidden;">
            <thead>
                <tr>
                    <th class="text-center">Item</th>
                    <th class="text-center">Qty</th>
                    <th class="text-center">Price/Unit</th>
                    <th class="text-center">Total</th>
                    <th class="text-center">Keterangan</th>
                </tr>
            </thead>
            <tbody class="list_akomodasi">
                <?php
                $no_akomodasi = 1;

                $ttl_akomodasi = 0;
                foreach ($list_penawaran_akomodasi as $item_akomodasi) {
                    echo '<tr>';
                    echo '<td>' . $item_akomodasi->nm_biaya . '</td>';
                    echo '<td class="text-center">' . number_format($item_akomodasi->qty, 2) . '</td>';
                    echo '<td class="text-center">' . number_format($item_akomodasi->price_unit, 2) . '</td>';
                    echo '<td class="text-center">' . number_format($item_akomodasi->total, 2) . '</td>';
                    echo '<td>' . $item_akomodasi->keterangan . '</td>';
                    echo '</tr>';

                    $ttl_akomodasi += $item_akomodasi->total;
                }
                ?>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="3">
                        Total
                    </th>
                    <th class="text-center ttl_ako_grand_total"><?= number_format($ttl_akomodasi, 2) ?></th>
                    <th></th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>

<div class="box">
    <div class="box-header">
        <h4 class="semi-bold">
            Others
            <div style="float: right">
                <div class="onoffswitch">
                    <input type="checkbox" name="switch_others" class="onoffswitch-checkbox" id="switch_others" <?= ($open_others == '') ? 'checked' : '' ?>>
                    <label class="onoffswitch-label" for="switch_others">
                        <span class="onoffswitch-inner"></span>
                        <span class="onoffswitch-switch"></span>
                    </label>
                </div>
            </div>
        </h4>
    </div>
    <div class="box-body box_others <?= ($open_others == '') ? '' : 'd-none' ?>">


        <br>

        <table class="table custom-table">
            <thead>
                <tr>
                    <th class="text-center">Item</th>
                    <th class="text-center">Qty</th>
                    <th class="text-center">Price/Unit</th>
                    <th class="text-center">Total</th>
                    <th class="text-center">Keterangan</th>
                </tr>
            </thead>
            <tbody class="list_others">
                <?php
                $no_others = 1;

                $ttl_others = 0;
                foreach ($list_penawaran_others as $item_others) {
                    echo '<tr>';
                    echo '<td>' . $item_others->nm_biaya . '</td>';
                    echo '<td class="text-center">' . number_format($item_others->qty, 2) . '</td>';
                    echo '<td class="text-center">' . number_format($item_others->price_unit, 2) . '</td>';
                    echo '<td class="text-center">' . number_format($item_others->total, 2) . '</td>';
                    echo '<td>' . $item_others->keterangan . '</td>';
                    echo '</tr>';

                    $ttl_others += $item_others->total;
                }
                ?>
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="3">
                        Total
                    </th>
                    <th class="text-center ttl_oth_grand_total"><?= number_format($ttl_others, 2) ?></th>
                    <th></th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>

<div class="box">
    <div class="box-header">
        <h4 class="semi-bold">
            Summary

            <div style="float: right;">
                <div class="cbx-krajee">
                    <input id="input-id" type="checkbox" class="include_ppn" name="include_ppn" value="1" <?= ($list_penawaran->ppn == 1) ? 'checked' : '' ?> disabled>
                    <label for="input-id" class="cbx-label">Include PPN</label>
                </div>
            </div>
        </h4>
    </div>
    <div class="box-body">
        <table class="table custom-table-no">
            <thead>
                <tr>
                    <th class="text-left">Item</th>
                    <th class="text-right">Amount (Rp)</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="text-left">Konsultasi</td>
                    <td class="text-right summary_konsultasi"><?= number_format($ttl_price, 2) ?></td>
                </tr>
                <tr>
                    <td class="text-left">Akomodasi</td>
                    <td class="text-right summary_akomodasi"><?= number_format($ttl_akomodasi, 2) ?></td>
                </tr>
                <tr>
                    <td class="text-left">Others</td>
                    <td class="text-right summary_others"><?= number_format($ttl_others, 2) ?></td>
                </tr>
                <tr>
                    <td class="text-left"><b>Subtotal</b></td>
                    <td class="text-right summary_subtotal"><?= number_format(($ttl_price + $ttl_akomodasi + $ttl_others), 2) ?></td>
                </tr>
                <tr>
                    <td class="text-left"><b>Discount</b></td>
                    <td class="text-right">
                        <div class="form-inline">
                            <input type="text" name="persen_disc" id="" class="form-control form-control-sm text-right input_diskon_persen" placeholder="Discount (%)" style="max-width: 30%;" value="<?= $list_penawaran->persen_disc ?>" readonly>
                            <input type="text" name="nilai_disc" id="" class="form-control form-control-sm text-right auto_num input_diskon_value" placeholder="Discount (Rp)" style="max-width: 30%;" value="<?= $list_penawaran->nilai_disc ?>" readonly>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="text-left"><b>Price after discount</b></td>
                    <td class="text-right summary_price_after_disc"><?= number_format((($ttl_price + $ttl_akomodasi + $ttl_others) - $list_penawaran->nilai_disc), 2) ?></td>
                </tr>
                <tr>
                    <?php
                    $nilai_ppn = 0;
                    if ($list_penawaran->ppn == 1) {
                        $nilai_ppn = ((($ttl_price + $ttl_akomodasi + $ttl_others) - $list_penawaran->nilai_disc) * 11 / 100);
                    }
                    ?>
                    <td class="text-left">PPN</td>
                    <td class="text-right summary_ppn"><?= number_format($nilai_ppn, 2) ?></td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <td class="text-left"><b>Grand Total</b></td>
                    <td class="text-right summary_grand_total"><?= number_format((($ttl_price + $ttl_akomodasi + $ttl_others) - $list_penawaran->nilai_disc) + $nilai_ppn, 2) ?></td>
                </tr>
            </tfoot>
        </table>

        <input type="hidden" class="grand_total" name="grand_total">

        <br>
        <div class="col-md-6">
            <div class="form-group">
                <label for="">Reject Reason</label>
                <textarea name="reject_reason" id="" class="form-control form-control-sm reject_reason"><?= $list_penawaran->reject_reason ?></textarea>
            </div>
        </div>

        <div class="col-12">
            <div style="float: right; margin-top: 1rem; margin-left: 0.5rem;">
                <a href="javascript:void(0);" class="btn btn-sm btn-success approve_penawaran">
                    <i class="fa fa-check"></i> Approve
                </a>
            </div>
            <div style="float: right; margin-top: 1rem; margin-left: 0.5rem;">
                <a href="javascript:void(0);" class="btn btn-sm btn-danger reject_penawaran">
                    <i class="fa fa-close"></i> Reject
                </a>
            </div>
            <div style="float: right; margin-top: 1rem; margin-left: 0.5rem;">
                <a href="<?= base_url('approval_penawaran') ?>" class="btn btn-sm btn-danger">
                    <i class="fa fa-arrow-left"></i> Back
                </a>
            </div>
        </div>
    </div>
</div>

<input type="hidden" class="no" value="1">
<input type="hidden" class="no_akomodasi" value="1">
<input type="hidden" class="no_others" value="1">

<div id="form-data"></div>
<!-- DataTables -->
<!-- <script src="<?= base_url('assets/plugins/datatables/jquery.dataTables.min.js') ?>"></script>
<script src="<?= base_url('assets/plugins/datatables/dataTables.bootstrap.min.js') ?>"></script> -->

<script src="https://cdn.datatables.net/2.1.7/js/dataTables.min.js"></script>
<script src="<?= base_url('assets/js/autoNumeric.js') ?>"></script>
<!-- page script -->
<script type="text/javascript">
    $('.select_customer').chosen();
    $('.select_marketing').chosen();
    $('.select_package').chosen();

    $('.informasi_awal_sales').chosen({
        width: "100%"
    });
    $('.informasi_awal_medsos').chosen({
        width: "100%"
    });
    $('.informasi_awal_others').chosen({
        width: "100%"
    });

    // initialize with defaults
    $("#input-id").checkboxX({
        threeState: false,
        size: 'sm'
    });

    $(document).ready(function() {
        auto_num();
    });

    $(document).on('click', '.add_activity', function() {
        addActivity();
    });

    $(document).on('click', '.add_akomodasi', function() {
        addAkomodasi();
    });
    $(document).on('click', '.add_others', function() {
        addAOthers();
    });

    function auto_num() {
        $('.auto_num').autoNumeric();
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

    function get_num(nilai = null) {
        if (nilai !== '' && nilai !== null) {
            nilai = nilai.split(',').join('');
            nilai = parseFloat(nilai);
        } else {
            nilai = 0;
        }

        return nilai;
    }


    function hitung_total_activity() {
        var no_activity = parseFloat($('.no').val());

        var ttl_bobot = 0;
        var ttl_mandays = 0;
        var ttl_price = 0;
        var ttl_check_point = 0;

        var arr_id_aktifitas = [];

        for (i = 1; i < no_activity; i++) {
            if ($('.select_nm_aktifitas_' + i).length) {
                var bobot = get_num($('input[name="dt_act[' + i + '][bobot]"]').val());
                var mandays = get_num($('input[name="dt_act[' + i + '][mandays]"]').val());
                var price = get_num($('.input_harga_aktifitas_' + i).val());

                ttl_bobot += bobot;
                ttl_mandays += mandays;
                ttl_price += price;

                var id_aktifitas = $('.select_nm_aktifitas_' + i).val();
                if (id_aktifitas !== '') {
                    arr_id_aktifitas.push(id_aktifitas);
                }
            }
        }

        if (arr_id_aktifitas.length > 0) {
            $.ajax({
                type: 'post',
                url: siteurl + active_controller + 'hitung_ttl_check_point',
                data: {
                    'id_aktifitas': id_aktifitas
                },
                cache: false,
                success: function(result) {
                    $('.ttl_act_check_point').html(number_format(result, 2));
                }
            });
        }

        $('.ttl_act_bobot').html(number_format(ttl_bobot, 2));
        $('.ttl_act_mandays').html(number_format(ttl_mandays, 2));
        $('.ttl_act_price').html(number_format(ttl_price, 2));

        hitung_summary();
    }

    function hitung_item_akomodasi(no) {
        var qty = get_num($('input[name="dt_ako[' + no + '][qty_akomodasi]"]').val());
        var harga = get_num($('input[name="dt_ako[' + no + '][harga_akomodasi]"]').val());

        var total = parseFloat(qty * harga);

        $('input[name="dt_ako[' + no + '][total_akomodasi]"]').val(number_format(total, 2));

        hitung_all_akomodasi();

        hitung_summary();
    }

    function hitung_all_akomodasi() {
        var no_akomodasi = parseFloat($('.no_akomodasi').val());

        var ttl_grand_total = 0;
        for (i = 1; i < no_akomodasi; i++) {
            if ($('input[name="dt_ako[' + i + '][total_akomodasi]"]').val() !== '') {
                var total_akomodasi = get_num($('input[name="dt_ako[' + i + '][total_akomodasi]"]').val());

                ttl_grand_total += total_akomodasi;
            }
        }

        $('.ttl_ako_grand_total').html(number_format(ttl_grand_total, 2));

        hitung_summary();
    }

    function hitung_item_others(no) {
        var qty = get_num($('input[name="dt_oth[' + no + '][qty_others]"]').val());
        var harga = get_num($('input[name="dt_oth[' + no + '][harga_others]"]').val());

        var total = parseFloat(qty * harga);

        $('input[name="dt_oth[' + no + '][total_others]"]').val(number_format(total, 2));

        hitung_all_others();
    }

    function hitung_all_others() {
        var no_others = parseFloat($('.no_others').val());

        var ttl_grand_total = 0;
        for (i = 1; i < no_others; i++) {
            if ($('input[name="dt_oth[' + i + '][total_others]"]').val() !== '') {
                var total_others = get_num($('input[name="dt_oth[' + i + '][total_others]"]').val());

                ttl_grand_total += total_others;
            }
        }

        $('.ttl_oth_grand_total').html(number_format(ttl_grand_total, 2));

        hitung_summary();
    }

    function hitung_summary() {
        var ttl_act_price = get_num($('.ttl_act_price').html());
        var ttl_ako_grand_total = get_num($('.ttl_ako_grand_total').html());
        var ttl_oth_grand_total = get_num($('.ttl_oth_grand_total').html());

        $('.summary_konsultasi').html(number_format(ttl_act_price, 2));
        $('.summary_akomodasi').html(number_format(ttl_ako_grand_total, 2));
        $('.summary_others').html(number_format(ttl_oth_grand_total, 2));

        var nilai_disc = get_num($('.input_diskon_value').val());

        var subtotal = (ttl_act_price + ttl_ako_grand_total + ttl_oth_grand_total);
        $('.summary_subtotal').html(number_format(subtotal, 2));

        subtotal -= nilai_disc;

        $('.summary_price_after_disc').html(number_format(subtotal, 2));

        var nilai_ppn = 0;
        if ($('.include_ppn').is(':checked')) {
            var nilai_ppn = (subtotal * 11 / 100);
        }

        $('.summary_ppn').html(number_format(nilai_ppn, 2));

        $('.summary_grand_total').html(number_format((subtotal + nilai_ppn), 2));
        $('.grand_total').val((subtotal + nilai_ppn));
    }

    function addActivity() {
        var no_activity = parseFloat($('.no').val());

        var hasil = '<tr class="tr_aktifitas_' + no_activity + '">';

        hasil += '<td class="text-left">';

        hasil += '<select class="form-control form-control-sm change_aktifitas select_nm_aktifitas_' + no_activity + '" name="dt_act[' + no_activity + '][nm_aktifitas]" style="max-width: 500px;" data-no="' + no_activity + '">';
        hasil += '<option value="">- Select Activity Name -</option>';
        <?php
        foreach ($list_aktifitas as $item) {
        ?>

            hasil += '<option value="<?= $item->id_aktifitas ?>"><?= str_replace("'", "", $item->nm_aktifitas) ?></option>';

        <?php
        }
        ?>
        hasil += '</select>';
        hasil += '</td>';

        hasil += '<td class="text-center">';
        hasil += '<input type="text" class="form-control form-control-sm auto_num text-right input_bobot_' + no_activity + '" name="dt_act[' + no_activity + '][bobot]" value="" onchange="hitung_total_activity()">';
        hasil += '</td>';

        hasil += '<td class="text-center">';
        hasil += '<input type="text" class="form-control form-control-sm auto_num text-right input_mandays_' + no_activity + '" name="dt_act[' + no_activity + '][mandays]" value="" onchange="hitung_total_activity()">';
        hasil += '</td>';

        hasil += '<td class="text-center">';
        hasil += '<input type="text" class="form-control form-control-sm auto_num text-right input_harga_aktifitas_' + no_activity + '" name="dt_act[' + no_activity + '][harga_aktifitas]" value="" onchange="hitung_total_activity()">';
        hasil += '</td>';

        hasil += '<td class="text-center td_check_point_' + no_activity + '">';
        hasil += '';
        hasil += '</td>';

        hasil += '<td class="text-center">';
        hasil += '<button type="button" class="btn btn-sm btn-danger del_aktifitas" data-no="' + no_activity + '"><i class="fa fa-trash"></i></button>';
        hasil += '</td>';

        hasil += '</tr>';

        $('.list_activity').append(hasil);

        // $('.select_nm_aktifitas_' + no_activity).chosen();

        no_activity = parseFloat(no_activity + 1);
        $('.no').val(no_activity);

        auto_num();
    }

    function addAkomodasi() {
        var no_akomodasi = parseFloat($('.no_akomodasi').val());

        var hasil = '<tr class="tr_akomodasi_' + no_akomodasi + '">';

        hasil += '<td>';
        hasil += '<input type="text" class="form-control form-control-sm" name="dt_ako[' + no_akomodasi + '][nm_akomodasi]">';
        hasil += '</td>';

        hasil += '<td>';
        hasil += '<input type="text" class="form-control form-control-sm auto_num text-right" name="dt_ako[' + no_akomodasi + '][qty_akomodasi]" onchange="hitung_item_akomodasi(' + no_akomodasi + ')">';
        hasil += '</td>';

        hasil += '<td>';
        hasil += '<input type="text" class="form-control form-control-sm auto_num text-right" name="dt_ako[' + no_akomodasi + '][harga_akomodasi]" onchange="hitung_item_akomodasi(' + no_akomodasi + ')">';
        hasil += '</td>';

        hasil += '<td>';
        hasil += '<input type="text" class="form-control form-control-sm auto_num text-right" name="dt_ako[' + no_akomodasi + '][total_akomodasi]" readonly>';
        hasil += '</td>';

        hasil += '<td>';
        hasil += '<input type="text" class="form-control form-control-sm" name="dt_ako[' + no_akomodasi + '][keterangan_akomodasi]">';
        hasil += '</td>';

        hasil += '<td>';
        hasil += '<button type="button" class="btn btn-sm btn-danger del_akomodasi" data-no="' + no_akomodasi + '"><i class="fa fa-trash"></i></button>';
        hasil += '</td>';

        hasil += '</tr>';

        $('.list_akomodasi').append(hasil);

        // $('.select_nm_aktifitas_' + no_activity).chosen();

        no_akomodasi = parseFloat(no_akomodasi + 1);
        $('.no_akomodasi').val(no_akomodasi);

        auto_num();
    }

    function addAOthers() {
        var no_others = parseFloat($('.no_others').val());

        var hasil = '<tr class="tr_others_' + no_others + '">';

        hasil += '<td>';
        hasil += '<input type="text" class="form-control form-control-sm" name="dt_oth[' + no_others + '][nm_others]">';
        hasil += '</td>';

        hasil += '<td>';
        hasil += '<input type="text" class="form-control form-control-sm auto_num text-right" name="dt_oth[' + no_others + '][qty_others]" onchange="hitung_item_others(' + no_others + ')">';
        hasil += '</td>';

        hasil += '<td>';
        hasil += '<input type="text" class="form-control form-control-sm auto_num text-right" name="dt_oth[' + no_others + '][harga_others]" onchange="hitung_item_others(' + no_others + ')">';
        hasil += '</td>';

        hasil += '<td>';
        hasil += '<input type="text" class="form-control form-control-sm auto_num text-right" name="dt_oth[' + no_others + '][total_others]" readonly>';
        hasil += '</td>';

        hasil += '<td>';
        hasil += '<input type="text" class="form-control form-control-sm" name="dt_oth[' + no_others + '][keterangan_others]">';
        hasil += '</td>';

        hasil += '<td>';
        hasil += '<button type="button" class="btn btn-sm btn-danger del_others" data-no="' + no_others + '"><i class="fa fa-trash"></i></button>';
        hasil += '</td>';

        hasil += '</tr>';

        $('.list_others').append(hasil);

        // $('.select_nm_aktifitas_' + no_activity).chosen();

        no_others = parseFloat(no_others + 1);
        $('.no_others').val(no_others);

        auto_num();
    }

    $(document).on('change', '.input_diskon_persen', function() {
        var persen = get_num($(this).val());
        var subtotal = get_num($('.summary_subtotal').html());

        var nilai_diskon = parseFloat(subtotal * persen / 100);

        $('.input_diskon_value').val(number_format(nilai_diskon, 2));

        hitung_summary();
    });

    $(document).on('change', '.input_diskon_value', function() {
        var nilai = get_num($(this).val());
        var subtotal = get_num($('.summary_subtotal').html());

        var persen_disc = parseFloat(nilai / subtotal * 100);

        $('.input_diskon_persen').val(persen_disc.toFixed(2));

        hitung_summary();
    });

    $(document).on('click', '#switch_akomodasi', function() {
        if ($(this).is(':checked')) {
            $('.box_akomodasi').fadeIn(500);
        } else {
            $('.box_akomodasi').fadeOut(500);
        }
    });

    $(document).on('click', '#switch_others', function() {
        if ($(this).is(':checked')) {
            $('.box_others').fadeIn(500);
        } else {
            $('.box_others').fadeOut(500);
        }
    });

    $(document).on('change', '.change_customer', function() {
        var id_customer = $(this).val();

        $.ajax({
            type: 'post',
            url: siteurl + active_controller + 'change_customer',
            data: {
                'id_customer': id_customer
            },
            cache: false,
            dataType: 'JSON',
            success: function(result) {
                if (result.status == 1) {
                    $('.pic').val(result.contact);
                    $('.address').val(result.address).val()
                } else {
                    swal({
                        type: 'warning ',
                        title: 'Failed !',
                        text: 'Please try again later !'
                    });
                }
            },
            error: function(result) {
                swal({
                    type: 'error ',
                    title: 'Error !',
                    text: 'Please try again later !'
                });
            }
        });
    });

    $(document).on('change', '.change_package', function() {
        var id_package = $(this).val();

        $.ajax({
            type: 'POST',
            url: siteurl + active_controller + 'change_package',
            data: {
                'id_package': id_package
            },
            cache: false,
            dataType: 'JSON',
            success: function(result) {
                $('.list_activity').html(result.hasil);
                auto_num();

                $('.ttl_act_bobot').html(number_format(result.ttl_bobot, 2));
                $('.ttl_act_mandays').html(number_format(result.ttl_mandays, 2));
                $('.ttl_act_price').html(number_format(result.ttl_price, 2));
                $('.ttl_act_check_point').html(number_format(result.ttl_check_point, 2));

                $('.no').val(result.no);

                hitung_summary();
            },
            error: function(result) {
                swal({
                    type: 'error',
                    title: 'Error !',
                    text: 'Please try again later !'
                });
            }
        });
    });

    $(document).on('change', '.change_aktifitas', function() {
        var no = $(this).data('no');
        var id_aktifitas = $(this).val();

        $.ajax({
            type: 'post',
            url: siteurl + active_controller + 'change_aktifitas',
            data: {
                'id_aktifitas': id_aktifitas
            },
            cache: false,
            dataType: 'JSON',
            success: function(result) {
                $('.input_bobot_' + no).val(result.bobot);
                $('.input_mandays_' + no).val(result.mandays);
                $('.input_price_' + no).val(result.price);
                $('.td_check_point_' + no).html('<button type="button" class="btn btn-xs btn-secondary">' + result.check_point + ' Point</button>');

                hitung_total_activity();
            },
            else: function(result) {
                swal({
                    type: 'error',
                    title: 'Error !',
                    text: 'Please try again later !'
                });
            }
        });
    });

    $(document).on('click', '.del_aktifitas', function() {
        var no = $(this).data('no');

        $('.tr_aktifitas_' + no).remove();


        hitung_total_activity();
    });

    $(document).on('click', '.del_akomodasi', function() {
        var no_akomodasi = $(this).data('no');

        $('.tr_akomodasi_' + no_akomodasi).remove();

        hitung_all_akomodasi();
    });

    $(document).on('click', '.del_others', function() {
        var no_others = $(this).data('no');

        $('.tr_others_' + no_others).remove();

        hitung_all_others();
    });

    $(document).on('change', '.include_ppn', function() {
        hitung_summary();
    });

    $(document).on('submit', '.form-data', function(e) {
        e.preventDefault();

        swal({
            type: 'warning',
            title: 'Are you sure ?',
            text: 'This data will be saved !',
            showCancelButton: true
        }, function(next) {
            if (next) {
                var formData = new FormData($('.form-data')[0]);

                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'save_penawaran',
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    dataType: 'JSON',
                    success: function(result) {
                        if (result.status == 1) {
                            swal({
                                type: 'success',
                                title: 'Success',
                                text: result.msg
                            }, function(after) {
                                window.location.href = siteurl + active_controller;
                            });
                        } else {
                            swal({
                                type: 'failed',
                                title: 'Failed !',
                                text: result.msg
                            });
                        }
                    },
                    error: function(result) {
                        swal({
                            type: 'error',
                            title: 'Error !',
                            text: 'Please try again later !'
                        });
                    }
                });
            }
        });
    });

    $(document).on('click', '.approve_penawaran', function() {
        var id_penawaran = $('.id_quotation').val();

        swal({
            type: 'warning',
            title: 'Are you sure ?',
            text: 'You will approve this quotation !',
            showCancelButton: true
        }, function(next) {
            if (next) {
                $.ajax({
                    type: "POST",
                    url: siteurl + active_controller + 'approve_penawaran',
                    data: {
                        'id_penawaran': id_penawaran
                    },
                    cache: false,
                    dataType: "JSON",
                    success: function(result) {
                        if (result.status == 1) {
                            swal({
                                type: 'success',
                                title: 'Success !',
                                text: result.pesan,
                            }, function(after) {
                                window.location.href = siteurl + active_controller;
                            });
                        } else {
                            swal({
                                type: 'warning',
                                title: 'Failed !',
                                text: result.pesan,
                            });
                        }
                    },
                    error: function(result) {
                        swal({
                            type: 'error',
                            title: 'Error !',
                            text: 'Please try again later !',
                        });
                    }
                });
            }
        });
    });

    $(document).on('click', '.reject_penawaran', function() {
        var id_penawaran = $('.id_quotation').val();
        var reject_reason = $('.reject_reason').val();

        swal({
            type: 'warning',
            title: 'Are you sure ?',
            text: 'You will reject this quotation !',
            showCancelButton: true
        }, function(next) {
            if (next) {
                $.ajax({
                    type: "POST",
                    url: siteurl + active_controller + 'reject_penawaran',
                    data: {
                        'id_penawaran': id_penawaran,
                        'reject_reason': reject_reason
                    },
                    cache: false,
                    dataType: "JSON",
                    success: function(result) {
                        if (result.status == 1) {
                            swal({
                                type: 'success',
                                title: 'Success !',
                                text: result.pesan,
                            }, function(after) {
                                window.location.href = siteurl + active_controller;
                            });
                        } else {
                            swal({
                                type: 'warning',
                                title: 'Failed !',
                                text: result.pesan,
                            });
                        }
                    },
                    error: function(result) {
                        swal({
                            type: 'error',
                            title: 'Error !',
                            text: 'Please try again later !',
                        });
                    }
                });
            }
        });
    });
</script>
<script src="<?= base_url('assets/js/basic.js') ?>"></script>