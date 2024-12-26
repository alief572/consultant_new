<?php
$ENABLE_ADD     = has_permission('Project_Budgeting.Add');
$ENABLE_MANAGE  = has_permission('Project_Budgeting.Manage');
$ENABLE_VIEW    = has_permission('Project_Budgeting.View');
$ENABLE_DELETE  = has_permission('Project_Budgeting.Delete');
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
                        <input type="text" name="customer" id="" class="form-control form-control-sm text-center" value="<?= $list_budgeting->nm_customer ?>" readonly>
                    </td>
                    <!-- <td width="100"></td> -->
                    <td class="pd-5 semi-bold" valign="top" width="110">No. SPK</td>
                    <td class="pd-5" width="500" valign="top">
                        <input type="text" name="id_spk_penawaran" id="" class="form-control form-control-sm text-center" value="<?= $list_budgeting->id_spk_penawaran ?>" readonly>
                    </td>
                </tr>
                <tr>
                    <td class="pd-5 semi-bold" valign="top" rowspan="2">Alamat</td>
                    <td class="pd-5" width="400" valign="top" rowspan="2">
                        <textarea name="alamat" id="" class="form-control form-control-sm" rows="4" readonly><?= $list_budgeting->alamat ?></textarea>
                    </td>
                    <!-- <td width="100"></td> -->
                    <td class="pd-5 semi-bold" valign="top">No. NPWP</td>
                    <td class="pd-5" width="500" valign="top">
                        <input type="text" name="no_npwp" id="" class="form-control form-control-sm text-center" value="<?= $list_budgeting->no_npwp ?>" readonly> <br>
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
                                <input type="text" name="pic" id="" class="form-control form-control-sm" value="<?= $list_budgeting->nm_pic ?>" readonly>
                            </div>
                            <div class="form-group text-center" style="width: 100px;">
                                <label for="">Jabatan</label>
                            </div>
                            <div class="form-group text-center">
                                <input type="text" name="jabatan_pic" id="" class="form-control form-control-sm" value="<?= $list_budgeting->jabatan_pic ?>" readonly>
                            </div>
                        </div>
                    </td>

                    <td class="pd-5" valign="top">

                    </td>
                </tr>
                <tr>
                    <td class="pd-5 semi-bold" valign="top">Kontak PIC</td>
                    <td class="pd-5" width="500" valign="top">
                        <input type="text" name="kontak_pic" id="" class="form-control form-control-sm" value="<?= $list_budgeting->kontak_pic ?>" readonly>
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
                        <input type="text" name="nm_paket" id="" class="form-control form-control-sm" value="<?= $list_budgeting->nm_project ?>" readonly>
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
                                if ($item->id == $list_budgeting->id_project_leader) {
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
                                if ($item->id == $list_budgeting->id_konsultan_1) {
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
                                if ($item->id == $list_budgeting->id_konsultan_2) {
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
            <h4 style="font-weight: 600;">Subcont</h4>
        </div>
        <div class="box-body">
            <table class="table custom-table-no" border="0">
                <thead>
                    <tr>
                        <th class="text-center" style="vertical-align: middle;">No.</th>
                        <th class="text-center" style="vertical-align: middle;">Activity Name</th>
                        <th class="text-center" style="vertical-align: middle;">Mandays Subcont</th>
                        <th class="text-center" style="vertical-align: middle;">Mandays Rate Subcont</th>
                        <th class="text-center" style="vertical-align: middle;">Total</th>
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

                    $ttl_activity = 0;
                    $ttl_tandem = 0;
                    $ttl_subcont = 0;
                    foreach ($list_budgeting_aktifitas as $item) {

                        $total_mandays_rate = ($item->mandays_rate_final * $item->mandays_final);
                        $total_mandays_rate_tandem = ($item->mandays_rate_tandem_final * $item->mandays_tandem_final);
                        $total_mandays_rate_subcont = ($item->mandays_rate_subcont_final * $item->mandays_subcont_final);

                        echo '<tr>';

                        echo '<td class="text-center">' . $no_aktifitas . ' <input type="hidden" name="subcont_final[' . $no_aktifitas . '][id]" value="' . $item->id . '"></td>';
                        echo '<td width="300">' . $item->nm_aktifitas . '</td>';

                        echo '<td class="text-center">';
                        echo number_format($item->mandays_subcont_final);
                        echo '</td>';

                        echo '<td class="text-center">';
                        echo number_format($item->mandays_rate_subcont_final, 2);
                        echo '</td>';
                        echo '<td class="text-center total_final_act_' . $no_aktifitas . '">' . number_format($item->total_aktifitas_final, 2) . '</td>';

                        echo '</tr>';

                        $ttl_mandays += $item->mandays_def;

                        $ttl_mandays_internal += $item->mandays_final;
                        $ttl_mandays_rate_internal += $item->mandays_rate_final;

                        $ttl_mandays_tandem += $item->mandays_tandem_final;
                        $ttl_mandays_rate_tandem += $item->mandays_rate_tandem_final;

                        $ttl_mandays_subcont += $item->mandays_subcont_final;
                        $ttl_mandays_rate_subcont += $item->mandays_rate_subcont_final;

                        $ttl_activity += $total_mandays_rate;
                        $ttl_tandem += $total_mandays_rate_tandem;
                        $ttl_mandays_rate_subcont += $total_mandays_rate_subcont;

                        $ttl_total += ( $total_mandays_rate_subcont);

                        $no_aktifitas++;
                    }
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="2"></th>
                        <th class="text-center ttl_final_mandays_subcont">
                            <?= number_format($ttl_mandays_subcont) ?>
                        </th>
                        <th class="text-center ttl_final_mandays_rate_subcont">
                            
                        </th>
                        <th class="text-center ttl_final_total">
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
            <table class="table custom-table-no" border="0">
                <thead>
                    <tr>
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">No.</th>
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">Item</th>
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">Keterangan</th>
                        <th class="text-center" style="vertical-align: middle;" colspan="3">Estimasi</th>
                        <th class="text-center" style="vertical-align: middle;" colspan="3">Final</th>
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

                    $ttl_qty_akomodasi_estimasi = 0;
                    $ttl_qty_akomodasi_final = 0;
                    $ttl_price_akomodasi_estimasi = 0;
                    $ttl_price_akomodasi_final = 0;
                    $ttl_total_akomodasi_estimasi = 0;
                    $ttl_total_akomodasi_final = 0;

                    foreach ($list_budgeting_akomodasi as $item) {
                        echo '<tr class="tr_akomodasi_' . $no_akomodasi . '">';

                        echo '<td class="text-center">' . $no_akomodasi . ' <input type="hidden" name="akomodasi_final[' . $no_akomodasi . '][id_akomodasi]" value="' . $item->id . '"> </td>';
                        echo '<td>' . $item->nm_biaya . '</td>';
                        echo '<td>' . $item->keterangan . '</td>';
                        echo '<td class="text-center">' . number_format($item->qty_estimasi) . '</td>';
                        echo '<td class="text-center">' . number_format($item->price_unit_estimasi) . '</td>';
                        echo '<td class="text-center">' . number_format($item->total_estimasi) . '</td>';
                        echo '<td class="text-center">' . number_format($item->qty_final) . '</td>';
                        echo '<td class="text-center">' . number_format($item->price_unit_final) . '</td>';
                        echo '<td class="text-center">' . number_format($item->total_final) . '</td>';

                        echo '</tr>';

                        $ttl_qty_akomodasi_estimasi += $item->qty_estimasi;
                        $ttl_qty_akomodasi_final += $item->qty_final;
                        $ttl_price_akomodasi_estimasi += $item->price_unit_estimasi;
                        $ttl_price_akomodasi_final += $item->price_unit_final;
                        $ttl_total_akomodasi_estimasi += $item->total_estimasi;
                        $ttl_total_akomodasi_final += $item->total_final;

                        $no_akomodasi++;
                    }
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="3"></th>
                        <th class="text-center"><?= number_format($ttl_qty_akomodasi_estimasi) ?></th>
                        <th class="text-center"><?= number_format($ttl_price_akomodasi_estimasi, 2) ?></th>
                        <th class="text-center"><?= number_format($ttl_total_akomodasi_estimasi, 2) ?></th>
                        <th class="text-center ttl_qty_akomodasi"><?= number_format($ttl_qty_akomodasi_final) ?></th>
                        <th class="text-center ttl_price_akomodasi"><?= number_format($ttl_price_akomodasi_final, 2) ?></th>
                        <th class="text-center ttl_total_akomodasi"><?= number_format($ttl_total_akomodasi_final, 2) ?></th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <div class="box">
        <div class="box-header">
            <h4 style="font-weight: 600;">Others</h4>
        </div>
        <div class="box-body">
            <table class="table custom-table-no" border="0">
                <thead>
                    <tr>
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">No.</th>
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">Item</th>
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">Keterangan</th>
                        <th class="text-center" style="vertical-align: middle;" colspan="3">Estimasi</th>
                        <th class="text-center" style="vertical-align: middle;" colspan="3">Final</th>
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
                    $no_others = 1;

                    $ttl_qty_others_estimasi = 0;
                    $ttl_qty_others_final = 0;
                    $ttl_price_others_estimasi = 0;
                    $ttl_price_others_final = 0;
                    $ttl_total_others_estimasi = 0;
                    $ttl_total_others_final = 0;

                    foreach ($list_budgeting_others as $item) {
                        echo '<tr class="tr_others_' . $no_others . '">';

                        echo '<td class="text-center">' . $no_others . ' <input type="hidden" name="others_final[' . $no_others . '][id_others]" value="' . $item->id . '"> </td>';
                        echo '<td>' . $item->nm_biaya . '</td>';
                        echo '<td>' . $item->keterangan . '</td>';
                        echo '<td class="text-center">' . number_format($item->qty_estimasi) . '</td>';
                        echo '<td class="text-center">' . number_format($item->price_unit_estimasi) . '</td>';
                        echo '<td class="text-center">' . number_format($item->total_estimasi) . '</td>';
                        echo '<td class="text-center">' . number_format($item->qty_final) . '</td>';
                        echo '<td class="text-center">' . number_format($item->price_unit_final) . '</td>';
                        echo '<td class="text-center">' . number_format($item->total_final) . '</td>';

                        echo '</tr>';

                        $ttl_qty_others_estimasi += $item->qty_estimasi;
                        $ttl_qty_others_final += $item->qty_final;
                        $ttl_price_others_estimasi += $item->price_unit_estimasi;
                        $ttl_price_others_final += $item->price_unit_final;
                        $ttl_total_others_estimasi += $item->total_estimasi;
                        $ttl_total_others_final += $item->total_final;

                        $no_others++;
                    }
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="3"></th>
                        <th class="text-center"><?= number_format($ttl_qty_others_estimasi) ?></th>
                        <th class="text-center"><?= number_format($ttl_price_others_estimasi, 2) ?></th>
                        <th class="text-center"><?= number_format($ttl_total_others_estimasi, 2) ?></th>
                        <th class="text-center ttl_qty_others"><?= number_format($ttl_qty_others_final) ?></th>
                        <th class="text-center ttl_price_others"><?= number_format($ttl_price_others_final, 2) ?></th>
                        <th class="text-center ttl_total_others"><?= number_format($ttl_total_others_final, 2) ?></th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <div class="box">
        <div class="box-header">
            <h4 class="semi-bold">
                Summary
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
                        <td>Mandays Subcont</td>
                        <td class="text-right summary_mandays_subcont">
                            <?= number_format($list_budgeting->mandays_subcont) ?>
                            <input type="hidden" name="summary_mandays_subcont" value="<?= $list_budgeting->mandays_subcont ?>">
                        </td>
                    </tr>
                    <tr>
                        <td>Biaya Subcont</td>
                        <td class="text-right summary_biaya_subcont">
                            <?= number_format($list_budgeting->biaya_subcont, 2) ?>
                            <input type="hidden" name="summary_biaya_subcont" value="<?= $list_budgeting->biaya_subcont ?>">
                        </td>
                    </tr>
                    <tr>
                        <td>Biaya Akomodasi</td>
                        <td class="text-right summary_biaya_akomodasi">
                            <?= number_format($list_budgeting->biaya_akomodasi, 2) ?>
                            <input type="hidden" name="summary_biaya_akomodasi" value="<?= $list_budgeting->biaya_akomodasi ?>">
                        </td>
                    </tr>
                    <tr>
                        <td>Biaya Others</td>
                        <td class="text-right summary_biaya_others">
                            <?= number_format($list_budgeting->biaya_others, 2) ?>
                            <input type="hidden" name="summary_biaya_others" value="<?= $list_budgeting->biaya_others ?>">
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <th>Grand Total Pengeluaran</th>
                        <th class="text-right summary_total_pengeluaran">
                            <?= number_format(($list_budgeting->biaya_subcont + $list_budgeting->biaya_akomodasi + $list_budgeting->biaya_others), 2) ?>
                            <input type="hidden" name="summary_total_pengeluaran" value="<?= ($list_budgeting->biaya_subcont + $list_budgeting->biaya_akomodasi + $list_budgeting->biaya_others) ?>">
                        </th>
                    </tr>
                </tfoot>
            </table>
            <br><br>
            <!-- <div class="col-md-6">
                <table class="table custom-table-no" border="0">
                    <thead style="background-color: transparent;">
                        <tr>
                            <th>Nilai Kontrak Bersih</th>
                            <th>
                                <input type="text" name="nilai_kontrak_bersih" id="" class="form-control form-control-sm text-right nilai_kontrak_bersih" value="<?= number_format($list_budgeting->nilai_kontrak_bersih, 2) ?>" readonly>
                            </th>
                        </tr>
                        <tr>
                            <th>Mandays Rate</th>
                            <th>
                                <input type="text" name="mandays_rate" id="" class="form-control form-control-sm text-right mandays_rate" value="<?= number_format($list_budgeting->mandays_rate, 2) ?>" readonly>
                            </th>
                        </tr>
                    </thead>
                </table>
            </div> -->

            <input type="hidden" class="grand_total" name="grand_total" value="<?= ($list_budgeting->biaya_konsultasi + $list_budgeting->biaya_tandem + $list_budgeting->biaya_subcont + $list_budgeting->biaya_akomodasi + $list_budgeting->biaya_others) ?>">

            <div style="float: right; margin-top: 1rem;">
                <a href="<?= base_url('project_budgeting') ?>" class="btn btn-sm btn-danger">
                    <i class="fa fa-arrow-left"></i> Back
                </a>
            </div>
        </div>
    </div>

    <!-- <a href="<?= base_url('project_budgeting'); ?>" class="btn btn-sm btn-danger"><i class="fa fa-arrow-left"></i> Back</a>
    <button type="submit" class="btn btn-sm btn-primary">
        <i class="fa fa-save"></i> Save
    </button> -->
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

  
</script>