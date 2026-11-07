
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
CREATE TABLE `coa` (
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
  `mata_uang` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `nomor` (`no_perkiraan`,`kdcab`,`bln`,`thn`,`level`) USING BTREE,
  UNIQUE KEY `NO` (`kdcab`,`no_perkiraan`,`bln`,`thn`,`level`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
CREATE TABLE `coa_copy2` (
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
  `mata_uang` varchar(6) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
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
CREATE TABLE `coa_master_copy2` (
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
CREATE TABLE `coa_tipe` (
  `COA` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tipe` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `faktor` smallint NOT NULL DEFAULT '0',
  PRIMARY KEY (`COA`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
CREATE TABLE `jurnal` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tipe` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `nomor` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `tanggal` date DEFAULT NULL,
  `no_perkiraan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `keterangan` varchar(350) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_trans` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `no_reff` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `debet` bigint DEFAULT NULL,
  `kredit` bigint DEFAULT NULL,
  `nocust` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `valid` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu_valid` datetime DEFAULT NULL,
  `stspos` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
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
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `piutang_usaha` AS SELECT 
 1 AS `id`,
 1 AS `tipe`,
 1 AS `nomor`,
 1 AS `tanggal`,
 1 AS `no_perkiraan`,
 1 AS `keterangan`,
 1 AS `jenis_trans`,
 1 AS `no_reff`,
 1 AS `debet`,
 1 AS `kredit`,
 1 AS `nocust`,
 1 AS `valid`,
 1 AS `waktu_valid`,
 1 AS `stspos`*/;
SET character_set_client = @saved_cs_client;
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
/*!50001 DROP VIEW IF EXISTS `piutang_usaha`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `piutang_usaha` AS select `jurnal`.`id` AS `id`,`jurnal`.`tipe` AS `tipe`,`jurnal`.`nomor` AS `nomor`,`jurnal`.`tanggal` AS `tanggal`,`jurnal`.`no_perkiraan` AS `no_perkiraan`,`jurnal`.`keterangan` AS `keterangan`,`jurnal`.`jenis_trans` AS `jenis_trans`,`jurnal`.`no_reff` AS `no_reff`,`jurnal`.`debet` AS `debet`,`jurnal`.`kredit` AS `kredit`,`jurnal`.`nocust` AS `nocust`,`jurnal`.`valid` AS `valid`,`jurnal`.`waktu_valid` AS `waktu_valid`,`jurnal`.`stspos` AS `stspos` from `jurnal` where ((`jurnal`.`no_perkiraan` = '1103-01-01') and (`jurnal`.`debet` <> '0') and (`jurnal`.`kredit` = '0')) */;
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

