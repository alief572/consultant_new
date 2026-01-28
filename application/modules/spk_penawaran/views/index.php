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

    .btn {
        font-weight: bold;
    }
</style>
<div id="alert_edit" class="alert alert-success alert-dismissable" style="padding: 15px; display: none;"></div>
<div class="box">
    <div class="box-header">
        <?php if ($ENABLE_ADD) : ?>
            <div class="dropdown text-right">
                <a class="btn btn-sm btn-success" href="<?= base_url('spk_penawaran/create_spk') ?>">
                    <i class="fa fa-plus"></i> Create SPK
                </a>
                <a class="btn btn-sm btn-primary" href="<?= base_url('spk_penawaran/create_spk_non_konsultasi') ?>">
                    <i class="fa fa-plus"></i> Create SPK Non Konsultasi
                </a>
                <!-- <button type="button" class="btn btn-sm btn-danger" id="one_time">Update!</button> -->
            </div>
        <?php endif; ?>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="konsultasi active"><a href="javascript:void();" onclick="tab_konsultasi();">Konsultasi</a></li>
            <li role="presentation" class="non_konsultasi"><a href="javascript:void();" onclick="tab_non_konsultasi();">Non Konsultasi</a></li>
        </ul>
        <div id="konsultasi">
            <table id="table_penawaran" class="table table-bordered table-striped">
                <thead class="bg-primary">
                    <tr>
                        <th align="center">No</th>
                        <th align="center">Nomor SPK</th>
                        <th align="center">Marketing</th>
                        <th align="center">Package</th>
                        <th align="center">Customer</th>
                        <th align="center">Grand Total</th>
                        <th align="center">Status</th>
                        <th align="center">Status SPK</th>
                        <th align="center">Action</th>
                    </tr>
                </thead>

            </table>
        </div>
        <div id="non_konsultasi" style="display: none;">
            <table id="table_spk_non_konsultasi" class="table table-bordered table-striped">
                <thead class="bg-primary">
                    <tr>
                        <th align="center">No</th>
                        <th align="center">Nomor SPK</th>
                        <th align="center">Marketing</th>
                        <th align="center">Package</th>
                        <th align="center">Customer</th>
                        <th align="center">Grand Total</th>
                        <th align="center">Status SPK</th>
                        <th align="center">Action</th>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- page script -->
<script type="text/javascript">
    function tab_konsultasi() {
        $('#konsultasi').show();
        $('#non_konsultasi').hide();

        $('.konsultasi').addClass('active');
        $('.non_konsultasi').removeClass('active');

        DataTables();
    }

    function tab_non_konsultasi() {
        $('#non_konsultasi').show();
        $('#konsultasi').hide();

        $('.non_konsultasi').addClass('active');
        $('.konsultasi').removeClass('active');

        DataTablesNonKons();
    }

    $(document).ready(function() {
        DataTables();
    });

    $(document).on('click', '.del_spk', function() {
        var id_spk_penawaran = $(this).data('id_spk_penawaran');

        Swal.fire({
            icon: 'warning',
            title: 'Are you sure?',
            text: 'This data will be deleted !',
            cancelShowButton: true
        }).then((next) => {
            if (next.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'del_spk',
                    data: {
                        'id_spk_penawaran': id_spk_penawaran
                    },
                    cache: false,
                    dataType: 'JSON',
                    success: function(result) {
                        if (result.status == 1) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Success !',
                                text: result.msg
                            }).then(() => {
                                DataTables();
                            });
                        } else {
                            Swal.fire({
                                icon: 'warning',
                                title: 'Failed !',
                                text: result.msg
                            });
                        }
                    },
                    error: function(result) {
                        Swal.fire({
                            type: 'error',
                            title: 'Error !',
                            text: 'Please try again later !'
                        });
                    }
                })
            }
        });
    });

    $(document).on('click', '#one_time', function() {
        Swal.fire({
            icon: 'warning',
            title: 'Warning !',
            text: 'Are you sure ?',
            showCancelButton: true
        }).then((next) => {
            if (next.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'one_time',
                    cache: false,
                    dataType: 'json',
                    success: function(result) {
                        if (result.status == 1) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Success !',
                                text: result.msg
                            }, function(after) {
                                DataTables();
                            });
                        } else {
                            Swal.fire({
                                icon: 'warning',
                                title: 'Failed !',
                                text: result.msg
                            });
                        }
                    },
                    error: function(result) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error !',
                            text: 'Please try again later !'
                        });
                    }
                });
            }
        });
    });

    $(document).on('click', '.del_spk_non_kons', function() {
        var id_spk_penawaran = $(this).data('id_spk_penawaran');

        Swal.fire({
            icon: 'warning',
            title: 'Are you sure ?',
            text: 'This data will be deleted !',
            showConfirmButton: true,
            showCancelButton: true,
            allowOutsideClick: false
        }).then((next) => {
            if (next.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'del_spk_non_kons',
                    data: {
                        'id_spk_penawaran': id_spk_penawaran
                    },
                    cache: false,
                    dataType: 'json',
                    success: function(result) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Success !',
                            text: 'Data has been deleted !',
                            showConfirmButton: false,
                            showCancelButton: false,
                            allowOutsideClick: false,
                            allowEscapeKey: false,
                            timer: 3000
                        }).then(() => {
                            Swal.close();
                            DataTablesNonKons();
                        });
                    },
                    error: function(xhr, status, error) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error !',
                            text: "There's an error occured, Please try again later !",
                            showConfirmButton: false,
                            showCancelButton: false,
                            allowEscapeKey: false,
                            allowOutsideClick: false,
                            timer: 3000
                        }).then(() => {
                            Swal.close();
                        });
                    }
                });
            }
        });
    });

    function DataTables() {
        // var dataTables = $('#table_penawaran').dataTable();
        // dataTables.destroy();

        var dataTables = $('#table_penawaran').dataTable({
            ajax: {
                url: siteurl + active_controller + 'get_data_spk',
                type: "POST",
                dataType: "JSON",
                data: function(d) {

                }
            },
            columns: [{
                    data: 'no',
                }, {
                    data: 'id_spk_penawaran'
                },
                {
                    data: 'nm_marketing'
                },
                {
                    data: 'nm_paket'
                },
                {
                    data: 'nm_customer'
                },
                {
                    data: 'grand_total'
                },
                {
                    data: 'status'
                },
                {
                    data: 'status_spk'
                },
                {
                    data: 'option'
                }
            ],
            responsive: true,
            processing: true,
            serverSide: true,
            stateSave: true,
            destroy: true,
            paging: true
        });
    }

    function DataTablesNonKons() {
        // var dataTables = $('#table_penawaran').dataTable();
        // dataTables.destroy();

        var dataTables = $('#table_spk_non_konsultasi').dataTable({
            ajax: {
                url: siteurl + active_controller + 'table_spk_non_konsultasi',
                type: "POST",
                dataType: "JSON",
                data: function(d) {

                },
                error: function(xhr, status, error) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Error !',
                        text: "There's an error occured, Please try again later !",
                        showConfirmButton: true,
                        showCancelButton: false,
                        allowOutsideClick: false
                    });
                }
            },
            columns: [{
                    data: 'no',
                }, {
                    data: 'id_spk_penawaran'
                },
                {
                    data: 'nm_marketing'
                },
                {
                    data: 'nm_paket'
                },
                {
                    data: 'nm_customer'
                },
                {
                    data: 'grand_total'
                },
                {
                    data: 'status_spk'
                },
                {
                    data: 'action'
                }
            ],
            responsive: true,
            processing: true,
            serverSide: true,
            stateSave: true,
            destroy: true,
            paging: true
        });
    }
</script>
<script src="<?= base_url('assets/js/basic.js') ?>"></script>