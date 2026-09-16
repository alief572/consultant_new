<?php
defined('BASEPATH') OR exit('No direct script access allowed');
// Modul view-only: hanya menampilkan data, tanpa Add / Edit / Delete.
?>
<link rel="stylesheet" href="<?= base_url('assets/plugins/datatables/dataTables.bootstrap.css') ?>">
<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title"><i class="fa fa-sitemap"></i> <?= isset($title) ? esc($title) : 'Divisions'; ?></h3>
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
						<th class="text-center" width="50">No</th>
						<th class="text-center">Id</th>
						<th class="text-center">Name</th>
						<th class="text-center">Company</th>
						<th class="text-center" width="80">Option</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<p class="text-muted" style="margin-top:10px;"><i class="fa fa-info-circle"></i> Modul Divisions hanya untuk melihat data. Penambahan, perubahan, dan penghapusan data tidak tersedia.</p>
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
				url: siteurl + active_controller + 'get_data_divisions',
				type: 'POST',
				dataType: 'JSON'
			},
			columns: [
				{ data: 'no', orderable: false, searchable: false, className: 'text-center' },
				{ data: 'id', className: 'text-center' },
				{ data: 'name' },
				{ data: 'company_name' },
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
			order: [[1, 'asc']],
			pageLength: 10,
			lengthMenu: [[10, 25, 50, 100], [10, 25, 50, 100]],
			language: {
				emptyTable: 'Belum ada data division.',
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
