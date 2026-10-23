<?php
$ENABLE_ADD     = has_permission('Expense_Report_Project.Add');
$ENABLE_MANAGE  = has_permission('Expense_Report_Project.Manage');
$ENABLE_VIEW    = has_permission('Expense_Report_Project.View');
$ENABLE_DELETE  = has_permission('Expense_Report_Project.Delete');
?>

<link rel="stylesheet" href="https://cdn.datatables.net/2.1.7/css/dataTables.dataTables.min.css">
<link rel="stylesheet" href="<?= base_url('assets/css/expense_report_project.css') ?>">

<!-- SPK & Project Information Card (Read-Only) -->
<div class="erp-card">
    <div class="erp-card-header">
        <h4 class="erp-card-title">
            <i class="fa fa-briefcase"></i> View SPK Kasbon Proyek: <span class="text-primary"><?= $list_budgeting->id_spk_penawaran ?></span>
        </h4>
        <div>
            <a href="<?= base_url('expense_report_project') ?>" class="erp-btn erp-btn-sm erp-btn-default">
                <i class="fa fa-arrow-left"></i> Kembali ke Daftar SPK
            </a>
        </div>
    </div>
    <div class="erp-card-body">
        <div class="erp-meta-grid">
            <div class="erp-meta-item">
                <span class="erp-meta-label">Nomor SPK</span>
                <span class="erp-meta-value highlight"><i class="fa fa-file-text-o"></i> <?= $list_budgeting->id_spk_penawaran ?></span>
            </div>
            <div class="erp-meta-item">
                <span class="erp-meta-label">Project Leader</span>
                <span class="erp-meta-value"><i class="fa fa-user"></i> <?= ucfirst($list_budgeting->nm_project_leader) ?></span>
            </div>
            <div class="erp-meta-item">
                <span class="erp-meta-label">Customer</span>
                <span class="erp-meta-value"><i class="fa fa-building"></i> <?= $list_budgeting->nm_customer ?></span>
            </div>
            <div class="erp-meta-item">
                <span class="erp-meta-label">Sales Representative</span>
                <span class="erp-meta-value"><?= ucfirst($list_budgeting->nm_sales) ?></span>
            </div>
            <div class="erp-meta-item">
                <span class="erp-meta-label">Nama Proyek / Paket</span>
                <span class="erp-meta-value"><?= !empty($list_budgeting->nm_project) ? $list_budgeting->nm_project : $list_budgeting->nama_project ?></span>
            </div>
            <div class="erp-meta-item">
                <span class="erp-meta-label">Waktu Pelaksanaan</span>
                <span class="erp-meta-value">
                    <span class="erp-period-pill">
                        <i class="fa fa-calendar"></i> <?= $list_budgeting->waktu_from ?> &nbsp;&mdash;&nbsp; <?= $list_budgeting->waktu_to ?>
                    </span>
                </span>
            </div>
            <div class="erp-meta-item" style="grid-column: 1 / -1;">
                <span class="erp-meta-label">Alamat Proyek</span>
                <span class="erp-meta-value"><?= $list_budgeting->alamat ?></span>
            </div>
        </div>
    </div>
</div>

<!-- Category 1: Akomodasi -->
<div class="erp-card">
    <div class="erp-card-header">
        <div class="erp-category-header">
            <h4 class="erp-card-title">
                <i class="fa fa-bed"></i> Akomodasi
            </h4>
            <div class="erp-category-metrics">
                <div class="erp-metric-badge">
                    <span class="metric-label">Budget</span>
                    <span class="metric-value">Rp <?= number_format($budget_akomodasi) ?></span>
                </div>
                <div class="erp-metric-badge highlight">
                    <span class="metric-label">On Process</span>
                    <span class="metric-value budget_akomodasi_on_process">Rp <?= number_format($nilai_kasbon_on_proses_akomodasi) ?></span>
                </div>
            </div>
        </div>
    </div>
    <div class="erp-card-body" style="padding: 14px;">
        <div class="table-responsive">
            <table class="table table-bordered table-striped erp-table" id="table_kasbon_akomodasi" style="width: 100%;">
                <thead>
                    <tr>
                        <th class="text-center" width="40">No</th>
                        <th width="160">Req. Number</th>
                        <th>Description</th>
                        <th width="120" class="text-center">Date</th>
                        <th width="140" class="text-right">Total (Rp)</th>
                        <th width="120" class="text-center">Status</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>

<!-- Category 2: Others -->
<div class="erp-card">
    <div class="erp-card-header">
        <div class="erp-category-header">
            <h4 class="erp-card-title">
                <i class="fa fa-cubes"></i> Others
            </h4>
            <div class="erp-category-metrics">
                <div class="erp-metric-badge">
                    <span class="metric-label">Budget</span>
                    <span class="metric-value">Rp <?= number_format($budget_others) ?></span>
                </div>
                <div class="erp-metric-badge highlight">
                    <span class="metric-label">On Process</span>
                    <span class="metric-value budget_others_on_process">Rp <?= number_format($nilai_kasbon_on_proses_others) ?></span>
                </div>
            </div>
        </div>
    </div>
    <div class="erp-card-body" style="padding: 14px;">
        <div class="table-responsive">
            <table class="table table-bordered table-striped erp-table" id="table_kasbon_others" style="width: 100%;">
                <thead>
                    <tr>
                        <th class="text-center" width="40">No</th>
                        <th width="160">Req. Number</th>
                        <th>Description</th>
                        <th width="120" class="text-center">Date</th>
                        <th width="140" class="text-right">Total (Rp)</th>
                        <th width="120" class="text-center">Status</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>

<!-- Category 3: Lab -->
<div class="erp-card">
    <div class="erp-card-header">
        <div class="erp-category-header">
            <h4 class="erp-card-title">
                <i class="fa fa-flask"></i> Lab
            </h4>
            <div class="erp-category-metrics">
                <div class="erp-metric-badge">
                    <span class="metric-label">Budget</span>
                    <span class="metric-value">Rp <?= number_format($budget_lab) ?></span>
                </div>
                <div class="erp-metric-badge highlight">
                    <span class="metric-label">On Process</span>
                    <span class="metric-value budget_lab_on_process">Rp <?= number_format($nilai_kasbon_on_proses_lab) ?></span>
                </div>
            </div>
        </div>
    </div>
    <div class="erp-card-body" style="padding: 14px;">
        <div class="table-responsive">
            <table class="table table-bordered table-striped erp-table" id="table_kasbon_lab" style="width: 100%;">
                <thead>
                    <tr>
                        <th class="text-center" width="40">No</th>
                        <th width="160">Req. Number</th>
                        <th>Description</th>
                        <th width="120" class="text-center">Date</th>
                        <th width="140" class="text-right">Total (Rp)</th>
                        <th width="120" class="text-center">Status</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>

<!-- Category 4: Subcont Tenaga Ahli -->
<div class="erp-card">
    <div class="erp-card-header">
        <div class="erp-category-header">
            <h4 class="erp-card-title">
                <i class="fa fa-user-circle-o"></i> Subcont Tenaga Ahli
            </h4>
            <div class="erp-category-metrics">
                <div class="erp-metric-badge">
                    <span class="metric-label">Budget</span>
                    <span class="metric-value">Rp <?= number_format($budget_subcont_tenaga_ahli) ?></span>
                </div>
                <div class="erp-metric-badge highlight">
                    <span class="metric-label">On Process</span>
                    <span class="metric-value budget_subcont_tenaga_ahli_on_process">Rp <?= number_format($nilai_kasbon_on_proses_subcont_tenaga_ahli) ?></span>
                </div>
            </div>
        </div>
    </div>
    <div class="erp-card-body" style="padding: 14px;">
        <div class="table-responsive">
            <table class="table table-bordered table-striped erp-table" id="table_kasbon_subcont_tenaga_ahli" style="width: 100%;">
                <thead>
                    <tr>
                        <th class="text-center" width="40">No</th>
                        <th width="160">Req. Number</th>
                        <th>Description</th>
                        <th width="120" class="text-center">Date</th>
                        <th width="140" class="text-right">Total (Rp)</th>
                        <th width="120" class="text-center">Status</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>

<!-- Category 5: Subcont Perusahaan -->
<div class="erp-card">
    <div class="erp-card-header">
        <div class="erp-category-header">
            <h4 class="erp-card-title">
                <i class="fa fa-building-o"></i> Subcont Perusahaan
            </h4>
            <div class="erp-category-metrics">
                <div class="erp-metric-badge">
                    <span class="metric-label">Budget</span>
                    <span class="metric-value">Rp <?= number_format($budget_subcont_perusahaan) ?></span>
                </div>
                <div class="erp-metric-badge highlight">
                    <span class="metric-label">On Process</span>
                    <span class="metric-value budget_subcont_perusahaan_on_process">Rp <?= number_format($nilai_kasbon_on_proses_subcont_perusahaan) ?></span>
                </div>
            </div>
        </div>
    </div>
    <div class="erp-card-body" style="padding: 14px;">
        <div class="table-responsive">
            <table class="table table-bordered table-striped erp-table" id="table_kasbon_subcont_perusahaan" style="width: 100%;">
                <thead>
                    <tr>
                        <th class="text-center" width="40">No</th>
                        <th width="160">Req. Number</th>
                        <th>Description</th>
                        <th width="120" class="text-center">Date</th>
                        <th width="140" class="text-right">Total (Rp)</th>
                        <th width="120" class="text-center">Status</th>
                    </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
</div>

<div style="margin-bottom: 30px;">
    <a href="<?= base_url('expense_report_project') ?>" class="erp-btn erp-btn-default">
        <i class="fa fa-arrow-left"></i> Kembali ke Daftar SPK
    </a>
</div>

<script src="<?= base_url('assets/js/autoNumeric.js'); ?>"></script>
<script src="https://cdn.datatables.net/2.1.8/js/dataTables.min.js"></script>

<script>
    $(document).ready(function() {
        DataTables_kasbon_akomodasi(1);
        DataTables_kasbon_others(1);
        DataTables_kasbon_lab(1);
        DataTables_kasbon_subcont_tenaga_ahli(1);
        DataTables_kasbon_subcont_perusahaan(1);
        DataTables_ovb_akomodasi(1);
    });

    function DataTables_kasbon_akomodasi(view = null) {
        var dataTables_kasbon_akomodasi = $('#table_kasbon_akomodasi').DataTable();
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
                    data: 'no',
                    className: 'text-center'
                },
                {
                    data: 'req_number'
                },
                {
                    data: 'nm_biaya'
                },
                {
                    data: 'date',
                    className: 'text-center'
                },
                {
                    data: 'total',
                    className: 'text-right'
                },
                {
                    data: 'status',
                    className: 'text-center'
                }
            ]
        });
    }

    function DataTables_kasbon_others(view = null) {
        var dataTables_kasbon_others = $('#table_kasbon_others').DataTable();
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
                    data: 'no',
                    className: 'text-center'
                },
                {
                    data: 'req_number'
                },
                {
                    data: 'nm_biaya'
                },
                {
                    data: 'date',
                    className: 'text-center'
                },
                {
                    data: 'total',
                    className: 'text-right'
                },
                {
                    data: 'status',
                    className: 'text-center'
                }
            ]
        });
    }

    function DataTables_kasbon_lab(view = null) {
        var dataTables_kasbon_lab = $('#table_kasbon_lab').DataTable();
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
                    data: 'no',
                    className: 'text-center'
                },
                {
                    data: 'req_number'
                },
                {
                    data: 'nm_biaya'
                },
                {
                    data: 'date',
                    className: 'text-center'
                },
                {
                    data: 'total',
                    className: 'text-right'
                },
                {
                    data: 'status',
                    className: 'text-center'
                }
            ]
        });
    }

    function DataTables_kasbon_subcont_tenaga_ahli(view = null) {
        var dataTables_kasbon_subcont_tenaga_ahli = $('#table_kasbon_subcont_tenaga_ahli').DataTable();
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
                    data: 'no',
                    className: 'text-center'
                },
                {
                    data: 'req_number'
                },
                {
                    data: 'nm_biaya'
                },
                {
                    data: 'date',
                    className: 'text-center'
                },
                {
                    data: 'total',
                    className: 'text-right'
                },
                {
                    data: 'status',
                    className: 'text-center'
                }
            ]
        });
    }

    function DataTables_kasbon_subcont_perusahaan(view = null) {
        var dataTables_kasbon_subcont_perusahaan = $('#table_kasbon_subcont_perusahaan').DataTable();
        dataTables_kasbon_subcont_perusahaan.destroy();
        dataTables_kasbon_subcont_perusahaan = $('#table_kasbon_subcont_perusahaan').dataTable({
            processing: true,
            serverSide: true,
            ajax: {
                url: siteurl + active_controller + 'get_data_kasbon_subcont_perusahaan',
                type: "POST",
                dataType: "JSON",
                data: function(d) {
                    d.id_spk_budgeting = "<?= $list_budgeting->id_spk_budgeting ?>"
                    d.view = view
                }
            },
            columns: [{
                    data: 'no',
                    className: 'text-center'
                },
                {
                    data: 'req_number'
                },
                {
                    data: 'nm_biaya'
                },
                {
                    data: 'date',
                    className: 'text-center'
                },
                {
                    data: 'total',
                    className: 'text-right'
                },
                {
                    data: 'status',
                    className: 'text-center'
                }
            ]
        });
    }

    function DataTables_ovb_akomodasi(view = null) {
        var dataTables_ovb_akomodasi = $('#table_ovb_akomodasi').DataTable();
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
                    data: 'no',
                    className: 'text-center'
                },
                {
                    data: 'id_request_ovb'
                },
                {
                    data: 'amount',
                    className: 'text-right'
                }
            ]
        });
    }
</script>
<script src="<?= base_url('assets/js/expense_report_project_ui.js') ?>"></script>
