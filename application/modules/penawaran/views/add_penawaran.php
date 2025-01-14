<?php
$ENABLE_ADD     = has_permission('Penawaran.Add');
$ENABLE_MANAGE  = has_permission('Penawaran.Manage');
$ENABLE_VIEW    = has_permission('Penawaran.View');
$ENABLE_DELETE  = has_permission('Penawaran.Delete');
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


    .chosen-container .chosen-drop {
        z-index: 9999;
        /* Ensure the dropdown itself has a high z-index */
    }

    .chosen-container-active {
        position: absolute;
    }

    */
</style>
<div id="alert_edit" class="alert alert-success alert-dismissable" style="padding: 15px; display: none;"></div>

<form action="" method="post" class="form-data" enctype="multipart/form-data">
    <div class="box">

        <!-- /.box-header -->
        <div class="box-body">
            <table border='0' style="width: 100%;">
                <tr>
                    <td class="pd-5 semi-bold" valign="top">Number</td>
                    <td class="pd-5" width="390" valign="top">
                        <input type="text" name="" id="" class="form-control form-control-sm" readonly>
                    </td>
                    <td class="pd-5 semi-bold" valign="top">Date</td>
                    <td class="pd-5" width="390" valign="top">
                        <input type="date" name="tgl_quotation" id="" class="form-control form-control-sm" value="<?= date('Y-m-d') ?>" required>
                    </td>
                </tr>
                <tr>
                    <td class="pd-5 semi-bold" valign="top">Customer</td>
                    <td class="pd-5" width="390" valign="top">
                        <select name="customer" id="" class="form-control form-control-sm change_customer select_customer" required>
                            <option value="">- Select Customer -</option>
                            <?php
                            foreach ($list_customers as $item) {
                                echo '<option value="' . $item->id_customer . '">' . strtoupper($item->nm_customer) . '</option>';
                            }
                            ?>
                        </select>
                    </td>
                    <td class="pd-5 semi-bold" valign="top">Sales</td>
                    <td class="pd-5" width="390" valign="top">
                        <select name="marketing" id="" class="form-control form-control-sm select_marketing">
                            <option value="">- Select Sales -</option>
                            <?php
                            foreach ($list_marketing as $item) {
                                echo '<option value="' . $item->id . '">' . ucfirst($item->nm_karyawan) . '</option>';
                            }
                            ?>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="pd-5 semi-bold" valign="top">PIC</td>
                    <td class="pd-5" width="390" valign="top">
                        <input type="text" name="pic" id="" class="form-control form-control-sm pic" readonly>
                    </td>
                    <td class="pd-5 semi-bold" valign="top">Address</td>
                    <td class="pd-5" width="390" valign="top">
                        <input type="text" name="address" id="" class="form-control form-control-sm address">
                    </td>
                </tr>
                <tr>
                    <td class="pd-5 semi-bold" valign="top">Informasi Awal</td>
                    <td class="pd-5" width="390" valign="top">
                        <table style="width: 100%;" border="0">
                            <tr>
                                <td style="padding: 0.2rem;">
                                    <input type="checkbox" name="check_info_awal_sales" id="" class="check_info_awal_sales"> Sales
                                </td>
                                <td style="padding: 0.2rem;">
                                    <select name="informasi_awal_sales" id="" class="form-control form-control-sm informasi_awal_sales">
                                        <option value="">- Select Sales -</option>
                                        <?php
                                        foreach ($list_marketing as $item) {
                                            echo '<option value="' . $item->id . '">' . ucfirst($item->nm_karyawan) . '</option>';
                                        }
                                        ?>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 0.2rem;">
                                    <input type="checkbox" name="check_info_awal_medsos" id="" class="check_info_awal_medsos"> Medsos
                                </td>
                                <td style="padding: 0.2rem;">
                                    <select name="informasi_awal_medsos" id="" class="form-control form-control-sm informasi_awal_medsos">
                                        <option value="">- Select Medsos -</option>
                                        <option value="Youtube">Youtube</option>
                                        <option value="Instagram">Instagram</option>
                                        <option value="Linkedin">Linkedin</option>
                                        <option value="Website">Website</option>
                                        <option value="Facebook">Facebook</option>
                                        <option value="Incoming Call">Incoming Call</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 0.2rem;">
                                    <input type="checkbox" name="check_info_awal_others" id="" class="check_info_awal_others"> Others
                                </td>
                                <td style="padding: 0.2rem;">
                                    <select name="informasi_awal_others" id="" class="form-control form-control-sm informasi_awal_others">
                                        <option value="">- Select Employee -</option>
                                        <?php
                                        foreach ($list_marketing as $item) {
                                            echo '<option value="' . $item->id . '">' . ucfirst($item->nm_karyawan) . '</option>';
                                        }
                                        ?>
                                    </select>
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="pd-5 semi-bold" valign="top">Upload Proposal</td>
                    <td class="pd-5" width="390" valign="top">
                        <input type="file" name="upload_proposal" id="" class="form-control form-control-sm">
                    </td>
                </tr>
                <tr>
                    <td class="pd-5 semi-bold" valign="top">Consultation Package</td>
                    <td class="pd-5" width="390" valign="top">
                        <select name="consultation_package" class="form-control form-control-sm change_package select_package" required>
                            <option value="">- Select Consultation Package -</option>
                            <?php
                            foreach ($list_package as $item) {
                                echo '<option value="' . $item->id_konsultasi_h . '">' . $item->nm_paket . '</option>';
                            }
                            ?>
                        </select>
                    </td>
                    <td class="pd-5 semi-bold" valign="top"></td>
                    <td class="pd-5" width="390" valign="top">

                    </td>
                </tr>
                <tr>
                    <td class="pd-5 semi-bold" valign="top">Divisi</td>
                    <td class="pd-5" width="390" valign="top">
                        <input type="hidden" name="nm_divisi" class="nm_divisi" value="">
                        <select name="divisi" class="form-control form-control-sm change_divisi select_divisi" required>
                            <option value="">- Select Divisi -</option>
                            <?php
                            foreach ($list_divisi as $item) {
                                echo '<option value="' . $item->id . '">' . $item->nama . '</option>';
                            }
                            ?>
                        </select>
                    </td>
                    <td class="pd-5 semi-bold" valign="top"></td>
                    <td class="pd-5" width="390" valign="top">

                    </td>
                </tr>
            </table>
        </div>
        <!-- /.box-body -->
    </div>

    <div class="box">
        <div class="box-header">
            <h4 class="semi-bold">
                Activity List
                <div style="float: right">
                    <button class="btn btn-sm btn-success add_activity">
                        <i class="fa fa-plus"></i> Add
                    </button>
                </div>
            </h4>
        </div>

        <div class="box-body">
            <table class="table custom-table">
                <thead>
                    <tr>
                        <th class="text-center">No.</th>
                        <th class="text-center">Activity Name</th>
                        <th class="text-center">Mandays Internal</th>
                        <th class="text-center">Mandays Rate Internal</th>
                        <th class="text-center">Mandays Subcont</th>
                        <th class="text-center">Mandays Rate Subcont</th>
                        <th class="text-center">Mandays Tandem</th>
                        <th class="text-center">Mandays Rate Tandem</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Action</th>
                    </tr>
                </thead>
                <tbody class="list_activity">

                </tbody>
                <tfoot>
                    <tr>
                        <th class="text-center"></th>
                        <th class="text-center">Total</th>
                        <th class="text-center ttl_act_mandays">00,0</th>
                        <th class="text-center ttl_act_mandays_rate">00,0</th>
                        <th class="text-center ttl_act_mandays_subcont">00,0</th>
                        <th class="text-center ttl_act_mandays_rate_subcont">00,0</th>
                        <th class="text-center ttl_act_mandays_tandem">00,0</th>
                        <th class="text-center ttl_act_mandays_rate_tandem">00,0</th>
                        <th class="text-center ttl_act_price">00,0</th>
                        <th class="text-center"></th>
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
                        <input type="checkbox" name="switch_akomodasi" class="onoffswitch-checkbox" id="switch_akomodasi">
                        <label class="onoffswitch-label" for="switch_akomodasi">
                            <span class="onoffswitch-inner"></span>
                            <span class="onoffswitch-switch"></span>
                        </label>
                    </div>
                </div>
            </h4>
        </div>
        <div class="box-body box_akomodasi d-none">
            <div style="float: right; margin-bottom: 1rem;">
                <button type="button" class="btn btn-sm btn-success add_akomodasi">
                    <i class="fa fa-plus"></i> Add
                </button>
            </div>

            <br>

            <table class="table custom-table" style="border-radius: 1px !important; overflow: hidden;">
                <thead>
                    <tr>
                        <th class="text-center">Item</th>
                        <th class="text-center">Qty</th>
                        <th class="text-center">Price/Unit</th>
                        <th class="text-center">Total</th>
                        <th class="text-center">Keterangan</th>
                        <th class="text-center">Opsi</th>
                    </tr>
                </thead>
                <tbody class="list_akomodasi"></tbody>
                <tfoot>
                    <tr>
                        <th colspan="3">
                            Total
                        </th>
                        <th class="text-center ttl_ako_grand_total">000,00</th>
                        <th></th>
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
                        <input type="checkbox" name="switch_others" class="onoffswitch-checkbox" id="switch_others">
                        <label class="onoffswitch-label" for="switch_others">
                            <span class="onoffswitch-inner"></span>
                            <span class="onoffswitch-switch"></span>
                        </label>
                    </div>
                </div>
            </h4>
        </div>
        <div class="box-body box_others d-none">
            <div style="float: right; margin-bottom: 1rem;">
                <button type="button" class="btn btn-sm btn-success add_others">
                    <i class="fa fa-plus"></i> Add
                </button>
            </div>

            <br>

            <table class="table custom-table">
                <thead>
                    <tr>
                        <th class="text-center">Item</th>
                        <th class="text-center">Qty</th>
                        <th class="text-center">Price/Unit</th>
                        <th class="text-center">Total</th>
                        <th class="text-center">Keterangan</th>
                        <th class="text-center">Opsi</th>
                    </tr>
                </thead>
                <tbody class="list_others"></tbody>
                <tfoot>
                    <tr>
                        <th colspan="3">
                            Total
                        </th>
                        <th class="text-center ttl_oth_grand_total">000,00</th>
                        <th></th>
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
                        <input id="input-id" type="checkbox" class="include_ppn" name="include_ppn" value="1">
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
                        <td class="text-right summary_konsultasi">0.00</td>
                    </tr>
                    <tr>
                        <td class="text-left">Akomodasi</td>
                        <td class="text-right summary_akomodasi">0.00</td>
                    </tr>
                    <tr>
                        <td class="text-left">Others</td>
                        <td class="text-right summary_others">0.00</td>
                    </tr>
                    <tr>
                        <td class="text-left"><b>Subtotal</b></td>
                        <td class="text-right summary_subtotal">0.00</td>
                    </tr>
                    <tr>
                        <td class="text-left"><b>Discount</b></td>
                        <td class="text-right">
                            <div class="form-inline">
                                <input type="text" name="persen_disc" id="" class="form-control form-control-sm text-right input_diskon_persen" placeholder="Discount (%)" style="max-width: 30%;">
                                <input type="text" name="nilai_disc" id="" class="form-control form-control-sm text-right auto_num input_diskon_value" placeholder="Discount (Rp)" style="max-width: 30%;">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-left"><b>Price after discount</b></td>
                        <td class="text-right summary_price_after_disc">0.00</td>
                    </tr>
                    <tr>
                        <td class="text-left">PPN</td>
                        <td class="text-right summary_ppn">0.00</td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <td class="text-left"><b>Grand Total</b></td>
                        <td class="text-right summary_grand_total">0.00</td>
                    </tr>
                </tfoot>
            </table>

            <input type="hidden" class="grand_total" name="grand_total">

        </div>
    </div>

    <div class="box">
        <div class="box-header"></div>
        <div class="box-body">
            <div class="col-md-6">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th colspan="3">Detail Other Summary</th>
                        </tr>
                    </thead>
                    <tr>
                        <td>Total Mandays</td>
                        <td class="text-center">:</td>
                        <td class="text-right">
                            <input type="hidden" name="ttl_total_mandays" value="0">
                            <span class="ttl_total_mandays">0</span>
                        </td>
                    </tr>
                    <tr>
                        <td>Mandays Tandem</td>
                        <td class="text-center">:</td>
                        <td class="text-right">
                            <input type="hidden" name="ttl_mandays_tandem">
                            <span class="ttl_mandays_tandem">0</span>
                        </td>
                    </tr>
                    <tr>
                        <td>Mandays Subcont</td>
                        <td class="text-center">:</td>
                        <td class="text-right">
                            <input type="hidden" name="ttl_mandays_subcont">
                            <span class="ttl_mandays_subcont">0</span>
                        </td>
                    </tr>
                    <tr>
                        <td>Mandays Internal</td>
                        <td class="text-center">:</td>
                        <td class="text-right">
                            <input type="hidden" name="ttl_mandays_internal">
                            <span class="ttl_mandays_internal">0</span>
                        </td>
                    </tr>
                    <tr>
                        <td>Mandays Rate</td>
                        <td class="text-center">:</td>
                        <td class="text-right ">
                            <input type="hidden" name="ttl_mandays_rate" value="">
                            <span class="ttl_mandays_rate">Rp. 0</span>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="col-md-12">
                <div style="float: right; margin-top: 1rem;top: 0;">
                    <a href="<?= base_url('penawaran') ?>" class="btn btn-sm btn-danger">
                        <i class="fa fa-arrow-left"></i> Back
                    </a>
                    <button type="submit" class="btn btn-sm btn-success">
                        <i class="fa fa-save"></i> Save
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>

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
    $('.select_divisi').chosen();
    $('.informasi_awal_sales').chosen({
        width: "300px"
    });
    $('.informasi_awal_medsos').chosen({
        width: "300px"
    });
    $('.informasi_awal_others').chosen({
        width: "300px"
    });

    // initialize with defaults
    $("#input-id").checkboxX({
        threeState: false,
        size: 'sm'
    });

    $(document).ready(function() {
        auto_num();
    });

    $(document).on('click', '.check_info_awal_sales', function() {
        if ($(this).is(':checked')) {
            $('.informasi_awal_sales').attr('disabled', false);
        } else {
            $('.informasi_awal_sales').attr('disabled', true);
        }

        $('.check_info_awal_medsos').attr('checked', false);
        $('.check_info_awal_others').attr('checked', false);
    });

    $(document).on('click', '.check_info_awal_medsos', function() {
        if ($(this).is(':checked')) {
            $('.informasi_awal_medsos').attr('disabled', false);
        } else {
            $('.informasi_awal_medsos').attr('disabled', true);
        }

        $('.check_info_awal_sales').attr('checked', false);
        $('.check_info_awal_others').attr('checked', false);
    });

    $(document).on('click', '.check_info_awal_others', function() {
        if ($(this).is(':checked')) {
            $('.informasi_awal_others').attr('disabled', false);
        } else {
            $('.informasi_awal_others').attr('disabled', true);
        }

        $('.check_info_awal_sales').attr('checked', false);
        $('.check_info_awal_medsos').attr('checked', false);
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

        var ttl_mandays = 0;
        var ttl_mandays_rate = 0;
        var ttl_mandays_subcont = 0;
        var ttl_mandays_rate_subcont = 0;
        var ttl_mandays_tandem = 0;
        var ttl_mandays_rate_tandem = 0;
        var ttl_price = 0;

        var arr_id_aktifitas = [];

        for (i = 1; i < no_activity; i++) {
            if ($('.select_nm_aktifitas_' + i).length) {
                var mandays = get_num($('input[name="dt_act[' + i + '][mandays]"]').val());
                var mandays_rate = get_num($('input[name="dt_act[' + i + '][mandays_rate]"]').val());
                var mandays_subcont = get_num($('input[name="dt_act[' + i + '][mandays_subcont]"]').val());
                var mandays_rate_subcont = get_num($('input[name="dt_act[' + i + '][mandays_rate_subcont]"]').val());
                var mandays_tandem = get_num($('input[name="dt_act[' + i + '][mandays_tandem]"]').val());
                var mandays_rate_tandem = get_num($('input[name="dt_act[' + i + '][mandays_rate_tandem]"]').val());

                ttl_mandays += mandays;
                ttl_mandays_rate += mandays_rate;
                ttl_mandays_subcont += mandays_subcont;
                ttl_mandays_rate_subcont += mandays_rate_subcont;
                ttl_mandays_tandem += mandays_tandem;
                ttl_mandays_rate_tandem += mandays_rate_tandem;
                ttl_price += ((mandays * mandays_rate) + (mandays_subcont * mandays_rate_subcont) + (mandays_tandem * mandays_rate_tandem));

                $('.input_harga_aktifitas_' + i).val(number_format(((mandays * mandays_rate) + (mandays_subcont * mandays_rate_subcont) + (mandays_tandem * mandays_rate_tandem)), 2));

                var id_aktifitas = $('.select_nm_aktifitas_' + i).val();
                if (id_aktifitas !== '') {
                    arr_id_aktifitas.push(id_aktifitas);
                }
            }
        }

        // if (arr_id_aktifitas.length > 0) {
        //     $.ajax({
        //         type: 'post',
        //         url: siteurl + active_controller + 'hitung_ttl_check_point',
        //         data: {
        //             'id_aktifitas': id_aktifitas
        //         },
        //         cache: false,
        //         success: function(result) {
        //             $('.ttl_act_check_point').html(number_format(result, 2));
        //         }
        //     });
        // }

        $('.ttl_act_mandays').html(number_format(ttl_mandays, 2));
        $('.ttl_act_mandays_rate').html(number_format(ttl_mandays_rate, 2));
        $('.ttl_act_mandays_subcont').html(number_format(ttl_mandays_subcont, 2));
        $('.ttl_act_mandays_rate_subcont').html(number_format(ttl_mandays_rate_subcont, 2));
        $('.ttl_act_mandays_tandem').html(number_format(ttl_mandays_tandem, 2));
        $('.ttl_act_mandays_rate_tandem').html(number_format(ttl_mandays_rate_tandem, 2));
        $('.ttl_act_price').html(number_format(ttl_price, 2));

        hitung_summary();
        hitung_detail_other_summary();
    }

    function hitung_item_akomodasi(no) {
        var qty = get_num($('input[name="dt_ako[' + no + '][qty_akomodasi]"]').val());
        var harga = get_num($('input[name="dt_ako[' + no + '][harga_akomodasi]"]').val());

        var total = parseFloat(qty * harga);

        $('input[name="dt_ako[' + no + '][total_akomodasi]"]').val(number_format(total, 2));

        hitung_all_akomodasi();

        hitung_summary();
        hitung_detail_other_summary();
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
        hitung_detail_other_summary();
    }

    function hitung_item_others(no) {
        var qty = get_num($('input[name="dt_oth[' + no + '][qty_others]"]').val());
        var harga = get_num($('input[name="dt_oth[' + no + '][harga_others]"]').val());

        var total = parseFloat(qty * harga);

        $('input[name="dt_oth[' + no + '][total_others]"]').val(number_format(total, 2));

        hitung_all_others();
        hitung_detail_other_summary();
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
        hitung_detail_other_summary();
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

        hasil += '<td class="text-center">' + no_activity + '</td>';

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
        hasil += '<input type="text" class="form-control form-control-sm auto_num text-right input_mandays_' + no_activity + '" name="dt_act[' + no_activity + '][mandays]" value="" onchange="hitung_total_activity()">';
        hasil += '</td>';

        hasil += '<td class="text-center">';
        hasil += '<input type="text" class="form-control form-control-sm auto_num text-right input_mandays_rate_' + no_activity + '" name="dt_act[' + no_activity + '][mandays_rate]" value="" onchange="hitung_total_activity()">';
        hasil += '</td>';

        hasil += '<td class="text-center">';
        hasil += '<input type="text" class="form-control form-control-sm auto_num text-right input_mandays_subcont_' + no_activity + '" name="dt_act[' + no_activity + '][mandays_subcont]" value="" onchange="hitung_total_activity()">';
        hasil += '</td>';

        hasil += '<td class="text-center">';
        hasil += '<input type="text" class="form-control form-control-sm auto_num text-right input_mandays_rate_subcont_' + no_activity + '" name="dt_act[' + no_activity + '][mandays_rate_subcont]" value="" onchange="hitung_total_activity()">';
        hasil += '</td>';

        hasil += '<td class="text-center">';
        hasil += '<input type="text" class="form-control form-control-sm auto_num text-right input_mandays_tandem_' + no_activity + '" name="dt_act[' + no_activity + '][mandays_tandem]" value="" onchange="hitung_total_activity()">';
        hasil += '</td>';

        hasil += '<td class="text-center">';
        hasil += '<input type="text" class="form-control form-control-sm auto_num text-right input_mandays_rate_tandem_' + no_activity + '" name="dt_act[' + no_activity + '][mandays_rate_tandem]" value="" onchange="hitung_total_activity()">';
        hasil += '</td>';

        hasil += '<td class="text-center">';
        hasil += '<input type="text" class="form-control form-control-sm auto_num text-right input_harga_aktifitas_' + no_activity + '" name="dt_act[' + no_activity + '][harga_aktifitas]" value="" onchange="hitung_total_activity()">';
        hasil += '</td>';

        hasil += '<td class="text-center">';
        hasil += '<button type="button" class="btn btn-sm btn-danger del_aktifitas" data-no="' + no_activity + '"><i class="fa fa-trash"></i></button>';
        hasil += '</td>';

        hasil += '</tr>';

        $('.list_activity').append(hasil);

        $('.select_nm_aktifitas_' + no_activity).chosen({
            width: '280px'
        });

        no_activity = parseFloat(no_activity + 1);
        $('.no').val(no_activity);

        auto_num();
    }

    function addAkomodasi() {
        var no_akomodasi = parseFloat($('.no_akomodasi').val());

        var hasil = '<tr class="tr_akomodasi_' + no_akomodasi + '">';

        hasil += '<td>';
        hasil += '<select class="form-control form-control-sm select_akomodasi_' + no_akomodasi + '" name="dt_ako[' + no_akomodasi + '][id_akomodasi]">';
        hasil += '<option value="">- Item Akomodasi -</option>';
        <?php
        foreach ($list_def_akomodasi as $item) {
        ?>

            hasil += '<option value="<?= $item->id ?>"><?= $item->nm_biaya ?></option>';

        <?php
        }
        ?>
        hasil += '</select>';
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

        $('.select_akomodasi_' + no_akomodasi).chosen({
            width: '280px'
        });

        no_akomodasi = parseFloat(no_akomodasi + 1);
        $('.no_akomodasi').val(no_akomodasi);

        auto_num();
    }

    function addAOthers() {
        var no_others = parseFloat($('.no_others').val());

        var hasil = '<tr class="tr_others_' + no_others + '">';

        hasil += '<td>';
        hasil += '<select class="form-control form-control-sm select_others_' + no_others + '" name="dt_oth[' + no_others + '][id_others]">';
        hasil += '<option value="">- Item Others -</option>';
        <?php
        foreach ($list_def_others as $item) {
        ?>

            hasil += '<option value="<?= $item->id ?>"><?= $item->nm_biaya ?></option>';

        <?php
        }
        ?>
        hasil += '</select>';
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

        $('.select_others_' + no_others).chosen({
            width: '280px'
        });

        no_others = parseFloat(no_others + 1);
        $('.no_others').val(no_others);

        auto_num();
    }

    function hitung_detail_other_summary() {
        var max_no = 1;
        $('.tr_no').each(function() {
            var value = get_num($(this).text());

            max_no = value;
        });

        var max_no_akomodasi = get_num($('.no_akomodasi').val());

        var ttl_total_mandays = 0;
        var ttl_mandays_subcont = 0;
        var ttl_mandays_tandem = 0;
        var ttl_mandays_internal = 0;

        var ttl_nilai_project = 0;
        var ttl_akomodasi = 0;
        var ttl_others = 0;
        var ttl_subcont = 0;
        var ttl_tandem = 0;

        for (i = 1; i <= max_no; i++) {
            var mandays_internal = get_num($('input[name="dt_act[' + i + '][mandays]"]').val());
            var mandays_rate_internal = get_num($('input[name="dt_act[' + i + '][mandays_rate]"]').val());
            var mandays_subcont = get_num($('input[name="dt_act[' + i + '][mandays_subcont]"]').val());
            var mandays_rate_subcont = get_num($('input[name="dt_act[' + i + '][mandays_rate_subcont]"]').val());
            var mandays_tandem = get_num($('input[name="dt_act[' + i + '][mandays_tandem]"]').val());
            var mandays_rate_tandem = get_num($('input[name="dt_act[' + i + '][mandays_rate_tandem]"]').val());

            // ttl_total_mandays += (mandays_internal + mandays_subcont + mandays_tandem);
            ttl_total_mandays += (mandays_internal);
            ttl_mandays_subcont += (mandays_subcont);
            ttl_mandays_tandem += (mandays_tandem);

            ttl_nilai_project += ((mandays_internal * mandays_rate_internal) + (mandays_subcont * mandays_rate_subcont) + (mandays_tandem * mandays_rate_tandem));
            ttl_subcont += (mandays_subcont * mandays_rate_subcont);
            ttl_tandem += (mandays_tandem * mandays_rate_tandem);
        }



        var ttl_mandays_internal = (ttl_total_mandays - ttl_mandays_subcont - ttl_mandays_tandem);

        for (i = 1; i <= max_no_akomodasi; i++) {
            total_akomodasi = get_num($('input[name="dt_ako[' + i + '][total_akomodasi]"]').val());

            ttl_akomodasi += total_akomodasi;
        }



        var max_no_others = get_num($('.no_others').val());
        for (i = 1; i <= max_no_others; i++) {
            total_others = get_num($('input[name="dt_oth[' + i + '][total_others]"]').val());

            ttl_others += total_others;
        }

        var disc_nilai = get_num($('.input_diskon_value').val());

        var nilai_project = (ttl_nilai_project + ttl_akomodasi + ttl_others);
        nilai_project = (nilai_project - disc_nilai);
        
        var mandays_rate = ((nilai_project - ttl_akomodasi - ttl_others) / ttl_total_mandays);
        
        // alert(mandays_rate);

        $('.ttl_total_mandays').html(number_format(ttl_total_mandays));
        $('input[name="ttl_total_mandays"]').val(ttl_total_mandays);
        $('.ttl_mandays_tandem').html(number_format(ttl_mandays_tandem));
        $('input[name="ttl_mandays_tandem"]').val(ttl_mandays_tandem);
        $('.ttl_mandays_subcont').html(number_format(ttl_mandays_subcont));
        $('input[name="ttl_mandays_subcont"]').val(ttl_mandays_subcont);
        $('.ttl_mandays_internal').html(number_format(ttl_mandays_internal));
        $('input[name="ttl_mandays_internal"]').val(ttl_mandays_internal);
        $('.ttl_mandays_rate').html('Rp. ' + number_format(mandays_rate));
        $('input[name="ttl_mandays_rate"]').val(mandays_rate);

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

                $('.ttl_act_mandays').html(number_format(result.ttl_mandays, 2));
                $('.ttl_act_mandays_rate').html(number_format(result.ttl_mandays_rate, 2));
                $('.ttl_act_price').html(number_format(result.ttl_price, 2));

                $('.no').val(result.no);

                for (i = 1; i <= result.no; i++) {
                    $('.select_nm_aktifitas_' + i).chosen({
                        width: '280px'
                    });
                }

                hitung_summary();
                hitung_detail_other_summary();
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

    $(document).on('change', '.change_divisi', function() {
        var id_divisi = $(this).val();

        $.ajax({
            type: 'post',
            url: siteurl + active_controller + 'get_nm_divisi',
            data: {
                'id_divisi': id_divisi
            },
            dataType: 'json',
            cache: false,
            success: function(result) {
                $('.nm_divisi').val(result.nm_divisi);
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
</script>
<script src="<?= base_url('assets/js/basic.js') ?>"></script>