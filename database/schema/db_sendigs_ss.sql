
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absensi_summary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `year` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mounth` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date_periode_start` datetime DEFAULT NULL,
  `date_periode_end` datetime DEFAULT NULL,
  `office` int DEFAULT NULL,
  `oniste` int DEFAULT NULL,
  `lembur` int DEFAULT NULL,
  `updated_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_category` int DEFAULT NULL,
  `id_stock` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `stock_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `trade_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `brand` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_unit_gudang` int DEFAULT NULL,
  `konversi` double(9,2) NOT NULL DEFAULT '1.00',
  `id_unit` int DEFAULT NULL,
  `min_stok` double(16,4) DEFAULT NULL,
  `max_stok` double(16,4) DEFAULT NULL,
  `min_order` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status` enum('1','0') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `price_ref` double(16,6) DEFAULT NULL,
  `price_ref_high` double(16,6) DEFAULT NULL,
  `price_ref_high_usd` double(16,6) DEFAULT NULL,
  `price_ref_usd` double(16,6) DEFAULT NULL,
  `price_ref_date` date DEFAULT NULL,
  `price_ref_expired` int DEFAULT NULL,
  `note` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `upload_file` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `status_app` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `app_by` int DEFAULT NULL,
  `app_date` datetime DEFAULT NULL,
  `price_ref_new` double(16,6) DEFAULT NULL,
  `price_ref_high_new` double(16,6) DEFAULT NULL,
  `price_ref_high_new_usd` double(16,6) DEFAULT NULL,
  `price_ref_new_usd` double(16,6) DEFAULT NULL,
  `price_ref_new_date` date DEFAULT NULL,
  `price_ref_new_expired` int DEFAULT NULL,
  `status_reject` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `price_ref_use` double(16,6) DEFAULT NULL,
  `price_ref_use_usd` double(16,6) DEFAULT NULL,
  `price_ref_date_use` date DEFAULT NULL,
  `price_ref_expired_use` int DEFAULT NULL,
  `id_kurs` int DEFAULT NULL,
  `kurs` decimal(16,6) DEFAULT NULL,
  `request` double(16,2) DEFAULT NULL,
  `request_pack` double(16,2) DEFAULT NULL,
  `tgl_dibutuhkan` date DEFAULT NULL,
  `spec_pr` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `info_pr` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_coa` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_coa` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accessories_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nm_category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `outgoing` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'general',
  `id_gudang` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ap` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_invoice` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `no_po` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_terima_invoice` date DEFAULT NULL,
  `tgl_jatuh_tempo` date DEFAULT NULL,
  `id_klien` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_klien` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bln` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `thn` int DEFAULT NULL,
  `saldo_awal` double DEFAULT '0',
  `debet` double DEFAULT '0',
  `kredit` double DEFAULT '0',
  `saldo_akhir` double DEFAULT '0',
  `last_update` datetime DEFAULT NULL,
  `ip_update` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `kunci` (`no_invoice`,`bln`,`thn`,`no_po`,`saldo_akhir`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_invoice` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `no_po` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_terima_invoice` date DEFAULT NULL,
  `tgl_jatuh_tempo` date DEFAULT NULL,
  `id_klien` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_klien` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bln` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `thn` int DEFAULT NULL,
  `saldo_awal` double DEFAULT '0',
  `debet` double DEFAULT '0',
  `kredit` double DEFAULT '0',
  `saldo_akhir` double DEFAULT '0',
  `last_update` datetime DEFAULT NULL,
  `ip_update` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `kunci` (`no_invoice`,`bln`,`thn`,`no_po`,`saldo_akhir`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_klien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_invoice` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `no_po` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_terima_invoice` date DEFAULT NULL,
  `tgl_jatuh_tempo` date DEFAULT NULL,
  `id_klien` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_klien` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bln` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `thn` int DEFAULT NULL,
  `saldo_awal` double DEFAULT '0',
  `debet` double DEFAULT '0',
  `kredit` double DEFAULT '0',
  `saldo_akhir` double DEFAULT '0',
  `last_update` datetime DEFAULT NULL,
  `ip_update` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `kunci` (`no_invoice`,`bln`,`thn`,`no_po`,`saldo_akhir`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_trial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_invoice` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `no_po` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_terima_invoice` date DEFAULT NULL,
  `tgl_jatuh_tempo` date DEFAULT NULL,
  `id_klien` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_klien` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bln` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `thn` int DEFAULT NULL,
  `saldo_awal` double DEFAULT '0',
  `debet` double DEFAULT '0',
  `kredit` double DEFAULT '0',
  `saldo_akhir` double DEFAULT '0',
  `last_update` datetime DEFAULT NULL,
  `ip_update` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `kunci` (`no_invoice`,`bln`,`thn`,`no_po`,`saldo_akhir`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_asset` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_asset` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_perolehan` date DEFAULT NULL,
  `category` int DEFAULT NULL,
  `nm_category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai_asset` double DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `asset_ke` tinyint DEFAULT NULL,
  `depresiasi` int DEFAULT NULL,
  `value` double(255,0) DEFAULT NULL,
  `kdcab` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lokasi_asset` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cost_center` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_company` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_company` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `deleted` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`,`kd_asset`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nm_category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` enum('BERGERAK','TIDAK BERGERAK') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'TIDAK BERGERAK',
  `status` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_generate` (
  `kd_asset` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_asset` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `category` int DEFAULT NULL,
  `nm_category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bulan` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tahun` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai_susut` double(255,0) DEFAULT NULL,
  `kdcab` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `flag` enum('Y','N','L') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `asset_jurnal` AS SELECT 
 1 AS `category`,
 1 AS `nm_category`,
 1 AS `sisa_nilai`,
 1 AS `kdcab`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_jurnal_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bulan` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tahun` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ket` enum('SUCCESS','FAILED') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jurnal_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` datetime DEFAULT NULL,
  `kdcab` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_jurnal_temp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nomor` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `tanggal` date DEFAULT NULL,
  `no_perkiraan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `debet` double DEFAULT NULL,
  `kredit` double DEFAULT NULL,
  `kdcab` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_new` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_trans` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_barang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai_aset` decimal(20,0) DEFAULT NULL,
  `depresiasi_bulan` smallint DEFAULT NULL,
  `nilai_depresiasi` decimal(20,0) DEFAULT NULL,
  `susut` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sisa_umur` smallint DEFAULT NULL,
  `depresiasi_tahun` smallint DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `nomor` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `asset_nilai` AS SELECT 
 1 AS `kd_asset`,
 1 AS `category`,
 1 AS `nm_category`,
 1 AS `sisa_nilai`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_planning` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code_plan` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'PLA2011001',
  `no_pr` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `coa` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `coa_akum` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_asset` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_dept` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_costcenter` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tahun` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bulan` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `budget` double(16,2) DEFAULT '0.00',
  `terpakai` double(16,2) DEFAULT '0.00',
  `sisa` double(16,2) DEFAULT '0.00',
  `budget_pr` double(16,2) DEFAULT '0.00',
  `budget_po` double(16,2) DEFAULT '0.00',
  `qty` int DEFAULT '0',
  `status` enum('Y','N','D') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_date` datetime DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rev_nama_asset` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rev_budget` double(16,2) DEFAULT NULL,
  `rev_qty` int DEFAULT NULL,
  `rev_bulan` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rev_tahun` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rev_keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `close_pr` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `close_pr_desc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `no_coa` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_coa` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `sts_finance` enum('1','0') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `app_finance_date` datetime DEFAULT NULL,
  `reject_reason_finance` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bidang_usaha` (
  `id_bidang_usaha` int NOT NULL AUTO_INCREMENT,
  `bidang_usaha` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_bidang_usaha`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bom_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `no_bom` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_bom_detail` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_material` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double(16,5) DEFAULT NULL,
  `persen` double(9,2) DEFAULT NULL,
  `persen_add` double(9,2) DEFAULT NULL,
  `length` double(16,4) DEFAULT NULL,
  `width` double(16,4) DEFAULT NULL,
  `qty` double(16,4) DEFAULT NULL,
  `m2` double(16,4) DEFAULT NULL,
  `file_upload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `unit` int DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `layer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_process` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spk` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bom_detail_custom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_bom` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_bom_detail` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_material` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_material` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `weight` double(16,5) DEFAULT NULL,
  `persen` double(9,2) DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `length` double(16,2) DEFAULT NULL,
  `width` double(16,2) DEFAULT NULL,
  `qty` double(16,2) DEFAULT NULL,
  `lari` double(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bom_header` (
  `no_bom` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'standard',
  `id_product` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_product_2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additive_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `variant_product` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surface` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_topping` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waste_product` decimal(16,4) DEFAULT NULL,
  `waste_setting` decimal(16,4) DEFAULT NULL,
  `waste_setting_resin` decimal(16,4) DEFAULT NULL,
  `waste_setting_glass` decimal(16,4) DEFAULT NULL,
  `moq` decimal(16,4) DEFAULT NULL,
  `waste_total` decimal(16,4) DEFAULT NULL,
  `total_material` decimal(16,4) DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `fire_retardant` int DEFAULT '0',
  `anti_uv` int DEFAULT '0',
  `tixotropic` int DEFAULT '0',
  `food_grade` int DEFAULT '0',
  `wax` int DEFAULT '0',
  `corrosion` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_upload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `width` double(16,2) DEFAULT NULL,
  `length` double(16,2) DEFAULT NULL,
  `id_ipp` int DEFAULT NULL,
  PRIMARY KEY (`no_bom`) USING BTREE,
  UNIQUE KEY `no_bom` (`no_bom`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bom_hth_detail_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company` enum('f-tackle','origa') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_bom_hth` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'HTH2009001',
  `kode_bom_hth_detail` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'HTH2009001-001',
  `id_group_material` int DEFAULT NULL,
  `id_material` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double(15,5) DEFAULT NULL,
  `price` double(9,2) DEFAULT NULL,
  `total` double(15,5) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bom_hth_detail_footer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company` enum('f-tackle','origa') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_bom_hth` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'HTH2009001',
  `kode_bom_hth_detail` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'HTH2009001-001',
  `id_group_material` int DEFAULT NULL,
  `qty` double(15,5) DEFAULT NULL,
  `total_price` double(15,5) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bom_hth_detail_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company` enum('f-tackle','origa') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_bom_hth` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'HTH2009001',
  `kode_bom_hth_detail` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'HTH2009001-001',
  `id_group_material` int DEFAULT NULL,
  `group_material` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bom_hth_header` (
  `kode_bom_hth` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'HTH2009001',
  `id_product` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double(9,2) DEFAULT NULL,
  `total_price` double(14,5) DEFAULT NULL,
  `qty2` double(9,2) DEFAULT NULL,
  `total_price2` double(14,5) DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`kode_bom_hth`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget_rutin_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code_budget` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'BUD2009001',
  `jenis_barang` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_barang` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kebutuhan_month` double(9,2) DEFAULT NULL,
  `satuan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `no_pr` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_reference` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_price` decimal(20,2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `budget_rutin_header` (
  `code_budget` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'BUD2009001',
  `tanggal` date DEFAULT NULL,
  `department` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `costcenter` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rev` int DEFAULT '0',
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `cancel_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`code_budget`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cabang` (
  `id` int DEFAULT NULL,
  `kdcab` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `namacabang` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `alamat` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kepalacaban` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kabagjualan` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `admcabang` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `gudang` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `automaticbu` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nobum` bigint DEFAULT NULL,
  `kertas` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kota` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nobuk` bigint DEFAULT NULL,
  `nocn` bigint DEFAULT NULL,
  `automaticbu1` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `automaticcn` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `automaticjv` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `prefixfaktu` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `noJS` int DEFAULT NULL,
  `noJP` int DEFAULT NULL,
  `noJO` int DEFAULT NULL,
  `noJC` int DEFAULT NULL,
  `noJM` int DEFAULT NULL,
  `noJD` int DEFAULT NULL,
  `nomorJS` int DEFAULT NULL,
  `nomorJP` int DEFAULT NULL,
  `nomorJO` int DEFAULT NULL,
  `nomorJC` int DEFAULT NULL,
  `nomorJM` int DEFAULT NULL,
  `nomorJD` int DEFAULT NULL,
  `fakturpajak` int DEFAULT NULL,
  `no_suratjal` int DEFAULT NULL,
  `no_so` int DEFAULT NULL,
  `no_invoice` int DEFAULT NULL,
  `no_invoice_` int DEFAULT NULL,
  `no_po` int DEFAULT NULL,
  `no_receive` int DEFAULT NULL,
  `no_pr` int DEFAULT NULL,
  `th_picking_` int DEFAULT NULL,
  `no_picking_` int DEFAULT NULL,
  `biaya_logis` double DEFAULT NULL,
  `sts_aktif` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` date DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` bigint DEFAULT NULL,
  `no_mutasi` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cek_count_double_daycode` AS SELECT 
 1 AS `id_product`,
 1 AS `id_costcenter`,
 1 AS `code`,
 1 AS `jumlah_double`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cek_daycode` AS SELECT 
 1 AS `nm_project`,
 1 AS `id_product`,
 1 AS `nm_product`,
 1 AS `id_costcenter`,
 1 AS `nama_costcenter`,
 1 AS `code`,
 1 AS `ket`,
 1 AS `qty_stock`,
 1 AS `sts_daycode`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cek_daycode_delivery` AS SELECT 
 1 AS `delivery_code`,
 1 AS `id_product`,
 1 AS `daycode`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cek_daycode_double` AS SELECT 
 1 AS `id`,
 1 AS `id_costcenter`,
 1 AS `nama_costcenter`,
 1 AS `id_product`,
 1 AS `nama_product`,
 1 AS `daycode`,
 1 AS `jumlah_double`,
 1 AS `ket`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cek_daycode_double_fast` AS SELECT 
 1 AS `id`,
 1 AS `id_costcenter`,
 1 AS `id_product`,
 1 AS `daycode`,
 1 AS `jumlah_double`,
 1 AS `ket`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cek_delivery` AS SELECT 
 1 AS `id`,
 1 AS `no_delivery`,
 1 AS `no_so`,
 1 AS `delivery_date`,
 1 AS `id_so_detail`,
 1 AS `product`,
 1 AS `qty_order`,
 1 AS `qty_delivery`,
 1 AS `qty_kurang`,
 1 AS `remarks`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `cek_update_product` AS SELECT 
 1 AS `id`,
 1 AS `id_produksi`,
 1 AS `id_costcenter`,
 1 AS `nama_costcenter`,
 1 AS `id_product`,
 1 AS `nama_product`,
 1 AS `code`,
 1 AS `tanggal_produksi`,
 1 AS `created_by`,
 1 AS `created_date`,
 1 AS `ket`,
 1 AS `qc_date`,
 1 AS `sts_daycode`,
 1 AS `delivery_by`,
 1 AS `delivery_code`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `check_stock_product` AS SELECT 
 1 AS `nm_project`,
 1 AS `id_product`,
 1 AS `nm_product`,
 1 AS `id_costcenter`,
 1 AS `nama_costcenter`,
 1 AS `qty_stock`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `check_urutan_cycletime` AS SELECT 
 1 AS `id_time`,
 1 AS `id_product`,
 1 AS `urut`,
 1 AS `jumlah`,
 1 AS `ket_ct`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checksheet_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `items` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `standard` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `tipe` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1' COMMENT '1=Yes/No,2=InputFreeText',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checksheet_detail_new` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_checksheet` int DEFAULT NULL,
  `surface` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1' COMMENT '1=Yes/No,2=InputFreeText',
  `rooving` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `matt_atas` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `matt_bawah` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `matt_kiri` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `matt_kanan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `display1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `display2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `display3` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dies1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dies2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dies3` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `speed` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checksheet_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `frequency_check` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_mesin` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `child_category_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_customer` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_category_customer` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `child_customer_bank` (
  `id_bank` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_customer` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `activation` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_name` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_acc_no` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_code` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_acc_na` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `child_customer_branch` (
  `id_branch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pic_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone_1_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone_2_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `handphone_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fax_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_country_branch` int DEFAULT NULL,
  `id_prov_branch` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `city_branch` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `address_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `zip_code_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `activation` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `child_customer_category` (
  `id_category_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_category_customer` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `customer_code` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` date DEFAULT NULL,
  `activation` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `child_customer_pic` (
  `id_pic` int NOT NULL AUTO_INCREMENT,
  `name_pic` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_customer` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `phone_pic` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email_pic` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `position_pic` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `religion_pic` int DEFAULT NULL,
  PRIMARY KEY (`id_pic`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `child_customer_reference` (
  `id_reference` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_reference` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` date DEFAULT NULL,
  `activation` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `child_supplier_bank` (
  `id_bank` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_customer` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `activation` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_name` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_acc_no` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_code` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_acc_na` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `child_supplier_branch` (
  `id_branch` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_supplier` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pic_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone_1_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone_2_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `handphone_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fax_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_country_branch` int DEFAULT NULL,
  `id_prov_branch` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `city_branch` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `address_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `zip_code_branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `activation` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `child_supplier_category` (
  `id_category_supplier` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_category_supplier` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `supplier_code` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` date DEFAULT NULL,
  `activation` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `child_supplier_pic` (
  `id_pic` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_pic` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_supplier` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `phone_pic` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email_pic` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `position_pic` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `religion_pic` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `child_supplier_reference` (
  `id_reference` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_reference` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` date DEFAULT NULL,
  `activation` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ci_sessions` (
  `id` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `timestamp` int unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ci_sessions_timestamp` (`timestamp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cms_kewenangan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idcms` int NOT NULL DEFAULT '0',
  `kewenangan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_perkiraan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kdcab` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `saldoawal` double NOT NULL DEFAULT '0',
  `bln` smallint NOT NULL DEFAULT '0',
  `thn` smallint NOT NULL DEFAULT '0',
  `debet` double DEFAULT '0',
  `kredit` double DEFAULT '0',
  `tmp` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `level` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `grup` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `faktor` smallint DEFAULT NULL,
  `cf_grup` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cf_urut` smallint DEFAULT NULL,
  `cf_child` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `prev_month` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `nomor` (`no_perkiraan`,`kdcab`,`bln`,`thn`,`level`) USING BTREE,
  UNIQUE KEY `NO` (`kdcab`,`no_perkiraan`,`bln`,`thn`,`level`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coa_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coa` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coa_copy1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_perkiraan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kdcab` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `saldoawal` double NOT NULL DEFAULT '0',
  `bln` smallint NOT NULL DEFAULT '0',
  `thn` smallint NOT NULL DEFAULT '0',
  `debet` double DEFAULT '0',
  `kredit` double DEFAULT '0',
  `tmp` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `level` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `grup` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `faktor` smallint DEFAULT NULL,
  `cf_grup` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cf_urut` smallint DEFAULT NULL,
  `cf_child` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `prev_month` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `nomor` (`no_perkiraan`,`kdcab`,`bln`,`thn`,`level`) USING BTREE,
  UNIQUE KEY `NO` (`kdcab`,`no_perkiraan`,`bln`,`thn`,`level`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coa_expense` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `jenis_pengeluaran` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `coa` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `created_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coa_master` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_perkiraan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kdcab` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `saldoawal` double NOT NULL DEFAULT '0',
  `bln` smallint NOT NULL DEFAULT '0',
  `thn` int NOT NULL DEFAULT '0',
  `debet` double DEFAULT '0',
  `kredit` double DEFAULT '0',
  `tmp` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `level` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `grup` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `faktor` smallint DEFAULT NULL,
  `cf_grup` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cf_urut` smallint DEFAULT NULL,
  `cf_child` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `prev_month` double DEFAULT NULL,
  `kode_bank` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `nomor` (`no_perkiraan`,`kdcab`,`bln`,`thn`,`level`) USING BTREE,
  UNIQUE KEY `NO` (`kdcab`,`no_perkiraan`,`bln`,`thn`,`level`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coa_master_copy1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_perkiraan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kdcab` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `saldoawal` double NOT NULL DEFAULT '0',
  `bln` smallint NOT NULL DEFAULT '0',
  `thn` int NOT NULL DEFAULT '0',
  `debet` double DEFAULT '0',
  `kredit` double DEFAULT '0',
  `tmp` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `level` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `grup` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `faktor` smallint DEFAULT NULL,
  `cf_grup` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cf_urut` smallint DEFAULT NULL,
  `cf_child` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `prev_month` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `nomor` (`no_perkiraan`,`kdcab`,`bln`,`thn`,`level`) USING BTREE,
  UNIQUE KEY `NO` (`kdcab`,`no_perkiraan`,`bln`,`thn`,`level`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coa_tipe` (
  `COA` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tipe` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `faktor` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`COA`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `condition` (
  `id_condition` int NOT NULL AUTO_INCREMENT,
  `nm_condition` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id_condition`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `container` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `length` double(9,2) DEFAULT NULL,
  `wide` double(9,2) DEFAULT NULL,
  `high` double(9,2) DEFAULT NULL,
  `cub` double(9,2) DEFAULT NULL,
  `persenan` double(9,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_histories` (
  `id` int DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `contract_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `contractstart_date` date DEFAULT NULL,
  `contractlatest_date` date DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `costing_rate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` int DEFAULT NULL,
  `judul` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `element_costing` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rate` double(11,2) DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `element_coa` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `urutan` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_code` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `country_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`country_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country_all` (
  `id` int NOT NULL AUTO_INCREMENT,
  `iso` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nicename` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `iso3` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `numcode` smallint DEFAULT NULL,
  `phonecode` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_ipp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_ipp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `project` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `referensi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_top` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `rev` int DEFAULT '0',
  `delivery_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_country` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delivery_category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `area_destinasi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delivery_address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `shipping_method` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `packing` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `guarantee` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `instalasi_option` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `platform` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `cover_drainage` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `facade` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `ceilling` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `partition` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `fence` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `max_load` double(9,2) DEFAULT NULL,
  `min_load` double(9,2) DEFAULT NULL,
  `app_indoor` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `app_outdoor` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `sts` int NOT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `code_lv4` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `request_new_product` int NOT NULL,
  `ajukan_sts` enum('N','Y','A') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `ajukan_sts_by` int DEFAULT NULL,
  `ajukan_sts_date` datetime DEFAULT NULL,
  `ajukan_sts_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `no_bom` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_ipp_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_ipp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `platform` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `cover_drainage` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `facade` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `ceilling` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `partition` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `fence` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `app_others` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `color_dark_green` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `color_dark_grey` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `color_light_grey` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `color_yellow` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `color` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `food_grade` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `uv` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fire_reterdant` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `industrial_type` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `commercial_type` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `superior_type` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `standard_astm` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `standard_bs` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `standard_dnv` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `file_pendukung_1` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `file_pendukung_2` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `surface_concave` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `surface_flat` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `surface_chequered_plate` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `surface_anti_skid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `surface_custom` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `file_dokumen` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `mesh_open` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mesh_closed` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `type_product` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `product_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `accessories` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_ipp_detail_lainnya` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `order` double(16,4) DEFAULT NULL,
  `length` double(16,4) DEFAULT NULL,
  `width` double(16,4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_customer` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kdcab` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '100',
  `bidang_usaha` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `produk_jual` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kredibilitas` enum('A','B','C','D') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `country_code` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `provinsi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kota` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_pos` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `telpon` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `telpon2` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telpon3` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fax` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email3` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `npwp` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `alamat_npwp` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ktp` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `alamat_ktp` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_pic` char(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_marketing` int DEFAULT NULL,
  `referensi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `website` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `foto` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `diskon_toko` double DEFAULT '0',
  `sts_aktif` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y' COMMENT 'status customer aktif atau tidak',
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `total_poin` bigint DEFAULT '0',
  `coa_deffered` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_customer`) USING BTREE,
  KEY `id_customer` (`id_customer`,`nm_customer`) USING BTREE,
  KEY `id_marketing` (`id_marketing`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address_invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `invoice_address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `last_by` int DEFAULT NULL,
  `last_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_bidang_usaha` (
  `id_bidang_usaha` int NOT NULL AUTO_INCREMENT,
  `id_customer` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bidang_usaha` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_bidang_usaha`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_pic` (
  `id_pic` varchar(19) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_pic` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `divisi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jabatan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email_pic` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pic`) USING BTREE,
  KEY `nm_pic` (`nm_pic`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_referensi` (
  `id_reff` int NOT NULL AUTO_INCREMENT,
  `id_customer` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reference_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reference_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reference_phone` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_reff`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cycletime_custom_detail_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_costcenter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_process` int DEFAULT NULL,
  `tipe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_process` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cycletime` double(25,2) DEFAULT NULL,
  `qty_mp` int DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `machine` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mould` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `va` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_costcenter` (`id_costcenter`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cycletime_custom_detail_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_costcenter` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `costcenter` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `machine` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mould` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_costcenter` (`id_costcenter`) USING BTREE,
  KEY `id_time` (`id_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cycletime_custom_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_product` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_ct_setting` decimal(16,4) DEFAULT NULL,
  `total_ct_produksi` decimal(16,4) DEFAULT NULL,
  `moq` decimal(16,4) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_time` (`id_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cycletime_detail_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_costcenter` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_process` int DEFAULT NULL,
  `tipe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_process` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cycletime` double(25,2) DEFAULT NULL,
  `qty_mp` int DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `machine` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mould` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `va` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_costcenter` (`id_costcenter`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cycletime_detail_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_costcenter` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `costcenter` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `machine` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mould` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_costcenter` (`id_costcenter`) USING BTREE,
  KEY `id_time` (`id_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cycletime_fast` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_time` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_costcenter` char(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_product` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_process` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `costcenter` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cycletime` double(9,2) DEFAULT NULL,
  `mp` int DEFAULT NULL,
  `urut` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_product` (`id_product`,`costcenter`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cycletime_full` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_project` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_product` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_costcenter` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_costcenter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_process` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_process` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cycletime` double(9,2) DEFAULT NULL,
  `mp` int DEFAULT NULL,
  `man_hours` double(9,2) DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cycletime_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_product` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_ct_setting` decimal(16,4) DEFAULT NULL,
  `total_ct_produksi` decimal(16,4) DEFAULT NULL,
  `moq` decimal(16,4) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_time` (`id_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daycode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `urut` tinyint DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_delivery` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'DY200001',
  `id_so_detail` int DEFAULT NULL,
  `product` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_order` int DEFAULT NULL,
  `qty_delivery` int DEFAULT '0',
  `qty_kurang` int DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanggal` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_header` (
  `no_delivery` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'DY200001',
  `no_so` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_cust` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_real` date DEFAULT NULL,
  `shipping` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`no_delivery`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nm_dept` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department_center` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dept` int DEFAULT NULL,
  `nm_dept` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cost_center` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `division_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descr` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisi` (
  `id_divisi` int NOT NULL AUTO_INCREMENT,
  `nm_divisi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_divisi`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dk_cabang` (
  `id` int NOT NULL,
  `kdcab` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_cabang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dk_jabatan` (
  `id` int NOT NULL,
  `nm_jabatan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `discount` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dk_jabatan_copy1` (
  `id` int NOT NULL,
  `nm_jabatan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `discount` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dk_log_akses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pn_id` int DEFAULT NULL,
  `pn_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pn_jabatan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kdcab` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pn_wilayah` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dk_menu` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `urutan` int DEFAULT NULL,
  `nm_menu` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `parent` int DEFAULT NULL,
  `tampil` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `jenis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `img` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_menu`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dk_menu_akses` (
  `id` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jabatan` int DEFAULT NULL,
  `id_menu` int DEFAULT NULL,
  `r` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `u` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `d` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dk_menu_akses_old` (
  `id` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jabatan` int DEFAULT NULL,
  `id_menu` int DEFAULT NULL,
  `r` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `u` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `d` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dk_menu_old` (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `urutan` int DEFAULT NULL,
  `nm_menu` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `parent` int DEFAULT NULL,
  `tampil` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `jenis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `img` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_menu`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dk_user` (
  `pn_id` int NOT NULL AUTO_INCREMENT,
  `pn_uname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pn_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pn_pass` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pn_jabatan` int DEFAULT NULL,
  `pn_akses` enum('2','1','0') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1',
  `pn_wilayah` int DEFAULT NULL,
  `kdcab` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `sts_marketing` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  PRIMARY KEY (`pn_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dk_user_old` (
  `pn_id` int NOT NULL AUTO_INCREMENT,
  `pn_uname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pn_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pn_pass` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pn_jabatan` int DEFAULT NULL,
  `pn_akses` enum('2','1','0') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1',
  `pn_wilayah` int DEFAULT NULL,
  `kdcab` varchar(10) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `insert_date` date DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  `sts_marketing` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  PRIMARY KEY (`pn_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dt_incoming` (
  `id_dt_incoming` int NOT NULL AUTO_INCREMENT,
  `id_data` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_incoming` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_detail_incoming` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_dt_po` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_material` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_material` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `length` double(40,2) DEFAULT NULL,
  `width` double(40,2) DEFAULT NULL,
  `weight` double(40,2) DEFAULT NULL,
  `qty_order` int DEFAULT NULL,
  `qty_recive` int DEFAULT NULL,
  `tgl_datang` date DEFAULT NULL,
  `lotno` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `width_recive` double(40,2) DEFAULT NULL,
  `id_gudang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_roll` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `panjang` double(40,2) DEFAULT NULL,
  `actual_berat` double(40,2) DEFAULT NULL,
  `selisih` double(40,2) DEFAULT NULL,
  `thickness` double(40,2) DEFAULT NULL,
  `harga_satuan_usd` double(40,2) DEFAULT '0.00',
  `harga_satuan_idr` double(40,2) DEFAULT '0.00',
  `harga_total_usd` double(40,2) DEFAULT '0.00',
  `harga_total_idr` double(40,2) DEFAULT '0.00',
  `kurs` double(40,2) DEFAULT NULL,
  `kode_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ppn` double(40,2) DEFAULT '0.00',
  `harga_total` double(40,2) DEFAULT '0.00',
  PRIMARY KEY (`id_dt_incoming`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dt_incoming_po` (
  `id_data` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_incoming` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_po` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_detail_incoming` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_gudang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dt_trans_po` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_po` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_dt_po` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `idpr` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `idmaterial` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `namamaterial` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `width` double(40,2) unsigned DEFAULT NULL,
  `qty` double(40,2) DEFAULT NULL,
  `qty_in` double(40,2) NOT NULL,
  `rate_lme` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `alloyprice` double(40,2) DEFAULT NULL,
  `fabcost` double(20,2) DEFAULT NULL,
  `qty_recive` int DEFAULT NULL,
  `totalwidth` double(40,2) DEFAULT NULL,
  `panjang` double(40,2) DEFAULT NULL,
  `lebar` double(40,2) DEFAULT NULL,
  `hargasatuan` double(40,2) DEFAULT NULL,
  `diskon` double(40,2) DEFAULT NULL,
  `jumlahharga` double(40,2) DEFAULT NULL,
  `pajak` double(40,2) DEFAULT NULL,
  `note` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `close_po` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `close_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `sts_incoming` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_terima` double(40,2) DEFAULT NULL,
  `berat_terima` double(40,2) DEFAULT NULL,
  `kode_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ppn` double(40,2) DEFAULT '0.00',
  `ppn_persen` double(20,2) DEFAULT NULL,
  `harga_total` double(40,2) DEFAULT '0.00',
  `tipe` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `persen_disc` decimal(20,2) NOT NULL,
  `nilai_disc` decimal(20,2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dt_trans_pr` (
  `no_pr` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_dt_pr` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `idmaterial` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_material` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bentuk` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_bentuk` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `idameter` double(11,0) DEFAULT NULL,
  `odameter` double(40,2) DEFAULT NULL,
  `qty` double(40,2) DEFAULT NULL,
  `weight` double(40,2) DEFAULT NULL,
  `totalweight` double(40,2) DEFAULT NULL,
  `width` double(40,2) DEFAULT NULL,
  `length` double(40,2) DEFAULT NULL,
  `suplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_barang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nik` varchar(15) CHARACTER SET latin2 COLLATE latin2_general_ci NOT NULL COMMENT 'nomor induk karyawan',
  `nm_karyawan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'nama lengkap karyawan',
  `tmp_lahir` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'tempat lahir',
  `tgl_lahir` date DEFAULT NULL COMMENT 'tanggal lahir',
  `department` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'Divisi karyawan bekerja',
  `cost_center` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `gender` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'L' COMMENT 'L laki-laki, P Perempuan',
  `agama` enum('islam','protestan','katholik','hindu','budha','konghucu','lainnya') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'agama kepercayaan',
  `pendidikan` enum('sd','smp','sma','diploma','sarjana','master','doktoral','etc','smk','d3','d4','s1','smu') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'Level Pendidikan',
  `position` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ktp_provinsi` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ktp_kota` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ktp_kecamatan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ktp_kelurahan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ktp_kode_pos` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ktp_alamat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'alamat tempat yang ditinggali',
  `domisili_provinsi` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `domisili_kota` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `domisili_kecamatan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `domisili_kelurahan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `domisili_kode_pos` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `domisili_alamat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ponsel` varchar(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'nomor telepon seluler',
  `no_ponsel2` varchar(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `npwp` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'nomor npwp pribadi',
  `bpjs` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `photo` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'lokasi photo',
  `no_ktp` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'nomor KTP untuk WNI, atau sejenis',
  `tgl_join` date DEFAULT NULL,
  `tgl_end` date DEFAULT NULL,
  `sts_karyawan` enum('tetap','kontrak','magang','training','lainnya') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rek_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_account` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y' COMMENT 'status customer aktif atau tidak',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `kdcab` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanda_tangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `employees` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `nik`,
 1 AS `company_id`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_internal` (
  `id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `division_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `department_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `title_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `position_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `birthday` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hometown` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `relid` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `genderid` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `city` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `province` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `postcode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `idcard_address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `marital_status` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tax_marital_status` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `childs` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `family` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `family_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `secondchild_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `thirdchild_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fourthchild_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `phone` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hp` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight` int NOT NULL DEFAULT '0',
  `height` int NOT NULL DEFAULT '0',
  `blood_group` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nationality` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `licensid` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `citizenid` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `grade` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `familyno` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hiredate` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `startcontract_date` date DEFAULT NULL,
  `latestcontract_date` date DEFAULT NULL,
  `contract_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `change` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `firstcontractstart_date` date DEFAULT NULL,
  `firstcontractlatest_date` date DEFAULT NULL,
  `firstcontract_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `secondcontractstart_date` date DEFAULT NULL,
  `secondcontractlatest_date` date DEFAULT NULL,
  `secondcontract_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `thirdcontractstart_date` date DEFAULT NULL,
  `thirdcontractlatest_date` date DEFAULT NULL,
  `thirdcontract_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `permanentstart_date` date DEFAULT NULL,
  `permanentlatest_date` date DEFAULT NULL,
  `permanent_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `resign` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `resign_date` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accnumber` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `accname` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dayvacancy` int NOT NULL DEFAULT '0',
  `dayhospital` int NOT NULL DEFAULT '0',
  `daymedical` int NOT NULL DEFAULT '0',
  `annualleave` int NOT NULL DEFAULT '0',
  `leavecredit` int NOT NULL DEFAULT '0',
  `maxcredit` int NOT NULL DEFAULT '0',
  `leaveupdate` date DEFAULT NULL,
  `bpjs_kes` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bpjs_ket` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `taxid` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `empcatid` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `marital` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `empstsid` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `salary` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `division_head` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jabatan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pulsa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bpjstk` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `attendace` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descr` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `flag_active` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'Y',
  `finger_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `filter_daycode` AS SELECT 
 1 AS `id_costcenter`,
 1 AS `id_produksi_h`,
 1 AS `id_product`,
 1 AS `code`,
 1 AS `tanggal_produksi`,
 1 AS `created_by`,
 1 AS `created_date`,
 1 AS `qc_date`,
 1 AS `sts_daycode`,
 1 AS `delivery_code`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `filter_daycode_delete` AS SELECT 
 1 AS `id_costcenter`,
 1 AS `id_product`,
 1 AS `code`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_material_wip` AS SELECT 
 1 AS `no_plan`,
 1 AS `costcenter`,
 1 AS `code_material`,
 1 AS `weight`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_plan_header` AS SELECT 
 1 AS `bulan`,
 1 AS `tahun`,
 1 AS `code_material`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_plan_material` AS SELECT 
 1 AS `product`,
 1 AS `bulan`,
 1 AS `tahun`,
 1 AS `code_material`,
 1 AS `weight`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_plan_product` AS SELECT 
 1 AS `product`,
 1 AS `qty_order`,
 1 AS `qty_propose`,
 1 AS `bulan`,
 1 AS `tahun`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_plan_sum` AS SELECT 
 1 AS `product`,
 1 AS `bulan`,
 1 AS `tahun`,
 1 AS `code_material`,
 1 AS `weight`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `get_pro_plan_product` AS SELECT 
 1 AS `product`,
 1 AS `qty_order`,
 1 AS `delivery_date`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_material` (
  `id_group_material` int NOT NULL AUTO_INCREMENT,
  `group_material` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_group_material`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'Back End, Front End',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_permissions` (
  `id_group` int NOT NULL,
  `id_permission` int NOT NULL,
  PRIMARY KEY (`id_group`,`id_permission`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id_group` int NOT NULL AUTO_INCREMENT,
  `nm_group` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ket` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `st_default` tinyint(1) DEFAULT NULL COMMENT 'default group for new user',
  PRIMARY KEY (`id_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gudang_wip_per_day` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_uniq` int DEFAULT NULL,
  `kode_det` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_spk` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_so` int DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `qty_propose` int DEFAULT NULL,
  `id_gudang` int DEFAULT NULL,
  `id_costcenter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal_close` date DEFAULT NULL,
  `close_by` int DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `qc_by` int DEFAULT NULL,
  `qc_date` datetime DEFAULT NULL,
  `hist_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hardnes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `histories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `path` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ip_address` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hris_companies` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `taxid` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `image` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `city` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `province` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `country` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fax` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `homepage` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=CSV DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hris_divisions` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descr` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identitas` (
  `ididentitas` int NOT NULL AUTO_INCREMENT,
  `nm_perusahaan` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `alamat` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `kota` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `no_telp` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `gambar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ididentitas`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_ipp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `project` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `referensi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_top` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `rev` int DEFAULT '0',
  `delivery_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_country` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delivery_category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `area_destinasi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delivery_address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `shipping_method` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `packing` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `guarantee` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `instalasi_option` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `platform` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `cover_drainage` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `facade` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `ceilling` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `partition` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `fence` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `max_load` double(9,2) DEFAULT NULL,
  `min_load` double(9,2) DEFAULT NULL,
  `app_indoor` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `app_outdoor` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `sts` int NOT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `code_lv4` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `request_new_product` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipp_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_ipp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `platform` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `cover_drainage` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `facade` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `ceilling` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `partition` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `fence` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `max_load` double(9,2) DEFAULT NULL,
  `min_load` double(9,2) DEFAULT NULL,
  `app_indoor` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `app_outdoor` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `type_product` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `color` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `food_grade` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `uv` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fire_reterdant_1` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fire_reterdant_2` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fire_reterdant_3` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `standard_astm` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `standard_bs` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `standard_dnv` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `file_pendukung_1` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `file_pendukung_2` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `other_test` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `surface_concave` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `surface_flat` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `surface_chequered_flat` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `surface_anti_skid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `surface_custom` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_bom_topping` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `file_dokumen` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `nm_bom_topping` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `drawing_customer` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `product_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ipp_detail_lainnya` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `order` double(16,4) DEFAULT NULL,
  `length` double(16,4) DEFAULT NULL,
  `width` double(16,4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `japh` (
  `nomor` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl` date NOT NULL,
  `jml` double NOT NULL,
  `kdcab` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis_reff` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_reff` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `customer` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bayar_kepada` varchar(350) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_ap` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `note` varchar(350) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `valid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_valid` date DEFAULT NULL,
  `user_id` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ho_valid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `batal` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bon` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `coa` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`nomor`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jarh` (
  `nomor` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kd_pembayaran` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl` date NOT NULL,
  `jml` double NOT NULL DEFAULT '0',
  `kdcab` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `jenis_reff` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `no_reff` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `customer` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `terima_dari` varchar(350) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_ar` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `note` varchar(350) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `valid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tgl_valid` date DEFAULT NULL,
  `user_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `ho_valid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `batal` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`nomor`) USING BTREE,
  KEY `nomor` (`nomor`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `javh` (
  `nomor` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tgl` date NOT NULL,
  `jml` double NOT NULL DEFAULT '0',
  `koreksi_no` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kdcab` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `jenis` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `keterangan` varchar(350) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bulan` tinyint NOT NULL DEFAULT '0',
  `tahun` int NOT NULL DEFAULT '0',
  `user_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `memo` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_jvkoreksi` date DEFAULT NULL,
  `ho_valid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`nomor`) USING BTREE,
  KEY `nomor` (`nomor`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jenis` (
  `id_jenis` int NOT NULL,
  `nama` tinytext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jurnal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nomor` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tanggal` date DEFAULT NULL,
  `no_perkiraan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `no_reff` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `debet` double DEFAULT NULL,
  `kredit` double DEFAULT NULL,
  `nocust` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `valid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu_valid` datetime DEFAULT NULL,
  `stspos` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `jenis_jurnal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_request` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jurnal_all_menu_backup` (
  `menu_id` int NOT NULL,
  `previous_status` tinyint DEFAULT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jurnal_temp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `posisi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `amount` double(16,2) DEFAULT NULL,
  `gudang` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `kode_trans` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hub_product` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jurnal_temp_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_trans` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_material` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `price_book` double(16,2) DEFAULT NULL,
  `berat` double(16,5) DEFAULT NULL,
  `amount` double(16,2) DEFAULT NULL,
  `hub_product` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jurnaltras` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nomor` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tanggal` date DEFAULT NULL,
  `no_perkiraan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `no_reff` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `debet` double DEFAULT NULL,
  `kredit` double DEFAULT NULL,
  `nocust` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `valid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu_valid` datetime DEFAULT NULL,
  `stspos` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `jenis_jurnal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_request` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_transaksi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai_valas_debet` double(50,2) DEFAULT '0.00',
  `nilai_valas_kredit` double(50,2) DEFAULT '0.00',
  `kurs_transaksi` double(50,2) DEFAULT '0.00',
  `id_perusahaan` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_perusahaan` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jurnaltras_bayar_dp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipe` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nomor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tanggal` date DEFAULT NULL,
  `no_perkiraan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_trans` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `no_reff` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `debet` double DEFAULT NULL,
  `kredit` double DEFAULT NULL,
  `nocust` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `valid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu_valid` datetime DEFAULT NULL,
  `stspos` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `jenis_jurnal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_request` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_transaksi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jurnaltras_incoming_material` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nomor` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tanggal` date DEFAULT NULL,
  `no_perkiraan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `no_reff` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `debet` double DEFAULT NULL,
  `kredit` double DEFAULT NULL,
  `nocust` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `valid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu_valid` datetime DEFAULT NULL,
  `stspos` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `jenis_jurnal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_request` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_transaksi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jurnaltras_incoming_nonmaterial` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipe` char(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nomor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tanggal` date DEFAULT NULL,
  `no_perkiraan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jenis_trans` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `no_reff` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `debet` double DEFAULT NULL,
  `kredit` double DEFAULT NULL,
  `nocust` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `valid` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `waktu_valid` datetime DEFAULT NULL,
  `stspos` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `jenis_jurnal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_request` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jurnaltras_terima_invoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nomor` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tanggal` date DEFAULT NULL,
  `no_perkiraan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `no_reff` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `debet` double DEFAULT NULL,
  `kredit` double DEFAULT NULL,
  `nocust` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `valid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu_valid` datetime DEFAULT NULL,
  `stspos` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `jenis_jurnal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_request` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_transaksi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kabupaten` (
  `id_kab` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_prov` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` tinytext CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_jenis` int DEFAULT NULL,
  PRIMARY KEY (`id_kab`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori` (
  `id_kategori` int NOT NULL AUTO_INCREMENT,
  `nm_kategori` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id_kategori`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kecamatan` (
  `id_kec` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_kab` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kelurahan` (
  `id_kel` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_kec` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_jenis` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_kategori_paket` (
  `id_kategori_paket` int unsigned NOT NULL AUTO_INCREMENT,
  `kategori_paket` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_kategori_paket`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_konsultan_kompetensi` (
  `id_kons_komp` int unsigned NOT NULL AUTO_INCREMENT,
  `id_konsultan` int NOT NULL,
  `id_kompetensi` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_kons_komp`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_master_aktifitas` (
  `id_aktifitas` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_paket` int NOT NULL,
  `datet` date DEFAULT NULL,
  `nm_aktifitas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `harga_aktifitas` double DEFAULT NULL,
  `bobot` double DEFAULT NULL,
  `mandays` double DEFAULT NULL,
  `tahapan` int DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_kompetensi` int DEFAULT NULL,
  `unique_id` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `input_by` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_aktifitas`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_master_check_point` (
  `id_chk_point` int unsigned NOT NULL AUTO_INCREMENT,
  `id_paket` int NOT NULL,
  `id_aktifitas` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_chk_point` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `unique_id` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_chk_point`,`id_paket`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_master_kompetensi` (
  `id_kompetensi` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_kompetensi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bobot` double DEFAULT NULL,
  `datet` date NOT NULL,
  `input_by` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_kompetensi`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_master_konsultan` (
  `id_konsultan` int unsigned NOT NULL AUTO_INCREMENT,
  `nama_konsultan` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_konsultan`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_master_konsultasi_detail` (
  `id_konsultasi_d` int unsigned NOT NULL AUTO_INCREMENT,
  `id_konsultasi_h` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_aktifitas` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_aktifitas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `harga_aktifitas` double DEFAULT NULL,
  `bobot` double DEFAULT NULL,
  `mandays` double DEFAULT NULL,
  `tahapan` int DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `input_date` datetime DEFAULT NULL,
  `input_by` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_konsultasi_d`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_master_konsultasi_header` (
  `id_konsultasi_h` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_paket` int NOT NULL,
  `datet` date DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `input_by` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_konsultasi_h`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_master_paket` (
  `id_paket` int unsigned NOT NULL AUTO_INCREMENT,
  `id_kategori` int DEFAULT NULL,
  `nm_paket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `input_date` datetime DEFAULT NULL,
  `input_by` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_paket`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_quotations_header` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nomor` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_konsultasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `datet` date DEFAULT NULL,
  `customer_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `customer_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `pic_name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delivery_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delivery_area` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dpp` double DEFAULT NULL,
  `diskon` double DEFAULT NULL,
  `total_dpp` double DEFAULT NULL,
  `day` int DEFAULT NULL,
  `fee` double DEFAULT NULL,
  `exc_ppn` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `ppn` double DEFAULT NULL,
  `grand_tot` double DEFAULT NULL,
  `member_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `member_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `pono` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `podate` date DEFAULT NULL,
  `po_receive` date DEFAULT NULL,
  `file_po` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `file_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `approve_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `old_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `prev_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `revisi` int DEFAULT '0',
  `flag_so` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `noso` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tglso` date DEFAULT NULL,
  `mandays_total` double DEFAULT '0',
  `mandays_total_rate` double DEFAULT '0',
  `mandays_total_master` double DEFAULT '0',
  `mandays_total_rate_master` double DEFAULT '0',
  `uang_pesawat` double DEFAULT '0',
  `uang_saku` double DEFAULT '0',
  `uang_non_budget` double DEFAULT '0',
  `uang_komisi` double DEFAULT '0',
  `uang_komisi_eks` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_non_konsultasi` double DEFAULT '0',
  `grand_total_konsultasi` double DEFAULT '0',
  `stat_gen` enum('CLOSE','OPEN') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'OPEN',
  `reopen_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `descr` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `app_mandays_sts` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_mandays_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_mandays_date` datetime DEFAULT NULL,
  `app_mandays_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `status` enum('FAL','CNC','REC','REV','OPN') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'OPN',
  `status_customer` enum('NEW','REPEAT') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_actual_plan_tagih` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_detail_plan_tagih` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_top` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_penawaran` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `term_payment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `persen_payment` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nominal_payment` decimal(20,2) NOT NULL,
  `desc_payment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `tgl_plan_tagih` date DEFAULT NULL,
  `urutan` int DEFAULT NULL,
  `tanggal_actual_plan_tagih` date DEFAULT NULL,
  `tagih_mundur` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `alasan_mundur` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `file_surat_mundur` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `file_laporan_progress` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `macet` int DEFAULT NULL,
  `sts_invoice` int NOT NULL DEFAULT '0',
  `created_by` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran` (
  `id_quotation` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_quotation` date NOT NULL,
  `id_customer` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_customer` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_marketing` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_marketing` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_pic` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_pic` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_paket` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_paket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `upload_proposal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `grand_total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sts_cust` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_quot` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ppn` int DEFAULT NULL,
  `persen_disc` decimal(20,2) DEFAULT NULL,
  `nilai_disc` decimal(20,2) DEFAULT NULL,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `input_date` datetime NOT NULL,
  `updated_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_quotation`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran_akomodasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran_aktifitas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_aktifitas` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_aktifitas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bobot` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays` decimal(20,2) NOT NULL DEFAULT '0.00',
  `harga_aktifitas` decimal(20,2) NOT NULL DEFAULT '0.00',
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran_others` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_plan_tagih_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_penawaran` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_top` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `term_payment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `persen_payment` decimal(10,2) DEFAULT NULL,
  `nominal_payment` decimal(20,2) DEFAULT NULL,
  `desc_payment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `tgl_plan_tagih` date DEFAULT NULL,
  `urutan` int DEFAULT NULL,
  `tgl_aktual_plan_tagih` date DEFAULT NULL,
  `status_terakhir` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `sts_invoice` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `tgl_invoice` date DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_plan_tagih_header` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_spk_penawaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_penawaran` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_customer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nm_customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_project` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nm_project` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_project_leader` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nm_project_leader` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nilai_bersih_project` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan_penagihan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konter_bumbuk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kdcab` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_perkiraan` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kasbank` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nobum` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nobuk` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `prefik` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `prefik_buk` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `automaticbuk` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `konter_master_jurnal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nojv` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nobum` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nobuk` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kota` (
  `id_kota` int NOT NULL AUTO_INCREMENT,
  `id_prov` int DEFAULT NULL,
  `nama_kota` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_kota`) USING BTREE,
  KEY `id_prov` (`id_prov`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `view` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `urut` tinyint DEFAULT NULL,
  `kode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_bank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_bank` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `list_ct_full` AS SELECT 
 1 AS `id_product`,
 1 AS `nama_project`,
 1 AS `nama_product`,
 1 AS `id_costcenter`,
 1 AS `nama_costcenter`,
 1 AS `id_process`,
 1 AS `nm_process`,
 1 AS `cycletime`,
 1 AS `qty_mp`,
 1 AS `man_hours`,
 1 AS `note`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `list_ct_full_excel` AS SELECT 
 1 AS `id_product`,
 1 AS `no_bom`,
 1 AS `nama_product`,
 1 AS `id_costcenter`,
 1 AS `nama_costcenter`,
 1 AS `id_process`,
 1 AS `nm_process`,
 1 AS `cycletime`,
 1 AS `qty_mp`,
 1 AS `man_hours`,
 1 AS `note`,
 1 AS `machine`,
 1 AS `mould`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `list_cycletime` AS SELECT 
 1 AS `id_time`,
 1 AS `id_costcenter`,
 1 AS `id_product`,
 1 AS `costcenter`,
 1 AS `cycletime`,
 1 AS `mp`,
 1 AS `urut`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `list_cycletime_product` AS SELECT 
 1 AS `id_product`,
 1 AS `costcenter`,
 1 AS `id_costcenter`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `list_date_delivery` AS SELECT 
 1 AS `no_so`,
 1 AS `code_cust`,
 1 AS `delivery_date`,
 1 AS `product`,
 1 AS `qty_order`,
 1 AS `qty_delivery`,
 1 AS `qty_sisa`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `list_date_planning` AS SELECT 
 1 AS `bulan`,
 1 AS `tahun`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_help` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `group_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `data1` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `data2` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `urut` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `list_master_product` AS SELECT 
 1 AS `id_product`,
 1 AS `nama_project`,
 1 AS `nama_product`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `list_quality_control` AS SELECT 
 1 AS `id_produksi`,
 1 AS `tanggal_produksi`,
 1 AS `id_costcenter`,
 1 AS `id_product`,
 1 AS `code`,
 1 AS `remarks`,
 1 AS `ket`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_aktifitas` (
  `idlog` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `kode_universal` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `fasilitas` int DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT 'keterangan log / uraian kondisi',
  `jumlah` double DEFAULT NULL COMMENT 'jumlah nominal jika memang terdapat jumlah nominal',
  `sql` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT 'menyimpan perintah SQL yang dieksekusi\n',
  `status` tinyint(1) DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  PRIMARY KEY (`idlog`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_alokasi_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_alokasi_detail` int NOT NULL,
  `action` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `deskripsi_log` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `created_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_alokasi_detail` (`id_alokasi_detail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_transaksi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transaksi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_user` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu` datetime DEFAULT NULL,
  `reason_batal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `module` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'nama modul',
  `methode` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'nama methode',
  `username` varbinary(30) DEFAULT NULL COMMENT 'nama user yang melakukan',
  `data` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT 'data yang di kirim',
  `sql` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT 'menyimpan perintah SQL yang dieksekusi\n',
  `ip_address` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'alamat ip client/user',
  `agent` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `platform` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'device/perangkat aplikasi yang digunakan',
  `status` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '1 = success, 0 = failed',
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT 'keterangan log / uraian kondisi',
  `created_at` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_logs_created_at` (`created_at`) USING BTREE,
  KEY `idx_logs_module_created` (`module`,`created_at`) USING BTREE,
  KEY `idx_logs_status_created` (`status`,`created_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_country` (
  `id_country` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_countr` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `activation` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `created_by` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` date DEFAULT NULL,
  `modified_by` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_currency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `negara` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mata_uang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs` double DEFAULT NULL COMMENT 'Kurs ke Rupiah',
  `created_on` datetime NOT NULL,
  `modified_on` datetime NOT NULL,
  `created_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modified_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deleted` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `deleted_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_customer` (
  `id_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_category_customer` varchar(29) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_customer` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone_2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fax` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_country` int DEFAULT NULL,
  `id_prov` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_city` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `address_office` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `zip_code` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_karyawan` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_reference` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `npwp` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `vat_name` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `npwp_address` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `start_date` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `receipt_time_1` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `receipt_time_2` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reference` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `credit_limit` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `longitude` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `latitude` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_req` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pic_finance` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `day_invoice_receive` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `invoice_address` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `va_number` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_category` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_day` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `remarks` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `activation` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_category_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone_2` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `id_karyawan` int DEFAULT NULL,
  `id_prov` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_kota` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `address_office` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `zip_code` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `longitude` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `activation` enum('aktif','inaktif') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `facility` enum('DPIL','Kawasan Berikat') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_bank` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_rekening` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_rekening` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `alamat_bank` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `swift_code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `npwp` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `npwp_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `npwp_address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_term` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nominal_dp` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sisa_pembayaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `senin` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `selasa` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rabu` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kamis` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumat` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sabtu` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `minggu` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `start_recive` time DEFAULT NULL,
  `end_recive` time DEFAULT NULL,
  `adress_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `berita_acara` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `faktur` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tdp` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `real_po` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ttd_specimen` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payement_certificate` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `photo` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `siup` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spk` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delivery_order` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `need_npwp` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_kurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_currency` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `to_currency` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kurs` double(16,6) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `price_by` int DEFAULT NULL,
  `price_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_menu_erp` (
  `id_master_menu` int NOT NULL AUTO_INCREMENT COMMENT 'JV-nomorurut',
  `nama_table` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_menu` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id_master_menu`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_menu_field_erp` (
  `id_menu_field` int NOT NULL AUTO_INCREMENT,
  `nama_table` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_field` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `label` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY (`id_menu_field`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_oto_jurnal_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_master_jurnal` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `menu` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_perkiraan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `parameter_no` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `posisi` enum('D','K') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `field` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cara_insert` enum('otomatis','input') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_oto_jurnal_detail_copy1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_master_jurnal` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `menu` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_perkiraan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `parameter_no` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `posisi` enum('D','K') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `field` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cara_insert` enum('otomatis','input') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_oto_jurnal_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_master_jurnal` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' COMMENT 'JV-nomorurut',
  `nama_jurnal` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan_header` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `jenis_jurnal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `eksekusi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_oto_jurnal_header_copy1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_master_jurnal` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' COMMENT 'JV-nomorurut',
  `nama_jurnal` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan_header` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `jenis_jurnal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `eksekusi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_product_brand` (
  `id_brand` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_brand` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` date DEFAULT NULL,
  `activation` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_by` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_product_category` (
  `id_category` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_category` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `activation` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `shipping` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_supplier` (
  `id_supplier` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `supplier_location` enum('local','international') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_category_supplier` varchar(29) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_supplier` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone_2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fax` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_country` int DEFAULT NULL,
  `id_prov` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_city` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `address_office` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `zip_code` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_karyawan` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_reference` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `npwp` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `vat_name` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `npwp_address` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `start_date` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `receipt_time_1` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `receipt_time_2` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reference` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `credit_limit` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `longitude` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `latitude` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_req` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pic_finance` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `day_invoice_receive` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `invoice_address` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `va_number` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_category` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_day` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `remarks` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `activation` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_supplier_backup` (
  `id_supplier` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'SUP201805001\r\nSUP = Initial Supplier\r\n2018 = Tahun\r\n05 = Bulan\r\n001 = counter',
  `nm_supplier` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_country` char(9) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `address_office` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_currency` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `supplier_category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `product_category` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `persion` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `fax` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `website` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'Contact Person',
  `npwp` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `npwp_address` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `activation` enum('aktif','nonaktif') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'aktif',
  `created_on` datetime NOT NULL,
  `created_by` bigint NOT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `deleted_by` bigint DEFAULT NULL,
  PRIMARY KEY (`id_supplier`) USING BTREE,
  KEY `mata_uang` (`id_currency`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `master_supplier_old` (
  `id_supplier` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` date DEFAULT NULL,
  `id_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_capacity` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_business` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_product_category` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `supplier_shipping` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_supplier_office` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `address_office` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_country` int DEFAULT NULL,
  `id_prov` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `city_office` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `zip_code_office` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone_office_1` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone_office_2` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fax_office` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `owner` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `website` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `npwp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `npwp_name` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `npwp_address` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_supplier_factory` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_country_factory` int DEFAULT NULL,
  `id_prov_factory` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `city_factory` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `address_factory` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `zip_code_factory` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone_factory_1` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone_factory_2` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fax_factory` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `owner_factory` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_supplier_excompany` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_country_excompany` int DEFAULT NULL,
  `id_prov_excompany` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `city_excompany` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `address_excompany` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `zip_code_excompany` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone_excompany_1` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone_excompany_2` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fax_excompany` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `owner_excompany` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `remarks` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `agent_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `activation_factory` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `activation` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mata_uang` (
  `id_kurs` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `negara` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mata_uang` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs` double DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `modified_on` date DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` bigint DEFAULT NULL,
  `activation` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_kurs`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_planning` (
  `no_plan` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'PN2001',
  `bulan` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tahun` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`no_plan`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_planning_base_on_produksi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `so_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pr` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'base on production',
  `tgl_so` date DEFAULT NULL,
  `po_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `id_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `project` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_order` double(16,5) DEFAULT NULL,
  `qty_use_stok` double(16,5) DEFAULT NULL,
  `qty_propose` double(16,5) DEFAULT NULL,
  `tgl_dibutuhkan` date DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `booking_by` int DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `sts_req_app` int NOT NULL,
  `app_req` int NOT NULL,
  `sts_po_req` int NOT NULL,
  `app_po_req` int NOT NULL,
  `no_rev` int NOT NULL,
  `reject_status` int NOT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `metode_pembelian` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_1` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_2` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_3` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject1` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject2` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject3` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_1_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_1_date` datetime DEFAULT NULL,
  `app_2_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_2_date` datetime DEFAULT NULL,
  `app_3_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_3_date` datetime DEFAULT NULL,
  `sts_reject1_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject1_date` datetime DEFAULT NULL,
  `sts_reject2_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject2_date` datetime DEFAULT NULL,
  `sts_reject3_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject3_date` datetime DEFAULT NULL,
  `reject_reason1` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `reject_reason2` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `reject_reason3` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `keterangan_1` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `keterangan_2` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `keterangan_3` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `app_post` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rejected` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_app` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tingkat_pr` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `close_pr` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `close_pr_desc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `nilai_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nilai_pengajuan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `current_stage_no` int DEFAULT '1',
  `current_status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'active',
  `revision_no` int DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_planning_base_on_produksi_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `so_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_order` double(16,5) DEFAULT NULL,
  `stock_free` double(16,5) DEFAULT NULL,
  `use_stock` double(16,5) DEFAULT NULL,
  `min_stock` double(9,2) DEFAULT NULL,
  `max_stock` double(9,2) DEFAULT NULL,
  `propose_purchase` double(16,5) DEFAULT NULL,
  `propose_rev` double(16,5) DEFAULT NULL,
  `status_app` enum('Y','N','D') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `app_by` int DEFAULT NULL,
  `app_date` datetime DEFAULT NULL,
  `note` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `kasbon_created` int DEFAULT NULL,
  `price_ref` decimal(20,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_planning_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_plan` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'PN2001',
  `no_plan_detail` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `material` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double(9,2) DEFAULT NULL,
  `product` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_order` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_planning_footer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_plan` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'PN2001',
  `no_plan_detail` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `material` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double(9,2) DEFAULT NULL,
  `sts_purchase` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `purchase_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `no_po` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_req` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'REQ2010001',
  `bulan_awal` date DEFAULT NULL,
  `bulan_akhir` date DEFAULT NULL,
  `sum_mat` double(9,2) DEFAULT NULL,
  `status` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_request_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_req` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'REQ2010001',
  `no_req_det` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double(9,2) DEFAULT '0.00',
  `sts_purchase` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `purchase_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_date` datetime DEFAULT NULL,
  `no_pr` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_po` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_wip` (
  `no_wip` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'WIP2007001',
  `costcenter` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_awal` date DEFAULT NULL,
  `date_akhir` date DEFAULT NULL,
  `no_plan` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`no_wip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material_wip_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_wip` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'WIP2007001',
  `material` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_material` double(8,2) DEFAULT NULL,
  `unit` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_packing` double(8,2) DEFAULT NULL,
  `unit_packing` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_aktual` double(8,2) DEFAULT NULL,
  `unit_aktual` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `members` AS SELECT 
 1 AS `id`,
 1 AS `nama`,
 1 AS `nik`,
 1 AS `company_id`,
 1 AS `division_id`,
 1 AS `department_id`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'untitled link',
  `link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '#',
  `icon` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'fa fa-angle-right',
  `target` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '0 = Internal\n1 = External',
  `group_menu` int DEFAULT '0',
  `parent_id` int DEFAULT '0',
  `permission_id` int DEFAULT '1',
  `status` tinyint(1) DEFAULT '1' COMMENT '0 = Inactive\n1 = Active',
  `order` int DEFAULT NULL COMMENT 'the order of the menus',
  `created_on` datetime DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `pusat` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_bank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bank` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rekening` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coa_bank` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_brand` (
  `id_brand` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_brand` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_perusahaan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `brand_address` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_negara` int DEFAULT NULL,
  `id_profinsi` int DEFAULT NULL,
  `id_kabupaten` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_budget` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tahun` int DEFAULT NULL,
  `coa` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bulan_1` double DEFAULT '0',
  `bulan_2` double DEFAULT '0',
  `bulan_3` double DEFAULT '0',
  `bulan_4` double DEFAULT '0',
  `bulan_5` double DEFAULT '0',
  `bulan_6` double DEFAULT '0',
  `bulan_7` double DEFAULT '0',
  `bulan_8` double DEFAULT '0',
  `bulan_9` double DEFAULT '0',
  `bulan_10` double DEFAULT '0',
  `bulan_11` double DEFAULT '0',
  `bulan_12` double DEFAULT '0',
  `total` double DEFAULT '0',
  `divisi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `terpakai_bulan_1` double DEFAULT '0',
  `terpakai_bulan_2` double DEFAULT '0',
  `terpakai_bulan_3` double DEFAULT '0',
  `terpakai_bulan_4` double DEFAULT '0',
  `terpakai_bulan_5` double DEFAULT '0',
  `terpakai_bulan_6` double DEFAULT '0',
  `terpakai_bulan_7` double DEFAULT '0',
  `terpakai_bulan_8` double DEFAULT '0',
  `terpakai_bulan_9` double DEFAULT '0',
  `terpakai_bulan_10` double DEFAULT '0',
  `terpakai_bulan_11` double DEFAULT '0',
  `terpakai_bulan_12` double DEFAULT '0',
  `terpakai` double DEFAULT '0',
  `sisa` double DEFAULT '0',
  `info` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `finance_bulan` double DEFAULT '0',
  `finance_tahun` double DEFAULT '0',
  `kategori` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `revisi` smallint DEFAULT '0',
  `status` smallint DEFAULT '0',
  `created_by_dept` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on_dept` datetime DEFAULT NULL,
  `revision_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `revision_on` datetime DEFAULT NULL,
  `jenis` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `variabel_coa` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `definisi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_budget3` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tahun` int DEFAULT NULL,
  `coa` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bulan_1` double DEFAULT '0',
  `bulan_2` double DEFAULT '0',
  `bulan_3` double DEFAULT '0',
  `bulan_4` double DEFAULT '0',
  `bulan_5` double DEFAULT '0',
  `bulan_6` double DEFAULT '0',
  `bulan_7` double DEFAULT '0',
  `bulan_8` double DEFAULT '0',
  `bulan_9` double DEFAULT '0',
  `bulan_10` double DEFAULT '0',
  `bulan_11` double DEFAULT '0',
  `bulan_12` double DEFAULT '0',
  `total` double DEFAULT '0',
  `divisi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `terpakai_bulan_1` double DEFAULT '0',
  `terpakai_bulan_2` double DEFAULT '0',
  `terpakai_bulan_3` double DEFAULT '0',
  `terpakai_bulan_4` double DEFAULT '0',
  `terpakai_bulan_5` double DEFAULT '0',
  `terpakai_bulan_6` double DEFAULT '0',
  `terpakai_bulan_7` double DEFAULT '0',
  `terpakai_bulan_8` double DEFAULT '0',
  `terpakai_bulan_9` double DEFAULT '0',
  `terpakai_bulan_10` double DEFAULT '0',
  `terpakai_bulan_11` double DEFAULT '0',
  `terpakai_bulan_12` double DEFAULT '0',
  `terpakai` double DEFAULT '0',
  `sisa` double DEFAULT '0',
  `info` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `finance_bulan` double DEFAULT '0',
  `finance_tahun` double DEFAULT '0',
  `kategori` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `revisi` smallint DEFAULT '0',
  `status` smallint DEFAULT '0',
  `created_by_dept` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on_dept` datetime DEFAULT NULL,
  `revision_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `revision_on` datetime DEFAULT NULL,
  `jenis` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `variabel_coa` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `definisi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_budget_rutin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `departement` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `coa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai` double DEFAULT '0',
  `keterangan` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `alokasi` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `kode_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `masa_berlaku` int unsigned NOT NULL DEFAULT '0' COMMENT '0 = Selalu, n = Terbatas n kali',
  `masa_awal` int unsigned NOT NULL DEFAULT '0' COMMENT 'Sudah dibayar sebelum sistem',
  `aktif` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_budget_rutin_alokasi` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `kode` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `coa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai` double DEFAULT '0',
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `departement` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_coa_aset` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coa` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_aset` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `divisi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tahun` int DEFAULT NULL,
  `bulan` int DEFAULT NULL,
  `budget` double DEFAULT '0',
  `terpakai` double DEFAULT '0',
  `sisa` double DEFAULT '0',
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `budgetpr` double DEFAULT '0',
  `budgetpo` double DEFAULT '0',
  `qty` double DEFAULT '0',
  `status_appr` int DEFAULT '0',
  `alasan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deskripsi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `coa_akum` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `costcenter` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_coa_budget` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tahun` int DEFAULT NULL,
  `coa` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bulan_1` double DEFAULT '0',
  `bulan_2` double DEFAULT '0',
  `bulan_3` double DEFAULT '0',
  `bulan_4` double DEFAULT '0',
  `bulan_5` double DEFAULT '0',
  `bulan_6` double DEFAULT '0',
  `bulan_7` double DEFAULT '0',
  `bulan_8` double DEFAULT '0',
  `bulan_9` double DEFAULT '0',
  `bulan_10` double DEFAULT '0',
  `bulan_11` double DEFAULT '0',
  `bulan_12` double DEFAULT '0',
  `total` double DEFAULT '0',
  `terpakai` double DEFAULT NULL,
  `sisa` double DEFAULT '0',
  `tipe_pr` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `info` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `divisi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `terpakai_bulan_1` decimal(10,0) DEFAULT '0',
  `terpakai_bulan_2` decimal(10,0) DEFAULT '0',
  `terpakai_bulan_3` decimal(10,0) DEFAULT '0',
  `terpakai_bulan_4` decimal(10,0) DEFAULT '0',
  `terpakai_bulan_5` decimal(10,0) DEFAULT '0',
  `terpakai_bulan_6` decimal(10,0) DEFAULT '0',
  `terpakai_bulan_7` decimal(10,0) DEFAULT '0',
  `terpakai_bulan_8` decimal(10,0) DEFAULT '0',
  `terpakai_bulan_9` decimal(10,0) DEFAULT '0',
  `terpakai_bulan_10` decimal(10,0) DEFAULT '0',
  `terpakai_bulan_11` decimal(10,0) DEFAULT '0',
  `terpakai_bulan_12` decimal(10,0) DEFAULT '0',
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_coa_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `coa` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_costcenter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dept` tinyint DEFAULT NULL,
  `id_costcenter` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_costcenter` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `urut` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `urut2` int DEFAULT NULL,
  `sts_warehouse` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `manpower` tinyint DEFAULT NULL,
  `karyawan` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `shift1` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `shift2` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `shift3` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `mp_1` tinyint DEFAULT NULL,
  `mp_2` tinyint DEFAULT NULL,
  `mp_3` tinyint DEFAULT NULL,
  `deleted` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted_by` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_on` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_costcenter` (`id_costcenter`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ms_department` AS SELECT 
 1 AS `id`,
 1 AS `nama`,
 1 AS `deleted_by`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_diskon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tingkatan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `diskon_awal` double(50,2) DEFAULT NULL,
  `diskon_akhir` double(50,2) DEFAULT NULL,
  `approved_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted` int DEFAULT '0',
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_estimasi_beli` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_material` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga_beli` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga_jual` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_type` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_material` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktif` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec3` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec4` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec5` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec6` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec7` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec8` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec9` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec10` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec11` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec12` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec13` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec14` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec15` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_generate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `info` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `info2` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `info3` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `info4` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_generate_jurnal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `info` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tahun` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bulan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `angka` int DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_hari` (
  `id_hari` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `day_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `day_en` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_inventory_category1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_category1` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_type` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `urut` int DEFAULT NULL,
  `aktif` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_inventory_category2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_category2` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_type` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_category1` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `length` double(20,2) DEFAULT '0.00',
  `high` double(20,2) DEFAULT '0.00',
  `wide` double(20,2) DEFAULT NULL,
  `cub` double(20,7) DEFAULT '0.0000000',
  `per_box` int DEFAULT NULL,
  `group_packing` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight_per_product` double(20,2) DEFAULT '0.00',
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktif` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `ck_produksi` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id_category2` (`id_category2`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_inventory_category3` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_category3` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_type` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_category1` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_category2` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktif` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_inventory_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_type` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktif` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_invoice_coa_mapping` (
  `source_company_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `owner_company_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `accounts` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`source_company_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_invoice_sequence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_entitas` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'STM / VSB / SSC',
  `tahun` year NOT NULL,
  `last_sequence` int NOT NULL DEFAULT '0' COMMENT 'Nomor terakhir yang sudah terpakai',
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_entitas_tahun` (`kode_entitas`,`tahun`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_karyawan` (
  `id_karyawan` int NOT NULL AUTO_INCREMENT COMMENT 'id karyawan hanya untuk konsumsi komputer dan programmer',
  `nik` varchar(16) CHARACTER SET latin2 COLLATE latin2_general_ci DEFAULT NULL COMMENT 'nomor induk karyawan',
  `nama_karyawan` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'nama lengkap karyawan',
  `tempat_lahir_karyawan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'tempat lahir',
  `tanggal_lahir_karyawan` date DEFAULT NULL COMMENT 'tanggal lahir',
  `divisi` int DEFAULT NULL COMMENT 'Divisi karyawan bekerja',
  `jenis_kelamin` enum('L','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'L' COMMENT 'L laki-laki, P Perempuan',
  `agama` int DEFAULT NULL COMMENT 'agama kepercayaan',
  `levelpendidikan` enum('SD','SMP','SMA','DIPLOMA','SARJANA','MASTER','DOKTORAL','PROFESOR','LAIN-LAIN') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'Level Pendidikan',
  `alamataktif` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'alamat tempat yang ditinggali',
  `nohp` varchar(18) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'nomor telepon seluler',
  `npwp` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'nomor npwp pribadi',
  `email` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_join` date DEFAULT NULL,
  `tgl_end` date DEFAULT NULL,
  `sts_karyawan` enum('Tetap','Kontrak') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `norekening` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_aktif` enum('aktif','nonaktif') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'aktif' COMMENT 'status customer aktif atau tidak',
  `created_on` datetime DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `deleted_by` bigint DEFAULT NULL,
  `kdcab` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_karyawan`) USING BTREE,
  KEY `FK_datak_pendidikan` (`levelpendidikan`) USING BTREE,
  KEY `Index_8` (`nama_karyawan`,`tanggal_lahir_karyawan`) USING BTREE,
  KEY `divisi` (`divisi`) USING BTREE,
  CONSTRAINT `ms_karyawan_ibfk_1` FOREIGN KEY (`divisi`) REFERENCES `divisi` (`id_divisi`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code_material` char(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_company` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_material` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `satuan_packing` int DEFAULT NULL,
  `konversi` double(9,2) DEFAULT NULL,
  `unit` int DEFAULT NULL,
  `begin_balance` double(9,2) DEFAULT NULL,
  `incoming` double(9,2) DEFAULT NULL,
  `outgoing` double(9,2) DEFAULT NULL,
  `ending_balance` double(9,2) DEFAULT NULL,
  `unit_fisik` double(9,2) DEFAULT NULL,
  `kelompok` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `id_type` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_material_konversi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_material` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_satuan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_satuan` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `konversi` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan_konversi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `default_satuan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktif` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_material_sejenis` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_material` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_material_sejenis` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktif` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_material_supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_material` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_supplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_alt_supplier` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktif` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_periodik_counter` (
  `kode` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'BP, BG, atau PI',
  `periode` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'YYMM untuk BP/BG, YYYY untuk PI',
  `last_no` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`kode`,`periode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_petty_cash` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_budget` decimal(15,0) NOT NULL DEFAULT '0' COMMENT 'SUM of detail nominals (redundant)',
  `approver` int NOT NULL COMMENT 'FK to users.id_user',
  `created_by` int DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_petty_cash_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `petty_cash_id` int NOT NULL COMMENT 'FK to ms_petty_cash.id',
  `coa_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'FK to coa_master.no_perkiraan',
  `jenis_pengeluaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Deskripsi jenis pengeluaran',
  `nominal` decimal(15,0) NOT NULL COMMENT 'Budget amount for this COA',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_petty_cash_id` (`petty_cash_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_price_ref_mp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `element_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `element_cost` decimal(10,0) DEFAULT '0',
  `element_unit` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `element_in_hour` decimal(10,0) DEFAULT '0',
  `element_use` decimal(10,0) DEFAULT NULL,
  `element_info` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_price_ref_others` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `element_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `element_cost` decimal(10,0) DEFAULT '0',
  `element_unit` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `element_tipe` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `element_info` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `element_kurs` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_process` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nm_process` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_satuan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` enum('unit','packing') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'unit',
  `code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_shift` (
  `id_shift` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name_shift` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_divisi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `type_shift` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_day` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `start_work` time DEFAULT NULL,
  `start_break1` time DEFAULT NULL,
  `done_break1` time DEFAULT NULL,
  `start_break2` time DEFAULT NULL,
  `done_break2` time DEFAULT NULL,
  `start_break3` time DEFAULT NULL,
  `done_break3` time DEFAULT NULL,
  `done_work` time DEFAULT NULL,
  `deleted` enum('1','0') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_tipe_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_type` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktif` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_top` (
  `id_top` int NOT NULL AUTO_INCREMENT,
  `nama_top` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `created_by` bigint DEFAULT NULL,
  `modified_by` bigint DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `deleted_by` bigint DEFAULT NULL,
  PRIMARY KEY (`id_top`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_type_shift` (
  `id_type_shift` int NOT NULL AUTO_INCREMENT,
  `name_type_shift` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1',
  PRIMARY KEY (`id_type_shift`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_warehouse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `wh_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `wh_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `wh_info` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `wh_io` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `wh_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime(6) DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_warehouse_stock` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_material` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `stock` decimal(20,0) DEFAULT NULL,
  `harga` decimal(20,0) DEFAULT NULL,
  `satuan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `wh_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `modified_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_warehouse_stock_bulanan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_material` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `stock` decimal(20,0) DEFAULT NULL,
  `harga` decimal(20,0) DEFAULT NULL,
  `satuan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `wh_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bulan` int DEFAULT NULL,
  `tahun` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_warehouse_stock_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_material` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `stock_awal` decimal(20,0) DEFAULT NULL,
  `stock_in` decimal(20,0) DEFAULT NULL,
  `stock_out` decimal(20,0) DEFAULT NULL,
  `stock_akhir` decimal(20,0) DEFAULT NULL,
  `harga` decimal(20,0) DEFAULT NULL,
  `satuan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `doc_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `wh_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `negara` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_negara` varchar(2) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `nm_negara` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_negara` (`id_negara`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_inventory_1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv1` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_inventory_2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv1` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv2` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_inventory_3` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv1` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv2` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv3` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_inventory_4` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv1` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv2` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv3` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv4` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_auto` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `trade_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_unit` int DEFAULT NULL,
  `id_unit_packing` int DEFAULT NULL,
  `konversi` double(16,2) DEFAULT NULL,
  `id_unit_other` int DEFAULT NULL,
  `konversi_other` double(16,2) DEFAULT NULL,
  `max_stok` double(16,2) DEFAULT NULL,
  `min_stok` double(16,2) DEFAULT NULL,
  `file_msds` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `status` int DEFAULT '1',
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `length` double(20,2) DEFAULT '0.00',
  `high` double(20,2) DEFAULT '0.00',
  `wide` double(20,2) DEFAULT NULL,
  `cub` double(20,7) DEFAULT '0.0000000',
  `price_ref` double(16,6) DEFAULT NULL,
  `price_ref_usd` double(16,6) DEFAULT NULL,
  `price_ref_high` double(16,6) DEFAULT NULL,
  `price_ref_high_usd` double(16,6) DEFAULT NULL,
  `price_ref_date` date DEFAULT NULL,
  `price_ref_expired` int DEFAULT NULL,
  `note` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `upload_file` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `status_app` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `app_by` int DEFAULT NULL,
  `app_date` datetime DEFAULT NULL,
  `price_ref_new` double(16,6) DEFAULT NULL,
  `price_ref_new_usd` double(16,6) DEFAULT NULL,
  `price_ref_high_new` double(16,6) DEFAULT NULL,
  `price_ref_high_new_usd` double(16,6) DEFAULT NULL,
  `price_ref_new_date` date DEFAULT NULL,
  `price_ref_new_expired` int DEFAULT NULL,
  `status_reject` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `price_ref_use` double(16,6) DEFAULT NULL,
  `price_ref_use_usd` double(16,6) DEFAULT NULL,
  `price_ref_date_use` date DEFAULT NULL,
  `price_ref_expired_use` int DEFAULT NULL,
  `id_supplier` int DEFAULT NULL,
  `id_supplier2` int DEFAULT NULL,
  `id_kurs` int DEFAULT NULL,
  `kurs` decimal(16,6) DEFAULT NULL,
  `request` double(16,4) DEFAULT NULL,
  `tgl_dibutuhkan` date DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_supplier` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_country` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_provinsi` int DEFAULT NULL,
  `id_currency` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telp2` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fax` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email3` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `contact` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `contact_person` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tax_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `tax_address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `note` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bank_account` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `new_table` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_non_po` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_pr` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `no_pr` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `jenis_pr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_pic` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_pic` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `total_pr` decimal(20,2) DEFAULT NULL,
  `sts` enum('0','1','2','3') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `reject_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `approved_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `rejected_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `rejected_date` datetime DEFAULT NULL,
  `created_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameter` (
  `ppn` float DEFAULT NULL,
  `pph` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pastibisa_tb_cabang` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `nocab` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `subcab` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `cabang` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `area` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `spkid` int NOT NULL DEFAULT '0',
  `kdcab` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nofak` int NOT NULL DEFAULT '0',
  `nocust` int NOT NULL DEFAULT '0',
  `nosales` int NOT NULL DEFAULT '0',
  `notetap` int NOT NULL DEFAULT '0',
  `lastupdate` date NOT NULL,
  `kepala` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `alamat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `namacabang` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kabeng` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kabagjualan` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kepalacabang` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `admcabang` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `gudang` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kku` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `automaticbum` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nobum` bigint DEFAULT NULL,
  `kertas` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kota` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nobuk` bigint DEFAULT NULL,
  `nocn` bigint DEFAULT NULL,
  `automaticbuk` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `automaticcn` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `automaticjv` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `prefixfaktur` varchar(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `noJS` bigint NOT NULL DEFAULT '0',
  `noJP` bigint NOT NULL DEFAULT '0',
  `noJO` bigint NOT NULL DEFAULT '0',
  `noJC` bigint NOT NULL DEFAULT '0',
  `noJM` bigint NOT NULL DEFAULT '0',
  `noJD` bigint NOT NULL DEFAULT '0',
  `nomorJS` bigint NOT NULL DEFAULT '0',
  `nomorJP` bigint NOT NULL DEFAULT '0',
  `nomorJO` bigint NOT NULL DEFAULT '0',
  `nomorJC` bigint NOT NULL DEFAULT '0',
  `nomorJM` bigint NOT NULL DEFAULT '0',
  `nomorJD` bigint NOT NULL DEFAULT '0',
  `kpsurat` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `perusahaan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_kwitansi` int DEFAULT '0',
  `dealercodelb` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `dealercode` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `dealercode2` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nosementara` int NOT NULL DEFAULT '0',
  `tandajadi` double NOT NULL DEFAULT '0',
  `tandajadikredit` double NOT NULL DEFAULT '0',
  `stsnomor` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nocetak` int NOT NULL DEFAULT '0',
  `prod` int NOT NULL DEFAULT '0',
  `jmlstall` int NOT NULL DEFAULT '0',
  `qtymekanikminggu` int NOT NULL DEFAULT '0',
  `company` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `donumber` int NOT NULL DEFAULT '0',
  `ponumber` int NOT NULL DEFAULT '0',
  `nolpb` int NOT NULL DEFAULT '0',
  `fakturpajak` int NOT NULL DEFAULT '0',
  `prefikpajak` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_approve` (
  `id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_doc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_doc` date DEFAULT NULL,
  `keperluan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `tipe` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumlah` double DEFAULT '0',
  `status` smallint DEFAULT '0' COMMENT '0: baru\\n1:approve\\n2:selesai',
  `tanggal` date DEFAULT NULL,
  `bank_coa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_nilai` double DEFAULT '0',
  `bank_admin` double DEFAULT '0',
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
  `pay_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pay_on` datetime DEFAULT NULL,
  `doc_file` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `doc_file_2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accnumber` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ids` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_request` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_checker` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_checker_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_checker_date` datetime DEFAULT NULL,
  `currency` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `admin_bank` decimal(20,2) NOT NULL,
  `link_doc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_payment` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_bayar` date DEFAULT NULL,
  `supplier` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `keterangan_pembayaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `coa_bank` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_coa_bank` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mata_uang` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_bank` decimal(20,2) NOT NULL,
  `total_payment` decimal(20,2) NOT NULL,
  `selisih` decimal(20,2) NOT NULL,
  `total_pph` decimal(20,2) NOT NULL,
  `total_ppn` decimal(20,2) NOT NULL,
  `tipe_pph` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_supplier` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_supplier` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `kurs_payment` decimal(20,2) NOT NULL DEFAULT '0.00',
  `deleted` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_approve_details` (
  `id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `payment_id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_doc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_doc` date DEFAULT NULL,
  `deskripsi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `harga` double DEFAULT '0',
  `total` double DEFAULT '0',
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `doc_file` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `coa` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `app_checker` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_checker_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_checker_date` datetime DEFAULT NULL,
  `currency` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `admin_bank` decimal(20,2) NOT NULL,
  `link_doc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periode` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `noJS` int DEFAULT '0',
  `noJP` int DEFAULT '0',
  `noJO` int DEFAULT '0',
  `noJC` int DEFAULT '0',
  `noJM` int DEFAULT '0',
  `noJD` int DEFAULT '0',
  `open_date` date DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `user` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `stsaktif` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `stspost` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `stslock` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `kdcab` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `post_laba` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `company` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  PRIMARY KEY (`id`,`periode`,`kdcab`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id_permission` int NOT NULL AUTO_INCREMENT,
  `nm_permission` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ket` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_menu` int DEFAULT NULL,
  `nm_menu` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_permission`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pr_on_progress` AS SELECT 
 1 AS `id`,
 1 AS `id_material`,
 1 AS `qty_pr`,
 1 AS `idpr`,
 1 AS `qty_po`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pusat` double(16,2) DEFAULT NULL,
  `subgudang` double(16,2) DEFAULT NULL,
  `produksi` double(16,2) DEFAULT NULL,
  `price_book` double(16,2) DEFAULT NULL,
  `status` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `delivery` double(16,2) DEFAULT NULL,
  `delivery_proposional` double(16,2) DEFAULT NULL,
  `incoming` double(16,2) DEFAULT NULL,
  `price` double(16,2) DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `kode_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_material` (`id_material`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_book_produksi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pusat` double(16,2) DEFAULT NULL,
  `subgudang` double(16,2) DEFAULT NULL,
  `produksi` double(16,2) DEFAULT NULL,
  `price_book` double(16,2) DEFAULT NULL,
  `status` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `delivery` double(16,2) DEFAULT NULL,
  `delivery_proposional` double(16,2) DEFAULT NULL,
  `incoming` double(16,2) DEFAULT NULL,
  `price` double(16,2) DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `kode_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_material` (`id_material`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_book_subgudang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pusat` double(16,2) DEFAULT NULL,
  `subgudang` double(16,2) DEFAULT NULL,
  `produksi` double(16,2) DEFAULT NULL,
  `price_book` double(16,2) DEFAULT NULL,
  `status` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `delivery` double(16,2) DEFAULT NULL,
  `delivery_proposional` double(16,2) DEFAULT NULL,
  `incoming` double(16,2) DEFAULT NULL,
  `price` double(16,2) DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `kode_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_material` (`id_material`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `price_ref` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `unit_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rate` double(20,2) DEFAULT NULL,
  `rate_fitting` double(20,2) DEFAULT NULL,
  `sts_price` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `type_material` enum('FITTING SUPPLY','ORI','JAPAN','NONE') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NONE',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id_product` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_kategori` int DEFAULT NULL,
  `id_sub_kategori` int DEFAULT NULL,
  `product_name` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hardnes` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `surface` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `thicknes` float DEFAULT '0',
  `width` int DEFAULT '0',
  `form` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `unit_coil` int DEFAULT '0',
  `density` float DEFAULT NULL,
  `length` int DEFAULT '0',
  `weight` int DEFAULT '0',
  `unit` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Kg',
  `id_currency` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'USD',
  `price` bigint DEFAULT '0',
  `status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT '0',
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT '0',
  `modified_on` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT '0',
  `deleted_on` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `deleted` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  PRIMARY KEY (`id_product`) USING BTREE,
  KEY `id_kategori` (`id_kategori`) USING BTREE,
  KEY `id_sub_kategori` (`id_sub_kategori`) USING BTREE,
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `product_ibfk_2` FOREIGN KEY (`id_sub_kategori`) REFERENCES `sub_kategori` (`id_sub_kategori`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv1` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `product_type` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `code_lv2` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `product_category` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `code_lv3` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `product_jenis` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `code_lv4` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `product_master` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `berat_material` double(16,4) DEFAULT NULL,
  `price_material` double(16,4) DEFAULT NULL,
  `price_man_power` double(16,4) DEFAULT NULL,
  `price_machine` double(16,4) DEFAULT NULL,
  `price_total` double(16,4) DEFAULT NULL,
  `update_by` int DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `rate_cycletime` double(16,4) DEFAULT NULL,
  `rate_cycletime_machine` double(16,4) DEFAULT NULL,
  `rate_man_power_usd` double(16,4) DEFAULT NULL,
  `rate_man_power_idr` double(16,4) DEFAULT NULL,
  `rate_depresiasi` double(16,4) DEFAULT NULL,
  `rate_mould` double(16,4) DEFAULT NULL,
  `cost_material` double(16,4) DEFAULT NULL,
  `cost_product_assembly` double(16,4) DEFAULT NULL,
  `cost_persen_indirect` decimal(10,4) DEFAULT NULL,
  `cost_persen_consumable` decimal(10,4) DEFAULT NULL,
  `cost_persen_packing` decimal(10,4) DEFAULT NULL,
  `cost_persen_enginnering` decimal(10,4) DEFAULT NULL,
  `cost_persen_foh` decimal(10,4) DEFAULT NULL,
  `cost_persen_fin_adm` decimal(10,4) DEFAULT NULL,
  `cost_persen_mkt_sales` decimal(10,4) DEFAULT NULL,
  `cost_persen_interest` decimal(10,4) DEFAULT NULL,
  `cost_persen_profit` decimal(10,4) DEFAULT NULL,
  `cost_bottom_price` double(16,4) DEFAULT NULL,
  `cost_factor_kompetitif` decimal(10,4) DEFAULT NULL,
  `cost_nego_allowance` decimal(10,4) DEFAULT NULL,
  `cost_price_final` double(16,4) DEFAULT NULL,
  `cost_direct_labout` double(16,4) DEFAULT NULL,
  `cost_indirect` double(16,4) DEFAULT NULL,
  `cost_machine` double(16,4) DEFAULT NULL,
  `cost_mould` double(16,4) DEFAULT NULL,
  `cost_consumable` double(16,4) DEFAULT NULL,
  `cost_packing` double(16,4) DEFAULT NULL,
  `cost_transport` double(16,4) DEFAULT NULL,
  `cost_enginnering` double(16,4) DEFAULT NULL,
  `cost_foh` double(16,4) DEFAULT NULL,
  `cost_fin_adm` double(16,4) DEFAULT NULL,
  `cost_mkt_sales` double(16,4) DEFAULT NULL,
  `cost_interest` double(16,4) DEFAULT NULL,
  `cost_profit` double(16,4) DEFAULT NULL,
  `cost_bottom_selling` double(16,4) DEFAULT NULL,
  `cost_allowance` double(16,4) DEFAULT NULL,
  `pengajuan_price_list` double(16,4) DEFAULT NULL,
  `price_list` double(16,4) DEFAULT NULL,
  `price_list_idr` double(16,4) DEFAULT NULL,
  `status` enum('N','WA','A','R') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `status_by` int DEFAULT NULL,
  `status_date` datetime DEFAULT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `kurs` double(16,4) DEFAULT NULL,
  `price_idr` double(16,4) DEFAULT NULL,
  `price_persen_orindo` double(16,4) DEFAULT NULL,
  `price_list_idr_orindo` double(16,4) DEFAULT NULL,
  `ct_setting` double(16,4) DEFAULT NULL,
  `ct_produksi` double(16,4) DEFAULT NULL,
  `ct_moq` double(16,4) DEFAULT NULL,
  `berat_per_kg` double(16,4) DEFAULT NULL,
  `waste_set_resin` double(16,4) DEFAULT NULL,
  `waste_set_glass` double(16,4) DEFAULT NULL,
  `bom_moq` double(16,4) DEFAULT NULL,
  `biaya_setting_mp` double(16,4) DEFAULT NULL,
  `biaya_setting_mesin` double(16,4) DEFAULT NULL,
  `biaya_waste_set_mat` double(16,4) DEFAULT NULL,
  `biaya_total_setting` double(16,4) DEFAULT NULL,
  `charge_setting_bom` double(16,4) DEFAULT NULL,
  `charge_setting_ct` double(16,4) DEFAULT NULL,
  `qty_man_power` double(16,4) DEFAULT NULL,
  `berat_waste` double(16,4) DEFAULT NULL,
  `sts_logistik` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `logistik_by` int DEFAULT NULL,
  `logistik_date` datetime DEFAULT NULL,
  `ass_single_product` double(16,4) DEFAULT NULL,
  `ass_cutting` double(16,4) DEFAULT NULL,
  `ass_mat_joint` double(16,4) DEFAULT NULL,
  `ass_flat_sheet` double(16,4) DEFAULT NULL,
  `ass_end_plate` double(16,4) DEFAULT NULL,
  `ass_chequered_plate` double(16,4) DEFAULT NULL,
  `ass_mat_single_product` double(16,4) DEFAULT NULL,
  `ass_mat_cutting` double(16,4) DEFAULT NULL,
  `ass_mat_mat_joint` double(16,4) DEFAULT NULL,
  `ass_mat_flat_sheet` double(16,4) DEFAULT NULL,
  `ass_mat_end_plate` double(16,4) DEFAULT NULL,
  `ass_mat_chequered_plate` double(16,4) DEFAULT NULL,
  `ass_mat_others` double(16,4) DEFAULT NULL,
  `ass_others` double(16,4) DEFAULT NULL,
  `total_price_uj` double(16,4) DEFAULT NULL,
  `total_idr_uj` double(16,4) DEFAULT NULL,
  `selisih_uj` double(16,4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price_assembly` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `category` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `product_price` double(16,4) DEFAULT NULL,
  `product_qty` double(16,4) DEFAULT NULL,
  `rate_cycletime` double(16,4) DEFAULT NULL,
  `rate_cycletime_machine` double(16,4) DEFAULT NULL,
  `rate_man_power_usd` double(16,4) DEFAULT NULL,
  `rate_man_power_idr` double(16,4) DEFAULT NULL,
  `rate_depresiasi` double(16,4) DEFAULT NULL,
  `rate_mould` double(16,4) DEFAULT NULL,
  `cost_material` double(16,4) DEFAULT NULL,
  `price_material` double(16,4) DEFAULT NULL,
  `ct_setting` double(16,4) DEFAULT NULL,
  `ct_produksi` double(16,4) DEFAULT NULL,
  `ct_moq` double(16,4) DEFAULT NULL,
  `berat_per_kg` double(16,4) DEFAULT NULL,
  `waste_set_resin` double(16,4) DEFAULT NULL,
  `waste_set_glass` double(16,4) DEFAULT NULL,
  `bom_moq` double(16,4) DEFAULT NULL,
  `biaya_setting_mp` double(16,4) DEFAULT NULL,
  `biaya_setting_mesin` double(16,4) DEFAULT NULL,
  `biaya_waste_set_mat` double(16,4) DEFAULT NULL,
  `biaya_total_setting` double(16,4) DEFAULT NULL,
  `charge_setting_bom` double(16,4) DEFAULT NULL,
  `charge_setting_ct` double(16,4) DEFAULT NULL,
  `qty_man_power` double(16,4) DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price_bom_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'default',
  `no_bom` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_bom_detail` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_material` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double(16,5) DEFAULT NULL,
  `persen` double(9,2) DEFAULT NULL,
  `persen_add` double(9,2) DEFAULT NULL,
  `length` double(16,4) DEFAULT NULL,
  `width` double(16,4) DEFAULT NULL,
  `qty` double(16,4) DEFAULT NULL,
  `m2` double(16,4) DEFAULT NULL,
  `file_upload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pengurangan_additive` double(16,5) DEFAULT NULL,
  `berat_bersih` double(16,5) DEFAULT NULL,
  `price_ref` double(16,3) DEFAULT NULL,
  `total_price` double(16,3) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price_bom_detail_custom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_bom` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_bom_detail` char(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_material` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_material` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `weight` double(16,5) DEFAULT NULL,
  `persen` double(9,2) DEFAULT NULL,
  `pengurangan_additive` double(16,5) DEFAULT NULL,
  `berat_bersih` double(16,5) DEFAULT NULL,
  `price_ref` double(16,3) DEFAULT NULL,
  `total_price` double(16,3) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_price_ukuran_jadi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_ukuran` int DEFAULT NULL,
  `qty` double(16,2) DEFAULT NULL,
  `width` double(16,2) DEFAULT NULL,
  `length` double(16,2) DEFAULT NULL,
  `price_unit` double(16,2) DEFAULT NULL,
  `total_price` double(16,2) DEFAULT NULL,
  `app_price` decimal(16,2) DEFAULT NULL,
  `persen_orindo` decimal(16,2) DEFAULT NULL,
  `harga_idr_orindo` decimal(16,2) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produksi_planning` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_plan` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'PR20001',
  `costcenter` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_awal` date DEFAULT NULL,
  `date_akhir` date DEFAULT NULL,
  `sts_plan` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `costcenter` (`costcenter`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produksi_planning_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_plan` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'PN2001',
  `no_plan_detail` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `product` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_order` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `shortages` int DEFAULT NULL,
  `queue` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `man_power` int DEFAULT NULL,
  `cycletime` int DEFAULT NULL,
  `mp_ct` int DEFAULT NULL,
  `sts_wip` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `no_wip` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'WIP2007001',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `no_plan` (`no_plan`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produksi_planning_footer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_plan` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'PN200001',
  `no_plan_detail` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  `category` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` double(15,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `no_plan` (`no_plan`,`date`,`category`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proses_cost` (
  `id_proses` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `item_cost` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `std_calculation` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `std_sate` float DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id_proses`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provinsi` (
  `id_prov` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_negara` int DEFAULT NULL,
  `nama` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `activation` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `urut` int DEFAULT NULL,
  `country_code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'IDN',
  KEY `id_prov` (`id_prov`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provinsi_backup` (
  `id_prov` int NOT NULL,
  `id_negara` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` tinytext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `activation` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_prov`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quotation_header` (
  `id_quotation` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_customer` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_category` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_marketing` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_pic` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date_quotation` date DEFAULT NULL,
  `exclude_ppn` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fee` int NOT NULL DEFAULT '0',
  `total_dpp` int NOT NULL DEFAULT '0',
  `ppn` int NOT NULL DEFAULT '0',
  `grand_total` int NOT NULL DEFAULT '0',
  `status` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id_quotation`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate_delivery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_country` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `shipping_method` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `transport_type` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `area_tujuan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `price` decimal(16,2) DEFAULT NULL,
  `price_usd` decimal(16,2) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `id_kurs` int DEFAULT NULL,
  `kurs` double(16,2) DEFAULT NULL,
  `kurs_tanggal` date DEFAULT NULL,
  `kurs_by` int DEFAULT NULL,
  `kurs_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate_machine` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_mesin` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kapasitas` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_unit` int DEFAULT NULL,
  `harga_mesin` double(16,2) DEFAULT NULL,
  `harga_mesin_usd` double(16,2) DEFAULT NULL,
  `est_manfaat` int DEFAULT NULL,
  `depresiasi_bulan` double(16,2) DEFAULT NULL,
  `used_hour_month` double(16,2) DEFAULT NULL,
  `biaya_mesin` double(16,2) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `id_kurs` int DEFAULT NULL,
  `kurs` double(16,2) DEFAULT NULL,
  `kurs_tanggal` date DEFAULT NULL,
  `kurs_by` int DEFAULT NULL,
  `kurs_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate_man_power` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `total_direct` double(16,2) DEFAULT NULL,
  `total_bpjs` double(16,2) DEFAULT NULL,
  `total_biaya_lain` double(16,2) DEFAULT NULL,
  `id_kurs` int DEFAULT NULL,
  `rate_dollar` double(16,2) DEFAULT NULL,
  `kurs_tanggal` date DEFAULT NULL,
  `upah_per_bulan_dollar` double(16,2) DEFAULT NULL,
  `upah_per_jam_dollar` double(16,2) DEFAULT NULL,
  `upah_per_bulan` double(16,2) DEFAULT NULL,
  `upah_per_jam` double(16,2) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `kurs_by` int DEFAULT NULL,
  `kurs_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate_man_power_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `category` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai` double(16,2) DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `harga_per_pcs` double(16,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rate_mold` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_mesin` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kapasitas` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_unit` int DEFAULT NULL,
  `harga_mesin` double(16,2) DEFAULT NULL,
  `harga_mesin_usd` double(16,2) DEFAULT NULL,
  `est_manfaat` int DEFAULT NULL,
  `depresiasi_bulan` double(16,2) DEFAULT NULL,
  `used_hour_month` double(16,2) DEFAULT NULL,
  `biaya_mesin` double(16,2) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `id_kurs` int DEFAULT NULL,
  `kurs` double(16,2) DEFAULT NULL,
  `kurs_tanggal` date DEFAULT NULL,
  `kurs_by` int DEFAULT NULL,
  `kurs_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recycle_master` (
  `id_rm` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_master` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name_master` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `detail_master` int DEFAULT NULL,
  `table_master` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `activation` enum('active','inactive') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'active',
  PRIMARY KEY (`id_rm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `religion` (
  `id` int DEFAULT NULL,
  `name_religion` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_produksi_daily_code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_produksi` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_produksi` date DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_produksi_daily_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_produksi` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_produksi_h` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal_produksi` date DEFAULT NULL,
  `id_product` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_process` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket` enum('good','bad','not yet') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'not yet',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ket_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_date` datetime DEFAULT NULL,
  `sts_daycode` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `delivery_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `delivery_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_produksi_h` (`id_produksi_h`) USING BTREE,
  KEY `id_product` (`id_product`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_produksi_daily_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_produksi` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_produksi_h` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal_produksi` date DEFAULT NULL,
  `id_costcenter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_produksi_h` (`id_produksi_h`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request_payment` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `no_doc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_doc` date DEFAULT NULL,
  `keperluan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumlah` double DEFAULT '0',
  `status` smallint DEFAULT '0' COMMENT '0: baru\\n1:approve\\n2:selesai',
  `tanggal` date DEFAULT NULL,
  `bank_coa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_nilai` double DEFAULT '0',
  `bank_admin` double DEFAULT '0',
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
  `pay_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pay_on` datetime DEFAULT NULL,
  `doc_file` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `doc_file_2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accnumber` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ids` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_request` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_checker` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_checker_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_checker_date` datetime DEFAULT NULL,
  `currency` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `admin_bank` decimal(20,2) NOT NULL,
  `link_doc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `tipe_pph` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_pph` decimal(20,2) NOT NULL,
  `source_module` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `source_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_company` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_company` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `expense_project_source` (`source_module`,`source_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id_room` int DEFAULT NULL,
  `id_quotatio` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `section_roo` int DEFAULT NULL,
  `name_room` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `floor` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `window` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `width_windo` int DEFAULT NULL,
  `height_wind` int DEFAULT NULL,
  `installatio` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rpt_potongan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month` date DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_until` date DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nik` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `employee_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pt` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `departemen` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `level` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `start` date DEFAULT NULL,
  `length` float(10,0) DEFAULT NULL,
  `status` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumlah` float(4,0) DEFAULT NULL,
  `absensi` float(4,0) DEFAULT NULL,
  `noabsen` float(4,0) DEFAULT NULL,
  `tidak_absen` float(4,0) DEFAULT NULL,
  `cutitahunan` float(4,0) DEFAULT NULL,
  `cutibesar` float(4,0) DEFAULT NULL,
  `cutihamil` float(4,0) DEFAULT NULL,
  `pot_noabsen` int DEFAULT NULL,
  `pot_late5` int DEFAULT NULL,
  `pot_late15` int DEFAULT NULL,
  `pot_late30` int unsigned DEFAULT NULL,
  `pot_late60` int DEFAULT NULL,
  `pot_late220` int DEFAULT NULL,
  `pot_izinpagi60` int DEFAULT NULL,
  `pot_izinpagi240` int DEFAULT NULL,
  `pot_izinsore60` int DEFAULT NULL,
  `pot_izinsore240` int DEFAULT NULL,
  `uang_makan` int DEFAULT NULL,
  `lembur` int DEFAULT NULL,
  `potongan_cuti` int DEFAULT NULL,
  `total_potongan` int DEFAULT NULL,
  `bpjs_tk` int DEFAULT NULL,
  `bpjs_kes` int DEFAULT NULL,
  `pph21` int DEFAULT NULL,
  `gajibersih` int DEFAULT NULL,
  `jumlah_cuti` float DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rpt_salary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month` date DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_until` date DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nik` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `employee_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pt` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `departemen` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `level` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `start` date DEFAULT NULL,
  `length` float(10,0) DEFAULT NULL,
  `status` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumlah` float(4,0) DEFAULT NULL,
  `absensi` float(4,0) DEFAULT NULL,
  `pot_noabsen` int DEFAULT NULL,
  `pot_late5` int DEFAULT NULL,
  `pot_late15` int DEFAULT NULL,
  `pot_late30` int DEFAULT NULL,
  `pot_late60` int DEFAULT NULL,
  `pot_late220` int DEFAULT NULL,
  `pot_izinpagi60` int DEFAULT NULL,
  `pot_izinpagi240` int DEFAULT NULL,
  `pot_izinsore60` int DEFAULT NULL,
  `pot_izinsore240` int DEFAULT NULL,
  `salary` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jabatan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pulsa` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `transport` int DEFAULT NULL,
  `insentif` int DEFAULT NULL,
  `uang_makan` int DEFAULT NULL,
  `lembur` int DEFAULT NULL,
  `potongan_cuti` int DEFAULT NULL,
  `total_potongan` int DEFAULT NULL,
  `bpjs_tk` int DEFAULT NULL,
  `jp` int DEFAULT NULL,
  `jht` int DEFAULT NULL,
  `bpjs_kes` int DEFAULT NULL,
  `prsh_bpjs` int DEFAULT NULL,
  `employee_bpjs` int DEFAULT NULL,
  `family_bpjs` int DEFAULT NULL,
  `pph21` int DEFAULT NULL,
  `gajibersih` int DEFAULT NULL,
  `jumlah_cuti` float DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rpt_tunjangan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `month` date DEFAULT NULL,
  `date_from` date DEFAULT NULL,
  `date_until` date DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nik` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `employee_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pt` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `departemen` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `level` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `start` date DEFAULT NULL,
  `length` float(10,0) DEFAULT NULL,
  `status` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumlah` float(4,0) DEFAULT NULL,
  `absensi` float(4,0) DEFAULT NULL,
  `noabsen` float(4,0) DEFAULT NULL,
  `tidak_absen` float(4,0) DEFAULT NULL,
  `cutitahunan` float(4,0) DEFAULT NULL,
  `cutibesar` float(4,0) DEFAULT NULL,
  `cutihamil` float(4,0) DEFAULT NULL,
  `transport` int DEFAULT NULL,
  `insentif` int DEFAULT NULL,
  `lembur` int DEFAULT NULL,
  `tr_code` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_potongan` int DEFAULT NULL,
  `bpjs_tk` int DEFAULT NULL,
  `bpjs_kes` int DEFAULT NULL,
  `pph21` int DEFAULT NULL,
  `gajibersih` int DEFAULT NULL,
  `jumlah_cuti` float DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutin_non_planning_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_pengajuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_po` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_pr` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_rfq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_barang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` double(10,2) DEFAULT NULL,
  `qty_rev` double(10,3) DEFAULT NULL,
  `satuan` int DEFAULT '21',
  `coa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `harga` double(16,2) DEFAULT NULL,
  `harga_rev` double(16,2) DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanggal` date DEFAULT NULL,
  `sts_app` enum('Y','N','D') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `sts_app_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sts_app_date` datetime DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `kasbon_created` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutin_non_planning_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_pengajuan` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `no_pr` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_po` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coa` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` double(10,2) DEFAULT NULL,
  `qty_rev` double(10,3) DEFAULT NULL,
  `harga` double(16,2) DEFAULT NULL,
  `harga_rev` double(16,2) DEFAULT NULL,
  `budget` double(16,2) DEFAULT NULL,
  `sisa_budget` double(16,2) DEFAULT NULL,
  `id_dept` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_costcenter` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sts_purchase` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `sts_pr` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `sts_close` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `book_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_date` datetime DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `sts_app` enum('Y','N','D') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `sts_app_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sts_app_date` datetime DEFAULT NULL,
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `document` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `no_so` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status_id` int DEFAULT '1',
  `po_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `metode_pembelian` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_1` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_2` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_3` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sts_reject1` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sts_reject2` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sts_reject3` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_1_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_1_date` datetime DEFAULT NULL,
  `app_2_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_2_date` datetime DEFAULT NULL,
  `app_3_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_3_date` datetime DEFAULT NULL,
  `sts_reject1_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sts_reject1_date` datetime DEFAULT NULL,
  `sts_reject2_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sts_reject2_date` datetime DEFAULT NULL,
  `sts_reject3_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sts_reject3_date` datetime DEFAULT NULL,
  `reject_reason1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reject_reason2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `reject_reason3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `keterangan_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `keterangan_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `keterangan_3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `app_post` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rejected` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tingkat_pr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `close_pr` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `close_pr_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_stage_no` int DEFAULT '1',
  `current_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'active',
  `revision_no` int DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutin_planning_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_pengajuan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_material` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `category_awal` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `spec` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `satuan` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_material` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `use_stock` double(10,3) DEFAULT NULL,
  `purchase` double(10,3) DEFAULT NULL,
  `purchase_rev` double(10,3) DEFAULT NULL,
  `no_po` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_pr_group` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_pr` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_rfq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `moq` double(10,2) DEFAULT NULL,
  `reorder_point` double(10,2) DEFAULT NULL,
  `sisa_avl` double(10,2) DEFAULT NULL,
  `book_per_month` double(10,2) NOT NULL,
  `max_stock` double(10,2) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `sts_app` enum('Y','N','D') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `sts_app_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sts_app_date` datetime DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `spec_pr` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `info_pr` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rutin_planning_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_pengajuan_group` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_pengajuan` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_pr` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pr_group` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_po` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `use_stock` double(10,3) DEFAULT NULL,
  `purchase` double(10,3) DEFAULT NULL,
  `purchase_rev` double(10,3) DEFAULT NULL,
  `last_gudang` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_purchase` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `sts_pr` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `sts_close` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `book_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `book_date` datetime DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `sts_app` enum('Y','N','D') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `sts_app_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sts_app_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `no_pengajuan` (`no_pengajuan`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_so` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_so_detail` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_cust` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `shipping` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_order` int DEFAULT NULL,
  `qty_propose` int DEFAULT '0',
  `qty_delivery` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `no_so` (`no_so`,`product`,`delivery_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_order_header` (
  `no_so` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_so_manual` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_cust` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `shipping` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipment` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_po` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sts_plan` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`no_so`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `department_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `in` time DEFAULT NULL,
  `out` time DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `search_balance_so` AS SELECT 
 1 AS `id`,
 1 AS `code_cust`,
 1 AS `product`,
 1 AS `qty_kurang`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `setting` (
  `company` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `web` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `alamatpajak` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `npwp` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift` (
  `id_shift` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_shift` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_bf_header` (
  `id_bq` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_ipp` char(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `series` char(9) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `order_type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `rev` tinyint DEFAULT '0',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `cancel_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `est_date` datetime DEFAULT NULL,
  `approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_est_date` datetime DEFAULT NULL,
  `aju_approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_date` datetime DEFAULT NULL,
  `aju_approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_est_date` datetime DEFAULT NULL,
  `reason_approved` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_approved_est` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_sts` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_date` datetime DEFAULT NULL,
  `total_bayar_so` double(50,2) DEFAULT '0.00',
  PRIMARY KEY (`id_bq`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_internal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `so_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `project` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_product` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `due_date` date DEFAULT NULL,
  `propose` double(16,2) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `code_lv4` (`code_lv4`,`no_bom`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_internal_assembly` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_req` int DEFAULT NULL,
  `id_master` int DEFAULT NULL,
  `key_hub` int DEFAULT NULL,
  `category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_barang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_barang` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `est` double(16,4) DEFAULT NULL,
  `length` double(16,4) DEFAULT NULL,
  `width` double(16,4) DEFAULT NULL,
  `m3` double(16,4) DEFAULT NULL,
  `lari` double(16,4) DEFAULT NULL,
  `qty` double(16,4) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `ket` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `layer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_internal_checksheet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_master` int DEFAULT NULL,
  `frequency` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk` int DEFAULT NULL,
  `qty_ke` int DEFAULT NULL,
  `id_detail` int DEFAULT NULL,
  `id_kolom` int DEFAULT NULL,
  `text_kolom` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_internal_checksheet_new` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk` int DEFAULT NULL,
  `qty_ke` int DEFAULT NULL,
  `id_master` int DEFAULT NULL,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_checksheet` int DEFAULT NULL,
  `surface` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1' COMMENT '1=Yes/No,2=InputFreeText',
  `rooving` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `matt_atas` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `matt_bawah` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `matt_kiri` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `matt_kanan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `display1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `display2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `display3` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dies1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dies2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dies3` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `speed` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_internal_material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `so_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight` double(16,5) DEFAULT NULL,
  `code_lv1` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `type_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_internal_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_key_spk` int DEFAULT NULL,
  `kode` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_det` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_spk` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `product_ke` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `close_produksi` date DEFAULT NULL,
  `close_by` int DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `status` enum('N','OKE','NG') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `daycode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qc_pass` date DEFAULT NULL,
  `note` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `doc_inspeksi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qc_by` int DEFAULT NULL,
  `qc_date` datetime DEFAULT NULL,
  `sts_print_qr` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `sts_print_qr_date` datetime DEFAULT NULL,
  `inspektor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_internal_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `so_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varbinary(20) DEFAULT NULL,
  `project` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bom_planning` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_product` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `due_date` date DEFAULT NULL,
  `propose` double(16,2) DEFAULT NULL,
  `status` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `sts_ass` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `ass_by` int DEFAULT NULL,
  `ass_date` datetime DEFAULT NULL,
  `lock_by` int DEFAULT NULL,
  `locak_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_internal_spk` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_det` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_spk` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_so` int DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `tanggal_est_finish` date DEFAULT NULL,
  `qty` double(16,2) DEFAULT NULL,
  `id_gudang` int DEFAULT '2',
  `id_costcenter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mix1` double(16,4) DEFAULT NULL,
  `mix2` double(16,4) DEFAULT NULL,
  `mix3` double(16,4) DEFAULT NULL,
  `mix4` double(16,4) DEFAULT NULL,
  `mix5` double(16,4) DEFAULT NULL,
  `mix6` double(16,4) DEFAULT NULL,
  `mix7` double(16,4) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `status_id` int DEFAULT '1',
  `sts_request` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `request_by` int DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `sts_subgudang` enum('Y','N','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `subgudang_by` int DEFAULT NULL,
  `subgudang_date` datetime DEFAULT NULL,
  `sts_mixing` enum('Y','N','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `mixing_by` int DEFAULT NULL,
  `mixing_date` datetime DEFAULT NULL,
  `sts_produksi` enum('Y','N','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `produksi_by` int DEFAULT NULL,
  `produksi_date` datetime DEFAULT NULL,
  `produksi_confirm_by` int DEFAULT NULL,
  `produksi_confirm_date` datetime DEFAULT NULL,
  `tanggal_close` date DEFAULT NULL,
  `sts_close` enum('Y','N','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `close_by` int DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `daycode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal_qc` date DEFAULT NULL,
  `qc_qty` int DEFAULT NULL,
  `qc_by` int DEFAULT NULL,
  `qc_date` datetime DEFAULT NULL,
  `tipe_mixing` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_close` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `kode` (`kode`,`id_so`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_internal_spk_material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_det` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight` double(16,5) DEFAULT NULL,
  `code_lv1` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `type_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `request` double(16,5) DEFAULT NULL,
  `code_material_aktual` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight_aktual` double(16,5) DEFAULT NULL,
  `mix1` double(16,4) DEFAULT NULL,
  `mix2` double(16,4) DEFAULT NULL,
  `mix3` double(16,4) DEFAULT NULL,
  `mix4` double(16,4) DEFAULT NULL,
  `mix5` double(16,4) DEFAULT NULL,
  `mix6` double(16,4) DEFAULT NULL,
  `mix7` double(16,4) DEFAULT NULL,
  `add_material` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_internal_spk_material_pengeluaran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_det_spk` int DEFAULT NULL,
  `qty_ke` int DEFAULT NULL,
  `gudang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight` double(16,5) DEFAULT NULL,
  `code_material_aktual` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight_aktual` double(16,5) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `close_produksi` date DEFAULT NULL,
  `close_by` int DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `code_material_confirm` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight_confirm` double(16,5) DEFAULT NULL,
  `confirm_by` int DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  `mix1` double(16,5) DEFAULT NULL,
  `mix2` double(16,5) DEFAULT NULL,
  `mix3` double(16,5) DEFAULT NULL,
  `mix4` double(16,5) DEFAULT NULL,
  `mix5` double(16,5) DEFAULT NULL,
  `mix6` double(16,5) DEFAULT NULL,
  `mix7` double(16,5) DEFAULT NULL,
  `type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_shift` int DEFAULT NULL,
  `id_mesin` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_internal_spk_material_pengeluaran_ftackle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_so_spk` int DEFAULT NULL,
  `id_det_spk` int DEFAULT NULL,
  `qty_produksi` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `process_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight` double(16,5) DEFAULT NULL,
  `code_material_aktual` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight_aktual` double(16,5) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_internal_spk_mixing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_det` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_spk` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_so` int DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `tanggal_est_finish` date DEFAULT NULL,
  `qty` double(16,2) DEFAULT NULL,
  `id_gudang` int DEFAULT '2',
  `id_costcenter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mix1` double(16,4) DEFAULT NULL,
  `mix2` double(16,4) DEFAULT NULL,
  `mix3` double(16,4) DEFAULT NULL,
  `mix4` double(16,4) DEFAULT NULL,
  `mix5` double(16,4) DEFAULT NULL,
  `mix6` double(16,4) DEFAULT NULL,
  `mix7` double(16,4) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `status_id` int DEFAULT '1',
  `qty_mixing` int DEFAULT NULL,
  `tipe_mixing` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `kode` (`kode`,`id_so`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_internal_spk_mixing_material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_mixing` int DEFAULT NULL,
  `id_spk_mat` int DEFAULT NULL,
  `kode_det` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight` double(16,5) DEFAULT NULL,
  `code_lv1` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `type_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `request` double(16,5) DEFAULT NULL,
  `code_material_aktual` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight_aktual` double(16,5) DEFAULT NULL,
  `mix1` double(16,4) DEFAULT NULL,
  `mix2` double(16,4) DEFAULT NULL,
  `mix3` double(16,4) DEFAULT NULL,
  `mix4` double(16,4) DEFAULT NULL,
  `mix5` double(16,4) DEFAULT NULL,
  `mix6` double(16,4) DEFAULT NULL,
  `mix7` double(16,4) DEFAULT NULL,
  `add_material` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `so_internal_spk_view` AS SELECT 
 1 AS `id`,
 1 AS `kode`,
 1 AS `kode_det`,
 1 AS `no_spk`,
 1 AS `id_so`,
 1 AS `tanggal`,
 1 AS `qty`,
 1 AS `id_gudang`,
 1 AS `id_costcenter`,
 1 AS `created_by`,
 1 AS `created_date`,
 1 AS `status_id`,
 1 AS `sts_request`,
 1 AS `request_by`,
 1 AS `request_date`,
 1 AS `sts_subgudang`,
 1 AS `subgudang_by`,
 1 AS `subgudang_date`,
 1 AS `sts_produksi`,
 1 AS `produksi_by`,
 1 AS `produksi_date`,
 1 AS `produksi_confirm_by`,
 1 AS `produksi_confirm_date`,
 1 AS `sts_spk`,
 1 AS `sts_mixing`,
 1 AS `mixing_by`,
 1 AS `mixing_date`,
 1 AS `sts_close`,
 1 AS `close_date`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_spk_assembly` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_hub` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_spk` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `project` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_product` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `due_date` date DEFAULT NULL,
  `propose` double(16,2) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `sts_close_material` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `close_material_by` int DEFAULT NULL,
  `close_material_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `code_lv4` (`code_lv4`,`no_bom`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_spk_assembly_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_hub` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_hub_mat` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_master` int DEFAULT NULL,
  `layer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_material` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `length` double(16,4) DEFAULT NULL,
  `width` double(16,4) DEFAULT NULL,
  `qty` double(16,4) DEFAULT NULL,
  `qty_req` double(16,4) DEFAULT NULL,
  `m2` double(16,4) DEFAULT NULL,
  `ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_spk_assembly_material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_hub` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_master` int DEFAULT NULL,
  `code_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight` double(16,4) DEFAULT NULL,
  `request` double(16,4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_spk_assembly_material_pengeluaran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_assembly` int DEFAULT NULL,
  `category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_key` int DEFAULT NULL,
  `est_id_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `est_berat` double(16,4) DEFAULT NULL,
  `act_id_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `act_berat` double(16,4) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_spk_assembly_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_det` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_spk` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_req` int DEFAULT NULL,
  `id_detail` int DEFAULT NULL,
  `category` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `tanggal_est_finish` date DEFAULT NULL,
  `qty` double(16,2) DEFAULT NULL,
  `qty_out` double(16,2) DEFAULT NULL,
  `id_gudang` int DEFAULT NULL,
  `id_costcenter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `status_id` int DEFAULT '1',
  `sts_request` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `request_by` int DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `sts_subgudang` enum('Y','N','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `subgudang_by` int DEFAULT NULL,
  `subgudang_date` datetime DEFAULT NULL,
  `sts_mixing` enum('Y','N','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `mixing_by` int DEFAULT NULL,
  `mixing_date` datetime DEFAULT NULL,
  `sts_produksi` enum('Y','N','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `produksi_by` int DEFAULT NULL,
  `produksi_date` datetime DEFAULT NULL,
  `produksi_confirm_by` int DEFAULT NULL,
  `produksi_confirm_date` datetime DEFAULT NULL,
  `tanggal_close` date DEFAULT NULL,
  `sts_close` enum('Y','N','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `close_by` int DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `daycode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal_qc` date DEFAULT NULL,
  `qc_qty` int DEFAULT NULL,
  `qc_by` int DEFAULT NULL,
  `qc_date` datetime DEFAULT NULL,
  `tipe_mixing` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_close` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_surat_jalan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `outgoing_by` int DEFAULT NULL,
  `outgoing_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `kode` (`kode`,`id_req`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_spk_assembly_request_outgoing` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_spk` int DEFAULT NULL,
  `kode_req` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_so` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_spk` int DEFAULT NULL,
  `qty_outgoing` int DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_product` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `sts_close` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_spk_assembly_request_outgoing_temp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_spk` int DEFAULT NULL,
  `kode_req` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_so` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_spk` int DEFAULT NULL,
  `qty_outgoing` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_product` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_spk_cutting` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_request` int DEFAULT NULL,
  `kode_hub` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `project` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_product` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `due_date` date DEFAULT NULL,
  `propose` double(11,2) DEFAULT NULL,
  `qty_request` double(11,2) DEFAULT '0.00',
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `code_lv4` (`code_lv4`,`no_bom`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_spk_cutting_material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_hub` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_master` int DEFAULT NULL,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight` double(16,4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_spk_cutting_material_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_det` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight` double(16,5) DEFAULT NULL,
  `code_lv1` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `type_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `request` double(16,5) DEFAULT NULL,
  `code_material_aktual` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight_aktual` double(16,5) DEFAULT NULL,
  `mix1` double(16,4) DEFAULT NULL,
  `mix2` double(16,4) DEFAULT NULL,
  `mix3` double(16,4) DEFAULT NULL,
  `mix4` double(16,4) DEFAULT NULL,
  `mix5` double(16,4) DEFAULT NULL,
  `mix6` double(16,4) DEFAULT NULL,
  `mix7` double(16,4) DEFAULT NULL,
  `add_material` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_spk_cutting_pengeluaran` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_so_spk` int DEFAULT NULL,
  `id_det_spk` int DEFAULT NULL,
  `qty_produksi` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `process_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight` double(16,5) DEFAULT NULL,
  `code_material_aktual` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `weight_aktual` double(16,5) DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_spk_cutting_plan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_hub` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_master` int DEFAULT NULL,
  `length` double(16,4) DEFAULT NULL,
  `width` double(16,4) DEFAULT NULL,
  `qty` double(16,4) DEFAULT NULL,
  `lari` double(16,4) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_spk_cutting_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_key_spk` int DEFAULT NULL,
  `kode` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_det` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_spk` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `product_ke` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `close_produksi` date DEFAULT NULL,
  `close_by` int DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `status` enum('N','OKE','NG') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `daycode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qc_pass` date DEFAULT NULL,
  `note` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `doc_inspeksi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qc_by` int DEFAULT NULL,
  `qc_date` datetime DEFAULT NULL,
  `sts_print_qr` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `sts_print_qr_date` datetime DEFAULT NULL,
  `inspektor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `length` double(16,2) DEFAULT NULL,
  `width` double(16,2) DEFAULT NULL,
  `lari` double(16,2) DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_spk_cutting_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_det` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_spk` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_so` int DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `tanggal_est_finish` date DEFAULT NULL,
  `qty` double(16,2) DEFAULT NULL,
  `id_gudang` int DEFAULT '2',
  `id_costcenter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `status_id` int DEFAULT '1',
  `sts_request` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `request_by` int DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `sts_subgudang` enum('Y','N','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `subgudang_by` int DEFAULT NULL,
  `subgudang_date` datetime DEFAULT NULL,
  `sts_mixing` enum('Y','N','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `mixing_by` int DEFAULT NULL,
  `mixing_date` datetime DEFAULT NULL,
  `sts_produksi` enum('Y','N','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `produksi_by` int DEFAULT NULL,
  `produksi_date` datetime DEFAULT NULL,
  `produksi_confirm_by` int DEFAULT NULL,
  `produksi_confirm_date` datetime DEFAULT NULL,
  `tanggal_close` date DEFAULT NULL,
  `sts_close` enum('Y','N','P') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `close_by` int DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `daycode` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal_qc` date DEFAULT NULL,
  `qc_qty` int DEFAULT NULL,
  `qc_by` int DEFAULT NULL,
  `qc_date` datetime DEFAULT NULL,
  `tipe_mixing` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_close` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_surat_jalan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `outgoing_by` int DEFAULT NULL,
  `outgoing_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `kode` (`kode`,`id_so`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_spk_cutting_request_outgoing` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_spk` int DEFAULT NULL,
  `kode_req` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_so` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_spk` int DEFAULT NULL,
  `qty_outgoing` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_product` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `sts_close` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `so_spk_cutting_request_outgoing_temp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_spk` int DEFAULT NULL,
  `kode_req` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_so` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_spk` int DEFAULT NULL,
  `qty_outgoing` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_product` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spk_delivery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_delivery` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_so` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `no_surat_jalan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` enum('NOT YET DELIVER','ON DELIVER','DELIVERY CONFIRMED','CHECK QC') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'NOT YET DELIVER',
  `tgl_dikirim` date DEFAULT NULL,
  `tgl_diterima` date DEFAULT NULL,
  `ekspedisi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `diterima_oleh` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `upload_spk` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `confirm_by` int DEFAULT NULL,
  `confirm_date` datetime DEFAULT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spk_delivery_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_so_det` int DEFAULT NULL,
  `no_delivery` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_so` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_so` int DEFAULT NULL,
  `qty_booking` int DEFAULT NULL,
  `qty_delivery` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spk_delivery_detail_sj` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk` int DEFAULT NULL,
  `no_delivery` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_so` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_order` int DEFAULT NULL,
  `qty_spk` int DEFAULT NULL,
  `qty_delivery` int DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_product` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spk_delivery_detail_sj_temp` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_spk` int DEFAULT NULL,
  `no_delivery` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_so` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_order` int DEFAULT NULL,
  `qty_spk` int DEFAULT NULL,
  `qty_delivery` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_product` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `product_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `actual_stock` double(9,2) DEFAULT NULL,
  `booking_stock` double(9,2) DEFAULT NULL,
  `ng_stock` double(9,2) DEFAULT NULL,
  `min_stock` double(9,2) DEFAULT NULL,
  `moq` double(9,2) DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_product_histroy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_key_price` int DEFAULT NULL,
  `stok_aktual_before` double(16,2) DEFAULT NULL,
  `stok_aktual_after` double(16,2) DEFAULT NULL,
  `stok_booking_before` double(16,2) DEFAULT NULL,
  `stok_booking_after` double(16,2) DEFAULT NULL,
  `stok_downgrade_before` double(16,2) DEFAULT NULL,
  `stok_downgrade_after` double(16,2) DEFAULT NULL,
  `qty` double(16,2) DEFAULT NULL,
  `no_dokumen` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_product_per_day` (
  `code_lv4` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bom` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `product_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `actual_stock` double(9,2) DEFAULT NULL,
  `booking_stock` double(9,2) DEFAULT NULL,
  `ng_stock` double(9,2) DEFAULT NULL,
  `hist_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sub_kategori` (
  `id_sub_kategori` int NOT NULL AUTO_INCREMENT,
  `id_kategori` int DEFAULT NULL,
  `nm_sub_kategori` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id_sub_kategori`) USING BTREE,
  KEY `id_kategori` (`id_kategori`) USING BTREE,
  CONSTRAINT `sub_kategori_ibfk_1` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_bom_planning` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_product` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_count_daycode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_product` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_costcenter` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumlah_double` int DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pr_flow_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pr_type` enum('department','asset','stock') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `metode_pembelian` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'NULL untuk base, Kasbon, Direct Payment, PO',
  `stage_no` int NOT NULL,
  `stage_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `actor_role` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_lookup` (`pr_type`,`metode_pembelian`,`stage_no`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pr_stage_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pr_type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'department, asset, stock',
  `no_pengajuan` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `no_pr` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `stage_no` int NOT NULL,
  `status` enum('pending','active','done','reject') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'pending',
  `actor_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `action_date` datetime DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `doc_ref` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_pr` (`pr_type`,`no_pengajuan`,`stage_no`) USING BTREE,
  KEY `idx_pr_no` (`no_pr`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_checksheet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_print` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `prepared_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `checked_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `acknowleged_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ket1` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `ket2` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `ket3` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `ket4` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `ket5` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `temp_server_side` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_mat` int DEFAULT NULL,
  `pack` double(12,2) DEFAULT NULL,
  `stock` double(12,2) DEFAULT NULL,
  `ket` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_added_req_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_doc` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tipe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_alokasi` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tipe_bank` int NOT NULL DEFAULT '0',
  `jenis_bank` int DEFAULT NULL,
  `account_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tanggal_transaksi_from` date NOT NULL,
  `tanggal_transaksi_to` date NOT NULL,
  `saldo_awal` decimal(20,2) NOT NULL,
  `total_debit` decimal(20,2) NOT NULL,
  `total_credit` decimal(20,2) NOT NULL,
  `saldo_akhir` decimal(20,2) NOT NULL,
  `status_alokasi` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1',
  `created_by` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `deleted_by` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_alokasi_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipe_bank` int NOT NULL DEFAULT '0',
  `jenis_bank` int DEFAULT NULL,
  `tanggal_transaksi` date NOT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `cabang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nominal_debit` decimal(20,2) DEFAULT NULL,
  `nominal_kredit` decimal(20,2) DEFAULT NULL,
  `saldo` decimal(20,2) DEFAULT NULL,
  `reference_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cheque_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status_approval` enum('pending','approved') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'approved' COMMENT 'Status approval review rekening koran',
  `sts` enum('0','1','2','3','4','5','6','7') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `nilai_terpakai` decimal(20,2) DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_alokasi_split` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_alokasi_detail` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'FK ke tr_alokasi_detail.id',
  `jenis_alokasi` tinyint(1) NOT NULL COMMENT '1-7 sesuai kode jenis alokasi',
  `nominal` decimal(15,2) NOT NULL DEFAULT '0.00',
  `no_kwitansi` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT 'No kwitansi deposit tujuan (jenis_alokasi = 8)',
  `nilai_terpakai` decimal(10,2) DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_id_alokasi_detail` (`id_alokasi_detail`) USING BTREE,
  KEY `idx_no_kwitansi` (`no_kwitansi`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_billing_plan` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_so` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_customer` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `total_so` decimal(20,2) DEFAULT NULL,
  `tipe_billing_plan` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `persen_billing_plan` decimal(20,2) DEFAULT NULL,
  `value_billing_plan` decimal(20,2) DEFAULT NULL,
  `billing_plan_date` date DEFAULT NULL,
  `tipe_so` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_budget_bg` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `no_bg` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'BG-YYMM-NNN',
  `departement` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'pending' COMMENT 'pending atau done',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `decided_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_no_bg` (`no_bg`) USING BTREE,
  KEY `idx_dept_status` (`departement`,`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_budget_bg_line` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `no_bg` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kind` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'new, edit, off, on',
  `id_budget` int DEFAULT NULL COMMENT 'ms_budget_rutin.id; NULL untuk item baru sampai disetujui',
  `before_json` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `after_json` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `fields` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'daftar field yang berubah, dipisah koma',
  `decision` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'A atau R',
  `note` text CHARACTER SET latin1 COLLATE latin1_swedish_ci COMMENT 'alasan reject',
  `decided_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `decided_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_no_bg` (`no_bg`) USING BTREE,
  KEY `idx_id_budget` (`id_budget`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_check_invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_trans` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_user` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_checked_incoming_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_trans` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_detail` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_material` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_material` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_order` double(16,5) DEFAULT NULL,
  `qty_incoming` double(16,5) DEFAULT NULL,
  `unit` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `packing` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `konversi` double(16,5) DEFAULT NULL,
  `qty_ng` double(16,5) DEFAULT NULL,
  `qty_oke` double(16,5) DEFAULT NULL,
  `qty_pack` double(16,5) DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `uploaded_file` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `lot_description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `sts` int NOT NULL,
  `qty_used` double(16,4) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_choosed_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_payment` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_cost_book` (
  `id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_material` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_material` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `kode_produk` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe_material` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_gudang_dari` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_gudang_dari` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_gudang_ke` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_gudang_ke` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `tgl` date NOT NULL,
  `no_transaksi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_transaksi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_transaksi` decimal(20,2) NOT NULL,
  `qty` decimal(20,2) NOT NULL,
  `nilai_in` decimal(20,2) NOT NULL,
  `nilai_beli` decimal(20,2) NOT NULL,
  `costbook` decimal(20,2) NOT NULL,
  `value_transaksi` decimal(20,2) NOT NULL,
  `value_neraca` decimal(20,2) NOT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_customer_deposit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_deposit` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_customer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nm_customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1',
  `tipe_sumber` enum('LEBIH_BAYAR','KWITANSI_DEPOSIT') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `no_referensi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'No Surat Penerimaan atau No Kwitansi',
  `po_customer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `tanggal` date NOT NULL,
  `nominal_awal` decimal(20,2) NOT NULL,
  `nominal_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sisa_saldo` decimal(20,2) NOT NULL,
  `status` enum('MENUNGGU_PEMBAYARAN','AKTIF','TERPAKAI_SEBAGIAN','LUNAS_TERPAKAI') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'AKTIF',
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `tanggal_aktif` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `no_deposit` (`no_deposit`) USING BTREE,
  KEY `idx_cust_status` (`id_customer`,`status`) USING BTREE,
  KEY `idx_reff` (`no_referensi`) USING BTREE,
  KEY `idx_customer_company_active` (`id_customer`,`id_company`,`status`,`tanggal_aktif`,`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_customer_deposit_mutasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_deposit` int NOT NULL,
  `id_customer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `no_transaksi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'No Transaksi Penerimaan Piutang / Pelunasan',
  `tanggal` date NOT NULL,
  `jenis_mutasi` enum('IN','OUT') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nominal` decimal(20,2) NOT NULL,
  `saldo_sebelum` decimal(20,2) NOT NULL,
  `saldo_sesudah` decimal(20,2) NOT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_deposit` (`id_deposit`) USING BTREE,
  KEY `idx_transaksi` (`no_transaksi`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_cycletime_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cycletime` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `produk` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `proses` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cycletime_minute` int DEFAULT NULL,
  `manpower_qty` int DEFAULT NULL,
  `keterangan` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted_by` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_dat` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_cycletime_hd` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cycletime` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted_by` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_on` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_cycletime_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_cycletime` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `produk` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cost_center` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mesin` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mold_tools` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted_by` varchar(254) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_dat` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_direct_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_doc` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_doc` date DEFAULT NULL,
  `ids` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_budgeting` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `grand_total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_req` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_account` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_req_payment` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject_manage` int DEFAULT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `metode_pembayaran` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '1',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_expense` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_doc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_doc` date DEFAULT NULL,
  `departement` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `coa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approval` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int DEFAULT '0',
  `created_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `approved_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
  `jumlah` double DEFAULT '0',
  `total_kasbon` double DEFAULT '0',
  `informasi` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accnumber` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pettycash` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `st_reject` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `transfer_coa_bank` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `transfer_tanggal` date DEFAULT NULL,
  `transfer_jumlah` double DEFAULT '0',
  `transfer_file` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_so` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `add_ppn_nilai` double DEFAULT '0',
  `add_ppn_coa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `add_pph_nilai` double DEFAULT '0',
  `add_pph_coa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject` int NOT NULL,
  `sts_reject_manage` int NOT NULL,
  `rejected_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rejected_on` datetime DEFAULT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `exp_pib` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `exp_inv_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe_penggantian` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe_pengembalian` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `expense_id_kembalian` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bon_bukti` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bukti_pengembalian` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lebih_bayar` double DEFAULT NULL,
  `kurang_bayar` double DEFAULT NULL,
  `keterangan_kurang_bayar` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `keterangan_pengembalian` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_kasbon` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `project_consultant` enum('1','0') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `no_expense_consultant` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_finance` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `app_finance_date` datetime DEFAULT NULL,
  `tgl_approval_direktur` datetime DEFAULT NULL,
  `verified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `verified_on` datetime DEFAULT NULL,
  `verif_checklist` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `verif_reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `reject_reason_finance` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_bank_pengembalian` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_expense_bukti_pengembalian` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header_expense` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `document_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_header_expense` (`id_header_expense`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_expense_bukti_penggunaan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header_expense` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `upload_file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_header_expense` (`id_header_expense`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_expense_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `no_doc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deskripsi` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` decimal(10,0) DEFAULT '0',
  `harga` decimal(20,0) DEFAULT '0',
  `total_harga` decimal(20,0) DEFAULT '0',
  `keterangan` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int DEFAULT '0',
  `qty_kasbon` decimal(10,2) DEFAULT '0.00',
  `nominal_kasbon` decimal(20,2) DEFAULT '0.00',
  `qty_expense` decimal(10,2) DEFAULT '0.00',
  `nominal_expense` decimal(20,2) DEFAULT '0.00',
  `kasbon` decimal(20,0) DEFAULT '0',
  `expense` decimal(20,0) DEFAULT '0',
  `doc_file` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `expense_on` date DEFAULT NULL,
  `id_kasbon` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `coa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `doc_file_2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kasbon_max` decimal(20,0) DEFAULT '0',
  `id_expense` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_expense_detail` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `req_payment` int NOT NULL,
  `kasbon_pr_non_po_pett` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_expense_bayar_sisa` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_expense_detail_file` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_doc` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Nomor Dokumen Expense',
  `id_detail` int NOT NULL COMMENT 'ID baris dari tr_expense_detail',
  `doc_file` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Nama file lampiran',
  `created_by` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_no_doc` (`no_doc`) USING BTREE,
  KEY `idx_id_detail` (`id_detail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_expense_petty_cash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_pencatatan` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Format: PCP-YYYY-NNNN',
  `tanggal` date NOT NULL COMMENT 'Tanggal pencatatan',
  `company` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'STM, VUCA, SUSTAIN',
  `request_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Nama pemohon',
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'Keterangan umum',
  `grand_total` decimal(15,0) NOT NULL DEFAULT '0' COMMENT 'SUM total detail',
  `status` enum('draft','waiting approval','approved','reject') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'draft' COMMENT 'Status pencatatan',
  `journal_status` enum('pending','success','failed') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending' COMMENT 'Status sinkronisasi jurnal ke DBACC',
  `petty_cash_id` smallint NOT NULL COMMENT 'FK to ms_petty_cash.id',
  `created_on` datetime DEFAULT NULL COMMENT 'Auto-filled on create',
  `created_by` int DEFAULT NULL COMMENT 'FK to users.id_user',
  `modified_on` datetime DEFAULT NULL COMMENT 'Auto-filled on update',
  `modified_by` int DEFAULT NULL COMMENT 'FK to users.id_user',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_no_pencatatan` (`no_pencatatan`) USING BTREE,
  KEY `idx_petty_cash_id` (`petty_cash_id`) USING BTREE,
  KEY `idx_company` (`company`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_journal_status` (`journal_status`) USING BTREE,
  KEY `idx_tanggal` (`tanggal`) USING BTREE,
  KEY `idx_created_by` (`created_by`) USING BTREE,
  KEY `fk_expense_pc_modified_by` (`modified_by`) USING BTREE,
  CONSTRAINT `fk_expense_pc_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id_user`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_expense_pc_modified_by` FOREIGN KEY (`modified_by`) REFERENCES `users` (`id_user`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_expense_pc_petty_cash` FOREIGN KEY (`petty_cash_id`) REFERENCES `ms_petty_cash` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Header pencatatan pengeluaran petty cash';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_expense_petty_cash_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pencatatan_id` int NOT NULL COMMENT 'FK to tr_expense_petty_cash.id',
  `coa_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'FK to coa_master.no_perkiraan',
  `pengeluaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Nama pengeluaran',
  `spesifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Spesifikasi item',
  `jumlah` int NOT NULL COMMENT 'Quantity (1-9999)',
  `nominal` decimal(15,0) NOT NULL COMMENT 'Harga satuan (1-999.999.999)',
  `total` decimal(15,0) NOT NULL COMMENT 'jumlah x nominal',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT 'Urutan baris',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_pencatatan_id` (`pencatatan_id`) USING BTREE,
  KEY `idx_coa_code` (`coa_code`) USING BTREE,
  CONSTRAINT `fk_detail_pencatatan` FOREIGN KEY (`pencatatan_id`) REFERENCES `tr_expense_petty_cash` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Detail item pencatatan pengeluaran petty cash';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_expense_petty_cash_evidence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `detail_id` int NOT NULL COMMENT 'FK to tr_expense_petty_cash_detail.id',
  `original_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Nama file asli',
  `encrypted_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Nama file terenkripsi (md5)',
  `file_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Extension: png, jpg, pdf, xlsx, xls',
  `file_size` int NOT NULL COMMENT 'Ukuran dalam bytes (max 5MB)',
  `uploaded_on` datetime NOT NULL COMMENT 'Waktu upload',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_detail_id` (`detail_id`) USING BTREE,
  CONSTRAINT `fk_evidence_detail` FOREIGN KEY (`detail_id`) REFERENCES `tr_expense_petty_cash_detail` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='File bukti/evidence pencatatan petty cash';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_history_penawaran` (
  `id_history_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_penawaran` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `quote_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_surat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_penawaran` date DEFAULT NULL,
  `id_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `pic_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mata_uang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `valid_until` date DEFAULT NULL,
  `top` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `top_custom` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `nilai_penawaran` double(50,2) DEFAULT '0.00',
  `order_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_sales` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_sales` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pengiriman` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int DEFAULT '0',
  `revisi` int DEFAULT '0',
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `printed_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `printed_on` datetime DEFAULT NULL,
  `delivered_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delivered_on` datetime DEFAULT NULL,
  `approved_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
  `revisi_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `revisi_on` datetime DEFAULT NULL,
  `ppn` double(50,0) DEFAULT '0',
  `nilai_ppn` double(50,2) DEFAULT '0.00',
  `grand_total` double(50,2) DEFAULT '0.00',
  `keterangan_loss` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan_approve` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_so` int DEFAULT '0',
  `pilihppn` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `skb` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_revisi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan_nomor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `project` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `req_app1` int DEFAULT NULL,
  `req_app2` int DEFAULT NULL,
  `req_app3` int DEFAULT NULL,
  `app_1` int DEFAULT NULL,
  `app_2` int DEFAULT NULL,
  `app_3` int DEFAULT NULL,
  `keterangan_app1` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `keterangan_app2` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `keterangan_app3` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `subject` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `time_delivery` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `offer_period` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delivery_term` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `warranty` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `curr` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `notes` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id_history_penawaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_history_penawaran_detail` (
  `id_history_penawaran_detail` int NOT NULL AUTO_INCREMENT,
  `id_history_penawaran` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_penawaran` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_category3` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `nama_produk` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_bentuk` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` int DEFAULT '0',
  `harga_satuan` double(40,2) DEFAULT '0.00',
  `stok_tersedia` double(40,2) DEFAULT '0.00',
  `potensial_loss` double(40,2) DEFAULT '0.00',
  `diskon_persen` double(40,2) DEFAULT '0.00',
  `diskon_nilai` varchar(45) CHARACTER SET armscii8 COLLATE armscii8_general_ci DEFAULT NULL,
  `freight_cost` double(40,2) DEFAULT NULL,
  `total_harga` double(40,2) DEFAULT NULL,
  `keterangan` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `revisi` int DEFAULT '0',
  `created_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `nilai_diskon` double(50,2) DEFAULT '0.00',
  `diskon_compare` double(40,2) DEFAULT '0.00',
  `free_stock` decimal(20,2) DEFAULT NULL,
  `curr` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ukuran_potongan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `cutting_fee` decimal(20,2) NOT NULL,
  `delivery_fee` decimal(20,2) NOT NULL,
  PRIMARY KEY (`id_history_penawaran_detail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_history_penawaran_other_cost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_history_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `curr` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai` double(20,2) DEFAULT NULL,
  `dibuat_oleh` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dibuat_tgl` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_incoming` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_data` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_incoming` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_suplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_gudang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pib` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `matauang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hutang_kurs` double(40,2) DEFAULT '0.00',
  `hutang_idr` double(40,2) DEFAULT '0.00',
  `kurs` double(40,2) DEFAULT '0.00',
  `no_po` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_bayar` enum('CLS','OPN') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'OPN',
  `bayar_kurs` double(40,2) DEFAULT '0.00',
  `bayar_idr` double(40,2) DEFAULT '0.00',
  `status_jurnal` enum('OPN','CLS') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'OPN',
  `total_ppn` double(40,2) DEFAULT '0.00',
  `total_barang` double(40,2) DEFAULT '0.00',
  `freight_kurs` double(40,2) DEFAULT '0.00',
  `freight_idr` double(40,2) DEFAULT '0.00',
  `status_hutang` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `approve_bayar` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `rencana_bayar_kurs` double(40,2) DEFAULT '0.00',
  `rencana_bayar_idr` double(40,2) DEFAULT '0.00',
  `request_bayar` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `kurs_request` double(40,2) DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_incoming_check` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_trans` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `no_ipp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jumlah_mat` double(16,5) DEFAULT NULL,
  `jumlah_mat_check` double(16,5) DEFAULT NULL,
  `id_gudang_dari` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kd_gudang_dari` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_gudang_ke` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kd_gudang_ke` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pic` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `checked` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `checked_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_date` datetime DEFAULT NULL,
  `no_surat_jalan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_spk` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `req_mixing` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `kode_spk` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_ba` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted` datetime DEFAULT NULL,
  `doc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `form_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rev_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `no_memo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_so` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_ros` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_harga_product` bigint DEFAULT '0',
  `total_freight` bigint DEFAULT '0',
  `print_ke` int DEFAULT '0',
  `status_id` int DEFAULT '1',
  `kurs` double(20,2) DEFAULT NULL,
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `qty_spk` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_invoice` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_eng_change` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_incoming_material` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `file_incoming_check` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `inc_inv_create` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `kode_trans` (`kode_trans`) USING BTREE,
  KEY `kode_spk` (`kode_spk`) USING BTREE,
  KEY `category` (`category`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_incoming_check_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_trans` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_ipp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_po_detail` int DEFAULT NULL,
  `id_material_req` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_material` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_material` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_category` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_order` double(16,5) DEFAULT '0.00000',
  `qty_oke` double(16,5) NOT NULL,
  `qty_rusak` double(16,5) NOT NULL DEFAULT '0.00000',
  `expired_date` date DEFAULT NULL,
  `no_ba` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `check_qty_oke` double(16,5) DEFAULT NULL,
  `check_qty_rusak` double(16,5) DEFAULT '0.00000',
  `check_expired_date` date DEFAULT NULL,
  `check_keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ket_req_pro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `key_gudang` int DEFAULT NULL,
  `lot_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proccess_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `proccess_date` datetime DEFAULT NULL,
  `qty_est` double(16,4) DEFAULT NULL,
  `qty_sisa` double(16,4) DEFAULT NULL,
  `qty_total_req` double(16,4) DEFAULT NULL,
  `harga` double(16,2) DEFAULT '0.00',
  `harga_freight` double(16,2) DEFAULT '0.00',
  `qty_req_mixing` double(16,4) DEFAULT NULL,
  `ket_request` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `kode_trans` (`kode_trans`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_inquiry_delivery` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_inquiry` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `perkiraan_kirim` date DEFAULT NULL,
  `qty_kirim` double(255,0) DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_inquiry_dt` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `no_inquiry` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `id_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nama_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `hardness` float(30,2) DEFAULT NULL,
  `thickness` float(10,2) DEFAULT NULL,
  `length` float(10,2) DEFAULT NULL,
  `width` float(20,2) DEFAULT NULL,
  `density` float(20,2) DEFAULT NULL,
  `qty_order` double NOT NULL DEFAULT '0' COMMENT 'demand',
  `qty_booked` double DEFAULT NULL,
  `qty_pending` double DEFAULT NULL,
  `qty_cancel` double DEFAULT NULL,
  `qty_supply` double NOT NULL DEFAULT '0',
  `qty_bonus` int DEFAULT '0',
  `stok_avl` double DEFAULT NULL,
  `ukuran` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga_normal` double NOT NULL DEFAULT '0',
  `harga_sebelum_ppn` double(255,0) DEFAULT NULL,
  `harga` double NOT NULL DEFAULT '0',
  `diskon` double DEFAULT NULL,
  `diskon_persen` double DEFAULT NULL,
  `diskon_standar` double DEFAULT NULL,
  `diskon_promo_rp` double DEFAULT NULL,
  `diskon_promo_persen` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `proses_do` enum('DO','PENDING') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int NOT NULL,
  `modified_on` datetime NOT NULL,
  `tgl_order` date NOT NULL,
  `revisi` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `poin_per_item` int DEFAULT '0',
  `tipe_diskon_so` enum('persen','rupiah_tambah','rupiah_kurang') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `diskon_so` double DEFAULT NULL,
  `landed_cost` double DEFAULT NULL,
  `no_do` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_barang_so` (`nama_material`) USING BTREE,
  KEY `nm_barang_so` (`hardness`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_inquiry_dt_form` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `no_inquiry` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `id_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nama_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `hardness` varchar(300) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `thickness` float(20,0) DEFAULT NULL,
  `length` float(20,0) DEFAULT NULL,
  `width` float(20,0) DEFAULT NULL,
  `density` float(20,0) DEFAULT NULL,
  `form` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0' COMMENT 'demand',
  `length_f` int DEFAULT '0',
  `width_f` int DEFAULT '0',
  `inner_d` int DEFAULT '0',
  `kg_sheet` double(11,0) DEFAULT '0',
  `kg_roll` int DEFAULT '0',
  `qty_pcs` int DEFAULT NULL,
  `qty_roll` int DEFAULT NULL,
  `total_kg` int DEFAULT '0',
  `cust_budget` int unsigned DEFAULT NULL,
  `joint` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `max_joint` int DEFAULT '0',
  `diskon` double DEFAULT NULL,
  `diskon_persen` double DEFAULT NULL,
  `diskon_standar` double DEFAULT NULL,
  `diskon_promo_rp` double DEFAULT NULL,
  `diskon_promo_persen` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `proses_do` enum('DO','PENDING') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int NOT NULL,
  `modified_on` datetime NOT NULL,
  `tgl_order` date NOT NULL,
  `revisi` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `poin_per_item` int DEFAULT '0',
  `tipe_diskon_so` enum('persen','rupiah_tambah','rupiah_kurang') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `diskon_so` double DEFAULT NULL,
  `landed_cost` double DEFAULT NULL,
  `no_do` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_barang_so` (`nama_material`) USING BTREE,
  KEY `nm_barang_so` (`hardness`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_inquiry_hd` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_inquiry` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `tgl_inquiry` date DEFAULT NULL,
  `project` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `pic_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_sales` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0000-00-00',
  `ket_project` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `joint` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `max_joint` varchar(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `sample` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pay_instrument` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pay_term` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_quotation` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_spk` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_inquiry_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_inquiry` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `perkiraan_bayar` date DEFAULT NULL,
  `nominal` double(255,0) DEFAULT NULL,
  `tipe_payment` enum('persen','nominal') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_ar` (
  `id_invoice` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tgl_kirim` date DEFAULT NULL,
  `kirim_via` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JNE / Driver / lainnya',
  `ket_kirim` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `no_resi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tgl_terima` date DEFAULT NULL COMMENT 'dasar umur piutang',
  `ket_terima` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `bukti_terima` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bukti_terima_nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fu_pic_nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fu_pic_telp` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fu1_plan` date DEFAULT NULL,
  `fu1_aktual` date DEFAULT NULL,
  `fu1_ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `fu2_plan` date DEFAULT NULL,
  `fu2_aktual` date DEFAULT NULL,
  `fu2_ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `fu3_plan` date DEFAULT NULL,
  `fu3_aktual` date DEFAULT NULL,
  `fu3_ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `fu4_plan` date DEFAULT NULL,
  `fu4_aktual` date DEFAULT NULL,
  `fu4_ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `plan_bayar` date DEFAULT NULL,
  `ket_plan_bayar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `plan_bayar_nominal` decimal(20,2) DEFAULT NULL,
  `status_from` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status_changed_date` datetime DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_invoice`) USING BTREE,
  KEY `idx_tgl_terima` (`tgl_terima`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_ar_fu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_invoice` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `ke` smallint NOT NULL COMMENT 'nomor FU: 5, 6, ...',
  `plan` date DEFAULT NULL,
  `aktual` date DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_invoice_ke` (`id_invoice`,`ke`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_ar_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_invoice` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `aksi` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'simpan / close',
  `data_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_invoice` (`id_invoice`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_detail_non_kons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nm_item` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `qty` decimal(20,2) NOT NULL DEFAULT '0.00',
  `harga` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `input_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `input_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_header` (
  `id_invoice` int NOT NULL AUTO_INCREMENT,
  `id_penagihan` int DEFAULT NULL,
  `id_bq` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs_jual` decimal(50,2) DEFAULT '0.00',
  `persentase` decimal(50,2) DEFAULT '0.00',
  `kurs_bayar` decimal(50,2) DEFAULT '0.00',
  `total_product` decimal(50,2) DEFAULT '0.00',
  `total_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_gab_product` decimal(50,2) DEFAULT '0.00',
  `total_gab_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_material` decimal(50,2) DEFAULT '0.00',
  `total_material_idr` decimal(50,2) DEFAULT '0.00',
  `total_bq` decimal(50,2) DEFAULT '0.00',
  `total_bq_idr` decimal(50,2) DEFAULT '0.00',
  `total_enginering` decimal(50,2) DEFAULT '0.00',
  `total_enginering_idr` decimal(50,2) DEFAULT '0.00',
  `total_packing` decimal(50,2) DEFAULT '0.00',
  `total_packing_idr` decimal(50,2) DEFAULT '0.00',
  `total_trucking` decimal(50,2) DEFAULT '0.00',
  `total_trucking_idr` decimal(50,2) DEFAULT '0.00',
  `total_dpp_usd` decimal(50,2) DEFAULT '0.00',
  `total_dpp_rp` decimal(50,2) DEFAULT '0.00',
  `total_diskon` decimal(50,2) DEFAULT '0.00',
  `total_diskon_idr` decimal(50,2) DEFAULT '0.00',
  `total_retensi` decimal(50,2) DEFAULT '0.00',
  `total_retensi_idr` decimal(50,2) DEFAULT '0.00',
  `total_ppn` decimal(50,2) DEFAULT '0.00',
  `total_ppn_idr` decimal(50,2) DEFAULT '0.00',
  `total_invoice` decimal(50,2) DEFAULT '0.00',
  `total_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_um` decimal(50,2) DEFAULT '0.00',
  `total_um_idr` decimal(50,2) DEFAULT '0.00',
  `total_bayar` decimal(50,2) DEFAULT '0.00',
  `total_bayar_idr` decimal(50,2) DEFAULT '0.00',
  `series` char(9) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `order_type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `rev` tinyint DEFAULT '0',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `cancel_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `no_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_faktur` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pajak` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_term` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `proses_print` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `est_date` datetime DEFAULT NULL,
  `approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_est_date` datetime DEFAULT NULL,
  `aju_approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_date` datetime DEFAULT NULL,
  `aju_approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_est_date` datetime DEFAULT NULL,
  `reason_approved` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_approved_est` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_sts` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_date` datetime DEFAULT NULL,
  `mat_plan_sts` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `mat_plan_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mat_plan_date` datetime DEFAULT NULL,
  `total_um2` decimal(50,2) DEFAULT '0.00',
  `total_um_idr2` decimal(50,2) DEFAULT '0.00',
  `id_top` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `base_cur` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'USD',
  `file_inv` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_retensi2` decimal(50,2) DEFAULT '0.00',
  `total_retensi2_idr` decimal(50,2) DEFAULT '0.00',
  `printed_on` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sisa_invoice_idr` double(50,2) DEFAULT '0.00',
  `sisa_invoice` double(50,2) DEFAULT '0.00',
  `sisa_invoice_retensi2_idr` double(50,2) DEFAULT '0.00',
  `sisa_invoice_retensi2` double(50,2) DEFAULT '0.00',
  PRIMARY KEY (`id_invoice`) USING BTREE,
  UNIQUE KEY `no_faktur_UNIQUE` (`no_faktur`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_header_bef_cleansing` (
  `id_invoice` int NOT NULL AUTO_INCREMENT,
  `id_penagihan` int DEFAULT NULL,
  `id_bq` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs_jual` decimal(50,2) DEFAULT '0.00',
  `persentase` decimal(50,2) DEFAULT '0.00',
  `kurs_bayar` decimal(50,2) DEFAULT '0.00',
  `total_product` decimal(50,2) DEFAULT '0.00',
  `total_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_gab_product` decimal(50,2) DEFAULT '0.00',
  `total_gab_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_material` decimal(50,2) DEFAULT '0.00',
  `total_material_idr` decimal(50,2) DEFAULT '0.00',
  `total_bq` decimal(50,2) DEFAULT '0.00',
  `total_bq_idr` decimal(50,2) DEFAULT '0.00',
  `total_enginering` decimal(50,2) DEFAULT '0.00',
  `total_enginering_idr` decimal(50,2) DEFAULT '0.00',
  `total_packing` decimal(50,2) DEFAULT '0.00',
  `total_packing_idr` decimal(50,2) DEFAULT '0.00',
  `total_trucking` decimal(50,2) DEFAULT '0.00',
  `total_trucking_idr` decimal(50,2) DEFAULT '0.00',
  `total_dpp_usd` decimal(50,2) DEFAULT '0.00',
  `total_dpp_rp` decimal(50,2) DEFAULT '0.00',
  `total_diskon` decimal(50,2) DEFAULT '0.00',
  `total_diskon_idr` decimal(50,2) DEFAULT '0.00',
  `total_retensi` decimal(50,2) DEFAULT '0.00',
  `total_retensi_idr` decimal(50,2) DEFAULT '0.00',
  `total_ppn` decimal(50,2) DEFAULT '0.00',
  `total_ppn_idr` decimal(50,2) DEFAULT '0.00',
  `total_invoice` decimal(50,2) DEFAULT '0.00',
  `total_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_um` decimal(50,2) DEFAULT '0.00',
  `total_um_idr` decimal(50,2) DEFAULT '0.00',
  `total_bayar` decimal(50,2) DEFAULT '0.00',
  `total_bayar_idr` decimal(50,2) DEFAULT '0.00',
  `series` char(9) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `order_type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `rev` tinyint DEFAULT '0',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `cancel_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `no_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_faktur` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pajak` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_term` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `proses_print` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `est_date` datetime DEFAULT NULL,
  `approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_est_date` datetime DEFAULT NULL,
  `aju_approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_date` datetime DEFAULT NULL,
  `aju_approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_est_date` datetime DEFAULT NULL,
  `reason_approved` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_approved_est` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_sts` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_date` datetime DEFAULT NULL,
  `mat_plan_sts` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `mat_plan_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mat_plan_date` datetime DEFAULT NULL,
  `total_um2` decimal(50,2) DEFAULT '0.00',
  `total_um_idr2` decimal(50,2) DEFAULT '0.00',
  `id_top` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `base_cur` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'USD',
  `file_inv` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_retensi2` decimal(50,2) DEFAULT '0.00',
  `total_retensi2_idr` decimal(50,2) DEFAULT '0.00',
  `printed_on` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sisa_invoice_idr` double(50,2) DEFAULT '0.00',
  `sisa_invoice` double(50,2) DEFAULT '0.00',
  PRIMARY KEY (`id_invoice`) USING BTREE,
  UNIQUE KEY `no_faktur_UNIQUE` (`no_faktur`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_header_copy1` (
  `id_invoice` int NOT NULL AUTO_INCREMENT,
  `id_penagihan` int DEFAULT NULL,
  `id_bq` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs_jual` decimal(50,2) DEFAULT '0.00',
  `persentase` decimal(50,2) DEFAULT '0.00',
  `kurs_bayar` decimal(50,2) DEFAULT '0.00',
  `total_product` decimal(50,2) DEFAULT '0.00',
  `total_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_gab_product` decimal(50,2) DEFAULT '0.00',
  `total_gab_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_material` decimal(50,2) DEFAULT '0.00',
  `total_material_idr` decimal(50,2) DEFAULT '0.00',
  `total_bq` decimal(50,2) DEFAULT '0.00',
  `total_bq_idr` decimal(50,2) DEFAULT '0.00',
  `total_enginering` decimal(50,2) DEFAULT '0.00',
  `total_enginering_idr` decimal(50,2) DEFAULT '0.00',
  `total_packing` decimal(50,2) DEFAULT '0.00',
  `total_packing_idr` decimal(50,2) DEFAULT '0.00',
  `total_trucking` decimal(50,2) DEFAULT '0.00',
  `total_trucking_idr` decimal(50,2) DEFAULT '0.00',
  `total_dpp_usd` decimal(50,2) DEFAULT '0.00',
  `total_dpp_rp` decimal(50,2) DEFAULT '0.00',
  `total_diskon` decimal(50,2) DEFAULT '0.00',
  `total_diskon_idr` decimal(50,2) DEFAULT '0.00',
  `total_retensi` decimal(50,2) DEFAULT '0.00',
  `total_retensi_idr` decimal(50,2) DEFAULT '0.00',
  `total_ppn` decimal(50,2) DEFAULT '0.00',
  `total_ppn_idr` decimal(50,2) DEFAULT '0.00',
  `total_invoice` decimal(50,2) DEFAULT '0.00',
  `total_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_um` decimal(50,2) DEFAULT '0.00',
  `total_um_idr` decimal(50,2) DEFAULT '0.00',
  `total_bayar` decimal(50,2) DEFAULT '0.00',
  `total_bayar_idr` decimal(50,2) DEFAULT '0.00',
  `series` char(9) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `order_type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `rev` tinyint DEFAULT '0',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `cancel_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `no_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_faktur` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pajak` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_term` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `proses_print` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `est_date` datetime DEFAULT NULL,
  `approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_est_date` datetime DEFAULT NULL,
  `aju_approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_date` datetime DEFAULT NULL,
  `aju_approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_est_date` datetime DEFAULT NULL,
  `reason_approved` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_approved_est` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_sts` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_date` datetime DEFAULT NULL,
  `mat_plan_sts` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `mat_plan_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mat_plan_date` datetime DEFAULT NULL,
  `total_um2` decimal(50,2) DEFAULT '0.00',
  `total_um_idr2` decimal(50,2) DEFAULT '0.00',
  `id_top` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `base_cur` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'USD',
  `file_inv` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_retensi2` decimal(50,2) DEFAULT '0.00',
  `total_retensi2_idr` decimal(50,2) DEFAULT '0.00',
  `printed_on` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sisa_invoice_idr` double(50,2) DEFAULT '0.00',
  `sisa_invoice` double(50,2) DEFAULT '0.00',
  PRIMARY KEY (`id_invoice`) USING BTREE,
  UNIQUE KEY `no_faktur_UNIQUE` (`no_faktur`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_np_header` (
  `id_invoice` int NOT NULL AUTO_INCREMENT,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(1500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs_jual` decimal(50,2) DEFAULT '1.00',
  `persentase` decimal(50,2) DEFAULT '0.00',
  `kurs_bayar` decimal(50,2) DEFAULT '1.00',
  `total_dpp_usd` decimal(50,2) DEFAULT '0.00',
  `total_dpp_rp` decimal(50,2) DEFAULT '0.00',
  `ppn_persen` decimal(50,2) DEFAULT '0.00',
  `total_ppn_idr` decimal(50,2) DEFAULT '0.00',
  `pph_persen` decimal(50,2) DEFAULT '0.00',
  `total_pph_idr` decimal(50,2) DEFAULT '0.00',
  `total_invoice_usd` decimal(50,2) DEFAULT '0.00',
  `total_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_bayar_usd` decimal(50,2) DEFAULT '0.00',
  `total_bayar_idr` decimal(50,2) DEFAULT '0.00',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `no_faktur` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pajak` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `base_cur` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'IDR',
  `file_inv` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sisa_invoice_idr` double(50,2) DEFAULT '0.00',
  `sisa_invoice` double(50,2) DEFAULT '0.00',
  `printed_on` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_invoice`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_np_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_pembayaran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_reff` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_reff` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_pembayaran` date DEFAULT NULL,
  `kurs_bayar` double DEFAULT NULL,
  `jumlah_piutang` double DEFAULT NULL,
  `jumlah_piutang_idr` double DEFAULT NULL,
  `jumlah_bank` double DEFAULT NULL,
  `jumlah_bank_idr` double DEFAULT NULL,
  `jumlah_pembayaran` double DEFAULT NULL,
  `jumlah_pembayaran_idr` double DEFAULT NULL,
  `pembayaran_ke` int DEFAULT NULL COMMENT 'Pembayaran Ke-1, Ke-2 dst',
  `kd_bank` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_bank` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_admin` decimal(10,2) DEFAULT '0.00',
  `biaya_admin_idr` decimal(10,2) DEFAULT '0.00',
  `jenis_pph` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_pph` decimal(10,2) DEFAULT '0.00',
  `biaya_pph_idr` decimal(10,2) DEFAULT '0.00',
  `is_cancel` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kd_bayar_cancel` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_bayar` enum('LUNAS','GIRO','CANCEL') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_on` datetime DEFAULT NULL,
  `cancel_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `selisih` decimal(10,2) DEFAULT NULL,
  `selisih_idr` decimal(10,2) DEFAULT NULL,
  `no_account` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_jurnal` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bukti_potong` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lebih_bayar` decimal(50,2) DEFAULT NULL,
  `tambah_lebih_bayar` decimal(50,2) DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kd_pembayaran_UNIQUE` (`kd_pembayaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_np_payment_delete` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_pembayaran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_reff` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_reff` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_pembayaran` date DEFAULT NULL,
  `kurs_bayar` double DEFAULT NULL,
  `jumlah_piutang` double DEFAULT NULL,
  `jumlah_piutang_idr` double DEFAULT NULL,
  `jumlah_bank` double DEFAULT NULL,
  `jumlah_bank_idr` double DEFAULT NULL,
  `jumlah_pembayaran` double DEFAULT NULL,
  `jumlah_pembayaran_idr` double DEFAULT NULL,
  `pembayaran_ke` int DEFAULT NULL COMMENT 'Pembayaran Ke-1, Ke-2 dst',
  `kd_bank` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_bank` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_admin` decimal(10,2) DEFAULT '0.00',
  `biaya_admin_idr` decimal(10,2) DEFAULT '0.00',
  `jenis_pph` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_pph` decimal(10,2) DEFAULT '0.00',
  `biaya_pph_idr` decimal(10,2) DEFAULT '0.00',
  `is_cancel` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kd_bayar_cancel` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_bayar` enum('LUNAS','GIRO','CANCEL') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_on` datetime DEFAULT NULL,
  `cancel_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `selisih` decimal(10,2) DEFAULT NULL,
  `selisih_idr` decimal(10,2) DEFAULT NULL,
  `no_account` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_jurnal` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bukti_potong` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lebih_bayar` decimal(50,2) DEFAULT NULL,
  `tambah_lebih_bayar` decimal(50,2) DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kd_pembayaran_UNIQUE` (`kd_pembayaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_np_payment_detail` (
  `id_payment_detail` int NOT NULL AUTO_INCREMENT,
  `kd_pembayaran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs_jual` decimal(50,2) DEFAULT '0.00',
  `persentase` decimal(50,2) DEFAULT '0.00',
  `kurs_bayar` decimal(50,2) DEFAULT '0.00',
  `total_product` decimal(50,2) DEFAULT '0.00',
  `total_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_gab_product` decimal(50,2) DEFAULT '0.00',
  `total_gab_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_material` decimal(50,2) DEFAULT '0.00',
  `total_material_idr` decimal(50,2) DEFAULT '0.00',
  `total_bq` decimal(50,2) DEFAULT '0.00',
  `total_bq_idr` decimal(50,2) DEFAULT '0.00',
  `total_enginering` decimal(50,2) DEFAULT '0.00',
  `total_enginering_idr` decimal(50,2) DEFAULT '0.00',
  `total_packing` decimal(50,2) DEFAULT '0.00',
  `total_packing_idr` decimal(50,2) DEFAULT '0.00',
  `total_trucking` decimal(50,2) DEFAULT '0.00',
  `total_trucking_idr` decimal(50,2) DEFAULT '0.00',
  `total_dpp_usd` decimal(50,2) DEFAULT '0.00',
  `total_dpp_rp` decimal(50,2) DEFAULT '0.00',
  `total_diskon` decimal(50,2) DEFAULT '0.00',
  `total_diskon_idr` decimal(50,2) DEFAULT '0.00',
  `total_retensi` decimal(50,2) DEFAULT '0.00',
  `total_retensi_idr` decimal(50,2) DEFAULT '0.00',
  `total_ppn` decimal(50,2) DEFAULT '0.00',
  `total_ppn_idr` decimal(50,2) DEFAULT '0.00',
  `total_invoice` decimal(50,2) DEFAULT '0.00',
  `total_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_um` decimal(50,2) DEFAULT '0.00',
  `total_um_idr` decimal(50,2) DEFAULT '0.00',
  `total_bayar` decimal(50,2) DEFAULT '0.00',
  `total_bayar_idr` decimal(50,2) DEFAULT '0.00',
  `total_quotation` decimal(50,2) DEFAULT '0.00',
  `project_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `rev` tinyint DEFAULT '0',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `cancel_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `no_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_faktur` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pajak` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_term` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `proses_print` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `est_date` datetime DEFAULT NULL,
  `approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_est_date` datetime DEFAULT NULL,
  `aju_approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_date` datetime DEFAULT NULL,
  `aju_approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_est_date` datetime DEFAULT NULL,
  `reason_approved` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_approved_est` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_sts` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_date` datetime DEFAULT NULL,
  `mat_plan_sts` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `mat_plan_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mat_plan_date` datetime DEFAULT NULL,
  `total_um2` decimal(50,2) DEFAULT '0.00',
  `total_um_idr2` decimal(50,2) DEFAULT '0.00',
  `kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_top` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sisa_invoice` decimal(50,2) DEFAULT '0.00',
  `sisa_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_pph` decimal(50,2) DEFAULT '0.00',
  `total_pph_idr` decimal(50,2) DEFAULT '0.00',
  `total_jual_idr` decimal(50,2) DEFAULT '0.00',
  `selisih_idr` decimal(50,2) DEFAULT '0.00',
  PRIMARY KEY (`id_payment_detail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_np_payment_detail_delete` (
  `id_payment_detail` int NOT NULL AUTO_INCREMENT,
  `kd_pembayaran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs_jual` decimal(50,2) DEFAULT '0.00',
  `persentase` decimal(50,2) DEFAULT '0.00',
  `kurs_bayar` decimal(50,2) DEFAULT '0.00',
  `total_product` decimal(50,2) DEFAULT '0.00',
  `total_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_gab_product` decimal(50,2) DEFAULT '0.00',
  `total_gab_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_material` decimal(50,2) DEFAULT '0.00',
  `total_material_idr` decimal(50,2) DEFAULT '0.00',
  `total_bq` decimal(50,2) DEFAULT '0.00',
  `total_bq_idr` decimal(50,2) DEFAULT '0.00',
  `total_enginering` decimal(50,2) DEFAULT '0.00',
  `total_enginering_idr` decimal(50,2) DEFAULT '0.00',
  `total_packing` decimal(50,2) DEFAULT '0.00',
  `total_packing_idr` decimal(50,2) DEFAULT '0.00',
  `total_trucking` decimal(50,2) DEFAULT '0.00',
  `total_trucking_idr` decimal(50,2) DEFAULT '0.00',
  `total_dpp_usd` decimal(50,2) DEFAULT '0.00',
  `total_dpp_rp` decimal(50,2) DEFAULT '0.00',
  `total_diskon` decimal(50,2) DEFAULT '0.00',
  `total_diskon_idr` decimal(50,2) DEFAULT '0.00',
  `total_retensi` decimal(50,2) DEFAULT '0.00',
  `total_retensi_idr` decimal(50,2) DEFAULT '0.00',
  `total_ppn` decimal(50,2) DEFAULT '0.00',
  `total_ppn_idr` decimal(50,2) DEFAULT '0.00',
  `total_invoice` decimal(50,2) DEFAULT '0.00',
  `total_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_um` decimal(50,2) DEFAULT '0.00',
  `total_um_idr` decimal(50,2) DEFAULT '0.00',
  `total_bayar` decimal(50,2) DEFAULT '0.00',
  `total_bayar_idr` decimal(50,2) DEFAULT '0.00',
  `total_quotation` decimal(50,2) DEFAULT '0.00',
  `project_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `rev` tinyint DEFAULT '0',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `cancel_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `no_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_faktur` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pajak` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_term` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `proses_print` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `est_date` datetime DEFAULT NULL,
  `approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_est_date` datetime DEFAULT NULL,
  `aju_approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_date` datetime DEFAULT NULL,
  `aju_approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_est_date` datetime DEFAULT NULL,
  `reason_approved` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_approved_est` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_sts` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_date` datetime DEFAULT NULL,
  `mat_plan_sts` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `mat_plan_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mat_plan_date` datetime DEFAULT NULL,
  `total_um2` decimal(50,2) DEFAULT '0.00',
  `total_um_idr2` decimal(50,2) DEFAULT '0.00',
  `kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_top` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sisa_invoice` decimal(50,2) DEFAULT '0.00',
  `sisa_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_pph` decimal(50,2) DEFAULT '0.00',
  `total_pph_idr` decimal(50,2) DEFAULT '0.00',
  `total_jual_idr` decimal(50,2) DEFAULT '0.00',
  `selisih_idr` decimal(50,2) DEFAULT '0.00',
  PRIMARY KEY (`id_payment_detail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_pembayaran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_reff` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_reff` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_pembayaran` date DEFAULT NULL,
  `kurs_bayar` decimal(20,2) DEFAULT NULL,
  `jumlah_piutang` double DEFAULT NULL,
  `jumlah_piutang_idr` double DEFAULT NULL,
  `jumlah_bank` double DEFAULT NULL,
  `jumlah_bank_idr` double DEFAULT NULL,
  `jumlah_pembayaran` double DEFAULT NULL,
  `jumlah_pembayaran_idr` double DEFAULT NULL,
  `pembayaran_ke` int DEFAULT NULL COMMENT 'Pembayaran Ke-1, Ke-2 dst',
  `kd_bank` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_bank` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_admin` decimal(50,0) DEFAULT '0',
  `biaya_admin_idr` decimal(50,0) DEFAULT '0',
  `jenis_pph` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_pph` decimal(50,2) DEFAULT '0.00',
  `biaya_pph_idr` decimal(50,2) DEFAULT '0.00',
  `is_cancel` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kd_bayar_cancel` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_bayar` enum('LUNAS','GIRO','CANCEL') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_on` datetime DEFAULT NULL,
  `cancel_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `selisih` decimal(50,2) DEFAULT NULL,
  `selisih_idr` decimal(50,2) DEFAULT NULL,
  `no_account` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_jurnal` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bukti_potong` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lebih_bayar` decimal(50,2) DEFAULT NULL,
  `tambah_lebih_bayar` decimal(50,2) DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kd_pembayaran_UNIQUE` (`kd_pembayaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_payment2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_pembayaran` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_invoice` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_reff` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_reff` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_pembayaran` date DEFAULT NULL,
  `kurs_bayar` double DEFAULT NULL,
  `jumlah_piutang` double DEFAULT NULL,
  `jumlah_piutang_idr` double DEFAULT NULL,
  `jumlah_bank` double DEFAULT NULL,
  `jumlah_bank_idr` double DEFAULT NULL,
  `jumlah_pembayaran` double DEFAULT NULL,
  `jumlah_pembayaran_idr` double DEFAULT NULL,
  `pembayaran_ke` int DEFAULT NULL COMMENT 'Pembayaran Ke-1, Ke-2 dst',
  `kd_bank` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_bank` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_admin` decimal(10,2) DEFAULT '0.00',
  `biaya_admin_idr` decimal(10,2) DEFAULT '0.00',
  `jenis_pph` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_pph` decimal(10,2) DEFAULT '0.00',
  `biaya_pph_idr` decimal(10,2) DEFAULT '0.00',
  `is_cancel` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kd_bayar_cancel` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_bayar` enum('LUNAS','GIRO','CANCEL') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_on` datetime DEFAULT NULL,
  `cancel_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `selisih` decimal(10,2) DEFAULT NULL,
  `selisih_idr` decimal(10,2) DEFAULT NULL,
  `no_account` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kd_pembayaran_UNIQUE` (`kd_pembayaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_payment_copy1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_pembayaran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_reff` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_reff` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_pembayaran` date DEFAULT NULL,
  `kurs_bayar` double DEFAULT NULL,
  `jumlah_piutang` double DEFAULT NULL,
  `jumlah_piutang_idr` double DEFAULT NULL,
  `jumlah_bank` double DEFAULT NULL,
  `jumlah_bank_idr` double DEFAULT NULL,
  `jumlah_pembayaran` double DEFAULT NULL,
  `jumlah_pembayaran_idr` double DEFAULT NULL,
  `pembayaran_ke` int DEFAULT NULL COMMENT 'Pembayaran Ke-1, Ke-2 dst',
  `kd_bank` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_bank` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_admin` decimal(10,2) DEFAULT '0.00',
  `biaya_admin_idr` decimal(10,2) DEFAULT '0.00',
  `jenis_pph` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_pph` decimal(10,2) DEFAULT '0.00',
  `biaya_pph_idr` decimal(10,2) DEFAULT '0.00',
  `is_cancel` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kd_bayar_cancel` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_bayar` enum('LUNAS','GIRO','CANCEL') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_on` datetime DEFAULT NULL,
  `cancel_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `selisih` decimal(10,2) DEFAULT NULL,
  `selisih_idr` decimal(10,2) DEFAULT NULL,
  `no_account` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_jurnal` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bukti_potong` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lebih_bayar` decimal(50,2) DEFAULT NULL,
  `tambah_lebih_bayar` decimal(50,2) DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kd_pembayaran_UNIQUE` (`kd_pembayaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_payment_delete` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_pembayaran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_reff` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_reff` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_pembayaran` date DEFAULT NULL,
  `kurs_bayar` double DEFAULT NULL,
  `jumlah_piutang` double DEFAULT NULL,
  `jumlah_piutang_idr` double DEFAULT NULL,
  `jumlah_bank` double DEFAULT NULL,
  `jumlah_bank_idr` double DEFAULT NULL,
  `jumlah_pembayaran` double DEFAULT NULL,
  `jumlah_pembayaran_idr` double DEFAULT NULL,
  `pembayaran_ke` int DEFAULT NULL COMMENT 'Pembayaran Ke-1, Ke-2 dst',
  `kd_bank` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_bank` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_admin` decimal(10,2) DEFAULT '0.00',
  `biaya_admin_idr` decimal(10,2) DEFAULT '0.00',
  `jenis_pph` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_pph` decimal(10,2) DEFAULT '0.00',
  `biaya_pph_idr` decimal(10,2) DEFAULT '0.00',
  `is_cancel` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kd_bayar_cancel` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_bayar` enum('LUNAS','GIRO','CANCEL') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_on` datetime DEFAULT NULL,
  `cancel_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `selisih` decimal(10,2) DEFAULT NULL,
  `selisih_idr` decimal(10,2) DEFAULT NULL,
  `no_account` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_jurnal` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bukti_potong` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lebih_bayar` decimal(50,2) DEFAULT NULL,
  `tambah_lebih_bayar` decimal(50,2) DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kd_pembayaran_UNIQUE` (`kd_pembayaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_payment_detail` (
  `id_payment_detail` int NOT NULL AUTO_INCREMENT,
  `kd_pembayaran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs_jual` decimal(50,2) DEFAULT '0.00',
  `persentase` decimal(50,2) DEFAULT '0.00',
  `kurs_bayar` decimal(50,2) DEFAULT '0.00',
  `total_product` decimal(50,2) DEFAULT '0.00',
  `total_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_gab_product` decimal(50,2) DEFAULT '0.00',
  `total_gab_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_material` decimal(50,2) DEFAULT '0.00',
  `total_material_idr` decimal(50,2) DEFAULT '0.00',
  `total_bq` decimal(50,2) DEFAULT '0.00',
  `total_bq_idr` decimal(50,2) DEFAULT '0.00',
  `total_enginering` decimal(50,2) DEFAULT '0.00',
  `total_enginering_idr` decimal(50,2) DEFAULT '0.00',
  `total_packing` decimal(50,2) DEFAULT '0.00',
  `total_packing_idr` decimal(50,2) DEFAULT '0.00',
  `total_trucking` decimal(50,2) DEFAULT '0.00',
  `total_trucking_idr` decimal(50,2) DEFAULT '0.00',
  `total_dpp_usd` decimal(50,2) DEFAULT '0.00',
  `total_dpp_rp` decimal(50,2) DEFAULT '0.00',
  `total_diskon` decimal(50,2) DEFAULT '0.00',
  `total_diskon_idr` decimal(50,2) DEFAULT '0.00',
  `total_retensi` decimal(50,2) DEFAULT '0.00',
  `total_retensi_idr` decimal(50,2) DEFAULT '0.00',
  `total_ppn` decimal(50,2) DEFAULT '0.00',
  `total_ppn_idr` decimal(50,2) DEFAULT '0.00',
  `total_invoice` decimal(50,2) DEFAULT '0.00',
  `total_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_um` decimal(50,2) DEFAULT '0.00',
  `total_um_idr` decimal(50,2) DEFAULT '0.00',
  `total_bayar` decimal(50,2) DEFAULT '0.00',
  `total_bayar_idr` decimal(50,2) DEFAULT '0.00',
  `total_quotation` decimal(50,2) DEFAULT '0.00',
  `project_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `rev` tinyint DEFAULT '0',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `cancel_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `no_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_faktur` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pajak` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_term` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `proses_print` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `est_date` datetime DEFAULT NULL,
  `approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_est_date` datetime DEFAULT NULL,
  `aju_approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_date` datetime DEFAULT NULL,
  `aju_approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_est_date` datetime DEFAULT NULL,
  `reason_approved` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_approved_est` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_sts` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_date` datetime DEFAULT NULL,
  `mat_plan_sts` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `mat_plan_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mat_plan_date` datetime DEFAULT NULL,
  `total_um2` decimal(50,2) DEFAULT '0.00',
  `total_um_idr2` decimal(50,2) DEFAULT '0.00',
  `kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_top` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sisa_invoice` decimal(50,2) DEFAULT '0.00',
  `sisa_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_pph` decimal(50,2) DEFAULT '0.00',
  `total_pph_idr` decimal(50,2) DEFAULT '0.00',
  `total_jual_idr` decimal(50,2) DEFAULT '0.00',
  `selisih_idr` decimal(50,2) DEFAULT '0.00',
  `jenis_pph` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sisa_retensi_idr` decimal(50,2) DEFAULT '0.00',
  `tipe_bayar` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_payment_detail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_payment_detail_copy1` (
  `id_payment_detail` int NOT NULL AUTO_INCREMENT,
  `kd_pembayaran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs_jual` decimal(50,2) DEFAULT '0.00',
  `persentase` decimal(50,2) DEFAULT '0.00',
  `kurs_bayar` decimal(50,2) DEFAULT '0.00',
  `total_product` decimal(50,2) DEFAULT '0.00',
  `total_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_gab_product` decimal(50,2) DEFAULT '0.00',
  `total_gab_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_material` decimal(50,2) DEFAULT '0.00',
  `total_material_idr` decimal(50,2) DEFAULT '0.00',
  `total_bq` decimal(50,2) DEFAULT '0.00',
  `total_bq_idr` decimal(50,2) DEFAULT '0.00',
  `total_enginering` decimal(50,2) DEFAULT '0.00',
  `total_enginering_idr` decimal(50,2) DEFAULT '0.00',
  `total_packing` decimal(50,2) DEFAULT '0.00',
  `total_packing_idr` decimal(50,2) DEFAULT '0.00',
  `total_trucking` decimal(50,2) DEFAULT '0.00',
  `total_trucking_idr` decimal(50,2) DEFAULT '0.00',
  `total_dpp_usd` decimal(50,2) DEFAULT '0.00',
  `total_dpp_rp` decimal(50,2) DEFAULT '0.00',
  `total_diskon` decimal(50,2) DEFAULT '0.00',
  `total_diskon_idr` decimal(50,2) DEFAULT '0.00',
  `total_retensi` decimal(50,2) DEFAULT '0.00',
  `total_retensi_idr` decimal(50,2) DEFAULT '0.00',
  `total_ppn` decimal(50,2) DEFAULT '0.00',
  `total_ppn_idr` decimal(50,2) DEFAULT '0.00',
  `total_invoice` decimal(50,2) DEFAULT '0.00',
  `total_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_um` decimal(50,2) DEFAULT '0.00',
  `total_um_idr` decimal(50,2) DEFAULT '0.00',
  `total_bayar` decimal(50,2) DEFAULT '0.00',
  `total_bayar_idr` decimal(50,2) DEFAULT '0.00',
  `total_quotation` decimal(50,2) DEFAULT '0.00',
  `project_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `rev` tinyint DEFAULT '0',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `cancel_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `no_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_faktur` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pajak` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_term` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `proses_print` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `est_date` datetime DEFAULT NULL,
  `approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_est_date` datetime DEFAULT NULL,
  `aju_approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_date` datetime DEFAULT NULL,
  `aju_approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_est_date` datetime DEFAULT NULL,
  `reason_approved` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_approved_est` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_sts` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_date` datetime DEFAULT NULL,
  `mat_plan_sts` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `mat_plan_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mat_plan_date` datetime DEFAULT NULL,
  `total_um2` decimal(50,2) DEFAULT '0.00',
  `total_um_idr2` decimal(50,2) DEFAULT '0.00',
  `kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_top` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sisa_invoice` decimal(50,2) DEFAULT '0.00',
  `sisa_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_pph` decimal(50,2) DEFAULT '0.00',
  `total_pph_idr` decimal(50,2) DEFAULT '0.00',
  `total_jual_idr` decimal(50,2) DEFAULT '0.00',
  `selisih_idr` decimal(50,2) DEFAULT '0.00',
  `jenis_pph` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_payment_detail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_payment_detail_delete` (
  `id_payment_detail` int NOT NULL AUTO_INCREMENT,
  `kd_pembayaran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs_jual` decimal(50,2) DEFAULT '0.00',
  `persentase` decimal(50,2) DEFAULT '0.00',
  `kurs_bayar` decimal(50,2) DEFAULT '0.00',
  `total_product` decimal(50,2) DEFAULT '0.00',
  `total_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_gab_product` decimal(50,2) DEFAULT '0.00',
  `total_gab_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_material` decimal(50,2) DEFAULT '0.00',
  `total_material_idr` decimal(50,2) DEFAULT '0.00',
  `total_bq` decimal(50,2) DEFAULT '0.00',
  `total_bq_idr` decimal(50,2) DEFAULT '0.00',
  `total_enginering` decimal(50,2) DEFAULT '0.00',
  `total_enginering_idr` decimal(50,2) DEFAULT '0.00',
  `total_packing` decimal(50,2) DEFAULT '0.00',
  `total_packing_idr` decimal(50,2) DEFAULT '0.00',
  `total_trucking` decimal(50,2) DEFAULT '0.00',
  `total_trucking_idr` decimal(50,2) DEFAULT '0.00',
  `total_dpp_usd` decimal(50,2) DEFAULT '0.00',
  `total_dpp_rp` decimal(50,2) DEFAULT '0.00',
  `total_diskon` decimal(50,2) DEFAULT '0.00',
  `total_diskon_idr` decimal(50,2) DEFAULT '0.00',
  `total_retensi` decimal(50,2) DEFAULT '0.00',
  `total_retensi_idr` decimal(50,2) DEFAULT '0.00',
  `total_ppn` decimal(50,2) DEFAULT '0.00',
  `total_ppn_idr` decimal(50,2) DEFAULT '0.00',
  `total_invoice` decimal(50,2) DEFAULT '0.00',
  `total_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_um` decimal(50,2) DEFAULT '0.00',
  `total_um_idr` decimal(50,2) DEFAULT '0.00',
  `total_bayar` decimal(50,2) DEFAULT '0.00',
  `total_bayar_idr` decimal(50,2) DEFAULT '0.00',
  `total_quotation` decimal(50,2) DEFAULT '0.00',
  `project_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `rev` tinyint DEFAULT '0',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `cancel_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `no_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_faktur` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pajak` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_term` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `proses_print` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `est_date` datetime DEFAULT NULL,
  `approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_est_date` datetime DEFAULT NULL,
  `aju_approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_date` datetime DEFAULT NULL,
  `aju_approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_est_date` datetime DEFAULT NULL,
  `reason_approved` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_approved_est` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_sts` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_date` datetime DEFAULT NULL,
  `mat_plan_sts` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `mat_plan_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mat_plan_date` datetime DEFAULT NULL,
  `total_um2` decimal(50,2) DEFAULT '0.00',
  `total_um_idr2` decimal(50,2) DEFAULT '0.00',
  `kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_top` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sisa_invoice` decimal(50,2) DEFAULT '0.00',
  `sisa_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_pph` decimal(50,2) DEFAULT '0.00',
  `total_pph_idr` decimal(50,2) DEFAULT '0.00',
  `total_jual_idr` decimal(50,2) DEFAULT '0.00',
  `selisih_idr` decimal(50,2) DEFAULT '0.00',
  `jenis_pph` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_payment_detail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_payment_detail_temp` (
  `id_payment_detail` int NOT NULL AUTO_INCREMENT,
  `kd_pembayaran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs_jual` decimal(50,2) DEFAULT '0.00',
  `persentase` decimal(50,2) DEFAULT '0.00',
  `kurs_bayar` decimal(50,2) DEFAULT '0.00',
  `total_product` decimal(50,2) DEFAULT '0.00',
  `total_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_gab_product` decimal(50,2) DEFAULT '0.00',
  `total_gab_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_material` decimal(50,2) DEFAULT '0.00',
  `total_material_idr` decimal(50,2) DEFAULT '0.00',
  `total_bq` decimal(50,2) DEFAULT '0.00',
  `total_bq_idr` decimal(50,2) DEFAULT '0.00',
  `total_enginering` decimal(50,2) DEFAULT '0.00',
  `total_enginering_idr` decimal(50,2) DEFAULT '0.00',
  `total_packing` decimal(50,2) DEFAULT '0.00',
  `total_packing_idr` decimal(50,2) DEFAULT '0.00',
  `total_trucking` decimal(50,2) DEFAULT '0.00',
  `total_trucking_idr` decimal(50,2) DEFAULT '0.00',
  `total_dpp_usd` decimal(50,2) DEFAULT '0.00',
  `total_dpp_rp` decimal(50,2) DEFAULT '0.00',
  `total_diskon` decimal(50,2) DEFAULT '0.00',
  `total_diskon_idr` decimal(50,2) DEFAULT '0.00',
  `total_retensi` decimal(50,2) DEFAULT '0.00',
  `total_retensi_idr` decimal(50,2) DEFAULT '0.00',
  `total_ppn` decimal(50,2) DEFAULT '0.00',
  `total_ppn_idr` decimal(50,2) DEFAULT '0.00',
  `total_invoice` decimal(50,2) DEFAULT '0.00',
  `total_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_um` decimal(50,2) DEFAULT '0.00',
  `total_um_idr` decimal(50,2) DEFAULT '0.00',
  `total_bayar` decimal(50,2) DEFAULT '0.00',
  `total_bayar_idr` decimal(50,2) DEFAULT '0.00',
  `total_quotation` decimal(50,2) DEFAULT '0.00',
  `project_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `rev` tinyint DEFAULT '0',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `cancel_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `no_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_faktur` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pajak` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_term` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `proses_print` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `est_date` datetime DEFAULT NULL,
  `approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_est_date` datetime DEFAULT NULL,
  `aju_approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_date` datetime DEFAULT NULL,
  `aju_approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_est_date` datetime DEFAULT NULL,
  `reason_approved` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_approved_est` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_sts` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_date` datetime DEFAULT NULL,
  `mat_plan_sts` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `mat_plan_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mat_plan_date` datetime DEFAULT NULL,
  `total_um2` decimal(50,2) DEFAULT '0.00',
  `total_um_idr2` decimal(50,2) DEFAULT '0.00',
  `kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_top` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sisa_invoice` decimal(50,2) DEFAULT '0.00',
  `sisa_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_pph` decimal(50,2) DEFAULT '0.00',
  `total_pph_idr` decimal(50,2) DEFAULT '0.00',
  `total_jual_idr` decimal(50,2) DEFAULT '0.00',
  `selisih_idr` decimal(50,2) DEFAULT '0.00',
  `jenis_pph` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_payment_detail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_payment_temp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_pembayaran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_reff` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_reff` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_pembayaran` date DEFAULT NULL,
  `kurs_bayar` double DEFAULT NULL,
  `jumlah_piutang` double DEFAULT NULL,
  `jumlah_piutang_idr` double DEFAULT NULL,
  `jumlah_bank` double DEFAULT NULL,
  `jumlah_bank_idr` double DEFAULT NULL,
  `jumlah_pembayaran` double DEFAULT NULL,
  `jumlah_pembayaran_idr` double DEFAULT NULL,
  `pembayaran_ke` int DEFAULT NULL COMMENT 'Pembayaran Ke-1, Ke-2 dst',
  `kd_bank` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_bank` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_admin` decimal(50,0) DEFAULT '0',
  `biaya_admin_idr` decimal(50,0) DEFAULT '0',
  `jenis_pph` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_pph` decimal(50,2) DEFAULT '0.00',
  `biaya_pph_idr` decimal(50,2) DEFAULT '0.00',
  `is_cancel` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kd_bayar_cancel` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_bayar` enum('LUNAS','GIRO','CANCEL') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_on` datetime DEFAULT NULL,
  `cancel_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `selisih` decimal(50,2) DEFAULT NULL,
  `selisih_idr` decimal(50,2) DEFAULT NULL,
  `no_account` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_jurnal` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bukti_potong` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lebih_bayar` decimal(50,2) DEFAULT NULL,
  `tambah_lebih_bayar` decimal(50,2) DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kd_pembayaran_UNIQUE` (`kd_pembayaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_po` (
  `id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `curr` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `value_dp` decimal(20,2) DEFAULT NULL,
  `invoice_no` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_pembelian` decimal(20,2) DEFAULT NULL,
  `no_faktur_pajak` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `persen_dp` decimal(20,2) DEFAULT NULL,
  `link_doc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `total_invoice` decimal(20,2) DEFAULT NULL,
  `notes` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `req_payment_po` decimal(20,2) DEFAULT NULL,
  `invoice_date_real` date DEFAULT NULL,
  `tanggal_faktur_pajak` date DEFAULT NULL,
  `id_supplier` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_supplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_top` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bank` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_acc_bank` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `nilai_ppn` decimal(20,2) NOT NULL,
  `nilai_disc` decimal(20,2) NOT NULL,
  `kurs` decimal(20,2) NOT NULL DEFAULT '1.00',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_retensi_tutup_bulan` (
  `id_invoice` int NOT NULL AUTO_INCREMENT,
  `id_penagihan` int DEFAULT NULL,
  `id_bq` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs_jual` decimal(50,2) DEFAULT '0.00',
  `persentase` decimal(50,2) DEFAULT '0.00',
  `kurs_bayar` decimal(50,2) DEFAULT '0.00',
  `total_invoice` decimal(50,2) DEFAULT '0.00',
  `total_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_bayar` decimal(50,2) DEFAULT '0.00',
  `total_bayar_idr` decimal(50,2) DEFAULT '0.00',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `id_top` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `base_cur` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'USD',
  `sisa_invoice_idr` double(50,2) DEFAULT '0.00',
  `sisa_invoice` double(50,2) DEFAULT '0.00',
  `kurs_baru` double(50,2) DEFAULT '0.00',
  `nilai_invoice_baru` double(50,2) DEFAULT '0.00',
  `selisih_debit` double(50,0) DEFAULT '0',
  `selisih_kredit` double(50,0) DEFAULT '0',
  `tanggal` date DEFAULT NULL,
  `sisa_invoice_retensi2_idr` double(50,2) DEFAULT '0.00',
  `sisa_invoice_retensi2` double(50,2) DEFAULT '0.00',
  `selisih_debit_retensi` double(50,0) DEFAULT '0',
  `selisih_kredit_retensi` double(50,0) DEFAULT '0',
  `nilai_retensi_baru` double(50,0) DEFAULT NULL,
  PRIMARY KEY (`id_invoice`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_retensi_tutup_bulan_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_invoice` int DEFAULT NULL,
  `id_penagihan` int DEFAULT NULL,
  `id_bq` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs_jual` decimal(50,2) DEFAULT '0.00',
  `persentase` decimal(50,2) DEFAULT '0.00',
  `kurs_bayar` decimal(50,2) DEFAULT '0.00',
  `total_invoice` decimal(50,2) DEFAULT '0.00',
  `total_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_bayar` decimal(50,2) DEFAULT '0.00',
  `total_bayar_idr` decimal(50,2) DEFAULT '0.00',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `id_top` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `base_cur` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'USD',
  `sisa_invoice_idr` double(50,2) DEFAULT '0.00',
  `sisa_invoice` double(50,2) DEFAULT '0.00',
  `kurs_baru` double(50,2) DEFAULT '0.00',
  `nilai_invoice_baru` double(50,2) DEFAULT '0.00',
  `selisih_debit` double(50,0) DEFAULT '0',
  `selisih_kredit` double(50,0) DEFAULT '0',
  `tanggal` date DEFAULT NULL,
  `sisa_invoice_retensi2_idr` double(50,2) DEFAULT '0.00',
  `sisa_invoice_retensi2` double(50,2) DEFAULT '0.00',
  `selisih_debit_retensi` double(50,0) DEFAULT '0',
  `selisih_kredit_retensi` double(50,0) DEFAULT '0',
  `nilai_retensi_baru` double(50,0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_sales` (
  `id_invoice` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_so` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe_so` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_billing` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe_billing` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai_dpp` decimal(20,2) DEFAULT NULL,
  `nilai_asli` decimal(20,2) DEFAULT NULL,
  `nilai_invoice` decimal(20,2) DEFAULT NULL,
  `persen_invoice` decimal(20,2) DEFAULT NULL,
  `ppn` decimal(20,2) DEFAULT NULL,
  `nilai_ppn` decimal(20,2) DEFAULT NULL,
  `grand_total` decimal(20,2) DEFAULT NULL,
  `tax_invoice_no` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_bayar` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app1_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app1_on` datetime DEFAULT NULL,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_on` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rej1_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rej1_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id_invoice`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_sales_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_invoice` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_so` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe_so` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_delivery` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_produk` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_produk` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty` decimal(20,2) DEFAULT NULL,
  `uom` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga` decimal(20,2) DEFAULT NULL,
  `disc` decimal(20,2) DEFAULT NULL,
  `subtotal` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_tutup_bulan` (
  `id_invoice` int NOT NULL AUTO_INCREMENT,
  `id_penagihan` int DEFAULT NULL,
  `id_bq` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs_jual` decimal(50,2) DEFAULT '0.00',
  `persentase` decimal(50,2) DEFAULT '0.00',
  `kurs_bayar` decimal(50,2) DEFAULT '0.00',
  `total_invoice` decimal(50,2) DEFAULT '0.00',
  `total_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_bayar` decimal(50,2) DEFAULT '0.00',
  `total_bayar_idr` decimal(50,2) DEFAULT '0.00',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `id_top` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `base_cur` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'USD',
  `sisa_invoice_idr` double(50,2) DEFAULT '0.00',
  `sisa_invoice` double(50,2) DEFAULT '0.00',
  `kurs_baru` double(50,2) DEFAULT '0.00',
  `nilai_invoice_baru` double(50,2) DEFAULT '0.00',
  `selisih_debit` double(50,0) DEFAULT '0',
  `selisih_kredit` double(50,0) DEFAULT '0',
  `tanggal` date DEFAULT NULL,
  `sisa_invoice_retensi2_idr` double(50,2) DEFAULT '0.00',
  `sisa_invoice_retensi2` double(50,2) DEFAULT '0.00',
  `selisih_debit_retensi` double(50,0) DEFAULT '0',
  `selisih_kredit_retensi` double(50,0) DEFAULT '0',
  PRIMARY KEY (`id_invoice`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoice_tutup_bulan_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_invoice` int DEFAULT NULL,
  `id_penagihan` int DEFAULT NULL,
  `id_bq` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs_jual` decimal(50,2) DEFAULT '0.00',
  `persentase` decimal(50,2) DEFAULT '0.00',
  `kurs_bayar` decimal(50,2) DEFAULT '0.00',
  `total_invoice` decimal(50,2) DEFAULT '0.00',
  `total_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_bayar` decimal(50,2) DEFAULT '0.00',
  `total_bayar_idr` decimal(50,2) DEFAULT '0.00',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `id_top` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `base_cur` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'USD',
  `sisa_invoice_idr` double(50,2) DEFAULT '0.00',
  `sisa_invoice` double(50,2) DEFAULT '0.00',
  `kurs_baru` double(50,2) DEFAULT '0.00',
  `nilai_invoice_baru` double(50,2) DEFAULT '0.00',
  `selisih_debit` double(50,0) DEFAULT '0',
  `selisih_kredit` double(50,0) DEFAULT '0',
  `tanggal` date DEFAULT NULL,
  `sisa_invoice_retensi2_idr` double(50,2) DEFAULT '0.00',
  `sisa_invoice_retensi2` double(50,2) DEFAULT '0.00',
  `selisih_debit_retensi` double(50,0) DEFAULT '0',
  `selisih_kredit_retensi` double(50,0) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_invoicing` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_actual_plan_tagih` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_detail_plan_tagih` int NOT NULL,
  `id_penawaran` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_customer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `id_project` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_project` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `id_project_leader` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_project_leader` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_sales` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_sales` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tanggal_invoice` date DEFAULT NULL,
  `no_invoice` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `no_po` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `total_nominal` decimal(20,2) DEFAULT NULL,
  `dpp_nilai_lain` decimal(20,2) DEFAULT NULL,
  `pajak` decimal(20,2) DEFAULT NULL,
  `total_akhir` decimal(20,2) DEFAULT NULL,
  `total_nominal_jurnal` decimal(20,2) DEFAULT NULL,
  `dpp_lain_lain_jurnal` decimal(20,2) DEFAULT NULL,
  `ppn_jurnal` decimal(20,2) DEFAULT NULL,
  `tagihan_ppn_jurnal` decimal(20,2) DEFAULT NULL,
  `pph_jurnal` decimal(20,2) DEFAULT NULL,
  `total_akhir_jurnal` decimal(20,2) DEFAULT NULL,
  `saldo_piutang` decimal(20,2) DEFAULT NULL,
  `saldo_piutang_tanpa_ppn` decimal(15,2) NOT NULL DEFAULT '0.00',
  `saldo_piutang_tanpa_pph` decimal(20,2) NOT NULL DEFAULT '0.00',
  `print_keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `no_faktur` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipe_invoice` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `non_kons` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `biaya_kirim` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sts_close` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `no_revisi` int DEFAULT '0',
  `ppn_persen` decimal(10,2) NOT NULL DEFAULT '0.00',
  `consulting_version` tinyint DEFAULT NULL,
  `tax_treatment` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `consulting_company_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `consulting_snapshot` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `consulting_top_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `close_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `close_date` datetime DEFAULT NULL,
  `close_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_consulting_top` (`consulting_top_key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_jurnal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_jurnal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tgl_jurnal` date DEFAULT NULL,
  `coa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_coa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `debit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `kredit` decimal(20,2) NOT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `sts` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `tgl_posting` datetime DEFAULT NULL,
  `posted_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `no_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `jenis_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_divisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_divisi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_penerimaan_transaction_coa` (`no_transaksi`,`jenis_transaksi`,`coa`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_jurnal_bak_pengembalian_coa_20261103` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_jurnal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tgl_jurnal` date DEFAULT NULL,
  `coa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_coa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `debit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `kredit` decimal(20,2) NOT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `sts` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '0',
  `tgl_posting` datetime DEFAULT NULL,
  `posted_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `no_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `jenis_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_divisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_divisi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_penerimaan_transaction_coa` (`no_transaksi`,`jenis_transaksi`,`coa`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_jurnal_payment_attempts` (
  `voucher` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `source_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fingerprint` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `accounting_number` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `company` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `actor_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`voucher`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_jurnal_payment_reference_aliases` (
  `run_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `journal_id` bigint unsigned NOT NULL,
  `original_no_transaksi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `voucher` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `approval_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `active` tinyint NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`run_id`,`journal_id`) USING BTREE,
  KEY `active_journal` (`journal_id`,`active`) USING BTREE,
  KEY `active_voucher` (`voucher`,`active`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_jurnal_postings` (
  `group_key` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `source` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `no_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `jenis_transaksi` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_company` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `posted_at` datetime NOT NULL,
  `posted_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `posted_by_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `accounting_numbers` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`group_key`) USING BTREE,
  KEY `idx_jurnal_posted_at` (`posted_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_kartu_hutang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nomor` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tanggal` date DEFAULT NULL,
  `no_perkiraan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `no_reff` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `debet` double DEFAULT '0',
  `kredit` double DEFAULT '0',
  `nocust` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `valid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu_valid` datetime DEFAULT NULL,
  `stspos` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `jenis_jurnal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_supplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_supplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_request` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `debet_usd` double DEFAULT '0',
  `kredit_usd` double DEFAULT '0',
  `id_company` int DEFAULT NULL,
  `nm_company` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_kartu_piutang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nomor` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tanggal` date DEFAULT NULL,
  `no_perkiraan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `no_reff` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `debet` double DEFAULT '0',
  `kredit` double DEFAULT '0',
  `nocust` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `valid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu_valid` datetime DEFAULT NULL,
  `stspos` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `jenis_jurnal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_supplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_supplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `debet_usd` double DEFAULT '0',
  `kredit_usd` double DEFAULT '0',
  `id_company` int DEFAULT NULL,
  `nm_company` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_kasbon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_doc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_doc` date DEFAULT NULL,
  `departement` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumlah_kasbon` decimal(20,0) DEFAULT '0',
  `keperluan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `doc_file` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int DEFAULT '0',
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `coa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `doc_file_2` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bank_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accnumber` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `project` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `st_reject` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
  `no_so` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumlah_expense` decimal(20,0) DEFAULT '0',
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_pr` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe_pr` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject` int NOT NULL,
  `sts_reject_manage` int NOT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `metode_pembayaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_expense_pett_pr_non_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bukti_pengembalian` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurang_bayar` double DEFAULT NULL,
  `project_consultant` int NOT NULL DEFAULT '0',
  `no_kasbon_consultant` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_incoming` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_coa` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_coa` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `sts_finance` enum('1','0') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `app_finance_date` datetime DEFAULT NULL,
  `reject_reason_finance` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_kwitansi_deposit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_kwitansi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tanggal_kwitansi` date NOT NULL,
  `id_customer` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nm_customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1',
  `po_customer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nilai_kwitansi` decimal(20,2) NOT NULL,
  `status` enum('MENUNGGU_PEMBAYARAN','LUNAS') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'MENUNGGU_PEMBAYARAN',
  `no_penerimaan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `spk_snapshot` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `no_kwitansi` (`no_kwitansi`) USING BTREE,
  KEY `idx_kw_cust` (`id_customer`) USING BTREE,
  KEY `idx_kw_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_non_po_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `no_doc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_pr` bigint NOT NULL,
  `no_pr` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_pr` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deskripsi` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` double DEFAULT '0',
  `satuan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_dibutuhkan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai_satuan_request` double DEFAULT '0',
  `total_request` double DEFAULT '0',
  `nilai_satuan_bayar` double DEFAULT '0',
  `total_bayar` double DEFAULT '0',
  `keterangan` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `coa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_non_po_header` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_doc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pic` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal_doc` date DEFAULT NULL,
  `nilai_request` double DEFAULT '0',
  `nilai_real` double DEFAULT '0',
  `coa_bank` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `info` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int DEFAULT '0',
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `approve_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
  `jenis` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accnumber` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject` int NOT NULL,
  `sts_reject_manage` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_payment_paid` (
  `id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bank_charge` decimal(20,2) NOT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `admin_charge_bearer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'Penanggung admin charge: company atau recipient',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_pelaporan_petty_cash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_pelaporan` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Format: RPC-YYYY-NNNN',
  `periode_start` date NOT NULL COMMENT 'Senin dari minggu pencatatan',
  `periode_end` date NOT NULL COMMENT 'Jumat dari minggu pencatatan',
  `company` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'STM, VUCA, SUSTAIN',
  `grand_total` decimal(15,0) NOT NULL DEFAULT '0' COMMENT 'SUM nominal pencatatan',
  `status` enum('draft','waiting','approved','reject') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'draft' COMMENT 'Status pelaporan',
  `approver_id` int DEFAULT NULL COMMENT 'FK to users.id_user (approver dari master)',
  `alasan_reject` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci COMMENT 'Alasan reject (min 10 char)',
  `petty_cash_id` smallint NOT NULL COMMENT 'FK to ms_petty_cash.id',
  `created_on` datetime DEFAULT NULL COMMENT 'Auto-filled on create',
  `created_by` int DEFAULT NULL COMMENT 'FK to users.id_user',
  `approved_on` datetime DEFAULT NULL COMMENT 'Waktu approval',
  `approved_by` int DEFAULT NULL COMMENT 'User yang approve',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_no_pelaporan` (`no_pelaporan`) USING BTREE,
  KEY `idx_petty_cash_id` (`petty_cash_id`) USING BTREE,
  KEY `idx_company` (`company`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_approver_id` (`approver_id`) USING BTREE,
  KEY `idx_created_by` (`created_by`) USING BTREE,
  KEY `idx_periode` (`periode_start`,`periode_end`) USING BTREE,
  CONSTRAINT `fk_pelaporan_approver` FOREIGN KEY (`approver_id`) REFERENCES `users` (`id_user`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_pelaporan_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id_user`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_pelaporan_petty_cash` FOREIGN KEY (`petty_cash_id`) REFERENCES `ms_petty_cash` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Header pelaporan petty cash (per minggu per company)';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_pelaporan_petty_cash_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pelaporan_id` int NOT NULL COMMENT 'FK to tr_pelaporan_petty_cash.id',
  `pencatatan_id` int NOT NULL COMMENT 'FK to tr_expense_petty_cash.id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_pelaporan_pencatatan` (`pelaporan_id`,`pencatatan_id`) USING BTREE,
  KEY `idx_pelaporan_id` (`pelaporan_id`) USING BTREE,
  KEY `idx_pencatatan_id` (`pencatatan_id`) USING BTREE,
  CONSTRAINT `fk_pelaporan_detail_pelaporan` FOREIGN KEY (`pelaporan_id`) REFERENCES `tr_pelaporan_petty_cash` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pelaporan_detail_pencatatan` FOREIGN KEY (`pencatatan_id`) REFERENCES `tr_expense_petty_cash` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Link table pelaporan dengan pencatatan petty cash';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_penawaran` (
  `no_penawaran` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `quote_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_surat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_penawaran` date DEFAULT NULL,
  `id_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `pic_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mata_uang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `valid_until` date DEFAULT NULL,
  `top` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `top_custom` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `nilai_penawaran` double(50,2) DEFAULT '0.00',
  `order_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_sales` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_sales` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pengiriman` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int DEFAULT '0',
  `revisi` int DEFAULT '0',
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `printed_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `printed_on` datetime DEFAULT NULL,
  `delivered_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delivered_on` datetime DEFAULT NULL,
  `approved_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
  `revisi_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `revisi_on` datetime DEFAULT NULL,
  `ppn` double(50,0) DEFAULT '0',
  `nilai_ppn` double(50,2) DEFAULT '0.00',
  `grand_total` double(50,2) DEFAULT '0.00',
  `keterangan_loss` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan_approve` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_so` int DEFAULT '0',
  `pilihppn` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `skb` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_revisi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan_nomor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `project` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `req_app1` int DEFAULT NULL,
  `req_app2` int DEFAULT NULL,
  `req_app3` int DEFAULT NULL,
  `app_1` int DEFAULT NULL,
  `app_2` int DEFAULT NULL,
  `app_3` int DEFAULT NULL,
  `keterangan_app1` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `keterangan_app2` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `keterangan_app3` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `subject` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `time_delivery` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `offer_period` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delivery_term` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `warranty` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `currency` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `notes` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`no_penawaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_penawaran_detail` (
  `id_penawaran_detail` int NOT NULL AUTO_INCREMENT,
  `no_penawaran` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_category3` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `nama_produk` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_bentuk` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` int DEFAULT '0',
  `harga_satuan` double(40,2) DEFAULT '0.00',
  `stok_tersedia` double(40,2) DEFAULT '0.00',
  `potensial_loss` double(40,2) DEFAULT '0.00',
  `diskon_persen` double(40,2) DEFAULT '0.00',
  `diskon_nilai` varchar(45) CHARACTER SET armscii8 COLLATE armscii8_general_ci DEFAULT NULL,
  `freight_cost` double(40,2) DEFAULT NULL,
  `total_harga` double(40,2) DEFAULT NULL,
  `keterangan` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `revisi` int DEFAULT '0',
  `created_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `nilai_diskon` double(50,2) DEFAULT '0.00',
  `diskon_compare` double(40,2) DEFAULT '0.00',
  `free_stock` decimal(20,2) DEFAULT NULL,
  `id_product_price` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_app_price` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bom` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `curr` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ukuran_potongan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `cutting_fee` decimal(20,2) NOT NULL,
  `delivery_fee` decimal(20,2) NOT NULL,
  PRIMARY KEY (`id_penawaran_detail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_penawaran_other_cost` (
  `id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `curr` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `inc_exc_pph` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai` double(20,2) DEFAULT NULL,
  `nilai_pph` double(20,4) NOT NULL,
  `total_nilai` double(20,4) NOT NULL,
  `used_inv` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dibuat_oleh` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dibuat_tgl` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_penawaran_other_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_other` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_other` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `harga` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_penerimaan_piutang` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_surat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_alokasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ppn_dipotong` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'N',
  `pph23_dipotong` enum('N','Y') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'Y',
  `nominal_penerimaan_bank` decimal(20,2) DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `consulting_batch` tinyint DEFAULT NULL,
  `jenis_penerimaan` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_penerimaan_piutang_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_alokasi` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_inv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tgl_inv` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_customer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `dpp` decimal(20,2) DEFAULT NULL,
  `dpp_lain` decimal(20,2) DEFAULT NULL,
  `ppn` decimal(20,2) DEFAULT NULL,
  `tagihan_ppn` decimal(20,2) DEFAULT NULL,
  `pph23` decimal(20,2) DEFAULT NULL,
  `total` decimal(20,2) DEFAULT NULL,
  `penerimaan` decimal(20,2) DEFAULT NULL,
  `biaya_admin` decimal(20,2) DEFAULT NULL,
  `sts_pph_23` int DEFAULT NULL,
  `sisa_piutang` decimal(20,2) NOT NULL DEFAULT '0.00',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `penyesuaian_pph` decimal(20,2) DEFAULT NULL,
  `saldo_piutang_sebelum` decimal(20,2) DEFAULT NULL,
  `versi_perhitungan` tinyint unsigned DEFAULT NULL,
  `consulting_version` tinyint DEFAULT NULL,
  `consulting_reduction` decimal(20,2) DEFAULT NULL,
  `consulting_snapshot` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_penerimaan_invoice_header` (`id_inv`,`id_header`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_penerimaan_pph_23` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_detail_penerimaan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_inv` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_customer` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `nm_project` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `keterangan_invoice` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `nilai_pph` decimal(20,2) DEFAULT NULL,
  `nilai_setor` decimal(20,2) DEFAULT NULL,
  `upload_bukti_setor` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_pengajuan_rutin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `departement` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_doc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal_doc` date DEFAULT NULL,
  `periode` char(7) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'Periode pembayaran YYYY-MM',
  `keterangan` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `coa_bank` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai_total` double DEFAULT '0',
  `coa_ppn` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai_ppn` double DEFAULT '0',
  `status` int DEFAULT '0',
  `sts_reject` int DEFAULT NULL,
  `reject_ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `approved_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `reject_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_date` datetime DEFAULT NULL,
  `sts` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_pengajuan_rutin_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_budget` bigint NOT NULL,
  `no_doc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_item` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'Nomor item, format PI-YYYY-NNNNN',
  `coa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `nilai` double DEFAULT '0',
  `nilai_bayar` double DEFAULT '0',
  `keterangan` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `doc_file` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ppn` double DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `bank_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accnumber` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_payment` int DEFAULT '0',
  `status` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `metode_pembelian` int DEFAULT NULL,
  `sts_reject` int NOT NULL,
  `sts_reject_manage` int NOT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `item_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 menunggu, 1 approved, 2 diproses finance, 8 ditolak approver, 9 ditolak RP',
  `item_reject_ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `item_approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `item_approved_date` datetime DEFAULT NULL,
  `revisi_dari` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'no_item yang direvisi oleh item ini',
  `diajukan_ulang_sebagai` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'no_item pengganti bila item ini ditolak lalu diajukan ulang',
  `closed_note` text CHARACTER SET latin1 COLLATE latin1_swedish_ci COMMENT 'Alasan Tidak diajukan ulang',
  `closed_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_no_item` (`no_item`) USING BTREE,
  KEY `idx_item_status` (`item_status`) USING BTREE,
  KEY `idx_revisi_dari` (`revisi_dari`) USING BTREE,
  KEY `idx_id_budget` (`id_budget`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_pengembalian_expense` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_doc` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `transfer_coa_bank` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `transfer_tanggal` date DEFAULT NULL,
  `transfer_jumlah` double(16,2) NOT NULL,
  `bukti_transfer` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jalur_pettycash` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_expense_pettycash` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `app_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_date` datetime DEFAULT NULL,
  `reject_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_petty_cash_vuca_sustain` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `no_payment_hutang` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'Format: PHP-YYYY-NNNN',
  `no_pelaporan` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'No pelaporan asal (RPC-YYYY-NNNN)',
  `pelaporan_id` int unsigned NOT NULL COMMENT 'FK ke tr_pelaporan_petty_cash.id',
  `company` enum('VUCA','SUSTAIN') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `periode_start` date NOT NULL,
  `periode_end` date NOT NULL,
  `jumlah_pencatatan` int NOT NULL DEFAULT '0',
  `grand_total` decimal(15,0) NOT NULL DEFAULT '0',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'draft' COMMENT 'draft|waiting payment|done payment',
  `nama_pembuat` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'Nama pembuat pelaporan asal',
  `created_on` datetime DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `modified_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_no_payment_hutang` (`no_payment_hutang`) USING BTREE,
  KEY `idx_pelaporan_id` (`pelaporan_id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_company` (`company`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Payment hutang inter-company VUCA/SUSTAIN';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_po_checked_pr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_pr` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_user` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe_pr` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_pr_aset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_pr` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_pr` date DEFAULT NULL,
  `id_aset` int DEFAULT '0',
  `budget` decimal(10,0) DEFAULT '0',
  `budget_sisa` decimal(10,0) DEFAULT '0',
  `description` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai_pr` decimal(10,0) DEFAULT '0',
  `tipe_pr` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int DEFAULT '0',
  `terbayar` decimal(10,0) DEFAULT '0',
  `supplier_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `alt_supplier_1` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `alt_supplier_2` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `alt_supplier_3` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `supplier_text` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `notes` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approve` int DEFAULT '0',
  `approve_now` int DEFAULT '0',
  `divisi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `nilai_pengajuan` decimal(10,0) DEFAULT '0',
  `ppn` decimal(10,0) DEFAULT '0',
  `nilai_ppn` decimal(10,0) DEFAULT '0',
  `reject_reason` varchar(1500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe_bayar` int DEFAULT '0' COMMENT '0:FULL,1:DP,2:Pelunasan',
  `tgl_periksa` date DEFAULT NULL,
  `quality_inspect` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_inspect` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `note_release` varchar(3000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `terima_barang` int DEFAULT '0',
  `budgetpr` double(11,0) DEFAULT NULL,
  `budgetpo` double(11,0) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `jenis_pembelian` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_rfq` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_dibutuhkan` date DEFAULT NULL,
  `current_stage_no` int DEFAULT '1',
  `current_status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'active',
  `revision_no` int DEFAULT '1',
  `metode_pembelian` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_pr_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `no_pr` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deskripsi` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_pr` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga_pr` decimal(20,0) DEFAULT NULL,
  `total_harga_pr` decimal(20,0) DEFAULT NULL,
  `tgl_dibutuhkan` date DEFAULT NULL,
  `keterangan` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int DEFAULT '0',
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `jenis_pembelian` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_rfq` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `doc_file` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_pr_detail_kasbon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_kasbon` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_detail` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pr` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe_pr` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_material` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_material` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` decimal(20,2) DEFAULT NULL,
  `unit` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga` decimal(20,2) DEFAULT NULL,
  `total_harga` decimal(20,2) DEFAULT NULL,
  `qty_in` decimal(20,2) NOT NULL DEFAULT '0.00',
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_pr_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_pr` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_pr` date DEFAULT NULL,
  `departement` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_pr` decimal(10,0) DEFAULT NULL,
  `budget` decimal(10,0) DEFAULT NULL,
  `sisa_budget` decimal(10,0) DEFAULT NULL,
  `coa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int DEFAULT '0',
  `over_reason` varchar(2500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `jenis_pembelian` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_rfq` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `informasi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approve_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
  `st_reject` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_pr_non_po` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_non_po` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_pr` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_pr` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jenis_pr` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_pic` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_pic` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total_pr` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sts` enum('0','1','2','3') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `approved_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `rejected_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rejected_date` datetime DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_pr_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `so_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pr` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `category` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_so` date DEFAULT NULL,
  `po_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `id_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `project` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_order` double(16,5) DEFAULT NULL,
  `qty_use_stok` double(16,5) DEFAULT NULL,
  `qty_propose` double(16,5) DEFAULT NULL,
  `tgl_dibutuhkan` date DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `booking_by` int DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `sts_req_app` int NOT NULL,
  `app_req` int NOT NULL,
  `sts_po_req` int NOT NULL,
  `app_po_req` int NOT NULL,
  `no_rev` int NOT NULL,
  `reject_status` int NOT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `metode_pembelian` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_1` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_2` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_3` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject1` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject2` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject3` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_1_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_1_date` datetime DEFAULT NULL,
  `app_2_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_2_date` datetime DEFAULT NULL,
  `app_3_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_3_date` datetime DEFAULT NULL,
  `sts_reject1_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject1_date` datetime DEFAULT NULL,
  `sts_reject2_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject2_date` datetime DEFAULT NULL,
  `sts_reject3_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject3_date` datetime DEFAULT NULL,
  `reject_reason1` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `reject_reason2` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `reject_reason3` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `keterangan_1` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `keterangan_2` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `keterangan_3` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `app_post` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rejected` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_app` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tingkat_pr` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `close_pr` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `close_pr_desc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_pr_product_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `so_number` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_material` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_order` double(16,5) DEFAULT NULL,
  `stock_free` double(16,5) DEFAULT NULL,
  `use_stock` double(16,5) DEFAULT NULL,
  `min_stock` double(9,2) DEFAULT NULL,
  `max_stock` double(9,2) DEFAULT NULL,
  `propose_purchase` double(16,5) DEFAULT NULL,
  `propose_rev` double(16,5) DEFAULT NULL,
  `status_app` enum('Y','N','D') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `app_by` int DEFAULT NULL,
  `app_date` datetime DEFAULT NULL,
  `note` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `kasbon_created` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_pr_rutin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pr_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pr_date` date DEFAULT NULL,
  `pr_info` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` smallint DEFAULT '0',
  `tipe` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `tgl_dibutuhkan` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_pr_rutin_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `material_id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `material_unit` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `material_stock` decimal(20,0) DEFAULT NULL,
  `material_qty` decimal(20,0) DEFAULT '0',
  `material_info` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `material_order` decimal(20,0) DEFAULT '0',
  `material_price_ref` decimal(20,0) DEFAULT '0',
  `tipe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `no_order` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_rfq` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_price_history_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_doc` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_category` int NOT NULL,
  `id_barang` int NOT NULL,
  `price_ref_before` double(16,6) DEFAULT '0.000000',
  `price_ref_high_before` double(16,6) DEFAULT '0.000000',
  `price_ref_usd_before` double(16,6) DEFAULT '0.000000',
  `price_ref_high_usd_before` double(16,6) DEFAULT '0.000000',
  `price_ref_new` double(16,6) DEFAULT '0.000000',
  `price_ref_high_new` double(16,6) DEFAULT '0.000000',
  `price_ref_new_usd` double(16,6) DEFAULT '0.000000',
  `price_ref_high_new_usd` double(16,6) DEFAULT '0.000000',
  `kurs` decimal(16,4) DEFAULT '1.0000',
  `expired` int DEFAULT '1',
  `action` enum('approved','rejected') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `rejected_reason` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `created_by` int DEFAULT NULL COMMENT 'Pengaju',
  `processed_by` int DEFAULT NULL COMMENT 'Approver / Rejector',
  `processed_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_no_doc` (`no_doc`) USING BTREE,
  KEY `idx_id_barang` (`id_barang`) USING BTREE,
  KEY `idx_id_cat` (`id_category`) USING BTREE,
  KEY `idx_processed_date` (`processed_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_price_sup_barang_stok_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_doc` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `id_category` int NOT NULL,
  `id_barang` int NOT NULL COMMENT 'FK to accessories.id',
  `price_ref_before` double(16,6) DEFAULT '0.000000',
  `price_ref_high_before` double(16,6) DEFAULT '0.000000',
  `price_ref_usd_before` double(16,6) DEFAULT '0.000000',
  `price_ref_high_usd_before` double(16,6) DEFAULT '0.000000',
  `price_ref_new` double(16,6) DEFAULT '0.000000',
  `price_ref_high_new` double(16,6) DEFAULT '0.000000',
  `price_ref_new_usd` double(16,6) DEFAULT '0.000000',
  `price_ref_high_new_usd` double(16,6) DEFAULT '0.000000',
  `expired` int DEFAULT '1',
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `status` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '0',
  `price_ref_use_after` double(16,6) DEFAULT '0.000000',
  `price_ref_use_after_usd` double(16,6) DEFAULT '0.000000',
  `price_ref_expired_use_after` int DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `no_doc` (`no_doc`) USING BTREE,
  KEY `id_barang` (`id_barang`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_price_sup_barang_stok_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_doc` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `file_type` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `file_size` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `no_doc` (`no_doc`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_price_sup_barang_stok_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_doc` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `tanggal_doc` date NOT NULL,
  `id_category` int DEFAULT NULL,
  `kurs` decimal(16,4) DEFAULT '1.0000',
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `status` enum('0','1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '0: Waiting Approval, 1: Approved, 2: Rejected',
  `created_by` int DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `rejected_by` int DEFAULT NULL,
  `rejected_date` datetime DEFAULT NULL,
  `rejected_reason` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `no_doc` (`no_doc`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_purchase_order` (
  `no_po` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_surat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_suplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `loi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nominal_kurs` double(40,2) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `expect_tanggal` date DEFAULT NULL,
  `term` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cif` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hargatotal` double(40,2) DEFAULT NULL,
  `diskontotal` double(40,2) DEFAULT NULL,
  `taxtotal` double(40,2) DEFAULT NULL,
  `subtotal` double(40,2) DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `note` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `no_pr` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `matauang` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_incoming` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `grandtotal_idr` double(40,2) DEFAULT '0.00',
  `hutang_usaha` double(40,2) DEFAULT '0.00',
  `hutang_usaha_idr` double(40,2) DEFAULT '0.00',
  `uang_muka` double(40,2) DEFAULT '0.00',
  `uang_muka_idr` double(40,2) DEFAULT '0.00',
  `total_bayar` double(40,2) DEFAULT '0.00',
  `total_bayar_idr` double(40,2) DEFAULT '0.00',
  `kurs_bayar` double(40,2) DEFAULT '0.00',
  `total_ppn` double(40,2) DEFAULT '0.00',
  `total_barang` double(40,2) DEFAULT '0.00',
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `total_ppn_persen` double(20,2) DEFAULT NULL,
  `tipe` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `revisi` int NOT NULL,
  `po_inv_create` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `id_dept` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `persen_disc` decimal(20,2) NOT NULL,
  `nilai_disc` decimal(20,2) NOT NULL,
  `close_po` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `close_po_desc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `nilai_terima_barang_kurs` double(40,2) DEFAULT '0.00',
  `nilai_terima_barang_idr` double(40,2) DEFAULT '0.00',
  `proses_uang_muka` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `terima_barang_kurs` double(40,2) DEFAULT '0.00',
  `terima_barang_idr` double(40,2) DEFAULT '0.00',
  `total_terima_barang_kurs` double(40,2) DEFAULT '0.00',
  `total_terima_barang_idr` double(40,2) DEFAULT '0.00',
  `hutang` double(40,2) DEFAULT '0.00',
  `hutang_idr` double(40,2) DEFAULT '0.00',
  `sisa_hutang` double(40,2) DEFAULT '0.00',
  `sisa_hutang_idr` double(40,2) DEFAULT '0.00',
  `kurs_terima_invoice` double(40,2) DEFAULT '0.00',
  `kurs_terima_barang` double(40,2) DEFAULT '0.00',
  `kurs_terima_invoice_progress` double(40,2) DEFAULT '0.00',
  PRIMARY KEY (`no_po`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_purchase_order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_pr` bigint DEFAULT NULL,
  `doc_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `material_id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `material_unit` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `material_price` decimal(20,0) DEFAULT NULL,
  `material_qty` decimal(20,0) DEFAULT '0',
  `material_info` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `material_pr` decimal(20,0) DEFAULT NULL,
  `material_request` decimal(20,0) DEFAULT '0',
  `material_receive` decimal(20,0) DEFAULT '0',
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_purchase_request` (
  `no_pr` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_surat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `requestor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_po` enum('OPN','CLS') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'OPN'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_purchase_request_deleted` (
  `no_pr` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_surat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `requestor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_po` enum('OPN','CLS') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'OPN'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_purchase_request_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `material_id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `material_unit` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `material_stock` decimal(20,0) DEFAULT NULL,
  `material_qty` decimal(20,0) DEFAULT '0',
  `material_info` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `material_order` decimal(20,0) DEFAULT '0',
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_purchase_request_old` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pr_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pr_date` date DEFAULT NULL,
  `id_type` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pr_info` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `project` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` smallint DEFAULT '0',
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_request_mutasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_mutasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_request` date DEFAULT NULL,
  `nilai_request` double DEFAULT NULL,
  `bank_asal` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_tujuan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `terbilang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `nama_bank_asal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_bank_tujuan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mata_uang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `target_accounting` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `approved_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_on` datetime(6) DEFAULT NULL,
  `status_approve` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `alasan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kd_pembayaran_UNIQUE` (`kd_mutasi`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_request_mutasi_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_mutasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_request` date DEFAULT NULL,
  `nilai` double(50,2) DEFAULT '0.00',
  `bank_asal` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_tujuan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `terbilang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `nama_bank_asal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_bank_tujuan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mata_uang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `target_accounting` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `transaksi` double(50,2) DEFAULT '0.00',
  `kurs` double(50,2) DEFAULT '0.00',
  `coa` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_mutasi` date DEFAULT NULL,
  `jenis_transaksi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jurnal1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jurnal2` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kd_pembayaran_UNIQUE` (`kd_mutasi`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_request_mutasi_aktual` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_mutasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_request` date DEFAULT NULL,
  `nilai_request` double(50,2) DEFAULT '0.00',
  `bank_asal` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_tujuan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `terbilang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `nama_bank_asal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_bank_tujuan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mata_uang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `target_accounting` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai_aktual` double(50,2) DEFAULT '0.00',
  `kurs` double(50,2) DEFAULT '0.00',
  `dari` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ke` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_mutasi` date DEFAULT NULL,
  `jurnal1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kd_pembayaran_UNIQUE` (`kd_mutasi`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_request_mutasi_aktual_deleted` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_mutasi` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_request` date DEFAULT NULL,
  `nilai_request` double(50,2) DEFAULT '0.00',
  `bank_asal` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_tujuan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `terbilang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `nama_bank_asal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_bank_tujuan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mata_uang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nilai_aktual` double(50,2) DEFAULT '0.00',
  `kurs` double(50,2) DEFAULT '0.00',
  `dari` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ke` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_mutasi` date DEFAULT NULL,
  `jurnal1` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kd_pembayaran_UNIQUE` (`kd_mutasi`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_ros` (
  `id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_po` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_supplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_supplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `link_doc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `kurs_pib` decimal(20,2) DEFAULT NULL,
  `cost_bm` decimal(20,2) DEFAULT NULL,
  `cost_ppn` decimal(20,2) DEFAULT NULL,
  `cost_pph` decimal(20,2) DEFAULT NULL,
  `freight_cost` decimal(20,2) DEFAULT NULL,
  `awb_bl_date` date DEFAULT NULL,
  `awb_bl_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `eta_warehouse` date DEFAULT NULL,
  `ata_pod` date DEFAULT NULL,
  `sts` int NOT NULL,
  `no_pengajuan_pib` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_biling` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_ros_custom_pib` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_ros` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item_pembiayaan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `nilai_cost` decimal(20,2) NOT NULL,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_ros_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_ros` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_po_detail` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_barang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_barang` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `currency` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `price_unit` decimal(20,2) DEFAULT NULL,
  `qty_po` decimal(20,2) DEFAULT NULL,
  `qty_packing_list` decimal(20,2) DEFAULT NULL,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_rp_pengajuan_d` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pengajuan` int NOT NULL,
  `no_dokumen` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'v_request_payment.no_dokumen',
  `id_dokumen` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'v_request_payment.id (referensi dokumen sumber)',
  `kategori` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `request_by` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keperluan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `dpp` decimal(20,2) NOT NULL DEFAULT '0.00',
  `flag_ppn` tinyint(1) NOT NULL DEFAULT '0',
  `flag_pph23` tinyint(1) NOT NULL DEFAULT '0',
  `flag_pph21` tinyint(1) NOT NULL DEFAULT '0',
  `nilai_ppn` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nilai_pph` decimal(20,2) NOT NULL DEFAULT '0.00',
  `admin` int NOT NULL DEFAULT '0',
  `dibayarkan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `decision` enum('approved','rejected') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'approved',
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_pengajuan` (`id_pengajuan`) USING BTREE,
  KEY `idx_no_dokumen` (`no_dokumen`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_rp_pengajuan_h` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_pengajuan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT 'Format PGJ-XXXX',
  `company_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'kons_tr_company.id (7/3/4)',
  `company_nama` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'Nama company (snapshot saat submit)',
  `status` enum('pending','done') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'pending',
  `jumlah_dokumen` int NOT NULL DEFAULT '0',
  `total_dibayarkan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `submitted_at` datetime DEFAULT NULL COMMENT 'Waktu diajukan',
  `decided_at` datetime DEFAULT NULL COMMENT 'Waktu diputuskan approver',
  `approver` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT 'Username approver yang memutuskan',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uq_no_pengajuan` (`no_pengajuan`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_company` (`company_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_rp_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pengajuan` int NOT NULL,
  `no_pengajuan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_dokumen` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kategori` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `request_by` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `company_nama` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keperluan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `dpp` decimal(20,2) NOT NULL DEFAULT '0.00',
  `flag_ppn` tinyint(1) NOT NULL DEFAULT '0',
  `flag_pph23` tinyint(1) NOT NULL DEFAULT '0',
  `flag_pph21` tinyint(1) NOT NULL DEFAULT '0',
  `nilai_ppn` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nilai_pph` decimal(20,2) NOT NULL DEFAULT '0.00',
  `admin` int NOT NULL DEFAULT '0',
  `dibayarkan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `created_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_pengajuan` (`id_pengajuan`) USING BTREE,
  KEY `idx_no_dokumen` (`no_dokumen`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_rp_reject_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_dokumen` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_pengajuan` int DEFAULT NULL,
  `no_pengajuan` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approver` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rejected_at` datetime DEFAULT NULL,
  `alasan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_no_dokumen` (`no_dokumen`) USING BTREE,
  KEY `idx_pengajuan` (`id_pengajuan`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_saldo_bank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_pembayaran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_transaksi` date DEFAULT NULL,
  `kurs_lama` double DEFAULT '0',
  `saldo_lama` double DEFAULT '0',
  `saldo_lama_idr` double DEFAULT '0',
  `kurs_baru` double DEFAULT '0',
  `saldo_baru` double DEFAULT '0',
  `saldo_baru_idr` double DEFAULT '0',
  `saldo_akhir` double DEFAULT '0',
  `saldo_akhir_idr` double DEFAULT '0',
  `kd_bank` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_bank` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `no_account` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `kd_pembayaran_UNIQUE` (`kd_pembayaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_sales_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_so` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_penawaran` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `no_surat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_so` date DEFAULT NULL,
  `id_customer` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `pic_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mata_uang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `valid_until` date DEFAULT NULL,
  `top` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `top_custom` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `nilai_so` double(50,2) DEFAULT '0.00',
  `order_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_sales` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_sales` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pengiriman` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int DEFAULT '0',
  `revisi` int DEFAULT '0',
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `printed_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `printed_on` datetime DEFAULT NULL,
  `delivered_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delivered_on` datetime DEFAULT NULL,
  `approved_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
  `revisi_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `revisi_on` datetime DEFAULT NULL,
  `ppn` double(50,0) DEFAULT '0',
  `nilai_ppn` double(50,2) DEFAULT '0.00',
  `grand_total` double(50,2) DEFAULT '0.00',
  `keterangan_loss` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan_approve` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `upload_po` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `upload_so` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `upload_penawaran_deal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_so` int DEFAULT NULL,
  `status_do` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approval_finance` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `request_do` date DEFAULT NULL,
  `location` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status_planning` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `percent_invoice` double(50,2) DEFAULT '0.00',
  `total_invoice` double(50,2) DEFAULT '0.00',
  `percent_do` double(50,2) DEFAULT '0.00',
  `total_do` double(50,2) DEFAULT '0.00',
  `total_dikirim` double(40,2) DEFAULT '0.00',
  `total_hpp` double(40,2) DEFAULT '0.00',
  `total_bayar_so` double(40,2) DEFAULT '0.00',
  `keterangan_kirim` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reff` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jurnal_revenue` enum('OPN','CLS') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'OPN',
  `invoice_revenue` double(40,2) DEFAULT '0.00',
  `hpp_revenue` double(40,2) DEFAULT '0.00',
  `perseninvoice_revenue` double(40,2) DEFAULT '0.00',
  `total_costbook_so` double(40,2) DEFAULT '0.00',
  `project` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `delivery_address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `delivery_date` date DEFAULT NULL,
  `invoice_address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `req_app` int NOT NULL,
  `approve` int NOT NULL,
  `notes` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `po_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `po_date` date DEFAULT NULL,
  `tipe_so` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_sales_order_detail` (
  `id_so_detail` int NOT NULL AUTO_INCREMENT,
  `id_penawaran_detail` int DEFAULT NULL,
  `no_so` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_penawaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_category3` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `nama_produk` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_product_price` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bom` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_bentuk` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_so` double(40,2) DEFAULT '0.00',
  `qty` double(40,0) DEFAULT '0',
  `harga_satuan` double(40,2) DEFAULT '0.00',
  `stok_tersedia` double(40,2) DEFAULT '0.00',
  `potensial_loss` double(40,2) DEFAULT '0.00',
  `diskon_persen` double(40,2) DEFAULT '0.00',
  `diskon_nilai` decimal(20,2) DEFAULT NULL,
  `freight_cost` double(40,2) DEFAULT NULL,
  `total_harga` double(40,2) DEFAULT NULL,
  `keterangan` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `revisi` int DEFAULT '0',
  `tgl_delivery` date DEFAULT NULL,
  `created_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `nilai_diskon` double(50,2) DEFAULT '0.00',
  `diskon_compare` double(40,2) DEFAULT '0.00',
  `id_so` int DEFAULT NULL,
  `qty_delivery` double(40,2) DEFAULT '0.00',
  `schedule` date DEFAULT NULL,
  `metode_kirim` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan_kirim` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_terkirim` double(40,2) DEFAULT '0.00',
  `status_planning` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `status_kirim` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `keterangan_statuskirim` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_spk` double(40,2) DEFAULT '0.00',
  `costbook_so` double(40,2) DEFAULT '0.00',
  `deleted_by` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id_so_detail`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_tabungan_pph21` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_tabungan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tgl_tabungan` date DEFAULT NULL,
  `coa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_coa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `debit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `kredit` decimal(20,2) NOT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `sts` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `no_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `jenis_transaksi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_divisi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_divisi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_top_po` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `group_top` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `progress` decimal(20,2) NOT NULL,
  `nilai` decimal(20,2) NOT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_tracking_pembelian` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_pr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipe_dokumen` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `no_dokumen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `aksi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_transport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_doc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_doc` date DEFAULT NULL,
  `departement` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumlah_kasbon` decimal(20,0) DEFAULT '0',
  `keperluan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `doc_file` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nopol` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rute` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `km_awal` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `km_akhir` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `bensin` decimal(20,0) NOT NULL DEFAULT '0',
  `tol` decimal(20,0) NOT NULL DEFAULT '0',
  `parkir` decimal(20,0) NOT NULL DEFAULT '0',
  `status` int DEFAULT '0',
  `no_req` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `lainnya` decimal(20,0) DEFAULT NULL,
  `keterangan` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `doc_file_2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `req_payment` int NOT NULL,
  `no_coa` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_coa` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_transport_req` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_doc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_doc` date DEFAULT NULL,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `jumlah_expense` decimal(20,0) DEFAULT '0',
  `status` int DEFAULT '0',
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `departement` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `fin_check_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fin_check_on` datetime DEFAULT NULL,
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
  `management_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `management_on` datetime DEFAULT NULL,
  `bank_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accnumber` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `st_reject` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `coa` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject` int NOT NULL,
  `sts_reject_manage` int NOT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `req_payment` int NOT NULL,
  `sts_finance` int DEFAULT NULL,
  `app_finance_date` date DEFAULT NULL,
  `reject_reason_finance` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `rejected_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rejected_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_transport_req_copy1` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_doc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_doc` date DEFAULT NULL,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `jumlah_expense` decimal(20,0) DEFAULT '0',
  `status` int DEFAULT '0',
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `departement` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `fin_check_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fin_check_on` datetime DEFAULT NULL,
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
  `management_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `management_on` datetime DEFAULT NULL,
  `bank_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accnumber` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `st_reject` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `coa` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject` int NOT NULL,
  `sts_reject_manage` int NOT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `req_payment` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_transport_req_copy2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_doc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_doc` date DEFAULT NULL,
  `date1` date DEFAULT NULL,
  `date2` date DEFAULT NULL,
  `jumlah_expense` decimal(20,0) DEFAULT '0',
  `status` int DEFAULT '0',
  `nama` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `departement` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `fin_check_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fin_check_on` datetime DEFAULT NULL,
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
  `management_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `management_on` datetime DEFAULT NULL,
  `bank_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accnumber` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `accname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `st_reject` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `coa` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject` int NOT NULL,
  `sts_reject_manage` int NOT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `req_payment` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_unlocated_bank` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tgl` date DEFAULT NULL,
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `totalpenerimaan` double(255,0) DEFAULT NULL,
  `saldo` double(255,0) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_used_invoice_sales_other_cost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_other_cost` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_so` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_invoice` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `curr` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `nilai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nilai_pph` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_nilai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_warehouse` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reference_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `wh_code` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `info` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `trans_date` date DEFAULT NULL,
  `trans_type` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pic` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_on` datetime NOT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_warehouse_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `doc_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `material_id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `material_qty` decimal(20,0) DEFAULT '0',
  `material_unit` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `material_info` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_po` bigint DEFAULT NULL,
  `material_order` decimal(20,0) DEFAULT '0',
  `material_price` decimal(20,0) DEFAULT '0',
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tran_material_purchase_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_po` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_material` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `idmaterial` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_material` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_supplier` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_supplier` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty` double(9,2) DEFAULT '0.00',
  `qty_in` double(9,2) DEFAULT '0.00',
  `qty_outs` double(9,2) DEFAULT '0.00',
  `qty_packing` double(9,2) DEFAULT '0.00',
  `qty_in_packing` double(9,2) DEFAULT '0.00',
  `qty_outs_packing` double(9,2) DEFAULT '0.00',
  `price_ref` double(8,2) DEFAULT NULL,
  `price` double DEFAULT '0',
  `discount` double DEFAULT '0',
  `total_price` double DEFAULT '0',
  `total_discount` double DEFAULT NULL,
  `complete` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `cretaed_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cretaed_date` datetime DEFAULT NULL,
  `deleted` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tran_material_purchase_header` (
  `no_po` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_supplier` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_supplier` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_material` double(255,2) DEFAULT NULL,
  `total_packing` double(255,2) DEFAULT NULL,
  `sts_ajuan` enum('CLS','CNC','REJ','APV','OPN') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'OPN',
  `sts_process` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `expired_date` date DEFAULT NULL,
  `dpp` double DEFAULT '0',
  `discount` double DEFAULT '0',
  `dpp_after` double DEFAULT '0',
  `ppn` double DEFAULT '0',
  `total` double DEFAULT NULL,
  `last_gudang` varchar(12) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approve_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `cancel_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `inc_ppn` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`no_po`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tran_pr_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_pr` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pr_group` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_pr` date DEFAULT NULL,
  `category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_pembelian` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_rfq` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_barang` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `nm_barang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `info` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty` double(16,2) DEFAULT NULL,
  `satuan` int DEFAULT '21',
  `nilai_pr` double(16,2) DEFAULT NULL,
  `tgl_dibutuhkan` date DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `app_status_1` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_reason_1` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `app_by_1` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_date_1` datetime DEFAULT NULL,
  `app_status_2` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_reason_2` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `app_by_2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_date_2` datetime DEFAULT NULL,
  `app_status_3` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_date_3` datetime DEFAULT NULL,
  `app_reason_3` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `app_by_3` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `checklist` char(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `checklist_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `in_gudang` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tran_pr_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no_pr` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pr_group` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgl_pr` date DEFAULT NULL,
  `category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `app_status_1` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_reason_1` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `app_by_1` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_date_1` datetime DEFAULT NULL,
  `app_status_2` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_reason_2` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `app_by_2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_date_2` datetime DEFAULT NULL,
  `app_status_3` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_reason_3` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `app_by_3` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `app_date_3` datetime DEFAULT NULL,
  `dokumen_pendukung` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `metode_pembelian` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `close_pr` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `close_pr_desc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `kasbon_created` int DEFAULT NULL,
  `no_coa` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_coa` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `current_stage_no` int DEFAULT '1',
  `current_status` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'active',
  `revision_no` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type_material_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_material` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `umur_hutang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `nomor` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `tanggal` date DEFAULT NULL,
  `no_perkiraan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `no_reff` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `debet` double DEFAULT NULL,
  `kredit` double DEFAULT NULL,
  `nocust` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `valid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu_valid` datetime DEFAULT NULL,
  `stspos` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `jenis_jurnal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_supplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_supplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `saldo30` double DEFAULT NULL,
  `saldo31` double DEFAULT NULL,
  `saldo90` double DEFAULT NULL,
  `saldo120` double DEFAULT NULL,
  `saldo120plus` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `umur_piutang` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `nomor` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `tanggal` date DEFAULT NULL,
  `no_perkiraan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `no_reff` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '',
  `debet` double DEFAULT NULL,
  `kredit` double DEFAULT NULL,
  `nocust` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `valid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu_valid` datetime DEFAULT NULL,
  `stspos` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `jenis_jurnal` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_supplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_supplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `saldo30` double DEFAULT NULL,
  `saldo31` double DEFAULT NULL,
  `saldo90` double DEFAULT NULL,
  `saldo120` double DEFAULT NULL,
  `saldo120plus` double DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_emp` AS SELECT 
 1 AS `nama_karyawan`,
 1 AS `employee_id`,
 1 AS `id`,
 1 AS `username`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_groups` (
  `id_user` int NOT NULL,
  `id_group` int NOT NULL,
  PRIMARY KEY (`id_user`,`id_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_permissions` (
  `id_user` int NOT NULL,
  `id_permission` int NOT NULL,
  PRIMARY KEY (`id_user`,`id_permission`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_lengkap` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kota` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kdcab` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '100',
  `work_location` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `group_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `login_terakhir` datetime DEFAULT NULL,
  `st_aktif` tinyint(1) DEFAULT '1' COMMENT '0 = Tidak Aktif\n1 = Aktif',
  `photo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  `department_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `employee_id` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `title_id` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ga_secret` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_kasbon_list` AS SELECT 
 1 AS `id`,
 1 AS `no_doc`,
 1 AS `tgl_doc`,
 1 AS `departement`,
 1 AS `nama`,
 1 AS `jumlah_kasbon`,
 1 AS `keperluan`,
 1 AS `doc_file`,
 1 AS `status`,
 1 AS `created_by`,
 1 AS `created_on`,
 1 AS `modified_by`,
 1 AS `modified_on`,
 1 AS `coa`,
 1 AS `doc_file_2`,
 1 AS `bank_id`,
 1 AS `accnumber`,
 1 AS `accname`,
 1 AS `project`,
 1 AS `st_reject`,
 1 AS `approved_by`,
 1 AS `approved_on`,
 1 AS `no_so`,
 1 AS `jumlah_expense`,
 1 AS `keterangan`,
 1 AS `id_pr`,
 1 AS `tipe_pr`,
 1 AS `sts_reject`,
 1 AS `sts_reject_manage`,
 1 AS `reject_reason`,
 1 AS `metode_pembayaran`,
 1 AS `id_expense_pett_pr_non_po`,
 1 AS `bukti_pengembalian`,
 1 AS `kurang_bayar`,
 1 AS `project_consultant`,
 1 AS `no_kasbon_consultant`,
 1 AS `sts_incoming`,
 1 AS `no_coa`,
 1 AS `nm_coa`,
 1 AS `sts_finance`,
 1 AS `app_finance_date`,
 1 AS `reject_reason_finance`,
 1 AS `nmuser_default`,
 1 AS `nmuser_fix`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_list_payment` AS SELECT 
 1 AS `id`,
 1 AS `no_doc`,
 1 AS `created_on`,
 1 AS `currency`,
 1 AS `jumlah`,
 1 AS `keperluan`,
 1 AS `status`,
 1 AS `tipe`,
 1 AS `requestor`,
 1 AS `is_po_payment`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_request_payment` AS SELECT 
 1 AS `id`,
 1 AS `no_dokumen`,
 1 AS `request_by`,
 1 AS `tanggal`,
 1 AS `keperluan`,
 1 AS `kategori`,
 1 AS `nilai_pengajuan`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_bom_hth_ftackle` AS SELECT 
 1 AS `id`,
 1 AS `kode_bom_hth`,
 1 AS `kode_bom_hth_detail`,
 1 AS `id_group_material`,
 1 AS `material`,
 1 AS `qty`,
 1 AS `price`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_bom_hth_origa` AS SELECT 
 1 AS `id`,
 1 AS `kode_bom_hth`,
 1 AS `kode_bom_hth_detail`,
 1 AS `id_group_material`,
 1 AS `material`,
 1 AS `qty`,
 1 AS `price`,
 1 AS `total`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `view_get_plan_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bulan` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tahun` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_material` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `view_get_plan_material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bulan` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tahun` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_material` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double(9,2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `view_get_plan_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `product` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_order` int DEFAULT NULL,
  `bulan` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tahun` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_rekap_actual_plan_tagih` AS SELECT 
 1 AS `id_spk_penawaran`,
 1 AS `id_customer`,
 1 AS `nm_customer`,
 1 AS `nilai_kontrak`,
 1 AS `id_company`,
 1 AS `nm_company`,
 1 AS `nm_paket`,
 1 AS `sts_spk`,
 1 AS `input_date`,
 1 AS `id_company_ref`,
 1 AS `nominal_invoice`,
 1 AS `nominal_uninvoice`,
 1 AS `macet`,
 1 AS `tahun_data`,
 1 AS `jan`,
 1 AS `feb`,
 1 AS `mar`,
 1 AS `apr`,
 1 AS `may_val`,
 1 AS `jun`,
 1 AS `jul`,
 1 AS `aug`,
 1 AS `sep`,
 1 AS `oct`,
 1 AS `nov`,
 1 AS `dec_val`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_report_actual_plan_tagih` AS SELECT 
 1 AS `id_company`,
 1 AS `nm_company`,
 1 AS `id_spk_penawaran`,
 1 AS `id_customer`,
 1 AS `nm_customer`,
 1 AS `nm_paket`,
 1 AS `nilai_kontrak`,
 1 AS `tahun`,
 1 AS `total_invoice`,
 1 AS `nominal_bulanan`,
 1 AS `bulan`,
 1 AS `tanggal`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_report_actual_plan_tagih_filterable` AS SELECT 
 1 AS `id_company`,
 1 AS `nm_company`,
 1 AS `id_spk_penawaran`,
 1 AS `id_customer`,
 1 AS `nm_customer`,
 1 AS `nm_paket`,
 1 AS `nilai_kontrak`,
 1 AS `tahun`,
 1 AS `total_invoice`,
 1 AS `nominal_bulanan`,
 1 AS `bulan`,
 1 AS `tanggal`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_report_piutang` AS SELECT 
 1 AS `id_spk_penawaran`,
 1 AS `no_spk`,
 1 AS `nm_customer`,
 1 AS `nilai_kontrak`,
 1 AS `id_invoice`,
 1 AS `no_invoice`,
 1 AS `tanggal_invoice`,
 1 AS `nilai_invoice`,
 1 AS `id_penerimaan_detail`,
 1 AS `no_penerimaan`,
 1 AS `tanggal_penerimaan`,
 1 AS `nilai_penerimaan`,
 1 AS `saldo_piutang`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_tr_invoice_payment` AS SELECT 
 1 AS `id_payment_detail`,
 1 AS `kd_pembayaran`,
 1 AS `no_ipp`,
 1 AS `so_number`,
 1 AS `no_invoice`,
 1 AS `tgl_invoice`,
 1 AS `id_customer`,
 1 AS `nm_customer`,
 1 AS `jenis_invoice`,
 1 AS `kurs_jual`,
 1 AS `persentase`,
 1 AS `kurs_bayar`,
 1 AS `total_product`,
 1 AS `total_product_idr`,
 1 AS `total_gab_product`,
 1 AS `total_gab_product_idr`,
 1 AS `total_material`,
 1 AS `total_material_idr`,
 1 AS `total_bq`,
 1 AS `total_bq_idr`,
 1 AS `total_enginering`,
 1 AS `total_enginering_idr`,
 1 AS `total_packing`,
 1 AS `total_packing_idr`,
 1 AS `total_trucking`,
 1 AS `total_trucking_idr`,
 1 AS `total_dpp_usd`,
 1 AS `total_dpp_rp`,
 1 AS `total_diskon`,
 1 AS `total_diskon_idr`,
 1 AS `total_retensi`,
 1 AS `total_retensi_idr`,
 1 AS `total_ppn`,
 1 AS `total_ppn_idr`,
 1 AS `total_invoice`,
 1 AS `total_invoice_idr`,
 1 AS `total_um`,
 1 AS `total_um_idr`,
 1 AS `total_bayar`,
 1 AS `total_bayar_idr`,
 1 AS `total_quotation`,
 1 AS `project_name`,
 1 AS `ket`,
 1 AS `estimasi`,
 1 AS `rev`,
 1 AS `created_by`,
 1 AS `created_on`,
 1 AS `modified_by`,
 1 AS `modified_on`,
 1 AS `cancel_by`,
 1 AS `cancel_date`,
 1 AS `no_po`,
 1 AS `no_faktur`,
 1 AS `no_pajak`,
 1 AS `payment_term`,
 1 AS `proses_print`,
 1 AS `est_date`,
 1 AS `approved`,
 1 AS `approved_by`,
 1 AS `approved_date`,
 1 AS `approved_est`,
 1 AS `approved_est_by`,
 1 AS `approved_est_date`,
 1 AS `aju_approved`,
 1 AS `aju_approved_by`,
 1 AS `aju_approved_date`,
 1 AS `aju_approved_est`,
 1 AS `aju_approved_est_by`,
 1 AS `aju_approved_est_date`,
 1 AS `reason_approved`,
 1 AS `reason_approved_est`,
 1 AS `so_sts`,
 1 AS `so_by`,
 1 AS `so_date`,
 1 AS `mat_plan_sts`,
 1 AS `mat_plan_by`,
 1 AS `mat_plan_date`,
 1 AS `total_um2`,
 1 AS `total_um_idr2`,
 1 AS `kategori`,
 1 AS `id_top`,
 1 AS `sisa_invoice`,
 1 AS `sisa_invoice_idr`,
 1 AS `total_pph`,
 1 AS `total_pph_idr`,
 1 AS `no_surat`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_tr_invoice_payment_temp` AS SELECT 
 1 AS `id_payment_detail`,
 1 AS `kd_pembayaran`,
 1 AS `no_ipp`,
 1 AS `so_number`,
 1 AS `no_invoice`,
 1 AS `tgl_invoice`,
 1 AS `id_customer`,
 1 AS `nm_customer`,
 1 AS `jenis_invoice`,
 1 AS `kurs_jual`,
 1 AS `persentase`,
 1 AS `kurs_bayar`,
 1 AS `total_product`,
 1 AS `total_product_idr`,
 1 AS `total_gab_product`,
 1 AS `total_gab_product_idr`,
 1 AS `total_material`,
 1 AS `total_material_idr`,
 1 AS `total_bq`,
 1 AS `total_bq_idr`,
 1 AS `total_enginering`,
 1 AS `total_enginering_idr`,
 1 AS `total_packing`,
 1 AS `total_packing_idr`,
 1 AS `total_trucking`,
 1 AS `total_trucking_idr`,
 1 AS `total_dpp_usd`,
 1 AS `total_dpp_rp`,
 1 AS `total_diskon`,
 1 AS `total_diskon_idr`,
 1 AS `total_retensi`,
 1 AS `total_retensi_idr`,
 1 AS `total_ppn`,
 1 AS `total_ppn_idr`,
 1 AS `total_invoice`,
 1 AS `total_invoice_idr`,
 1 AS `total_um`,
 1 AS `total_um_idr`,
 1 AS `total_bayar`,
 1 AS `total_bayar_idr`,
 1 AS `total_quotation`,
 1 AS `project_name`,
 1 AS `ket`,
 1 AS `estimasi`,
 1 AS `rev`,
 1 AS `created_by`,
 1 AS `created_on`,
 1 AS `modified_by`,
 1 AS `modified_on`,
 1 AS `cancel_by`,
 1 AS `cancel_date`,
 1 AS `no_po`,
 1 AS `no_faktur`,
 1 AS `no_pajak`,
 1 AS `payment_term`,
 1 AS `proses_print`,
 1 AS `est_date`,
 1 AS `approved`,
 1 AS `approved_by`,
 1 AS `approved_date`,
 1 AS `approved_est`,
 1 AS `approved_est_by`,
 1 AS `approved_est_date`,
 1 AS `aju_approved`,
 1 AS `aju_approved_by`,
 1 AS `aju_approved_date`,
 1 AS `aju_approved_est`,
 1 AS `aju_approved_est_by`,
 1 AS `aju_approved_est_date`,
 1 AS `reason_approved`,
 1 AS `reason_approved_est`,
 1 AS `so_sts`,
 1 AS `so_by`,
 1 AS `so_date`,
 1 AS `mat_plan_sts`,
 1 AS `mat_plan_by`,
 1 AS `mat_plan_date`,
 1 AS `total_um2`,
 1 AS `total_um_idr2`,
 1 AS `kategori`,
 1 AS `id_top`,
 1 AS `sisa_invoice`,
 1 AS `sisa_invoice_idr`,
 1 AS `total_pph`,
 1 AS `total_pph_idr`,
 1 AS `no_surat`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `kd_gudang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_gudang` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sts_ajust` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Y',
  `sts_1` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT 'show list adjusment origin warehouse',
  `sts_2` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'Y' COMMENT 'show list adjusment dest warehouse',
  `urut` tinyint DEFAULT NULL,
  `urut2` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_adjustment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_trans` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `no_ipp` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jumlah_mat` double(16,5) DEFAULT NULL,
  `jumlah_mat_packing` double(16,5) DEFAULT NULL,
  `jumlah_mat_check` double(16,5) DEFAULT NULL,
  `id_gudang_dari` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kd_gudang_dari` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_gudang_ke` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kd_gudang_ke` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_dept` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'N',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `checked_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `checked_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `inc_inv_create` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_adjustment_check` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_detail` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kode_trans` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_ipp` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_material` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_material` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_category` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_order` double(16,5) DEFAULT '0.00000',
  `qty_oke` double(16,5) DEFAULT NULL,
  `qty_rusak` double(16,5) DEFAULT '0.00000',
  `expired_date` date DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `konversi` double(9,4) DEFAULT NULL,
  `unit_price` double(16,2) DEFAULT NULL,
  `unit_price_idr` double(16,2) DEFAULT NULL,
  `qr` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_out` double(16,4) DEFAULT NULL,
  `dokumen` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`id_material`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_adjustment_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_trans` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `no_ipp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_material` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_material` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_order` double(16,5) DEFAULT '0.00000',
  `qty_oke` double(16,5) DEFAULT NULL,
  `qty_rusak` double(16,5) DEFAULT '0.00000',
  `expired_date` date DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `check_qty_oke` double(16,5) DEFAULT NULL,
  `check_qty_rusak` double(16,5) DEFAULT '0.00000',
  `check_expired_date` date DEFAULT NULL,
  `check_keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `no_ba` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_lot` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe_po` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_po_detail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket_req_po` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_category` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`,`id_material`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_material` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `idmaterial` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_material` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_category` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_gudang` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kd_gudang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_gudang_dari` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kd_gudang_dari` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_gudang_ke` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kd_gudang_ke` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `incoming_awal` double(10,3) DEFAULT NULL,
  `incoming_akhir` double(10,3) DEFAULT NULL,
  `qty_stock_awal` double(10,3) DEFAULT '0.000',
  `qty_stock_akhir` double(10,3) DEFAULT NULL,
  `qty_booking_awal` double(10,3) DEFAULT '0.000',
  `qty_booking_akhir` double(10,3) DEFAULT NULL,
  `qty_rusak_awal` double(10,3) DEFAULT '0.000',
  `qty_rusak_akhir` double(10,3) DEFAULT NULL,
  `no_ipp` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jumlah_mat` double(10,3) DEFAULT NULL,
  `ket` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `tanda_terima` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surat_jalan` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `qty_ng` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`id`,`id_material`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_material_adjustment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_adjustment` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'AM2008000001',
  `kd_gudang` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `material` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `stock_awal` int DEFAULT NULL,
  `stock_akhir` int DEFAULT NULL,
  `surat_jalan` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ajust_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` enum('order','product') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_product` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `costcenter` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_stock` int DEFAULT NULL,
  `qty_order` int DEFAULT NULL,
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `category` (`category`,`id_product`,`costcenter`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_product_adjustment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_adjustment` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'AD2008000001',
  `id_product` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `costcenter` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `stock_awal` int DEFAULT NULL,
  `stock_akhir` int DEFAULT NULL,
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_product_adjustment_daycode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kd_adjustment` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'AD2008000001',
  `id_product` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `costcenter` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_ke` int DEFAULT NULL,
  `daycode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_product_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` enum('order','product') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_product` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `costcenter` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_stock_awal` int DEFAULT NULL,
  `qty_stock_akhir` int DEFAULT NULL,
  `qty_order_awal` int DEFAULT NULL,
  `qty_order_akhir` int DEFAULT NULL,
  `no_trans` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_stock` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_material` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `idmaterial` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_material` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_category` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_gudang` int DEFAULT NULL,
  `kd_gudang` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `begining` double(10,4) DEFAULT '0.0000',
  `incoming` double(10,4) DEFAULT '0.0000',
  `outgoing` double(10,4) DEFAULT '0.0000',
  `qty_stock` double(10,4) DEFAULT '0.0000',
  `qty_booking` double(10,4) DEFAULT '0.0000',
  `qty_rusak` double(10,4) DEFAULT '0.0000',
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_stock_per_day` (
  `id_material` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_material` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_gudang` int DEFAULT NULL,
  `qty_stock` double(10,3) DEFAULT '0.000',
  `qty_booking` double(10,3) DEFAULT '0.000',
  `qty_rusak` double(10,3) DEFAULT '0.000',
  `hist_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_tr_invoice_detail` (
  `id_invoice` int NOT NULL AUTO_INCREMENT,
  `id_penagihan` int DEFAULT NULL,
  `id_bq` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_material` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `product_cust` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `desc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `dim_1` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dim_2` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `liner` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pressure` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spesifikasi` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `unit` varchar(225) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `harga_satuan` decimal(50,2) DEFAULT '0.00',
  `harga_satuan_idr` decimal(50,2) DEFAULT '0.00',
  `qty` decimal(50,2) DEFAULT '0.00',
  `harga_total` decimal(50,2) DEFAULT '0.00',
  `harga_total_idr` decimal(50,2) DEFAULT '0.00',
  `kategori_detail` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `cancel_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `id_billing_dtl` int DEFAULT NULL,
  PRIMARY KEY (`id_invoice`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `x_tr_invoice_header` (
  `id_invoice` int NOT NULL AUTO_INCREMENT,
  `id_penagihan` int DEFAULT NULL,
  `id_bq` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_ipp` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_number` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_invoice` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_invoice` date DEFAULT NULL,
  `id_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_invoice` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kurs_jual` decimal(50,2) DEFAULT '0.00',
  `persentase` decimal(50,2) DEFAULT '0.00',
  `kurs_bayar` decimal(50,2) DEFAULT '0.00',
  `total_product` decimal(50,2) DEFAULT '0.00',
  `total_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_gab_product` decimal(50,2) DEFAULT '0.00',
  `total_gab_product_idr` decimal(50,2) DEFAULT '0.00',
  `total_material` decimal(50,2) DEFAULT '0.00',
  `total_material_idr` decimal(50,2) DEFAULT '0.00',
  `total_bq` decimal(50,2) DEFAULT '0.00',
  `total_bq_idr` decimal(50,2) DEFAULT '0.00',
  `total_enginering` decimal(50,2) DEFAULT '0.00',
  `total_enginering_idr` decimal(50,2) DEFAULT '0.00',
  `total_packing` decimal(50,2) DEFAULT '0.00',
  `total_packing_idr` decimal(50,2) DEFAULT '0.00',
  `total_trucking` decimal(50,2) DEFAULT '0.00',
  `total_trucking_idr` decimal(50,2) DEFAULT '0.00',
  `total_dpp_usd` decimal(50,2) DEFAULT '0.00',
  `total_dpp_rp` decimal(50,2) DEFAULT '0.00',
  `total_diskon` decimal(50,2) DEFAULT '0.00',
  `total_diskon_idr` decimal(50,2) DEFAULT '0.00',
  `total_retensi` decimal(50,2) DEFAULT '0.00',
  `total_retensi_idr` decimal(50,2) DEFAULT '0.00',
  `total_ppn` decimal(50,2) DEFAULT '0.00',
  `total_ppn_idr` decimal(50,2) DEFAULT '0.00',
  `total_invoice` decimal(50,2) DEFAULT '0.00',
  `total_invoice_idr` decimal(50,2) DEFAULT '0.00',
  `total_um` decimal(50,2) DEFAULT '0.00',
  `total_um_idr` decimal(50,2) DEFAULT '0.00',
  `total_bayar` decimal(50,2) DEFAULT '0.00',
  `total_bayar_idr` decimal(50,2) DEFAULT '0.00',
  `series` char(9) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `order_type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `rev` tinyint DEFAULT '0',
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `cancel_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cancel_date` datetime DEFAULT NULL,
  `no_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_faktur` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_pajak` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `payment_term` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `proses_print` enum('0','1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  `est_date` datetime DEFAULT NULL,
  `approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_est_date` datetime DEFAULT NULL,
  `aju_approved` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_date` datetime DEFAULT NULL,
  `aju_approved_est` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `aju_approved_est_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aju_approved_est_date` datetime DEFAULT NULL,
  `reason_approved` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_approved_est` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_sts` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `so_date` datetime DEFAULT NULL,
  `mat_plan_sts` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `mat_plan_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mat_plan_date` datetime DEFAULT NULL,
  `total_um2` decimal(50,2) DEFAULT '0.00',
  `total_um_idr2` decimal(50,2) DEFAULT '0.00',
  `id_top` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `base_cur` varchar(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'USD',
  `file_inv` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_retensi2` decimal(50,2) DEFAULT '0.00',
  `total_retensi2_idr` decimal(50,2) DEFAULT '0.00',
  `printed_on` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sisa_invoice_idr` double(50,2) DEFAULT '0.00',
  `sisa_invoice` double(50,2) DEFAULT '0.00',
  PRIMARY KEY (`id_invoice`) USING BTREE,
  UNIQUE KEY `no_faktur_UNIQUE` (`no_faktur`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50001 DROP VIEW IF EXISTS `asset_jurnal`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `asset_jurnal` AS select `asset_generate`.`category` AS `category`,`asset_generate`.`nm_category` AS `nm_category`,sum(`asset_generate`.`nilai_susut`) AS `sisa_nilai`,`asset_generate`.`kdcab` AS `kdcab` from `asset_generate` where ((trim(leading 0 from `asset_generate`.`bulan`) = month(curdate())) and (`asset_generate`.`tahun` = year(curdate()))) group by `asset_generate`.`category`,`asset_generate`.`kdcab` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `asset_nilai`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `asset_nilai` AS select `asset_generate`.`kd_asset` AS `kd_asset`,`asset_generate`.`category` AS `category`,`asset_generate`.`nm_category` AS `nm_category`,sum(`asset_generate`.`nilai_susut`) AS `sisa_nilai` from `asset_generate` where (`asset_generate`.`flag` = 'N') group by `asset_generate`.`kd_asset` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `cek_count_double_daycode`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `cek_count_double_daycode` AS select `a`.`id_product` AS `id_product`,`b`.`id_costcenter` AS `id_costcenter`,`a`.`code` AS `code`,count(`a`.`id`) AS `jumlah_double` from (`report_produksi_daily_detail` `a` left join `report_produksi_daily_header` `b` on((`a`.`id_produksi_h` = `b`.`id_produksi_h`))) where (`a`.`sts_daycode` = 'N') group by `a`.`code`,`a`.`id_product`,`b`.`id_costcenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `cek_daycode`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `cek_daycode` AS select `f`.`nama` AS `nm_project`,`a`.`id_product` AS `id_product`,`e`.`nama` AS `nm_product`,`b`.`id_costcenter` AS `id_costcenter`,`c`.`nama_costcenter` AS `nama_costcenter`,`a`.`code` AS `code`,`a`.`ket` AS `ket`,count(`a`.`id`) AS `qty_stock`,`a`.`sts_daycode` AS `sts_daycode` from ((((`report_produksi_daily_detail` `a` left join `report_produksi_daily_header` `b` on((`a`.`id_produksi_h` = `b`.`id_produksi_h`))) left join `ms_costcenter` `c` on((convert(`b`.`id_costcenter` using utf8mb4) = convert(`c`.`id_costcenter` using utf8mb4)))) left join `ms_inventory_category2` `e` on((convert(`a`.`id_product` using utf8mb4) = convert(`e`.`id_category2` using utf8mb4)))) left join `ms_inventory_category1` `f` on((`e`.`id_category1` = `f`.`id_category1`))) where (`a`.`ket` = 'good') group by `a`.`id_product`,`b`.`id_costcenter` order by `a`.`id_product`,`b`.`id_costcenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `cek_daycode_delivery`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `cek_daycode_delivery` AS select `report_produksi_daily_detail`.`delivery_code` AS `delivery_code`,`report_produksi_daily_detail`.`id_product` AS `id_product`,`report_produksi_daily_detail`.`code` AS `daycode` from `report_produksi_daily_detail` where ((`report_produksi_daily_detail`.`sts_daycode` = 'Y') and (`report_produksi_daily_detail`.`delivery_code` like 'DY%')) group by `report_produksi_daily_detail`.`code`,`report_produksi_daily_detail`.`id_product`,`report_produksi_daily_detail`.`delivery_code` order by `report_produksi_daily_detail`.`delivery_code`,`report_produksi_daily_detail`.`id_product`,`report_produksi_daily_detail`.`code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `cek_daycode_double`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `cek_daycode_double` AS select `a`.`id` AS `id`,`b`.`id_costcenter` AS `id_costcenter`,`d`.`nama_costcenter` AS `nama_costcenter`,`a`.`id_product` AS `id_product`,`c`.`nama` AS `nama_product`,`a`.`code` AS `daycode`,count(`a`.`code`) AS `jumlah_double`,`a`.`ket` AS `ket` from (((`report_produksi_daily_detail` `a` left join `report_produksi_daily_header` `b` on((`a`.`id_produksi_h` = `b`.`id_produksi_h`))) left join `ms_inventory_category2` `c` on((convert(`a`.`id_product` using utf8mb4) = convert(`c`.`id_category2` using utf8mb4)))) left join `ms_costcenter` `d` on((convert(`b`.`id_costcenter` using utf8mb4) = convert(`d`.`id_costcenter` using utf8mb4)))) where (`a`.`sts_daycode` = 'N') group by `a`.`code`,`a`.`id_product`,`b`.`id_costcenter` order by `a`.`id_product`,`d`.`nama_costcenter`,`a`.`code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `cek_daycode_double_fast`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `cek_daycode_double_fast` AS select `a`.`id` AS `id`,`b`.`id_costcenter` AS `id_costcenter`,`a`.`id_product` AS `id_product`,`a`.`code` AS `daycode`,count(`a`.`code`) AS `jumlah_double`,`a`.`ket` AS `ket` from (`report_produksi_daily_detail` `a` left join `report_produksi_daily_header` `b` on((`a`.`id_produksi_h` = `b`.`id_produksi_h`))) where (`a`.`sts_daycode` = 'N') group by `a`.`code`,`a`.`id_product`,`b`.`id_costcenter` order by `a`.`id_product`,`b`.`id_costcenter`,`a`.`code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `cek_delivery`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `cek_delivery` AS select `a`.`id` AS `id`,`a`.`no_delivery` AS `no_delivery`,`b`.`no_so` AS `no_so`,`b`.`delivery_date` AS `delivery_date`,`a`.`id_so_detail` AS `id_so_detail`,`a`.`product` AS `product`,`a`.`qty_order` AS `qty_order`,`a`.`qty_delivery` AS `qty_delivery`,`a`.`qty_kurang` AS `qty_kurang`,`a`.`remarks` AS `remarks` from (`delivery_detail` `a` left join `delivery_header` `b` on((`a`.`no_delivery` = `b`.`no_delivery`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `cek_update_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `cek_update_product` AS select `a`.`id` AS `id`,`a`.`id_produksi` AS `id_produksi`,`b`.`id_costcenter` AS `id_costcenter`,`d`.`nama_costcenter` AS `nama_costcenter`,`a`.`id_product` AS `id_product`,`c`.`nama` AS `nama_product`,`a`.`code` AS `code`,`a`.`tanggal_produksi` AS `tanggal_produksi`,`b`.`created_by` AS `created_by`,`b`.`created_date` AS `created_date`,`a`.`ket` AS `ket`,`a`.`ket_date` AS `qc_date`,`a`.`sts_daycode` AS `sts_daycode`,`a`.`delivery_by` AS `delivery_by`,`a`.`delivery_code` AS `delivery_code` from (((`report_produksi_daily_detail` `a` left join `report_produksi_daily_header` `b` on((`a`.`id_produksi_h` = `b`.`id_produksi_h`))) left join `ms_inventory_category2` `c` on((convert(`a`.`id_product` using utf8mb4) = convert(`c`.`id_category2` using utf8mb4)))) left join `ms_costcenter` `d` on((convert(`b`.`id_costcenter` using utf8mb4) = convert(`d`.`id_costcenter` using utf8mb4)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `check_stock_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `check_stock_product` AS select `f`.`nama` AS `nm_project`,`a`.`id_product` AS `id_product`,`e`.`nama` AS `nm_product`,`b`.`id_costcenter` AS `id_costcenter`,`c`.`nama_costcenter` AS `nama_costcenter`,count(`a`.`id`) AS `qty_stock` from ((((`report_produksi_daily_detail` `a` left join `report_produksi_daily_header` `b` on((`a`.`id_produksi_h` = `b`.`id_produksi_h`))) left join `ms_costcenter` `c` on((convert(`b`.`id_costcenter` using utf8mb4) = convert(`c`.`id_costcenter` using utf8mb4)))) left join `ms_inventory_category2` `e` on((convert(`a`.`id_product` using utf8mb4) = convert(`e`.`id_category2` using utf8mb4)))) left join `ms_inventory_category1` `f` on((`e`.`id_category1` = `f`.`id_category1`))) where ((`a`.`ket` = 'good') and (`a`.`sts_daycode` = 'N')) group by `a`.`id_product`,`b`.`id_costcenter` order by `a`.`id_product`,`b`.`id_costcenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `check_urutan_cycletime`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `check_urutan_cycletime` AS select `cycletime_fast`.`id_time` AS `id_time`,`cycletime_fast`.`id_product` AS `id_product`,replace(ltrim(replace(max(`cycletime_fast`.`urut`),'0',' ')),' ','0') AS `urut`,count(`cycletime_fast`.`id`) AS `jumlah`,if((replace(ltrim(replace(max(`cycletime_fast`.`urut`),'0',' ')),' ','0') = count(`cycletime_fast`.`id`)),'true','flase') AS `ket_ct` from `cycletime_fast` group by `cycletime_fast`.`id_product` order by `cycletime_fast`.`id_product` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `employees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `employees` AS select `users`.`id_user` AS `id`,`users`.`nm_lengkap` AS `name`,`users`.`id_user` AS `nik`,'ORIGA' AS `company_id` from `users` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `filter_daycode`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `filter_daycode` AS select `b`.`id_costcenter` AS `id_costcenter`,`b`.`id_produksi_h` AS `id_produksi_h`,`a`.`id_product` AS `id_product`,`a`.`code` AS `code`,`a`.`tanggal_produksi` AS `tanggal_produksi`,`b`.`created_by` AS `created_by`,`b`.`created_date` AS `created_date`,`a`.`ket_date` AS `qc_date`,`a`.`sts_daycode` AS `sts_daycode`,`a`.`delivery_code` AS `delivery_code` from (`report_produksi_daily_detail` `a` left join `report_produksi_daily_header` `b` on((`a`.`id_produksi_h` = `b`.`id_produksi_h`))) group by `b`.`id_costcenter`,`a`.`id_product`,`a`.`code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `filter_daycode_delete`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `filter_daycode_delete` AS select `b`.`id_costcenter` AS `id_costcenter`,`a`.`id_product` AS `id_product`,`a`.`code` AS `code` from (`report_produksi_daily_detail` `a` left join `report_produksi_daily_header` `b` on((`a`.`id_produksi_h` = `b`.`id_produksi_h`))) where ((`a`.`sts_daycode` = 'N') and (`a`.`ket` = 'good')) group by `b`.`id_costcenter`,`a`.`id_product`,`a`.`code` order by `b`.`id_costcenter`,`a`.`id_product`,`a`.`code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `get_material_wip`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `get_material_wip` AS select `b`.`no_plan` AS `no_plan`,`b`.`costcenter` AS `costcenter`,`d`.`code_material` AS `code_material`,(sum(`a`.`qty`) * `d`.`weight`) AS `weight` from (((`produksi_planning_data` `a` left join `produksi_planning` `b` on((`a`.`no_plan` = `b`.`no_plan`))) left join `bom_header` `c` on((`a`.`product` = `c`.`id_product`))) left join `bom_detail` `d` on((`c`.`no_bom` = `d`.`no_bom`))) where ((`b`.`costcenter` = 'CC2000012') and (`a`.`sts_wip` = 'N') and (`c`.`deleted` = 'N')) group by `d`.`code_material`,`b`.`no_plan` order by `b`.`no_plan`,`d`.`code_material` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `get_plan_header`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `get_plan_header` AS select month(`b`.`delivery_date`) AS `bulan`,year(`b`.`delivery_date`) AS `tahun`,`d`.`code_material` AS `code_material` from (((`sales_order_detail` `a` left join `sales_order_header` `b` on((`a`.`no_so` = `b`.`no_so`))) left join `bom_header` `c` on((`a`.`product` = `c`.`id_product`))) left join `bom_detail` `d` on((`c`.`no_bom` = `d`.`no_bom`))) group by `d`.`code_material`,month(`b`.`delivery_date`),year(`b`.`delivery_date`) order by year(`b`.`delivery_date`),month(`b`.`delivery_date`),`d`.`code_material` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `get_plan_material`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `get_plan_material` AS select `a`.`product` AS `product`,month(`b`.`delivery_date`) AS `bulan`,year(`b`.`delivery_date`) AS `tahun`,`d`.`code_material` AS `code_material`,sum(`d`.`weight`) AS `weight` from (((`sales_order_detail` `a` left join `sales_order_header` `b` on((`a`.`no_so` = `b`.`no_so`))) left join `bom_header` `c` on((`a`.`product` = `c`.`id_product`))) left join `bom_detail` `d` on((`c`.`no_bom` = `d`.`no_bom`))) group by `d`.`code_material`,`a`.`product`,month(`b`.`delivery_date`),year(`b`.`delivery_date`) order by year(`b`.`delivery_date`),month(`b`.`delivery_date`),`d`.`code_material` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `get_plan_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `get_plan_product` AS select `a`.`product` AS `product`,sum(`a`.`qty_order`) AS `qty_order`,sum(`a`.`qty_propose`) AS `qty_propose`,month(`b`.`delivery_date`) AS `bulan`,year(`b`.`delivery_date`) AS `tahun` from (`sales_order_detail` `a` left join `sales_order_header` `b` on((`a`.`no_so` = `b`.`no_so`))) where (`a`.`product` <> '0') group by `a`.`product`,month(`b`.`delivery_date`),year(`b`.`delivery_date`) order by year(`b`.`delivery_date`),month(`b`.`delivery_date`),`a`.`product` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `get_plan_sum`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `get_plan_sum` AS select `a`.`product` AS `product`,month(`b`.`delivery_date`) AS `bulan`,year(`b`.`delivery_date`) AS `tahun`,`d`.`code_material` AS `code_material`,sum(`d`.`weight`) AS `weight` from (((`sales_order_detail` `a` left join `sales_order_header` `b` on((`a`.`no_so` = `b`.`no_so`))) left join `bom_header` `c` on((`a`.`product` = `c`.`id_product`))) left join `bom_detail` `d` on((`c`.`no_bom` = `d`.`no_bom`))) group by `d`.`code_material`,`a`.`product`,month(`b`.`delivery_date`),year(`b`.`delivery_date`) order by year(`b`.`delivery_date`),month(`b`.`delivery_date`),`d`.`code_material` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `get_pro_plan_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `get_pro_plan_product` AS select `a`.`product` AS `product`,sum(`a`.`qty_order`) AS `qty_order`,`b`.`delivery_date` AS `delivery_date` from (`sales_order_detail` `a` left join `sales_order_header` `b` on((`a`.`no_so` = `b`.`no_so`))) group by `a`.`product`,`b`.`delivery_date` order by `b`.`delivery_date`,`a`.`product` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `list_ct_full`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `list_ct_full` AS select `a`.`id_product` AS `id_product`,`g`.`nama` AS `nama_project`,`b`.`nama` AS `nama_product`,`c`.`costcenter` AS `id_costcenter`,`d`.`nama_costcenter` AS `nama_costcenter`,`e`.`id_process` AS `id_process`,`f`.`nm_process` AS `nm_process`,sum(`e`.`cycletime`) AS `cycletime`,sum(`e`.`qty_mp`) AS `qty_mp`,sum((`e`.`qty_mp` * `e`.`cycletime`)) AS `man_hours`,`e`.`note` AS `note` from ((((((`cycletime_header` `a` left join `ms_inventory_category2` `b` on((convert(`a`.`id_product` using utf8mb4) = convert(`b`.`id_category2` using utf8mb4)))) left join `cycletime_detail_header` `c` on((`a`.`id_time` = `c`.`id_time`))) left join `ms_costcenter` `d` on((convert(`c`.`costcenter` using utf8mb4) = convert(`d`.`id_costcenter` using utf8mb4)))) left join `cycletime_detail_detail` `e` on((`c`.`id_costcenter` = `e`.`id_costcenter`))) left join `ms_process` `f` on((`e`.`id_process` = `f`.`id`))) left join `ms_inventory_category1` `g` on((`b`.`id_category1` = `g`.`id_category1`))) group by `c`.`costcenter`,`a`.`id_product` order by `a`.`id_product`,`c`.`id_costcenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `list_ct_full_excel`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `list_ct_full_excel` AS select `a`.`id_product` AS `id_product`,`a`.`no_bom` AS `no_bom`,`b`.`nama` AS `nama_product`,`c`.`costcenter` AS `id_costcenter`,`d`.`nama_costcenter` AS `nama_costcenter`,`e`.`id_process` AS `id_process`,`e`.`nm_process` AS `nm_process`,`e`.`cycletime` AS `cycletime`,`e`.`qty_mp` AS `qty_mp`,(`e`.`qty_mp` * `e`.`cycletime`) AS `man_hours`,`e`.`note` AS `note`,`e`.`machine` AS `machine`,`e`.`mould` AS `mould` from ((((`cycletime_header` `a` left join `new_inventory_4` `b` on((`a`.`id_product` = `b`.`code_lv4`))) left join `cycletime_detail_header` `c` on((`a`.`id_time` = `c`.`id_time`))) left join `ms_costcenter` `d` on((convert(`c`.`costcenter` using utf8mb4) = convert(`d`.`id_costcenter` using utf8mb4)))) left join `cycletime_detail_detail` `e` on((`c`.`id_costcenter` = `e`.`id_costcenter`))) group by `e`.`nm_process`,`c`.`costcenter`,`a`.`id_product` order by `a`.`id_product`,`c`.`id_costcenter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `list_cycletime`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `list_cycletime` AS select `a`.`id_time` AS `id_time`,`b`.`id_costcenter` AS `id_costcenter`,`c`.`id_product` AS `id_product`,`b`.`costcenter` AS `costcenter`,sum((`a`.`cycletime` * if((`a`.`qty_mp` <> '0'),`a`.`qty_mp`,1))) AS `cycletime`,max(`a`.`qty_mp`) AS `mp`,substr(`b`.`id_costcenter`,-(2)) AS `urut` from ((`cycletime_detail_detail` `a` left join `cycletime_detail_header` `b` on((`a`.`id_costcenter` = `b`.`id_costcenter`))) left join `cycletime_header` `c` on((`a`.`id_time` = `c`.`id_time`))) group by `b`.`id_costcenter`,`c`.`id_product`,`a`.`id_time` order by `b`.`id`,`a`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `list_cycletime_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `list_cycletime_product` AS select `a`.`id_product` AS `id_product`,`b`.`costcenter` AS `costcenter`,`b`.`id_costcenter` AS `id_costcenter` from (`cycletime_header` `a` left join `cycletime_detail_header` `b` on((`a`.`id_time` = `b`.`id_time`))) order by `a`.`id`,`b`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `list_date_delivery`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `list_date_delivery` AS select `a`.`no_so` AS `no_so`,`a`.`code_cust` AS `code_cust`,`a`.`delivery_date` AS `delivery_date`,`b`.`product` AS `product`,sum(`b`.`qty_order`) AS `qty_order`,sum(`b`.`qty_delivery`) AS `qty_delivery`,(sum(`b`.`qty_order`) - sum(`b`.`qty_delivery`)) AS `qty_sisa` from (`sales_order_header` `a` left join `sales_order_detail` `b` on((`a`.`no_so` = `b`.`no_so`))) group by `a`.`no_so` order by `a`.`delivery_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `list_date_planning`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `list_date_planning` AS select month(`sales_order_header`.`delivery_date`) AS `bulan`,year(`sales_order_header`.`delivery_date`) AS `tahun` from `sales_order_header` group by month(`sales_order_header`.`delivery_date`),year(`sales_order_header`.`delivery_date`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `list_master_product`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `list_master_product` AS select `a`.`id_category2` AS `id_product`,`b`.`nama` AS `nama_project`,`a`.`nama` AS `nama_product` from (`ms_inventory_category2` `a` left join `ms_inventory_category1` `b` on((`a`.`id_category1` = `b`.`id_category1`))) order by `a`.`id_category2` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `list_quality_control`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `list_quality_control` AS select `a`.`id_produksi` AS `id_produksi`,`a`.`tanggal_produksi` AS `tanggal_produksi`,`b`.`id_costcenter` AS `id_costcenter`,`a`.`id_product` AS `id_product`,`a`.`code` AS `code`,`a`.`remarks` AS `remarks`,`a`.`ket` AS `ket` from (`report_produksi_daily_detail` `a` left join `report_produksi_daily_header` `b` on((`a`.`id_produksi` = `b`.`id_produksi`))) where ((`a`.`ket` = 'not yet') and (`a`.`id_product` <> '0')) order by `a`.`tanggal_produksi`,`b`.`id_costcenter`,`a`.`id_product`,`a`.`code` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `members`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `members` AS select `employees_internal`.`id` AS `id`,`employees_internal`.`name` AS `nama`,`employees_internal`.`nik` AS `nik`,`employees_internal`.`company_id` AS `company_id`,`employees_internal`.`division_id` AS `division_id`,`employees_internal`.`department_id` AS `department_id`,`employees_internal`.`flag_active` AS `status` from `employees_internal` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `ms_department`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `ms_department` AS select `hr_sentral`.`departments`.`id` AS `id`,`hr_sentral`.`departments`.`name` AS `nama`,NULL AS `deleted_by` from `hr_sentral`.`departments` where (`hr_sentral`.`departments`.`company_id` = 'COM003') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `pr_on_progress`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `pr_on_progress` AS select `a`.`id` AS `id`,`a`.`id_material` AS `id_material`,`a`.`propose_rev` AS `qty_pr`,`b`.`idpr` AS `idpr`,if((sum(`b`.`qty`) is null),0,sum(`b`.`qty`)) AS `qty_po` from (`material_planning_base_on_produksi_detail` `a` left join `dt_trans_po` `b` on((`a`.`id` = `b`.`idpr`))) where ((`a`.`status_app` = 'Y') and (`a`.`propose_rev` > 0)) group by `a`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `search_balance_so`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `search_balance_so` AS select `a`.`id` AS `id`,`c`.`code_cust` AS `code_cust`,`a`.`product` AS `product`,`a`.`qty_kurang` AS `qty_kurang` from ((`delivery_detail` `a` left join `delivery_header` `b` on((`a`.`no_delivery` = `b`.`no_delivery`))) left join `sales_order_header` `c` on((`b`.`no_so` = `c`.`no_so`))) order by `a`.`product`,`a`.`id` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `so_internal_spk_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `so_internal_spk_view` AS select `a`.`id` AS `id`,`a`.`kode` AS `kode`,`a`.`kode_det` AS `kode_det`,`a`.`no_spk` AS `no_spk`,`a`.`id_so` AS `id_so`,`a`.`tanggal` AS `tanggal`,`a`.`qty` AS `qty`,`a`.`id_gudang` AS `id_gudang`,`a`.`id_costcenter` AS `id_costcenter`,`a`.`created_by` AS `created_by`,`a`.`created_date` AS `created_date`,`a`.`status_id` AS `status_id`,`a`.`sts_request` AS `sts_request`,`a`.`request_by` AS `request_by`,`a`.`request_date` AS `request_date`,`a`.`sts_subgudang` AS `sts_subgudang`,`a`.`subgudang_by` AS `subgudang_by`,`a`.`subgudang_date` AS `subgudang_date`,`a`.`sts_produksi` AS `sts_produksi`,`a`.`produksi_by` AS `produksi_by`,`a`.`produksi_date` AS `produksi_date`,`a`.`produksi_confirm_by` AS `produksi_confirm_by`,`a`.`produksi_confirm_date` AS `produksi_confirm_date`,'mixing' AS `sts_spk`,`a`.`sts_mixing` AS `sts_mixing`,`a`.`mixing_by` AS `mixing_by`,`a`.`mixing_date` AS `mixing_date`,`a`.`sts_close` AS `sts_close`,`a`.`close_date` AS `close_date` from `so_internal_spk` `a` union select `b`.`id` AS `id`,`b`.`kode` AS `kode`,`b`.`kode_det` AS `kode_det`,`b`.`no_spk` AS `no_spk`,`b`.`id_so` AS `id_so`,`b`.`tanggal` AS `tanggal`,`b`.`qty` AS `qty`,`b`.`id_gudang` AS `id_gudang`,`b`.`id_costcenter` AS `id_costcenter`,`b`.`created_by` AS `created_by`,`b`.`created_date` AS `created_date`,`b`.`status_id` AS `status_id`,`b`.`sts_request` AS `sts_request`,`b`.`request_by` AS `request_by`,`b`.`request_date` AS `request_date`,`b`.`sts_subgudang` AS `sts_subgudang`,`b`.`subgudang_by` AS `subgudang_by`,`b`.`subgudang_date` AS `subgudang_date`,`b`.`sts_produksi` AS `sts_produksi`,`b`.`produksi_by` AS `produksi_by`,`b`.`produksi_date` AS `produksi_date`,`b`.`produksi_confirm_by` AS `produksi_confirm_by`,`b`.`produksi_confirm_date` AS `produksi_confirm_date`,'non-mixing' AS `sts_spk`,`b`.`sts_mixing` AS `sts_mixing`,`b`.`mixing_by` AS `mixing_by`,`b`.`mixing_date` AS `mixing_date`,`b`.`sts_close` AS `sts_close`,`b`.`close_date` AS `close_date` from `so_internal_spk` `b` where ((`b`.`sts_produksi` = 'P') or (`b`.`sts_produksi` = 'Y')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `user_emp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `user_emp` AS select `a`.`name` AS `nama_karyawan`,`b`.`id_user` AS `employee_id`,`b`.`id_user` AS `id`,`b`.`username` AS `username` from (`employees` `a` join `users` `b` on((`a`.`id` = `b`.`id_user`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `v_kasbon_list`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `v_kasbon_list` AS select `a`.`id` AS `id`,`a`.`no_doc` AS `no_doc`,`a`.`tgl_doc` AS `tgl_doc`,`a`.`departement` AS `departement`,`a`.`nama` AS `nama`,`a`.`jumlah_kasbon` AS `jumlah_kasbon`,`a`.`keperluan` AS `keperluan`,`a`.`doc_file` AS `doc_file`,`a`.`status` AS `status`,`a`.`created_by` AS `created_by`,`a`.`created_on` AS `created_on`,`a`.`modified_by` AS `modified_by`,`a`.`modified_on` AS `modified_on`,`a`.`coa` AS `coa`,`a`.`doc_file_2` AS `doc_file_2`,`a`.`bank_id` AS `bank_id`,`a`.`accnumber` AS `accnumber`,`a`.`accname` AS `accname`,`a`.`project` AS `project`,`a`.`st_reject` AS `st_reject`,`a`.`approved_by` AS `approved_by`,`a`.`approved_on` AS `approved_on`,`a`.`no_so` AS `no_so`,`a`.`jumlah_expense` AS `jumlah_expense`,`a`.`keterangan` AS `keterangan`,`a`.`id_pr` AS `id_pr`,`a`.`tipe_pr` AS `tipe_pr`,`a`.`sts_reject` AS `sts_reject`,`a`.`sts_reject_manage` AS `sts_reject_manage`,`a`.`reject_reason` AS `reject_reason`,`a`.`metode_pembayaran` AS `metode_pembayaran`,`a`.`id_expense_pett_pr_non_po` AS `id_expense_pett_pr_non_po`,`a`.`bukti_pengembalian` AS `bukti_pengembalian`,`a`.`kurang_bayar` AS `kurang_bayar`,`a`.`project_consultant` AS `project_consultant`,`a`.`no_kasbon_consultant` AS `no_kasbon_consultant`,`a`.`sts_incoming` AS `sts_incoming`,`a`.`no_coa` AS `no_coa`,`a`.`nm_coa` AS `nm_coa`,`a`.`sts_finance` AS `sts_finance`,`a`.`app_finance_date` AS `app_finance_date`,`a`.`reject_reason_finance` AS `reject_reason_finance`,`b`.`nm_lengkap` AS `nmuser_default`,(case when (`a`.`tipe_pr` = 'pr departemen') then (select `u1`.`nm_lengkap` from (`rutin_non_planning_header` `h1` join `users` `u1` on((`u1`.`id_user` = `h1`.`created_by`))) where (`h1`.`no_pr` = `a`.`id_pr`) limit 1) when (`a`.`tipe_pr` = 'pr stok') then (select `u2`.`nm_lengkap` from (`material_planning_base_on_produksi` `h2` join `users` `u2` on((`u2`.`id_user` = `h2`.`created_by`))) where (`h2`.`no_pr` = `a`.`id_pr`) limit 1) when (`a`.`tipe_pr` = 'pr asset') then (select `u3`.`nm_lengkap` from (`tran_pr_header` `h3` join `users` `u3` on((`u3`.`id_user` = `h3`.`created_by`))) where (`h3`.`no_pr` = `a`.`id_pr`) limit 1) else `b`.`nm_lengkap` end) AS `nmuser_fix` from (`tr_kasbon` `a` left join `users` `b` on((`a`.`nama` = `b`.`username`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `v_list_payment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `v_list_payment` AS select `a`.`id` AS `id`,`a`.`no_doc` AS `no_doc`,`a`.`created_on` AS `created_on`,`a`.`currency` AS `currency`,`a`.`jumlah` AS `jumlah`,`a`.`keperluan` AS `keperluan`,`a`.`status` AS `status`,`a`.`tipe` AS `tipe`,coalesce(`b`.`created_by`,`c`.`nama`,`d`.`nama`,`a`.`created_by`) AS `requestor`,(case when (`b`.`exp_inv_po` = 1) then 1 else 0 end) AS `is_po_payment` from (((`payment_approve` `a` left join `tr_expense` `b` on((`b`.`no_doc` = `a`.`no_doc`))) left join `tr_kasbon` `c` on((`c`.`no_doc` = `a`.`no_doc`))) left join `tr_transport_req` `d` on((`d`.`no_doc` = `a`.`no_doc`))) where (`a`.`deleted` <> 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `v_request_payment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `v_request_payment` AS select `z`.`id` AS `id`,`z`.`no_dokumen` AS `no_dokumen`,`z`.`request_by` AS `request_by`,`z`.`tanggal` AS `tanggal`,`z`.`keperluan` AS `keperluan`,`z`.`kategori` AS `kategori`,`z`.`nilai_pengajuan` AS `nilai_pengajuan`,`z`.`status` AS `status` from (select `a`.`id` AS `id`,convert(`a`.`no_doc` using latin1) AS `no_dokumen`,convert(`a`.`created_by` using latin1) AS `request_by`,`a`.`tgl_doc` AS `tanggal`,convert(`b`.`keperluan` using latin1) AS `keperluan`,convert('Transport' using latin1) AS `kategori`,`a`.`jumlah_expense` AS `nilai_pengajuan`,`a`.`status` AS `status` from (`tr_transport_req` `a` left join `tr_transport` `b` on((`b`.`no_req` = `a`.`no_doc`))) union all select `a`.`id` AS `id`,convert(`a`.`no_doc` using latin1) AS `no_dokumen`,convert(coalesce(`u`.`nm_lengkap`,`a`.`created_by`) using latin1) AS `request_by`,(case when (`a`.`tipe_pr` = 'pr stok') then coalesce((select cast(`material_planning_base_on_produksi`.`created_date` as date) from `material_planning_base_on_produksi` where (`material_planning_base_on_produksi`.`no_pr` = `a`.`id_pr`) limit 1),`a`.`tgl_doc`) when (`a`.`tipe_pr` = 'pr departemen') then coalesce((select cast(`rutin_non_planning_header`.`created_date` as date) from `rutin_non_planning_header` where (`rutin_non_planning_header`.`no_pr` = `a`.`id_pr`) limit 1),`a`.`tgl_doc`) when (`a`.`tipe_pr` = 'pr asset') then coalesce((select cast(`tran_pr_header`.`created_date` as date) from `tran_pr_header` where (`tran_pr_header`.`no_pr` = `a`.`id_pr`) limit 1),`a`.`tgl_doc`) else `a`.`tgl_doc` end) AS `tanggal`,convert(`a`.`keperluan` using latin1) AS `keperluan`,convert('Kasbon' using latin1) AS `kategori`,`a`.`jumlah_kasbon` AS `nilai_pengajuan`,`a`.`status` AS `status` from (`tr_kasbon` `a` left join `users` `u` on((`u`.`id_user` = `a`.`created_by`))) union all select `a`.`id` AS `id`,convert(`a`.`no_doc` using latin1) AS `no_dokumen`,convert(`a`.`created_by` using latin1) AS `request_by`,`a`.`tgl_doc` AS `tanggal`,convert((case when ((`a`.`id_kasbon` is not null) and (`a`.`kurang_bayar` is not null) and (`a`.`kurang_bayar` > 0)) then concat('Lebih Expense - ',coalesce(`a`.`informasi`,'')) else `a`.`informasi` end) using latin1) AS `keperluan`,convert('Expense' using latin1) AS `kategori`,(case when ((`a`.`kurang_bayar` is not null) and (`a`.`kurang_bayar` > 0)) then `a`.`kurang_bayar` else `a`.`jumlah` end) AS `nilai_pengajuan`,(case when ((`a`.`id_kasbon` is not null) and (`a`.`kurang_bayar` is not null) and (`a`.`kurang_bayar` > 0)) then (case when (`a`.`status` = 2) then '1' else '0' end) else `a`.`status` end) AS `status` from `tr_expense` `a` union all select `a`.`id` AS `id`,convert(`a`.`no_doc` using latin1) AS `no_dokumen`,convert(`u`.`nm_lengkap` using latin1) AS `request_by`,`a`.`tanggal_doc` AS `tanggal`,convert((select group_concat(`dd`.`keterangan` separator '\n') from `tr_pengajuan_rutin_detail` `dd` where (`dd`.`no_doc` = `a`.`no_doc`)) using latin1) AS `keperluan`,convert('Periodik' using latin1) AS `kategori`,(select sum(`aa`.`nilai`) from `tr_pengajuan_rutin_detail` `aa` where (`aa`.`no_doc` = `a`.`no_doc`)) AS `nilai_pengajuan`,`a`.`status` AS `status` from (`tr_pengajuan_rutin` `a` left join `users` `u` on((`u`.`id_user` = `a`.`created_by`))) where exists(select 1 from `tr_pengajuan_rutin_detail` `x` where ((`x`.`no_doc` = `a`.`no_doc`) and (`x`.`no_item` is not null))) is false union all select `d`.`id` AS `id`,convert(`d`.`no_item` using latin1) AS `no_dokumen`,convert(`u`.`nm_lengkap` using latin1) AS `request_by`,`a`.`tanggal_doc` AS `tanggal`,convert(concat(coalesce(nullif(trim(`d`.`keterangan`),''),`d`.`nama`),' (Batch ',`a`.`no_doc`,')') using latin1) AS `keperluan`,convert('Periodik' using latin1) AS `kategori`,`d`.`nilai` AS `nilai_pengajuan`,`d`.`item_status` AS `status` from ((`tr_pengajuan_rutin_detail` `d` join `tr_pengajuan_rutin` `a` on((`a`.`no_doc` = `d`.`no_doc`))) left join `users` `u` on((`u`.`id_user` = `a`.`created_by`))) where (`d`.`no_item` is not null) union all select `a`.`id` AS `id`,convert(`a`.`no_non_po` using latin1) AS `no_dokumen`,convert(`u`.`nm_lengkap` using latin1) AS `request_by`,(case when (`a`.`jenis_pr` = 'pr stok') then coalesce((select cast(`material_planning_base_on_produksi`.`created_date` as date) from `material_planning_base_on_produksi` where (`material_planning_base_on_produksi`.`no_pr` = `a`.`no_pr`) limit 1),cast(`a`.`created_date` as date)) when (`a`.`jenis_pr` = 'pr departemen') then coalesce((select cast(`rutin_non_planning_header`.`created_date` as date) from `rutin_non_planning_header` where (`rutin_non_planning_header`.`no_pr` = `a`.`no_pr`) limit 1),cast(`a`.`created_date` as date)) when (`a`.`jenis_pr` = 'pr asset') then coalesce((select cast(`tran_pr_header`.`created_date` as date) from `tran_pr_header` where (`tran_pr_header`.`no_pr` = `a`.`no_pr`) limit 1),cast(`a`.`created_date` as date)) else cast(`a`.`created_date` as date) end) AS `tanggal`,convert((case when (`a`.`jenis_pr` = 'pr stok') then convert(concat('PR Stock - ',`a`.`no_pr`) using utf8mb4) when (`a`.`jenis_pr` = 'pr departemen') then (select `rutin_non_planning_header`.`project_name` from `rutin_non_planning_header` where (`rutin_non_planning_header`.`no_pr` = `a`.`no_pr`) limit 1) else convert((select concat('PR Asset - ',`a`.`no_pr`,' - ',`tran_pr_detail`.`nm_barang`) from `tran_pr_detail` where (`tran_pr_detail`.`no_pr` = `a`.`no_pr`) limit 1) using utf8mb4) end) using latin1) AS `keperluan`,convert('Cash' using latin1) AS `kategori`,`a`.`total_pr` AS `nilai_pengajuan`,`a`.`sts` AS `status` from (`tr_pr_non_po` `a` left join `users` `u` on((`u`.`id_user` = `a`.`created_by`))) union all select `a`.`id` AS `id`,convert(`a`.`no_doc` using latin1) AS `no_dokumen`,convert(coalesce(`u`.`nm_lengkap`,`a`.`nama`,`a`.`created_by`) using latin1) AS `request_by`,`a`.`tgl_doc` AS `tanggal`,convert(`a`.`keperluan` using latin1) AS `keperluan`,convert((case when (`a`.`tipe` = 'petty_cash') then 'Petty Cash' when (`a`.`tipe` = 'petty_cash_hutang') then 'Petty Cash Hutang' else `a`.`tipe` end) using latin1) AS `kategori`,`a`.`jumlah` AS `nilai_pengajuan`,`a`.`status` AS `status` from (`request_payment` `a` left join `users` `u` on((`u`.`id_user` = `a`.`created_by`))) union all select `a`.`id` AS `id`,convert(`a`.`no_doc` using latin1) AS `no_dokumen`,convert(coalesce(`u`.`nm_lengkap`,`a`.`created_by`) using latin1) AS `request_by`,`a`.`tgl_doc` AS `tanggal`,convert(`a`.`deskripsi` using latin1) AS `keperluan`,convert('Direct Payment' using latin1) AS `kategori`,`a`.`grand_total` AS `nilai_pengajuan`,`a`.`sts` AS `status` from (`tr_direct_payment` `a` left join `users` `u` on((`u`.`id_user` = `a`.`created_by`)))) `z` group by `z`.`no_dokumen` order by `z`.`tanggal` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_bom_hth_ftackle`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_bom_hth_ftackle` AS select `a`.`id` AS `id`,`a`.`kode_bom_hth` AS `kode_bom_hth`,`a`.`kode_bom_hth_detail` AS `kode_bom_hth_detail`,`a`.`id_group_material` AS `id_group_material`,`a`.`id_material` AS `material`,`a`.`qty` AS `qty`,`a`.`price` AS `price`,`a`.`total` AS `total` from `bom_hth_detail_detail` `a` where (`a`.`company` = 'f-tackle') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_bom_hth_origa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_bom_hth_origa` AS select `a`.`id` AS `id`,`a`.`kode_bom_hth` AS `kode_bom_hth`,`a`.`kode_bom_hth_detail` AS `kode_bom_hth_detail`,`a`.`id_group_material` AS `id_group_material`,`a`.`id_material` AS `material`,`a`.`qty` AS `qty`,`a`.`price` AS `price`,`a`.`total` AS `total` from `bom_hth_detail_detail` `a` where (`a`.`company` = 'origa') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_rekap_actual_plan_tagih`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_rekap_actual_plan_tagih` AS select `a`.`id_spk_penawaran` AS `id_spk_penawaran`,`a`.`id_customer` AS `id_customer`,`a`.`nm_customer` AS `nm_customer`,`a`.`nilai_kontrak` AS `nilai_kontrak`,`c`.`id` AS `id_company`,`c`.`nm_company` AS `nm_company`,`d`.`nm_paket` AS `nm_paket`,`a`.`sts_spk` AS `sts_spk`,`a`.`input_date` AS `input_date`,`b`.`company` AS `id_company_ref`,coalesce(`inv`.`total_invoice`,0) AS `nominal_invoice`,coalesce(`uninv`.`total_uninvoice`,0) AS `nominal_uninvoice`,coalesce(`mct`.`total_macet`,0) AS `macet`,coalesce(`mt`.`thn`,year(`a`.`input_date`)) AS `tahun_data`,coalesce(sum((case when (`mt`.`bln` = 1) then `mt`.`nominal` end)),0) AS `jan`,coalesce(sum((case when (`mt`.`bln` = 2) then `mt`.`nominal` end)),0) AS `feb`,coalesce(sum((case when (`mt`.`bln` = 3) then `mt`.`nominal` end)),0) AS `mar`,coalesce(sum((case when (`mt`.`bln` = 4) then `mt`.`nominal` end)),0) AS `apr`,coalesce(sum((case when (`mt`.`bln` = 5) then `mt`.`nominal` end)),0) AS `may_val`,coalesce(sum((case when (`mt`.`bln` = 6) then `mt`.`nominal` end)),0) AS `jun`,coalesce(sum((case when (`mt`.`bln` = 7) then `mt`.`nominal` end)),0) AS `jul`,coalesce(sum((case when (`mt`.`bln` = 8) then `mt`.`nominal` end)),0) AS `aug`,coalesce(sum((case when (`mt`.`bln` = 9) then `mt`.`nominal` end)),0) AS `sep`,coalesce(sum((case when (`mt`.`bln` = 10) then `mt`.`nominal` end)),0) AS `oct`,coalesce(sum((case when (`mt`.`bln` = 11) then `mt`.`nominal` end)),0) AS `nov`,coalesce(sum((case when (`mt`.`bln` = 12) then `mt`.`nominal` end)),0) AS `dec_val` from (((((((`db_consultant_new`.`kons_tr_spk_penawaran` `a` left join `db_consultant_new`.`kons_tr_penawaran` `b` on((`b`.`id_quotation` = `a`.`id_penawaran`))) left join `db_consultant_new`.`kons_tr_company` `c` on((`c`.`id` = `b`.`company`))) left join `db_consultant_new`.`kons_master_konsultasi_header` `d` on((`d`.`id_konsultasi_h` = `a`.`id_project`))) left join (select `kons_tr_plan_tagih_detail`.`id_spk_penawaran` AS `id_spk_penawaran`,sum(`kons_tr_plan_tagih_detail`.`nominal_payment`) AS `total_invoice` from `kons_tr_plan_tagih_detail` where (`kons_tr_plan_tagih_detail`.`sts_invoice` = '1') group by `kons_tr_plan_tagih_detail`.`id_spk_penawaran`) `inv` on((`inv`.`id_spk_penawaran` = `a`.`id_spk_penawaran`))) left join (select `kons_tr_plan_tagih_detail`.`id_spk_penawaran` AS `id_spk_penawaran`,sum(`kons_tr_plan_tagih_detail`.`nominal_payment`) AS `total_uninvoice` from `kons_tr_plan_tagih_detail` where ((`kons_tr_plan_tagih_detail`.`sts_invoice` <> '1') and (`kons_tr_plan_tagih_detail`.`status_terakhir` <> '3')) group by `kons_tr_plan_tagih_detail`.`id_spk_penawaran`) `uninv` on((`uninv`.`id_spk_penawaran` = `a`.`id_spk_penawaran`))) left join (select `kons_tr_plan_tagih_detail`.`id_spk_penawaran` AS `id_spk_penawaran`,sum(`kons_tr_plan_tagih_detail`.`nominal_payment`) AS `total_macet` from `kons_tr_plan_tagih_detail` where ((`kons_tr_plan_tagih_detail`.`status_terakhir` = '3') and (`kons_tr_plan_tagih_detail`.`sts_invoice` <> '1')) group by `kons_tr_plan_tagih_detail`.`id_spk_penawaran`) `mct` on((`mct`.`id_spk_penawaran` = `a`.`id_spk_penawaran`))) left join (select `tmp`.`id_spk_penawaran` AS `id_spk_penawaran`,year(`tmp`.`tanggal_actual_plan_tagih`) AS `thn`,month(`tmp`.`tanggal_actual_plan_tagih`) AS `bln`,sum(`tmp`.`nominal`) AS `nominal` from (select `act`.`id_spk_penawaran` AS `id_spk_penawaran`,`act`.`tanggal_actual_plan_tagih` AS `tanggal_actual_plan_tagih`,`det`.`nominal_payment` AS `nominal`,row_number() OVER (PARTITION BY `act`.`id_detail_plan_tagih` ORDER BY `act`.`created_date` desc )  AS `rn`,`act`.`tagih_mundur` AS `tagih_mundur` from (`kons_tr_actual_plan_tagih` `act` join `kons_tr_plan_tagih_detail` `det` on((`act`.`id_detail_plan_tagih` = `det`.`id`)))) `tmp` where ((`tmp`.`rn` = 1) and (`tmp`.`tagih_mundur` in ('1','2'))) group by `tmp`.`id_spk_penawaran`,`thn`,`bln` union all select `p`.`id_spk_penawaran` AS `id_spk_penawaran`,year(`p`.`tgl_plan_tagih`) AS `thn`,month(`p`.`tgl_plan_tagih`) AS `bln`,sum(`p`.`nominal_payment`) AS `nominal` from `kons_tr_plan_tagih_detail` `p` where exists(select 1 from `kons_tr_actual_plan_tagih` `act` where ((`act`.`id_detail_plan_tagih` = `p`.`id`) and (`act`.`tagih_mundur` in ('1','2','3')))) is false group by `p`.`id_spk_penawaran`,`thn`,`bln`) `mt` on((`mt`.`id_spk_penawaran` = `a`.`id_spk_penawaran`))) group by `a`.`id_spk_penawaran`,`tahun_data` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_report_actual_plan_tagih`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_report_actual_plan_tagih` AS select `c`.`id` AS `id_company`,`c`.`nm_company` AS `nm_company`,`a`.`id_spk_penawaran` AS `id_spk_penawaran`,`a`.`id_customer` AS `id_customer`,`a`.`nm_customer` AS `nm_customer`,`d`.`nm_paket` AS `nm_paket`,`a`.`nilai_kontrak` AS `nilai_kontrak`,year(coalesce(`aa`.`tanggal_actual_plan_tagih`,`aa`.`tgl_plan_tagih`)) AS `tahun`,(select coalesce(sum(`aa2`.`nominal_payment`),0) from `kons_tr_actual_plan_tagih` `aa2` where ((`aa2`.`sts_invoice` = '1') and (`aa2`.`id_spk_penawaran` = `a`.`id_spk_penawaran`) and (`aa2`.`tagih_mundur` = '1'))) AS `total_invoice`,`aa`.`nominal_payment` AS `nominal_bulanan`,month(coalesce(`aa`.`tanggal_actual_plan_tagih`,`aa`.`tgl_plan_tagih`)) AS `bulan`,coalesce(`aa`.`tanggal_actual_plan_tagih`,`aa`.`tgl_plan_tagih`) AS `tanggal` from ((((`db_consultant_new`.`kons_tr_spk_penawaran` `a` left join `db_consultant_new`.`kons_tr_penawaran` `b` on((`b`.`id_quotation` = `a`.`id_penawaran`))) left join `db_consultant_new`.`kons_tr_company` `c` on((`c`.`id` = `b`.`company`))) left join `db_consultant_new`.`kons_master_konsultasi_header` `d` on((`d`.`id_konsultasi_h` = `a`.`id_project`))) join `kons_tr_actual_plan_tagih` `aa` on((`aa`.`id_spk_penawaran` = `a`.`id_spk_penawaran`))) where (`a`.`sts_spk` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_report_actual_plan_tagih_filterable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_report_actual_plan_tagih_filterable` AS select `c`.`id` AS `id_company`,`c`.`nm_company` AS `nm_company`,`a`.`id_spk_penawaran` AS `id_spk_penawaran`,`a`.`id_customer` AS `id_customer`,`a`.`nm_customer` AS `nm_customer`,`d`.`nm_paket` AS `nm_paket`,`a`.`nilai_kontrak` AS `nilai_kontrak`,year(coalesce(`aa`.`tanggal_actual_plan_tagih`,`aa`.`tgl_plan_tagih`)) AS `tahun`,(select coalesce(sum(`aa2`.`nominal_payment`),0.00) from `kons_tr_actual_plan_tagih` `aa2` where ((`aa2`.`sts_invoice` = '1') and (`aa2`.`id_spk_penawaran` = `a`.`id_spk_penawaran`) and (`aa2`.`tagih_mundur` = '1'))) AS `total_invoice`,`aa`.`nominal_payment` AS `nominal_bulanan`,month(coalesce(`aa`.`tanggal_actual_plan_tagih`,`aa`.`tgl_plan_tagih`)) AS `bulan`,coalesce(`aa`.`tanggal_actual_plan_tagih`,`aa`.`tgl_plan_tagih`) AS `tanggal` from ((((`db_consultant_new`.`kons_tr_spk_penawaran` `a` left join `db_consultant_new`.`kons_tr_penawaran` `b` on((`b`.`id_quotation` = `a`.`id_penawaran`))) left join `db_consultant_new`.`kons_tr_company` `c` on((`c`.`id` = `b`.`company`))) left join `db_consultant_new`.`kons_master_konsultasi_header` `d` on((`d`.`id_konsultasi_h` = `a`.`id_project`))) left join `kons_tr_actual_plan_tagih` `aa` on((`aa`.`id_spk_penawaran` = `a`.`id_spk_penawaran`))) where ((`a`.`sts_spk` = '1') and (`aa`.`tagih_mundur` = '1')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_report_piutang`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_report_piutang` AS select `spk`.`id_spk_penawaran` AS `id_spk_penawaran`,`spk`.`id_spk_penawaran` AS `no_spk`,`spk`.`nm_customer` AS `nm_customer`,`spk`.`nilai_kontrak` AS `nilai_kontrak`,`inv`.`id` AS `id_invoice`,`inv`.`no_invoice` AS `no_invoice`,`inv`.`tanggal_invoice` AS `tanggal_invoice`,`inv`.`total_nominal` AS `nilai_invoice`,`ppd`.`id` AS `id_penerimaan_detail`,`pp`.`no_surat` AS `no_penerimaan`,`pp`.`created_date` AS `tanggal_penerimaan`,`ppd`.`penerimaan` AS `nilai_penerimaan`,(coalesce(`inv`.`total_nominal`,0) - coalesce((select sum(`ppd2`.`penerimaan`) from `tr_penerimaan_piutang_detail` `ppd2` where (`ppd2`.`id_inv` = `inv`.`id`)),0)) AS `saldo_piutang` from (((`db_consultant_new`.`kons_tr_spk_penawaran` `spk` left join `tr_invoicing` `inv` on((`inv`.`id_spk_penawaran` = `spk`.`id_spk_penawaran`))) left join `tr_penerimaan_piutang_detail` `ppd` on((`ppd`.`id_inv` = `inv`.`id`))) left join `tr_penerimaan_piutang` `pp` on((`pp`.`no_surat` = `ppd`.`id_header`))) where (`spk`.`sts_spk` = '1') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_tr_invoice_payment`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_tr_invoice_payment` AS select `a`.`id_payment_detail` AS `id_payment_detail`,`a`.`kd_pembayaran` AS `kd_pembayaran`,`a`.`no_ipp` AS `no_ipp`,`a`.`so_number` AS `so_number`,`a`.`no_invoice` AS `no_invoice`,`a`.`tgl_invoice` AS `tgl_invoice`,`a`.`id_customer` AS `id_customer`,`a`.`nm_customer` AS `nm_customer`,`a`.`jenis_invoice` AS `jenis_invoice`,`a`.`kurs_jual` AS `kurs_jual`,`a`.`persentase` AS `persentase`,`a`.`kurs_bayar` AS `kurs_bayar`,`a`.`total_product` AS `total_product`,`a`.`total_product_idr` AS `total_product_idr`,`a`.`total_gab_product` AS `total_gab_product`,`a`.`total_gab_product_idr` AS `total_gab_product_idr`,`a`.`total_material` AS `total_material`,`a`.`total_material_idr` AS `total_material_idr`,`a`.`total_bq` AS `total_bq`,`a`.`total_bq_idr` AS `total_bq_idr`,`a`.`total_enginering` AS `total_enginering`,`a`.`total_enginering_idr` AS `total_enginering_idr`,`a`.`total_packing` AS `total_packing`,`a`.`total_packing_idr` AS `total_packing_idr`,`a`.`total_trucking` AS `total_trucking`,`a`.`total_trucking_idr` AS `total_trucking_idr`,`a`.`total_dpp_usd` AS `total_dpp_usd`,`a`.`total_dpp_rp` AS `total_dpp_rp`,`a`.`total_diskon` AS `total_diskon`,`a`.`total_diskon_idr` AS `total_diskon_idr`,`a`.`total_retensi` AS `total_retensi`,`a`.`total_retensi_idr` AS `total_retensi_idr`,`a`.`total_ppn` AS `total_ppn`,`a`.`total_ppn_idr` AS `total_ppn_idr`,`a`.`total_invoice` AS `total_invoice`,`a`.`total_invoice_idr` AS `total_invoice_idr`,`a`.`total_um` AS `total_um`,`a`.`total_um_idr` AS `total_um_idr`,`a`.`total_bayar` AS `total_bayar`,`a`.`total_bayar_idr` AS `total_bayar_idr`,`a`.`total_quotation` AS `total_quotation`,`a`.`project_name` AS `project_name`,`a`.`ket` AS `ket`,`a`.`estimasi` AS `estimasi`,`a`.`rev` AS `rev`,`a`.`created_by` AS `created_by`,`a`.`created_on` AS `created_on`,`a`.`modified_by` AS `modified_by`,`a`.`modified_on` AS `modified_on`,`a`.`cancel_by` AS `cancel_by`,`a`.`cancel_date` AS `cancel_date`,`a`.`no_po` AS `no_po`,`a`.`no_faktur` AS `no_faktur`,`a`.`no_pajak` AS `no_pajak`,`a`.`payment_term` AS `payment_term`,`a`.`proses_print` AS `proses_print`,`a`.`est_date` AS `est_date`,`a`.`approved` AS `approved`,`a`.`approved_by` AS `approved_by`,`a`.`approved_date` AS `approved_date`,`a`.`approved_est` AS `approved_est`,`a`.`approved_est_by` AS `approved_est_by`,`a`.`approved_est_date` AS `approved_est_date`,`a`.`aju_approved` AS `aju_approved`,`a`.`aju_approved_by` AS `aju_approved_by`,`a`.`aju_approved_date` AS `aju_approved_date`,`a`.`aju_approved_est` AS `aju_approved_est`,`a`.`aju_approved_est_by` AS `aju_approved_est_by`,`a`.`aju_approved_est_date` AS `aju_approved_est_date`,`a`.`reason_approved` AS `reason_approved`,`a`.`reason_approved_est` AS `reason_approved_est`,`a`.`so_sts` AS `so_sts`,`a`.`so_by` AS `so_by`,`a`.`so_date` AS `so_date`,`a`.`mat_plan_sts` AS `mat_plan_sts`,`a`.`mat_plan_by` AS `mat_plan_by`,`a`.`mat_plan_date` AS `mat_plan_date`,`a`.`total_um2` AS `total_um2`,`a`.`total_um_idr2` AS `total_um_idr2`,`a`.`kategori` AS `kategori`,`a`.`id_top` AS `id_top`,`a`.`sisa_invoice` AS `sisa_invoice`,`a`.`sisa_invoice_idr` AS `sisa_invoice_idr`,`a`.`total_pph` AS `total_pph`,`a`.`total_pph_idr` AS `total_pph_idr`,`b`.`no_invoice` AS `no_surat` from (`tr_invoice_payment_detail` `a` join `tr_invoice_header` `b` on((`b`.`no_invoice` = `a`.`no_invoice`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_tr_invoice_payment_temp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_tr_invoice_payment_temp` AS select `a`.`id_payment_detail` AS `id_payment_detail`,`a`.`kd_pembayaran` AS `kd_pembayaran`,`a`.`no_ipp` AS `no_ipp`,`a`.`so_number` AS `so_number`,`a`.`no_invoice` AS `no_invoice`,`a`.`tgl_invoice` AS `tgl_invoice`,`a`.`id_customer` AS `id_customer`,`a`.`nm_customer` AS `nm_customer`,`a`.`jenis_invoice` AS `jenis_invoice`,`a`.`kurs_jual` AS `kurs_jual`,`a`.`persentase` AS `persentase`,`a`.`kurs_bayar` AS `kurs_bayar`,`a`.`total_product` AS `total_product`,`a`.`total_product_idr` AS `total_product_idr`,`a`.`total_gab_product` AS `total_gab_product`,`a`.`total_gab_product_idr` AS `total_gab_product_idr`,`a`.`total_material` AS `total_material`,`a`.`total_material_idr` AS `total_material_idr`,`a`.`total_bq` AS `total_bq`,`a`.`total_bq_idr` AS `total_bq_idr`,`a`.`total_enginering` AS `total_enginering`,`a`.`total_enginering_idr` AS `total_enginering_idr`,`a`.`total_packing` AS `total_packing`,`a`.`total_packing_idr` AS `total_packing_idr`,`a`.`total_trucking` AS `total_trucking`,`a`.`total_trucking_idr` AS `total_trucking_idr`,`a`.`total_dpp_usd` AS `total_dpp_usd`,`a`.`total_dpp_rp` AS `total_dpp_rp`,`a`.`total_diskon` AS `total_diskon`,`a`.`total_diskon_idr` AS `total_diskon_idr`,`a`.`total_retensi` AS `total_retensi`,`a`.`total_retensi_idr` AS `total_retensi_idr`,`a`.`total_ppn` AS `total_ppn`,`a`.`total_ppn_idr` AS `total_ppn_idr`,`a`.`total_invoice` AS `total_invoice`,`a`.`total_invoice_idr` AS `total_invoice_idr`,`a`.`total_um` AS `total_um`,`a`.`total_um_idr` AS `total_um_idr`,`a`.`total_bayar` AS `total_bayar`,`a`.`total_bayar_idr` AS `total_bayar_idr`,`a`.`total_quotation` AS `total_quotation`,`a`.`project_name` AS `project_name`,`a`.`ket` AS `ket`,`a`.`estimasi` AS `estimasi`,`a`.`rev` AS `rev`,`a`.`created_by` AS `created_by`,`a`.`created_on` AS `created_on`,`a`.`modified_by` AS `modified_by`,`a`.`modified_on` AS `modified_on`,`a`.`cancel_by` AS `cancel_by`,`a`.`cancel_date` AS `cancel_date`,`a`.`no_po` AS `no_po`,`a`.`no_faktur` AS `no_faktur`,`a`.`no_pajak` AS `no_pajak`,`a`.`payment_term` AS `payment_term`,`a`.`proses_print` AS `proses_print`,`a`.`est_date` AS `est_date`,`a`.`approved` AS `approved`,`a`.`approved_by` AS `approved_by`,`a`.`approved_date` AS `approved_date`,`a`.`approved_est` AS `approved_est`,`a`.`approved_est_by` AS `approved_est_by`,`a`.`approved_est_date` AS `approved_est_date`,`a`.`aju_approved` AS `aju_approved`,`a`.`aju_approved_by` AS `aju_approved_by`,`a`.`aju_approved_date` AS `aju_approved_date`,`a`.`aju_approved_est` AS `aju_approved_est`,`a`.`aju_approved_est_by` AS `aju_approved_est_by`,`a`.`aju_approved_est_date` AS `aju_approved_est_date`,`a`.`reason_approved` AS `reason_approved`,`a`.`reason_approved_est` AS `reason_approved_est`,`a`.`so_sts` AS `so_sts`,`a`.`so_by` AS `so_by`,`a`.`so_date` AS `so_date`,`a`.`mat_plan_sts` AS `mat_plan_sts`,`a`.`mat_plan_by` AS `mat_plan_by`,`a`.`mat_plan_date` AS `mat_plan_date`,`a`.`total_um2` AS `total_um2`,`a`.`total_um_idr2` AS `total_um_idr2`,`a`.`kategori` AS `kategori`,`a`.`id_top` AS `id_top`,`a`.`sisa_invoice` AS `sisa_invoice`,`a`.`sisa_invoice_idr` AS `sisa_invoice_idr`,`a`.`total_pph` AS `total_pph`,`a`.`total_pph_idr` AS `total_pph_idr`,`b`.`no_invoice` AS `no_surat` from (`tr_invoice_payment_detail_temp` `a` join `tr_invoice_header` `b` on((`b`.`no_invoice` = `a`.`no_invoice`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

