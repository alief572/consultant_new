-- Run once in the consultant schema, before deploying the v2 application code.
-- Existing reports retain version 1; application inserts version 2 explicitly.
ALTER TABLE kons_tr_expense_report_project_header
  ADD COLUMN flow_version TINYINT UNSIGNED NOT NULL DEFAULT 1;

CREATE TABLE kons_tr_expense_project_return (
  expense_id VARCHAR(100) NOT NULL PRIMARY KEY,
  amount DECIMAL(20,2) NOT NULL,
  status VARCHAR(30) NOT NULL DEFAULT 'waiting_return',
  bank_id INT NULL,
  transfer_date DATE NULL,
  submitted_at DATETIME NULL,
  verified_by VARCHAR(100) NULL,
  verified_at DATETIME NULL,
  rejection_reason TEXT NULL,
  journal_reference VARCHAR(100) NULL,
  INDEX return_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE kons_tr_expense_project_return_history (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  expense_id VARCHAR(100) NOT NULL,
  action VARCHAR(30) NOT NULL,
  actor VARCHAR(100) NOT NULL,
  created_at DATETIME NOT NULL,
  note TEXT NULL,
  bank_id INT NULL,
  transfer_date DATE NULL,
  file_path VARCHAR(255) NULL,
  INDEX return_history (expense_id, id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE db_sendigs_ss.request_payment
  ADD COLUMN source_module VARCHAR(45) NULL,
  ADD COLUMN source_id VARCHAR(100) NULL,
  ADD COLUMN id_company VARCHAR(100) NULL,
  ADD COLUMN nm_company VARCHAR(255) NULL,
  ADD UNIQUE KEY expense_project_source (source_module, source_id);

INSERT INTO menus (title,link,icon,target,group_menu,parent_id,status,`order`,pusat)
SELECT 'Verifikasi Pengembalian Kasbon','expense_report_project/verification','fa fa-check','_self',group_menu,parent_id,1,`order`+1,pusat
FROM menus WHERE link='approval_expense_report_project' LIMIT 1;
SET @return_menu = LAST_INSERT_ID();
INSERT INTO permissions (nm_permission,ket,id_menu,nm_menu,created_on)
VALUES ('Expense_Project_Return.Verify','Verifikasi pengembalian kasbon project',@return_menu,'Verifikasi Pengembalian Kasbon',NOW());
UPDATE menus SET permission_id=LAST_INSERT_ID() WHERE id=@return_menu;
-- Grant Expense_Project_Return.Verify to Finance via role management; no automatic grants.

-- COA Piutang Kelebihan Kasbon Konsultan (GL Master)
INSERT INTO db_sendigs_gl_ss.coa_master (no_perkiraan, nama, kdcab, saldoawal, bln, thn, debet, kredit, tmp, tipe, level, faktor)
VALUES ('1103-01-15', 'Piutang Kelebihan Kasbon Konsultan', '101-A', 0, 3, 2026, 0, 0, 'O', 'A', 5, 1)
ON DUPLICATE KEY UPDATE nama = VALUES(nama);
