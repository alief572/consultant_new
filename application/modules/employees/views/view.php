<?php
defined('BASEPATH') OR exit('No direct script access allowed');
// Halaman detail read-only. View-only: tanpa form edit, tanpa tombol Save / Add Family / Add Education.
if (!isset($row) || empty($row)) {
	echo '<div class="alert alert-warning">Data employee tidak ditemukan.</div>';
	echo '<a href="' . site_url('employees') . '" class="btn btn-danger"><i class="fa fa-arrow-left"></i> Kembali</a>';
	return;
}
$emp = $row[0];

if (!function_exists('_emp_disp')) {
	function _emp_disp($val) {
		$val = trim((string) $val);
		return ($val === '' || $val === '0' || $val === '0000-00-00') ? '-' : $val;
	}
}
if (!function_exists('_emp_date')) {
	function _emp_date($val) {
		$val = trim((string) $val);
		if ($val === '' || $val === '0' || $val === '0000-00-00' || $val === '0000-00-00 00:00:00') {
			return '-';
		}
		$ts = strtotime($val);
		return $ts ? date('d M Y', $ts) : '-';
	}
}
if (!function_exists('_emp_lookup')) {
	function _emp_lookup($map, $key) {
		if (is_array($map) && isset($map[$key]) && trim((string) $map[$key]) !== '') {
			return (string) $map[$key];
		}
		return _emp_disp($key);
	}
}

$religi_map = array('1' => 'Islam', '2' => 'Katolik', '3' => 'Kristen', '4' => 'Hindu', '5' => 'Budha', '6' => 'Kong Hu Chu');
$religi_text = isset($religi_map[$emp->relid]) ? $religi_map[$emp->relid] : _emp_disp(isset($emp->relid) ? $emp->relid : '');
$gender_text = ($emp->genderid === 'L') ? 'Laki-laki' : (($emp->genderid === 'P') ? 'Perempuan' : _emp_disp(isset($emp->genderid) ? $emp->genderid : ''));

$company_text = isset($data_companies) ? _emp_lookup($data_companies, isset($emp->company_id) ? $emp->company_id : '') : _emp_disp(isset($emp->company_id) ? $emp->company_id : '');
$division_text = isset($data_divisions) ? _emp_lookup($data_divisions, isset($emp->division_id) ? $emp->division_id : '') : _emp_disp(isset($emp->division_id) ? $emp->division_id : '');
$dept_text = isset($data_department) ? _emp_lookup($data_department, isset($emp->department_id) ? $emp->department_id : '') : _emp_disp(isset($emp->department_id) ? $emp->department_id : '');
$title_text = isset($data_title) ? _emp_lookup($data_title, isset($emp->title_id) ? $emp->title_id : '') : _emp_disp(isset($emp->title_id) ? $emp->title_id : '');
$position_text = isset($data_position) ? _emp_lookup($data_position, isset($emp->position_id) ? $emp->position_id : '') : _emp_disp(isset($emp->position_id) ? $emp->position_id : '');
$marital_text = isset($data_marital) ? _emp_lookup($data_marital, isset($emp->marital_status) ? $emp->marital_status : '') : _emp_disp(isset($emp->marital_status) ? $emp->marital_status : '');
$tax_marital_text = isset($data_marital) ? _emp_lookup($data_marital, isset($emp->tax_marital_status) ? $emp->tax_marital_status : '') : _emp_disp(isset($emp->tax_marital_status) ? $emp->tax_marital_status : '');
$finger_text = isset($data_idfinger) ? _emp_lookup($data_idfinger, isset($emp->finger_id) ? $emp->finger_id : '') : _emp_disp(isset($emp->finger_id) ? $emp->finger_id : '');
$divhead_text = isset($data_divisions_head) ? _emp_lookup($data_divisions_head, isset($emp->division_head) ? $emp->division_head : '') : _emp_disp(isset($emp->division_head) ? $emp->division_head : '');

$is_active = (isset($emp->flag_active) && $emp->flag_active === 'Y');
$status_text = $is_active ? 'Aktif' : 'Non-Aktif';
$status_class = $is_active ? 'success' : 'danger';

$emp_name = _emp_disp(isset($emp->name) ? $emp->name : '-');
$initials = '-';
$parts = preg_split('/\s+/', trim((string) $emp_name));
if ($emp_name !== '-' && !empty($parts)) {
	$initials = strtoupper(substr($parts[0], 0, 1) . (isset($parts[1]) ? substr($parts[1], 0, 1) : ''));
}
?>

<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title"><i class="fa fa-user"></i> <?= isset($title) ? esc($title) : 'Detail Employee'; ?></h3>
		<div class="box-tools pull-right">
			<span class="label label-<?= $status_class; ?>"><?= esc($status_text); ?></span>
			<span class="label label-info" title="Modul ini hanya untuk melihat data"><i class="fa fa-eye"></i> View Only</span>
		</div>
	</div>
	<div class="box-body">
		<div class="row" style="margin-bottom:20px;">
			<div class="col-sm-2 text-center">
				<div style="width:90px;height:90px;border-radius:50%;background:#3c8dbc;color:#fff;font-size:32px;font-weight:bold;display:inline-flex;align-items:center;justify-content:center;" title="<?= esc($emp_name); ?>">
					<?= esc($initials); ?>
				</div>
			</div>
			<div class="col-sm-10">
				<h3 style="margin-top:0;margin-bottom:5px;"><?= esc($emp_name); ?></h3>
				<p class="text-muted" style="margin-bottom:10px;">
					ID: <strong><?= esc(_emp_disp(isset($emp->id) ? $emp->id : '')); ?></strong>
					&nbsp;|&nbsp; NIK: <strong><?= esc(_emp_disp(isset($emp->nik) ? $emp->nik : '')); ?></strong>
					&nbsp;|&nbsp; Company: <strong><?= esc($company_text); ?></strong>
				</p>
				<p style="margin-bottom:0;">
					<span class="label label-<?= $status_class; ?>"><?= esc($status_text); ?></span>
					<span class="label label-default"><?= esc($position_text); ?></span>
					<span class="label label-default"><?= esc($dept_text); ?></span>
				</p>
			</div>
		</div>

		<div class="box box-default">
			<div class="box-header with-border"><h3 class="box-title">Personal</h3></div>
			<div class="box-body">
				<div class="row">
					<div class="col-sm-6">
						<table class="table table-striped">
							<tr><th width="170">Employee ID</th><td><?= esc(_emp_disp(isset($emp->id) ? $emp->id : '')); ?></td></tr>
							<tr><th>Employee Name</th><td><?= esc($emp_name); ?></td></tr>
							<tr><th>NIK</th><td><?= esc(_emp_disp(isset($emp->nik) ? $emp->nik : '')); ?></td></tr>
							<tr><th>Place of Birth</th><td><?= esc(_emp_disp(isset($emp->hometown) ? $emp->hometown : '')); ?></td></tr>
							<tr><th>Date of Birth</th><td><?= esc(_emp_date(isset($emp->birthday) ? $emp->birthday : '')); ?></td></tr>
							<tr><th>Gender</th><td><?= esc($gender_text); ?></td></tr>
							<tr><th>Religion</th><td><?= esc($religi_text); ?></td></tr>
							<tr><th>Nationality</th><td><?= esc(_emp_disp(isset($emp->nationality) ? $emp->nationality : '')); ?></td></tr>
						</table>
					</div>
					<div class="col-sm-6">
						<table class="table table-striped">
							<tr><th width="170">Company</th><td><?= esc($company_text); ?></td></tr>
							<tr><th>Division</th><td><?= esc($division_text); ?></td></tr>
							<tr><th>Department</th><td><?= esc($dept_text); ?></td></tr>
							<tr><th>Title</th><td><?= esc($title_text); ?></td></tr>
							<tr><th>Position</th><td><?= esc($position_text); ?></td></tr>
							<tr><th>Division Head</th><td><?= esc($divhead_text); ?></td></tr>
							<tr><th>Hire Date</th><td><?= esc(_emp_date(isset($emp->hiredate) ? $emp->hiredate : '')); ?></td></tr>
							<tr><th>Marital Status</th><td><?= esc($marital_text); ?></td></tr>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="box box-default">
			<div class="box-header with-border"><h3 class="box-title">Contact &amp; Address</h3></div>
			<div class="box-body">
				<div class="row">
					<div class="col-sm-6">
						<table class="table table-striped">
							<tr><th width="170">Email</th><td><?= esc(_emp_disp(isset($emp->email) ? $emp->email : '')); ?></td></tr>
							<tr><th>Handphone</th><td><?= esc(_emp_disp(isset($emp->hp) ? $emp->hp : '')); ?></td></tr>
							<tr><th>Phone</th><td><?= esc(_emp_disp(isset($emp->phone) ? $emp->phone : '')); ?></td></tr>
							<tr><th>Stay Address</th><td><?= esc(_emp_disp(isset($emp->address) ? $emp->address : '')); ?></td></tr>
							<tr><th>City</th><td><?= esc(_emp_disp(isset($emp->city) ? $emp->city : '')); ?></td></tr>
						</table>
					</div>
					<div class="col-sm-6">
						<table class="table table-striped">
							<tr><th width="170">Province</th><td><?= esc(_emp_disp(isset($emp->province) ? $emp->province : '')); ?></td></tr>
							<tr><th>Post Code</th><td><?= esc(_emp_disp(isset($emp->postcode) ? $emp->postcode : '')); ?></td></tr>
							<tr><th>ID Card Address</th><td><?= esc(_emp_disp(isset($emp->idcard_address) ? $emp->idcard_address : '')); ?></td></tr>
							<tr><th>KTP</th><td><?= esc(_emp_disp(isset($emp->licensid) ? $emp->licensid : '')); ?></td></tr>
							<tr><th>NPWP</th><td><?= esc(_emp_disp(isset($emp->taxid) ? $emp->taxid : '')); ?></td></tr>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="box box-default">
			<div class="box-header with-border"><h3 class="box-title">Employment &amp; Bank</h3></div>
			<div class="box-body">
				<div class="row">
					<div class="col-sm-6">
						<table class="table table-striped">
							<tr><th width="170">Bank</th><td><?= esc(_emp_disp(isset($emp->bank_id) ? $emp->bank_id : '')); ?></td></tr>
							<tr><th>Account Number</th><td><?= esc(_emp_disp(isset($emp->accnumber) ? $emp->accnumber : '')); ?></td></tr>
							<tr><th>Account Name</th><td><?= esc(_emp_disp(isset($emp->accname) ? $emp->accname : '')); ?></td></tr>
							<tr><th>BPJS Kesehatan</th><td><?= esc(_emp_disp(isset($emp->bpjs_kes) ? $emp->bpjs_kes : '')); ?></td></tr>
						</table>
					</div>
					<div class="col-sm-6">
						<table class="table table-striped">
							<tr><th width="170">BPJS Ketenagakerjaan</th><td><?= esc(_emp_disp(isset($emp->bpjs_ket) ? $emp->bpjs_ket : '')); ?></td></tr>
							<tr><th>Tax Marital Status</th><td><?= esc($tax_marital_text); ?></td></tr>
							<tr><th>Blood Group</th><td><?= esc(_emp_disp(isset($emp->blood_group) ? $emp->blood_group : '')); ?></td></tr>
							<tr><th>Finger ID</th><td><?= esc($finger_text); ?></td></tr>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div class="box box-default">
			<div class="box-header with-border"><h3 class="box-title"><i class="fa fa-users"></i> Family Data</h3></div>
			<div class="box-body">
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead><tr><th class="text-center">Name</th><th class="text-center">Place of Birth</th><th class="text-center">Date of Birth</th><th class="text-center">Relationship</th></tr></thead>
						<tbody>
							<?php if (!empty($rows_family)) : ?>
								<?php foreach ($rows_family as $fam) :
									$fam = (array) $fam;
									$cat_key = isset($fam['category']) ? $fam['category'] : '';
									$cat_text = (isset($family_type) && isset($family_type[$cat_key])) ? $family_type[$cat_key] : _emp_disp($cat_key);
								?>
									<tr>
										<td><?= esc(_emp_disp(isset($fam['name']) ? $fam['name'] : '')); ?></td>
										<td><?= esc(_emp_disp(isset($fam['birth_place']) ? $fam['birth_place'] : '')); ?></td>
										<td class="text-center"><?= esc(_emp_date(isset($fam['birth_date']) ? $fam['birth_date'] : '')); ?></td>
										<td class="text-center"><?= esc($cat_text); ?></td>
									</tr>
								<?php endforeach; ?>
							<?php else : ?>
								<tr><td colspan="4" class="text-center text-muted">Tidak ada data keluarga.</td></tr>
							<?php endif; ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="box box-default">
			<div class="box-header with-border"><h3 class="box-title"><i class="fa fa-graduation-cap"></i> Education History</h3></div>
			<div class="box-body">
				<div class="table-responsive">
					<table class="table table-bordered table-striped">
						<thead><tr><th class="text-center">Level</th><th class="text-center">Institution Name</th><th class="text-center">Graduate Year</th></tr></thead>
						<tbody>
							<?php if (!empty($rows_education)) : ?>
								<?php foreach ($rows_education as $edu) :
									$edu = (array) $edu;
									$lvl_key = isset($edu['level']) ? $edu['level'] : '';
									$lvl_text = (isset($education_type) && isset($education_type[$lvl_key])) ? $education_type[$lvl_key] : _emp_disp($lvl_key);
								?>
									<tr>
										<td class="text-center"><?= esc($lvl_text); ?></td>
										<td><?= esc(_emp_disp(isset($edu['institution']) ? $edu['institution'] : '')); ?></td>
										<td class="text-center"><?= esc(_emp_disp(isset($edu['graduated']) ? $edu['graduated'] : '')); ?></td>
									</tr>
								<?php endforeach; ?>
							<?php else : ?>
								<tr><td colspan="3" class="text-center text-muted">Tidak ada riwayat pendidikan.</td></tr>
							<?php endif; ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="box-footer">
		<a href="<?= site_url('employees'); ?>" class="btn btn-danger"><i class="fa fa-arrow-left"></i> Kembali</a>
	</div>
</div>
