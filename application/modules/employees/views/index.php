<?php
defined('BASEPATH') OR exit('No direct script access allowed');
// Modul view-only: hanya menampilkan data, tanpa Add / Edit / Delete.
?>
<link rel="stylesheet" href="<?= base_url('assets/plugins/datatables/dataTables.bootstrap.css') ?>">
<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title"><i class="fa fa-users"></i> <?= isset($title) ? esc($title) : 'Employees'; ?></h3>
		<div class="box-tools pull-right">
			<span class="label label-info" title="Modul ini hanya untuk melihat data"><i class="fa fa-eye"></i> View Only</span>
		</div>
	</div>
	<!-- /.box-header -->
	<div class="box-body">
		<div class="table-responsive">
			<table id="example1" class="table table-bordered table-striped table-hover" width="100%">
				<thead>
					<tr>
						<th class="text-center" width="40">No</th>
						<th class="text-center">Id</th>
						<th class="text-center">NIK</th>
						<th class="text-center">Name</th>
						<th class="text-center">Hometown</th>
						<th class="text-center">Birthday</th>
						<th class="text-center">Gender</th>
						<th class="text-center">Religion</th>
						<th class="text-center">Nationality</th>
						<th class="text-center">Employee Status</th>
						<th class="text-center">Status Aktif</th>
						<th class="text-center" width="70">Option</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<p class="text-muted" style="margin-top:10px;"><i class="fa fa-info-circle"></i> Modul Employees hanya untuk melihat data. Penambahan, perubahan, dan penghapusan data tidak tersedia.</p>
	</div>
	<!-- /.box-body -->
</div>
<!-- /.box -->
<script src="<?= base_url('assets/plugins/datatables/jquery.dataTables.min.js') ?>"></script>
<script src="<?= base_url('assets/plugins/datatables/dataTables.bootstrap.min.js') ?>"></script>
<script>
	$(document).ready(function() {
		DataTables();
	});

	function DataTables() {
		$('#example1').DataTable({
			ajax: {
				url: siteurl + active_controller + 'get_data_employees',
				type: 'POST',
				dataType: 'JSON'
			},
			columns: [
				{ data: 'no', orderable: false, searchable: false, className: 'text-center' },
				{ data: 'id' },
				{ data: 'nik' },
				{ data: 'name' },
				{ data: 'hometown' },
				{ data: 'birthday', className: 'text-center' },
				{ data: 'gender', className: 'text-center' },
				{ data: 'religion', className: 'text-center' },
				{ data: 'nationality', className: 'text-center' },
				{
					data: 'employee_status',
					className: 'text-center',
					render: function(data, type, row) {
						if (type !== 'display') {
							return data;
						}
						var label = 'default';
						if (data === 'Tetap') {
							label = 'success';
						} else if (data && data.indexOf('Kontrak') !== -1) {
							label = 'primary';
						} else {
							label = 'default';
						}
						return '<span class="label label-' + label + '">' + $('<div/>').text(data).html() + '</span>';
					}
				},
				{
					data: 'status_aktif',
					className: 'text-center',
					render: function(data, type, row) {
						if (type !== 'display') {
							return data;
						}
						if (data === 'Y') {
							return '<span class="label label-success">Aktif</span>';
						}
						return '<span class="label label-danger">Non-Aktif</span>';
					}
				},
				{ data: 'option', orderable: false, searchable: false, className: 'text-center' }
			],
			responsive: true,
			processing: true,
			serverSide: true,
			stateSave: true,
			destroy: true,
			paging: true,
			searchDelay: 500,
			autoWidth: false,
			scrollX: true,
			order: [[1, 'asc']],
			pageLength: 10,
			lengthMenu: [[10, 25, 50, 100], [10, 25, 50, 100]],
			language: {
				emptyTable: 'Belum ada data employee.',
				search: 'Cari:',
				lengthMenu: 'Tampil _MENU_ data',
				info: 'Menampilkan _START_ - _END_ dari _TOTAL_ data',
				infoEmpty: 'Tidak ada data',
				processing: 'Memuat data...',
				paginate: {
					first: 'Awal',
					last: 'Akhir',
					next: 'Lanjut',
					previous: 'Kembali'
				}
			}
		});
	}
</script>
