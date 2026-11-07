
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
CREATE TABLE `accessories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_category` int DEFAULT NULL,
  `id_stock` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `stock_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `trade_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `brand` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `spec` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_unit_gudang` int DEFAULT NULL,
  `konversi` double(9,2) DEFAULT NULL,
  `id_unit` int DEFAULT NULL,
  `min_stok` double(16,4) DEFAULT NULL,
  `max_stok` double(16,4) DEFAULT NULL,
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_jurnal` (
  `category` int DEFAULT NULL,
  `nm_category` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sisa_nilai` double(17,0) DEFAULT NULL,
  `kdcab` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_nilai` (
  `kd_asset` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `category` int DEFAULT NULL,
  `nm_category` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sisa_nilai` double(17,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cek_count_double_daycode` (
  `id_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jumlah_double` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cek_daycode` (
  `nm_project` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ket` enum('good','bad','not yet') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_stock` bigint NOT NULL,
  `sts_daycode` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cek_daycode_delivery` (
  `delivery_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `id_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `daycode` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cek_daycode_double` (
  `id` int NOT NULL,
  `id_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `daycode` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jumlah_double` bigint NOT NULL,
  `ket` enum('good','bad','not yet') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cek_daycode_double_fast` (
  `id` int NOT NULL,
  `id_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `daycode` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jumlah_double` bigint NOT NULL,
  `ket` enum('good','bad','not yet') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cek_delivery` (
  `id` int NOT NULL,
  `no_delivery` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'DY200001',
  `no_so` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `id_so_detail` int DEFAULT NULL,
  `product` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_order` int DEFAULT NULL,
  `qty_delivery` int DEFAULT NULL,
  `qty_kurang` int DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cek_update_product` (
  `id` int NOT NULL,
  `id_produksi` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_produksi` date DEFAULT NULL,
  `created_by` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `ket` enum('good','bad','not yet') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qc_date` datetime DEFAULT NULL,
  `sts_daycode` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_by` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_stock_product` (
  `nm_project` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_stock` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `check_urutan_cycletime` (
  `id_time` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_product` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `urut` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jumlah` bigint NOT NULL,
  `ket_ct` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
  `kredibilitas` enum('A','B','C','D') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
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
CREATE TABLE `customers` (
  `id` int NOT NULL,
  `id_customer` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `telephone` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `address` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_karyawan` int DEFAULT NULL,
  `email` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `telephone_2` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `zip_code` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_kota` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_prov` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `flag_active` enum('aktif','inaktif') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_pic` int NOT NULL,
  `contact` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `phone_pic` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email_pic` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `position_pic` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `religion_pic` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
  `employee_code` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int NOT NULL,
  `name` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nik` int NOT NULL,
  `company_id` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_daycode` (
  `id_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_produksi_h` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_produksi` date DEFAULT NULL,
  `created_by` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `qc_date` datetime DEFAULT NULL,
  `sts_daycode` enum('Y','N') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filter_daycode_delete` (
  `id_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `get_material_wip` (
  `no_plan` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'PR20001',
  `costcenter` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code_material` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double(22,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `get_plan_header` (
  `bulan` int DEFAULT NULL,
  `tahun` int DEFAULT NULL,
  `code_material` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `get_plan_material` (
  `product` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bulan` int DEFAULT NULL,
  `tahun` int DEFAULT NULL,
  `code_material` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double(22,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `get_plan_product` (
  `product` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_order` decimal(32,0) DEFAULT NULL,
  `qty_propose` decimal(32,0) DEFAULT NULL,
  `bulan` int DEFAULT NULL,
  `tahun` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `get_plan_sum` (
  `product` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bulan` int DEFAULT NULL,
  `tahun` int DEFAULT NULL,
  `code_material` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `weight` double(22,5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `get_pro_plan_product` (
  `product` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_order` decimal(32,0) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
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
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_aktifitas`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_master_biaya` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nm_biaya` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `tipe_biaya` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_coa` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_coa` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `input_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `deleted_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_konsultasi_d`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_master_konsultasi_header` (
  `id_konsultasi_h` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_paket` int NOT NULL,
  `nm_paket` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `datet` date DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `input_by` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `update_by` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` enum('active','inactive') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `deleted_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_konsultasi_h`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_master_lab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `isu_lingkungan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `peraturan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `waktu` int NOT NULL DEFAULT '0',
  `harga_ssc` decimal(20,2) NOT NULL DEFAULT '0.00',
  `harga_lab` decimal(20,2) NOT NULL DEFAULT '0.00',
  `no_coa` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_coa` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
CREATE TABLE `kons_master_subcont_perusahaan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nm_biaya` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `tipe_biaya` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_coa` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_coa` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `input_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_master_tenaga_ahli` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nm_biaya` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `tipe_biaya` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_coa` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_coa` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `input_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `persen_payment` decimal(10,2) NOT NULL DEFAULT '0.00',
  `nominal_payment` decimal(10,2) NOT NULL,
  `desc_payment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `tgl_plan_tagih` date DEFAULT NULL,
  `urutan` int DEFAULT NULL,
  `tanggal_actual_plan_tagih` date DEFAULT NULL,
  `tagih_mundur` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `alasan_mundur` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `file_surat_mundur` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `file_laporan_progress` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `macet` int DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_bukti_penggunaan_expense` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header_expense` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_detail_kasbon` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `upload_file` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_expense_detail` (`id_header_expense`,`id_detail_kasbon`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_company` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nm_company` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_cons_report_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `report_isu` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `pic` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `action_plan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `due_date` date DEFAULT NULL,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_cons_report_header` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_penawaran` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_detail` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_mandays` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `due_date_time_from` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `due_date_time_to` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pic` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_detail_penawaran_non_konsultasi` (
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
CREATE TABLE `kons_tr_expense_project_return` (
  `expense_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `status` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'waiting_return',
  `bank_id` int DEFAULT NULL,
  `transfer_date` date DEFAULT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `verified_by` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `rejection_reason` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `journal_reference` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`expense_id`) USING BTREE,
  KEY `return_status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_expense_project_return_history` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `expense_id` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `action` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `actor` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `note` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `bank_id` int DEFAULT NULL,
  `transfer_date` date DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `return_history` (`expense_id`,`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_expense_report_bukti_pengembalian` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header_expense` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `document_link` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_expense_report_project_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header_expense` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_header_kasbon` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_budgeting` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_detail_kasbon` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `qty_expense` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nominal_expense` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_expense_report_project_header` (
  `id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_header` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `total_expense_report` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_kasbon` decimal(20,2) NOT NULL DEFAULT '0.00',
  `selisih` decimal(20,2) NOT NULL DEFAULT '0.00',
  `tipe` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `document_link` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bank` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_account` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_req` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_req_payment` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sts_reject` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject_manage` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `keterangan_kurang_bayar` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `keterangan_laporan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_bank` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_bank` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `rejected_by` int DEFAULT NULL,
  `rejected_date` datetime DEFAULT NULL,
  `flow_version` tinyint unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_custom_akomodasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_budgeting` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_penawaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_penawaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi_qty` int NOT NULL,
  `estimasi_harga` decimal(20,2) NOT NULL,
  `estimasi_total` decimal(20,2) NOT NULL,
  `qty_budget` int NOT NULL,
  `price_budget` decimal(20,2) NOT NULL,
  `total_budget` decimal(20,2) NOT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_custom_lab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_budgeting` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_penawaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_penawaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi_qty` int NOT NULL,
  `estimasi_harga` decimal(20,2) NOT NULL,
  `estimasi_total` decimal(20,2) NOT NULL,
  `qty_budget` int NOT NULL,
  `price_budget` decimal(20,2) NOT NULL,
  `total_budget` decimal(20,2) NOT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_custom_others` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_budgeting` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_penawaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_penawaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi_qty` int NOT NULL,
  `estimasi_harga` decimal(20,2) NOT NULL,
  `estimasi_total` decimal(20,2) NOT NULL,
  `qty_budget` int NOT NULL,
  `price_budget` decimal(20,2) NOT NULL,
  `total_budget` decimal(20,2) NOT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_custom_ovb_subcont` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_budgeting` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_penawaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_penawaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi_qty` int NOT NULL,
  `estimasi_harga` decimal(20,2) NOT NULL,
  `estimasi_total` decimal(20,2) NOT NULL,
  `qty_budget` int NOT NULL,
  `price_budget` decimal(20,2) NOT NULL,
  `total_budget` decimal(20,2) NOT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_custom_subcont_perusahaan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_budgeting` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_penawaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_penawaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi_qty` int NOT NULL,
  `estimasi_harga` decimal(20,2) NOT NULL,
  `estimasi_total` decimal(20,2) NOT NULL,
  `qty_budget` int NOT NULL,
  `price_budget` decimal(20,2) NOT NULL,
  `total_budget` decimal(20,2) NOT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_custom_subcont_tenaga_ahli` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_budgeting` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_penawaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_penawaran` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `estimasi_qty` int NOT NULL,
  `estimasi_harga` decimal(20,2) NOT NULL,
  `estimasi_total` decimal(20,2) NOT NULL,
  `qty_budget` int NOT NULL,
  `price_budget` decimal(20,2) NOT NULL,
  `total_budget` decimal(20,2) NOT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_project_akomodasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_budgeting` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_akomodasi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_pengajuan` decimal(20,2) DEFAULT NULL,
  `nominal_pengajuan` decimal(20,2) DEFAULT NULL,
  `total_pengajuan` decimal(20,2) DEFAULT NULL,
  `qty_estimasi` decimal(20,2) DEFAULT NULL,
  `price_unit_estimasi` decimal(20,2) DEFAULT NULL,
  `total_budget_estimasi` decimal(20,2) DEFAULT NULL,
  `aktual_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_budget_tambahan` int DEFAULT NULL,
  `budget_tambahan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sisa_budget` decimal(20,2) NOT NULL,
  `qty_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nominal_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nominal_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `document_link` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bank` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_account` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `custom_akomodasi` int NOT NULL DEFAULT '0',
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_project_bukti_penggunaan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header_kasbon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `upload_file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_id_header_kasbon` (`id_header_kasbon`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_project_header` (
  `id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_budgeting` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deskripsi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `tgl` date DEFAULT NULL,
  `grand_total` decimal(20,2) DEFAULT NULL,
  `sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_req` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dokument_link` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bank` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_account` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_req_payment` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sts_reject` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_reject_manage` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `metode_pembayaran` enum('1','2','3') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1',
  `created_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `rejected_by` int DEFAULT NULL,
  `rejected_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_project_lab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_budgeting` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_lab` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_pengajuan` decimal(20,2) DEFAULT NULL,
  `nominal_pengajuan` decimal(20,2) DEFAULT NULL,
  `total_pengajuan` decimal(20,2) DEFAULT NULL,
  `qty_estimasi` decimal(20,2) DEFAULT NULL,
  `price_unit_estimasi` decimal(20,2) DEFAULT NULL,
  `total_budget_estimasi` decimal(20,2) DEFAULT NULL,
  `aktual_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sisa_budget` decimal(20,2) NOT NULL,
  `qty_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nominal_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nominal_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `document_link` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bank` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_account` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `custom_lab` int NOT NULL DEFAULT '0',
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_project_others` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_budgeting` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_others` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_pengajuan` decimal(20,2) DEFAULT NULL,
  `nominal_pengajuan` decimal(20,2) DEFAULT NULL,
  `total_pengajuan` decimal(20,2) DEFAULT NULL,
  `qty_estimasi` decimal(20,2) DEFAULT NULL,
  `price_unit_estimasi` decimal(20,2) DEFAULT NULL,
  `total_budget_estimasi` decimal(20,2) DEFAULT NULL,
  `aktual_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sisa_budget` decimal(20,2) NOT NULL,
  `qty_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nominal_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nominal_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `document_link` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bank` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_account` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `custom_others` int NOT NULL DEFAULT '0',
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_project_subcont` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_budgeting` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_aktifitas` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_aktifitas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_pengajuan` decimal(20,2) DEFAULT NULL,
  `nominal_pengajuan` decimal(20,2) DEFAULT NULL,
  `total_pengajuan` decimal(20,2) DEFAULT NULL,
  `qty_estimasi` decimal(20,2) DEFAULT NULL,
  `price_unit_estimasi` decimal(20,2) DEFAULT NULL,
  `total_budget_estimasi` decimal(20,2) DEFAULT NULL,
  `document_link` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bank` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_account` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `aktual_terpakai` decimal(20,2) DEFAULT '0.00',
  `sisa_budget` decimal(20,2) DEFAULT '0.00',
  `qty_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `custom_subcont` int(1) unsigned zerofill NOT NULL,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `nominal_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nominal_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_project_subcont_perusahaan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_budgeting` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_subcont` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_pengajuan` decimal(20,2) DEFAULT NULL,
  `nominal_pengajuan` decimal(20,2) DEFAULT NULL,
  `total_pengajuan` decimal(20,2) DEFAULT NULL,
  `qty_estimasi` decimal(20,2) DEFAULT NULL,
  `price_unit_estimasi` decimal(20,2) DEFAULT NULL,
  `total_budget_estimasi` decimal(20,2) DEFAULT NULL,
  `aktual_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sisa_budget` decimal(20,2) NOT NULL,
  `qty_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nominal_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nominal_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `document_link` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bank` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_account` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `custom_subcont_perusahaan` int NOT NULL DEFAULT '0',
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL COMMENT 'qty_terpakai\r\nnominal_terpakai\r\ntotal_terpakai\r\nqty_overbudget\r\nnominal_overbudget\r\ntotal_overbudget\r\n',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_project_subcont_tenaga_ahli` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_header` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_budgeting` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_subcont` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_pengajuan` decimal(20,2) DEFAULT NULL,
  `nominal_pengajuan` decimal(20,2) DEFAULT NULL,
  `total_pengajuan` decimal(20,2) DEFAULT NULL,
  `qty_estimasi` decimal(20,2) DEFAULT NULL,
  `price_unit_estimasi` decimal(20,2) DEFAULT NULL,
  `total_budget_estimasi` decimal(20,2) DEFAULT NULL,
  `aktual_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sisa_budget` decimal(20,2) NOT NULL,
  `qty_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nominal_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_terpakai` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nominal_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_overbudget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `document_link` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bank` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_number` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bank_account` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `custom_subcont_tenaga_ahli` int NOT NULL DEFAULT '0',
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL COMMENT 'qty_terpakai\r\nnominal_terpakai\r\ntotal_terpakai\r\nqty_overbudget\r\nnominal_overbudget\r\ntotal_overbudget\r\n',
  `deleted_at` datetime DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_req_ovb_akomodasi_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_request_ovb` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_detail` int DEFAULT NULL,
  `id_aktifitas` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_aktifitas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_item` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_budget_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_budget_tambahan` int DEFAULT NULL,
  `budget_tambahan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pengajuan_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_req_ovb_akomodasi_header` (
  `id_request_ovb` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_budgeting` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_request_ovb`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_req_ovb_lab_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_request_ovb` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_detail` int DEFAULT NULL,
  `id_item` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_budget_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_budget_tambahan` int DEFAULT NULL,
  `budget_tambahan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pengajuan_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_req_ovb_lab_header` (
  `id_request_ovb` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_budgeting` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_request_ovb`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_req_ovb_others_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_request_ovb` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_detail` int DEFAULT NULL,
  `id_aktifitas` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_aktifitas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_item` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_budget_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_budget_tambahan` int DEFAULT NULL,
  `budget_tambahan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pengajuan_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_req_ovb_others_header` (
  `id_request_ovb` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_budgeting` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_request_ovb`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_req_ovb_subcont_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_request_ovb` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_detail` int DEFAULT NULL,
  `id_aktifitas` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_aktifitas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_budget_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_budget_tambahan` int DEFAULT NULL,
  `budget_tambahan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pengajuan_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_req_ovb_subcont_header` (
  `id_request_ovb` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_budgeting` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_request_ovb`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_req_ovb_subcont_perusahaan_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_request_ovb` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_detail` int DEFAULT NULL,
  `id_item` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_budget_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_budget_tambahan` int DEFAULT NULL,
  `budget_tambahan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pengajuan_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_req_ovb_subcont_perusahaan_header` (
  `id_request_ovb` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_budgeting` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_request_ovb`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_req_ovb_subcont_tenaga_ahli_detail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_request_ovb` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_detail` int DEFAULT NULL,
  `id_item` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_budget_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_budget_tambahan` int DEFAULT NULL,
  `budget_tambahan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `pengajuan_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_kasbon_req_ovb_subcont_tenaga_ahli_header` (
  `id_request_ovb` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_budgeting` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_request_ovb`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran` (
  `id_quotation` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tipe_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
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
  `id_divisi` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_divisi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `upload_proposal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `upload_tahapan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `upload_po` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `grand_total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sts_cust` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_quot` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ppn` int DEFAULT NULL,
  `persen_disc` decimal(20,2) DEFAULT NULL,
  `nilai_disc` decimal(20,2) DEFAULT NULL,
  `tipe_informasi_awal` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `detail_informasi_awal` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_mandays` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_subcont` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_tandem` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_internal` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_rate` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sts_reject` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `sts_deal` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `revisi` int NOT NULL DEFAULT '0',
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `input_date` datetime NOT NULL,
  `updated_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `company` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_company` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_quotation`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran_akomodasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
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
CREATE TABLE `kons_tr_penawaran_akomodasi_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_history` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_akomodasi` int DEFAULT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
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
  `bobot` decimal(20,2) DEFAULT '0.00',
  `mandays` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_rate` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_subcont` decimal(20,2) NOT NULL,
  `mandays_rate_subcont` decimal(20,2) NOT NULL,
  `mandays_tandem` decimal(20,2) NOT NULL,
  `mandays_rate_tandem` decimal(20,2) NOT NULL,
  `harga_aktifitas` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_aktifitas` decimal(20,2) DEFAULT NULL,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `deleted_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran_aktifitas_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_history` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran_aktifitas` int DEFAULT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_aktifitas` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_aktifitas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bobot` decimal(20,2) DEFAULT '0.00',
  `mandays` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_rate` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_subcont` decimal(20,2) NOT NULL,
  `mandays_rate_subcont` decimal(20,2) NOT NULL,
  `mandays_tandem` decimal(20,2) NOT NULL,
  `mandays_rate_tandem` decimal(20,2) NOT NULL,
  `harga_aktifitas` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_aktifitas` decimal(20,2) DEFAULT NULL,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran_history` (
  `id_history` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_quotation` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
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
  `id_divisi` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_divisi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `upload_proposal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `upload_tahapan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `upload_po` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `grand_total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sts_cust` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts_quot` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ppn` int DEFAULT NULL,
  `persen_disc` decimal(20,2) DEFAULT NULL,
  `nilai_disc` decimal(20,2) DEFAULT NULL,
  `tipe_informasi_awal` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `detail_informasi_awal` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `total_mandays` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_subcont` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_tandem` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_internal` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_rate` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sts_reject` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `sts_deal` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `revisi` int NOT NULL DEFAULT '0',
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `input_date` datetime NOT NULL,
  `updated_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `company` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_company` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_history`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran_lab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran_lab_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_history` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_lab_penawaran` int DEFAULT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran_non_konsultasi` (
  `id_penawaran` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tgl_quotation` date NOT NULL,
  `id_customer` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_customer` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_pic_penawaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_divisi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nm_divisi` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_company` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nm_company` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `pic_penawaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipe_informasi_awal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `detail_informasi_awal` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `keterangan_penawaran` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `subtotal` decimal(20,2) NOT NULL DEFAULT '0.00',
  `ppn` decimal(20,2) NOT NULL DEFAULT '0.00',
  `grand_total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `dokumen_pendukung` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `sts_quot` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sts_deal` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `input_date` datetime NOT NULL,
  `updated_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `approved_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `biaya_kirim` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nominal_disc` decimal(20,2) NOT NULL DEFAULT '0.00',
  `persen_disc` decimal(20,2) NOT NULL,
  `persen_ppn` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sts_close` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_penawaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran_others` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran_others_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_history` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_others_penawaran` int DEFAULT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran_subcont_perusahaan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran_subcont_perusahaan_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_history` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_lab_penawaran` int DEFAULT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran_subcont_tenaga_ahli` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_penawaran_subcont_tenaga_ahli_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_history` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_lab_penawaran` int DEFAULT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_budget` decimal(20,2) NOT NULL DEFAULT '0.00',
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
CREATE TABLE `kons_tr_req_kasbon_project` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_budgeting` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_kasbon` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `sts` int NOT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_by` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created_date` datetime NOT NULL,
  `approved_by` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `approved_date` datetime DEFAULT NULL,
  `rejected_by` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `rejected_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_spk_aktifitas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_aktifitas` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_aktifitas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bobot` decimal(20,2) DEFAULT '0.00',
  `mandays` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_rate` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_tandem` decimal(20,2) NOT NULL,
  `mandays_rate_tandem` decimal(20,2) NOT NULL,
  `harga_aktifitas` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_aktifitas` decimal(20,2) DEFAULT NULL,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_spk_aktifitas_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_history` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_penawaran` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_spk_penawaran` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_aktifitas` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_aktifitas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bobot` decimal(5,2) DEFAULT NULL,
  `mandays` decimal(10,2) DEFAULT '0.00',
  `mandays_rate` decimal(20,2) DEFAULT '0.00',
  `mandays_tandem` decimal(10,2) DEFAULT '0.00',
  `mandays_rate_tandem` decimal(20,2) DEFAULT '0.00',
  `harga_aktifitas` decimal(20,2) DEFAULT '0.00',
  `total_aktifitas` decimal(20,2) DEFAULT '0.00',
  `input_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_history` (`id_history`) USING BTREE,
  KEY `id_spk_penawaran` (`id_spk_penawaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_spk_budgeting` (
  `id_spk_budgeting` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_customer` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `no_npwp` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_pic` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_pic` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jabatan_pic` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kontak_pic` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_project` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_project` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_project_leader` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_project_leader` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_konsultan_1` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_konsultan_1` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_konsultan_2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_konsultan_2` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `total_mandays` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_internal` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_tandem` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_subcont` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_konsultasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_tandem` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_subcont` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_akomodasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_others` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_lab` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_subcont_tenaga_ahli` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_subcont_perusahaan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nilai_kontrak_bersih` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_rate` decimal(20,2) NOT NULL DEFAULT '0.00',
  `ppn` int DEFAULT NULL,
  `persen_ppn` decimal(20,2) DEFAULT NULL,
  `nilai_ppn` decimal(20,2) NOT NULL,
  `grand_total` decimal(20,2) DEFAULT NULL,
  `mandays_subcont_before` int DEFAULT NULL,
  `biaya_subcont_before` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_akomodasi_before` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_others_before` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_lab_before` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_subcont_tenaga_ahli_before` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_subcont_perusahaan_before` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_subcont_after` int NOT NULL DEFAULT '0',
  `biaya_subcont_after` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_akomodasi_after` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_others_after` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_lab_after` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_subcont_tenaga_ahli_after` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_subcont_perusahaan_after` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_subcont_result` int NOT NULL DEFAULT '0',
  `biaya_subcont_result` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_akomodasi_result` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_others_result` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_lab_result` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_subcont_tenaga_ahli_result` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_subcont_perusahaan_result` decimal(20,2) NOT NULL DEFAULT '0.00',
  `sts` int NOT NULL DEFAULT '0',
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `create_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `delete_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delete_date` datetime DEFAULT NULL,
  `approved_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_spk_budgeting`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_spk_budgeting_akomodasi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_budgeting` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_akomodasi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `qty_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_final` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_final` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_final` decimal(20,2) NOT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `create_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_spk_budgeting_aktifitas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_budgeting` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_aktifitas` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_aktifitas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `mandays_estimasi` decimal(20,2) DEFAULT '0.00',
  `mandays_rate_estimasi` decimal(20,2) DEFAULT '0.00',
  `mandays_tandem_estimasi` decimal(20,2) DEFAULT '0.00',
  `mandays_rate_tandem_estimasi` decimal(20,2) DEFAULT '0.00',
  `mandays_subcont_estimasi` decimal(20,2) DEFAULT '0.00',
  `mandays_rate_subcont_estimasi` decimal(20,2) DEFAULT '0.00',
  `total_aktifitas_estimasi` decimal(20,2) DEFAULT '0.00',
  `mandays_final` decimal(20,2) DEFAULT '0.00',
  `mandays_rate_final` decimal(20,2) DEFAULT '0.00',
  `mandays_tandem_final` decimal(20,2) DEFAULT '0.00',
  `mandays_rate_tandem_final` decimal(20,2) DEFAULT '0.00',
  `mandays_subcont_final` decimal(20,2) DEFAULT '0.00',
  `mandays_rate_subcont_final` decimal(20,2) DEFAULT '0.00',
  `total_aktifitas_final` decimal(20,2) DEFAULT '0.00',
  `create_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_spk_budgeting_lab` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_budgeting` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_lab` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `qty_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_final` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_final` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_final` decimal(20,2) NOT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `create_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_spk_budgeting_others` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_budgeting` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_others` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `qty_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_final` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_final` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_final` decimal(20,2) NOT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `create_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_spk_budgeting_subcont_perusahaan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_budgeting` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_subcont` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `qty_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_final` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_final` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_final` decimal(20,2) NOT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `create_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_spk_budgeting_subcont_tenaga_ahli` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_spk_budgeting` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_subcont` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_item` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_item` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `qty_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_estimasi` decimal(20,2) NOT NULL DEFAULT '0.00',
  `qty_final` decimal(20,2) NOT NULL DEFAULT '0.00',
  `price_unit_final` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_final` decimal(20,2) NOT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `create_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_spk_penawaran` (
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_customer` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_customer` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `npwp_cust` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nm_pic` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `tipe_informasi_awal` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `detail_informasi_awal` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe_info_awal_eks` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `detail_info_awal_eks` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `cp_info_awal_eks` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu_from` date DEFAULT NULL,
  `waktu_to` date DEFAULT NULL,
  `id_sales` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_sales` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `upload_proposal` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_project` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_project` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_divisi` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_divisi` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_project_leader` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_project_leader` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_konsultan_1` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_konsultan_1` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `id_konsultan_2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_konsultan_2` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `nilai_kontrak` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_subcont` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_akomodasi` decimal(20,2) NOT NULL,
  `biaya_others` decimal(20,2) NOT NULL,
  `biaya_tandem` decimal(20,2) NOT NULL,
  `biaya_lab` decimal(20,2) NOT NULL DEFAULT '0.00',
  `biaya_subcont_tenaga_ahli` decimal(20,2) NOT NULL,
  `biaya_subcont_perusahaan` decimal(20,2) NOT NULL DEFAULT '0.00',
  `nilai_kontrak_bersih` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_rate` decimal(20,2) NOT NULL DEFAULT '0.00',
  `total_mandays` int NOT NULL DEFAULT '0',
  `mandays_subcont` int NOT NULL DEFAULT '0',
  `mandays_internal` int NOT NULL DEFAULT '0',
  `nm_pemberi_informasi_1_komisi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `persen_pemberi_informasi_1_komisi` decimal(20,2) NOT NULL,
  `nominal_pemberi_informasi_1_komisi` decimal(20,2) NOT NULL,
  `nm_pemberi_informasi_2_komisi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `persen_pemberi_informasi_2_komisi` decimal(20,2) NOT NULL,
  `nominal_pemberi_informasi_2_komisi` decimal(20,2) NOT NULL,
  `nm_sales_1_komisi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `persen_sales_1_komisi` decimal(20,2) NOT NULL,
  `nominal_sales_1_komisi` decimal(20,2) NOT NULL,
  `nm_sales_2_komisi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `persen_sales_2_komisi` decimal(20,2) NOT NULL,
  `nominal_sales_2_komisi` decimal(20,2) NOT NULL,
  `isu_khusus` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sts_spk` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `approval_sales_sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approval_sales_date` datetime DEFAULT NULL,
  `approval_project_leader_sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approval_project_leader_date` datetime DEFAULT NULL,
  `approval_konsultan_1_sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approval_konsultan_1_date` datetime DEFAULT NULL,
  `approval_konsultan_2_sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approval_konsultan_2_date` datetime DEFAULT NULL,
  `reject_project_leader_sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_project_leader_date` datetime DEFAULT NULL,
  `reject_project_leader_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `reject_konsultan_1_sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_konsultan_1_date` datetime DEFAULT NULL,
  `reject_konsultan_1_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `reject_konsultan_2_sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_konsultan_2_date` datetime DEFAULT NULL,
  `reject_konsultan_2_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `reject_sales_sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_sales_date` datetime DEFAULT NULL,
  `reject_sales_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `approval_level2_sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approval_level2_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approval_level2_date` datetime DEFAULT NULL,
  `reject_level2_by` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_level2_date` datetime DEFAULT NULL,
  `reject_level2_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `approval_manager_sales` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approval_manager_sales_date` datetime DEFAULT NULL,
  `reject_manager_sales_sts` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reject_manager_sales_date` datetime DEFAULT NULL,
  `reject_manager_sales_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `input_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `edited_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `edited_date` datetime DEFAULT NULL,
  `deleted_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  `id_company` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_company` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `sendigs_hold` enum('0','1') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '0',
  PRIMARY KEY (`id_spk_penawaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_spk_penawaran_history` (
  `id_history` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_spk_penawaran` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_penawaran` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_customer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_customer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `npwp_cust` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_pic` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipe_informasi_awal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `detail_informasi_awal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `waktu_from` date DEFAULT NULL,
  `waktu_to` date DEFAULT NULL,
  `id_sales` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_sales` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `upload_proposal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_project` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_project` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_divisi` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_divisi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_project_leader` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_project_leader` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_konsultan_1` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_konsultan_1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_konsultan_2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_konsultan_2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nilai_kontrak` decimal(20,2) DEFAULT '0.00',
  `biaya_subcont` decimal(20,2) DEFAULT '0.00',
  `biaya_akomodasi` decimal(20,2) DEFAULT '0.00',
  `biaya_others` decimal(20,2) DEFAULT '0.00',
  `biaya_tandem` decimal(20,2) DEFAULT '0.00',
  `biaya_lab` decimal(20,2) DEFAULT '0.00',
  `biaya_subcont_tenaga_ahli` decimal(20,2) DEFAULT '0.00',
  `biaya_subcont_perusahaan` decimal(20,2) DEFAULT '0.00',
  `nilai_kontrak_bersih` decimal(20,2) DEFAULT '0.00',
  `mandays_rate` decimal(20,2) DEFAULT '0.00',
  `total_mandays` decimal(20,2) DEFAULT '0.00',
  `mandays_subcont` decimal(20,2) DEFAULT '0.00',
  `mandays_internal` decimal(20,2) DEFAULT '0.00',
  `nm_pemberi_informasi_1_komisi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `persen_pemberi_informasi_1_komisi` decimal(5,2) DEFAULT '0.00',
  `nominal_pemberi_informasi_1_komisi` decimal(20,2) DEFAULT '0.00',
  `nm_pemberi_informasi_2_komisi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `persen_pemberi_informasi_2_komisi` decimal(5,2) DEFAULT '0.00',
  `nominal_pemberi_informasi_2_komisi` decimal(20,2) DEFAULT '0.00',
  `nm_sales_1_komisi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `persen_sales_1_komisi` decimal(5,2) DEFAULT '0.00',
  `nominal_sales_1_komisi` decimal(20,2) DEFAULT '0.00',
  `nm_sales_2_komisi` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `persen_sales_2_komisi` decimal(5,2) DEFAULT '0.00',
  `nominal_sales_2_komisi` decimal(20,2) DEFAULT '0.00',
  `isu_khusus` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `tipe_info_awal_eks` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `detail_info_awal_eks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `cp_info_awal_eks` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sts_spk` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `approval_sales_sts` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `approval_sales_date` datetime DEFAULT NULL,
  `approval_konsultan_1_sts` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `approval_konsultan_1_date` datetime DEFAULT NULL,
  `approval_konsultan_2_sts` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `approval_konsultan_2_date` datetime DEFAULT NULL,
  `approval_level2_sts` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `approval_level2_date` datetime DEFAULT NULL,
  `approval_manager_sales` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `approval_manager_sales_date` datetime DEFAULT NULL,
  `approval_project_leader_sts` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `approval_project_leader_date` datetime DEFAULT NULL,
  `reject_sales_sts` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `reject_konsultan_1_sts` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `reject_konsultan_2_sts` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `reject_project_leader_sts` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `reject_manager_sales_sts` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `reject_level2_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `revisi` int DEFAULT '0',
  `input_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  `deleted_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id_history`) USING BTREE,
  KEY `id_spk_penawaran` (`id_spk_penawaran`) USING BTREE,
  KEY `id_penawaran` (`id_penawaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_spk_penawaran_payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `term_payment` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `persen_payment` decimal(20,2) DEFAULT NULL,
  `nominal_payment` decimal(20,2) DEFAULT NULL,
  `desc_payment` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `dibuat_oleh` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dibuat_tgl` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_spk_penawaran_payment_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_history` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_spk_penawaran` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `term_payment` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `persen_payment` decimal(5,2) DEFAULT '0.00',
  `nominal_payment` decimal(20,2) DEFAULT '0.00',
  `desc_payment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `dibuat_oleh` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dibuat_tgl` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_history` (`id_history`) USING BTREE,
  KEY `id_spk_penawaran` (`id_spk_penawaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_spk_penawaran_subcont` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_spk_penawaran` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_aktifitas` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_aktifitas` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mandays` decimal(20,2) DEFAULT NULL,
  `mandays_rate` decimal(20,2) NOT NULL,
  `mandays_tandem` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_rate_tandem` decimal(20,2) NOT NULL DEFAULT '0.00',
  `mandays_subcont` decimal(20,2) DEFAULT NULL,
  `price_subcont` decimal(20,2) DEFAULT NULL,
  `total_subcont` decimal(20,2) DEFAULT NULL,
  `grand_total` decimal(20,2) DEFAULT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `dibuat_oleh` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dibuat_tgl` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_tr_spk_penawaran_subcont_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_history` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_spk_penawaran` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `nm_aktifitas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `mandays_subcont` decimal(10,2) DEFAULT '0.00',
  `price_subcont` decimal(20,2) DEFAULT '0.00',
  `total_subcont` decimal(20,2) DEFAULT '0.00',
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `dibuat_oleh` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `dibuat_tgl` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_history` (`id_history`) USING BTREE,
  KEY `id_spk_penawaran` (`id_spk_penawaran`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kota` (
  `id_kota` int NOT NULL AUTO_INCREMENT,
  `id_prov` int DEFAULT NULL,
  `nama_kota` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id_kota`) USING BTREE,
  KEY `id_prov` (`id_prov`) USING BTREE,
  CONSTRAINT `kota_ibfk_1` FOREIGN KEY (`id_prov`) REFERENCES `provinsi_backup` (`id_prov`) ON DELETE RESTRICT ON UPDATE RESTRICT
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
CREATE TABLE `list_ct_full` (
  `id_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_project` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_process` int DEFAULT NULL,
  `nm_process` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cycletime` double(19,2) DEFAULT NULL,
  `qty_mp` decimal(32,0) DEFAULT NULL,
  `man_hours` double(19,2) DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_ct_full_excel` (
  `id_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_bom` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_process` int DEFAULT NULL,
  `nm_process` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cycletime` double(25,2) DEFAULT NULL,
  `qty_mp` int DEFAULT NULL,
  `man_hours` double(22,2) DEFAULT NULL,
  `note` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `machine` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mould` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_cycletime` (
  `id_time` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_costcenter` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cycletime` double(19,2) DEFAULT NULL,
  `mp` int DEFAULT NULL,
  `urut` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_cycletime_product` (
  `id_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_costcenter` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_date_delivery` (
  `no_so` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_cust` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `product` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_order` decimal(32,0) DEFAULT NULL,
  `qty_delivery` decimal(32,0) DEFAULT NULL,
  `qty_sisa` decimal(33,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_date_planning` (
  `bulan` int DEFAULT NULL,
  `tahun` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_master_product` (
  `id_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_project` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nama_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `list_quality_control` (
  `id_produksi` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tanggal_produksi` date DEFAULT NULL,
  `id_costcenter` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_product` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `code` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ket` enum('good','bad','not yet') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nik` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_id` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `division_id` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `department_id` varchar(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
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
  `rekening` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `rekening_UNIQUE` (`rekening`) USING BTREE
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_department` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` enum('1','0') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT '1',
  `created_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `updated_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  `deleted_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
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
CREATE TABLE `ms_petty_cash` (
  `id` smallint NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pengelola` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `budget` decimal(10,0) DEFAULT '0',
  `approval` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `coa` varchar(3500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `created_on` date DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
CREATE TABLE `parameter` (
  `ppn` float DEFAULT NULL,
  `pph` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_approve` (
  `id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
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
  `nilai_bayar` decimal(20,2) NOT NULL DEFAULT '0.00',
  `tanggal_pembayaran` date DEFAULT NULL,
  `id_bank_pembayaran` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_bank_pembayaran` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bukti_transfer` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `upload_document` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
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
  `country_code` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'IDN'
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
  PRIMARY KEY (`id`) USING BTREE
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
  `propose_request` int NOT NULL DEFAULT '0',
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
  `reject_reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `exp_pib` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `exp_inv_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe_penggantian` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe_pengembalian` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `expense_id_kembalian` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_po` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `id_supplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_supplier` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `debet_usd` double DEFAULT '0',
  `kredit_usd` double DEFAULT '0',
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
  `keperluan` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `doc_file` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int DEFAULT '0',
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `coa` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `doc_file_2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_payment_paid` (
  `id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bank_charge` decimal(20,2) NOT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
CREATE TABLE `tr_pengajuan_rutin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `departement` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_doc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal_doc` date DEFAULT NULL,
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_pengajuan_rutin_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_budget` bigint NOT NULL,
  `no_doc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
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
  PRIMARY KEY (`id`) USING BTREE
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
  `km_awal` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `km_akhir` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bensin` decimal(20,0) DEFAULT NULL,
  `tol` decimal(20,0) DEFAULT NULL,
  `parkir` decimal(20,0) DEFAULT NULL,
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
  `metode_pembelian` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `close_pr` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `close_pr_desc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
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
  `ga_secret` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
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
CREATE TABLE `visit_report_action_plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_id` int NOT NULL COMMENT 'FK to visit_report_activities.id',
  `report_id` int NOT NULL COMMENT 'FK to visit_report_headers.id (for easy querying)',
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Action plan description',
  `pic` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Person in charge',
  `due_date` date DEFAULT NULL COMMENT 'Due date',
  `status` enum('progress','done') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'progress' COMMENT 'Action plan status',
  `created_at` datetime NOT NULL COMMENT 'Record creation timestamp',
  `updated_at` datetime DEFAULT NULL COMMENT 'Last status update',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_activity_id` (`activity_id`) USING BTREE,
  KEY `idx_report_id` (`report_id`) USING BTREE,
  CONSTRAINT `fk_action_plans_activity` FOREIGN KEY (`activity_id`) REFERENCES `visit_report_activities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_action_plans_report` FOREIGN KEY (`report_id`) REFERENCES `visit_report_headers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Action plans for visit report activities';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit_report_activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `report_id` int NOT NULL COMMENT 'FK to visit_report_headers.id',
  `activity_source` enum('spk','custom') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Whether from SPK list or custom',
  `spk_activity_id` int DEFAULT NULL COMMENT 'Soft reference to kons_tr_spk_aktifitas.id',
  `activity_name` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Activity name (from SPK or custom text)',
  `sort_order` int NOT NULL DEFAULT '0' COMMENT 'Display order',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_report_id` (`report_id`) USING BTREE,
  CONSTRAINT `fk_activities_report` FOREIGN KEY (`report_id`) REFERENCES `visit_report_headers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Visit report activities';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit_report_headers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `report_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Generated ID format: VR{YYMM}{seq}',
  `id_spk_penawaran` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Soft FK to kons_tr_spk_penawaran',
  `company_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Denormalized company name',
  `project_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Denormalized project name',
  `visit_date` date NOT NULL COMMENT 'Date of visit',
  `start_time` time DEFAULT NULL COMMENT 'Visit start time',
  `finish_time` time DEFAULT NULL COMMENT 'Visit finish time',
  `consultant_id` int NOT NULL COMMENT 'User ID of consultant',
  `consultant_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Denormalized consultant name',
  `status` enum('draft','final') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'draft' COMMENT 'Report status',
  `created_at` datetime NOT NULL COMMENT 'Record creation timestamp',
  `updated_at` datetime DEFAULT NULL COMMENT 'Last update timestamp',
  `created_by` int NOT NULL COMMENT 'User who created',
  `updated_by` int DEFAULT NULL COMMENT 'User who last updated',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_report_id` (`report_id`) USING BTREE,
  KEY `idx_id_spk_penawaran` (`id_spk_penawaran`) USING BTREE,
  KEY `idx_consultant_id` (`consultant_id`) USING BTREE,
  KEY `idx_status` (`status`) USING BTREE,
  KEY `idx_visit_date` (`visit_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Visit report header records';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visit_report_improvements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `report_id` int NOT NULL COMMENT 'FK to visit_report_headers.id',
  `sort_order` int NOT NULL COMMENT 'Sequence number',
  `potensi_improvement` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Potential improvement description',
  `hasil_improvement` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Improvement result',
  `status` enum('progress','done') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'progress' COMMENT 'Improvement status',
  `created_at` datetime NOT NULL COMMENT 'Record creation timestamp',
  `updated_at` datetime DEFAULT NULL COMMENT 'Last status update',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_report_id` (`report_id`) USING BTREE,
  CONSTRAINT `fk_improvements_report` FOREIGN KEY (`report_id`) REFERENCES `visit_report_headers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Potential improvements from visit reports';
/*!40101 SET character_set_client = @saved_cs_client */;
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
  `id_dept` int DEFAULT NULL,
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

