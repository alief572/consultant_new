<?php
// Compat: kode lama memakai `new mPDF(...)` (mPDF 5.7); sekarang dibungkus mPDF 8 (composer).
// Dimuat via composer autoload "files" dan oleh CI loader ($this->load->library('Mpdf')).
if (!class_exists('mPDF', false)) {
	class mPDF extends \Mpdf\Mpdf
	{
		// shortcut: mode lama ('c','s','-aCJK', dst) diabaikan, selalu utf-8; cukup untuk laporan HTML->PDF yang ada.
		public function __construct($mode = '', $format = 'A4', $size = 0, $font = '', $ml = 15, $mr = 15, $mt = 16, $mb = 16, $mh = 9, $mf = 9, $orientation = 'P')
		{
			$dir = sys_get_temp_dir() . '/mpdf';
			is_dir($dir) || @mkdir($dir, 0777, true);
			$d = static fn($v, $def) => ($v === '' || $v === null) ? $def : $v;
			$cfg = [
				'mode' => 'utf-8',
				'tempDir' => $dir,
				'format' => $d($format, 'A4'),
				'orientation' => $d($orientation, 'P'),
				'margin_left' => $d($ml, 15), 'margin_right' => $d($mr, 15),
				'margin_top' => $d($mt, 16), 'margin_bottom' => $d($mb, 16),
				'margin_header' => $d($mh, 9), 'margin_footer' => $d($mf, 9),
			];
			if (is_numeric($size) && $size > 0) $cfg['default_font_size'] = $size;
			if ($font) $cfg['default_font'] = $font;
			parent::__construct($cfg);
		}

		// mPDF 5.7 + FPDI: tidak ada di mPDF 8, tidak berpengaruh untuk laporan HTML.
		public function SetImportUse()
		{
		}
	}
}
