<?php
$ENABLE_ADD     = has_permission('Expense_Report_Project.Add');
$ENABLE_MANAGE  = has_permission('Expense_Report_Project.Manage');
$ENABLE_VIEW    = has_permission('Expense_Report_Project.View');
$ENABLE_DELETE  = has_permission('Expense_Report_Project.Delete');
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
                                    <h3 style="font-weight: 800;" class="budget_subcont_on_process">Rp. <?= number_format($nilai_kasbon_on_proses) ?></h3>
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
                    <th class="text-center">No</th>
                    <th class="text-center">Req. Number</th>
                    <th class="text-center">Description</th>
                    <th class="text-center">Date</th>
                    <th class="text-center">Total</th>
                    <th class="text-center">Status</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>

<div class="box">
    <div class="box-header">
        <table border="0" style="width: 100%;">
            <tr>
                <th class="pd-5" width="700">
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
                                    <h4>On Process</h4>
                                </th>
                            </tr>
                            <tr>
                                <th class="">
                                    <h3 style="font-weight: 800;" class="budget_akomodasi_on_process">Rp. <?= number_format($nilai_kasbon_on_proses_akomodasi) ?></h3>
                                </th>
                            </tr>
                        </table>
                    </div>
                </th>
            </tr>
        </table>
    </div>

    <div class="box-body" style="overflow: visible !important;">
        <table class="table custom-table mt-5" id="table_kasbon_akomodasi" style="overflow: visible !important;">
            <thead>
                <tr>
                    <th class="text-center">No</th>
                    <th class="text-center">Req. Number</th>
                    <th class="text-center">Description</th>
                    <th class="text-center">Date</th>
                    <th class="text-center">Total</th>
                    <th class="text-center">Status</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
</div>

<div class="box">
    <div class="box-header">
        <table border="0" style="width: 100%;">
            <tr>
                <th class="pd-5" width="700">
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
                                    <h4>On Process</h4>
                                </th>
                            </tr>
                            <tr>
                                <th class="">
                                    <h3 style="font-weight: 800;" class="budget_others_on_process">Rp. <?= number_format($nilai_kasbon_on_proses_others) ?></h3>
                                </th>
                            </tr>
                        </table>
                    </div>
                </th>
            </tr>
        </table>
    </div>

    <div class="box-body">
        <table class="table custom-table mt-5" id="table_kasbon_others" style="overflow: visible !important;">
            <thead>
                <tr>
                    <th class="text-center">No</th>
                    <th class="text-center">Req. Number</th>
                    <th class="text-center">Description</th>
                    <th class="text-center">Date</th>
                    <th class="text-center">Total</th>
                    <th class="text-center">Status</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>

    </div>
</div>

<div class="box">
    <div class="box-header">
        <table border="0" style="width: 100%;">
            <tr>
                <th class="pd-5" width="700">
                    <h4 style="font-weight: 800;">Lab</h4>
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
                                    <h3 style="font-weight: 800;">Rp. <?= number_format($budget_lab) ?></h3>
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
                                    <h3 style="font-weight: 800;" class="budget_lab_on_process">Rp. <?= number_format($nilai_kasbon_on_proses_lab) ?></h3>
                                </th>
                            </tr>
                        </table>
                    </div>
                </th>
            </tr>
        </table>
    </div>

    <div class="box-body">
        <table class="table custom-table mt-5" id="table_kasbon_lab" style="overflow: visible !important;">
            <thead>
                <tr>
                    <th class="text-center">No</th>
                    <th class="text-center">Req. Number</th>
                    <th class="text-center">Description</th>
                    <th class="text-center">Date</th>
                    <th class="text-center">Total</th>
                    <th class="text-center">Status</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>

    </div>
</div>

<div class="box">
    <div class="box-header">
        <table border="0" style="width: 100%;">
            <tr>
                <th class="pd-5" width="700">
                    <h4 style="font-weight: 800;">Subcont Tenaga Ahli</h4>
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
                                    <h3 style="font-weight: 800;">Rp. <?= number_format($budget_subcont_tenaga_ahli) ?></h3>
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
                                    <h3 style="font-weight: 800;" class="budget_subcont_tenaga_ahli_on_process">Rp. <?= number_format($nilai_kasbon_on_proses_subcont_tenaga_ahli) ?></h3>
                                </th>
                            </tr>
                        </table>
                    </div>
                </th>
            </tr>
        </table>
    </div>

    <div class="box-body">
        <table class="table custom-table mt-5" id="table_kasbon_subcont_tenaga_ahli" style="overflow: visible !important;">
            <thead>
                <tr>
                    <th class="text-center">No</th>
                    <th class="text-center">Req. Number</th>
                    <th class="text-center">Description</th>
                    <th class="text-center">Date</th>
                    <th class="text-center">Total</th>
                    <th class="text-center">Status</th>
                </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
        <a href="<?= base_url('expense_report_project') ?>" class="btn btn-sm btn-danger">
            <i class="fa fa-arrow-left"></i> Back
        </a>
    </div>
</div>



<script src="<?= base_url('assets/js/autoNumeric.js'); ?>"></script>
<!-- <script src="https://cdn.datatables.net/2.1.8/js/dataTables.min.js"></script> -->

<script>
    $(document).ready(function() {
        DataTables_kasbon_subcont();
        DataTables_kasbon_akomodasi();
        DataTables_kasbon_others();
        DataTables_kasbon_lab();
        DataTables_kasbon_subcont_tenaga_ahli();
        // DataTables_ovb_akomodasi();
    });

    function DataTables_kasbon_subcont(view = null) {
        var dataTables_kasbon_subcont = $('#example1').DataTable();

        // Destroying and Reinitializing (Make sure to destroy before reinitialize)
        dataTables_kasbon_subcont.destroy();
        dataTables_kasbon_subcont = $('#example1').dataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: siteurl + active_controller + 'get_data_kasbon_subcont',
                type: "POST",
                dataType: "JSON",
                data: function(d) {
                    d.id_spk_budgeting = "<?= $list_budgeting->id_spk_budgeting ?>"
                    d.view = view
                }
            },
            columns: [{
                    data: 'no'
                },
                {
                    data: 'req_number'
                },
                {
                    data: 'nm_aktifitas'
                },
                {
                    data: 'date'
                },
                {
                    data: 'total'
                },
                {
                    data: 'status'
                }
            ]
        });
    }

    function DataTables_kasbon_akomodasi(view = null) {
        var dataTables_kasbon_akomodasi = $('#table_kasbon_akomodasi').DataTable();

        // Destroying and Reinitializing (Make sure to destroy before reinitialize)
        dataTables_kasbon_akomodasi.destroy();
        dataTables_kasbon_akomodasi = $('#table_kasbon_akomodasi').dataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: siteurl + active_controller + 'get_data_kasbon_akomodasi',
                type: "POST",
                dataType: "JSON",
                data: function(d) {
                    d.id_spk_budgeting = "<?= $list_budgeting->id_spk_budgeting ?>"
                    d.view = view
                }
            },
            columns: [{
                    data: 'no'
                },
                {
                    data: 'req_number'
                },
                {
                    data: 'nm_biaya'
                },
                {
                    data: 'date'
                },
                {
                    data: 'total'
                },
                {
                    data: 'status'
                }
            ]
        });
    }

    function DataTables_kasbon_others(view = null) {
        var dataTables_kasbon_others = $('#table_kasbon_others').DataTable();

        // Destroying and Reinitializing (Make sure to destroy before reinitialize)
        dataTables_kasbon_others.destroy();
        dataTables_kasbon_others = $('#table_kasbon_others').dataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: siteurl + active_controller + 'get_data_kasbon_others',
                type: "POST",
                dataType: "JSON",
                data: function(d) {
                    d.id_spk_budgeting = "<?= $list_budgeting->id_spk_budgeting ?>"
                    d.view = view
                }
            },
            columns: [{
                    data: 'no'
                },
                {
                    data: 'req_number'
                },
                {
                    data: 'nm_biaya'
                },
                {
                    data: 'date'
                },
                {
                    data: 'total'
                },
                {
                    data: 'status'
                }
            ]
        });
    }

    function DataTables_kasbon_lab(view = null) {
        var dataTables_kasbon_lab = $('#table_kasbon_lab').DataTable();

        // Destroying and Reinitializing (Make sure to destroy before reinitialize)
        dataTables_kasbon_lab.destroy();
        dataTables_kasbon_lab = $('#table_kasbon_lab').dataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: siteurl + active_controller + 'get_data_kasbon_lab',
                type: "POST",
                dataType: "JSON",
                data: function(d) {
                    d.id_spk_budgeting = "<?= $list_budgeting->id_spk_budgeting ?>"
                    d.view = view
                }
            },
            columns: [{
                    data: 'no'
                },
                {
                    data: 'req_number'
                },
                {
                    data: 'nm_biaya'
                },
                {
                    data: 'date'
                },
                {
                    data: 'total'
                },
                {
                    data: 'status'
                }
            ]
        });
    }

    function DataTables_kasbon_subcont_tenaga_ahli(view = null) {
        var dataTables_kasbon_subcont_tenaga_ahli = $('#table_kasbon_subcont_tenaga_ahli').DataTable();

        // Destroying and Reinitializing (Make sure to destroy before reinitialize)
        dataTables_kasbon_subcont_tenaga_ahli.destroy();
        dataTables_kasbon_subcont_tenaga_ahli = $('#table_kasbon_subcont_tenaga_ahli').dataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: siteurl + active_controller + 'get_data_kasbon_subcont_tenaga_ahli',
                type: "POST",
                dataType: "JSON",
                data: function(d) {
                    d.id_spk_budgeting = "<?= $list_budgeting->id_spk_budgeting ?>"
                    d.view = view
                }
            },
            columns: [{
                    data: 'no'
                },
                {
                    data: 'req_number'
                },
                {
                    data: 'nm_biaya'
                },
                {
                    data: 'date'
                },
                {
                    data: 'total'
                },
                {
                    data: 'status'
                }
            ]
        });
    }

    function DataTables_ovb_akomodasi(view = null) {
        var dataTables_ovb_akomodasi = $('#table_ovb_akomodasi').DataTable();

        // Destroying and Reinitializing (Make sure to destroy before reinitialize)
        dataTables_ovb_akomodasi.destroy();
        dataTables_ovb_akomodasi = $('#table_ovb_akomodasi').dataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: siteurl + active_controller + 'get_data_ovb_akomodasi',
                type: "POST",
                dataType: "JSON",
                data: function(d) {
                    d.id_spk_budgeting = "<?= $list_budgeting->id_spk_budgeting ?>"
                    d.view = view
                }
            },
            columns: [{
                    data: 'no'
                },
                {
                    data: 'id_request_ovb'
                },
                {
                    data: 'amount'
                }
            ]
        });
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

    function hitung_all_budget_process() {
        var id_spk_budgeting = "<?= $list_budgeting->id_spk_budgeting ?>";

        $.ajax({
            type: 'post',
            url: siteurl + active_controller + 'hitung_all_budget_on_process',
            data: {
                'id_spk_budgeting': id_spk_budgeting
            },
            cache: false,
            dataType: 'json',
            success: function(result) {
                $('.budget_subcont_on_process').html('Rp. ' + number_format(result.nilai_budget_subcont));
                $('.budget_akomodasi_on_process').html(number_format(result.nilai_budget_akomodasi));
                $('.budget_others_on_process').html('Rp. ' + number_format(result.nilai_budget_others));
            },
            error: function(result) {

            }
        });
    }

    $(document).on('click', '.req_approval', function() {
        var id = $(this).data('id');

        swal({
            type: 'warning',
            title: 'Are you sure ?',
            text: 'This data cannot be edited after this process !',
            showCancelButton: true
        }, function(lanjut) {
            if (lanjut) {
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'req_approval',
                    data: {
                        'id': id
                    },
                    cache: false,
                    dataType: 'json',
                    success: function(result) {
                        if (result.status == '1') {
                            swal({
                                type: 'success',
                                title: 'Success !',
                                text: result.pesan
                            }, function(lanjut) {
                                location.reload(true);
                            });
                        } else {
                            swal({
                                type: 'warning',
                                title: 'Warning !',
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
    });
</script>