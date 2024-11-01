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

    .pd-5 {
        padding: 5px;
    }

    .valign-top {
        vertical-align: top;
    }
</style>

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
        </table>
    </div>
</div>

<div class="box">
    <div class="box-header">
        <table border="0" style="width: 100%;">
            <tr>
                <th class="pd-5" width="700">
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
                                    <h4>On Process</h4>
                                </th>
                            </tr>
                            <tr>
                                <th class="">
                                    <h3 style="font-weight: 800;">Rp. <?= number_format(0) ?></h3>
                                </th>
                            </tr>
                        </table>
                    </div>
                </th>
            </tr>
        </table>
    </div>

    <div class="box-body">
        <button type="button" class="btn btn-sm btn-success"></button>
        <table class="table custom-table">
            <thead>
                <tr>
                    <th class="text-center">No</th>
                    <th class="text-center">Req. Number</th>
                    <th class="text-center">Description</th>
                    <th class="text-center">Date</th>
                    <th class="text-center">Amount</th>
                    <th class="text-center">Total</th>
                    <th class="text-center">Status</th>
                    <th class="text-center">Option</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
            <tfoot>
                <tr>
                    <th colspan="5"></th>
                    <th class="text-center">0,00</th>
                    <th colspan="2"></th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>



<script src="<?= base_url('assets/js/autoNumeric.js'); ?>"></script>