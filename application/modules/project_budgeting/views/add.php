<?php
$ENABLE_ADD     = has_permission('SPK.Add');
$ENABLE_MANAGE  = has_permission('SPK.Manage');
$ENABLE_VIEW    = has_permission('SPK.View');
$ENABLE_DELETE  = has_permission('SPK.Delete');
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
</style>

<form action="" method="post" id="frm-data">
    <div class="box">
        <div class="box-header">
            <h4>Data Client</h4>
        </div>

        <div class="box-body">

            <table border="0" style="width: 100%;">
                <tr>
                    <td class="pd-5 semi-bold" valign="top" width="110">Customer</td>
                    <td class="pd-5" width="400" valign="top">
                        <input type="text" name="customer" id="" class="form-control form-control-sm text-center" value="<?= $list_spk_penawaran->nm_customer ?>" readonly>
                    </td>
                    <!-- <td width="100"></td> -->
                    <td class="pd-5 semi-bold" valign="top" width="110">No. SPK</td>
                    <td class="pd-5" width="500" valign="top">
                        <input type="text" name="id_quotation" id="" class="form-control form-control-sm text-center" value="<?= $list_spk_penawaran->id_spk_penawaran ?>" readonly>
                    </td>
                </tr>
                <tr>
                    <td class="pd-5 semi-bold" valign="top" rowspan="2">Alamat</td>
                    <td class="pd-5" width="400" valign="top" rowspan="2">
                        <textarea name="alamat" id="" class="form-control form-control-sm" rows="4" readonly><?= $list_spk_penawaran->address ?></textarea>
                    </td>
                    <!-- <td width="100"></td> -->
                    <td class="pd-5 semi-bold" valign="top">No. NPWP</td>
                    <td class="pd-5" width="500" valign="top">
                        <input type="text" name="no_npwp" id="" class="form-control form-control-sm text-center" value="<?= $list_spk_penawaran->npwp_cust ?>" readonly> <br>
                    </td>
                </tr>
                <tr>
                    <td class="pd-5 semi-bold" valign="top"></td>
                    <td class="pd-5" width="500" valign="top">

                    </td>
                </tr>
                <tr>
                    <td class="pd-5 semi-bold" valign="top">PIC</td>
                    <td class="pd-5" width="400" valign="top">
                        <div class="form-inline">
                            <div class="form-group text-center">
                                <input type="text" name="pic" id="" class="form-control form-control-sm" value="<?= $list_spk_penawaran->nm_pic ?>" readonly>
                            </div>
                            <div class="form-group text-center" style="width: 100px;">
                                <label for="">Jabatan</label>
                            </div>
                            <div class="form-group text-center">
                                <input type="text" name="jabatan_pic" id="" class="form-control form-control-sm" value="<?= $list_spk_penawaran->jabatan_pic ?>" readonly>
                            </div>
                        </div>
                    </td>

                    <td class="pd-5" valign="top">

                    </td>
                </tr>
                <tr>
                    <td class="pd-5 semi-bold" valign="top">Kontak PIC</td>
                    <td class="pd-5" width="500" valign="top">
                        <input type="text" name="kontak_pic" id="" class="form-control form-control-sm" value="<?= $list_spk_penawaran->kontak_pic ?>" readonly>
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <div class="box">
        <div class="box-body">
            <table border="0" style="width: 100%">
                <tr>
                    <td class="pd-5 semi-bold" valign="top" width="120">
                        Project
                    </td>
                    <td class="pd-5" width="390" valign="top">
                        <input type="text" name="nm_paket" id="" class="form-control form-control-sm" value="<?= $list_spk_penawaran->nm_project ?>" readonly>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <!-- <td class="pd-5 semi-bold" valign="top" rowspan="2">Project</td>
                    <td class="pd-5" width="390" valign="top" rowspan="2">
                        <textarea name="" id="" class="form-control form-control-sm" readonly><?= $nm_paket ?></textarea>
                    </td> -->
                    <td class="pd-5 semi-bold" valign="top" width="120">Project Leader</td>
                    <td class="pd-5" width="390" valign="top">
                        <select name="project_leader" id="" class="form-control form-control-sm select_project_leader" disabled>
                            <option value="">- Select Project Leader -</option>
                            <?php
                            foreach ($list_all_marketing as $item) {
                                if ($item->id == $list_spk_penawaran->id_project_leader) {
                                    echo '<option value="' . $item->id . '" selected>' . ucfirst($item->nm_karyawan) . '</option>';
                                }
                            }
                            ?>
                        </select>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="pd-5 semi-bold" valign="top" width="120">Konsultan 1</td>
                    <td class="pd-5" width="390" valign="top">
                        <select name="konsultan_1" id="" class="form-control form-control-sm select_konsultan_1" disabled>
                            <option value="">- Select Konsultan 1 -</option>
                            <?php
                            foreach ($list_all_marketing as $item) {
                                if ($item->id == $list_spk_penawaran->id_konsultan_1) {
                                    echo '<option value="' . $item->id . '" selected>' . ucfirst($item->nm_karyawan) . '</option>';
                                }
                            }
                            ?>
                        </select>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="pd-5 semi-bold" valign="top" width="120">Konsultan 2</td>
                    <td class="pd-5" width="390" valign="top">
                        <select name="konsultan_2" id="" class="form-control form-control-sm select_konsultan_2" disabled>
                            <option value="">- Select Konsultan 2 -</option>
                            <?php
                            foreach ($list_all_marketing as $item) {
                                if ($item->id == $list_spk_penawaran->id_konsultan_2) {
                                    echo '<option value="' . $item->id . '" selected>' . ucfirst($item->nm_karyawan) . '</option>';
                                }
                            }
                            ?>
                        </select>
                    </td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>
    </div>

    <div class="box">
        <div class="box-header">
            <h4 style="font-weight: 600;">Activity List (Estimasi)</h4>
        </div>
        <div class="box-body">
            <table class="table table-striped" border="0">
                <thead>
                    <tr>
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">No.</th>
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">Activity Name</th>
                        <th class="text-center" style="vertical-align: middle;" colspan="7">Estimasi</th>
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">Total</th>
                    </tr>
                    <tr>
                        <th class="text-center" style="vertical-align: middle;">Mandays</th>
                        <th class="text-center" style="vertical-align: middle;">Mandays Internal</th>
                        <th class="text-center" style="vertical-align: middle;">Mandays Rate Internal</th>
                        <th class="text-center" style="vertical-align: middle;">Mandays Tandem</th>
                        <th class="text-center" style="vertical-align: middle;">Mandays Rate Tandem</th>
                        <th class="text-center" style="vertical-align: middle;">Mandays Subcont</th>
                        <th class="text-center" style="vertical-align: middle;">Mandays Rate Subcont</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $no_aktifitas = 1;

                    $ttl_mandays = 0;

                    $ttl_mandays_internal = 0;
                    $ttl_mandays_rate_internal = 0;

                    $ttl_mandays_tandem = 0;
                    $ttl_mandays_rate_tandem = 0;

                    $ttl_mandays_subcont = 0;
                    $ttl_mandays_rate_subcont = 0;

                    $ttl_total = 0;
                    foreach ($list_aktifitas as $item) {

                        $total_mandays_rate = ($item->mandays_rate * $item->mandays);
                        $total_mandays_rate_tandem = ($item->mandays_rate_tandem * $item->mandays_tandem);
                        $total_mandays_rate_subcont = ($item->price_subcont * $item->mandays_subcont);

                        echo '<tr>';

                        echo '<td class="text-center">' . $no_aktifitas . '</td>';
                        echo '<td width="300">' . $item->nm_aktifitas . '</td>';

                        echo '<td class="text-center">' . number_format($item->mandays_def) . '</td>';
                        echo '<td class="text-center">' . number_format($item->mandays) . '</td>';
                        echo '<td class="text-center">' . number_format($item->mandays_rate, 2) . '</td>';
                        echo '<td class="text-center">' . number_format($item->mandays_tandem) . '</td>';
                        echo '<td class="text-center">' . number_format($item->mandays_rate_tandem, 2) . '</td>';
                        echo '<td class="text-center">' . number_format($item->mandays_subcont) . '</td>';
                        echo '<td class="text-center">' . number_format($item->price_subcont, 2) . '</td>';
                        echo '<td class="text-center">' . number_format(($total_mandays_rate + $total_mandays_rate_tandem + $total_mandays_rate_subcont), 2) . '</td>';

                        echo '</tr>';

                        $ttl_mandays += $item->mandays_def;

                        $ttl_mandays_internal += $item->mandays;
                        $ttl_mandays_rate_internal += $item->mandays_rate;

                        $ttl_mandays_tandem += $item->mandays_tandem;
                        $ttl_mandays_rate_tandem += $item->mandays_rate_tandem;

                        $ttl_mandays_subcont += $item->mandays_subcont;
                        $ttl_mandays_rate_subcont += $item->price_subcont;

                        $ttl_total += ($total_mandays_rate + $total_mandays_rate_tandem + $total_mandays_rate_subcont);

                        $no_aktifitas++;
                    }
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="2"></th>
                        <th class="text-center">
                            <?= number_format($ttl_mandays) ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($ttl_mandays_internal) ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($ttl_mandays_rate_internal, 2) ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($ttl_mandays_tandem) ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($ttl_mandays_rate_tandem, 2) ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($ttl_mandays_subcont) ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($ttl_mandays_rate_subcont, 2) ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($ttl_total, 2) ?>
                        </th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <div class="box">
        <div class="box-header">
            <h4 style="font-weight: 600;">Activity List (Final)</h4>
        </div>
        <div class="box-body">
            <table class="table table-striped" border="0">
                <thead>
                    <tr>
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">No.</th>
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">Activity Name</th>
                        <th class="text-center" style="vertical-align: middle;" colspan="7">Final</th>
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">Total</th>
                    </tr>
                    <tr>
                        <th class="text-center" style="vertical-align: middle;">Mandays</th>
                        <th class="text-center" style="vertical-align: middle;">Mandays Internal</th>
                        <th class="text-center" style="vertical-align: middle;">Mandays Rate Internal</th>
                        <th class="text-center" style="vertical-align: middle;">Mandays Tandem</th>
                        <th class="text-center" style="vertical-align: middle;">Mandays Rate Tandem</th>
                        <th class="text-center" style="vertical-align: middle;">Mandays Subcont</th>
                        <th class="text-center" style="vertical-align: middle;">Mandays Rate Subcont</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    $no_aktifitas = 1;

                    $ttl_mandays = 0;

                    $ttl_mandays_internal = 0;
                    $ttl_mandays_rate_internal = 0;

                    $ttl_mandays_tandem = 0;
                    $ttl_mandays_rate_tandem = 0;

                    $ttl_mandays_subcont = 0;
                    $ttl_mandays_rate_subcont = 0;

                    $ttl_total = 0;
                    foreach ($list_aktifitas as $item) {

                        $total_mandays_rate = ($item->mandays_rate * $item->mandays);
                        $total_mandays_rate_tandem = ($item->mandays_rate_tandem * $item->mandays_tandem);
                        $total_mandays_rate_subcont = ($item->price_subcont * $item->mandays_subcont);

                        echo '<tr>';

                        echo '<td class="text-center">' . $no_aktifitas . '</td>';
                        echo '<td width="300">' . $item->nm_aktifitas . '</td>';

                        echo '<td class="text-center">' . number_format($item->mandays_def) . '</td>';

                        echo '<td class="text-center">';
                        echo '<input type="text" class="form-control form-control-sm text-right auto_num" name="subcont_final[' . $no_aktifitas . '][mandays]" value="' . $item->mandays . '">';
                        echo '</td>';

                        echo '<td class="text-center">';
                        echo '<input type="text" class="form-control form-control-sm text-right auto_num" name="subcont_final[' . $no_aktifitas . '][mandays_rate]" value="' . $item->mandays_rate . '">';
                        echo '</td>';

                        echo '<td class="text-center">';
                        echo '<input type="text" class="form-control form-control-sm text-right auto_num" name="subcont_final[' . $no_aktifitas . '][mandays_tandem]" value="' . $item->mandays_tandem . '">';
                        echo '</td>';

                        echo '<td class="text-center">';
                        echo '<input type="text" class="form-control form-control-sm text-right auto_num" name="subcont_final[' . $no_aktifitas . '][mandays_rate_tandem]" value="' . $item->mandays_rate_tandem . '">';
                        echo '</td>';
                        echo '<td class="text-center">';
                        echo '<input type="text" class="form-control form-control-sm text-right auto_num" name="subcont_final[' . $no_aktifitas . '][mandays_subcont]" value="' . $item->mandays_subcont . '">';
                        echo '</td>';
                        echo '<td class="text-center">';
                        echo '<input type="text" class="form-control form-control-sm text-right auto_num" name="subcont_final[' . $no_aktifitas . '][price_subcont]" value="' . $item->price_subcont . '">';
                        echo '</td>';
                        echo '<td class="text-center">' . number_format(($total_mandays_rate + $total_mandays_rate_tandem + $total_mandays_rate_subcont), 2) . '</td>';

                        echo '</tr>';

                        $ttl_mandays += $item->mandays_def;

                        $ttl_mandays_internal += $item->mandays;
                        $ttl_mandays_rate_internal += $item->mandays_rate;

                        $ttl_mandays_tandem += $item->mandays_tandem;
                        $ttl_mandays_rate_tandem += $item->mandays_rate_tandem;

                        $ttl_mandays_subcont += $item->mandays_subcont;
                        $ttl_mandays_rate_subcont += $item->price_subcont;

                        $ttl_total += ($total_mandays_rate + $total_mandays_rate_tandem + $total_mandays_rate_subcont);

                        $no_aktifitas++;
                    }
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="2"></th>
                        <th class="text-center">
                            <?= number_format($ttl_mandays) ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($ttl_mandays_internal) ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($ttl_mandays_rate_internal, 2) ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($ttl_mandays_tandem) ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($ttl_mandays_rate_tandem, 2) ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($ttl_mandays_subcont) ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($ttl_mandays_rate_subcont, 2) ?>
                        </th>
                        <th class="text-center">
                            <?= number_format($ttl_total, 2) ?>
                        </th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <div class="box">
        <div class="box-header">
            <h4 style="font-weight: 600;">Akomodasi</h4>
        </div>
        <div class="box-body">
            <table class="table table-bordered" border="0">
                <thead>
                    <tr>
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">No.</th>
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">Item</th>
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">Keterangan</th>
                        <th class="text-center" style="vertical-align: middle;" colspan="3">Estimasi</th>
                        <th class="text-center" style="vertical-align: middle;" colspan="3">Final</th>
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">Opsi</th>
                    </tr>
                    <tr>
                        <th class="text-center" style="vertical-align: middle;">Qty</th>
                        <th class="text-center" style="vertical-align: middle;">Price/Unit</th>
                        <th class="text-center" style="vertical-align: middle;">Total</th>
                        <th class="text-center" style="vertical-align: middle;">Qty</th>
                        <th class="text-center" style="vertical-align: middle;">Price/Unit</th>
                        <th class="text-center" style="vertical-align: middle;">Total</th>
                    </tr>
                </thead>
                <tbody>
                    <?php 
                        $no_akomodasi = 1;

                        foreach($list_akomodasi as $item) {
                            echo '<tr>';
                            
                            echo '<td class="text-center">'.$no_akomodasi.'</td>';
                            echo '<td>'.$item->nm_biaya.'</td>';
                            echo '<td>'.$item->nm_item.'</td>';
                            echo '<td class="text-center">'.number_format($item->qty).'</td>';
                            echo '<td class="text-center">'.number_format($item->price_unit).'</td>';
                            echo '<td class="text-center">'.number_format($item->total).'</td>';
                            echo '<td>';
                            echo '<input type="text" name="akomodasi_final['.$no_akomodasi.'][qty]" class="form-control form-control-sm text-right auto_num" value="'.$item->qty.'">';
                            echo '</td>';
                            echo '<td>';
                            echo '<input type="text" name="akomodasi_final['.$no_akomodasi.'][price_unit]" class="form-control form-control-sm text-right auto_num" value="'.$item->price_unit.'">';
                            echo '</td>';
                            echo '<td>';
                            echo '<input type="text" name="akomodasi_final['.$no_akomodasi.'][total]" class="form-control form-control-sm text-right auto_num" value="'.$item->total.'">';
                            echo '</td>';
                            echo '<td class="text-center">';
                            echo '<button type="button" class="btn btn-sm btn-danger del_akomodasi" data-no="'.$no_akomodasi.'"><i class="fa fa-trash"></i></button>';
                            echo '</td>';

                            echo '</tr>';

                            $no_akomodasi++;
                        }
                    ?>
                </tbody>
                <tfoot>

                </tfoot>
            </table>
        </div>
    </div>

    <a href="<?= base_url('spk_penawaran'); ?>" class="btn btn-sm btn-danger"><i class="fa fa-arrow-left"></i> Back</a>
    <button type="submit" class="btn btn-sm btn-primary">
        <i class="fa fa-save"></i> Save
    </button>
</form>

<input type="hidden" name="no_payment" value="1">
<script src="<?= base_url('assets/js/autoNumeric.js'); ?>"></script>
<script>
    var no_payment = parseFloat($('input[name="no_payment"]').val());
    $(document).ready(function() {
        $('.chosen_select').chosen({
            width: "300px"
        });

        $('.select_divisi').chosen({
            width: '100%'
        });
        $('.select_project_leader').chosen({
            width: '100%'
        });
        $('.select_konsultan_1').chosen({
            width: '100%'
        });
        $('.select_konsultan_2').chosen({
            width: '100%'
        });

        $('.auto_num').autoNumeric();
    });

    function iae(tipe) {
        if (tipe == 'bs') {
            $('.iae_' + tipe).attr('readonly', false);

            $('.iae_lain').val('');
            $('.iae_lain').attr('readonly', true);
        }
        if (tipe == 'lain') {
            $('.iae_' + tipe).attr('readonly', false);

            $('.iae_bs').val('');
            $('.iae_bs').attr('readonly', true);
        }
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
</script>