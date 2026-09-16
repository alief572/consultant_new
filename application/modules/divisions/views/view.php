<?php
defined('BASEPATH') OR exit('No direct script access allowed');
// Halaman detail read-only. View-only: tanpa form edit, tanpa tombol Save.
if (!isset($row) || empty($row)) {
	echo '<div class="alert alert-warning">Data division tidak ditemukan.</div>';
	echo '<a href="' . site_url('divisions') . '" class="btn btn-danger"><i class="fa fa-arrow-left"></i> Kembali</a>';
	return;
}
$div = $row[0];

if (!function_exists('_div_disp')) {
	function _div_disp($val) {
		$val = trim((string) $val);
		return ($val === '' || $val === '0') ? '-' : $val;
	}
}
if (!function_exists('_div_lookup')) {
	function _div_lookup($map, $key) {
		if (is_array($map) && isset($map[$key]) && trim((string) $map[$key]) !== '') {
			return (string) $map[$key];
		}
		return _div_disp($key);
	}
}

$div_id = _div_disp(isset($div->id) ? $div->id : '');
$div_name = _div_disp(isset($div->name) ? $div->name : '');
$company_text = isset($data_companies) ? _div_lookup($data_companies, isset($div->company_id) ? $div->company_id : '') : _div_disp(isset($div->company_id) ? $div->company_id : '');

$initials = '-';
$parts = preg_split('/\s+/', trim((string) $div_name));
if ($div_name !== '-' && !empty($parts)) {
	$initials = strtoupper(substr($parts[0], 0, 1) . (isset($parts[1]) ? substr($parts[1], 0, 1) : ''));
}
?>

<div class="box box-primary">
	<div class="box-header with-border">
		<h3 class="box-title"><i class="fa fa-sitemap"></i> <?= isset($title) ? esc($title) : 'Detail Division'; ?></h3>
		<div class="box-tools pull-right">
			<span class="label label-info" title="Modul ini hanya untuk melihat data"><i class="fa fa-eye"></i> View Only</span>
		</div>
	</div>
	<div class="box-body">
		<div class="row" style="margin-bottom:20px;">
			<div class="col-sm-2 text-center">
				<div style="width:80px;height:80px;border-radius:50%;background:#00c0ef;color:#fff;font-size:28px;font-weight:bold;display:inline-flex;align-items:center;justify-content:center;" title="<?= esc($div_name); ?>">
					<?= esc($initials); ?>
				</div>
			</div>
			<div class="col-sm-10">
				<h3 style="margin-top:0;margin-bottom:5px;"><?= esc($div_name); ?></h3>
				<p class="text-muted" style="margin-bottom:0;">
					ID: <strong><?= esc($div_id); ?></strong>
					&nbsp;|&nbsp; Company: <strong><?= esc($company_text); ?></strong>
				</p>
			</div>
		</div>

		<div class="box box-default">
			<div class="box-header with-border"><h3 class="box-title">Detail Division</h3></div>
			<div class="box-body">
				<div class="row">
					<div class="col-sm-8">
						<table class="table table-striped">
							<tr><th width="180">Division ID</th><td><?= esc($div_id); ?></td></tr>
							<tr><th>Division Name</th><td><?= esc($div_name); ?></td></tr>
							<tr><th>Company</th><td><?= esc($company_text); ?></td></tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="box-footer">
		<a href="<?= site_url('divisions'); ?>" class="btn btn-danger"><i class="fa fa-arrow-left"></i> Kembali</a>
	</div>
</div>
