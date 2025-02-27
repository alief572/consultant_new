<?php
$ENABLE_ADD     = has_permission('Kasbon_Project.Add');
$ENABLE_MANAGE  = has_permission('Kasbon_Project.Manage');
$ENABLE_VIEW    = has_permission('Kasbon_Project.View');
$ENABLE_DELETE  = has_permission('Kasbon_Project.Delete');
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

    .valign-middle {
        vertical-align: middle !important;
    }
</style>

<form action="" method="post" id="frm-data" enctype="multipart/form-data">
    <div class="box">
        <div class="box-header">

        </div>

        <div class="box-body">
            <table border="0" style="width: 100%;">
                <tr>
                    <th class="pd-5 valign-top" width="150">No. SPK</th>
                    <td class="pd-5 valign-top" width="400"><?= $list_budgeting->id_spk_penawaran ?></td>
                    <th class="pd-5 valign-top" width="150">Project Leader</th>
                    <td class="pd-5 valign-top" width="400"><?= ucfirst($list_budgeting->nm_project_leader) ?></td>
                </tr>
                <tr>
                    <th class="pd-5 valign-top" width="150">Customer</th>
                    <td class="pd-5 valign-top" width="400"><?= $list_budgeting->nm_customer ?></td>
                    <th class="pd-5 valign-top" width="150">Sales</th>
                    <td class="pd-5 valign-top" width="400"><?= ucfirst($list_budgeting->nm_sales) ?></td>
                </tr>
                <tr>
                    <th class="pd-5 valign-top" width="150">Address</th>
                    <td class="pd-5 valign-top" width="400"><?= $list_budgeting->alamat ?></td>
                    <th class="pd-5 valign-top" width="150">Waktu</th>
                    <td class="pd-5 valign-top" width="400">
                        <div class="form-inline">
                            <div class="form-group">
                                <input type="date" name="" id="" class="form-control form-control-sm" value="<?= $list_budgeting->waktu_from ?>" readonly>
                            </div>
                            <div class="form-group text-center" style="width: 50px; padding-top: 8px;">
                                <span>-</span>
                            </div>
                            <div class="form-group">
                                <input type="date" name="" id="" class="form-control form-control-sm" value="<?= $list_budgeting->waktu_to ?>" readonly>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th class="pd-5 valign-top" width="150">Project</th>
                    <td class="pd-5 valign-top" width="400"><?= $list_budgeting->nm_project ?></td>
                    <th class="pd-5 valign-top" width="150"></th>
                    <td class="pd-5 valign-top" width="400"></td>
                </tr>
                <tr>
                    <th class="pd-5 valign-top" width="150">Tanggal</th>
                    <td class="pd-5 valign-top" width="400"><?= date('d F Y', strtotime($header->tgl)) ?></td>
                    <th class="pd-5 valign-top" width="150">Description</th>
                    <td class="pd-5 valign-top" width="400"><?= $header->deskripsi ?></td>
                </tr>
            </table>
        </div>
    </div>

    <div class="box">
        <div class="box-header">
            <h4 style="font-weight: 800;">List Item Others</h4>
        </div>

        <div class="box-body">
            <table class="table custom-table">
                <thead>
                    <tr>
                        <th rowspan="2" class="text-center" valign="middle">No.</th>
                        <th rowspan="2" class="text-center" valign="middle" width="170">Item</th>
                        <th colspan="2" class="text-center">Estimasi</th>
                        <th rowspan="2" class="text-center" valign="middle">Total Budget</th>
                        <th colspan="3" class="text-center">Pengajuan</th>
                        <th rowspan="2" class="text-center" valign="middle">Sisa Qty</th>
                        <th rowspan="2" class="text-center" valign="middle">Sisa Budget</th>
                    </tr>
                    <tr>
                        <th class="text-center">Qty</th>
                        <th class="text-center">Price / Unit</th>
                        <th class="text-center">Qty</th>
                        <th class="text-center">Price / Unit</th>
                        <th class="text-center">Total Pengajuan</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $no = 0;

                    $ttl_qty_peng = 0;
                    $ttl_nominal_peng = 0;
                    $ttl_total_peng = 0;

                    $ttl_est_qty = 0;
                    $ttl_est_price_unit = 0;
                    $ttl_est_total_budget = 0;

                    $ttl_aktual_terpakai = 0;
                    $ttl_sisa_budget = 0;

                    foreach ($list_data_others as $item) {
                        if(isset($list_arr_kasbon[$item->id_item])) {
                            $no++;
    
                            $qty_pengajuan = (isset($list_arr_kasbon[$item->id_item])) ? $list_arr_kasbon[$item->id_item]['qty_pengajuan'] : 0;
                            $nominal_pengajuan = (isset($list_arr_kasbon[$item->id_item])) ? $list_arr_kasbon[$item->id_item]['nominal_pengajuan'] : 0;
                            $total_pengajuan = (isset($list_arr_kasbon[$item->id_item])) ? $list_arr_kasbon[$item->id_item]['total_pengajuan'] : 0;
                            $aktual_terpakai = (isset($list_arr_kasbon[$item->id_item])) ? $list_arr_kasbon[$item->id_item]['aktual_terpakai'] : 0;
                            $sisa_budget = (isset($list_arr_kasbon[$item->id_item])) ? $list_arr_kasbon[$item->id_item]['sisa_budget'] : 0;
    
                            echo '<tr>';
    
                            echo '<td class="text-center">' . $no . '</td>';
                            echo '<td>' . $item->nm_biaya . '</td>';
                            echo '<td class="text-center">' . number_format($item->qty_final) . '</td>';
                            echo '<td class="text-right">' . number_format($item->price_unit_final, 2) . '</td>';
                            echo '<td class="text-right">' . number_format($item->total_final, 2) . '</td>';
                            echo '<td class="text-center">' . number_format($qty_pengajuan, 2) . '</td>';
                            echo '<td class="text-right">' . number_format($nominal_pengajuan, 2) . '</td>';
                            echo '<td class="text-right">' . number_format($total_pengajuan, 2) . '</td>';
                            echo '<td class="text-center">' . number_format($aktual_terpakai - $qty_pengajuan, 2) . '</td>';
                            echo '<td class="text-right">' . number_format($sisa_budget - $total_pengajuan, 2) . '</td>';
    
                            echo '</tr>';
    
                            $ttl_qty_peng += $qty_pengajuan;
                            $ttl_nominal_peng += $nominal_pengajuan;
                            $ttl_total_peng += $total_pengajuan;
    
                            $ttl_est_qty += $item->qty_final;
                            $ttl_est_price_unit += $item->price_unit_final;
                            $ttl_est_total_budget += $item->total_final;
    
                            $ttl_aktual_terpakai += ($aktual_terpakai - $qty_pengajuan);
                            $ttl_sisa_budget += ($sisa_budget - $total_pengajuan);

                        }
                    }
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2" class="text-center">Total</td>
                        <td class="text-center"><?= number_format($ttl_est_qty) ?></td>
                        <td class="text-right"><?= number_format($ttl_est_price_unit, 2) ?></td>
                        <td class="text-right"><?= number_format($ttl_est_total_budget, 2) ?></td>
                        <td class="text-center ttl_qty_pengajuan"><?= number_format($ttl_qty_peng, 2) ?></td>
                        <td class="text-right"></td>
                        <td class="text-right ttl_pengajuan"><?= number_format($ttl_total_peng, 2) ?></td>
                        <td class="text-center"><?= number_format($ttl_aktual_terpakai, 2) ?></td>
                        <td class="text-right"><?= number_format($ttl_sisa_budget, 2) ?></td>
                    </tr>
                </tfoot>
            </table>

            <br><br>

            <div class="col-md-6">
                <table style="width: 100%">
                    <tr>
                        <th style="padding: 5px;">Document</th>
                        <td style="padding: 5px;">
                            <input type="file" name="kasbon_document" id="" class="form-control form-control-sm" disabled>
                            <?php
                            if (file_exists('./' . $header->dokument_link) && $header->dokument_link !== '') {
                                echo '<a href="' . base_url($header->dokument_link) . '" class="btn btn-sm btn-primary" target="_blank">
                                        <i class="fa fa-download"></i> Download
                                    </a>';
                            }
                            ?>
                        </td>
                    </tr>
                    <tr>
                        <th style="padding: 5px;">Bank</th>
                        <td style="padding: 5px;">
                            <input type="text" name="kasbon_bank" id="" class="form-control form-control-sm" placeholder="- Bank -" value="<?= $header->bank ?>" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th style="padding: 5px;">Bank Number</th>
                        <td style="padding: 5px;">
                            <input type="text" name="kasbon_bank_number" id="" class="form-control form-control-sm" placeholder="- Bank Number -" value="<?= $header->bank_number ?>" readonly>
                        </td>
                    </tr>
                    <tr>
                        <th style="padding: 5px;">Account Name</th>
                        <td style="padding: 5px;">
                            <input type="text" name="kasbon_bank_account" id="" class="form-control form-control-sm" placeholder="- Account Name -" value="<?= $header->bank_account ?>" readonly>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="col-md-12 mt-5">
                <a href="<?= base_url('kasbon_project/add_kasbon/' . urlencode(str_replace('/', '|', $list_budgeting->id_spk_budgeting))) ?>" class="btn btn-sm btn-danger">
                    <i class="fa fa-arrow-left"></i> Back
                </a>
            </div>
        </div>
    </div>
</form>


<script src="<?= base_url('assets/js/autoNumeric.js'); ?>"></script>
<script>
    $(document).ready(function() {
        $('.auto_num').autoNumeric();
    });

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

    function hitung_all_pengajuan() {
        var no = "<?= $no ?>";

        var ttl_qty = 0;
        var ttl_price = 0;

        for (i = 1; i <= no; i++) {
            var qty_pengajuan = get_num($('input[name="detail_akomodasi[' + i + '][qty_pengajuan]"]').val());
            var nominal_pengajuan = get_num($('input[name="detail_akomodasi[' + i + '][nominal_pengajuan]"]').val());

            ttl_qty += qty_pengajuan;
            ttl_price += nominal_pengajuan;
        }

        $('.ttl_qty_pengajuan').html(number_format(ttl_qty));
        $('.ttl_nominal_pengajuan').html(number_format(ttl_price, 2));
    }

    $(document).on('submit', '#frm-data', function(e) {
        e.preventDefault();

        var no = "<?= $no ?>";

        var valid = 1;

        for (i = 1; i <= no; i++) {
            var qty_pengajuan = get_num($('input[name="detail_akomodasi[' + i + '][qty_pengajuan]"]').val());
            var nominal_pengajuan = get_num($('input[name="detail_akomodasi[' + i + '][nominal_pengajuan]"]').val());
            var sisa_budget = get_num($('input[name="detail_akomodasi[' + i + '][sisa_budget]"]').val());

            if (valid == '1' && (qty_pengajuan * nominal_pengajuan) > sisa_budget) {
                valid = 0;
            }
        }

        if (valid == '0') {
            swal({
                type: 'warning',
                title: 'Warning !',
                text: 'Nominal pengajuan melebihi Sisa Budget !'
            });
        } else {
            swal({
                type: 'warning',
                title: 'Are you sure ?',
                text: 'This data will be saved !',
                showCancelButton: true
            }, function(next) {
                if (next) {
                    var formData = new FormData($('#frm-data')[0]);

                    $.ajax({
                        type: 'post',
                        url: siteurl + active_controller + 'save_kasbon_akomodasi',
                        data: formData,
                        cache: false,
                        processData: false,
                        contentType: false,
                        dataType: 'JSON',
                        success: function(result) {
                            if (result.status == '1') {
                                swal({
                                    type: 'success',
                                    title: 'Success !',
                                    text: result.pesan
                                }, function(lanjut) {
                                    window.location.href = siteurl + active_controller + "add_kasbon/<?= urlencode(str_replace('/', '|', $list_budgeting->id_spk_budgeting)) ?>"
                                });
                            } else {
                                swal({
                                    type: 'warning',
                                    title: 'Failed !',
                                    text: result.pesan
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
        }

    })
</script>