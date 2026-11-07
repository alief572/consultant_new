
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
CREATE TABLE `_xdivision_head` (
  `id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `periode` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` enum('active','nonactive') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'active',
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_xtes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userid` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tanggal` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absensi_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `foto` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu` datetime DEFAULT NULL,
  `latitude` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `longitude` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jam_standar` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `flag_cuti` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lokasi` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absensi_log_backup_220421` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `foto` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu` datetime DEFAULT NULL,
  `latitude` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `longitude` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jam_standar` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `flag_cuti` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `absensi_log_copy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `foto` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu` datetime DEFAULT NULL,
  `latitude` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `longitude` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tipe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jam_standar` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `flag_cuti` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
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
CREATE TABLE `api_log` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `info` varchar(3000) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `waktu` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assign_user_company` (
  `user_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `branch_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `default` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `active` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `deleted` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`company_id`,`branch_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `at_breakshifts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `shiftid` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `days` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `limit_hour` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `limit_hour2` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `break` int NOT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `at_cutoffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_monthly` int NOT NULL,
  `end_monthly` int NOT NULL,
  `start_daily1` int NOT NULL,
  `end_daily1` int NOT NULL,
  `start_daily2` int NOT NULL,
  `end_daily2` int NOT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `at_holidays` (
  `id` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descr` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `at_leaves` (
  `id` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descr` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `based` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `values` int NOT NULL,
  `reduceleave` int NOT NULL DEFAULT '0',
  `present` int NOT NULL DEFAULT '0',
  `jumpday` int NOT NULL DEFAULT '0',
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `at_mass_leaves` (
  `id` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `year` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `value_day` int DEFAULT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descr` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `status` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `at_shift_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `at_shift_id` int NOT NULL,
  `shiftday` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `shiftworkname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `shiftworktype` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `shiftin` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `shiftout` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `latetolerance` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `shiftearlyin` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `shiftmaxout` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `shiftfkin` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `shiftfkout` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `cutbreak` int DEFAULT '0',
  `otforward` int DEFAULT '0',
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `at_shifts` (
  `id` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `shift_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `clock_in` time NOT NULL DEFAULT '00:00:01',
  `clock_out` time DEFAULT NULL,
  `descr` varchar(220) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `at_standarworkings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `o_company_id` int NOT NULL,
  `year` year NOT NULL,
  `jan` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `feb` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `mar` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `apr` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `may` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jun` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jul` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `aug` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `sep` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `oct` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nov` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dec` char(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `branch` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `company_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `logo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `head_office` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `active` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'Y',
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL,
  `deleted` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `deleted_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `claim_health` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `no_claim` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tgl_claim` date DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `company_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date_treat` date DEFAULT NULL,
  `tertanggung` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jenis_claim` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `provider` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `diagnosa` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `biaya_claim` int DEFAULT NULL,
  `status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `keterangan` varchar(500) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `dokumen_claim` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `insurance` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `taxid` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `image` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `city` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `province` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `country` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phone` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `fax` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `homepage` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_email` (
  `email_user` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `smtp_host` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `smtp_port` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `protocol` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `mail_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
CREATE TABLE `contracts` (
  `id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_absen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pin` int NOT NULL,
  `date_time` datetime NOT NULL,
  `ver` int NOT NULL,
  `status` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `date_periode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `branch_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date_start` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date_end` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
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
CREATE TABLE `divisions` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descr` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisions_head` (
  `id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `divisions_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `periode` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` enum('active','nonactive') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'active',
  `created_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `modified_by` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education_level` (
  `kode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `descr` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `educational` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `level` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `institution` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `graduated` year DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
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
CREATE TABLE `employees_histories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `change_desc` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `descr` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `contract_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `latest_date` date DEFAULT NULL,
  `created` date DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` date DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_leave` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `date` date DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `year` year DEFAULT NULL,
  `leave` float DEFAULT NULL,
  `get_leave` float DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_leave_summary` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date_update` date DEFAULT NULL,
  `total_leave` float DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `birth_place` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `family_category` (
  `kode` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `descr` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`kode`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fingerprint_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `finger_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `timetable` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `on_duty` time DEFAULT NULL,
  `off_duty` time DEFAULT NULL,
  `clock_in` time DEFAULT NULL,
  `clock_out` time DEFAULT NULL,
  `normal` int DEFAULT NULL,
  `realtime` float DEFAULT NULL,
  `late` int DEFAULT NULL,
  `early` int DEFAULT NULL,
  `absent` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ot_time` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `work_time` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `exception` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `must_in` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `must_out` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `department` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ndays` float DEFAULT NULL,
  `weekend` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `holiday` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `att_time` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ndays_ot` float DEFAULT NULL,
  `weekend_ot` float DEFAULT NULL,
  `holiday_ot` float DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fingerprint_data_temp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `finger_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `timetable` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `on_duty` time DEFAULT NULL,
  `off_duty` time DEFAULT NULL,
  `clock_in` time DEFAULT NULL,
  `clock_out` time DEFAULT NULL,
  `normal` int DEFAULT NULL,
  `realtime` float DEFAULT NULL,
  `late` time DEFAULT NULL,
  `early` time DEFAULT NULL,
  `absent` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ot_time` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `work_time` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `exception` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `must_in` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `must_out` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `department` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ndays` float DEFAULT NULL,
  `weekend` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `holiday` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `att_time` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ndays_ot` float DEFAULT NULL,
  `weekend_ot` float DEFAULT NULL,
  `holiday_ot` float DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grades` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descr` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `flag_level` int NOT NULL DEFAULT '0',
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_companies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `title_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `department_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `division_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `company_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_menus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `read` int NOT NULL DEFAULT '0',
  `create` int NOT NULL DEFAULT '0',
  `update` int NOT NULL DEFAULT '0',
  `delete` int NOT NULL DEFAULT '0',
  `approve` int DEFAULT '0',
  `download` int DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descr` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime NOT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
CREATE TABLE `jabatan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
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
CREATE TABLE `kons_activity_user` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `users` varchar(60) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `activity` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `agent` tinytext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `platform` tinytext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ip_address` varchar(17) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `time_jkt` datetime NOT NULL,
  `expiry_date` datetime NOT NULL,
  `uk` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ip_address` (`ip_address`,`time_jkt`,`expiry_date`,`uk`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
CREATE TABLE `kons_menu` (
  `menu_id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `menu` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `menu_link` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `urut_1` int NOT NULL DEFAULT '0',
  `urut_2` int DEFAULT NULL,
  `parent` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `icon_notify` enum('no','yes') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tag_collapse` varchar(90) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_menu_user` (
  `user_menu_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(35) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_name` varchar(75) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `menu_id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `create` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `read` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `update` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `delete` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `show_all_data` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `specific_data` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `added_by_uname` varchar(37) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `added_by_uid` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `added_by_time` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `added_by_date` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`user_menu_id`) USING BTREE,
  UNIQUE KEY `kunci` (`user_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kons_quotation_details` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `quotation_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_aktifitas` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_aktifitas` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `bobot` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mandays` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tahapan` double DEFAULT NULL,
  `harga_aktifitas` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `total_discount` double DEFAULT NULL,
  `total_harga` double DEFAULT NULL,
  `descr` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
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
CREATE TABLE `leave_applications` (
  `id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `division_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `company_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `branch_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `periode_year` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `unused_leave` float DEFAULT '0',
  `get_year_leave` float DEFAULT '0',
  `remaining_leave` float DEFAULT '0',
  `sick_leave` float DEFAULT '0',
  `doc_sick_leave` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `special_leave_category` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `special_leave` float DEFAULT '0',
  `doc_special_leave` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `notpay_leave_desc` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `notpay_leave` float DEFAULT '0',
  `doc_notpay_leave` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `applied_leave` float DEFAULT '0',
  `from_date` date DEFAULT NULL,
  `until_date` date DEFAULT NULL,
  `total_days` float DEFAULT '0',
  `descriptions` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `substitute_leave` float DEFAULT '0',
  `type_day_leave` enum('FULL_DAY','HALF_DAY') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'FULL_DAY',
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `doc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `request_by` enum('CLIENT','OTHER') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_request` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `holiday_info` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `status` enum('OPN','APV','PND','REJ','CNL','HIS','REV') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'OPN',
  `flag_revision` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `no_revision` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `flag_leave_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `mass_leave_id` float DEFAULT '0',
  `actual_leave` float DEFAULT NULL,
  `flag_alpha` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `alpha_value` float DEFAULT '0',
  `alpha_date` date DEFAULT NULL,
  `approved_hr` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_hr_at` timestamp NULL DEFAULT NULL,
  `approved_hr_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `note` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `problems` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `approval_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL,
  `doc_sick_leave_2` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `doc_sick_leave_3` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marital_status` (
  `id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `code` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `ptkp` int DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `path` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `flag_active` int NOT NULL DEFAULT '0',
  `weight` int DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_allowance` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `employee_category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_bpjs` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `employee_category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `employee_id` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tunjangan` decimal(11,2) DEFAULT '0.00',
  `potongan` decimal(11,2) DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE
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
  `terpakai` double DEFAULT NULL,
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
  `definisi` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
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
CREATE TABLE `ms_generate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tipe` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `info` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_1` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_2` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_3` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kode_text` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_policy` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `position_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `notabsen` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `late5` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `late15` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `late30` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `late60` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `late240` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `izinpagi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `izinsore` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `transport` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `insentif` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_potongan` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `employee_category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `employee_id` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_rptpotongan` (
  `ms_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
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
  PRIMARY KEY (`ms_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_rptsalary` (
  `ms_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
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
  `salary` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jabatan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pulsa` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
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
  PRIMARY KEY (`ms_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_rpttunjangan` (
  `ms_id` int NOT NULL AUTO_INCREMENT,
  `id` int NOT NULL,
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
  PRIMARY KEY (`ms_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ms_salary_komponen` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `employee_category` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `employee_id` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_tunjangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pokok` int DEFAULT NULL,
  `id_potongan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `periode_gaji` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tahun` int DEFAULT NULL,
  PRIMARY KEY (`id`,`employee_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `overtime` (
  `id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `division_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `company_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `branch_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `periode_year` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `total_time` float DEFAULT '0',
  `no_so` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `status` enum('OPN','APV','PND','REJ','CNL','HIS','REV') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'OPN',
  `flag_revision` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `no_revision` int DEFAULT NULL,
  `approved_hr` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_hr_at` timestamp NULL DEFAULT NULL,
  `approved_hr_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `note` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `problems` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `approval_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pengganti` (
  `id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `division_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `periode_year` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `type` enum('FULL_DAY','HALF_DAY') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `until_date` date DEFAULT NULL,
  `total_days` float DEFAULT NULL,
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `doc` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `status` enum('OPN','APV','PND','REJ','CNL','HIS') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'OPN',
  `request_by` enum('CLIENT','OTHER') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `reason_request` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `approved_hr` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_hr_at` timestamp NULL DEFAULT NULL,
  `approved_hr_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approval_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descr` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `flag_level` int NOT NULL DEFAULT '0',
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rekapabsen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `year` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `month` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `absen` float DEFAULT NULL,
  `onsite` float DEFAULT NULL,
  `overtime` float DEFAULT NULL,
  `wfh` float DEFAULT NULL,
  `total` float DEFAULT NULL,
  `id_perusahaan` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `id_cabang` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rpt_absensi` (
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
  `cutilain` float(4,0) DEFAULT NULL,
  `sakit` float(4,0) DEFAULT NULL,
  `noketerangan` float(4,0) DEFAULT NULL,
  `late5minute` float(4,0) DEFAULT NULL,
  `late15minute` float(4,0) DEFAULT NULL,
  `late30minute` float(4,0) DEFAULT NULL,
  `late60minute` float(4,0) DEFAULT NULL,
  `late220minute` float(4,0) DEFAULT NULL,
  `totallate` float(4,0) DEFAULT NULL,
  `lateminute` float(4,0) DEFAULT NULL,
  `izinpagi60` float(4,0) DEFAULT NULL,
  `izinpagi240` float(4,0) DEFAULT NULL,
  `izinsore60` float(4,0) DEFAULT NULL,
  `izinsore240` float(4,0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
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
CREATE TABLE `salary` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pokok` int DEFAULT NULL,
  `transport` int DEFAULT NULL,
  `makan` int DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ptkp` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titles` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `division_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `department_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descr` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `titles_salah` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `company_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `division_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `department_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descr` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `approved_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_on` datetime DEFAULT NULL,
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
  `created_by` int DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` int DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
  `expense_on` date DEFAULT NULL,
  `id_kasbon` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_permission` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `year` year DEFAULT NULL,
  `leave` int DEFAULT NULL,
  `leave_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `from` date DEFAULT NULL,
  `until` date DEFAULT NULL,
  `descr` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tr_salary` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `periode_gaji` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `tahun` int DEFAULT NULL,
  `periode_awal` date DEFAULT NULL,
  `periode_akhir` date DEFAULT NULL,
  `pokok` decimal(10,0) DEFAULT NULL,
  `tj_harian` decimal(10,0) DEFAULT NULL,
  `tj_bulanan` decimal(10,0) DEFAULT NULL,
  `tj_bpjs` decimal(10,0) DEFAULT NULL,
  `pot_bpjs` decimal(10,0) DEFAULT NULL,
  `pot_lain` decimal(10,0) DEFAULT '0',
  `total` decimal(10,0) DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `kategori` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `pot_absensi` decimal(10,0) DEFAULT '0',
  `pot_pinjaman` decimal(10,0) DEFAULT '0',
  `pot_pph` decimal(10,0) DEFAULT '0',
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
  `doc_file` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nopol` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `rute` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `km_awal` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `km_akhir` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `bensin` decimal(20,0) DEFAULT NULL,
  `tol` decimal(20,0) DEFAULT NULL,
  `parkir` decimal(20,0) DEFAULT NULL,
  `status` int DEFAULT '0',
  `no_req` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_on` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_on` datetime DEFAULT NULL,
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
  `management_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `management_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_leave` (
  `id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `year` year DEFAULT NULL,
  `leave` int DEFAULT NULL,
  `leave_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `from` date DEFAULT NULL,
  `until` date DEFAULT NULL,
  `descr` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `username` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `flag_active` int NOT NULL DEFAULT '0',
  `flag_salary` int NOT NULL DEFAULT '0',
  `group_id` int NOT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `pict` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `momid` int DEFAULT NULL,
  `ttd` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `nm_lengkap` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kota` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `hp` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `kdcab` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ip` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `login_terakhir` datetime DEFAULT NULL,
  `st_aktif` tinyint(1) DEFAULT '1' COMMENT '0 = Tidak Aktif\\n1 = Aktif',
  `photo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_copy` (
  `id` int NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `username` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `flag_active` int NOT NULL DEFAULT '0',
  `flag_salary` int NOT NULL DEFAULT '0',
  `group_id` int NOT NULL,
  `created_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `modified_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `pict` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `momid` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_absensi_log` AS SELECT 
 1 AS `id`,
 1 AS `employee_id`,
 1 AS `user_id`,
 1 AS `foto`,
 1 AS `waktu`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `tipe`,
 1 AS `flag_cuti`,
 1 AS `jam_standar`,
 1 AS `name`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_absensi_log_report` AS SELECT 
 1 AS `employee_id`,
 1 AS `tipe`,
 1 AS `tanggal`,
 1 AS `j_m`,
 1 AS `masuk`,
 1 AS `j_k`,
 1 AS `keluar`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_assign_company` AS SELECT 
 1 AS `company_id`,
 1 AS `user_id`,
 1 AS `name`,
 1 AS `email`,
 1 AS `branch_id`,
 1 AS `branch`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_emp_year_leave` AS SELECT 
 1 AS `id`,
 1 AS `employee_id`,
 1 AS `name`,
 1 AS `year`,
 1 AS `leave`,
 1 AS `description`,
 1 AS `created_by`,
 1 AS `created`,
 1 AS `modified_by`,
 1 AS `modified`,
 1 AS `date`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_empl_summary` AS SELECT 
 1 AS `id`,
 1 AS `employee_id`,
 1 AS `name`,
 1 AS `date_update`,
 1 AS `total_leave`,
 1 AS `description`,
 1 AS `updated_at`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_employee_leave_summary` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `year`,
 1 AS `leave`,
 1 AS `periode_year`,
 1 AS `unused_leave`,
 1 AS `get_year_leave`,
 1 AS `special_leave`,
 1 AS `notpay_leave`,
 1 AS `remaining_leave`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_employees` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `nik`,
 1 AS `company_id`,
 1 AS `companies_name`,
 1 AS `division_id`,
 1 AS `divisions_name`,
 1 AS `department_id`,
 1 AS `departements_name`,
 1 AS `title_id`,
 1 AS `titles_name`,
 1 AS `position_id`,
 1 AS `pisitions_name`,
 1 AS `hometown`,
 1 AS `genderid`,
 1 AS `birthday`,
 1 AS `address`,
 1 AS `relid`,
 1 AS `city`,
 1 AS `province`,
 1 AS `postcode`,
 1 AS `idcard_address`,
 1 AS `marital_status`,
 1 AS `phone`,
 1 AS `hp`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_leave_applications` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `employee_id`,
 1 AS `division_id`,
 1 AS `divisions_name`,
 1 AS `company_id`,
 1 AS `company_name`,
 1 AS `branch_id`,
 1 AS `branch_name`,
 1 AS `periode_year`,
 1 AS `unused_leave`,
 1 AS `get_year_leave`,
 1 AS `sick_leave`,
 1 AS `doc_sick_leave`,
 1 AS `special_leave_category`,
 1 AS `category_name`,
 1 AS `special_leave`,
 1 AS `doc_special_leave`,
 1 AS `notpay_leave_desc`,
 1 AS `notpay_leave`,
 1 AS `doc_notpay_leave`,
 1 AS `applied_leave`,
 1 AS `from_date`,
 1 AS `until_date`,
 1 AS `total_days`,
 1 AS `remaining_leave`,
 1 AS `descriptions`,
 1 AS `holiday_info`,
 1 AS `note`,
 1 AS `status`,
 1 AS `flag_revision`,
 1 AS `no_revision`,
 1 AS `approval_by`,
 1 AS `approval_by_name`,
 1 AS `approval_employee_id`,
 1 AS `approved_at`,
 1 AS `approved_hr`,
 1 AS `approved_hr_by`,
 1 AS `approved_hr_at`,
 1 AS `created_by`,
 1 AS `created_at`,
 1 AS `modified_by`,
 1 AS `modified_at`,
 1 AS `flag_leave_type`,
 1 AS `mass_leave_id`,
 1 AS `actual_leave`,
 1 AS `flag_alpha`,
 1 AS `alpha_value`,
 1 AS `substitute_leave`,
 1 AS `reason`,
 1 AS `request_by`,
 1 AS `reason_request`,
 1 AS `doc_sick_leave_2`,
 1 AS `doc_sick_leave_3`,
 1 AS `doc`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_overtime` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `employee_id`,
 1 AS `division_id`,
 1 AS `company_id`,
 1 AS `branch_id`,
 1 AS `periode_year`,
 1 AS `date`,
 1 AS `start_time`,
 1 AS `end_time`,
 1 AS `total_time`,
 1 AS `no_so`,
 1 AS `reason`,
 1 AS `status`,
 1 AS `flag_revision`,
 1 AS `no_revision`,
 1 AS `approved_hr`,
 1 AS `approved_hr_at`,
 1 AS `approved_hr_by`,
 1 AS `note`,
 1 AS `problems`,
 1 AS `approval_by`,
 1 AS `approval_employee_name`,
 1 AS `approval_employee_id`,
 1 AS `approved_at`,
 1 AS `created_by`,
 1 AS `created_at`,
 1 AS `modified_by`,
 1 AS `modified_at`,
 1 AS `divisions_name`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_pengganti` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `employee_id`,
 1 AS `division_id`,
 1 AS `company_id`,
 1 AS `branch_id`,
 1 AS `divisions_name`,
 1 AS `periode_year`,
 1 AS `from_date`,
 1 AS `until_date`,
 1 AS `total_days`,
 1 AS `descriptions`,
 1 AS `substitute_leave`,
 1 AS `reason`,
 1 AS `doc`,
 1 AS `request_by`,
 1 AS `reason_request`,
 1 AS `status`,
 1 AS `flag_leave_type`,
 1 AS `approved_hr`,
 1 AS `approved_hr_at`,
 1 AS `approved_hr_by`,
 1 AS `note`,
 1 AS `problems`,
 1 AS `approval_by_name`,
 1 AS `approval_employee_id`,
 1 AS `approved_at`,
 1 AS `created_by`,
 1 AS `created_at`,
 1 AS `modified_by`,
 1 AS `modified_at`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_rekapabsen` AS SELECT 
 1 AS `id`,
 1 AS `year`,
 1 AS `month`,
 1 AS `start_date`,
 1 AS `end_date`,
 1 AS `employee_id`,
 1 AS `name`,
 1 AS `absen`,
 1 AS `onsite`,
 1 AS `overtime`,
 1 AS `wfh`,
 1 AS `total`,
 1 AS `id_perusahaan`,
 1 AS `id_cabang`,
 1 AS `updated_at`,
 1 AS `updated_by`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_report_kehadiran` AS SELECT 
 1 AS `employee_id`,
 1 AS `name`,
 1 AS `resign`,
 1 AS `flag_active`,
 1 AS `periode_year`,
 1 AS `leave`,
 1 AS `sick_leave`,
 1 AS `special_leave`,
 1 AS `notpay_leave`,
 1 AS `alpha`,
 1 AS `substitute_leave`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_summary_absensi` AS SELECT 
 1 AS `employee_id`,
 1 AS `waktu`,
 1 AS `kantor`,
 1 AS `onsite`,
 1 AS `lembur`*/;
SET character_set_client = @saved_cs_client;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_wfh` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `employee_id`,
 1 AS `division_id`,
 1 AS `company_id`,
 1 AS `branch_id`,
 1 AS `periode_year`,
 1 AS `type_day`,
 1 AS `from_date`,
 1 AS `until_date`,
 1 AS `total_days`,
 1 AS `reason`,
 1 AS `status`,
 1 AS `flag_revision`,
 1 AS `no_revision`,
 1 AS `flag_leave_type`,
 1 AS `actual_leave`,
 1 AS `approved_hr`,
 1 AS `approved_hr_at`,
 1 AS `approved_hr_by`,
 1 AS `note`,
 1 AS `problems`,
 1 AS `approval_by`,
 1 AS `approval_employee_name`,
 1 AS `approval_employee_id`,
 1 AS `approved_at`,
 1 AS `created_by`,
 1 AS `created_at`,
 1 AS `modified_by`,
 1 AS `modified_at`,
 1 AS `divisions_name`*/;
SET character_set_client = @saved_cs_client;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_from_home` (
  `id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `division_id` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `company_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `branch_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `periode_year` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `type_day` enum('HALF_DAY','FULL_DAY') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'FULL_DAY',
  `from_date` date DEFAULT NULL,
  `until_date` date DEFAULT NULL,
  `total_days` float DEFAULT '0',
  `reason` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `status` enum('OPN','APV','PND','REJ','CNL','HIS','REV') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'OPN',
  `flag_revision` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `no_revision` int DEFAULT NULL,
  `flag_leave_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `actual_leave` float DEFAULT NULL,
  `approved_hr` enum('N','Y') CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT 'N',
  `approved_hr_at` timestamp NULL DEFAULT NULL,
  `approved_hr_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `note` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `problems` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `approval_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `modified_by` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works` (
  `id` int NOT NULL AUTO_INCREMENT,
  `leave_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `employee_id` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `work_planning` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_planning` float DEFAULT NULL,
  `work_actual` text CHARACTER SET latin1 COLLATE latin1_swedish_ci,
  `qty_actual` float DEFAULT NULL,
  `type` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50001 DROP VIEW IF EXISTS `members`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `members` AS select `employees`.`id` AS `id`,`employees`.`name` AS `nama`,`employees`.`nik` AS `nik`,`employees`.`company_id` AS `company_id`,`employees`.`division_id` AS `division_id`,`employees`.`department_id` AS `department_id`,`employees`.`flag_active` AS `status` from `employees` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_absensi_log`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_absensi_log` AS select `absensi_log`.`id` AS `id`,`absensi_log`.`employee_id` AS `employee_id`,`absensi_log`.`user_id` AS `user_id`,`absensi_log`.`foto` AS `foto`,`absensi_log`.`waktu` AS `waktu`,`absensi_log`.`latitude` AS `latitude`,`absensi_log`.`longitude` AS `longitude`,`absensi_log`.`tipe` AS `tipe`,`absensi_log`.`flag_cuti` AS `flag_cuti`,`absensi_log`.`jam_standar` AS `jam_standar`,`employees`.`name` AS `name` from (`absensi_log` left join `employees` on((`absensi_log`.`employee_id` = `employees`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_absensi_log_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_absensi_log_report` AS select ifnull(`m`.`employee_id`,`k`.`employee_id`) AS `employee_id`,ifnull(`m`.`tipe`,`k`.`tipe`) AS `tipe`,ifnull(date_format(`m`.`waktu`,'%Y-%m-%d'),date_format(`k`.`waktu`,'%Y-%m-%d')) AS `tanggal`,`m`.`jam_standar` AS `j_m`,date_format(`m`.`waktu`,'%H:%i') AS `masuk`,`k`.`jam_standar` AS `j_k`,date_format(`k`.`waktu`,'%H:%i') AS `keluar` from ((select `absensi_log`.`id` AS `id`,`absensi_log`.`employee_id` AS `employee_id`,`absensi_log`.`user_id` AS `user_id`,`absensi_log`.`foto` AS `foto`,`absensi_log`.`waktu` AS `waktu`,`absensi_log`.`latitude` AS `latitude`,`absensi_log`.`longitude` AS `longitude`,`absensi_log`.`tipe` AS `tipe`,`absensi_log`.`jam_standar` AS `jam_standar`,`absensi_log`.`flag_cuti` AS `flag_cuti` from `absensi_log` where ((`absensi_log`.`tipe` = '1') or (`absensi_log`.`tipe` is null))) `m` join (select `absensi_log`.`id` AS `id`,`absensi_log`.`employee_id` AS `employee_id`,`absensi_log`.`user_id` AS `user_id`,`absensi_log`.`foto` AS `foto`,`absensi_log`.`waktu` AS `waktu`,`absensi_log`.`latitude` AS `latitude`,`absensi_log`.`longitude` AS `longitude`,`absensi_log`.`tipe` AS `tipe`,`absensi_log`.`jam_standar` AS `jam_standar`,`absensi_log`.`flag_cuti` AS `flag_cuti` from `absensi_log` where (`absensi_log`.`tipe` = '4')) `k` on(((`m`.`employee_id` = `k`.`employee_id`) and (date_format(`m`.`waktu`,'%Y-%m-%d') = date_format(`k`.`waktu`,'%Y-%m-%d'))))) group by `employee_id`,date_format(`m`.`waktu`,'%Y-%m-%d'),`m`.`jam_standar`,`m`.`tipe`,`k`.`jam_standar` order by `employee_id`,`tanggal` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_assign_company`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_assign_company` AS select `assign_user_company`.`company_id` AS `company_id`,`assign_user_company`.`user_id` AS `user_id`,`companies`.`name` AS `name`,`companies`.`email` AS `email`,`assign_user_company`.`branch_id` AS `branch_id`,`branch`.`branch` AS `branch` from ((`assign_user_company` left join `companies` on((`assign_user_company`.`company_id` = `companies`.`id`))) left join `branch` on((`assign_user_company`.`branch_id` = `branch`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_emp_year_leave`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_emp_year_leave` AS select `employees_leave`.`id` AS `id`,`employees_leave`.`employee_id` AS `employee_id`,`employees`.`name` AS `name`,`employees_leave`.`year` AS `year`,`employees_leave`.`leave` AS `leave`,`employees_leave`.`description` AS `description`,`employees_leave`.`created_by` AS `created_by`,`employees_leave`.`created` AS `created`,`employees_leave`.`modified_by` AS `modified_by`,`employees_leave`.`modified` AS `modified`,`employees_leave`.`date` AS `date` from (`employees_leave` left join `employees` on((`employees_leave`.`employee_id` = `employees`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_empl_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_empl_summary` AS select `employees_leave_summary`.`id` AS `id`,`employees_leave_summary`.`employee_id` AS `employee_id`,`employees`.`name` AS `name`,`employees_leave_summary`.`date_update` AS `date_update`,`employees_leave_summary`.`total_leave` AS `total_leave`,`employees_leave_summary`.`description` AS `description`,`employees_leave_summary`.`updated_at` AS `updated_at` from (`employees_leave_summary` left join `employees` on((`employees_leave_summary`.`employee_id` = `employees`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_employee_leave_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_employee_leave_summary` AS select `employees`.`id` AS `id`,`employees`.`name` AS `name`,`employees_leave`.`year` AS `year`,sum(`employees_leave`.`leave`) AS `leave`,`leave_applications`.`periode_year` AS `periode_year`,`leave_applications`.`unused_leave` AS `unused_leave`,`leave_applications`.`get_year_leave` AS `get_year_leave`,`leave_applications`.`special_leave` AS `special_leave`,`leave_applications`.`notpay_leave` AS `notpay_leave`,`leave_applications`.`remaining_leave` AS `remaining_leave` from ((`employees` left join `employees_leave` on((`employees`.`id` = `employees_leave`.`employee_id`))) left join `leave_applications` on(((`leave_applications`.`employee_id` = `employees`.`id`) and (`leave_applications`.`status` = 'APV')))) group by `employees`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_employees`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_employees` AS select `employees`.`id` AS `id`,`employees`.`name` AS `name`,`employees`.`nik` AS `nik`,`employees`.`company_id` AS `company_id`,`companies`.`name` AS `companies_name`,`employees`.`division_id` AS `division_id`,`divisions`.`name` AS `divisions_name`,`employees`.`department_id` AS `department_id`,`departments`.`name` AS `departements_name`,`employees`.`title_id` AS `title_id`,`titles`.`name` AS `titles_name`,`employees`.`position_id` AS `position_id`,`positions`.`name` AS `pisitions_name`,`employees`.`hometown` AS `hometown`,`employees`.`genderid` AS `genderid`,`employees`.`birthday` AS `birthday`,`employees`.`address` AS `address`,`employees`.`relid` AS `relid`,`employees`.`city` AS `city`,`employees`.`province` AS `province`,`employees`.`postcode` AS `postcode`,`employees`.`idcard_address` AS `idcard_address`,`employees`.`marital_status` AS `marital_status`,`employees`.`phone` AS `phone`,`employees`.`hp` AS `hp` from (((((`employees` left join `companies` on((`employees`.`company_id` = `companies`.`id`))) left join `departments` on((`employees`.`department_id` = `departments`.`id`))) left join `titles` on((`employees`.`title_id` = `titles`.`id`))) left join `positions` on((`employees`.`position_id` = `positions`.`id`))) left join `divisions` on((`employees`.`division_id` = `divisions`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_leave_applications`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_leave_applications` AS select `leave_applications`.`id` AS `id`,`leave_applications`.`name` AS `name`,`leave_applications`.`employee_id` AS `employee_id`,`leave_applications`.`division_id` AS `division_id`,`divisions`.`name` AS `divisions_name`,`leave_applications`.`company_id` AS `company_id`,`companies`.`name` AS `company_name`,`leave_applications`.`branch_id` AS `branch_id`,`branch`.`branch` AS `branch_name`,`leave_applications`.`periode_year` AS `periode_year`,`leave_applications`.`unused_leave` AS `unused_leave`,`leave_applications`.`get_year_leave` AS `get_year_leave`,`leave_applications`.`sick_leave` AS `sick_leave`,`leave_applications`.`doc_sick_leave` AS `doc_sick_leave`,`leave_applications`.`special_leave_category` AS `special_leave_category`,`at_leaves`.`name` AS `category_name`,`leave_applications`.`special_leave` AS `special_leave`,`leave_applications`.`doc_special_leave` AS `doc_special_leave`,`leave_applications`.`notpay_leave_desc` AS `notpay_leave_desc`,`leave_applications`.`notpay_leave` AS `notpay_leave`,`leave_applications`.`doc_notpay_leave` AS `doc_notpay_leave`,`leave_applications`.`applied_leave` AS `applied_leave`,`leave_applications`.`from_date` AS `from_date`,`leave_applications`.`until_date` AS `until_date`,`leave_applications`.`total_days` AS `total_days`,`leave_applications`.`remaining_leave` AS `remaining_leave`,`leave_applications`.`descriptions` AS `descriptions`,`leave_applications`.`holiday_info` AS `holiday_info`,`leave_applications`.`note` AS `note`,`leave_applications`.`status` AS `status`,`leave_applications`.`flag_revision` AS `flag_revision`,`leave_applications`.`no_revision` AS `no_revision`,`leave_applications`.`approval_by` AS `approval_by`,`divisions_head`.`name` AS `approval_by_name`,`divisions_head`.`employee_id` AS `approval_employee_id`,`leave_applications`.`approved_at` AS `approved_at`,`leave_applications`.`approved_hr` AS `approved_hr`,`leave_applications`.`approved_hr_by` AS `approved_hr_by`,`leave_applications`.`approved_hr_at` AS `approved_hr_at`,`leave_applications`.`created_by` AS `created_by`,`leave_applications`.`created_at` AS `created_at`,`leave_applications`.`modified_by` AS `modified_by`,`leave_applications`.`modified_at` AS `modified_at`,`leave_applications`.`flag_leave_type` AS `flag_leave_type`,`leave_applications`.`mass_leave_id` AS `mass_leave_id`,`leave_applications`.`actual_leave` AS `actual_leave`,`leave_applications`.`flag_alpha` AS `flag_alpha`,`leave_applications`.`alpha_value` AS `alpha_value`,`leave_applications`.`substitute_leave` AS `substitute_leave`,`leave_applications`.`reason` AS `reason`,`leave_applications`.`request_by` AS `request_by`,`leave_applications`.`reason_request` AS `reason_request`,`leave_applications`.`doc_sick_leave_2` AS `doc_sick_leave_2`,`leave_applications`.`doc_sick_leave_3` AS `doc_sick_leave_3`,`leave_applications`.`doc` AS `doc` from (((((`leave_applications` left join `divisions` on((`leave_applications`.`division_id` = `divisions`.`id`))) left join `at_leaves` on((`leave_applications`.`special_leave_category` = `at_leaves`.`id`))) left join `divisions_head` on((`leave_applications`.`approval_by` = `divisions_head`.`id`))) join `companies` on((`leave_applications`.`company_id` = `companies`.`id`))) join `branch` on((`leave_applications`.`branch_id` = `branch`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_overtime`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_overtime` AS select `overtime`.`id` AS `id`,`overtime`.`name` AS `name`,`overtime`.`employee_id` AS `employee_id`,`overtime`.`division_id` AS `division_id`,`overtime`.`company_id` AS `company_id`,`overtime`.`branch_id` AS `branch_id`,`overtime`.`periode_year` AS `periode_year`,`overtime`.`date` AS `date`,`overtime`.`start_time` AS `start_time`,`overtime`.`end_time` AS `end_time`,`overtime`.`total_time` AS `total_time`,`overtime`.`no_so` AS `no_so`,`overtime`.`reason` AS `reason`,`overtime`.`status` AS `status`,`overtime`.`flag_revision` AS `flag_revision`,`overtime`.`no_revision` AS `no_revision`,`overtime`.`approved_hr` AS `approved_hr`,`overtime`.`approved_hr_at` AS `approved_hr_at`,`overtime`.`approved_hr_by` AS `approved_hr_by`,`overtime`.`note` AS `note`,`overtime`.`problems` AS `problems`,`overtime`.`approval_by` AS `approval_by`,`divisions_head`.`name` AS `approval_employee_name`,`divisions_head`.`employee_id` AS `approval_employee_id`,`overtime`.`approved_at` AS `approved_at`,`overtime`.`created_by` AS `created_by`,`overtime`.`created_at` AS `created_at`,`overtime`.`modified_by` AS `modified_by`,`overtime`.`modified_at` AS `modified_at`,`divisions`.`name` AS `divisions_name` from ((`overtime` join `divisions` on((`overtime`.`division_id` = `divisions`.`id`))) join `divisions_head` on((`overtime`.`approval_by` = `divisions_head`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_pengganti`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_pengganti` AS select `leave_applications`.`id` AS `id`,`leave_applications`.`name` AS `name`,`leave_applications`.`employee_id` AS `employee_id`,`leave_applications`.`division_id` AS `division_id`,`leave_applications`.`company_id` AS `company_id`,`leave_applications`.`branch_id` AS `branch_id`,`divisions`.`name` AS `divisions_name`,`leave_applications`.`periode_year` AS `periode_year`,`leave_applications`.`from_date` AS `from_date`,`leave_applications`.`until_date` AS `until_date`,`leave_applications`.`total_days` AS `total_days`,`leave_applications`.`descriptions` AS `descriptions`,`leave_applications`.`substitute_leave` AS `substitute_leave`,`leave_applications`.`reason` AS `reason`,`leave_applications`.`doc` AS `doc`,`leave_applications`.`request_by` AS `request_by`,`leave_applications`.`reason_request` AS `reason_request`,`leave_applications`.`status` AS `status`,`leave_applications`.`flag_leave_type` AS `flag_leave_type`,`leave_applications`.`approved_hr` AS `approved_hr`,`leave_applications`.`approved_hr_at` AS `approved_hr_at`,`leave_applications`.`approved_hr_by` AS `approved_hr_by`,`leave_applications`.`note` AS `note`,`leave_applications`.`problems` AS `problems`,`divisions_head`.`name` AS `approval_by_name`,`divisions_head`.`employee_id` AS `approval_employee_id`,`leave_applications`.`approved_at` AS `approved_at`,`leave_applications`.`created_by` AS `created_by`,`leave_applications`.`created_at` AS `created_at`,`leave_applications`.`modified_by` AS `modified_by`,`leave_applications`.`modified_at` AS `modified_at` from (((`leave_applications` left join `employees` on((`leave_applications`.`employee_id` = `employees`.`id`))) left join `divisions` on((`leave_applications`.`division_id` = `divisions`.`id`))) left join `divisions_head` on((`leave_applications`.`approval_by` = `divisions_head`.`id`))) where (`leave_applications`.`flag_leave_type` = 'CP') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_rekapabsen`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_rekapabsen` AS select `rekapabsen`.`id` AS `id`,`rekapabsen`.`year` AS `year`,`rekapabsen`.`month` AS `month`,`rekapabsen`.`start_date` AS `start_date`,`rekapabsen`.`end_date` AS `end_date`,`rekapabsen`.`employee_id` AS `employee_id`,`employees`.`name` AS `name`,`rekapabsen`.`absen` AS `absen`,`rekapabsen`.`onsite` AS `onsite`,`rekapabsen`.`overtime` AS `overtime`,`rekapabsen`.`wfh` AS `wfh`,`rekapabsen`.`total` AS `total`,`rekapabsen`.`id_perusahaan` AS `id_perusahaan`,`rekapabsen`.`id_cabang` AS `id_cabang`,`rekapabsen`.`updated_at` AS `updated_at`,`rekapabsen`.`updated_by` AS `updated_by` from (`rekapabsen` left join `employees` on((`employees`.`id` = `rekapabsen`.`employee_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_report_kehadiran`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_report_kehadiran` AS select `employees`.`id` AS `employee_id`,`employees`.`name` AS `name`,`employees`.`resign` AS `resign`,`employees`.`flag_active` AS `flag_active`,`leave_applications`.`periode_year` AS `periode_year`,sum(`leave_applications`.`get_year_leave`) AS `leave`,sum(`leave_applications`.`sick_leave`) AS `sick_leave`,sum(`leave_applications`.`special_leave`) AS `special_leave`,sum(`leave_applications`.`notpay_leave`) AS `notpay_leave`,sum(`leave_applications`.`alpha_value`) AS `alpha`,sum(`leave_applications`.`substitute_leave`) AS `substitute_leave` from (`employees` left join `leave_applications` on(((`employees`.`id` = `leave_applications`.`employee_id`) and (`leave_applications`.`status` = 'APV')))) where (`employees`.`resign` is null) group by `employees`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_summary_absensi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_summary_absensi` AS select `absensi_log`.`employee_id` AS `employee_id`,`absensi_log`.`waktu` AS `waktu`,count((case when (`absensi_log`.`tipe` = '1') then `absensi_log`.`id` end)) AS `kantor`,count((case when (`absensi_log`.`tipe` = '2') then `absensi_log`.`id` end)) AS `onsite`,count((case when (`absensi_log`.`tipe` = '5') then `absensi_log`.`id` end)) AS `lembur` from `absensi_log` group by `absensi_log`.`waktu` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!50001 DROP VIEW IF EXISTS `view_wfh`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013  SQL SECURITY DEFINER */
/*!50001 VIEW `view_wfh` AS select `work_from_home`.`id` AS `id`,`work_from_home`.`name` AS `name`,`work_from_home`.`employee_id` AS `employee_id`,`work_from_home`.`division_id` AS `division_id`,`work_from_home`.`company_id` AS `company_id`,`work_from_home`.`branch_id` AS `branch_id`,`work_from_home`.`periode_year` AS `periode_year`,`work_from_home`.`type_day` AS `type_day`,`work_from_home`.`from_date` AS `from_date`,`work_from_home`.`until_date` AS `until_date`,`work_from_home`.`total_days` AS `total_days`,`work_from_home`.`reason` AS `reason`,`work_from_home`.`status` AS `status`,`work_from_home`.`flag_revision` AS `flag_revision`,`work_from_home`.`no_revision` AS `no_revision`,`work_from_home`.`flag_leave_type` AS `flag_leave_type`,`work_from_home`.`actual_leave` AS `actual_leave`,`work_from_home`.`approved_hr` AS `approved_hr`,`work_from_home`.`approved_hr_at` AS `approved_hr_at`,`work_from_home`.`approved_hr_by` AS `approved_hr_by`,`work_from_home`.`note` AS `note`,`work_from_home`.`problems` AS `problems`,`work_from_home`.`approval_by` AS `approval_by`,`divisions_head`.`name` AS `approval_employee_name`,`divisions_head`.`employee_id` AS `approval_employee_id`,`work_from_home`.`approved_at` AS `approved_at`,`work_from_home`.`created_by` AS `created_by`,`work_from_home`.`created_at` AS `created_at`,`work_from_home`.`modified_by` AS `modified_by`,`work_from_home`.`modified_at` AS `modified_at`,`divisions`.`name` AS `divisions_name` from ((`work_from_home` join `divisions` on((`work_from_home`.`division_id` = `divisions`.`id`))) join `divisions_head` on((`work_from_home`.`approval_by` = `divisions_head`.`id`))) */;
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

