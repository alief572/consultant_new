<?php
defined('BASEPATH') OR exit('No direct script access allowed');
// Halaman detail read-only. Variabel: $employee (object).
if (!isset($employee) || empty($employee)) {
	echo '<div class="alert alert-warning">Data employee tidak ditemukan.</div>';
	echo '<a href="' . base_url('master_employee') . '" class="btn btn-danger"><i class="fa fa-arrow-left"></i> Kembali</a>';
	return;
}

function _emp_display($val) {
	$val = trim((string) $val);
	return ($val === '' || $val === '0' || $val === '0000-00-00') ? '-' : $val;
}

function _emp_date($val) {
	$val = trim((string) $val);
	if ($val === '' || $val === '0' || $val === '0000-00-00' || $val === '0000-00-00 00:00:00') {
		return '-';
	}
	$ts = strtotime($val);
	return $ts ? date('d M Y', $ts) : '-';
}

$nm = _emp_display(isset($employee->nm_karyawan) ? ucwords(strtolower($employee->nm_karyawan)) : '-');
$nik = _emp_display(isset($employee->nik) ? $employee->nik : '-');
$emp_code = _emp_display(isset($employee->employee_code) ? $employee->employee_code : '-');
$dept = _emp_display(isset($employee->department_name) && $employee->department_name !== '' ? ucwords(strtolower($employee->department_name)) : (isset($employee->department) ? $employee->department : '-'));

$is_active = (isset($employee->status) && $employee->status === 'Y');
$status_text = $is_active ? 'Active' : 'Non-Active';
$status_class = $is_active ? 'success' : 'danger';

$sts_karyawan = _emp_display(isset($employee->sts_karyawan) ? $employee->sts_karyawan : '-');

$gender_text = '-';
if (isset($employee->gender)) {
	if ($employee->gender === 'L') {
		$gender_text = 'Laki-Laki';
	} elseif ($employee->gender === 'P') {
		$gender_text = 'Perempuan';
	} elseif (trim((string) $employee->gender) !== '' && $employee->gender !== '0') {
		$gender_text = (string) $employee->gender;
	}
}

// Inisial untuk avatar
$initials = '-';
$parts = preg_split('/\s+/', trim((string) $nm));
if ($nm !== '-' && !empty($parts)) {
	$initials = strtoupper(substr($parts[0], 0, 1) . (isset($parts[1]) ? substr($parts[1], 0, 1) : ''));
}

$tanda_tangan = isset($employee->tanda_tangan) ? trim((string) $employee->tanda_tangan) : '';
$tanda_url = $tanda_tangan !== '' ? get_root3LinkLive() . $tanda_tangan : '';
?>

<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title"><i class="fa fa-user"></i> Detail Employee</h3>
		<div class="box-tools pull-right">
			<span class="label label-<?= $status_class; ?>"><?= esc($status_text); ?></span>
			<span class="label label-info" title="Modul ini hanya untuk melihat data"><i class="fa fa-eye"></i> View Only</span>
		</div>
	</div>
	<div class="box-body">
		<div class="row" style="margin-bottom:20px;">
			<div class="col-sm-2 text-center">
				<div style="width:90px;height:90px;border-radius:50%;background:#3c8dbc;color:#fff;font-size:32px;font-weight:bold;display:inline-flex;align-items:center;justify-content:center;" title="<?= esc($nm); ?>">
					<?= esc($initials); ?>
				</div>
			</div>
			<div class="col-sm-10">
				<h3 style="margin-top:0;margin-bottom:5px;"><?= esc($nm); ?></h3>
				<p class="text-muted" style="margin-bottom:10px;">
					NIK: <strong><?= esc($nik); ?></strong>
					&nbsp;|&nbsp; Employee Code: <strong><?= esc($emp_code); ?></strong>
					&nbsp;|&nbsp; Department: <strong><?= esc($dept); ?></strong>
				</p>
				<p style="margin-bottom:0;">
					<span class="label label-<?= $status_class; ?>"><?= esc($status_text); ?></span>
					<span class="label label-default"><?= esc($sts_karyawan); ?></span>
				</p>
			</div>
		</div>

		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Personal</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-sm-6">
						<table class="table table-striped">
							<tr><th width="160">Employee Name</th><td><?= esc($nm); ?></td></tr>
							<tr><th>ID Number (KTP)</th><td><?= esc(_emp_display(isset($employee->no_ktp) ? $employee->no_ktp : '')); ?></td></tr>
							<tr><th>Place of Birth</th><td><?= esc(_emp_display(isset($employee->tmp_lahir) ? ucwords(strtolower($employee->tmp_lahir)) : '')); ?></td></tr>
							<tr><th>Date of Birth</th><td><?= esc(_emp_date(isset($employee->tgl_lahir) ? $employee->tgl_lahir : '')); ?></td></tr>
							<tr><th>Gender</th><td><?= esc($gender_text); ?></td></tr>
						</table>
					</div>
					<div class="col-sm-6">
						<table class="table table-striped">
							<tr><th width="160">Religion</th><td><?= esc(_emp_display(isset($employee->agama) ? $employee->agama : '')); ?></td></tr>
							<tr><th>Last Education</th><td><?= esc(_emp_display(isset($employee->pendidikan) ? $employee->pendidikan : '')); ?></td></tr>
							<tr><th>Contact Number</th><td><?= esc(_emp_display(isset($employee->no_ponsel) ? $employee->no_ponsel : '')); ?></td></tr>
							<tr><th>Email</th><td><?= esc(_emp_display(isset($employee->email) ? strtolower($employee->email) : '')); ?></td></tr>
							<tr><th>Employee Code</th><td><?= esc($emp_code); ?></td></tr>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Address</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-sm-6">
						<table class="table table-striped">
							<tr><th width="160">ID Card Address</th><td><?= esc(_emp_display(isset($employee->ktp_alamat) ? $employee->ktp_alamat : '')); ?></td></tr>
							<tr><th>ID Card Postcode</th><td><?= esc(_emp_display(isset($employee->ktp_kode_pos) ? $employee->ktp_kode_pos : '')); ?></td></tr>
						</table>
					</div>
					<div class="col-sm-6">
						<table class="table table-striped">
							<tr><th width="160">Domicile Address</th><td><?= esc(_emp_display(isset($employee->domisili_alamat) ? $employee->domisili_alamat : '')); ?></td></tr>
							<tr><th>Domicile Postcode</th><td><?= esc(_emp_display(isset($employee->domisili_kode_pos) ? $employee->domisili_kode_pos : '')); ?></td></tr>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="box box-default">
			<div class="box-header with-border">
				<h3 class="box-title">Employment &amp; Others</h3>
			</div>
			<div class="box-body">
				<div class="row">
					<div class="col-sm-6">
						<table class="table table-striped">
							<tr><th width="160">Join Date</th><td><?= esc(_emp_date(isset($employee->tgl_join) ? $employee->tgl_join : '')); ?></td></tr>
							<tr><th>End Date</th><td><?= esc(_emp_date(isset($employee->tgl_end) ? $employee->tgl_end : '')); ?></td></tr>
							<tr><th>Employee Status</th><td><?= esc($sts_karyawan); ?></td></tr>
							<tr><th>Status Aktif</th><td><span class="label label-<?= $status_class; ?>"><?= esc($status_text); ?></span></td></tr>
						</table>
					</div>
					<div class="col-sm-6">
						<table class="table table-striped">
							<tr><th width="160">NPWP</th><td><?= esc(_emp_display(isset($employee->npwp) ? $employee->npwp : '')); ?></td></tr>
							<tr><th>BPJS</th><td><?= esc(_emp_display(isset($employee->bpjs) ? $employee->bpjs : '')); ?></td></tr>
							<tr><th>Account Number</th><td><?= esc(_emp_display(isset($employee->rek_number) ? $employee->rek_number : '')); ?></td></tr>
							<tr><th>Account Bank</th><td><?= esc(_emp_display(isset($employee->bank_account) ? $employee->bank_account : '')); ?></td></tr>
						</table>
					</div>
				</div>
				<div class="row" style="margin-top:10px;">
					<div class="col-sm-12">
						<strong>Tanda Tangan</strong><br>
						<?php if ($tanda_url !== '') : ?>
							<img src="<?= esc($tanda_url); ?>" alt="Tanda tangan" style="max-width:240px;max-height:120px;border:1px solid #ddd;padding:5px;margin:10px 0;">
							<br>
							<a href="<?= esc($tanda_url); ?>" target="_blank" rel="noopener" class="btn btn-success btn-sm"><i class="fa fa-download"></i> Lihat / Unduh</a>
						<?php else : ?>
							<p class="text-muted" style="margin-top:5px;">Belum diupload.</p>
						<?php endif; ?>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="box-footer">
		<a href="<?= base_url('master_employee'); ?>" class="btn btn-danger"><i class="fa fa-arrow-left"></i> Kembali</a>
	</div>
</div>
