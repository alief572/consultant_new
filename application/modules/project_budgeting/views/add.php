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
                        <input type="text" name="customer" id="" class="form-control form-control-sm text-center" value="<?= $list_spk_penawaran->nm_customer ?>" readonly>
                    </td>
                    <!-- <td width="100"></td> -->
                    <td class="pd-5 semi-bold" valign="top" width="110">No. SPK</td>
                    <td class="pd-5" width="500" valign="top">
                        <input type="text" name="id_spk_penawaran" id="" class="form-control form-control-sm text-center" value="<?= $list_spk_penawaran->id_spk_penawaran ?>" readonly>
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
                        <th class="text-center" style="vertical-align: middle;">Action</th>
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
                    foreach ($list_aktifitas as $item) {

                        $total_mandays_rate = ($item->mandays_rate * $item->mandays);
                        $total_mandays_rate_tandem = ($item->mandays_rate_tandem * $item->mandays_tandem);
                        $total_mandays_rate_subcont = ($item->price_subcont * $item->mandays_subcont);

                        echo '<tr class="tr_subcont_' . $no_aktifitas . '">';

                        echo '<td class="text-center">' . $no_aktifitas . ' <input type="hidden" name="subcont_final[' . $no_aktifitas . '][id]" value="' . $item->id . '"></td>';
                        echo '<td width="300">' . $item->nm_aktifitas . '</td>';

                        echo '<td class="text-center">';
                        echo '<input type="text" class="form-control form-control-sm text-right auto_num" name="subcont_final[' . $no_aktifitas . '][mandays_subcont]" value="' . $item->mandays_subcont . '" onchange="hitung_act_final()">';
                        echo '</td>';
                        echo '<td class="text-center">';
                        echo '<input type="text" class="form-control form-control-sm text-right auto_num" name="subcont_final[' . $no_aktifitas . '][price_subcont]" value="' . $item->price_subcont . '" onchange="hitung_act_final()">';
                        echo '</td>';
                        echo '<td class="text-center total_final_act_' . $no_aktifitas . '">' . number_format($total_mandays_rate_subcont, 2) . '</td>';
                        echo '<td class="text-center">';
                        echo '<button type="button" class="btn btn-sm btn-danger del_subcont" data-no="' . $no_aktifitas . '"><i class="fa fa-trash"></i></button>';
                        echo '</td>';

                        echo '</tr>';

                        $ttl_mandays += $item->mandays_def;

                        $ttl_mandays_internal += $item->mandays;
                        $ttl_mandays_rate_internal += $item->mandays_rate;

                        $ttl_mandays_tandem += $item->mandays_tandem;
                        $ttl_mandays_rate_tandem += $item->mandays_rate_tandem;

                        $ttl_mandays_subcont += $item->mandays_subcont;
                        $ttl_mandays_rate_subcont += $item->price_subcont;

                        $ttl_activity += $total_mandays_rate;
                        $ttl_tandem += $total_mandays_rate_tandem;
                        // $ttl_mandays_rate_subcont += $total_mandays_rate_subcont;

                        $ttl_total += ($total_mandays_rate_subcont);

                        $ttl_subcont += ($item->mandays_subcont * $item->price_subcont);

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
                        <th class="text-center">

                        </th>
                        <th class="text-center ttl_final_total">
                            <?= number_format($ttl_total, 2) ?>
                        </th>
                        <th></th>
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
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">Action</th>
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

                    $ttl_qty_akomodasi = 0;
                    $ttl_price_akomodasi = 0;
                    $ttl_total_akomodasi = 0;

                    foreach ($list_akomodasi as $item) {
                        echo '<tr class="tr_akomodasi_' . $no_akomodasi . '">';

                        echo '<td class="text-center">' . $no_akomodasi . ' <input type="hidden" name="akomodasi_final[' . $no_akomodasi . '][id_akomodasi]" value="' . $item->id . '"> </td>';
                        echo '<td>' . $item->nm_biaya . '</td>';
                        echo '<td>' . $item->nm_item . '</td>';
                        echo '<td class="text-center">' . number_format($item->qty) . '</td>';
                        echo '<td class="text-center">' . number_format($item->price_unit) . '</td>';
                        echo '<td class="text-center">' . number_format($item->total) . '</td>';
                        echo '<td>';
                        echo '<input type="text" name="akomodasi_final[' . $no_akomodasi . '][qty]" class="form-control form-control-sm text-right auto_num" value="' . $item->qty . '" onchange="hitung_total_akomodasi();">';
                        echo '</td>';
                        echo '<td>';
                        echo '<input type="text" name="akomodasi_final[' . $no_akomodasi . '][price_unit]" class="form-control form-control-sm text-right auto_num" value="' . $item->price_unit . '" onchange="hitung_total_akomodasi();">';
                        echo '</td>';
                        echo '<td>';
                        echo '<input type="text" name="akomodasi_final[' . $no_akomodasi . '][total]" class="form-control form-control-sm text-right auto_num" value="' . $item->total . '" onchange="hitung_total_akomodasi();">';
                        echo '</td>';
                        echo '<td>';
                        echo '<button type="button" class="btn btn-sm btn-danger del_akomodasi" data-no="' . $no_akomodasi . '"><i class="fa fa-trash"></i></button>';
                        echo '</td>';

                        echo '</tr>';

                        $ttl_qty_akomodasi += $item->qty;
                        $ttl_price_akomodasi += $item->price_unit;
                        $ttl_total_akomodasi += $item->total;

                        $no_akomodasi++;
                    }
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="3"></th>
                        <th class="text-center"><?= number_format($ttl_qty_akomodasi) ?></th>
                        <th class="text-center"><?= number_format($ttl_price_akomodasi, 2) ?></th>
                        <th class="text-center"><?= number_format($ttl_total_akomodasi, 2) ?></th>
                        <th class="text-right ttl_qty_akomodasi"><?= number_format($ttl_qty_akomodasi) ?></th>
                        <th class="text-right ttl_price_akomodasi"><?= number_format($ttl_price_akomodasi, 2) ?></th>
                        <th class="text-right ttl_total_akomodasi"><?= number_format($ttl_total_akomodasi, 2) ?></th>
                        <th></th>
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
                        <th class="text-center" style="vertical-align: middle;" rowspan="2">Action</th>
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

                    $ttl_qty_others = 0;
                    $ttl_price_others = 0;
                    $ttl_total_others = 0;

                    foreach ($list_others as $item) {
                        echo '<tr class="tr_others_' . $no_others . '">';

                        echo '<td class="text-center">' . $no_others . ' <input type="hidden" name="others_final[' . $no_others . '][id_others]" value="' . $item->id . '"></td>';
                        echo '<td>' . $item->nm_biaya . '</td>';
                        echo '<td>' . $item->nm_item . '</td>';
                        echo '<td class="text-center">' . number_format($item->qty) . '</td>';
                        echo '<td class="text-center">' . number_format($item->price_unit_budget) . '</td>';
                        echo '<td class="text-center">' . number_format($item->total_budget) . '</td>';
                        echo '<td>';
                        echo '<input type="text" name="others_final[' . $no_others . '][qty]" class="form-control form-control-sm text-right auto_num" value="' . $item->qty . '" onchange="hitung_total_others();">';
                        echo '</td>';
                        echo '<td>';
                        echo '<input type="text" name="others_final[' . $no_others . '][price_unit]" class="form-control form-control-sm text-right auto_num" value="' . $item->price_unit_budget . '" onchange="hitung_total_others();">';
                        echo '</td>';
                        echo '<td>';
                        echo '<input type="text" name="others_final[' . $no_others . '][total]" class="form-control form-control-sm text-right auto_num" value="' . $item->total_budget . '" onchange="hitung_total_others();">';
                        echo '</td>';
                        echo '<td>';
                        echo '<button type="button" class="btn btn-sm btn-danger del_others" data-no="' . $no_others . '"><i class="fa fa-trash"></i></button>';
                        echo '</td>';

                        echo '</tr>';

                        $ttl_qty_others += $item->qty;
                        $ttl_price_others += $item->price_unit;
                        $ttl_total_others += $item->total;

                        $no_others++;
                    }
                    ?>
                </tbody>
                <tfoot>
                    <tr>
                        <th colspan="3"></th>
                        <th class="text-center"><?= number_format($ttl_qty_others) ?></th>
                        <th class="text-center"><?= number_format($ttl_price_others, 2) ?></th>
                        <th class="text-center"><?= number_format($ttl_total_others, 2) ?></th>
                        <th class="text-right ttl_qty_others"><?= number_format($ttl_qty_others) ?></th>
                        <th class="text-right ttl_price_others"><?= number_format($ttl_price_others, 2) ?></th>
                        <th class="text-right ttl_total_others"><?= number_format($ttl_total_others, 2) ?></th>
                        <th></th>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>

    <div class="box">
        <div class="box-header">
            <h4 class="semi-bold">
                Summary & Compare

                <!-- <div style="float: right;">
                    <div class="cbx-krajee">
                        <input id="input-id" type="checkbox" class="include_ppn" name="include_ppn" value="1" <?= ($list_penawaran->ppn == 1) ? 'checked' : '' ?>>
                        <label for="input-id" class="cbx-label">Include PPN</label>
                    </div>
                </div> -->
            </h4>
        </div>
        <div class="box-body">
            <div class="col-md-4">
                <h4 class="semi-bold">Before</h4>
                <table class="table custom-table-no">
                    <thead>
                        <tr>
                            <th class="text-left">Item Project Budgeting</th>
                            <th class="text-right">Amount (Rp)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Mandays Subcont</td>
                            <td class="text-right">
                                <?= number_format($ttl_mandays_subcont) ?>
                                <input type="hidden" name="ttl_mandays_subcont_before" value="<?= $ttl_mandays_subcont ?>">
                            </td>
                        </tr>
                        <tr>
                            <td>Biaya Subcont</td>
                            <td class="text-right">
                                <?= number_format($ttl_subcont, 2) ?>
                                <input type="hidden" name="ttl_subcont_before" value="<?= $ttl_subcont ?>">
                            </td>
                        </tr>
                        <tr>
                            <td>Biaya Akomodasi</td>
                            <td class="text-right">
                                <?= number_format($ttl_total_akomodasi, 2) ?>
                                <input type="hidden" name="ttl_total_akomodasi_before" value="<?= $ttl_total_akomodasi ?>">
                            </td>
                        </tr>
                        <tr>
                            <td>Biaya Others</td>
                            <td class="text-right">
                                <?= number_format($ttl_total_others, 2) ?>
                                <input type="hidden" name="ttl_total_others_before" value="<?= $ttl_total_others ?>">
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Grand Total Pengeluaran</th>
                            <th class="text-right">
                                <?= number_format(($ttl_subcont + $ttl_total_akomodasi + $ttl_total_others), 2) ?>
                                <input type="hidden" name="grand_total_pengeluaran_before" value="<?= ($ttl_subcont + $ttl_total_akomodasi + $ttl_total_others) ?>">
                            </th>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="col-md-4">
                <h4 class="semi-bold">After</h4>
                <table class="table custom-table-no">
                    <thead>
                        <tr>
                            <th class="text-left">Item Project SPK</th>
                            <th class="text-right">Amount (Rp)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Mandays Subcont</td>
                            <td class="text-right summary_mandays_subcont">
                                <?= number_format($ttl_mandays_subcont) ?>
                            </td>
                        </tr>
                        <tr>
                            <td>Biaya Subcont</td>
                            <td class="text-right summary_biaya_subcont">
                                <?= number_format($ttl_subcont, 2) ?>
                            </td>
                        </tr>
                        <tr>
                            <td>Biaya Akomodasi</td>
                            <td class="text-right summary_biaya_akomodasi">
                                <?= number_format($ttl_total_akomodasi, 2) ?>
                            </td>
                        </tr>
                        <tr>
                            <td>Biaya Others</td>
                            <td class="text-right summary_biaya_others">
                                <?= number_format($ttl_total_others, 2) ?>
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Grand Total Pengeluaran</th>
                            <th class="text-right summary_total_pengeluaran">
                                <?= number_format(($ttl_subcont + $ttl_total_akomodasi + $ttl_total_others), 2) ?>
                            </th>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="col-md-4">
                <h4 class="semi-bold">Result</h4>
                <table class="table custom-table-no">
                    <thead>
                        <tr>
                            <th class="text-left">Item Project SPK</th>
                            <th class="text-right">Amount (Rp)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Mandays Subcont</td>
                            <td class="text-right summary_mandays_subcont_result">
                                0
                            </td>
                        </tr>
                        <tr>
                            <td>Biaya Subcont</td>
                            <td class="text-right summary_biaya_subcont_result">
                                0
                            </td>
                        </tr>
                        <tr>
                            <td>Biaya Akomodasi</td>
                            <td class="text-right summary_biaya_akomodasi_result">
                                0
                            </td>
                        </tr>
                        <tr>
                            <td>Biaya Others</td>
                            <td class="text-right summary_biaya_others_result">
                                0
                            </td>
                        </tr>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>Grand Total Pengeluaran</th>
                            <th class="text-right summary_total_pengeluaran_result">
                                0
                            </th>
                        </tr>
                    </tfoot>
                </table>
            </div>
            <div class="col-md-12"></div>

            <input type="hidden" name="summary_mandays_subcont_after" value="<?= $ttl_mandays_subcont ?>">
            <input type="hidden" name="summary_biaya_subcont_after" value="<?= $ttl_subcont ?>">
            <input type="hidden" name="summary_biaya_akomodasi_after" value="<?= $ttl_total_akomodasi ?>">
            <input type="hidden" name="summary_biaya_others_after" value="<?= $ttl_total_others ?>">

            <input type="hidden" name="summary_mandays_subcont_result_value" value="0">
            <input type="hidden" name="summary_biaya_subcont_result_value" value="0">
            <input type="hidden" name="summary_biaya_akomodasi_result_value" value="0">
            <input type="hidden" name="summary_biaya_others_result_value" value="0">

            <br><br>


            <input type="hidden" class="grand_total" name="grand_total" value="<?= ($ttl_subcont + $ttl_total_akomodasi + $ttl_total_others) ?>">

            <input type="hidden" name="summary_mandays" value="<?= ($ttl_mandays_internal + $ttl_mandays_tandem + $ttl_mandays_subcont) ?>">
            <input type="hidden" name="summary_mandays_internal" value="<?= $ttl_mandays_internal ?>">
            <input type="hidden" name="summary_mandays_tandem" value="<?= $ttl_mandays_tandem ?>">
            <input type="hidden" name="summary_mandays_subcont" value="<?= $ttl_mandays_subcont ?>">
            <input type="hidden" name="summary_biaya_act" value="<?= $ttl_activity ?>">
            <input type="hidden" name="summary_biaya_tandem" value="<?= $ttl_tandem ?>">
            <input type="hidden" name="summary_biaya_subcont" value="<?= $ttl_subcont ?>">
            <input type="hidden" name="summary_biaya_akomodasi" value="<?= $ttl_total_akomodasi ?>">
            <input type="hidden" name="summary_biaya_others" value="<?= $ttl_total_others ?>">
            <input type="hidden" name="summary_total_pengeluaran" value="<?= ($ttl_subcont + $ttl_total_akomodasi + $ttl_total_others) ?>">

            <div style="float: right; margin-top: 1rem;">
                <a href="<?= base_url('project_budgeting') ?>" class="btn btn-sm btn-danger">
                    <i class="fa fa-arrow-left"></i> Back
                </a>
                <button type="submit" class="btn btn-sm btn-success">
                    <i class="fa fa-save"></i> Save
                </button>
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
        if (nilai !== '' && nilai !== null && nilai !== undefined) {
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

    function hitung_all() {
        var summary_mandays_internal = get_num($('.summary_mandays_internal').html());
        var summary_mandays_tandem = get_num($('.summary_mandays_tandem').html());
        var summary_mandays_subcont = get_num($('.summary_mandays_subcont').html());
        var summary_biaya_act = get_num($('.summary_biaya_act').html());
        var summary_biaya_tandem = get_num($('.summary_biaya_tandem').html());
        var summary_biaya_subcont = get_num($('.summary_biaya_subcont').html());
        var summary_biaya_akomodasi = get_num($('.summary_biaya_akomodasi').html());
        var summary_biaya_others = get_num($('.summary_biaya_others').html());

        var grand_total_pengeluaran = (summary_biaya_act + summary_biaya_tandem + summary_biaya_subcont + summary_biaya_akomodasi + summary_biaya_others);

        $('.summary_total_pengeluaran').html(number_format(grand_total_pengeluaran, 2));
        $('input[name="summary_total_pengeluaran"]').val(grand_total_pengeluaran);

        var nilai_project = parseFloat("<?= $list_penawaran->grand_total ?>");

        var nilai_kontrak_bersih = (nilai_project - summary_biaya_tandem - summary_biaya_subcont - summary_biaya_akomodasi - summary_biaya_others);

        $('.nilai_kontrak_bersih').val(number_format(nilai_kontrak_bersih, 2));

        var mandays_rate = (nilai_kontrak_bersih / summary_mandays_internal);

        $('.mandays_rate').val(number_format(mandays_rate, 2));
    }

    function hitung_act_final() {
        var no_act = "<?= $no_aktifitas ?>";
        var no_act = parseFloat(no_act);


        var ttl_mandays_internal = 0;
        var ttl_mandays_rate_internal = 0;
        var ttl_mandays_tandem = 0;
        var ttl_mandays_rate_tandem = 0;
        var ttl_mandays_subcont = 0;
        var ttl_mandays_rate_subcont = 0;

        var ttl_total_act = 0;
        var ttl_total_tandem = 0;
        var ttl_total_subcont = 0;

        var ttl_total_all = 0;

        for (i = 1; i <= no_act; i++) {
            var mandays_internal = get_num($('input[name="subcont_final[' + i + '][mandays]"]').val());
            var mandays_rate_internal = get_num($('input[name="subcont_final[' + i + '][mandays_rate]"]').val());
            var mandays_tandem = get_num($('input[name="subcont_final[' + i + '][mandays_tandem]"]').val());
            var mandays_rate_tandem = get_num($('input[name="subcont_final[' + i + '][mandays_rate_tandem]"]').val());
            var mandays_subcont = get_num($('input[name="subcont_final[' + i + '][mandays_subcont]"]').val());
            var mandays_rate_subcont = get_num($('input[name="subcont_final[' + i + '][price_subcont]"]').val());

            var total_all = parseFloat((mandays_internal * mandays_rate_internal) + (mandays_tandem * mandays_rate_tandem) + (mandays_subcont * mandays_rate_subcont));

            $('.total_final_act_' + i).html(number_format(total_all, 2));

            ttl_total_all += total_all;

            ttl_mandays_internal += mandays_internal;
            ttl_mandays_rate_internal += mandays_rate_internal;
            ttl_mandays_tandem += mandays_tandem;
            ttl_mandays_rate_tandem += mandays_rate_tandem;
            ttl_mandays_subcont += mandays_subcont;
            ttl_mandays_rate_subcont += mandays_rate_subcont;

            ttl_total_act += (mandays_internal * mandays_rate_internal);
            ttl_total_tandem += (mandays_tandem * mandays_rate_tandem);
            ttl_total_subcont += (mandays_subcont * mandays_rate_subcont);
        }

        $('.ttl_final_mandays_internal').html(number_format(ttl_mandays_internal));
        $('.ttl_final_mandays_rate_internal').html(number_format(ttl_mandays_rate_internal, 2));
        $('.ttl_final_mandays_tandem').html(number_format(ttl_mandays_tandem));
        $('.ttl_final_mandays_rate_tandem').html(number_format(ttl_mandays_rate_tandem, 2));
        $('.ttl_final_mandays_subcont').html(number_format(ttl_mandays_subcont));
        // $('.ttl_final_mandays_rate_subcont').html(number_format(ttl_mandays_rate_subcont, 2));
        $('.ttl_final_total').html(number_format(ttl_total_all, 2));

        $('.summary_mandays_internal').html(number_format(ttl_mandays_internal));
        $('input[name="summary_mandays_internal"]').val(ttl_mandays_internal);

        $('.summary_mandays_tandem').html(number_format(ttl_mandays_tandem));
        $('input[name="summary_mandays_tandem"]').val(ttl_mandays_tandem);

        $('.summary_mandays_subcont').html(number_format(ttl_mandays_subcont));
        $('input[name="summary_mandays_subcond"]').val(ttl_mandays_subcont);

        $('.summary_biaya_act').html(number_format(ttl_total_act, 2));
        $('input[name="summary_biaya_act"]').val(ttl_total_act);

        $('.summary_biaya_tandem').html(number_format(ttl_total_tandem, 2));
        $('input[name="summary_biaya_tandem"]').val(ttl_total_tandem);

        $('.summary_biaya_subcont').html(number_format(ttl_total_subcont, 2));
        $('input[name="summary_biaya_subcont"]').val(ttl_total_subcont);

        hitung_all();
        hitung_compare();
    }

    function hitung_total_akomodasi() {
        var no_ako = "<?= $no_akomodasi ?>";
        var no_ako = parseFloat(no_ako);

        var total_qty = 0;
        var total_price = 0;
        var total_ako = 0;

        for (i = 1; i <= no_ako; i++) {
            var qty = get_num($('input[name="akomodasi_final[' + i + '][qty]"]').val());
            var price_unit = get_num($('input[name="akomodasi_final[' + i + '][price_unit]"]').val());
            var total = (price_unit * qty);

            $('input[name="akomodasi_final[' + i + '][total]"]').val(number_format(total, 2));

            total_qty += qty;
            total_price += price_unit;
            total_ako += (price_unit * qty);
        }

        $('.ttl_qty_akomodasi').html(number_format(total_qty));
        $('.ttl_price_akomodasi').html(number_format(total_price, 2));
        $('.ttl_total_akomodasi').html(number_format(total_ako, 2));

        $('.summary_biaya_akomodasi').html(number_format(total_ako, 2));

        hitung_all();
        hitung_compare();
    }

    function hitung_total_others() {
        var no_ako = "<?= $no_others ?>";
        var no_ako = parseFloat(no_ako);

        var total_qty = 0;
        var total_price = 0;
        var total_oth = 0;

        for (i = 1; i <= no_ako; i++) {
            var qty = get_num($('input[name="others_final[' + i + '][qty]"]').val());
            var price_unit = get_num($('input[name="others_final[' + i + '][price_unit]"]').val());
            var total = (price_unit * qty);

            $('input[name="others_final[' + i + '][total]"]').val(number_format(total, 2));

            total_qty += qty;
            total_price += price_unit;
            total_oth += (price_unit * qty);
        }

        $('.ttl_qty_others').html(number_format(total_qty));
        $('.ttl_price_others').html(number_format(total_price, 2));
        $('.ttl_total_others').html(number_format(total_oth, 2));

        $('.summary_biaya_others').html(number_format(total_oth, 2));

        hitung_all();
        hitung_compare();
    }

    function hitung_compare() {
        var no_act = "<?= $no_aktifitas ?>";
        var no_act = parseFloat(no_act);

        var no_ako = "<?= $no_akomodasi ?>";
        var no_ako = parseFloat(no_ako);

        var no_oth = "<?= $no_others ?>";
        var no_oth = parseFloat(no_oth);

        var ttl_mandays_subcont = 0;
        var ttl_subcont = 0;
        var ttl_akomodasi = 0;
        var ttl_others = 0;

        for (i = 1; i <= no_act; i++) {
            var mandays_subcont = get_num($('input[name="subcont_final[' + i + '][mandays_subcont]"]').val());
            var price_subcont = get_num($('input[name="subcont_final[' + i + '][price_subcont]"]').val());

            ttl_mandays_subcont += mandays_subcont;
            ttl_subcont += (mandays_subcont * price_subcont);
        }

        for (i = 1; i <= no_ako; i++) {
            var nilai_akomodasi = get_num($('input[name="akomodasi_final[' + i + '][total]"]').val());

            ttl_akomodasi += nilai_akomodasi;
        }

        for (i = 1; i <= no_oth; i++) {
            var nilai_others = get_num($('input[name="others_final[' + i + '][total]"]').val());

            ttl_others += nilai_others;
        }

        var ttl_mandays_subcont_before = get_num($('input[name="ttl_mandays_subcont_before"]').val());
        var ttl_subcont_before = get_num($('input[name="ttl_subcont_before"]').val());
        var ttl_total_akomodasi_before = get_num($('input[name="ttl_total_akomodasi_before"]').val());
        var ttl_total_others_before = get_num($('input[name="ttl_total_others_before"]').val());
        var grand_total_pengeluaran_before = get_num($('input[name="grand_total_pengeluaran_before"]').val());

        var selisih_mandays_subcont = (ttl_mandays_subcont - ttl_mandays_subcont_before);
        var selisih_subcont = (ttl_subcont - ttl_subcont_before);
        var selisih_total_akomodasi = (ttl_akomodasi - ttl_total_akomodasi_before);
        var selisih_total_others = (ttl_others - ttl_total_others_before);
        var selisih_grand_total_pengeluaran = (selisih_subcont + selisih_total_akomodasi + selisih_total_others);

        if (selisih_mandays_subcont > 0) {
            $('.summary_mandays_subcont_result').html('<span style="color: #66ff66;">' + number_format(selisih_mandays_subcont, 2) + '</span>');
        } else if (selisih_mandays_subcont < 0) {
            $('.summary_mandays_subcont_result').html('<span style="color: #ff0000;">(' + number_format(selisih_mandays_subcont, 2) + ')</span>');
        } else {
            $('.summary_mandays_subcont_result').html(number_format(selisih_mandays_subcont, 2));
        }

        if (selisih_subcont > 0) {
            $('.summary_biaya_subcont_result').html('<span style="color: #66ff66;">' + number_format(selisih_subcont, 2) + '</span>');
        } else if (selisih_subcont < 0) {
            $('.summary_biaya_subcont_result').html('<span style="color: #ff0000;">(' + number_format(selisih_subcont, 2) + ')</span>');
        } else {
            $('.summary_biaya_subcont_result').html(number_format(selisih_subcont, 2));
        }

        if (selisih_total_akomodasi > 0) {
            $('.summary_biaya_akomodasi_result').html('<span style="color: #66ff66;">' + number_format(selisih_total_akomodasi, 2) + '</span>');
        } else if (selisih_total_akomodasi < 0) {
            $('.summary_biaya_akomodasi_result').html('<span style="color: #ff0000;">(' + number_format(selisih_total_akomodasi, 2) + ')</span>');
        } else {
            $('.summary_biaya_akomodasi_result').html(number_format(selisih_total_akomodasi, 2));
        }

        if (selisih_total_others > 0) {
            $('.summary_biaya_others_result').html('<span style="color: #66ff66;">' + number_format(selisih_total_others, 2) + '</span>');
        } else if (selisih_total_others < 0) {
            $('.summary_biaya_others_result').html('<span style="color: #ff0000;">(' + number_format(selisih_total_others, 2) + ')</span>');
        } else {
            $('.summary_biaya_others_result').html(number_format(selisih_total_others, 2));
        }

        if (selisih_grand_total_pengeluaran > 0) {
            $('.summary_total_pengeluaran_result').html('<span style="color: #66ff66;">' + number_format(selisih_grand_total_pengeluaran, 2) + '</span>');
        } else if (selisih_grand_total_pengeluaran < 0) {
            $('.summary_total_pengeluaran_result').html('<span style="color: #ff0000;">(' + number_format(selisih_grand_total_pengeluaran, 2) + ')</span>');
        } else {
            $('.summary_total_pengeluaran_result').html(number_format(selisih_grand_total_pengeluaran, 2));
        }

        $('input[name="summary_mandays_subcont_result_value"]').val(selisih_mandays_subcont);
        $('input[name="summary_biaya_subcont_result_value"]').val(selisih_subcont);
        $('input[name="summary_biaya_akomodasi_result_value"]').val(selisih_total_akomodasi);
        $('input[name="summary_biaya_others_result_value"]').val(selisih_total_others);
    }

    // function hitung_subcont() {
    //     var no_subcont = "<?= $no_aktifitas ?>";

    //     var ttl_qty_subcont = 0;
    //     var ttl_total_subcont = 0;

    //     for(i = 1;i <= no_subcont; i++) {
    //         var mandays_subcont = get_num($('input[name="subcont_final['+i+'][mandays_subcont]"]').val());
    //         var price_subcont = get_num($('input[name="subcont_final['+i+'][price_subcont]"]').val());

    //         var total_subcont = (mandays_subcont * price_subcont);

    //         ttl_qty_subcont += mandays_subcont;
    //         ttl_total_subcont += total_subcont;
    //     }


    // }

    $(document).on('click', '.del_subcont', function() {
        var no = $(this).data('no');

        $('.tr_subcont_' + no).remove();

        hitung_all();
        hitung_act_final();
        hitung_compare();
    });

    $(document).on('click', '.del_akomodasi', function() {

        var no = $(this).data('no');

        $('.tr_akomodasi_' + no).remove();

        hitung_total_akomodasi();
        hitung_all();
        hitung_compare();
    });

    $(document).on('click', '.del_others', function() {

        var no = $(this).data('no');

        $('.tr_others_' + no).remove();

        hitung_total_others();
        hitung_all();
        hitung_compare();
    });

    $(document).on('submit', '#frm-data', function(e) {
        e.preventDefault();

        swal({
            type: 'warning',
            title: 'Are you sure ?',
            text: 'the data will be saved !',
            showCancelButton: true
        }, function(next) {
            if (next) {
                var formData = $('#frm-data').serialize();

                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'save_budgeting',
                    data: formData,
                    cache: false,
                    dataType: 'JSON',
                    success: function(result) {
                        if (result.status == 1) {
                            swal({
                                type: 'success',
                                title: 'Success !',
                                text: result.pesan
                            }, function(lanjut) {
                                window.location.href = siteurl + active_controller;
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
    })
</script>