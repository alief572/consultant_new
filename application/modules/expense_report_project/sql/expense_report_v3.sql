-- Run once in the consultant schema. Prefer scripts/migrate_expense_report_v3.php, which checks first and is idempotent.
-- Keterangan Laporan: required description of the report, entered by the reporter.
ALTER TABLE kons_tr_expense_report_project_header
  ADD COLUMN keterangan_laporan TEXT NULL AFTER keterangan_kurang_bayar;
