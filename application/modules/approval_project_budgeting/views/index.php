<?php
$ENABLE_ADD     = has_permission('Approval_Project_Budgeting.Add');
$ENABLE_MANAGE  = has_permission('Approval_Project_Budgeting.Manage');
$ENABLE_VIEW    = has_permission('Approval_Project_Budgeting.View');
$ENABLE_DELETE  = has_permission('Approval_Project_Budgeting.Delete');
?>
<!-- <link rel="stylesheet" href="<?= base_url('assets/plugins/datatables/dataTables.bootstrap.css') ?>"> -->
<link rel="stylesheet" href="https://cdn.datatables.net/2.1.7/css/dataTables.dataTables.min.css">

<style>
    .btn {
        border-radius: 10px;
    }

    .dropdown-menu {
        list-style: none;
        background: #fff;
        border: 1px solid rgba(0, 0, 0, .15);
        border-radius: 4px;
        box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
        z-index: 99999;
        padding: 5px 0;
        margin: 0;
        min-width: 150px;
        display: none;
    }

    .dropdown-menu li a {
        display: block;
        padding: 5px 15px;
        color: #333;
        text-decoration: none;
        white-space: nowrap;
    }

    .dropdown-menu li a:hover {
        background-color: #f5f5f5;
    }

    .table-responsive,
    .dataTables_scrollBody,
    .dataTables_wrapper,
    .box-body,
    .box {
        overflow: visible !important;
    }

    #table_penawaran {
        font-size: 12px;
        width: 100% !important;
    }

    #table_penawaran th {
        background-color: #f4f6f9;
        font-weight: 600;
        padding: 8px 6px !important;
        vertical-align: middle !important;
    }

    #table_penawaran td {
        padding: 6px 8px !important;
        vertical-align: middle !important;
    }
</style>
<div id="alert_edit" class="alert alert-success alert-dismissable" style="padding: 15px; display: none;"></div>
<div class="box">
    <div class="box-header">

    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <div class="table-responsive">
            <table id="table_penawaran" class="table table-bordered table-striped table-hover table-condensed" style="width: 100%;">
                <thead>
                    <tr>
                        <th class="text-center" style="width: 4%;">No</th>
                        <th class="text-center" style="width: 25%;">Nomor SPK</th>
                        <th class="text-center" style="width: 20%;">Customer</th>
                        <th class="text-center" style="width: 13%;">Sales</th>
                        <th class="text-center" style="width: 13%;">Project Leader</th>
                        <th class="text-center" style="width: 19%;">Package</th>
                        <th class="text-center" style="width: 6%;">Action</th>
                    </tr>
                </thead>

            </table>
        </div>
    </div>
    <!-- /.box-body -->
</div>
<div id="form-data"></div>
<!-- DataTables -->
<!-- <script src="<?= base_url('assets/plugins/datatables/jquery.dataTables.min.js') ?>"></script>
<script src="<?= base_url('assets/plugins/datatables/dataTables.bootstrap.min.js') ?>"></script> -->

<script src="https://cdn.datatables.net/2.1.7/js/dataTables.min.js"></script>
<!-- page script -->
<script type="text/javascript">
    $(document).ready(function() {
        DataTables();
    });

    $(document).on('click', '.del_spk_budget', function() {
        var id = $(this).data('id');

        Swal.fire({
            icon: 'warning',
            title: 'Are you sure ?',
            text: 'This data will be deleted !',
            showCancelButton: true
        }).then((next) => {
            if (next.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'del_spk_budgeting',
                    data: {
                        'id': id
                    },
                    cache: false,
                    dataType: 'JSON',
                    success: function(result) {
                        if (result.status == 1) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Success !',
                                text: result.pesan
                            }).then((lanjut) => {
                                DataTables();
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
                            text: 'Please try again later!'
                        });
                    }
                });
            }
        });
    });

    function DataTables() {
        var dataTables = $('#table_penawaran').dataTable({
            ajax: {
                url: siteurl + active_controller + 'get_data_spk',
                type: "POST",
                dataType: "JSON",
                data: function(d) {

                }
            },
            columns: [
                {
                    data: 'no',
                    className: 'text-center'
                },
                {
                    data: 'spk_info'
                },
                {
                    data: 'nm_customer'
                },
                {
                    data: 'nm_sales'
                },
                {
                    data: 'nm_project_leader'
                },
                {
                    data: 'nm_project',
                    render: function(data, type, row) {
                        if (type === 'display' && data && data.length > 50) {
                            return '<span title="' + data + '" style="cursor:help;">' + data.substring(0, 50) + '…</span>';
                        }
                        return data;
                    }
                },
                {
                    data: 'option',
                    className: 'text-center'
                }
            ],
            responsive: false,
            autoWidth: false,
            processing: true,
            serverSide: true,
            stateSave: true,
            destroy: true,
            paging: true,
            scrollX: false
        });
    }
</script>
<script type="text/javascript">
    $(document).on('click', '.dropdown-toggle', function(e) {
        e.preventDefault();
        e.stopPropagation();
        $('.dropdown-menu').hide();
        var $btn = $(this);
        var $menu = $btn.siblings('.dropdown-menu');
        if ($menu.is(':visible')) {
            $menu.hide();
            return;
        }
        var offset = $btn.offset();
        $menu.css({
            position: 'fixed',
            top: (offset.top + $btn.outerHeight() - $(window).scrollTop()) + 'px',
            left: 'auto',
            right: ($(window).width() - offset.left - $btn.outerWidth()) + 'px',
            display: 'block',
            zIndex: 99999
        });
    });
    $(document).on('click', function(e) {
        if (!$(e.target).closest('.btn-group').length) {
            $('.dropdown-menu').hide();
        }
    });
</script>
<script src="<?= base_url('assets/js/basic.js') ?>"></script>