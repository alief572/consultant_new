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
</style>
<div id="alert_edit" class="alert alert-success alert-dismissable" style="padding: 15px; display: none;"></div>
<div class="box">
    <div class="box-header">
        <?php if ($ENABLE_ADD) : ?>
            <div class="dropdown text-right">
                <a class="btn btn-sm btn-success" style="font-weight: bold;" href="<?= base_url('penawaran/add_penawaran') ?>">
                    <i class="fa fa-plus"></i> Penawaran Konsultasi
                </a>
                <a class="btn btn-sm btn-primary" style="font-weight: bold;" href="<?= base_url('penawaran/add_penawaran_non') ?>">
                    <i class="fa fa-plus"></i> Penawaran Non Konsultasi
                </a>
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
            <table id="table_penawaran" class="table table-striped">
                <thead class="bg-primary">
                    <tr>
                        <th align="center">No</th>
                        <th align="center">ID Quotation</th>
                        <th align="center">Date</th>
                        <th align="center">Marketing</th>
                        <th align="center">Package</th>
                        <th align="center">Customer</th>
                        <th align="center">Grand Total</th>
                        <th align="center">Revisi</th>
                        <th align="center">Status Cust</th>
                        <th align="center">Status Quot</th>
                        <th align="center">Action</th>
                    </tr>
                </thead>

            </table>
        </div>
        <div id="non_konsultasi" style="display: none;">
            <table id="table_penawaran_non_konsultasi" class="table table-bordered table-striped">
                <thead class="bg-primary">
                    <tr>
                        <th align="center">No</th>
                        <th align="center">ID Quotation</th>
                        <th align="center">Date</th>
                        <th align="center">PIC Penawaran</th>
                        <th align="center">Penawaran</th>
                        <th align="center">Customer</th>
                        <th align="center">Grand Total</th>
                        <th align="center">Status Quotation</th>
                        <th align="center">Action</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
    <!-- /.box-body -->
</div>
<div id="form-data"></div>


<div class="modal modal-default fade" id="modal_deal_penawaran" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md">
        <div class="modal-content">
            <form id="frm-deal" enctype="multipart/form-data">
                <input type="hidden" name="id_penawaran" id="id_penawaran_deal">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel"><span class="fa fa-users"></span>&nbsp;Upload Dokumen Pendukung</h4>
                </div>
                <div class="modal-body" id="ModalView">
                    <div class="form-group">
                        <label for="">Dokumen Pendukung</label>
                        <input type="file" name="dokumen_pendukung" id="" class="form-control form-control-sm" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-arrow-left"></i> Close</button>
                    <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.datatables.net/2.1.7/js/dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- page script -->
<script type="text/javascript">
    $(document).ready(function() {
        DataTables();
    });

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

        DataTablesNon();
    }

    $(document).on('click', '.deal_penawaran', function() {
        var id_penawaran = $(this).data('id_penawaran');
        
        Swal.fire({
            icon: 'warning',
            title: 'Are you sure ?',
            text: "You can't reverse it after you deal this data !",
            showConfirmButton: true,
            showCancelButton: true
        }).then((next) => {
            if (next.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'deal_penawaran',
                    data: {
                        'id_penawaran': id_penawaran
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
                            icon: 'error',
                            title: 'Error !',
                            text: 'Please try again later !'
                        });
                    }
                })
            }
        });
    });

    $(document).on('click', '.btn_deal_penawaran', function() {
        var id_penawaran = $(this).data('id_penawaran');
        $('#id_penawaran_deal').val(id_penawaran);
    });

    $(document).on('click', '.del_penawaran', function() {
        var id_penawaran = $(this).data('id_penawaran');

        Swal.fire({
            icon: 'warning',
            title: 'Are you sure?',
            text: 'This data will be deleted !',
            showCancelButton: true
        }).then((next) => {
            if (next.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'del_penawaran',
                    data: {
                        'id_penawaran': id_penawaran
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
                            icon: 'error',
                            title: 'Error !',
                            text: 'Please try again later !'
                        });
                    }
                })
            }
        });
    });

    $(document).on('submit', '#frm-deal', function(e) {
        e.preventDefault();

        Swal.fire({
            icon: 'warning',
            title: 'Are you sure ?',
            text: "You can't reverse it after you deal this data !",
            showConfirmButton: true,
            showCancelButton: true
        }).then((next) => {
            if (next.isConfirmed) {
                var formData = new FormData($('#frm-deal')[0]);
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'deal_penawaran_non_kons',
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    dataType: 'json',
                    success: function(result) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Success !',
                            text: 'Penawaran has been deal !',
                            showConfirmButton: false,
                            showCancelButton: false,
                            allowClickOutside: false,
                            allowEscapeKey: false,
                            timer: 3000
                        }).then(() => {
                            $('#modal_deal_penawaran').modal('hide');
                            DataTablesNon();
                        });
                    },
                    error: function(xhr, status, error) {
                        // 1. Ambil response text dan parse ke JSON
                        let response = {};
                        try {
                            response = JSON.parse(xhr.responseText);
                        } catch (e) {
                            response = {
                                msg: 'Terjadi kesalahan sistem yang tidak terduga.'
                            };
                        }

                        // 2. Tampilkan pesan 'msg' dari JSON
                        Swal.fire({
                            icon: 'error',
                            title: 'Error !',
                            text: response.msg, // <--- Ini yang bakal nampilin isi pesan lu
                            showConfirmButton: false,
                            timer: 3000
                        });
                    }
                });
            }
        });
    });

    $(document).on('click', '.del_penawaran_non_kons', function() {
        var id_penawaran = $(this).data('id_penawaran');

        Swal.fire({
            icon: 'warning',
            title: 'Are you sure ?',
            text: 'This data will be deleted !',
            showConfirmButton: true,
            showCancelButton: true
        }).then((next) => {
            if (next.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'del_penawaran_non_kons',
                    data: {
                        'id_penawaran': id_penawaran
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
                            allowClickOutside: false,
                            allowEscapeKey: false,
                            timer: 3000
                        }).then(() => {
                            Swal.close();
                            DataTablesNon();
                        });
                    },
                    error: function(xhr, status, error) {
                        // 1. Ambil response text dan parse ke JSON
                        let response = {};
                        try {
                            response = JSON.parse(xhr.responseText);
                        } catch (e) {
                            response = {
                                msg: 'Terjadi kesalahan sistem yang tidak terduga.'
                            };
                        }

                        // 2. Tampilkan pesan 'msg' dari JSON
                        Swal.fire({
                            icon: 'error',
                            title: 'Error !',
                            text: response.msg, // <--- Ini yang bakal nampilin isi pesan lu
                            showConfirmButton: false,
                            timer: 3000
                        });
                    }
                });
            }
        });
    })

    $(document).on('click', '.deal_penawaran_non_kons', function() {
        var id_penawaran = $(this).data('id_penawaran');

        Swal.fire({
            icon: 'warning',
            title: 'Are you sure ?',
            text: "You can't reverse it after you deal this data !",
            showConfirmButton: true,
            showCancelButton: true
        }).then((next) => {
            if (next.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'deal_penawaran_non_kons',
                    data: {
                        'id_penawaran': id_penawaran
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
                            allowClickOutside: false,
                            allowEscapeKey: false,
                            timer: 3000
                        }).then(() => {
                            Swal.close();
                            DataTablesNon();
                        });
                    },
                    error: function(xhr, status, error) {
                        // 1. Ambil response text dan parse ke JSON
                        let response = {};
                        try {
                            response = JSON.parse(xhr.responseText);
                        } catch (e) {
                            response = {
                                msg: 'Terjadi kesalahan sistem yang tidak terduga.'
                            };
                        }

                        // 2. Tampilkan pesan 'msg' dari JSON
                        Swal.fire({
                            icon: 'error',
                            title: 'Error !',
                            text: response.msg, // <--- Ini yang bakal nampilin isi pesan lu
                            showConfirmButton: false,
                            timer: 3000
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
                url: siteurl + active_controller + 'get_data_penawaran',
                type: "POST",
                dataType: "JSON",
                data: function(d) {

                }
            },
            language: {
                loadingRecords: 'Please wait - Loading ...'
            },
            stateSave: false,
            autoWidth: true,
            columns: [{
                    data: 'no',
                }, {
                    data: 'id_quotation'
                },
                {
                    data: 'tgl_quotation'
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
                    data: 'revisi'
                },
                {
                    data: 'status_cust'
                },
                {
                    data: 'status_quot'
                },
                {
                    data: 'option'
                }
            ],
            responsive: true,
            processing: false,
            serverSide: true,
            destroy: true,
            paging: true
        });
    }

    function DataTablesNon() {
        var dataTables = $('#table_penawaran_non_konsultasi').dataTable({
            ajax: {
                url: siteurl + active_controller + 'get_data_penawaran_non',
                type: "GET",
                dataType: "JSON",
                data: function(d) {

                },
                error: function(xhr, status, error) {
                    // 1. Ambil response text dan parse ke JSON
                    let response = {};
                    try {
                        response = JSON.parse(xhr.responseText);
                    } catch (e) {
                        response = {
                            msg: 'Terjadi kesalahan sistem yang tidak terduga.'
                        };
                    }

                    // 2. Tampilkan pesan 'msg' dari JSON
                    Swal.fire({
                        icon: 'error',
                        title: 'Error !',
                        text: response.msg, // <--- Ini yang bakal nampilin isi pesan lu
                        showConfirmButton: false,
                        timer: 3000
                    });
                }
            },
            language: {
                loadingRecords: 'Please wait - Loading ...'
            },
            stateSave: false,
            autoWidth: true,
            columns: [{
                    data: 'no'
                },
                {
                    data: 'id_quotation'
                },
                {
                    data: 'date'
                },
                {
                    data: 'pic_penawaran'
                },
                {
                    data: 'penawaran'
                },
                {
                    data: 'customer'
                },
                {
                    data: 'grand_total'
                },
                {
                    data: 'status_quot'
                },
                {
                    data: 'action'
                }
            ],
            responsive: true,
            processing: false,
            serverSide: true,
            destroy: true,
            paging: true
        });
    }
</script>
<script src="<?= base_url('assets/js/basic.js') ?>"></script>