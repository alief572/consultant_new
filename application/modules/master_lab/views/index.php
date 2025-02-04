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
            <form action="" id="form-data">
                <div class="modal-body" id="MyModalBody">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">
                        <span class="glyphicon glyphicon-remove"></span> Cancel
                    </button>
                    <button type="submit" class="btn btn-sm btn-primary">
                        <i class="fa fa-save"></i> Save
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- DataTables -->
<!-- <script src="<?= base_url('assets/plugins/datatables/jquery.dataTables.min.js') ?>"></script>
<script src="<?= base_url('assets/plugins/datatables/dataTables.bootstrap.min.js') ?>"></script> -->

<script src="https://cdn.datatables.net/2.1.7/js/dataTables.min.js"></script>
<!-- page script -->
<script type="text/javascript">
    $(document).ready(function() {
        DataTables();
    });

    $(document).on('click', '.add_data', function() {
        $.ajax({
            type: 'post',
            url: siteurl + active_controller + 'add_data',
            cache: false,
            success: function(result) {

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
                    data: 'peraturan_undang'
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