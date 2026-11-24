<?php
// Compat: kode lama memakai html2pdf 4.03 + TCPDF 5 (tidak jalan di PHP 8); sekarang dibungkus spipu/html2pdf 5 (composer).
// Pemanggil tetap `require_once('./assets/html2pdf/html2pdf/html2pdf.class.php'); new HTML2PDF(...)`.
// Signature constructor sama ($orientation, $format, $lang, $unicode, $encoding, $margins);
// WriteHTML/Output/->pdf->SetDisplayMode dipetakan otomatis (nama method PHP tidak case-sensitive).
require_once dirname(__DIR__, 3) . '/vendor/autoload.php';

if (!class_exists('HTML2PDF', false)) {
	class HTML2PDF extends \Spipu\Html2Pdf\Html2Pdf
	{
	}
}
