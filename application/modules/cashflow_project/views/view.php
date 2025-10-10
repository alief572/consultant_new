<?php
$ENABLE_ADD     = has_permission('Cashflow_Project.Add');
$ENABLE_MANAGE  = has_permission('Cashflow_Project.Manage');
$ENABLE_VIEW    = has_permission('Cashflow_Project.View');
$ENABLE_DELETE  = has_permission('Cashflow_Project.Delete');
?>

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

    .dropdown-menu {

        position: absolute;
        top: 100%;
        /* Position below the button */
        right: 0;
        /* Align with left edge */
    }
</style>

<div class="box">
    <div class="box-header">

    </div>

    <div class="box-body" style="z-index: 1 !important;">
        <table border="0" style="width: 100%; z-index: 1 !important;">
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
                <td class="pd-5 valign-top" width="400"><?= $list_budgeting->nama_project ?></td>
                <th class="pd-5 valign-top" width="150"></th>
                <td class="pd-5 valign-top" width="400"></td>
            </tr>
        </table>
    </div>
</div>

<div class="box">
    <div class="box-header">
        <table border="0" style="width: 100%;">
            <tr>
                <th class="pd-5" width="450">
                    <h4 style="font-weight: 800;">Biaya Subcont</h4>
                </th>
                <th class="pd-5">
                    <div class="col-md-12" style="border: 1px solid #ccc; border-radius: 10px;">
                        <table border="0" style="width: 100%;">
                            <tr>
                                <th class="">
                                    <h4>Budget</h4>
                                </th>
                            </tr>
                            <tr>
                                <th class="">
                                    <h3 style="font-weight: 800;">Rp. <?= number_format($budget_subcont) ?></h3>
                                </th>
                            </tr>
                        </table>
                    </div>
                </th>
                <th class="pd-5">
                    <div class="col-md-12" style="border: 1px solid #ccc; border-radius: 10px;">
                        <table border="0" style="width: 100%;">
                            <tr>
                                <th class="">
                                    <h4>Actual</h4>
                                </th>
                            </tr>
                            <tr>
                                <th class="">
                                    <h3 style="font-weight: 800;" class="budget_subcont_on_process">Rp. <?= number_format($actual_budget_subcont) ?></h3>
                                </th>
                            </tr>
                        </table>
                    </div>
                </th>
                <th class="pd-5">
                    <div class="col-md-12" style="border: 1px solid #ccc; border-radius: 10px;">
                        <table border="0" style="width: 100%;">
                            <tr>
                                <th class="">
                                    <h4>Sisa Budget</h4>
                                </th>
                            </tr>
                            <tr>
                                <th class="">
                                    <h3 style="font-weight: 800;" class="budget_subcont_on_process">Rp. <?= number_format(($budget_subcont - $actual_budget_subcont)) ?></h3>
                                </th>
                            </tr>
                        </table>
                    </div>
                </th>
            </tr>
        </table>
    </div>

    <div class="box-body" style="overflow: visible !important;">
        <table id="example1" class="table custom-table mt-5" style="overflow: visible !important;">
            <thead>
                <tr>
                    <th class="text-center">Item</th>
                    <th class="text-center">Budget (Rp)</th>
                    <th class="text-center">Actual (Rp)</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Biaya Subcont</td>
                    <td class="text-center"><?= number_format($budget_subcont) ?></td>
                    <td class="text-center"><?= number_format($actual_budget_subcont) ?></td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<div class="box">
    <div class="box-header">
        <table border="0" style="width: 100%;">
            <tr>
                <th class="pd-5" width="450">
                    <h4 style="font-weight: 800;">Akomodasi</h4>
                </th>
                <th class="pd-5">
                    <div class="col-md-12" style="border: 1px solid #ccc; border-radius: 10px;">
                        <table border="0" style="width: 100%;">
                            <tr>
                                <th class="">
                                    <h4>Budget</h4>
                                </th>
                            </tr>
                            <tr>
                                <th class="">
                                    <h3 style="font-weight: 800;">Rp. <?= number_format($budget_akomodasi) ?></h3>
                                </th>
                            </tr>
                        </table>
                    </div>
                </th>
                <th class="pd-5">
                    <div class="col-md-12" style="border: 1px solid #ccc; border-radius: 10px;">
                        <table border="0" style="width: 100%;">
                            <tr>
                                <th class="">
                                    <h4>Actual</h4>
                                </th>
                            </tr>
                            <tr>
                                <th class="">
                                    <h3 style="font-weight: 800;" class="budget_subcont_on_process">Rp. <?= number_format($actual_budget_akomodasi) ?></h3>
                                </th>
                            </tr>
                        </table>
                    </div>
                </th>
                <th class="pd-5">
                    <div class="col-md-12" style="border: 1px solid #ccc; border-radius: 10px;">
                        <table border="0" style="width: 100%;">
                            <tr>
                                <th class="">
                                    <h4>Sisa Budget</h4>
                                </th>
                            </tr>
                            <tr>
                                <th class="">
                                    <h3 style="font-weight: 800;" class="budget_subcont_on_process">Rp. <?= number_format(($budget_akomodasi - $actual_budget_akomodasi)) ?></h3>
                                </th>
                            </tr>
                        </table>
                    </div>
                </th>
            </tr>
        </table>
    </div>

    <div class="box-body" style="overflow: visible !important;">
        <table id="example1" class="table custom-table mt-5" style="overflow: visible !important;">
            <thead>
                <tr>
                    <th class="text-center">Item</th>
                    <th class="text-center">Budget (Rp)</th>
                    <th class="text-center">Actual (Rp)</th>
                </tr>
            </thead>
            <tbody>
               <?php 
                    foreach($list_akomodasi as $item) {
                        echo '<tr>';
                        echo '<td>'.$item->nm_biaya.'</td>';
                        echo '<td class="text-center">'.number_format($item->total_final + $item->nilai_ovb, 2).'</td>';
                        echo '<td class="text-center">'.number_format($item->nilai_actual, 2).'</td>';
                        echo '</tr>';
                    }
               ?>
            </tbody>
        </table>
    </div>
</div>

<div class="box">
    <div class="box-header">
        <table border="0" style="width: 100%;">
            <tr>
                <th class="pd-5" width="450">
                    <h4 style="font-weight: 800;">Others</h4>
                </th>
                <th class="pd-5">
                    <div class="col-md-12" style="border: 1px solid #ccc; border-radius: 10px;">
                        <table border="0" style="width: 100%;">
                            <tr>
                                <th class="">
                                    <h4>Budget</h4>
                                </th>
                            </tr>
                            <tr>
                                <th class="">
                                    <h3 style="font-weight: 800;">Rp. <?= number_format($budget_others) ?></h3>
                                </th>
                            </tr>
                        </table>
                    </div>
                </th>
                <th class="pd-5">
                    <div class="col-md-12" style="border: 1px solid #ccc; border-radius: 10px;">
                        <table border="0" style="width: 100%;">
                            <tr>
                                <th class="">
                                    <h4>Actual</h4>
                                </th>
                            </tr>
                            <tr>
                                <th class="">
                                    <h3 style="font-weight: 800;" class="budget_subcont_on_process">Rp. <?= number_format($actual_budget_others) ?></h3>
                                </th>
                            </tr>
                        </table>
                    </div>
                </th>
                <th class="pd-5">
                    <div class="col-md-12" style="border: 1px solid #ccc; border-radius: 10px;">
                        <table border="0" style="width: 100%;">
                            <tr>
                                <th class="">
                                    <h4>Sisa Budget</h4>
                                </th>
                            </tr>
                            <tr>
                                <th class="">
                                    <h3 style="font-weight: 800;" class="budget_subcont_on_process">Rp. <?= number_format(($budget_others - $actual_budget_others)) ?></h3>
                                </th>
                            </tr>
                        </table>
                    </div>
                </th>
            </tr>
        </table>
    </div>

    <div class="box-body" style="overflow: visible !important;">
        <table id="example1" class="table custom-table mt-5" style="overflow: visible !important;">
            <thead>
                <tr>
                    <th class="text-center">Item</th>
                    <th class="text-center">Budget (Rp)</th>
                    <th class="text-center">Actual (Rp)</th>
                </tr>
            </thead>
            <tbody>
               <?php 
                    foreach($list_others as $item) {
                        echo '<tr>';
                        echo '<td>'.$item->nm_biaya.'</td>';
                        echo '<td class="text-center">'.number_format($item->total_final, 2).'</td>';
                        echo '<td class="text-center">'.number_format($item->nilai_actual, 2).'</td>';
                        echo '</tr>';
                    }
               ?>
            </tbody>
        </table>
        
        <br><br>

        <a href="<?= base_url('cashflow_project') ?>" class="btn btn-sm btn-danger">
            <i class="fa fa-arrow-left"></i> Back
        </a>
    </div>

</div>



<script src="<?= base_url('assets/js/autoNumeric.js'); ?>"></script>
<script src="https://cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>

<script>
    
</script>