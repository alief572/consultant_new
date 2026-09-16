<?php
defined('BASEPATH') OR exit('No direct script access allowed');
// Modul view-only: tidak ada tombol Add / Edit / Delete.
$total = isset($result) ? count($result) : 0;
?>
<link rel="stylesheet" href="<?= base_url('assets/plugins/datatables/dataTables.bootstrap.css') ?>">

<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title"><i class="fa fa-users"></i> Employee List</h3>
		<div class="box-tools pull-right">
			<span class="label label-default">Total : <?= (int) $total ?></span>
			<span class="label label-info" title="Modul ini hanya untuk melihat data"><i class="fa fa-eye"></i> View Only</span>
		</div>
	</div>
	<!-- /.box-header -->
	<div class="box-body">
		<div class="table-responsive">
			<table id="example1" class="table table-bordered table-striped table-hover">
				<thead>
					<tr>
						<th class="text-center" width="40">#</th>
						<th class="text-left">Employee Name</th>
						<th class="text-left" width="110">Gender</th>
						<th class="text-left">Department</th>
						<th class="text-left" width="130">Telepon</th>
						<th class="text-left">Email</th>
						<th class="text-center" width="110">Status</th>
						<th class="text-center" width="70">Option</th>
					</tr>
				</thead>
				<tbody>
					<?php if (!empty($result)) : ?>
						<?php $numb = 0; ?>
						<?php foreach ($result as $record) : $numb++; ?>
							<?php
							$is_active = (isset($record->status) && $record->status === 'Y');
							$status_text = $is_active ? 'Active' : 'Non-Active';
							$status_class = $is_active ? 'success' : 'danger';

							$gender_text = '-';
							if (isset($record->gender)) {
								if ($record->gender === 'L') {
									$gender_text = 'Laki-Laki';
								} elseif ($record->gender === 'P') {
									$gender_text = 'Perempuan';
								} elseif ($record->gender !== '' && $record->gender !== '0') {
									$gender_text = $record->gender;
								}
							}

							// department_name sudah di-JOIN dari model, fallback ke get_name untuk data lama.
							$dept_name = '';
							if (isset($record->department_name) && $record->department_name !== '') {
								$dept_name = $record->department_name;
							} elseif (!empty($record->department)) {
								$dept_name = get_name('ms_department', 'nama', 'id', $record->department);
							}

							$emp_name = trim((string) (isset($record->nm_karyawan) ? $record->nm_karyawan : ''));
							$emp_name = $emp_name !== '' ? ucwords(strtolower($emp_name)) : '-';
							$phone = !empty($record->no_ponsel) ? strtoupper($record->no_ponsel) : '-';
							$email = !empty($record->email) ? strtolower($record->email) : '-';
							?>
							<tr>
								<td class="text-center"><?= $numb; ?></td>
								<td><?= esc($emp_name) ?></td>
								<td><?= esc($gender_text) ?></td>
								<td><?= $dept_name !== '' ? esc(ucwords(strtolower($dept_name))) : '<span class="text-muted">-</span>' ?></td>
								<td><?= esc($phone) ?></td>
								<td><?= esc($email) ?></td>
								<td class="text-center"><span class="label label-<?= $status_class; ?>"><?= $status_text; ?></span></td>
								<td class="text-center">
									<a href="<?= base_url('master_employee/detail/' . (int) $record->id); ?>" class="btn btn-warning btn-sm" title="Lihat Detail"><i class="fa fa-eye"></i></a>
								</td>
							</tr>
						<?php endforeach; ?>
					<?php endif; ?>
				</tbody>
			</table>
		</div>
		<p class="text-muted" style="margin-top:10px;"><i class="fa fa-info-circle"></i> Modul Employees hanya untuk melihat data. Penambahan, perubahan, dan penghapusan data tidak tersedia.</p>
	</div>
	<!-- /.box-body -->
</div>

<script src="<?= base_url('assets/plugins/datatables/jquery.dataTables.min.js') ?>"></script>
<script src="<?= base_url('assets/plugins/datatables/dataTables.bootstrap.min.js') ?>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#example1').DataTable({
			autoWidth: false,
			responsive: true,
			pageLength: 25,
			order: [[1, 'asc']],
			columnDefs: [
				{ orderable: false, searchable: false, targets: [0, 7] },
				{ className: 'text-center', targets: [0, 6, 7] }
			],
			language: {
				emptyTable: 'Belum ada data employee.',
				search: 'Cari:',
				lengthMenu: 'Tampil _MENU_ data',
				info: 'Menampilkan _START_ - _END_ dari _TOTAL_ data',
				infoEmpty: 'Tidak ada data',
				paginate: {
					first: 'Awal',
					last: 'Akhir',
					next: 'Lanjut',
					previous: 'Kembali'
				}
			}
		});
	});
</script>
