<?php
$ENABLE_ADD     = has_permission('Expense_Report_Project.Add');
$ENABLE_MANAGE  = has_permission('Expense_Report_Project.Manage');
$ENABLE_VIEW    = has_permission('Expense_Report_Project.View');
$ENABLE_DELETE  = has_permission('Expense_Report_Project.Delete');

$pending_returns_count = count(array_filter($returns, function ($item) { return $item['return_status'] !== 'completed'; }));
$pending_reimburse_count = count(array_filter($reimbursements, function ($item) { return $item['monitoring_status'] !== 'Disetujui'; }));
?>
<link rel="stylesheet" href="https://cdn.datatables.net/2.1.7/css/dataTables.dataTables.min.css">
<link rel="stylesheet" href="<?= base_url('assets/css/expense_report_project.css') . '?v=' . filemtime(FCPATH . 'assets/css/expense_report_project.css') ?>">
<link rel="stylesheet" href="<?= base_url('assets/css/erp_mock.css') . '?v=' . filemtime(FCPATH . 'assets/css/erp_mock.css') ?>">

<div id="alert_edit" class="alert alert-success alert-dismissable" style="padding: 15px; display: none;"></div>

<div class="mk">
<div class="card">

<ul class="nav tabs erp-nav-tabs" role="tablist">
    <li class="active" role="presentation">
        <a id="expense-reports-tab" href="#expense-reports" data-toggle="tab" role="tab" aria-controls="expense-reports" aria-selected="true">
            <i class="fa fa-list"></i> Laporan Expense
        </a>
    </li>
    <li role="presentation">
        <a id="expense-returns-tab" href="#expense-returns" data-toggle="tab" role="tab" aria-controls="expense-returns" aria-selected="false" tabindex="-1">
            <i class="fa fa-undo"></i> Pengembalian Kasbon
            <?php if ($pending_returns_count > 0): ?><span class="cnt pu" aria-label="<?= $pending_returns_count ?> pengembalian belum selesai"><?= $pending_returns_count ?></span><?php endif; ?>
        </a>
    </li>
    <li role="presentation">
        <a id="expense-reimbursements-tab" href="#expense-reimbursements" data-toggle="tab" role="tab" aria-controls="expense-reimbursements" aria-selected="false" tabindex="-1">
            <i class="fa fa-money"></i> Lebih Expense (Reimburse ke Konsultan)
            <?php if ($pending_reimburse_count > 0): ?><span class="cnt gr" aria-label="<?= $pending_reimburse_count ?> reimburse belum disetujui"><?= $pending_reimburse_count ?></span><?php endif; ?>
        </a>
    </li>
</ul>

<div class="tab-content">
    <div class="tab-pane active" id="expense-reports" role="tabpanel" aria-labelledby="expense-reports-tab">
        <div class="card-h">
            <span><i class="fa fa-money"></i> Daftar Laporan &amp; Pertanggungjawaban Expense Project</span>
            <?php if ($ENABLE_ADD): ?>
            <a href="<?= base_url('expense_report_project/pick_spk') ?>" class="mkb b-green"><i class="fa fa-plus"></i> Tambah Expense Report</a>
            <?php endif; ?>
        </div>
        <div class="tw">
            <table id="table_expense" class="dt" style="width: 100%;">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>No Expense</th>
                        <th>Tanggal</th>
                        <th>Nomor SPK</th>
                        <th>No Kasbon</th>
                        <th>Nama Pemohon</th>
                        <th style="text-align: right;">Total Realisasi</th>
                        <th>Approval</th>
                        <th>Approval Date</th>
                        <th>Keterangan</th>
                        <th>Status</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
            </table>
        </div>
        <p id="expense-table-feedback" role="status" aria-live="polite" class="erp-feedback"></p>
        <button id="expense-table-retry" type="button" class="mkb b-out" hidden>Muat ulang daftar laporan</button>
        <div id="form-data"></div>
    </div>
    <div class="tab-pane" id="expense-returns" role="tabpanel" aria-labelledby="expense-returns-tab"><?php $finance = false; include __DIR__ . '/return_list.php'; ?></div>
    <div class="tab-pane" id="expense-reimbursements" role="tabpanel" aria-labelledby="expense-reimbursements-tab"><?php include __DIR__ . '/reimbursements.php'; ?></div>
</div>
</div>
</div>

<script src="https://cdn.datatables.net/2.1.7/js/dataTables.min.js"></script>
<script src="<?= base_url('assets/js/expense_report_project_ui.js') . '?v=' . filemtime(FCPATH . 'assets/js/expense_report_project_ui.js') ?>"></script>

<script type="text/javascript">
    $(document).ready(function() {
        DataTables();
    });
    $('#expense-table-retry').on('click', function () { DataTables(); });

    function DataTables() {
        $('#expense-table-feedback').removeAttr('data-kind').text('Memuat daftar laporan...');
        $('#expense-table-retry').prop('hidden', true);
        $('#table_expense').dataTable({
            ajax: {
                url: siteurl + active_controller + 'get_data_expense',
                type: "POST",
                dataType: "JSON",
                dataSrc: function (response) {
                    $('#expense-table-feedback').text('');
                    return response.data;
                },
                error: function () {
                    $('#expense-table-feedback').attr('data-kind', 'error').text('Daftar laporan gagal dimuat. Periksa koneksi lalu muat ulang.');
                    $('#expense-table-retry').prop('hidden', false);
                    $('#table_expense_processing').hide();
                }
            },
            columns: [
                { data: 'no', className: 'text-center', orderable: false },
                { data: 'no_expense', orderable: false },
                { data: 'tanggal', orderable: false },
                { data: 'spk', orderable: false },
                { data: 'no_kasbon', orderable: false },
                { data: 'pemohon', orderable: false },
                { data: 'total', className: 'text-right', orderable: false },
                { data: 'approval', orderable: false },
                { data: 'approval_date', orderable: false },
                { data: 'keterangan', orderable: false },
                { data: 'status', orderable: false },
                { data: 'aksi', className: 'text-center', orderable: false, searchable: false }
            ],
            order: [],
            language: {
                search: 'Cari laporan:', searchPlaceholder: 'No expense, no kasbon, SPK, atau pemohon',
                lengthMenu: 'Tampilkan _MENU_ laporan', info: '_START_–_END_ dari _TOTAL_ laporan',
                infoEmpty: 'Belum ada laporan expense', infoFiltered: '(dari _MAX_ laporan)',
                emptyTable: 'Belum ada laporan expense. Klik Tambah Expense Report untuk membuat laporan.',
                zeroRecords: 'Tidak ada laporan yang cocok. Ubah kata pencarian.',
                processing: 'Memuat daftar laporan...', loadingRecords: 'Memuat daftar laporan...',
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
