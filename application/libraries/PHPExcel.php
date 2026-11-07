<?php
// Compat: kode lama memakai PHPExcel_*; sekarang dipetakan ke PhpSpreadsheet (composer).
use PhpOffice\PhpSpreadsheet\IOFactory;

if (!class_exists('PHPExcel', false)) {
	class_alias(\PhpOffice\PhpSpreadsheet\Spreadsheet::class, 'PHPExcel');
	class_alias(\PhpOffice\PhpSpreadsheet\Style\Border::class, 'PHPExcel_Style_Border');
	class_alias(\PhpOffice\PhpSpreadsheet\Style\Alignment::class, 'PHPExcel_Style_Alignment');
	class_alias(\PhpOffice\PhpSpreadsheet\Style\Fill::class, 'PHPExcel_Style_Fill');

	class PHPExcel_IOFactory
	{
		private const TYPES = ['Excel5' => 'Xls', 'Excel2007' => 'Xlsx'];

		public static function createWriter($spreadsheet, $type)
		{
			return IOFactory::createWriter($spreadsheet, self::TYPES[$type] ?? $type);
		}
	}
}
