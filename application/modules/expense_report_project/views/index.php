<?php
$ENABLE_ADD     = has_permission('Expense_Report_Project.Add');
$ENABLE_MANAGE  = has_permission('Expense_Report_Project.Manage');
$ENABLE_VIEW    = has_permission('Expense_Report_Project.View');
$ENABLE_DELETE  = has_permission('Expense_Report_Project.Delete');

$pending_returns_count = count(array_filter($returns, function ($item) { return $item['return_status'] !== 'completed'; }));
$pending_reimburse_count = count(array_filter($reimbursements, function ($item) { return $item['monitoring_status'] !== 'Disetujui'; }));
?>
<link rel="stylesheet" href="https://cdn.datatables.net/2.1.7/css/dataTables.dataTables.min.css">
<link rel="stylesheet" href="<?= base_url('assets/css/expense_report_project.css') ?>">

<div id="alert_edit" class="alert alert-success alert-dismissable" style="padding: 15px; display: none;"></div>

<header class="erp-page-heading">
    <h2>Pertanggungjawaban biaya proyek</h2>
    <p>Pilih SPK untuk melaporkan realisasi. Pengembalian sisa kasbon dan progres reimburse tersedia di tab terpisah.</p>
</header>

<div class="erp-tabs-wrapper" style="margin-bottom: 15px;">
    <ul class="nav erp-nav-tabs" role="tablist">
        <li class="active" role="presentation">
            <a id="expense-reports-tab" href="#expense-reports" data-toggle="tab" role="tab" aria-controls="expense-reports" aria-selected="true">
                <i class="fa fa-file-text-o"></i> Laporan Expense
            </a>
        </li>
        <li role="presentation">
            <a id="expense-returns-tab" href="#expense-returns" data-toggle="tab" role="tab" aria-controls="expense-returns" aria-selected="false" tabindex="-1">
                <i class="fa fa-undo"></i> Pengembalian Kasbon
                <span class="erp-counter-pill" aria-label="<?= $pending_returns_count ?> pengembalian belum selesai"><?= $pending_returns_count ?></span>
            </a>
        </li>
        <li role="presentation">
            <a id="expense-reimbursements-tab" href="#expense-reimbursements" data-toggle="tab" role="tab" aria-controls="expense-reimbursements" aria-selected="false" tabindex="-1">
                <i class="fa fa-exchange"></i> Lebih Expense / Reimburse
                <span class="erp-counter-pill" aria-label="<?= $pending_reimburse_count ?> reimburse belum disetujui"><?= $pending_reimburse_count ?></span>
            </a>
        </li>
    </ul>
</div>

<div class="tab-content">
    <div class="tab-pane active" id="expense-reports" role="tabpanel" aria-labelledby="expense-reports-tab">
        <div class="erp-card">
            <div class="erp-card-header">
                <h4 class="erp-card-title">
                    Laporan berdasarkan SPK
                </h4>
            </div>
            <div class="erp-card-body">
                <div class="table-responsive">
                    <table id="table_penawaran" class="table erp-table" style="width: 100%;">
                        <thead>
                            <tr>
                                <th class="text-center" width="50">No</th>
                                <th>Nomor SPK</th>
                                <th>Customer</th>
                                <th>PIC Kasbon</th>
                                <th>Proyek / Paket</th>
                                <th class="text-center" width="120">Tindak lanjut</th>
                            </tr>
                        </thead>
                    </table>
                </div>
                <p id="expense-table-feedback" role="status" aria-live="polite" class="erp-feedback"></p>
                <button id="expense-table-retry" type="button" class="erp-btn erp-btn-default" hidden>Muat ulang daftar SPK</button>
            </div>
        </div>
        <div id="form-data"></div>
    </div>
    <div class="tab-pane" id="expense-returns" role="tabpanel" aria-labelledby="expense-returns-tab"><?php $finance = false; include __DIR__ . '/return_list.php'; ?></div>
    <div class="tab-pane" id="expense-reimbursements" role="tabpanel" aria-labelledby="expense-reimbursements-tab"><?php include __DIR__ . '/reimbursements.php'; ?></div>
</div>

<script src="https://cdn.datatables.net/2.1.7/js/dataTables.min.js"></script>
<script src="<?= base_url('assets/js/expense_report_project_ui.js') ?>"></script>

<script type="text/javascript">
    $(document).ready(function() {
        DataTables();
    });
    $('#expense-table-retry').on('click', function () { DataTables(); });

    $(document).on('click', '.del_spk_budget', function() {
        var id = $(this).data('id');

        Swal.fire({
            icon: 'warning',
            title: 'Are you sure ?',
            text: 'This data will be deleted !',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
        }).then((result) => {
            if (result.isConfirmed) {
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
                            }).then(() => {
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

    $(document).on('click', '.req_app', function(e) {
        e.preventDefault();

        var id_spk_budgeting = $(this).data('id_spk_budgeting');

        Swal.fire({
            icon: 'warning',
            title: 'Are you sure ?',
            text: 'This action cannot be undo !',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, proceed!'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: siteurl + active_controller + 'req_app',
                    data: {
                        'id_spk_budgeting': id_spk_budgeting
                    },
                    cache: false,
                    dataType: 'JSON',
                    success: function(result) {
                        if (result.status == 1) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Success !',
                                text: result.pesan
                            }).then(() => {
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
        $('#expense-table-feedback').removeAttr('data-kind').text('Memuat daftar SPK...');
        $('#expense-table-retry').prop('hidden', true);
        var dataTables = $('#table_penawaran').dataTable({
            ajax: {
                url: siteurl + active_controller + 'get_data_spk',
                type: "POST",
                dataType: "JSON",
                dataSrc: function (response) {
                    $('#expense-table-feedback').text('');
                    return response.data;
                },
                error: function () {
                    $('#expense-table-feedback').attr('data-kind', 'error').text('Daftar SPK gagal dimuat. Periksa koneksi lalu muat ulang.');
                    $('#expense-table-retry').prop('hidden', false);
                    $('#table_penawaran_processing').hide();
                }
            },
            columns: [{
                    data: 'no',
                }, {
                    data: 'id_spk_penawaran', render: $.fn.dataTable.render.text()
                },
                {
                    data: 'nm_customer', render: $.fn.dataTable.render.text()
                },
                {
                    data: 'pic_kasbon', render: $.fn.dataTable.render.text()
                },
                {
                    data: 'nm_project',
                    render: $.fn.dataTable.render.text()
                },
                {
                    data: 'option', orderable: false, searchable: false
                },
            ],
            language: {
                search: 'Cari SPK:', searchPlaceholder: 'Nomor SPK, customer, atau proyek',
                lengthMenu: 'Tampilkan _MENU_ laporan', info: '_START_–_END_ dari _TOTAL_ laporan',
                infoEmpty: 'Belum ada SPK untuk ditampilkan', infoFiltered: '(dari _MAX_ laporan)',
                emptyTable: 'Belum ada SPK dengan kasbon yang dapat dilaporkan.',
                zeroRecords: 'Tidak ada SPK yang cocok. Ubah kata pencarian.',
                processing: 'Memuat daftar SPK...', loadingRecords: 'Memuat daftar SPK...',
                paginate: {previous: 'Sebelumnya', next: 'Berikutnya'}
            },
            processing: true,
            serverSide: true,
            stateSave: true,
            destroy: true,
            paging: true,
            scrollX: true
        });
    }
</script>
<script src="<?= base_url('assets/js/basic.js') ?>"></script>
