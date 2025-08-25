<?php
$ENABLE_ADD     = has_permission('Master_Lab.Add');
$ENABLE_MANAGE  = has_permission('Master_Lab.Manage');
$ENABLE_VIEW    = has_permission('Master_Lab.View');
$ENABLE_DELETE  = has_permission('Master_Lab.Delete');
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
                <a class="btn btn-sm btn-success add_data" href="javascript:void(0);">
                    <i class="fa fa-plus"></i> New Data
                </a>
            </div>
        <?php endif; ?>
    </div>
    <!-- /.box-header -->
    <div class="box-body">
        <table id="table_lab" class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th align="center">No.</th>
                    <th align="center">Isu Lingkungan</th>
                    <th align="center">Pengaturan Perundang-undangan</th>
                    <th align="center">Waktu</th>
                    <th align="center">Harga SSC / Titik</th>
                    <th align="center">Harga Lab / Titik</th>
                    <th align="center">COA</th>
                    <th align="center">Action</th>
                </tr>
            </thead>

        </table>
    </div>
    <!-- /.box-body -->
</div>

<div class="modal" id="dialog-rekap" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <!-- <form action="" id="form-data"> -->
            <div class="modal-body" id="MyModalBody">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-sm btn-danger" data-dismiss="modal">
                    <span class="glyphicon glyphicon-remove"></span> Cancel
                </button>
                <button type="button" class="btn btn-sm btn-primary btn_save">
                    <i class="fa fa-save"></i> Save
                </button>
            </div>
            <!-- </form> -->
        </div>
    </div>
</div>

<!-- DataTables -->

<script src="https://cdn.datatables.net/2.1.7/js/dataTables.min.js"></script>
<script src="<?= base_url('assets/js/autoNumeric.js') ?>"></script>
<!-- page script -->
<script type="text/javascript">
    $(document).ready(function() {
        DataTables();

        $('.select2').select2({
            width: '100%'
        })
    });

    $(document).on('click', '.add_data', function() {
        $.ajax({
            type: 'post',
            url: siteurl + active_controller + 'add_data',
            cache: false,
            success: function(result) {
                $('.modal-title').html('Add Data Lab');
                $('#MyModalBody').html(result);
                $('#dialog-rekap').modal('show');
                $('.btn_save').show();

                auto_num();
            },
            error: function(result) {
                swal({
                    type: 'error',
                    title: 'Error !',
                    text: 'Please try again later !'
                });
            }
        });
    });

    $(document).on('click', '.view_lab', function() {
        var id = $(this).data('id');

        $.ajax({
            type: 'post',
            url: siteurl + active_controller + 'view_lab',
            data: {
                'id': id
            },
            cache: false,
            success: function(result) {
                $('.modal-title').html('View Data Lab');
                $('#MyModalBody').html(result);
                $('#dialog-rekap').modal('show');
                $('.btn_save').hide();
            },
            error: function(result) {
                swal({
                    type: 'error',
                    title: 'Error !',
                    text: 'Please try again later !'
                });
            }
        });
    });

    $(document).on('click', '.edit_lab', function() {
        var id = $(this).data('id');

        $.ajax({
            type: 'post',
            url: siteurl + active_controller + 'edit_lab',
            data: {
                'id': id
            },
            cache: false,
            success: function(result) {
                $('.modal-title').html('Edit Data Lab');
                $('#MyModalBody').html(result);
                $('#dialog-rekap').modal('show');
                $('.btn_save').show();
            },
            error: function(result) {
                swal({
                    type: 'error',
                    title: 'Error !',
                    text: 'Please try again later !'
                });
            }
        });
    });

    $(document).on('click', '.del_lab', function() {
        var id = $(this).data('id');

        swal({
            type: 'warning',
            title: 'Are you sure ?',
            text: 'This data will be deleted !',
            showCancelButton: true
        }, function(next) {
            if (next) {
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'del_lab',
                    data: {
                        'id': id
                    },
                    cache: false,
                    dataType: 'json',
                    success: function(result) {
                        if (result.status == 1) {
                            swal({
                                type: 'success',
                                title: 'Success !',
                                text: result.pesan,
                                allowOutsideClick: false
                            }, function(lanjut) {
                                $('#dialog-rekap').modal('hide');
                                DataTables();
                            });
                        } else {
                            swal({
                                type: 'warning',
                                title: 'Warning !',
                                text: result.pesan,
                                allowOutsideClick: false
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

    $(document).on('click', '.btn_save', function() {
        var isu_lingkungan = $('input[name="isu_lingkungan"]').val();
        var harga_ssc = get_num($('input[name="harga_ssc"]').val());
        var harga_lab = get_num($('input[name="harga_lab"]').val());
        var coa = $('select[name="coa"]').val();

        if (isu_lingkungan == '') {
            swal({
                type: 'warning',
                title: 'Warning !',
                text: 'Isu Lingkungan is empty !'
            });

            return false;
        }
        if (harga_ssc <= 0 || harga_lab <= 0) {
            swal({
                type: 'warning',
                title: 'Warning !',
                text: 'Harga SSC / Lab cannot zero !'
            });

            return false;
        }

        swal({
            type: 'warning',
            title: 'Are you sure ?',
            text: 'This data will be saved !',
            showCancelButton: true
        }, function(next) {
            if (next) {
                var formdata = $('#form-data').serialize();
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'save_lab',
                    data: formdata,
                    cache: false,
                    dataType: 'json',
                    success: function(result) {
                        if (result.status == 1) {
                            swal({
                                type: 'success',
                                title: 'Success !',
                                text: result.pesan,
                                allowOutsideClick: false
                            }, function(lanjut) {
                                $('#dialog-rekap').modal('hide');
                                DataTables();
                            });
                        } else {
                            swal({
                                type: 'warning',
                                title: 'Warning !',
                                text: result.pesan,
                                allowOutsideClick: false
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

    function get_num(nilai = null) {
        if (nilai !== '' && nilai !== null) {
            nilai = nilai.split(',').join('');
            nilai = parseFloat(nilai);
        } else {
            nilai = 0;
        }

        return nilai;
    }

    function auto_num() {
        $('.auto_num').autoNumeric();
    }


    function DataTables() {
        // var dataTables = $('#table_lab').dataTable();
        // dataTables.destroy();

        var dataTables = $('#table_lab').dataTable({
            ajax: {
                url: siteurl + active_controller + 'get_data_lab',
                type: "POST",
                dataType: "JSON",
                data: function(d) {

                }
            },
            columns: [{
                    data: 'no',
                }, {
                    data: 'isu_lingkungan'
                },
                {
                    data: 'peraturan'
                },
                {
                    data: 'waktu'
                },
                {
                    data: 'harga_ssc'
                },
                {
                    data: 'harga_lab'
                },
                {
                    data: 'coa'
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
</script>
<script src="<?= base_url('assets/js/basic.js') ?>"></script>