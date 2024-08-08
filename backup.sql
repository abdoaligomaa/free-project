-- MySQL dump 10.19  Distrib 10.3.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: newrentall
-- ------------------------------------------------------
-- Server version	10.3.38-MariaDB-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AdminPrivileges`
--
use rentall;

DROP TABLE IF EXISTS `AdminPrivileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdminPrivileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleId` int(11) NOT NULL,
  `previlegeId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `AdminPrivileges_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `AdminRoles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdminPrivileges`
--

LOCK TABLES `AdminPrivileges` WRITE;
/*!40000 ALTER TABLE `AdminPrivileges` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdminPrivileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdminRoles`
--

DROP TABLE IF EXISTS `AdminRoles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdminRoles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdminRoles`
--

LOCK TABLES `AdminRoles` WRITE;
/*!40000 ALTER TABLE `AdminRoles` DISABLE KEYS */;
/*!40000 ALTER TABLE `AdminRoles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AdminUser`
--

DROP TABLE IF EXISTS `AdminUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AdminUser` (
  `id` char(36) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `emailConfirmed` tinyint(1) DEFAULT 0,
  `isSuperAdmin` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_user_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AdminUser`
--

LOCK TABLES `AdminUser` WRITE;
/*!40000 ALTER TABLE `AdminUser` DISABLE KEYS */;
INSERT INTO `AdminUser` VALUES ('8b16c890-c205-11e6-a2c7-4195de507451','admin@radicalstart.com','$2a$08$0OhXU7gBM6igwLMX8f5m8u57tNAMkWHE6DatUhnMM.vWoLhWOeGTW',1,1,'2016-12-14 13:59:34','2016-12-14 13:59:34',NULL);
/*!40000 ALTER TABLE `AdminUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Banner`
--

DROP TABLE IF EXISTS `Banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `isEnable` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Banner`
--

LOCK TABLES `Banner` WRITE;
/*!40000 ALTER TABLE `Banner` DISABLE KEYS */;
INSERT INTO `Banner` VALUES (1,'Lorum Ipsum.','Lorem Ipsum is simply dummy text of the printing and typesetting industry.',1,'2019-03-27 11:53:46','2018-05-02 04:49:38');
/*!40000 ALTER TABLE `Banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BedTypes`
--

DROP TABLE IF EXISTS `BedTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BedTypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `bedCount` int(11) DEFAULT NULL,
  `bedType` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `bedroomNumber` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `listId` (`listId`),
  KEY `bedType` (`bedType`),
  CONSTRAINT `BedTypes_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BedTypes_ibfk_2` FOREIGN KEY (`bedType`) REFERENCES `ListSettings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BedTypes`
--

LOCK TABLES `BedTypes` WRITE;
/*!40000 ALTER TABLE `BedTypes` DISABLE KEYS */;
INSERT INTO `BedTypes` VALUES (4,1,1,16,'2019-03-27 09:46:01','2019-03-27 09:46:01',0),(5,1,2,17,'2019-03-27 09:46:01','2019-03-27 09:46:01',0),(6,1,3,17,'2019-03-27 09:46:01','2019-03-27 09:46:01',0),(49,6,1,16,'2019-07-04 10:52:39','2019-07-04 10:52:39',0),(50,6,2,16,'2019-07-04 10:52:39','2019-07-04 10:52:39',0),(51,5,1,16,'2019-07-04 10:57:10','2019-07-04 10:57:10',0),(52,5,2,18,'2019-07-04 10:57:10','2019-07-04 10:57:10',0),(53,5,3,18,'2019-07-04 10:57:10','2019-07-04 10:57:10',0),(61,2,1,17,'2019-07-04 11:02:19','2019-07-04 11:02:19',0),(62,2,2,16,'2019-07-04 11:02:19','2019-07-04 11:02:19',0),(164,7,1,16,'2022-10-27 11:39:32','2022-10-27 11:39:32',0),(165,7,4,17,'2022-10-27 11:39:32','2022-10-27 11:39:32',0),(166,7,2,16,'2022-10-27 11:39:32','2022-10-27 11:39:32',0),(167,7,5,18,'2022-10-27 11:39:32','2022-10-27 11:39:32',0),(168,7,3,17,'2022-10-27 11:39:32','2022-10-27 11:39:32',0),(169,7,6,19,'2022-10-27 11:39:32','2022-10-27 11:39:32',0),(185,4,1,16,'2022-10-31 11:34:28','2022-10-31 11:34:28',0),(186,8,2,20,'2022-11-06 05:08:33','2022-11-06 05:08:33',0),(187,8,1,16,'2022-11-06 05:08:33','2022-11-06 05:08:33',0),(188,8,3,19,'2022-11-06 05:08:33','2022-11-06 05:08:33',0),(189,8,4,19,'2022-11-06 05:08:33','2022-11-06 05:08:33',0),(190,8,5,20,'2022-11-06 05:08:33','2022-11-06 05:08:33',0),(191,10,2,16,'2022-11-06 10:07:02','2022-11-06 10:07:02',0),(192,11,2,16,'2022-11-06 10:20:53','2022-11-06 10:20:53',0),(194,16,1,17,'2023-06-12 13:27:45','2023-06-12 13:27:45',1),(195,16,2,18,'2023-06-12 13:27:45','2023-06-12 13:27:45',2),(196,16,3,19,'2023-06-12 13:27:45','2023-06-12 13:27:45',3),(197,17,1,19,'2023-06-15 07:03:12','2023-06-15 07:03:12',1),(198,17,2,16,'2023-06-15 07:03:12','2023-06-15 07:03:12',2),(199,17,3,16,'2023-06-15 07:03:12','2023-06-15 07:03:12',2),(200,17,4,16,'2023-06-15 07:03:12','2023-06-15 07:03:12',2),(201,17,5,16,'2023-06-15 07:03:12','2023-06-15 07:03:12',2),(202,18,1,16,'2023-07-01 12:56:02','2023-07-01 12:56:02',1),(203,19,1,18,'2023-07-15 07:45:21','2023-07-15 07:45:21',1),(204,19,2,18,'2023-07-15 07:45:21','2023-07-15 07:45:21',2),(205,19,3,20,'2023-07-15 07:45:21','2023-07-15 07:45:21',3),(206,20,1,17,'2023-07-16 12:39:42','2023-07-16 12:39:42',1),(207,20,2,18,'2023-07-16 12:39:42','2023-07-16 12:39:42',1),(208,20,3,18,'2023-07-16 12:39:42','2023-07-16 12:39:42',3);
/*!40000 ALTER TABLE `BedTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bedroom`
--

DROP TABLE IF EXISTS `Bedroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bedroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bedroom`
--

LOCK TABLES `Bedroom` WRITE;
/*!40000 ALTER TABLE `Bedroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `Bedroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BlogDetails`
--

DROP TABLE IF EXISTS `BlogDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BlogDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageTitle` varchar(255) NOT NULL,
  `metaTitle` varchar(255) NOT NULL,
  `metaDescription` mediumtext NOT NULL,
  `pageUrl` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `isEnable` tinyint(1) NOT NULL DEFAULT 1,
  `footerCategory` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `isPrivate` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BlogDetails`
--

LOCK TABLES `BlogDetails` WRITE;
/*!40000 ALTER TABLE `BlogDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `BlogDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cancellation`
--

DROP TABLE IF EXISTS `Cancellation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cancellation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `policyName` varchar(255) NOT NULL,
  `policyContent` mediumtext DEFAULT NULL,
  `priorDays` int(11) NOT NULL,
  `accommodationPriorCheckIn` float NOT NULL,
  `accommodationBeforeCheckIn` float NOT NULL,
  `accommodationDuringCheckIn` float NOT NULL,
  `guestFeePriorCheckIn` float NOT NULL,
  `guestFeeBeforeCheckIn` float NOT NULL,
  `guestFeeDuringCheckIn` float NOT NULL,
  `hostFeePriorCheckIn` float NOT NULL,
  `hostFeeBeforeCheckIn` float NOT NULL,
  `hostFeeDuringCheckIn` float NOT NULL,
  `isEnable` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `nonRefundableNightsPriorCheckIn` int(11) DEFAULT 0,
  `nonRefundableNightsBeforeCheckIn` int(11) DEFAULT 1,
  `nonRefundableNightsDuringCheckIn` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cancellation`
--

LOCK TABLES `Cancellation` WRITE;
/*!40000 ALTER TABLE `Cancellation` DISABLE KEYS */;
INSERT INTO `Cancellation` VALUES (1,'Flexible','Cancel up to 1 day prior to arrival and get a 100% refund',1,100,100,100,100,100,0,100,100,100,1,'2017-06-09 22:43:35','2017-06-09 22:43:35',0,1,0),(2,'Moderate','Cancel up to 5 days prior to arrival and get a 50% refund',5,100,50,50,100,100,0,100,100,100,1,'2017-06-09 22:46:10','2017-06-09 22:46:10',0,1,0),(3,'Strict','Cancel up to 7 days prior to arrival and get a 50% refund',7,50,0,0,100,0,0,100,100,100,1,'2017-06-09 22:47:38','2017-06-09 22:47:38',0,0,0);
/*!40000 ALTER TABLE `Cancellation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CancellationDetails`
--

DROP TABLE IF EXISTS `CancellationDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CancellationDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservationId` int(11) NOT NULL,
  `cancellationPolicy` varchar(255) NOT NULL,
  `refundToGuest` float NOT NULL,
  `payoutToHost` float NOT NULL,
  `guestServiceFee` float NOT NULL,
  `hostServiceFee` float NOT NULL,
  `total` float NOT NULL,
  `currency` varchar(255) NOT NULL,
  `cancelledBy` enum('host','guest') DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reservationId` (`reservationId`),
  CONSTRAINT `CancellationDetails_ibfk_1` FOREIGN KEY (`reservationId`) REFERENCES `Reservation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CancellationDetails`
--

LOCK TABLES `CancellationDetails` WRITE;
/*!40000 ALTER TABLE `CancellationDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `CancellationDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Country`
--

DROP TABLE IF EXISTS `Country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `countryCode` varchar(255) NOT NULL,
  `countryName` varchar(255) NOT NULL,
  `isEnable` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime DEFAULT '2018-09-29 11:22:19',
  `updatedAt` datetime DEFAULT '2018-09-29 11:22:19',
  `dialCode` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Country`
--

LOCK TABLES `Country` WRITE;
/*!40000 ALTER TABLE `Country` DISABLE KEYS */;
INSERT INTO `Country` VALUES (1,'DZ','Algeria',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+213'),(2,'AF','Afghanistan',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+93'),(3,'AL','Albania',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+355'),(4,'AS','AmericanSamoa',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 684'),(5,'AD','Andorra',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+376'),(6,'AO','Angola',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+244'),(7,'AI','Anguilla',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 264'),(8,'AQ','Antarctica',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+672'),(9,'AG','Antigua and Barbuda',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1268'),(10,'AR','Argentina',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+54'),(11,'AM','Armenia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+374'),(12,'AW','Aruba',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+297'),(13,'AU','Australia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+61'),(14,'AT','Austria',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+43'),(15,'AZ','Azerbaijan',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+994'),(16,'BS','Bahamas',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 242'),(17,'BH','Bahrain',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+973'),(18,'BD','Bangladesh',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+880'),(19,'BB','Barbados',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 246'),(20,'BY','Belarus',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+375'),(21,'BE','Belgium',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+32'),(22,'BZ','Belize',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+501'),(23,'BJ','Benin',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+229'),(24,'BM','Bermuda',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 441'),(25,'BT','Bhutan',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+975'),(26,'BO','Bolivia, Plurinational State of',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+591'),(27,'BA','Bosnia and Herzegovina',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+387'),(28,'BW','Botswana',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+267'),(29,'BR','Brazil',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+55'),(30,'IO','British Indian Ocean Territory',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+246'),(31,'BN','Brunei Darussalam',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+673'),(32,'BG','Bulgaria',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+359'),(33,'BF','Burkina Faso',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+226'),(34,'BI','Burundi',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+257'),(35,'KH','Cambodia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+855'),(36,'CM','Cameroon',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+237'),(37,'CA','Canada',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1'),(38,'CV','Cape Verde',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+238'),(39,'KY','Cayman Islands',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+ 345'),(40,'CF','Central African Republic',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+236'),(41,'TD','Chad',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+235'),(42,'CL','Chile',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+56'),(43,'CN','China',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+86'),(44,'CX','Christmas Island',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+61'),(45,'CC','Cocos (Keeling) Islands',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+61'),(46,'CO','Colombia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+57'),(47,'KM','Comoros',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+269'),(48,'CG','Congo',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+242'),(49,'CD','Congo, The Democratic Republic of the',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+243'),(50,'CK','Cook Islands',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+682'),(51,'CR','Costa Rica',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+506'),(52,'CI','Cote d\'Ivoire',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+225'),(53,'HR','Croatia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+385'),(54,'CU','Cuba',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+53'),(55,'CY','Cyprus',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+357'),(56,'CZ','Czech Republic',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+420'),(57,'DK','Denmark',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+45'),(58,'DJ','Djibouti',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+253'),(59,'DM','Dominica',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 767'),(60,'DO','Dominican Republic',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 849'),(61,'EC','Ecuador',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+593'),(62,'EG','Egypt',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+20'),(63,'SV','El Salvador',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+503'),(64,'GQ','Equatorial Guinea',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+240'),(65,'ER','Eritrea',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+291'),(66,'EE','Estonia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+372'),(67,'ET','Ethiopia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+251'),(68,'FK','Falkland Islands (Malvinas)',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+500'),(69,'FO','Faroe Islands',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+298'),(70,'FJ','Fiji',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+679'),(71,'FI','Finland',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+358'),(72,'FR','France',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+33'),(73,'GF','French Guiana',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+594'),(74,'PF','French Polynesia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+689'),(75,'GA','Gabon',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+241'),(76,'GM','Gambia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+220'),(77,'GE','Georgia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+995'),(78,'DE','Germany',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+49'),(79,'GH','Ghana',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+233'),(80,'GI','Gibraltar',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+350'),(81,'GR','Greece',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+30'),(82,'GL','Greenland',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+299'),(83,'GD','Grenada',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 473'),(84,'GP','Guadeloupe',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+590'),(85,'GU','Guam',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 671'),(86,'GT','Guatemala',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+502'),(87,'GG','Guernsey',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+44'),(88,'GN','Guinea',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+224'),(89,'GW','Guinea-Bissau',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+245'),(90,'GY','Guyana',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+595'),(91,'HT','Haiti',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+509'),(92,'VA','Holy See (Vatican City State)',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+379'),(93,'HN','Honduras',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+504'),(94,'HK','Hong Kong',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+852'),(95,'HU','Hungary',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+36'),(96,'IS','Iceland',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+354'),(97,'IN','India',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+91'),(98,'ID','Indonesia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+62'),(99,'IR','Iran, Islamic Republic of',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+98'),(100,'IQ','Iraq',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+964'),(101,'IE','Ireland',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+353'),(102,'IM','Isle of Man',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+44'),(103,'IL','Israel',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+972'),(104,'IT','Italy',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+39'),(105,'JM','Jamaica',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 876'),(106,'JP','Japan',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+81'),(107,'JE','Jersey',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+44'),(108,'JO','Jordan',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+962'),(109,'KZ','Kazakhstan',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+7 7'),(110,'KE','Kenya',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+254'),(111,'KI','Kiribati',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+686'),(112,'KP','Korea, Democratic People\'s Republic of',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+850'),(113,'KR','Korea, Republic of',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+82'),(114,'KW','Kuwait',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+965'),(115,'KG','Kyrgyzstan',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+996'),(116,'LA','Lao People\'s Democratic Republic',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+856'),(117,'LV','Latvia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+371'),(118,'LB','Lebanon',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+961'),(119,'LS','Lesotho',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+266'),(120,'LR','Liberia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+231'),(121,'LY','Libyan Arab Jamahiriya',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+218'),(122,'LI','Liechtenstein',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+423'),(123,'LT','Lithuania',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+370'),(124,'LU','Luxembourg',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+352'),(125,'MO','Macao',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+853'),(126,'MK','Macedonia, The Former Yugoslav Republic of',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+389'),(127,'MG','Madagascar',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+261'),(128,'MW','Malawi',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+265'),(129,'MY','Malaysia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+60'),(130,'MV','Maldives',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+960'),(131,'ML','Mali',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+223'),(132,'MT','Malta',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+356'),(133,'MH','Marshall Islands',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+692'),(134,'MQ','Martinique',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+596'),(135,'MR','Mauritania',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+222'),(136,'MU','Mauritius',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+230'),(137,'YT','Mayotte',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+262'),(138,'MX','Mexico',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+52'),(139,'FM','Micronesia, Federated States of',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+691'),(140,'MD','Moldova, Republic of',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+373'),(141,'MC','Monaco',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+377'),(142,'MN','Mongolia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+976'),(143,'ME','Montenegro',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+382'),(144,'MS','Montserrat',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1664'),(145,'MA','Morocco',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+212'),(146,'MZ','Mozambique',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+258'),(147,'MM','Myanmar',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+95'),(148,'NA','Namibia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+264'),(149,'NR','Nauru',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+674'),(150,'NP','Nepal',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+977'),(151,'NL','Netherlands',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+31'),(152,'AN','Netherlands Antilles',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+599'),(153,'NC','New Caledonia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+687'),(154,'NZ','New Zealand',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+64'),(155,'NI','Nicaragua',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+505'),(156,'NE','Niger',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+227'),(157,'NG','Nigeria',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+234'),(158,'NU','Niue',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+683'),(159,'NF','Norfolk Island',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+672'),(160,'MP','Northern Mariana Islands',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 670'),(161,'NO','Norway',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+47'),(162,'OM','Oman',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+968'),(163,'PK','Pakistan',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+92'),(164,'PW','Palau',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+680'),(165,'PS','Palestinian Territory, Occupied',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+970'),(166,'PA','Panama',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+507'),(167,'PG','Papua New Guinea',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+675'),(168,'PY','Paraguay',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+595'),(169,'PE','Peru',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+51'),(170,'PH','Philippines',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+63'),(171,'PN','Pitcairn',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+872'),(172,'PL','Poland',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+48'),(173,'PT','Portugal',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+351'),(174,'PR','Puerto Rico',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 939'),(175,'QA','Qatar',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+974'),(176,'RO','Romania',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+40'),(177,'RU','Russia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+7'),(178,'RW','Rwanda',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+250'),(179,'RE','Réunion',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+262'),(180,'BL','Saint Barthélemy',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+590'),(181,'SH','Saint Helena, Ascension and Tristan Da Cunha',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+290'),(182,'KN','Saint Kitts and Nevis',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 869'),(183,'LC','Saint Lucia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 758'),(184,'MF','Saint Martin',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+590'),(185,'PM','Saint Pierre and Miquelon',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+508'),(186,'VC','Saint Vincent and the Grenadines',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 784'),(187,'WS','Samoa',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+685'),(188,'SM','San Marino',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+378'),(189,'ST','Sao Tome and Principe',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+239'),(190,'SA','Saudi Arabia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+966'),(191,'SN','Senegal',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+221'),(192,'RS','Serbia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+381'),(193,'SC','Seychelles',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+248'),(194,'SL','Sierra Leone',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+232'),(195,'SG','Singapore',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+65'),(196,'SK','Slovakia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+421'),(197,'SI','Slovenia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+386'),(198,'SB','Solomon Islands',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+677'),(199,'SO','Somalia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+252'),(200,'ZA','South Africa',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+27'),(201,'GS','South Georgia and the South Sandwich Islands',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+500'),(202,'ES','Spain',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+34'),(203,'LK','Sri Lanka',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+94'),(204,'SD','Sudan',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+249'),(205,'SR','Suriname',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+597'),(206,'SJ','Svalbard and Jan Mayen',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+47'),(207,'SZ','Swaziland',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+268'),(208,'SE','Sweden',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+46'),(209,'CH','Switzerland',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+41'),(210,'SY','Syrian Arab Republic',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+963'),(211,'TW','Taiwan, Province of China',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+886'),(212,'TJ','Tajikistan',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+992'),(213,'TZ','Tanzania, United Republic of',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+255'),(214,'TH','Thailand',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+66'),(215,'TL','Timor-Leste',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+670'),(216,'TG','Togo',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+228'),(217,'TK','Tokelau',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+690'),(218,'TO','Tonga',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+676'),(219,'TT','Trinidad and Tobago',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 868'),(220,'TN','Tunisia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+216'),(221,'TR','Turkey',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+90'),(222,'TM','Turkmenistan',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+993'),(223,'TC','Turks and Caicos Islands',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 649'),(224,'TV','Tuvalu',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+688'),(225,'UG','Uganda',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+256'),(226,'UA','Ukraine',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+380'),(227,'AE','United Arab Emirates',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+971'),(228,'GB','United Kingdom',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+44'),(229,'US','United States',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1'),(230,'UY','Uruguay',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+598'),(231,'UZ','Uzbekistan',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+998'),(232,'VU','Vanuatu',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+678'),(233,'VE','Venezuela, Bolivarian Republic of',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+58'),(234,'VN','Viet Nam',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+84'),(235,'VG','Virgin Islands, British',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 284'),(236,'VI','Virgin Islands, U.S.',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+1 340'),(237,'WF','Wallis and Futuna',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+681'),(238,'YE','Yemen',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+967'),(239,'ZM','Zambia',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+260'),(240,'ZW','Zimbabwe',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+263'),(241,'AX','Åland Islands',1,'2019-03-27 11:53:47','2018-09-29 11:22:19','+358');
/*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Coupon`
--

DROP TABLE IF EXISTS `Coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `startDate` datetime NOT NULL,
  `endDate` datetime DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` enum('fixed','percentage') NOT NULL,
  `amount` float NOT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `numOfUsage` int(11) NOT NULL DEFAULT 0,
  `maxNumberOfUsage` int(11) DEFAULT NULL,
  `isAvailable` tinyint(1) DEFAULT 1,
  `targetId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  UNIQUE KEY `Coupon_code_unique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Coupon`
--

LOCK TABLES `Coupon` WRITE;
/*!40000 ALTER TABLE `Coupon` DISABLE KEYS */;
INSERT INTO `Coupon` VALUES (1,'2022-11-05 00:00:00','2022-11-15 00:00:00','a1','this is my first coupon','fixed',200,'USD',1,5,NULL,1,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-05 10:00:59','2022-11-05 13:23:02'),(2,'2022-11-15 00:00:00','2022-11-26 00:00:00','a22','this is second one','fixed',100,'USD',1,0,NULL,0,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-15 15:57:50','2022-11-26 07:55:00'),(3,'2022-11-14 00:00:00','2022-12-19 00:00:00','a44','this is third one','fixed',200,'USD',0,6,NULL,0,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-15 15:59:37','2022-11-15 17:37:42'),(4,'2023-04-15 00:00:00','2023-05-09 00:00:00','SAR25',NULL,'percentage',25,'USD',1,0,NULL,0,NULL,'2023-04-15 17:32:34','2023-05-09 06:55:00'),(5,'2023-04-15 00:00:00','2023-05-17 00:00:00','SAR50',NULL,'percentage',50,'USD',1,0,NULL,0,NULL,'2023-04-15 17:39:27','2023-05-17 06:55:00');
/*!40000 ALTER TABLE `Coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Currencies`
--

DROP TABLE IF EXISTS `Currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `symbol` varchar(255) NOT NULL,
  `isEnable` tinyint(1) NOT NULL DEFAULT 1,
  `isBaseCurrency` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `isPayment` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Currencies`
--

LOCK TABLES `Currencies` WRITE;
/*!40000 ALTER TABLE `Currencies` DISABLE KEYS */;
INSERT INTO `Currencies` VALUES (1,'AUD',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',1),(2,'BGN',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',1),(3,'BRL',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',1),(4,'CAD',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(5,'CHF',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(6,'CNY',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(7,'CZK',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(8,'DKK',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(9,'EUR',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',1),(10,'GBP',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(11,'HKD',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(12,'HRK',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(13,'HUF',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(14,'IDR',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(15,'ILS',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(16,'INR',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(17,'JPY',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(18,'KRW',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(19,'MXN',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(20,'MYR',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(21,'NOK',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(22,'NZD',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(23,'PHP',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',1),(24,'PLN',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(25,'RON',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(26,'RUB',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',1),(27,'SEK',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0),(28,'SGD',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',1),(29,'THB',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',1),(30,'TRY',1,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',1),(31,'USD',1,1,'2019-03-27 11:53:47','2018-05-02 04:52:36',1),(32,'ZAR',0,0,'2019-03-27 11:53:47','2018-05-02 04:52:36',0);
/*!40000 ALTER TABLE `Currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CurrencyRates`
--

DROP TABLE IF EXISTS `CurrencyRates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CurrencyRates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currencyCode` varchar(255) NOT NULL,
  `rate` float NOT NULL,
  `isBase` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CurrencyRates`
--

LOCK TABLES `CurrencyRates` WRITE;
/*!40000 ALTER TABLE `CurrencyRates` DISABLE KEYS */;
INSERT INTO `CurrencyRates` VALUES (1,'AED',3.6731,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(2,'AFN',85.6045,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(3,'ALL',94.2148,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(4,'AMD',387.228,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(5,'ANG',1.79936,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(6,'AOA',824.771,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(7,'ARS',277.381,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(8,'AWG',1.8,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(9,'AZN',1.7,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(10,'BAM',1.7894,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(11,'BBD',2,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(12,'BDT',109.741,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(13,'BGN',1.7899,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(14,'BHD',0.377019,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(15,'BIF',2840.86,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(16,'BMD',1,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(17,'BND',1.34281,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(18,'BOB',6.93211,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(19,'BRL',4.81231,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(20,'BSD',1,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(21,'BTN',82.8335,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(22,'BWP',13.3563,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(23,'BYN',2.53314,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(24,'BYR',25331.4,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(25,'BZD',2.02228,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(26,'CAD',1.33665,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(27,'CDF',2451.88,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(28,'CHF',0.878535,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(29,'CLF',0.0306198,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(30,'CLP',846.199,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(31,'CNY',7.18071,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(32,'COP',4052.4,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(33,'CRC',545.841,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(34,'CUC',1,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(35,'CVE',100.774,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(36,'CZK',21.969,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(37,'DJF',178.197,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(38,'DKK',6.82387,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(39,'DOP',56.4637,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(40,'DZD',135.838,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(41,'EGP',30.9002,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(42,'ETB',55.2235,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(43,'EUR',0.915765,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(44,'FJD',2.25569,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(45,'FKP',0.787792,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(46,'GBP',0.787792,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(47,'GEL',2.60333,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(48,'GHS',11.2702,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(49,'GIP',0.787688,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(50,'GMD',60.8606,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(51,'GNF',8630.05,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(52,'GTQ',7.87972,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(53,'GYD',209.906,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(54,'HKD',7.80515,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(55,'HNL',24.6776,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(56,'HRK',6.89928,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(57,'HTG',136.943,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(58,'HUF',357.847,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(59,'IDR',15187.6,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(60,'ILS',3.67077,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(61,'INR',82.777,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(62,'IQD',1314.74,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(63,'ISK',132.51,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(64,'JMD',155.576,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(65,'JOD',0.708767,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(66,'JPY',142.943,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(67,'KES',142.843,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(68,'KGS',87.7569,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(69,'KHR',4144.97,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(70,'KMF',449.404,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(71,'KRW',1301.52,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(72,'KWD',0.307671,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(73,'KYD',0.83482,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(74,'KZT',445.601,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(75,'LAK',19432.2,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(76,'LBP',15032.9,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(77,'LKR',317.652,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(78,'LRD',186.473,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(79,'LSL',18.5077,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(80,'LYD',4.80185,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(81,'MAD',9.9153,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(82,'MDL',17.724,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(83,'MGA',4522.12,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(84,'MKD',56.2079,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(85,'MMK',2106.86,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(86,'MNT',3456.49,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(87,'MOP',8.05105,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(88,'MRO',380.943,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(89,'MUR',45.2537,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(90,'MVR',15.3657,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(91,'MWK',1054.07,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(92,'MXN',17.255,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(93,'MYR',4.55587,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(94,'MZN',63.7975,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(95,'NAD',18.4406,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(96,'NGN',768.089,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(97,'NIO',36.7075,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(98,'NOK',10.2894,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(99,'NPR',132.531,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(100,'NZD',1.64618,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(101,'OMR',0.385,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(102,'PAB',1,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(103,'PEN',3.65386,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(104,'PGK',3.63147,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(105,'PHP',55.5221,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(106,'PKR',285.008,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(107,'PLN',4.07842,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(108,'PYG',7294.92,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(109,'QAR',3.64768,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(110,'RON',4.52063,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(111,'RSD',107.365,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(112,'RUB',93.5047,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(113,'RWF',1179.62,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(114,'SAR',3.75129,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(115,'SBD',8.36879,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(116,'SCR',13.2264,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(117,'SDG',601.5,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(118,'SEK',10.731,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(119,'SHP',0.787688,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(120,'SKK',27.5872,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(121,'SLL',20359.8,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(122,'SOS',570.711,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(123,'SRD',38.3999,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(124,'STD',22309.8,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(125,'SVC',8.76585,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(126,'SZL',18.5155,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(127,'THB',34.6323,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(128,'TJS',11.0044,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(129,'TMT',3.5,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(130,'TND',3.08696,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(131,'TOP',2.36497,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(132,'TRY',26.9882,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(133,'TTD',6.81428,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(134,'TWD',31.6668,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(135,'TZS',2461.25,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(136,'UAH',36.969,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(137,'UGX',3624.02,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(138,'UYU',37.5359,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(139,'UZS',11696.7,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(140,'VES',29.6379,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(141,'VND',23759.1,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(142,'VUV',115.931,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(143,'WST',2.73728,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(144,'XAF',602.587,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(145,'XAG',0.0423876,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(146,'XAU',0.000516247,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(147,'XCD',2.70128,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(148,'XOF',609.193,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(149,'XPD',0.00081465,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(150,'XPF',109.278,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(151,'XPT',0.00108454,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(152,'YER',250.31,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(153,'ZAR',18.5987,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(154,'ZMK',5252.55,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(155,'ZMW',19.234,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(156,'JEP',0.787792,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(157,'GGP',0.787688,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(158,'IMP',0.787688,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(159,'CNH',7.19966,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(160,'EEK',14.328,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(161,'LTL',3.16182,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(162,'LVL',0.643576,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(163,'TMM',17500,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(164,'ZWD',374.8,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(165,'VEF',2961770,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(166,'SGD',1.34348,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(167,'AUD',1.53139,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(168,'USD',1,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(169,'BTC',0.0000344692,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(170,'BCH',0.00440296,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(171,'BSV',0.0280218,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(172,'ETH',0.000546229,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(173,'ETH2',0.000546229,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(174,'ETC',0.0558191,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(175,'LTC',0.0116863,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(176,'ZRX',4.57526,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(177,'USDC',1,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(178,'BAT',4.83571,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(179,'LOOM',21.5365,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(180,'MANA',2.69869,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(181,'KNC',1.38523,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(182,'LINK',0.137137,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(183,'DNT',35.9712,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(184,'MKR',0.000775771,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(185,'CVC',11.8343,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(186,'OMG',1.83557,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(187,'GNT',4.8183,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(188,'DAI',1.00005,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(189,'SNT',39.8804,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(190,'ZEC',0.0339155,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(191,'XRP',1.49365,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(192,'REP',0.650081,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(193,'XLM',7.00211,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(194,'EOS',1.38764,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(195,'XTZ',1.21139,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(196,'ALGO',9.41177,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(197,'DASH',0.0314169,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(198,'ATOM',0.11554,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(199,'OXT',18.9215,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(200,'COMP',0.0168862,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(201,'ENJ',3.45423,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(202,'REPV2',0.650081,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(203,'BAND',0.829531,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(204,'NMR',0.075815,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(205,'CGLD',1.93611,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(206,'UMA',0.635324,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(207,'LRC',4.73821,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(208,'YFI',0.000156882,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(209,'UNI',0.16284,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(210,'BAL',0.234742,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(211,'REN',17.1969,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(212,'WBTC',0.0000344268,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(213,'NU',13.5178,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(214,'YFII',0.00138664,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(215,'FIL',0.236714,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(216,'AAVE',0.0157493,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(217,'BNT',2.76396,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(218,'GRT',9.24642,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(219,'SNX',0.412712,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(220,'STORJ',3.42056,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(221,'SUSHI',1.39344,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(222,'MATIC',1.48765,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(223,'SKL',36.1664,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(224,'ADA',3.38926,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(225,'ANKR',40.8831,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(226,'CRV',1.72354,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(227,'ICP',0.243309,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(228,'NKN',10.7009,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(229,'OGN',9.5735,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(230,'1INCH',3.2,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(231,'USDT',1.00095,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(232,'FORTH',0.315457,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(233,'CTSI',7.00035,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(234,'TRB',0.0839983,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(235,'POLY',6.84229,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(236,'MIR',32.8845,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(237,'RLC',0.849979,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(238,'DOT',0.19992,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(239,'SOL',0.0440723,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(240,'DOGE',13.5135,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(241,'MLN',0.0556638,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(242,'GTC',1.01523,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(243,'AMP',366.972,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(244,'SHIB',121729,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(245,'CHZ',13.0804,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(246,'KEEP',9.14997,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(247,'LPT',0.250941,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(248,'QNT',0.00959831,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(249,'BOND',0.338983,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(250,'RLY',154.296,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(251,'CLV',27.6625,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(252,'FARM',0.0409584,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(253,'MASK',0.292826,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(254,'ANT',0.225479,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(255,'FET',4.92975,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(256,'PAX',1.00548,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(257,'ACH',57.0386,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(258,'ASM',92.081,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(259,'PLA',5.9312,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(260,'RAI',0.364299,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(261,'TRIBE',3.53412,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(262,'ORN',1.60385,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(263,'IOTX',53.376,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(264,'UST',85.2878,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(265,'QUICK',0.0192994,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(266,'AXS',0.171233,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(267,'REQ',13.459,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(268,'WLUNA',13058.6,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(269,'TRU',29.985,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(270,'RAD',0.645161,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(271,'COTI',21.7865,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(272,'DDX',3.56952,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(273,'SUKU',21.3904,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(274,'RGT',0.858146,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(275,'XYO',283.688,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(276,'ZEN',0.108225,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(277,'AST',9.42951,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(278,'AUCTION',0.163934,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(279,'BUSD',1.00049,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(280,'JASMY',264.55,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(281,'WCFG',3.52734,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(282,'BTRST',3.62976,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(283,'AGLD',1.62035,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(284,'AVAX',0.0805477,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(285,'FX',7.0922,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(286,'TRAC',3.76081,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(287,'LCX',22.0507,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(288,'ARPA',19.9402,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(289,'BADGER',0.472813,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(290,'KRL',4.20345,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(291,'PERP',1.9998,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(292,'RARI',0.943396,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(293,'DESO',0.111794,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(294,'API3',1.03146,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(295,'NCT',104.932,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(296,'SHPING',375.305,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(297,'UPI',683.924,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(298,'CRO',16.9492,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(299,'MTL',0.691324,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(300,'ABT',12.0192,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(301,'CVX',0.32515,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(302,'AVT',1.06952,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(303,'MDT',21.561,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(304,'VGX',6.40615,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(305,'ALCX',0.079968,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(306,'COVAL',119.832,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(307,'FOX',53.4759,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(308,'MUSD',1.00337,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(309,'CELR',70.5219,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(310,'GALA',43.317,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(311,'POWR',6.34115,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(312,'GYEN',143.4,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(313,'ALICE',1.06667,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(314,'INV',0.027038,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(315,'LQTY',0.958635,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(316,'PRO',2.82965,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(317,'SPELL',2168.96,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(318,'ENS',0.107296,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(319,'DIA',4.10315,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(320,'BLZ',19.4742,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(321,'CTX',0.925926,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(322,'ERN',0.58651,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(323,'IDEX',20.2224,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(324,'MCO2',0.884956,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(325,'POLS',3.23782,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(326,'SUPER',11.0846,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(327,'UNFI',0.294551,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(328,'STX',1.63881,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(329,'KSM',0.0426439,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(330,'GODS',6.62339,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(331,'IMX',1.3336,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(332,'RBN',5.0226,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(333,'BICO',4.65766,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(334,'GFI',2.48478,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(335,'ATA',12.4844,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(336,'GLM',4.8216,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(337,'MPL',0.180995,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(338,'PLU',0.136519,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(339,'SWFTC',753.58,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(340,'SAND',2.45188,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(341,'OCEAN',2.92013,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(342,'GNO',0.00891742,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(343,'FIDA',4.83325,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(344,'ORCA',1.19753,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(345,'CRPT',10.8814,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(346,'QSP',89.1266,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(347,'RNDR',0.571478,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(348,'NEST',96.6651,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(349,'PRQ',11.1483,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(350,'HOPR',21.8341,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(351,'JUP',203.832,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(352,'MATH',13.1926,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(353,'SYN',1.67926,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(354,'AIOZ',74.9064,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(355,'WAMPL',0.301205,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(356,'AERGO',9.24642,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(357,'INDEX',0.722022,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(358,'TONE',114.416,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(359,'HIGH',0.832986,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(360,'GUSD',1.0005,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(361,'FLOW',1.76367,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(362,'ROSE',21.2879,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(363,'OP',0.604595,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(364,'APE',0.563222,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(365,'MINA',2.31214,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(366,'MUSE',0.179905,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(367,'SYLO',734.214,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(368,'CBETH',0.000523292,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(369,'DREP',3.86922,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(370,'ELA',0.80032,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(371,'FORT',7.46547,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(372,'ALEPH',14.0252,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(373,'DEXT',1.69563,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(374,'FIS',3.76223,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(375,'BIT',1.92382,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(376,'GMT',4.85084,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(377,'GST',78.5299,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(378,'MEDIA',0.136054,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(379,'C98',7.44602,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(380,'ARB',0.88806,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(381,'T',42.9185,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(382,'APT',0.146092,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(383,'AXL',2.55984,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(384,'HBAR',18.6515,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(385,'FLR',69.541,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(386,'SUI',1.66875,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(387,'PNG',41.1015,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(388,'MULTI',0.601866,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(389,'OSMO',2.13927,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(390,'WAXL',2.55984,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(391,'EUROC',0.915541,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(392,'DAR',10.1523,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(393,'TIME',0.0577034,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(394,'SPA',212.404,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(395,'MAGIC',1.39978,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(396,'AUDIO',5.84454,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(397,'TVK',41.2456,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(398,'XMON',0.000829081,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(399,'INJ',0.126191,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(400,'GAL',0.851064,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(401,'LDO',0.542005,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(402,'GHST',1.08342,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(403,'ILV',0.024558,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(404,'MXC',107.009,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(405,'LIT',1.48954,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(406,'PUNDIX',2.56706,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(407,'PRIME',0.506714,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(408,'AURORA',14.1844,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(409,'BOBA',7.32869,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(410,'MONA',0.00260004,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(411,'POND',122.624,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(412,'NEAR',0.719424,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(413,'PYR',0.32352,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(414,'VOXEL',7.60746,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(415,'RPL',0.0349101,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(416,'ACS',497.463,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(417,'MSOL',0.0392003,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(418,'MNDE',19.7453,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(419,'EGLD',0.0320564,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(420,'KAVA',1.1722,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(421,'LSETH',0.000532849,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(422,'OOKI',342.877,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(423,'STG',1.696,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(424,'QI',172.161,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(425,'RARE',14.0647,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(426,'HFT',2.92227,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(427,'LOKA',4.60087,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(428,'XCN',975.61,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(429,'HNT',0.543626,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(430,'METIS',0.0656814,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(431,'DYP',6.76178,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(432,'BLUR',3.36191,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(433,'00',11.5942,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(434,'DIMO',11.9998,0,'2023-08-03 08:00:00','2023-08-03 08:00:00'),(435,'USD',1,1,'2023-08-03 08:00:00','2023-08-03 08:00:00');
/*!40000 ALTER TABLE `CurrencyRates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DocumentVerification`
--

DROP TABLE IF EXISTS `DocumentVerification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DocumentVerification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `fileName` varchar(255) DEFAULT NULL,
  `fileType` varchar(255) DEFAULT NULL,
  `documentStatus` enum('pending','approved') DEFAULT 'pending',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DocumentVerification`
--

LOCK TABLES `DocumentVerification` WRITE;
/*!40000 ALTER TABLE `DocumentVerification` DISABLE KEYS */;
/*!40000 ALTER TABLE `DocumentVerification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EmailToken`
--

DROP TABLE IF EXISTS `EmailToken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EmailToken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` char(36) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `EmailToken_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EmailToken`
--

LOCK TABLES `EmailToken` WRITE;
/*!40000 ALTER TABLE `EmailToken` DISABLE KEYS */;
INSERT INTO `EmailToken` VALUES (1,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','demo@radicalstart.com','1553672955896','2019-03-27 07:49:16','2019-03-27 07:49:16'),(2,'977bc550-5069-11e9-a14e-635e0fd3bfa6','qa@radicalstart.com','1553675005475','2019-03-27 08:23:25','2019-03-27 08:23:25'),(3,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','abdelrhman.sapry.alwtany@gmail.com','1660320629326','2022-08-12 16:10:29','2022-08-12 16:10:29'),(4,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','ahmedtaha200079@gmail.com','1663518217469','2022-09-18 16:23:37','2022-09-18 16:23:37'),(5,'2d47f470-dc78-11ed-8493-97c361d41aef','demo2@gmail.com','1681664423223','2023-04-16 17:00:23','2023-04-16 17:00:23'),(6,'686d5a50-f3c4-11ed-bd2e-539a1d889026','hhhh@gmail.com','1684226040948','2023-05-16 08:34:00','2023-05-16 08:34:00'),(7,'a9ecf070-f497-11ed-bd2e-539a1d889026','test2@gmail.com','1684316774647','2023-05-17 09:46:14','2023-05-17 09:46:14'),(8,'216a4e80-f79b-11ed-bd2e-539a1d889026','test5@gmail.com','1684648117096','2023-05-21 05:48:37','2023-05-21 05:48:37'),(9,'b15ebb70-f7aa-11ed-bd2e-539a1d889026','teet4@gmail.com','1684654801062','2023-05-21 07:40:01','2023-05-21 07:40:01'),(10,'58c66a20-f7ab-11ed-bd2e-539a1d889026','teet1@gmail.com','1684655081922','2023-05-21 07:44:41','2023-05-21 07:44:41'),(11,'c4bb2220-f7ab-11ed-bd2e-539a1d889026','teet5@gmail.com','1684655263042','2023-05-21 07:47:43','2023-05-21 07:47:43'),(12,'9d1f15d0-005e-11ee-8c2a-c142d6c35686','demo44@gmail.com','1685611685804','2023-06-01 09:28:05','2023-06-01 09:28:05'),(13,'fc1aba80-005e-11ee-8c2a-c142d6c35686','demo45@gmail.com','1685611845159','2023-06-01 09:30:45','2023-06-01 09:30:45'),(14,'2cd07c00-10e5-11ee-bd2e-539a1d889026','aaa@gmail.com','1687428698048','2023-06-22 10:11:38','2023-06-22 10:11:38'),(15,'9c276d50-14c0-11ee-a424-bd24a6095848','rabahnasi@gmail.com','1687852798116','2023-06-27 07:59:58','2023-06-27 07:59:58'),(16,'1a0dd610-20c3-11ee-bd2e-539a1d889026','hhh@gmail.com','1689173282288','2023-07-12 14:48:02','2023-07-12 14:48:02'),(17,'493f7c90-2b8b-11ee-a6e6-c97f3307257b','basel.nanaa71@gmail.com','1690358772440','2023-07-26 08:06:12','2023-07-26 08:06:12'),(18,'ecba1810-2c87-11ee-b289-61fce239156d','abdalrazak.it@gmail.com','1690467279861','2023-07-27 14:14:39','2023-07-27 14:14:39');
/*!40000 ALTER TABLE `EmailToken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FailedTransactionHistory`
--

DROP TABLE IF EXISTS `FailedTransactionHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FailedTransactionHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservationId` int(11) NOT NULL,
  `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `amount` float NOT NULL,
  `currency` varchar(255) NOT NULL,
  `reason` text NOT NULL,
  `transactionId` varchar(255) DEFAULT NULL,
  `paymentMethodId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reservationId` (`reservationId`),
  CONSTRAINT `failedtransactionhistory_ibfk_1` FOREIGN KEY (`reservationId`) REFERENCES `Reservation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FailedTransactionHistory`
--

LOCK TABLES `FailedTransactionHistory` WRITE;
/*!40000 ALTER TABLE `FailedTransactionHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `FailedTransactionHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FooterBlock`
--

DROP TABLE IF EXISTS `FooterBlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FooterBlock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title1` varchar(255) NOT NULL,
  `content1` text NOT NULL,
  `title2` varchar(255) NOT NULL,
  `content2` text NOT NULL,
  `title3` varchar(255) NOT NULL,
  `content3` text NOT NULL,
  `isEnable` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FooterBlock`
--

LOCK TABLES `FooterBlock` WRITE;
/*!40000 ALTER TABLE `FooterBlock` DISABLE KEYS */;
INSERT INTO `FooterBlock` VALUES (1,'24/7 customer support','If you need help while traveling or hosting, contact us at our toll free number: 000 000 0000 000','6,00,00,000 host guarantee','Hosts are protected against property damages for up to 6,00,00,000.','Verified ID','We aim to build a trusted community by giving you more info when youre deciding who to host or stay with.',1,'2018-05-22 11:12:19','2018-05-23 05:37:44'),(2,'one','hkh','one ','jkjh','one ','nknk',1,'2018-05-22 11:14:18','2018-05-22 11:14:18'),(3,'one','hkhih','one ','nhjlkhk','one ','klnklh',1,'2018-05-22 11:15:07','2018-05-22 11:15:07'),(4,'fdf','fdsfds','fdsfd','fdsfds','fdsff','fdssdfds',1,'2018-05-22 11:34:58','2018-05-22 11:34:58'),(5,'fdf','fdsfds','fdsfd','fdsfds','fdsff','fdss',1,'2018-05-22 11:35:14','2018-05-22 11:35:14'),(6,'fdf','fdsfds','fdsf','fdsfd','fds','fdss',1,'2018-05-22 11:39:06','2018-05-22 11:39:06');
/*!40000 ALTER TABLE `FooterBlock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ForgotPassword`
--

DROP TABLE IF EXISTS `ForgotPassword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ForgotPassword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` char(36) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `ForgotPassword_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ForgotPassword`
--

LOCK TABLES `ForgotPassword` WRITE;
/*!40000 ALTER TABLE `ForgotPassword` DISABLE KEYS */;
INSERT INTO `ForgotPassword` VALUES (1,'2d47f470-dc78-11ed-8493-97c361d41aef','demo2@gmail.com','1684312757333','2023-05-17 08:39:17','2023-05-17 08:39:17');
/*!40000 ALTER TABLE `ForgotPassword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HomeBanner`
--

DROP TABLE IF EXISTS `HomeBanner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HomeBanner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `enable` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HomeBanner`
--

LOCK TABLES `HomeBanner` WRITE;
/*!40000 ALTER TABLE `HomeBanner` DISABLE KEYS */;
INSERT INTO `HomeBanner` VALUES (1,'818214bdca262e754911eb475382f629.jpeg',1,'2019-09-06 06:47:24','2019-09-06 06:47:24'),(2,'a6d84b2d66e7362ce92066073bd80b00.jpeg',1,'2019-09-06 06:47:24','2019-09-06 06:47:24'),(3,'368bae930482d951c44ff6585787944e.jpeg',1,'2019-09-06 06:47:24','2019-09-06 06:47:24'),(4,'610723903989676c52e84d33248546e1.jpeg',1,'2019-09-06 06:47:24','2019-09-06 06:47:24');
/*!40000 ALTER TABLE `HomeBanner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImageBanner`
--

DROP TABLE IF EXISTS `ImageBanner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImageBanner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `buttonLabel` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImageBanner`
--

LOCK TABLES `ImageBanner` WRITE;
/*!40000 ALTER TABLE `ImageBanner` DISABLE KEYS */;
INSERT INTO `ImageBanner` VALUES (1,'Lorem Ipsum is simply dummy text','Lorem Ipsum is simply dummy text of the printing and typesetting industry.','Lorem Ipsum','e2a09ac3819002edffd36a2d61e8c5c5.jpeg','2019-03-27 11:53:47','2019-07-04 11:11:08');
/*!40000 ALTER TABLE `ImageBanner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ListBlockedDates`
--

DROP TABLE IF EXISTS `ListBlockedDates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListBlockedDates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `reservationId` int(11) DEFAULT NULL,
  `blockedDates` date NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `calendarId` int(11) DEFAULT NULL,
  `calendarStatus` enum('available','blocked','reservation') DEFAULT NULL,
  `isSpecialPrice` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listId` (`listId`),
  KEY `reservationId` (`reservationId`),
  CONSTRAINT `ListBlockedDates_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ListBlockedDates_ibfk_2` FOREIGN KEY (`reservationId`) REFERENCES `Reservation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=653 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ListBlockedDates`
--

LOCK TABLES `ListBlockedDates` WRITE;
/*!40000 ALTER TABLE `ListBlockedDates` DISABLE KEYS */;
INSERT INTO `ListBlockedDates` VALUES (122,4,NULL,'2022-10-21','2022-10-20 17:24:29','2022-10-20 17:24:29',NULL,'blocked',NULL),(123,4,NULL,'2022-10-22','2022-10-20 17:24:47','2022-10-20 17:24:47',NULL,'blocked',NULL),(124,4,NULL,'2022-10-23','2022-10-20 17:24:57','2022-10-20 17:24:57',NULL,'blocked',NULL),(125,4,NULL,'2022-10-25','2022-10-20 17:30:29','2022-10-20 17:30:29',NULL,'blocked',NULL),(126,4,NULL,'2022-10-27','2022-10-20 17:30:46','2022-10-20 17:30:46',NULL,'available',670),(127,4,NULL,'2022-10-28','2022-10-20 17:30:46','2022-10-20 17:30:46',NULL,'available',670),(128,4,NULL,'2022-10-29','2022-10-20 17:31:45','2022-10-20 17:31:45',NULL,'available',760),(129,4,NULL,'2022-11-02','2022-10-20 17:41:59','2022-10-20 17:41:59',NULL,'blocked',NULL),(130,4,NULL,'2022-11-03','2022-10-20 17:41:59','2022-10-20 17:41:59',NULL,'blocked',NULL),(131,4,NULL,'2022-11-04','2022-10-22 06:49:32','2022-10-22 06:49:32',NULL,'available',760),(132,4,NULL,'2022-11-05','2022-10-22 06:49:51','2022-10-22 06:49:51',NULL,'available',800),(133,4,NULL,'2022-11-06','2022-10-22 06:50:29','2022-10-22 06:50:29',NULL,'available',670),(134,4,NULL,'2022-11-07','2022-10-22 06:51:09','2022-10-22 06:51:09',NULL,'available',800),(135,4,NULL,'2022-11-08','2022-10-22 06:53:18','2022-10-22 06:53:18',NULL,'available',880),(136,4,NULL,'2022-11-09','2022-10-22 06:58:54','2022-10-22 06:58:54',NULL,'available',760),(137,4,NULL,'2022-11-10','2022-10-22 07:00:55','2022-10-22 07:00:55',NULL,'available',670),(138,4,NULL,'2022-11-11','2022-10-22 07:03:02','2022-10-22 07:03:02',NULL,'available',600),(139,4,NULL,'2022-11-12','2022-10-22 07:04:55','2022-10-22 07:04:55',NULL,'available',760),(140,4,NULL,'2022-11-13','2022-10-22 07:07:58','2022-10-22 07:07:58',NULL,'available',760),(141,4,NULL,'2022-11-14','2022-10-22 07:07:58','2022-10-22 07:07:58',NULL,'available',760),(142,4,NULL,'2022-11-15','2022-10-22 07:08:29','2022-10-22 07:08:29',NULL,'available',800),(146,6,66,'2022-10-28','2022-10-24 17:26:13','2022-10-24 17:26:13',NULL,'blocked',NULL),(147,6,66,'2022-10-27','2022-10-24 17:26:13','2022-10-24 17:26:13',NULL,'blocked',NULL),(148,4,NULL,'2022-12-01','2022-10-25 10:50:30','2022-10-25 10:50:30',NULL,'blocked',NULL),(149,4,NULL,'2022-12-05','2022-10-25 10:50:30','2022-10-25 10:50:30',NULL,'blocked',NULL),(150,4,NULL,'2022-12-04','2022-10-25 10:50:30','2022-10-25 10:50:30',NULL,'blocked',NULL),(151,4,NULL,'2022-12-02','2022-10-25 10:50:30','2022-10-25 10:50:30',NULL,'blocked',NULL),(152,4,NULL,'2022-12-06','2022-10-25 10:50:30','2022-10-25 10:50:30',NULL,'blocked',NULL),(153,4,NULL,'2022-12-03','2022-10-25 10:50:30','2022-10-25 10:50:30',NULL,'blocked',NULL),(154,8,NULL,'2022-12-05','2022-10-25 10:50:30','2022-10-25 10:50:30',NULL,'blocked',NULL),(155,8,NULL,'2022-12-04','2022-10-25 10:50:30','2022-10-25 10:50:30',NULL,'blocked',NULL),(156,8,NULL,'2022-12-01','2022-10-25 10:50:30','2022-10-25 10:50:30',NULL,'blocked',NULL),(157,8,NULL,'2023-01-06','2022-10-25 10:50:30','2022-10-25 10:50:30',NULL,'blocked',NULL),(158,8,NULL,'2022-12-02','2022-10-25 10:50:30','2022-10-25 10:50:30',NULL,'blocked',NULL),(159,8,NULL,'2022-12-03','2022-10-25 10:50:30','2022-10-25 10:50:30',NULL,'blocked',NULL),(176,8,NULL,'2022-12-18','2022-10-30 12:04:00','2022-10-30 12:04:00',NULL,'blocked',NULL),(177,8,NULL,'2022-12-15','2022-10-30 12:04:00','2022-10-30 12:04:00',NULL,'blocked',NULL),(178,8,NULL,'2022-12-16','2022-10-30 12:04:00','2022-10-30 12:04:00',NULL,'blocked',NULL),(179,8,NULL,'2022-12-17','2022-10-30 12:04:00','2022-10-30 12:04:00',NULL,'blocked',NULL),(180,8,NULL,'2022-12-19','2022-10-30 12:04:00','2022-10-30 12:04:00',NULL,'blocked',NULL),(181,4,NULL,'2022-12-18','2022-10-30 12:04:00','2022-10-30 12:04:00',NULL,'blocked',NULL),(182,4,NULL,'2022-12-15','2022-10-30 12:04:00','2022-10-30 12:04:00',NULL,'blocked',NULL),(183,4,NULL,'2022-12-17','2022-10-30 12:04:00','2022-10-30 12:04:00',NULL,'blocked',NULL),(184,4,NULL,'2022-12-19','2022-10-30 12:04:00','2022-10-30 12:04:00',NULL,'blocked',NULL),(185,4,NULL,'2022-12-16','2022-10-30 12:04:00','2022-10-30 12:04:00',NULL,'blocked',NULL),(269,8,NULL,'2023-02-08','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(270,8,NULL,'2023-02-09','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(271,8,NULL,'2023-02-07','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(272,8,NULL,'2023-02-06','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(273,8,NULL,'2023-02-13','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(274,8,NULL,'2023-02-10','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(275,8,NULL,'2023-02-15','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(276,8,NULL,'2023-02-12','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(277,8,NULL,'2023-02-11','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(278,8,NULL,'2023-02-14','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(279,4,NULL,'2023-02-09','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(280,4,NULL,'2023-02-07','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(281,4,NULL,'2023-02-06','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(282,4,NULL,'2023-02-08','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(283,4,NULL,'2023-02-15','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(284,4,NULL,'2023-02-13','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(285,4,NULL,'2023-02-10','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(286,4,NULL,'2023-02-14','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(287,4,NULL,'2023-02-12','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(288,4,NULL,'2023-02-11','2022-10-31 11:24:00','2022-10-31 11:24:00',NULL,'blocked',NULL),(369,4,81,'2023-03-04','2022-10-31 14:46:26','2022-10-31 14:46:28',NULL,'blocked',NULL),(370,4,81,'2023-03-02','2022-10-31 14:46:26','2022-10-31 14:46:28',NULL,'blocked',NULL),(371,4,81,'2023-03-05','2022-10-31 14:46:26','2022-10-31 14:46:28',NULL,'blocked',NULL),(372,4,81,'2023-03-03','2022-10-31 14:46:26','2022-10-31 14:46:28',NULL,'blocked',NULL),(373,4,81,'2023-03-06','2022-10-31 14:46:26','2022-10-31 14:46:28',NULL,'blocked',NULL),(374,4,81,'2023-03-07','2022-10-31 14:46:26','2022-10-31 14:46:28',NULL,'blocked',NULL),(375,4,81,'2023-03-08','2022-10-31 14:46:26','2022-10-31 14:46:28',NULL,'blocked',NULL),(376,8,NULL,'2023-03-03','2022-10-31 14:46:28','2022-10-31 14:46:28',NULL,'blocked',NULL),(377,8,NULL,'2023-03-04','2022-10-31 14:46:28','2022-10-31 14:46:28',NULL,'blocked',NULL),(378,8,NULL,'2023-03-02','2022-10-31 14:46:28','2022-10-31 14:46:28',NULL,'blocked',NULL),(379,8,NULL,'2023-03-06','2022-10-31 14:46:28','2022-10-31 14:46:28',NULL,'blocked',NULL),(380,8,NULL,'2023-03-05','2022-10-31 14:46:28','2022-10-31 14:46:28',NULL,'blocked',NULL),(381,8,NULL,'2023-03-07','2022-10-31 14:46:28','2022-10-31 14:46:28',NULL,'blocked',NULL),(382,8,NULL,'2023-03-08','2022-10-31 14:46:28','2022-10-31 14:46:28',NULL,'blocked',NULL),(383,4,NULL,'2023-03-09','2022-10-31 14:46:28','2022-10-31 14:46:28',NULL,'blocked',NULL),(384,8,NULL,'2023-03-09','2022-10-31 14:46:28','2022-10-31 14:46:28',NULL,'blocked',NULL),(385,4,84,'2023-03-13','2022-11-04 17:30:50','2022-11-04 17:30:52',NULL,'blocked',NULL),(386,4,84,'2023-03-12','2022-11-04 17:30:50','2022-11-04 17:30:52',NULL,'blocked',NULL),(387,4,84,'2023-03-11','2022-11-04 17:30:50','2022-11-04 17:30:52',NULL,'blocked',NULL),(388,4,84,'2023-03-14','2022-11-04 17:30:50','2022-11-04 17:30:52',NULL,'blocked',NULL),(389,4,84,'2023-03-15','2022-11-04 17:30:50','2022-11-04 17:30:52',NULL,'blocked',NULL),(390,4,84,'2023-03-10','2022-11-04 17:30:50','2022-11-04 17:30:52',NULL,'blocked',NULL),(391,4,84,'2023-03-16','2022-11-04 17:30:50','2022-11-04 17:30:52',NULL,'blocked',NULL),(392,4,84,'2023-03-17','2022-11-04 17:30:50','2022-11-04 17:30:52',NULL,'blocked',NULL),(393,8,NULL,'2023-03-13','2022-11-04 17:30:52','2022-11-04 17:30:52',NULL,'blocked',NULL),(394,8,NULL,'2023-03-11','2022-11-04 17:30:52','2022-11-04 17:30:52',NULL,'blocked',NULL),(395,8,NULL,'2023-03-17','2022-11-04 17:30:52','2022-11-04 17:30:52',NULL,'blocked',NULL),(396,4,NULL,'2023-03-18','2022-11-04 17:30:52','2022-11-04 17:30:52',NULL,'blocked',NULL),(397,8,NULL,'2023-03-12','2022-11-04 17:30:52','2022-11-04 17:30:52',NULL,'blocked',NULL),(398,8,NULL,'2023-03-10','2022-11-04 17:30:52','2022-11-04 17:30:52',NULL,'blocked',NULL),(399,8,NULL,'2023-03-14','2022-11-04 17:30:52','2022-11-04 17:30:52',NULL,'blocked',NULL),(400,8,NULL,'2023-03-15','2022-11-04 17:30:52','2022-11-04 17:30:52',NULL,'blocked',NULL),(401,8,NULL,'2023-03-16','2022-11-04 17:30:52','2022-11-04 17:30:52',NULL,'blocked',NULL),(402,8,NULL,'2023-03-18','2022-11-04 17:30:52','2022-11-04 17:30:52',NULL,'blocked',NULL),(475,4,89,'2023-05-03','2022-11-05 13:23:05','2022-11-05 13:23:07',NULL,'blocked',NULL),(476,4,89,'2023-05-01','2022-11-05 13:23:05','2022-11-05 13:23:07',NULL,'blocked',NULL),(477,4,89,'2023-05-02','2022-11-05 13:23:05','2022-11-05 13:23:07',NULL,'blocked',NULL),(478,4,89,'2023-05-04','2022-11-05 13:23:05','2022-11-05 13:23:07',NULL,'blocked',NULL),(479,4,89,'2023-05-05','2022-11-05 13:23:05','2022-11-05 13:23:07',NULL,'blocked',NULL),(480,4,89,'2023-05-07','2022-11-05 13:23:05','2022-11-05 13:23:07',NULL,'blocked',NULL),(481,4,89,'2023-05-06','2022-11-05 13:23:05','2022-11-05 13:23:07',NULL,'blocked',NULL),(482,4,89,'2023-05-08','2022-11-05 13:23:05','2022-11-05 13:23:07',NULL,'blocked',NULL),(483,8,NULL,'2023-05-02','2022-11-05 13:23:07','2022-11-05 13:23:07',NULL,'blocked',NULL),(484,8,NULL,'2023-05-01','2022-11-05 13:23:07','2022-11-05 13:23:07',NULL,'blocked',NULL),(485,8,NULL,'2023-05-03','2022-11-05 13:23:07','2022-11-05 13:23:07',NULL,'blocked',NULL),(486,8,NULL,'2023-05-05','2022-11-05 13:23:07','2022-11-05 13:23:07',NULL,'blocked',NULL),(487,8,NULL,'2023-05-06','2022-11-05 13:23:07','2022-11-05 13:23:07',NULL,'blocked',NULL),(488,8,NULL,'2023-05-04','2022-11-05 13:23:07','2022-11-05 13:23:07',NULL,'blocked',NULL),(489,8,NULL,'2023-05-07','2022-11-05 13:23:07','2022-11-05 13:23:07',NULL,'blocked',NULL),(490,4,NULL,'2023-05-09','2022-11-05 13:23:07','2022-11-05 13:23:07',NULL,'blocked',NULL),(491,8,NULL,'2023-05-08','2022-11-05 13:23:07','2022-11-05 13:23:07',NULL,'blocked',NULL),(492,8,NULL,'2023-05-09','2022-11-05 13:23:07','2022-11-05 13:23:07',NULL,'blocked',NULL),(493,8,90,'2023-04-04','2022-11-06 06:04:25','2022-11-06 06:04:25',NULL,'blocked',NULL),(494,8,90,'2023-04-03','2022-11-06 06:04:25','2022-11-06 06:04:25',NULL,'blocked',NULL),(495,8,90,'2023-04-05','2022-11-06 06:04:25','2022-11-06 06:04:25',NULL,'blocked',NULL),(496,8,90,'2023-04-06','2022-11-06 06:04:25','2022-11-06 06:04:25',NULL,'blocked',NULL),(497,8,90,'2023-04-08','2022-11-06 06:04:25','2022-11-06 06:04:25',NULL,'blocked',NULL),(498,8,90,'2023-04-07','2022-11-06 06:04:25','2022-11-06 06:04:25',NULL,'blocked',NULL),(499,8,90,'2023-04-09','2022-11-06 06:04:25','2022-11-06 06:04:25',NULL,'blocked',NULL),(500,8,90,'2023-04-11','2022-11-06 06:04:25','2022-11-06 06:04:25',NULL,'blocked',NULL),(501,8,90,'2023-04-10','2022-11-06 06:04:25','2022-11-06 06:04:25',NULL,'blocked',NULL),(502,8,90,'2023-04-12','2022-11-06 06:04:25','2022-11-06 06:04:25',NULL,'blocked',NULL),(503,8,90,'2023-04-13','2022-11-06 06:04:25','2022-11-06 06:04:25',NULL,'blocked',NULL),(504,8,90,'2023-04-17','2022-11-06 06:04:25','2022-11-06 06:04:25',NULL,'blocked',NULL),(505,8,90,'2023-04-14','2022-11-06 06:04:25','2022-11-06 06:04:25',NULL,'blocked',NULL),(506,8,90,'2023-04-16','2022-11-06 06:04:25','2022-11-06 06:04:25',NULL,'blocked',NULL),(507,8,90,'2023-04-15','2022-11-06 06:04:25','2022-11-06 06:04:25',NULL,'blocked',NULL),(508,8,91,'2023-01-10','2022-11-06 07:57:17','2022-11-06 07:57:17',NULL,'blocked',NULL),(545,8,93,'2022-11-20','2022-11-06 09:18:34','2022-11-06 09:18:36',NULL,'blocked',NULL),(546,8,93,'2022-11-21','2022-11-06 09:18:34','2022-11-06 09:18:36',NULL,'blocked',NULL),(547,8,93,'2022-11-18','2022-11-06 09:18:34','2022-11-06 09:18:36',NULL,'blocked',NULL),(548,8,93,'2022-11-19','2022-11-06 09:18:34','2022-11-06 09:18:36',NULL,'blocked',NULL),(549,8,93,'2022-11-24','2022-11-06 09:18:34','2022-11-06 09:18:36',NULL,'blocked',NULL),(550,8,93,'2022-11-22','2022-11-06 09:18:34','2022-11-06 09:18:36',NULL,'blocked',NULL),(551,8,93,'2022-11-26','2022-11-06 09:18:34','2022-11-06 09:18:36',NULL,'blocked',NULL),(552,8,93,'2022-11-27','2022-11-06 09:18:34','2022-11-06 09:18:36',NULL,'blocked',NULL),(553,8,93,'2022-11-28','2022-11-06 09:18:34','2022-11-06 09:18:36',NULL,'blocked',NULL),(554,8,93,'2022-11-23','2022-11-06 09:18:34','2022-11-06 09:18:36',NULL,'blocked',NULL),(555,8,93,'2022-11-25','2022-11-06 09:18:34','2022-11-06 09:18:36',NULL,'blocked',NULL),(556,8,93,'2022-11-29','2022-11-06 09:18:34','2022-11-06 09:18:36',NULL,'blocked',NULL),(557,2,NULL,'2022-11-20','2022-11-06 09:18:36','2022-11-06 09:18:36',NULL,'blocked',NULL),(558,2,NULL,'2022-11-18','2022-11-06 09:18:36','2022-11-06 09:18:36',NULL,'blocked',NULL),(559,2,NULL,'2022-11-19','2022-11-06 09:18:36','2022-11-06 09:18:36',NULL,'blocked',NULL),(560,2,NULL,'2022-11-23','2022-11-06 09:18:36','2022-11-06 09:18:36',NULL,'blocked',NULL),(561,2,NULL,'2022-11-25','2022-11-06 09:18:36','2022-11-06 09:18:36',NULL,'blocked',NULL),(562,2,NULL,'2022-11-21','2022-11-06 09:18:36','2022-11-06 09:18:36',NULL,'blocked',NULL),(563,2,NULL,'2022-11-24','2022-11-06 09:18:36','2022-11-06 09:18:36',NULL,'blocked',NULL),(564,2,NULL,'2022-11-22','2022-11-06 09:18:36','2022-11-06 09:18:36',NULL,'blocked',NULL),(565,2,NULL,'2022-11-28','2022-11-06 09:18:36','2022-11-06 09:18:36',NULL,'blocked',NULL),(566,8,NULL,'2022-11-30','2022-11-06 09:18:36','2022-11-06 09:18:36',NULL,'blocked',NULL),(567,2,NULL,'2022-11-26','2022-11-06 09:18:36','2022-11-06 09:18:36',NULL,'blocked',NULL),(568,2,NULL,'2022-11-27','2022-11-06 09:18:36','2022-11-06 09:18:36',NULL,'blocked',NULL),(569,2,NULL,'2022-11-29','2022-11-06 09:18:36','2022-11-06 09:18:36',NULL,'blocked',NULL),(570,2,NULL,'2022-11-30','2022-11-06 09:18:36','2022-11-06 09:18:36',NULL,'blocked',NULL),(571,4,NULL,'2023-05-10','2022-11-15 17:35:51','2022-11-15 17:35:51',NULL,'blocked',NULL),(572,4,NULL,'2023-05-13','2022-11-15 17:35:51','2022-11-15 17:35:51',NULL,'blocked',NULL),(573,4,NULL,'2023-05-11','2022-11-15 17:35:51','2022-11-15 17:35:51',NULL,'blocked',NULL),(574,4,NULL,'2023-05-12','2022-11-15 17:35:51','2022-11-15 17:35:51',NULL,'blocked',NULL),(575,8,NULL,'2023-05-10','2022-11-15 17:35:51','2022-11-15 17:35:51',NULL,'blocked',NULL),(576,8,NULL,'2023-05-11','2022-11-15 17:35:51','2022-11-15 17:35:51',NULL,'blocked',NULL),(577,8,NULL,'2023-05-13','2022-11-15 17:35:51','2022-11-15 17:35:51',NULL,'blocked',NULL),(578,8,NULL,'2023-05-12','2022-11-15 17:35:51','2022-11-15 17:35:51',NULL,'blocked',NULL),(579,4,94,'2023-05-19','2022-11-15 17:37:44','2022-11-15 17:37:46',NULL,'blocked',NULL),(580,4,94,'2023-05-17','2022-11-15 17:37:44','2022-11-15 17:37:46',NULL,'blocked',NULL),(581,4,94,'2023-05-18','2022-11-15 17:37:44','2022-11-15 17:37:46',NULL,'blocked',NULL),(582,4,94,'2023-05-20','2022-11-15 17:37:44','2022-11-15 17:37:46',NULL,'blocked',NULL),(583,4,94,'2023-05-21','2022-11-15 17:37:44','2022-11-15 17:37:46',NULL,'blocked',NULL),(584,4,94,'2023-05-22','2022-11-15 17:37:44','2022-11-15 17:37:46',NULL,'blocked',NULL),(585,4,94,'2023-05-23','2022-11-15 17:37:44','2022-11-15 17:37:46',NULL,'blocked',NULL),(586,8,NULL,'2023-05-18','2022-11-15 17:37:46','2022-11-15 17:37:46',NULL,'blocked',NULL),(587,8,NULL,'2023-05-20','2022-11-15 17:37:46','2022-11-15 17:37:46',NULL,'blocked',NULL),(588,8,NULL,'2023-05-17','2022-11-15 17:37:46','2022-11-15 17:37:46',NULL,'blocked',NULL),(589,8,NULL,'2023-05-19','2022-11-15 17:37:46','2022-11-15 17:37:46',NULL,'blocked',NULL),(590,8,NULL,'2023-05-23','2022-11-15 17:37:46','2022-11-15 17:37:46',NULL,'blocked',NULL),(591,4,NULL,'2023-05-24','2022-11-15 17:37:46','2022-11-15 17:37:46',NULL,'blocked',NULL),(592,8,NULL,'2023-05-21','2022-11-15 17:37:46','2022-11-15 17:37:46',NULL,'blocked',NULL),(593,8,NULL,'2023-05-22','2022-11-15 17:37:46','2022-11-15 17:37:46',NULL,'blocked',NULL),(594,8,NULL,'2023-05-24','2022-11-15 17:37:46','2022-11-15 17:37:46',NULL,'blocked',NULL),(597,5,96,'2023-04-25','2023-04-16 18:11:21','2023-04-16 18:11:21',NULL,'blocked',NULL),(598,5,96,'2023-04-23','2023-04-16 18:11:21','2023-04-16 18:11:21',NULL,'blocked',NULL),(599,5,96,'2023-04-24','2023-04-16 18:11:21','2023-04-16 18:11:21',NULL,'blocked',NULL),(600,5,NULL,'2023-04-26','2023-04-16 18:38:56','2023-04-16 18:38:56',NULL,'blocked',NULL),(601,5,NULL,'2023-04-27','2023-04-16 18:38:56','2023-04-16 18:38:56',NULL,'blocked',NULL),(602,5,NULL,'2023-04-28','2023-04-16 18:38:56','2023-04-16 18:38:56',NULL,'blocked',NULL),(603,6,98,'2023-06-12','2023-06-11 13:19:23','2023-06-11 13:19:23',NULL,'blocked',NULL),(604,6,98,'2023-06-13','2023-06-11 13:19:23','2023-06-11 13:19:23',NULL,'blocked',NULL),(614,6,NULL,'2023-08-02','2023-07-18 18:54:47','2023-07-18 18:54:47',NULL,'blocked',NULL),(615,6,NULL,'2023-08-03','2023-07-18 18:54:47','2023-07-18 18:54:47',NULL,'blocked',NULL),(616,6,NULL,'2023-08-04','2023-07-18 18:54:47','2023-07-18 18:54:47',NULL,'blocked',NULL),(617,6,NULL,'2023-08-05','2023-07-18 18:54:47','2023-07-18 18:54:47',NULL,'blocked',NULL),(618,6,NULL,'2023-08-06','2023-07-18 18:54:47','2023-07-18 18:54:47',NULL,'blocked',NULL),(619,6,NULL,'2023-08-07','2023-07-18 18:54:47','2023-07-18 18:54:47',NULL,'blocked',NULL),(620,6,NULL,'2023-08-08','2023-07-18 18:54:47','2023-07-18 18:54:47',NULL,'blocked',NULL),(621,6,NULL,'2023-08-09','2023-07-18 18:54:47','2023-07-18 18:54:47',NULL,'blocked',NULL),(622,6,NULL,'2023-08-11','2023-07-18 18:54:47','2023-07-18 18:54:47',NULL,'blocked',NULL),(623,6,NULL,'2023-08-10','2023-07-18 18:54:47','2023-07-18 18:55:14',NULL,'blocked',NULL),(624,6,NULL,'2023-08-12','2023-07-18 18:54:47','2023-07-18 18:54:47',NULL,'blocked',NULL),(625,6,NULL,'2023-08-13','2023-07-18 18:54:47','2023-07-18 18:54:47',NULL,'blocked',NULL),(626,6,NULL,'2023-08-14','2023-07-18 18:54:47','2023-07-18 18:54:47',NULL,'blocked',NULL),(627,6,NULL,'2023-08-15','2023-07-18 18:54:47','2023-07-18 18:54:47',NULL,'blocked',NULL),(628,6,NULL,'2023-08-16','2023-07-18 18:54:47','2023-07-18 18:54:47',NULL,'blocked',NULL),(629,6,NULL,'2023-08-17','2023-07-18 18:54:47','2023-07-18 18:54:47',NULL,'blocked',NULL),(630,4,NULL,'2023-07-18','2023-07-18 19:20:44','2023-07-18 19:21:23',NULL,'available',20),(631,4,NULL,'2023-07-19','2023-07-18 19:20:44','2023-07-18 19:21:23',NULL,'available',20),(632,4,NULL,'2023-07-20','2023-07-18 19:20:55','2023-07-18 19:20:55',NULL,'available',13),(633,4,NULL,'2023-07-21','2023-07-18 19:20:55','2023-07-18 19:20:55',NULL,'available',13),(634,4,NULL,'2023-08-01','2023-07-19 10:52:35','2023-07-19 10:52:35',NULL,'blocked',NULL),(635,4,NULL,'2023-08-02','2023-07-19 10:52:35','2023-07-19 10:52:35',NULL,'blocked',NULL),(636,4,NULL,'2023-08-03','2023-07-19 10:52:35','2023-07-19 10:52:35',NULL,'blocked',NULL),(637,4,NULL,'2023-08-16','2023-07-20 12:52:47','2023-07-20 12:52:47',NULL,'blocked',NULL),(638,4,NULL,'2023-08-17','2023-07-20 12:52:47','2023-07-20 12:52:47',NULL,'blocked',NULL),(639,8,120,'2023-08-29','2023-07-31 07:14:03','2023-07-31 07:14:03',NULL,'blocked',NULL),(640,8,120,'2023-08-30','2023-07-31 07:14:03','2023-07-31 07:14:03',NULL,'blocked',NULL),(641,8,122,'2023-08-16','2023-07-31 09:10:44','2023-07-31 09:10:44',NULL,'blocked',NULL),(642,8,129,'2023-08-18','2023-07-31 11:52:30','2023-07-31 11:52:30',NULL,'blocked',NULL),(643,8,130,'2023-08-22','2023-07-31 14:46:45','2023-07-31 14:46:45',NULL,'blocked',NULL),(644,8,130,'2023-08-23','2023-07-31 14:46:45','2023-07-31 14:46:45',NULL,'blocked',NULL),(645,8,130,'2023-08-24','2023-07-31 14:46:45','2023-07-31 14:46:45',NULL,'blocked',NULL),(646,8,131,'2023-09-07','2023-08-01 08:29:24','2023-08-01 08:29:24',NULL,'blocked',NULL),(647,8,131,'2023-09-06','2023-08-01 08:29:24','2023-08-01 08:29:24',NULL,'blocked',NULL),(648,8,135,'2023-09-12','2023-08-01 14:13:44','2023-08-01 14:13:44',NULL,'blocked',NULL),(649,8,135,'2023-09-13','2023-08-01 14:13:44','2023-08-01 14:13:44',NULL,'blocked',NULL),(650,8,137,'2023-10-11','2023-08-01 14:22:36','2023-08-01 14:22:36',NULL,'blocked',NULL),(651,8,137,'2023-10-12','2023-08-01 14:22:36','2023-08-01 14:22:36',NULL,'blocked',NULL),(652,8,138,'2023-08-25','2023-08-02 06:28:01','2023-08-02 06:28:01',NULL,'blocked',NULL);
/*!40000 ALTER TABLE `ListBlockedDates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ListCalendar`
--

DROP TABLE IF EXISTS `ListCalendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListCalendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` mediumtext NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `listId` (`listId`),
  CONSTRAINT `ListCalendar_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ListCalendar`
--

LOCK TABLES `ListCalendar` WRITE;
/*!40000 ALTER TABLE `ListCalendar` DISABLE KEYS */;
/*!40000 ALTER TABLE `ListCalendar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ListPhotos`
--

DROP TABLE IF EXISTS `ListPhotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListPhotos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT '0',
  `isCover` int(11) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `listId` (`listId`),
  CONSTRAINT `ListPhotos_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ListPhotos`
--

LOCK TABLES `ListPhotos` WRITE;
/*!40000 ALTER TABLE `ListPhotos` DISABLE KEYS */;
INSERT INTO `ListPhotos` VALUES (57,1,'dcda484c967e8df86e64f0f394498c6b.jpeg','image/jpeg',0,'2020-01-23 05:36:39','2020-01-23 05:36:39'),(58,1,'394d7c5d3da2621b559887435d8011d0.jpeg','image/jpeg',0,'2020-01-23 05:36:39','2020-01-23 05:36:39'),(60,1,'8698cc427d4e10b7eb6aaf5038db0040.jpeg','image/jpeg',0,'2020-01-23 05:36:39','2020-01-23 05:36:39'),(61,2,'77d1573a6965309f7a2c23ea11cef7e0.jpeg','image/jpeg',0,'2020-01-23 05:37:31','2020-01-23 05:37:31'),(62,2,'afd75f9701dbf592ce119162fc3e38b7.jpeg','image/jpeg',0,'2020-01-23 05:37:31','2020-01-23 05:37:31'),(63,2,'866f343a16430b0a9b97bfd3b1b6a587.jpeg','image/jpeg',0,'2020-01-23 05:37:31','2020-01-23 05:37:31'),(64,2,'b486b9fc9dde068102e964f37b5ff855.jpeg','image/jpeg',0,'2020-01-23 05:37:31','2020-01-23 05:37:31'),(71,4,'42050893b5a4b64369f84033cf43987f.jpeg','image/jpeg',0,'2020-01-23 05:40:03','2020-01-23 05:40:03'),(72,4,'6b0622e937f88571711c52bbdf290bc8.jpeg','image/jpeg',0,'2020-01-23 05:40:03','2020-01-23 05:40:03'),(73,4,'3e135cfea39185357f38a98ba1f201b0.jpeg','image/jpeg',0,'2020-01-23 05:40:11','2020-01-23 05:40:11'),(74,4,'91cac4f4d0d3e9cc72ff6ad75c38e663.jpeg','image/jpeg',0,'2020-01-23 05:40:19','2020-01-23 05:40:19'),(75,5,'8ad7c57de58e95f65aae90ddd2360008.jpeg','image/jpeg',0,'2020-01-23 05:41:36','2020-01-23 05:41:36'),(76,5,'84958eea5f87554e55b6544659b5710a.jpeg','image/jpeg',0,'2020-01-23 05:41:42','2020-01-23 05:41:42'),(77,5,'5f15b1ad8688df1c85d321995a0c0737.jpeg','image/jpeg',0,'2020-01-23 05:41:49','2020-01-23 05:41:49'),(78,5,'14a9105e3a02bd3ee426fc872b3a7e74.jpeg','image/jpeg',0,'2020-01-23 05:41:54','2020-01-23 05:41:54'),(79,6,'9d956fb476a25976009d856703a59e84.jpeg','image/jpeg',0,'2020-01-23 05:42:24','2020-01-23 05:42:24'),(80,6,'42a7e827a18c9a51b7b8fedebac09349.jpeg','image/jpeg',0,'2020-01-23 05:42:32','2020-01-23 05:42:32'),(81,6,'8c649d8e694481e5bc77196a7634d397.jpeg','image/jpeg',0,'2020-01-23 05:42:37','2020-01-23 05:42:37'),(82,6,'9be399d3fd4c13f2b03c719728847b68.jpeg','image/jpeg',0,'2020-01-23 05:42:45','2020-01-23 05:42:45'),(83,6,'182abd0d95358fc8616e4461928d27ae.jpeg','image/jpeg',0,'2020-01-23 05:42:51','2020-01-23 05:42:51'),(84,7,'33aeec2a8924021116181daa8074a417.jpeg','image/jpeg',0,'2020-01-23 05:43:40','2020-01-23 05:43:40'),(85,7,'01608e58a5d1c6e843c479da5384e47e.jpeg','image/jpeg',0,'2020-01-23 05:43:57','2020-01-23 05:43:57'),(86,7,'1a32aaeec0eb1e2b51bb5f9143e63670.jpeg','image/jpeg',0,'2020-01-23 05:44:11','2020-01-23 05:44:11'),(87,7,'e981d7b0d542793aef6a917b4eedccb1.jpeg','image/jpeg',0,'2020-01-23 05:44:16','2020-01-23 05:44:16'),(88,1,'3ad006e157cd885569f68988c026bfc4.jpeg','image/jpeg',0,'2020-01-23 05:47:34','2020-01-23 05:47:34'),(89,8,'de5861a5c50f95fd36c2aaa705dad602.jpeg','image/jpeg',0,'2020-01-23 05:51:24','2020-01-23 05:51:24'),(90,8,'90f82aab773399b4b89575ba2d04f6f8.jpeg','image/jpeg',0,'2020-01-23 05:51:24','2020-01-23 05:51:24'),(91,8,'f28fc2ffae8165c6ad2cfc7222d20093.jpeg','image/jpeg',0,'2020-01-23 05:52:02','2020-01-23 05:52:02'),(92,8,'e814f3b9c0221b7a6b64dae48c1ad50b.jpeg','image/jpeg',0,'2020-01-23 05:52:10','2020-01-23 05:52:10'),(103,15,'13afebe61c69e283f9392368a7a149dd.png','image/png',0,'2022-11-08 08:06:54','2022-11-08 08:06:54'),(104,15,'d5b9cab9c539eb695d6429208ef5552e.png','image/png',0,'2022-11-08 08:07:00','2022-11-08 08:07:00'),(105,15,'1ac0059930ea83e9fdd47570d0604e68.png','image/png',0,'2022-11-08 08:07:00','2022-11-08 08:07:00'),(106,15,'f75d35d01577c35d6c23e88587d4e49f.png','image/png',0,'2022-11-08 08:07:00','2022-11-08 08:07:00'),(107,14,'f57c61922e0675bce4c8202f11e1bab3.png','image/png',0,'2022-11-09 11:02:16','2022-11-09 11:02:16');
/*!40000 ALTER TABLE `ListPhotos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ListSettings`
--

DROP TABLE IF EXISTS `ListSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeId` int(11) NOT NULL,
  `itemName` varchar(255) DEFAULT NULL,
  `otherItemName` varchar(255) DEFAULT NULL,
  `maximum` int(11) DEFAULT NULL,
  `minimum` int(11) DEFAULT NULL,
  `startValue` int(11) DEFAULT NULL,
  `endValue` int(11) DEFAULT NULL,
  `step` varchar(255) DEFAULT NULL,
  `isEnable` varchar(255) DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `itemDescription` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `typeId` (`typeId`),
  CONSTRAINT `ListSettings_ibfk_1` FOREIGN KEY (`typeId`) REFERENCES `ListSettingsTypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ListSettings`
--

LOCK TABLES `ListSettings` WRITE;
/*!40000 ALTER TABLE `ListSettings` DISABLE KEYS */;
INSERT INTO `ListSettings` VALUES (5,3,'House',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 07:46:35','2018-04-11 15:19:10',NULL,NULL),(6,3,'Apartment',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 07:46:42','2017-01-09 07:46:42',NULL,NULL),(7,3,'Bed & Breakfast',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 07:46:49','2017-01-09 07:46:49',NULL,NULL),(8,3,'Boutique hotel',NULL,NULL,NULL,NULL,NULL,NULL,'0','2017-01-09 07:46:57','2018-05-05 11:23:23',NULL,NULL),(10,4,'1-5 Rooms',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 07:49:23','2017-01-09 07:49:23',NULL,NULL),(11,4,'6-25 Rooms',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 07:49:35','2017-01-09 07:49:35',NULL,NULL),(14,5,'bedroom  ','bedrooms ',NULL,NULL,1,10,NULL,'1','2017-01-09 07:53:04','2018-05-02 04:54:59',NULL,NULL),(15,6,'bed','beds',NULL,NULL,1,16,NULL,'1','2017-01-09 07:53:48','2018-04-28 04:50:39',NULL,NULL),(16,7,'Single',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 07:59:47','2017-01-09 07:59:47',NULL,NULL),(17,7,'Double',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 07:59:57','2017-01-09 07:59:57',NULL,NULL),(18,7,'Queen',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 08:00:05','2017-01-09 08:00:05',NULL,NULL),(19,7,'King',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 08:00:13','2017-01-09 08:00:13',NULL,NULL),(20,7,'Bunk bed',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 08:00:20','2017-01-09 08:00:20',NULL,NULL),(21,8,'bathroom','bathrooms',NULL,NULL,1,8,NULL,'1','2017-01-09 08:12:24','2018-04-10 07:04:01',NULL,NULL),(22,9,'Private Room',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 08:31:16','2017-01-09 08:31:16',NULL,NULL),(23,9,'Shared Room',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 08:31:28','2017-01-09 08:31:28',NULL,NULL),(24,9,'Other',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 08:31:32','2017-01-09 08:31:32',NULL,NULL),(25,10,'Towels, bed sheets, soap, and toilet paper',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 08:43:32','2017-01-09 08:43:32',NULL,NULL),(26,10,'Wifi',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 08:43:42','2017-01-09 08:43:42',NULL,NULL),(27,10,'Shampoo ',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 08:43:51','2017-01-09 08:43:51',NULL,NULL),(28,10,'Closet/drawers',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 08:44:00','2017-01-09 08:44:00',NULL,NULL),(29,11,'Smoke detector',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 08:44:17','2017-01-09 08:44:17',NULL,NULL),(30,11,'Carbon monoxide detector',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 08:44:25','2017-01-09 08:44:25',NULL,NULL),(31,11,'First aid kit ',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 08:44:33','2017-01-09 08:44:33',NULL,NULL),(32,11,'Safety card',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 08:44:41','2017-01-09 08:44:41',NULL,NULL),(33,12,'Kitchen',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 09:05:19','2017-01-09 09:05:19',NULL,NULL),(34,12,'Laundry – washer ',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 09:05:26','2017-01-09 09:05:26',NULL,NULL),(35,12,'Laundry – dryer',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 09:05:33','2017-01-09 09:05:33',NULL,NULL),(36,12,'Parking',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-09 09:05:40','2017-01-09 09:05:40',NULL,NULL),(39,2,'guest','guests',NULL,NULL,1,20,NULL,'1','2017-01-09 10:51:56','2018-05-22 08:47:42',NULL,NULL),(45,13,'Payment information',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 07:48:16','2017-01-18 07:48:16',NULL,NULL),(46,13,'Agree to your House Rules',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 08:02:20','2018-04-12 08:08:01',NULL,NULL),(47,13,'Tell you their trip purpose',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 08:02:29','2017-01-18 08:02:29',NULL,NULL),(48,14,'Suitable for children (2-14 years) ',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 10:00:20','2018-03-15 18:16:04',NULL,NULL),(49,14,'Suitable for infants (Under 2 years)',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 10:00:28','2017-01-18 10:00:28',NULL,NULL),(50,14,'Suitable for pets',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 10:00:35','2017-01-18 10:00:35',NULL,NULL),(51,14,'Smoking Not allowed ',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 10:00:41','2018-04-25 01:16:08',NULL,NULL),(52,14,'Events or parties allowed',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 10:00:56','2017-01-18 10:00:56',NULL,NULL),(53,15,'Meet RentAll’s guest requirements',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 11:01:08','2017-01-18 11:01:08',NULL,NULL),(54,15,'Agree to your house rules',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 11:01:16','2017-01-18 11:01:16',NULL,NULL),(55,15,'Tell you their trip purpose',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 11:01:25','2017-01-18 11:01:25',NULL,NULL),(56,15,'Let you know how many people are coming on the trip',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 11:03:00','2018-05-02 04:57:56',NULL,NULL),(58,16,'1 day',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 15:19:43','2017-01-18 15:19:43',NULL,NULL),(59,16,'2 days',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 15:19:48','2017-01-18 15:19:48',NULL,NULL),(60,16,'3 days',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 15:19:58','2017-01-18 15:19:58',NULL,NULL),(61,16,'7 days',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 15:20:03','2017-01-18 15:20:03',NULL,NULL),(62,17,'Dates unavailable by default',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 18:01:01','2017-01-18 18:01:01',NULL,NULL),(63,17,'Any time',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 18:01:16','2017-01-18 18:01:16',NULL,NULL),(64,17,'3 months',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 18:01:22','2017-01-18 18:01:22',NULL,NULL),(65,17,'6 months',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 18:01:29','2017-01-18 18:01:29',NULL,NULL),(66,17,'1 year',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-01-18 18:01:42','2017-01-18 18:01:42',NULL,NULL),(67,18,'night min','nights min',NULL,NULL,0,100,NULL,'1','2017-01-18 18:18:28','2018-04-28 04:56:03',NULL,NULL),(68,19,'night max','nights max',NULL,NULL,0,100,NULL,'1','2017-01-18 18:19:00','2018-05-02 04:59:10',NULL,NULL),(73,10,'Hair dryer',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-07-28 11:36:34','2017-07-28 14:45:50',NULL,NULL),(74,1,'Guest Room',NULL,NULL,NULL,NULL,NULL,NULL,'0','2017-07-28 14:21:14','2018-04-27 14:15:42',NULL,NULL),(76,1,'Private Room',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-07-30 04:24:13','2017-07-30 04:24:13',NULL,NULL),(77,1,'Entire Place',NULL,NULL,NULL,NULL,NULL,NULL,'1','2017-07-30 04:24:18','2018-04-27 13:10:06',NULL,NULL),(87,10,'LED TV',NULL,NULL,NULL,NULL,NULL,NULL,'0','2018-04-10 05:13:44','2018-04-28 04:52:14',NULL,NULL),(97,10,'TV',NULL,NULL,NULL,NULL,NULL,NULL,'0','2018-04-10 07:29:11','2018-04-10 07:29:32',NULL,NULL),(100,3,'Cottage ',NULL,NULL,NULL,NULL,NULL,NULL,'0','2018-04-10 08:56:22','2018-04-28 04:47:07',NULL,NULL),(102,4,'25-50 Rooms',NULL,NULL,NULL,NULL,NULL,NULL,'1','2018-04-10 08:57:40','2018-04-28 04:48:13',NULL,NULL),(103,14,'Loud Music Not Allowed',NULL,NULL,NULL,NULL,NULL,NULL,'0','2018-04-10 09:00:48','2018-05-02 04:57:29',NULL,NULL),(105,4,'50-100 Rooms',NULL,NULL,NULL,NULL,NULL,NULL,'1','2018-04-12 08:08:55','2018-04-28 04:48:27',NULL,NULL),(106,10,'item',NULL,NULL,NULL,NULL,NULL,NULL,'0','2018-04-12 08:09:22','2018-04-23 15:27:14',NULL,NULL),(110,1,'Landscape Trailer',NULL,NULL,NULL,NULL,NULL,NULL,'0','2018-04-24 00:24:06','2018-04-27 14:15:50',NULL,NULL),(112,1,'Tent',NULL,NULL,NULL,NULL,NULL,NULL,'0','2018-04-24 02:28:25','2018-05-02 04:53:56',NULL,NULL),(113,1,'Shared Room',NULL,NULL,NULL,NULL,NULL,NULL,'1','2018-04-24 02:28:41','2018-04-24 02:28:41',NULL,NULL),(118,10,'Parking',NULL,NULL,NULL,NULL,NULL,NULL,'1','2018-04-24 02:33:13','2018-04-24 02:33:13',NULL,NULL),(119,10,'Swimming Pool',NULL,NULL,NULL,NULL,NULL,NULL,'1','2018-04-24 02:33:23','2020-04-13 13:09:35','d8e103a2e500b56205bd28147fccae88.png',NULL),(123,3,'House with garden',NULL,NULL,NULL,NULL,NULL,NULL,'0','2018-04-25 14:56:34','2018-04-28 04:47:28',NULL,NULL),(125,14,'Loud People are not allowed',NULL,NULL,NULL,NULL,NULL,NULL,'0','2018-04-25 14:59:40','2018-04-28 04:27:21',NULL,NULL),(126,4,'100+ Rooms',NULL,NULL,NULL,NULL,NULL,NULL,'1','2018-04-28 04:49:12','2018-04-28 04:49:12',NULL,NULL),(127,13,'Confirmed Email',NULL,NULL,NULL,NULL,NULL,NULL,'1','2018-04-28 04:53:50','2018-04-28 04:53:50',NULL,NULL),(128,16,'Same day',NULL,NULL,NULL,NULL,NULL,NULL,'1','2018-04-28 04:55:21','2018-04-30 21:33:25',NULL,NULL);
/*!40000 ALTER TABLE `ListSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ListSettingsTypes`
--

DROP TABLE IF EXISTS `ListSettingsTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListSettingsTypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(255) NOT NULL,
  `fieldType` enum('stringType','numberType') DEFAULT 'stringType',
  `step` int(11) DEFAULT 1,
  `isEnable` varchar(255) DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `typeLabel` varchar(255) DEFAULT NULL,
  `isMultiValue` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ListSettingsTypes`
--

LOCK TABLES `ListSettingsTypes` WRITE;
/*!40000 ALTER TABLE `ListSettingsTypes` DISABLE KEYS */;
INSERT INTO `ListSettingsTypes` VALUES (1,'roomType','stringType',1,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Room Type',0),(2,'personCapacity','numberType',1,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Person Capacity',0),(3,'houseType','stringType',1,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','House Type',0),(4,'buildingSize','stringType',1,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Building Size',0),(5,'bedrooms','numberType',1,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Bed Rooms',0),(6,'beds','numberType',1,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Beds',0),(7,'bedType','stringType',1,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Bed Type',0),(8,'bathrooms','numberType',1,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Bathrooms',0),(9,'bathroomType','stringType',1,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Bathroom Type',0),(10,'essentialsAmenities','stringType',1,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Essential Amenities',1),(11,'safetyAmenities','stringType',1,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Safety Amenities',1),(12,'spaces','stringType',1,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Spaces',1),(13,'guestRequirements','stringType',3,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Guest Requirements',0),(14,'houseRules','stringType',3,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','House Rules',1),(15,'reviewGuestBook','stringType',3,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Review How Guests Book',0),(16,'bookingNoticeTime','stringType',3,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Booking Notice Time',0),(17,'maxDaysNotice','stringType',3,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Maximum Days Notice',0),(18,'minNight','numberType',3,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Minimum Nights',0),(19,'maxNight','numberType',3,'1','2019-03-27 11:53:47','0000-00-00 00:00:00','Maximum Nights',0);
/*!40000 ALTER TABLE `ListSettingsTypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ListViews`
--

DROP TABLE IF EXISTS `ListViews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListViews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `userId` char(36) NOT NULL DEFAULT '',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`,`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ListViews`
--

LOCK TABLES `ListViews` WRITE;
/*!40000 ALTER TABLE `ListViews` DISABLE KEYS */;
INSERT INTO `ListViews` VALUES (1,1,'977bc550-5069-11e9-a14e-635e0fd3bfa6','2019-07-04 13:37:45','2019-07-04 13:37:45'),(2,6,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2020-04-13 12:54:11','2020-04-13 12:54:11'),(3,5,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-12 16:31:07','2022-08-12 16:31:07'),(4,2,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-12 16:37:06','2022-08-12 16:37:06'),(5,6,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-12 16:37:59','2022-08-12 16:37:59'),(6,4,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-04 15:23:11','2022-11-04 15:23:11'),(7,4,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-04 15:23:11','2022-11-04 15:23:11'),(8,4,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-04 15:23:11','2022-11-04 15:23:11'),(9,4,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-04 15:23:11','2022-11-04 15:23:11'),(10,8,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-06 05:24:08','2022-11-06 05:24:08'),(11,8,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-06 05:24:08','2022-11-06 05:24:08'),(12,8,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-06 05:24:08','2022-11-06 05:24:08'),(13,8,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-06 05:24:08','2022-11-06 05:24:08'),(14,5,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-06 13:55:23','2022-11-06 13:55:23'),(15,5,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-06 13:55:23','2022-11-06 13:55:23'),(16,5,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-06 13:55:23','2022-11-06 13:55:23'),(17,5,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-06 13:55:23','2022-11-06 13:55:23'),(18,5,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-06 13:55:23','2022-11-06 13:55:23'),(19,2,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-07 11:48:56','2022-11-07 11:48:56'),(20,2,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-07 11:48:56','2022-11-07 11:48:56'),(21,2,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-07 11:48:56','2022-11-07 11:48:56'),(22,6,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-14 11:54:51','2022-11-14 11:54:51'),(23,6,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-14 11:54:51','2022-11-14 11:54:51'),(24,6,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-14 11:54:51','2022-11-14 11:54:51'),(25,6,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-14 11:54:51','2022-11-14 11:54:51'),(26,4,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-15 15:50:58','2022-11-15 15:50:58'),(27,4,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-15 15:50:58','2022-11-15 15:50:58'),(28,4,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-15 15:50:58','2022-11-15 15:50:58'),(29,4,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-15 15:50:58','2022-11-15 15:50:58'),(30,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-15 16:36:36','2022-11-15 16:36:36'),(31,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-15 16:36:36','2022-11-15 16:36:36'),(32,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-15 16:36:36','2022-11-15 16:36:36'),(33,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-15 16:36:36','2022-11-15 16:36:36'),(34,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-15 16:36:36','2022-11-15 16:36:36'),(35,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-15 16:36:36','2022-11-15 16:36:36'),(36,8,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-15 17:54:19','2022-11-15 17:54:19'),(37,8,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-15 17:54:19','2022-11-15 17:54:19'),(38,8,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-15 17:54:19','2022-11-15 17:54:19'),(39,8,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-15 17:54:19','2022-11-15 17:54:19'),(40,8,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-15 17:54:19','2022-11-15 17:54:19'),(41,5,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-04-16 17:27:15','2023-04-16 17:27:15'),(42,7,'2d47f470-dc78-11ed-8493-97c361d41aef','2023-06-06 06:53:13','2023-06-06 06:53:13'),(43,5,'2d47f470-dc78-11ed-8493-97c361d41aef','2023-06-06 11:25:07','2023-06-06 11:25:07'),(44,5,'2d47f470-dc78-11ed-8493-97c361d41aef','2023-06-06 11:25:07','2023-06-06 11:25:07'),(45,6,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-06-08 09:38:25','2023-06-08 09:38:25'),(46,5,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-06-08 09:38:29','2023-06-08 09:38:29'),(47,8,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-06-08 10:06:04','2023-06-08 10:06:04'),(48,8,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-06-08 10:06:04','2023-06-08 10:06:04'),(49,7,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-06-11 12:50:23','2023-06-11 12:50:23'),(50,5,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-06-15 09:38:46','2023-06-15 09:38:46'),(51,8,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-06-15 10:40:47','2023-06-15 10:40:47'),(52,7,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-06-19 11:26:20','2023-06-19 11:26:20'),(53,7,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-06-19 11:26:20','2023-06-19 11:26:20'),(54,7,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-08 06:50:57','2023-07-08 06:50:57'),(55,7,'2d47f470-dc78-11ed-8493-97c361d41aef','2023-07-09 06:32:12','2023-07-09 06:32:12'),(56,7,'2d47f470-dc78-11ed-8493-97c361d41aef','2023-07-09 06:32:12','2023-07-09 06:32:12'),(57,7,'2d47f470-dc78-11ed-8493-97c361d41aef','2023-07-09 06:32:12','2023-07-09 06:32:12'),(58,6,'2d47f470-dc78-11ed-8493-97c361d41aef','2023-07-09 06:38:08','2023-07-09 06:38:08'),(59,6,'2d47f470-dc78-11ed-8493-97c361d41aef','2023-07-09 06:38:08','2023-07-09 06:38:08'),(60,6,'2d47f470-dc78-11ed-8493-97c361d41aef','2023-07-09 06:38:08','2023-07-09 06:38:08'),(61,5,'2d47f470-dc78-11ed-8493-97c361d41aef','2023-07-09 06:38:49','2023-07-09 06:38:49'),(62,8,'2d47f470-dc78-11ed-8493-97c361d41aef','2023-07-12 10:35:40','2023-07-12 10:35:40'),(63,8,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-15 07:51:06','2023-07-15 07:51:06'),(64,6,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-16 07:43:42','2023-07-16 07:43:42'),(65,7,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-16 07:44:00','2023-07-16 07:44:00'),(66,5,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-16 09:53:21','2023-07-16 09:53:21'),(67,5,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-16 09:53:21','2023-07-16 09:53:21'),(68,5,'9c276d50-14c0-11ee-a424-bd24a6095848','2023-07-16 10:07:24','2023-07-16 10:07:24'),(69,7,'977bc550-5069-11e9-a14e-635e0fd3bfa6','2023-07-21 22:27:44','2023-07-21 22:27:44'),(70,8,'977bc550-5069-11e9-a14e-635e0fd3bfa6','2023-07-21 22:35:58','2023-07-21 22:35:58'),(71,5,'977bc550-5069-11e9-a14e-635e0fd3bfa6','2023-07-21 22:36:18','2023-07-21 22:36:18'),(72,5,'977bc550-5069-11e9-a14e-635e0fd3bfa6','2023-07-21 22:36:18','2023-07-21 22:36:18'),(73,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','2023-07-21 22:36:32','2023-07-21 22:36:32'),(74,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','2023-07-21 22:36:32','2023-07-21 22:36:32'),(75,7,'9c276d50-14c0-11ee-a424-bd24a6095848','2023-07-22 11:12:32','2023-07-22 11:12:32'),(76,8,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-22 12:53:09','2023-07-22 12:53:09'),(77,8,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-22 12:53:09','2023-07-22 12:53:09'),(78,8,'2d47f470-dc78-11ed-8493-97c361d41aef','2023-07-23 07:55:46','2023-07-23 07:55:46'),(79,8,'2d47f470-dc78-11ed-8493-97c361d41aef','2023-07-23 07:55:46','2023-07-23 07:55:46'),(80,8,'2d47f470-dc78-11ed-8493-97c361d41aef','2023-07-23 07:55:46','2023-07-23 07:55:46'),(81,7,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-24 11:53:31','2023-07-24 11:53:31'),(82,6,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-24 11:53:32','2023-07-24 11:53:32'),(83,5,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-24 11:53:32','2023-07-24 11:53:32'),(84,6,'2d47f470-dc78-11ed-8493-97c361d41aef','2023-07-27 08:46:43','2023-07-27 08:46:43'),(85,7,'ecba1810-2c87-11ee-b289-61fce239156d','2023-07-27 18:41:56','2023-07-27 18:41:56'),(86,7,'ecba1810-2c87-11ee-b289-61fce239156d','2023-07-27 18:41:56','2023-07-27 18:41:56'),(87,7,'ecba1810-2c87-11ee-b289-61fce239156d','2023-07-27 18:41:56','2023-07-27 18:41:56'),(88,4,'977bc550-5069-11e9-a14e-635e0fd3bfa6','2023-07-30 05:55:04','2023-07-30 05:55:04'),(89,7,'977bc550-5069-11e9-a14e-635e0fd3bfa6','2023-07-30 10:21:59','2023-07-30 10:21:59'),(90,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','2023-07-30 10:34:32','2023-07-30 10:34:32'),(91,4,'9c276d50-14c0-11ee-a424-bd24a6095848','2023-07-30 10:45:47','2023-07-30 10:45:47'),(92,7,'9c276d50-14c0-11ee-a424-bd24a6095848','2023-07-30 11:16:59','2023-07-30 11:16:59'),(93,7,'9c276d50-14c0-11ee-a424-bd24a6095848','2023-07-30 11:16:59','2023-07-30 11:16:59'),(94,6,'ecba1810-2c87-11ee-b289-61fce239156d','2023-07-30 11:30:25','2023-07-30 11:30:25'),(95,6,'ecba1810-2c87-11ee-b289-61fce239156d','2023-07-30 11:30:25','2023-07-30 11:30:25'),(96,8,'ecba1810-2c87-11ee-b289-61fce239156d','2023-07-30 11:32:49','2023-07-30 11:32:49'),(97,8,'ecba1810-2c87-11ee-b289-61fce239156d','2023-07-30 11:32:49','2023-07-30 11:32:49'),(98,5,'977bc550-5069-11e9-a14e-635e0fd3bfa6','2023-07-30 21:01:10','2023-07-30 21:01:10'),(99,5,'9c276d50-14c0-11ee-a424-bd24a6095848','2023-07-31 15:46:44','2023-07-31 15:46:44'),(100,8,'977bc550-5069-11e9-a14e-635e0fd3bfa6','2023-08-01 06:01:41','2023-08-01 06:01:41'),(101,6,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-02 07:45:07','2023-08-02 07:45:07');
/*!40000 ALTER TABLE `ListViews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Listing`
--

DROP TABLE IF EXISTS `Listing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Listing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` char(36) NOT NULL,
  `roomType` varchar(255) DEFAULT NULL,
  `houseType` varchar(255) DEFAULT NULL,
  `residenceType` varchar(255) DEFAULT NULL,
  `bedrooms` varchar(255) DEFAULT NULL,
  `buildingSize` varchar(255) DEFAULT NULL,
  `bedType` varchar(255) DEFAULT NULL,
  `beds` int(11) DEFAULT NULL,
  `personCapacity` int(11) DEFAULT NULL,
  `bathrooms` float DEFAULT NULL,
  `bathroomType` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `buildingName` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zipcode` varchar(255) DEFAULT NULL,
  `lat` varchar(255) DEFAULT NULL,
  `lng` varchar(255) DEFAULT NULL,
  `isMapTouched` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` mediumtext DEFAULT NULL,
  `coverPhoto` int(11) DEFAULT NULL,
  `bookingType` enum('request','instant') NOT NULL DEFAULT 'instant',
  `isPublished` tinyint(1) NOT NULL DEFAULT 0,
  `isReady` tinyint(1) NOT NULL DEFAULT 0,
  `reviewsCount` tinyint(1) DEFAULT 0,
  `listApprovalStatus` varchar(255) DEFAULT NULL,
  `isRepostAllowed` tinyint(1) DEFAULT 0,
  `isSwapAllowed` tinyint(1) DEFAULT 0,
  `maxRepostPercentage` tinyint(1) DEFAULT 30,
  `isAccepted` tinyint(1) DEFAULT 1,
  `startAvailableDate` varchar(255) DEFAULT '2003-10-10',
  `swapAllowAnyDate` tinyint(1) DEFAULT 1,
  `swapCity` varchar(255) DEFAULT NULL,
  `swapCountry` varchar(255) DEFAULT NULL,
  `swapEndDate` varchar(255) DEFAULT NULL,
  `swapStartDate` varchar(255) DEFAULT NULL,
  `swapCountryCode` varchar(255) DEFAULT NULL,
  `swapCountryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `Listing_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Listing`
--

LOCK TABLES `Listing` WRITE;
/*!40000 ALTER TABLE `Listing` DISABLE KEYS */;
INSERT INTO `Listing` VALUES (1,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',NULL,NULL,'1','2',NULL,NULL,3,3,3,NULL,'US','763 Massachusetts Avenue',NULL,'Middlesex County','MA','02420','42.42703074607657','-71.20063239836423',1,'2019-03-27 09:45:41','2023-07-18 19:14:58','Off-grid it House and stunning view ','The Off-grid itHouse is an architecturally significant house, recently noted by Dwell as one of the \'Best Homes in America\' and in the Los Angeles Times as one of the best houses of all time in Southern California. The Off-grid itHouse is one of 10 IT Houses built in California, which have received much acclaim such as the Western Home award sponsored by Sunset magazine. Also noted as one of the top 10 airbnb rentals worldwide. This is the prototype for the pre-engineered system known as the IT House.\n\nThe house is 100% off-grid, powered by solar panels for energy and hot water, and is located in a pristine remote valley in the beautiful California high desert. The house observes key green principals of smaller footprint, minimal disturbance to the natural beauty of the surrounding landscape, use of renewable resources, and living simply and minimally.\n\nThe setting of the house is remote and serene, a quiet refuge from everything, free from distractions. Amazing views and vistas in all directions.\n\nPerfect for design or green aficionados, writers or those needing a secluded quiet getaway.',58,'request',1,1,0,'approved',0,0,30,0,'2003-10-19',1,NULL,NULL,NULL,NULL,NULL,NULL),(2,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',NULL,NULL,'0','1',NULL,NULL,2,2,2,NULL,'US','Guizhou Province Architectural Design & Research Institute, Nanming, , , /','','YunYan','Guizhou','551400','26.8429645','107.2902839',1,'2019-03-27 09:50:28','2023-07-18 19:14:57','Classic Harlem Brownstone - NYC',' Your Master Bedroom is located on the top floor of a classic Harlem brownstone, with a full guests-shared kitchen and bath. The home is located on Sugar Hill and is across the street from St. Nicholas Park and Hamilton Grange.\n\nThe Master Bedroom is on the top floor of a classic Harlem brownstone, build in 1901. It is gorgeous and spacious, facing the front of the house. You will have soft light in the morning, and a wonderful view of the city lights at night.\n\nPop out to the balcony or across the street to the park for some fresh air! Hamilton Heights, where the home is located, is a fun neighborhood with great fine dining, brunch and tasty takeout! You will have plenty of options for restaurants, bars, music venues and historical landmarks to visit during your stay.\n\nOnce home, enjoy the peace and quite of Hamilton Terrace. This beautiful and historic block is a quaint residential enclave you\'ll love at first sight!\n\nGuest access\n\nGuest have complete access to the full kitchen and full bath.',62,'instant',1,1,0,'approved',0,0,30,1,'2003-10-10',1,NULL,NULL,NULL,NULL,NULL,NULL),(4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',NULL,NULL,'0','1',NULL,NULL,1,1,3.5,NULL,'US','328 East Fir Avenue, ',NULL,'Atwater','CA','90001','37.3456814','-120.5913511',1,'2019-03-27 09:56:36','2023-07-18 19:21:31','Adorable townhouse near MFL train & hipster spots','Relax in this adorable and cozy little Philly row house in the calm end of Fishtown. Steps from great coffee, cute independent shops and galleries, a stones throw from more hipster amenities, food and nightlife throughout Fishtown and Northern Liberties. And just a quick ride away from Old City, Center City or the airport.\n\nFull kitchen - Laundry - Patio - Free unlimited street parking all around and easy loading area right out front',73,'request',1,1,0,'approved',1,1,25,1,'2022-11-11',1,NULL,NULL,'2023-06-30','2023-06-20','IT','Italy'),(5,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',NULL,NULL,NULL,'3',NULL,NULL,3,3,3,NULL,'GB','Basse Normandie, Rue Verte, ',NULL,'Hérouville-Saint-Clair','France','75116','49.205084','-0.318614',1,'2019-03-27 10:03:30','2023-04-16 18:41:26','Historic Georgian Lakeside Mansion 500 acre Park','This 250 year old delightful and spacious Georgian Menagerie - a replica of that built for Marie Antoinette at Palace of Versailles - is set within 10 acres of private grounds in a 500 acre country park. Sleep in a four poster bed, handmade from oak gifted to the owners by Prince Charles; one of 5 bedrooms available (with a further 2 by separate negotiation)',75,'request',1,1,0,'approved',0,1,30,1,'2003-10-10',1,NULL,NULL,NULL,NULL,NULL,NULL),(6,'977bc550-5069-11e9-a14e-635e0fd3bfa6',NULL,NULL,'1','2',NULL,NULL,2,2,2,NULL,'GB','Oristano Stazione F.s., Oristano, ','','Province of Oristano','Italy','09170','39.90105570554223','8.60587392065429',1,'2019-03-27 10:07:00','2023-07-19 10:49:52','Lux LoftApartment Nr City Centre with GatedParking','A ground floor light filled spacious apartment with amazing décor perfect for singles, couples, a romantic retreat, a group of friends, families and business travel. A stone\'s throw from City Centre with easy quick transport links or walking. 15/20 min walk to City Centre . 10 min walk to Cardiff City Stadium. The stunning galleried bedroom area is on a mezzanine level overlooking a large living area. Secure Private Parking and Bike Shed in gated courtyard and outside seating area.',81,'instant',1,1,0,'approved',0,0,30,1,'2003-10-10',1,NULL,NULL,NULL,NULL,NULL,NULL),(7,'3fcd41e0-376e-11ed-9bcb-1fd549eed589',NULL,NULL,'1','5',NULL,NULL,6,4,4,NULL,'GB','69 Commercial Street',NULL,'Greater London','England','E1 7NE','51.51743291864772','-0.07390837724608446',1,'2019-03-27 10:09:22','2022-10-27 11:39:32','Historic and Stunning, Large Central Bedford House','Amazing Georgian home which can accommodate several families (up to 20+): roaring fires, kitchen range vast living rooms (can be candlelit throughout), third-acre garden; lawn tennis, swimming, piano. Our home is in the centre of Bedford, close for shopping, a huge variety of restaurants and pubs. A five minute walk to the town and beautiful river beyond; less to the bus station, and ten to the railway station with easy access to London (35 minutes) and a short drive (45 minutes) to Cambridge.',87,'request',1,1,0,'approved',1,1,30,1,'2022-10-10',0,NULL,NULL,NULL,NULL,NULL,NULL),(8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589',NULL,NULL,'1','5',NULL,NULL,5,5,2.5,NULL,'IE','Aidan Chamberlain property is located in Killorglin, IE',NULL,'KE','County Kerry','53665','52.122014593253695','-9.751445003857414',1,'2020-01-23 05:50:54','2022-11-06 05:08:33','River Laune in Main st Killorglin, - 3-star guest','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English the banks of the River Laune in Killorglin, Couples particularly like the location, Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humor and the like). this 3-star guest house has pretty river and mountain views. There is free Wi-Fi throughout, and free private parking on site. Coffey\'s Rivers Edge guest house has a balcony running the width of the house, and you can sit outside to read, play cards, or enjoy a drink and the picturesque views.',90,'request',1,1,0,'approved',1,1,30,1,'2003-10-10',1,NULL,NULL,'2022-11-20','2022-11-15',NULL,NULL),(9,'3fcd41e0-376e-11ed-9bcb-1fd549eed589',NULL,NULL,NULL,NULL,NULL,NULL,1,2,1,NULL,'EG','26 July Street',NULL,'Qasr El Nil','Cairo Governorate','23123','30.0532812','31.2394727',0,'2022-11-06 09:36:25','2022-11-06 09:36:25',NULL,NULL,NULL,'instant',0,0,0,NULL,0,0,0,0,'2022-11-17',1,NULL,NULL,NULL,NULL,NULL,NULL),(10,'3fcd41e0-376e-11ed-9bcb-1fd549eed589',NULL,NULL,'1',NULL,NULL,NULL,2,2,1,NULL,'EG','26 July Street',NULL,'Qasr El Nil','Cairo Governorate','23123','30.0532812','31.2394727',0,'2022-11-06 10:07:02','2022-11-06 10:07:02',NULL,NULL,NULL,'instant',0,0,0,NULL,0,0,0,0,'2022-11-18',1,NULL,NULL,NULL,NULL,NULL,NULL),(11,'3fcd41e0-376e-11ed-9bcb-1fd549eed589',NULL,NULL,'1',NULL,NULL,NULL,2,1,1,NULL,'EG','26 July Street',NULL,'Qasr El Nil','Cairo Governorate','23123','30.0532812','31.2394727',0,'2022-11-06 10:20:53','2022-11-06 10:20:53',NULL,NULL,NULL,'instant',0,0,0,NULL,0,0,0,0,'2022-11-16',1,NULL,NULL,NULL,NULL,NULL,NULL),(13,'3fcd41e0-376e-11ed-9bcb-1fd549eed589',NULL,NULL,'1','1',NULL,NULL,1,2,1,NULL,'EG','26 July Street',NULL,'Qasr El Nil','Cairo Governorate','23123','30.0532812','31.2394727',0,'2022-11-07 11:07:37','2022-11-07 11:07:37',NULL,NULL,NULL,'instant',0,0,0,NULL,0,0,0,0,'2022-11-07',1,NULL,NULL,NULL,NULL,NULL,NULL),(14,'3fcd41e0-376e-11ed-9bcb-1fd549eed589',NULL,NULL,'1','1',NULL,NULL,1,3,1,NULL,'EG','26 July Street',NULL,'Qasr El Nil','Cairo Governorate','23123','30.053801239947486','31.24436504924316',1,'2022-11-07 11:13:20','2022-11-09 12:02:08','Historic Georgian Lakeside Mansion 500 acre Park3','sadd\nasdasdas\nasdasd',107,'instant',0,1,0,'pending',0,0,0,0,'2022-11-07',1,NULL,NULL,NULL,NULL,NULL,NULL),(15,'3fcd41e0-376e-11ed-9bcb-1fd549eed589',NULL,NULL,'1','1',NULL,NULL,1,1,0.5,NULL,'EG','26 July Street',NULL,'Qasr El Nil','Cairo Governorate','23123','30.053132616656253','31.242734266162106',1,'2022-11-07 11:45:00','2022-11-09 10:33:57','Historic Georgian Lakeside Mansion 500 acre Park2','asd\nasdsad\nasdasdas',104,'instant',0,1,0,'approved',0,0,0,0,'2022-11-07',1,NULL,NULL,NULL,NULL,NULL,NULL),(16,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',NULL,NULL,'0','5',NULL,NULL,3,7,2,NULL,'TR','Gaziantep Havaalanı','13','Oğuzeli','Gaziantep','12345','36.9435888','37.4763761',0,'2023-06-12 13:27:45','2023-06-12 13:27:45',NULL,NULL,NULL,'instant',0,0,0,NULL,0,0,0,0,'2023-06-15',1,NULL,NULL,NULL,NULL,NULL,NULL),(17,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',NULL,NULL,'0','2',NULL,NULL,5,5,2.5,NULL,'TR','new street',NULL,'İstanbul','İstanbul','159789','41.0082376','28.9783589',0,'2023-06-15 07:03:12','2023-06-15 07:03:12',NULL,NULL,NULL,'instant',0,0,0,NULL,0,0,0,0,'2023-08-05',1,NULL,NULL,NULL,NULL,NULL,NULL),(18,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',NULL,NULL,'1','1',NULL,NULL,1,1,1,NULL,'TR','fatih','14334232','İstanbul','İstanbul','234234','41.0168639','28.9470422',0,'2023-07-01 12:56:02','2023-07-01 12:56:02',NULL,NULL,NULL,'instant',0,0,0,NULL,0,0,0,0,'2023-07-05',1,NULL,NULL,NULL,NULL,NULL,NULL),(19,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',NULL,NULL,'1','4',NULL,NULL,3,5,3,NULL,'SY','3455435','3535','Mount Simeon','Aleppo Governorate','35435','36.0060628','37.0400339',0,'2023-07-15 07:45:21','2023-07-15 07:45:21',NULL,NULL,NULL,'instant',0,0,0,NULL,1,1,70,0,'2023-07-15',0,NULL,NULL,'2023-07-31','2023-07-15','TR','Turkey'),(20,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',NULL,NULL,'1','1',NULL,NULL,3,9,1,NULL,'TR','102220 ','35','Gaziantep','Gaziantep','27000','37.031419','37.3181961',0,'2023-07-16 12:39:42','2023-07-17 11:09:17',NULL,NULL,NULL,'instant',0,0,0,NULL,0,0,0,1,'2023-07-18',1,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Listing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ListingData`
--

DROP TABLE IF EXISTS `ListingData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListingData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) DEFAULT NULL,
  `bookingNoticeTime` varchar(255) DEFAULT NULL,
  `checkInStart` varchar(255) NOT NULL DEFAULT 'Flexible',
  `checkInEnd` varchar(255) NOT NULL DEFAULT 'Flexible',
  `minNight` int(11) DEFAULT NULL,
  `maxNight` int(11) DEFAULT NULL,
  `priceMode` tinyint(1) DEFAULT NULL,
  `basePrice` float DEFAULT 0,
  `maxPrice` float DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `hostingFrequency` varchar(255) DEFAULT NULL,
  `weeklyDiscount` float DEFAULT 0,
  `monthlyDiscount` float DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `cleaningPrice` float DEFAULT 0,
  `maxDaysNotice` enum('unavailable','3months','6months','9months','12months','available') NOT NULL DEFAULT 'unavailable',
  `cancellationPolicy` int(11) DEFAULT 1,
  `taxRate` float DEFAULT 0,
  `cleaningPriceMaxDays` int(11) DEFAULT 7,
  PRIMARY KEY (`id`),
  KEY `listId` (`listId`),
  CONSTRAINT `ListingData_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ListingData`
--

LOCK TABLES `ListingData` WRITE;
/*!40000 ALTER TABLE `ListingData` DISABLE KEYS */;
INSERT INTO `ListingData` VALUES (1,1,'59','14','19',0,6,NULL,135,NULL,'USD',NULL,2,5,'2019-03-27 09:49:54','2019-03-27 09:49:54',50,'available',2,0,7),(2,2,'58','Flexible','Flexible',0,4,NULL,250,NULL,'USD',NULL,5,10,'2019-03-27 09:52:48','2019-03-27 09:52:48',50,'available',3,0,7),(4,4,'59','10','15',1,10,NULL,550,NULL,'USD',NULL,3,6,'2019-03-27 09:59:06','2023-07-20 12:52:49',103,'available',1,0,7),(5,5,'59','16','19',1,11,NULL,650,NULL,'EUR',NULL,5,15,'2019-03-27 10:05:46','2023-04-16 18:38:57',50,'available',3,0,7),(6,6,'60','11','20',2,5,NULL,850,NULL,'EUR',NULL,5,10,'2019-03-27 10:08:24','2023-07-19 10:49:52',50,'available',1,0,7),(7,7,'59','15','Flexible',1,0,NULL,550,NULL,'EUR',NULL,3,8,'2019-03-27 10:11:05','2019-11-13 11:56:53',45,'available',2,0,7),(8,8,'60','10','20',1,20,NULL,750,NULL,'USD',NULL,4,12,'2020-01-23 05:53:23','2022-11-06 04:56:52',100,'available',3,0,5),(9,15,'59','8','Flexible',2,15,NULL,570,NULL,'USD',NULL,4,5,'2022-11-09 10:33:57','2022-11-09 10:33:57',25,'3months',1,0,7),(10,14,'58','Flexible','Flexible',2,3,NULL,450,NULL,'USD',NULL,4,5,'2022-11-09 12:01:51','2022-11-09 12:01:51',10,'available',1,0,4);
/*!40000 ALTER TABLE `ListingData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ListingPermissionHistory`
--

DROP TABLE IF EXISTS `ListingPermissionHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ListingPermissionHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `userId` char(36) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ListingPermissionHistory`
--

LOCK TABLES `ListingPermissionHistory` WRITE;
/*!40000 ALTER TABLE `ListingPermissionHistory` DISABLE KEYS */;
INSERT INTO `ListingPermissionHistory` VALUES (1,14,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','submitForverification',NULL,'2022-11-09 12:02:08','2022-11-09 12:02:08');
/*!40000 ALTER TABLE `ListingPermissionHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentMethods`
--

DROP TABLE IF EXISTS `PaymentMethods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaymentMethods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `processedIn` varchar(255) DEFAULT NULL,
  `fees` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `details` mediumtext DEFAULT NULL,
  `isEnable` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `paymentType` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentMethods`
--

LOCK TABLES `PaymentMethods` WRITE;
/*!40000 ALTER TABLE `PaymentMethods` DISABLE KEYS */;
INSERT INTO `PaymentMethods` VALUES (1,'Paypal','3–4 hours','PayPal withdrawal fees','USD','Connect your existing PayPal account.',1,'2017-04-18 20:13:25','2017-04-18 20:13:25',1),(2,'Bank Account','5–7 business days','No fees','USD','Add your bank details',1,'2018-01-04 17:26:45','2018-01-04 17:26:45',2);
/*!40000 ALTER TABLE `PaymentMethods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PaymentSettings`
--

DROP TABLE IF EXISTS `PaymentSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PaymentSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `paymentName` varchar(255) NOT NULL,
  `paymentStatus` enum('true','false') DEFAULT 'false',
  `paymentMode` enum('live','sandbox') DEFAULT 'sandbox',
  `email` varchar(255) DEFAULT NULL,
  `APIUserId` varchar(255) DEFAULT NULL,
  `APIPassword` varchar(255) DEFAULT NULL,
  `APISecret` varchar(255) DEFAULT NULL,
  `AppId` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PaymentSettings`
--

LOCK TABLES `PaymentSettings` WRITE;
/*!40000 ALTER TABLE `PaymentSettings` DISABLE KEYS */;
INSERT INTO `PaymentSettings` VALUES (1,'paypal','false','sandbox','admin@gmail.com','Hello User Id','Hello password','Hello Secret','Hello Id','2019-03-27 11:53:47','2017-02-24 11:29:31');
/*!40000 ALTER TABLE `PaymentSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Payout`
--

DROP TABLE IF EXISTS `Payout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Payout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `methodId` int(11) NOT NULL,
  `userId` char(36) NOT NULL,
  `payEmail` varchar(255) NOT NULL,
  `address1` mediumtext DEFAULT NULL,
  `address2` mediumtext DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `last4Digits` int(11) DEFAULT NULL,
  `isVerified` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `Payout_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Payout`
--

LOCK TABLES `Payout` WRITE;
/*!40000 ALTER TABLE `Payout` DISABLE KEYS */;
INSERT INTO `Payout` VALUES (1,1,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','dd@dd.com',NULL,NULL,'ee','123456','d','ddx','egy',1,'2022-09-11 18:24:57','2022-09-11 18:24:57',NULL,0);
/*!40000 ALTER TABLE `Payout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PopularLocation`
--

DROP TABLE IF EXISTS `PopularLocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PopularLocation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(255) NOT NULL,
  `locationAddress` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `isEnable` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PopularLocation`
--

LOCK TABLES `PopularLocation` WRITE;
/*!40000 ALTER TABLE `PopularLocation` DISABLE KEYS */;
INSERT INTO `PopularLocation` VALUES (1,'Greater London','198 Gambler Lane, Clarksburg, WV, USA','640cfab675d449a1187ffe26c17f3161.jpeg',1,'2019-03-27 10:17:45','2019-07-04 10:49:43'),(2,'Oristano','Oristano Stazione F.s., Oristano, Province of Oristano, Italy','9b1373af96b5dff40edd6bd9e7735cdb.jpeg',1,'2019-03-27 10:20:32','2019-07-04 10:53:02'),(3,'Basse-Normandie','Basse Normandie, Rue Verte, Hérouville-Saint-Clair, France','76c7707dbec00ac80e22b07cde982e33.jpeg',1,'2019-03-27 10:27:32','2019-07-04 10:57:37'),(4,'Fergus Falls','328 East Fir Avenue, Atwater, CA, USA','67416a5277d6d7b21236794d9548f04c.jpeg',1,'2019-03-27 10:28:56','2019-07-04 10:59:06'),(5,'SHIELS','76 Russell Rd, Nottingham, UK','13f96d1479f69394ae3947663a5b2746.jpeg',1,'2019-03-27 10:30:17','2019-07-04 11:00:44'),(7,'Cambridge','763 Massachusetts Avenue, Cambridge, MA 02420, U.S.','584540d3bc9408b86bc0507d668bd411.jpeg',1,'2019-07-04 11:03:21','2019-07-04 11:03:21'),(9,'Cambodia','no. 15 St 420, Phnom Penh, Cambodia','01310e90580242aaa6b1de8029d27d54.jpeg',1,'2019-07-04 11:17:30','2019-07-04 11:17:30'),(10,'Blue Lagoon, Ölüdeniz, Turkey','Laleli, Mimar Kemalettin Mahallesi, Fatih/Istanbul, Turkey','cb9a75cdf4f5f82eaae80d801e52b674.jpeg',1,'2019-07-04 11:18:38','2019-07-04 11:18:38'),(11,'Seychelles','Anse Source d\'Argent, La Digue, Seychelles','9f74354f93356bf6a3955804fd95020f.jpeg',1,'2019-07-04 11:19:11','2019-07-04 11:19:11'),(12,'New York','NYC, NY, USA','e6b011cfb2eaa59eb00278ebc066c4ee.jpeg',1,'2019-07-04 11:20:15','2019-07-04 11:20:15'),(13,'Paris','Paris-Charles de Gaulle Airport (CDG), Roissy-en-France, France','44931b9e30b46e51d1aa2bcb09f8b906.jpeg',1,'2019-07-04 11:20:48','2019-07-04 15:30:26'),(14,'Bradford','261 Southfield Lane, Bradford BD7 3NN, UK','1ce7239bb959bf72d651019eda3a8a2c.jpeg',1,'2019-07-04 11:21:19','2019-07-04 11:21:19');
/*!40000 ALTER TABLE `PopularLocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Recommend`
--

DROP TABLE IF EXISTS `Recommend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Recommend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Recommend`
--

LOCK TABLES `Recommend` WRITE;
/*!40000 ALTER TABLE `Recommend` DISABLE KEYS */;
INSERT INTO `Recommend` VALUES (1,7,'2019-03-27 10:32:50','2019-03-27 10:32:50'),(2,6,'2019-03-27 10:32:51','2019-03-27 10:32:51'),(3,5,'2019-03-27 10:32:52','2019-03-27 10:32:52'),(4,4,'2019-03-27 10:32:53','2019-03-27 10:32:53'),(5,3,'2019-03-27 10:32:54','2019-03-27 10:32:54'),(6,2,'2019-03-27 10:32:55','2019-03-27 10:32:55'),(7,1,'2019-03-27 10:32:56','2019-03-27 10:32:56');
/*!40000 ALTER TABLE `Recommend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReportUser`
--

DROP TABLE IF EXISTS `ReportUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReportUser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reporterId` varchar(255) NOT NULL,
  `userId` varchar(255) NOT NULL,
  `reportType` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReportUser`
--

LOCK TABLES `ReportUser` WRITE;
/*!40000 ALTER TABLE `ReportUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReportUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Repost`
--

DROP TABLE IF EXISTS `Repost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Repost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `new_night_price` float NOT NULL,
  `repost_transaction_id` int(11) DEFAULT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `maxRepostPercentage` tinyint(1) DEFAULT 30,
  `isFixedPrice` tinyint(1) DEFAULT 0,
  `numberOfDays` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `listing_id` (`listing_id`),
  CONSTRAINT `Repost_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Repost`
--

LOCK TABLES `Repost` WRITE;
/*!40000 ALTER TABLE `Repost` DISABLE KEYS */;
INSERT INTO `Repost` VALUES (1,'2023-01-20','2023-01-25',12.3,NULL,8,'2022-09-10 12:15:34','2022-09-10 12:15:34','completed',NULL,30,0,0),(2,'2023-10-10','2023-11-11',12.3,NULL,7,'2022-09-10 12:17:18','2022-09-10 12:17:18',NULL,NULL,30,0,0),(3,'2023-10-10','2023-11-11',12.3,NULL,7,'2022-09-10 12:17:20','2022-09-10 12:17:20',NULL,NULL,30,0,0),(4,'2023-10-10','2023-11-11',12.3,NULL,7,'2022-09-10 12:18:06','2022-09-10 12:18:06',NULL,NULL,30,0,0),(5,'2023-10-10','2023-11-11',12.3,1,7,'2022-09-10 19:38:57','2022-09-10 19:38:57','pending',NULL,30,0,0),(6,'2022-10-07','2022-10-10',710,NULL,7,'2022-10-06 09:05:29','2022-10-06 09:05:29','pending','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',30,0,0),(7,'2022-10-07','2022-10-10',700,NULL,7,'2022-10-06 09:08:04','2022-10-06 09:08:04','pending','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',30,0,0),(8,'2022-10-07','2022-10-10',710,21,7,'2022-10-06 09:17:31','2023-08-01 08:27:48','completed','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',30,0,0),(9,'2022-10-07','2022-10-10',710,NULL,7,'2022-10-06 09:21:07','2022-10-06 09:21:07','pending','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',30,0,0),(10,'2022-10-07','2022-10-10',710,NULL,7,'2022-10-06 09:22:11','2022-10-06 09:22:11','pending','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',30,0,0),(11,'2022-10-07','2022-10-10',710,NULL,7,'2022-10-06 09:27:41','2022-10-06 09:27:41','pending','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',30,0,0),(12,'2022-10-07','2022-10-10',710,NULL,7,'2022-10-06 09:39:04','2022-10-06 09:39:04','pending','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',30,0,0),(13,'2022-10-07','2022-10-10',710,NULL,7,'2022-10-06 09:46:32','2022-10-06 09:46:32','pending','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',30,0,0),(14,'2022-10-07','2022-10-10',705,NULL,7,'2022-10-06 09:50:51','2022-10-06 09:50:51','pending','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',30,0,0),(15,'2022-10-07','2022-10-10',706,NULL,7,'2022-10-06 09:52:37','2022-10-06 09:52:37','pending','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',30,0,0),(16,'2022-12-20','2022-12-25',707,4,4,'2022-10-06 09:55:26','2022-10-06 09:55:28','completed','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',30,0,0),(17,'2022-10-21','2022-10-26',810,5,4,'2022-10-11 10:56:40','2022-10-11 10:56:42','completed','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',30,0,0),(18,'2022-11-04','2022-11-12',745,6,4,'2022-10-23 07:05:56','2022-11-04 07:28:49','completed','3fcd41e0-376e-11ed-9bcb-1fd549eed589',25,0,0),(19,'2022-12-29','2023-01-02',680,7,4,'2022-10-27 07:23:29','2022-11-04 08:24:08','completed','3fcd41e0-376e-11ed-9bcb-1fd549eed589',25,1,0),(21,'2023-01-20','2023-01-26',670,9,4,'2022-10-30 09:44:36','2022-10-30 09:44:38','completed','3fcd41e0-376e-11ed-9bcb-1fd549eed589',25,0,0),(22,'2022-11-20','2022-11-28',635,10,4,'2022-11-03 04:25:13','2022-11-04 07:22:39','completed','3fcd41e0-376e-11ed-9bcb-1fd549eed589',25,1,0),(23,'2023-01-09','2023-01-17',683,11,4,'2022-11-04 09:34:16','2022-11-04 09:34:19','completed','3fcd41e0-376e-11ed-9bcb-1fd549eed589',25,0,0),(24,'2023-04-10','2023-04-17',657,12,4,'2022-11-04 10:37:14','2022-11-04 10:37:16','completed','3fcd41e0-376e-11ed-9bcb-1fd549eed589',25,1,0),(25,'2023-04-25','2023-04-27',650,13,4,'2022-11-04 10:40:17','2022-11-04 10:40:20','completed','3fcd41e0-376e-11ed-9bcb-1fd549eed589',25,0,0),(26,'2023-03-26','2023-03-30',650,14,4,'2022-11-04 10:47:29','2022-11-04 10:47:32','completed','3fcd41e0-376e-11ed-9bcb-1fd549eed589',25,1,0),(27,'2023-02-21','2023-02-27',650,15,4,'2022-11-04 11:44:18','2022-11-04 11:45:41','completed','3fcd41e0-376e-11ed-9bcb-1fd549eed589',25,1,0),(28,'2023-04-02','2023-04-07',657,16,4,'2022-11-15 16:33:13','2022-11-15 16:33:15','completed','3fcd41e0-376e-11ed-9bcb-1fd549eed589',25,1,0),(29,'2023-06-15','2023-06-24',650,17,4,'2022-11-15 16:35:55','2022-11-15 17:14:17','completed','3fcd41e0-376e-11ed-9bcb-1fd549eed589',25,1,0),(30,'2023-07-23','2023-07-29',900,NULL,8,'2023-07-23 07:19:35','2023-07-23 07:19:35','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,1,0),(31,'2023-07-23','2023-07-29',900,NULL,8,'2023-07-23 07:24:34','2023-07-23 07:24:34','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(32,'2023-07-23','2023-07-29',900,NULL,8,'2023-07-23 07:24:44','2023-07-23 07:24:44','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(33,'2023-07-25','2023-07-31',564,NULL,8,'2023-07-25 18:38:05','2023-07-25 18:38:05','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,1,0),(34,'2023-07-26','2023-07-31',567,NULL,8,'2023-07-26 06:32:05','2023-07-26 06:32:05','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(35,'2023-07-26','2023-07-31',567,NULL,8,'2023-07-26 06:32:41','2023-07-26 06:32:41','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,1,0),(36,'2023-07-29','2023-07-31',546,NULL,4,'2023-07-30 05:56:33','2023-07-30 05:56:33','pending','977bc550-5069-11e9-a14e-635e0fd3bfa6',25,0,0),(37,'2023-07-29','2023-07-31',34,NULL,4,'2023-07-30 06:03:21','2023-07-30 06:03:21','pending','977bc550-5069-11e9-a14e-635e0fd3bfa6',25,0,0),(38,'2023-07-29','2023-07-31',34,NULL,4,'2023-07-30 06:04:00','2023-07-30 06:04:00','pending','977bc550-5069-11e9-a14e-635e0fd3bfa6',25,0,0),(39,'2023-07-29','2023-07-31',34,NULL,4,'2023-07-30 06:08:35','2023-07-30 06:08:35','pending','977bc550-5069-11e9-a14e-635e0fd3bfa6',25,0,0),(40,'2023-07-30','2023-07-31',567,NULL,8,'2023-07-30 11:05:35','2023-07-30 11:05:35','pending','2d47f470-dc78-11ed-8493-97c361d41aef',30,0,0),(41,'2023-07-30','2023-07-31',55,NULL,8,'2023-07-30 11:24:34','2023-07-30 11:24:34','pending','2d47f470-dc78-11ed-8493-97c361d41aef',30,0,0),(42,'2023-07-30','2023-07-31',324,NULL,8,'2023-07-30 11:28:37','2023-07-30 11:28:37','pending','2d47f470-dc78-11ed-8493-97c361d41aef',30,0,0),(43,'2023-07-30','2023-07-31',454,NULL,8,'2023-07-30 11:30:38','2023-07-30 11:30:38','pending','2d47f470-dc78-11ed-8493-97c361d41aef',30,0,0),(44,'2023-08-09','2023-08-11',714.23,NULL,8,'2023-07-31 07:15:54','2023-07-31 07:15:54','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(45,'2023-08-23','2023-08-24',40.84,NULL,8,'2023-07-31 07:42:38','2023-07-31 07:42:38','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(46,'2023-08-27','2023-08-29',89.85,NULL,8,'2023-07-31 07:45:43','2023-07-31 07:45:43','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(47,'2023-08-23','2023-08-25',59.89,NULL,8,'2023-07-31 12:53:11','2023-07-31 12:53:11','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(48,'2023-08-22','2023-08-24',59.89,NULL,7,'2023-07-31 13:07:41','2023-07-31 13:07:41','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(49,'2023-09-11','2023-09-15',60.61,NULL,8,'2023-07-31 14:28:07','2023-07-31 14:28:07','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,1,0),(50,'2023-09-11','2023-09-15',380.21,NULL,8,'2023-07-31 14:28:59','2023-07-31 14:28:59','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,1,0),(51,'2023-09-11','2023-09-15',380.21,NULL,8,'2023-07-31 14:29:41','2023-07-31 14:29:41','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,1,0),(52,'2023-09-11','2023-09-15',380.21,NULL,8,'2023-07-31 14:31:05','2023-07-31 14:31:05','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,1,0),(53,'2023-08-23','2023-08-26',109.1,NULL,8,'2023-07-31 14:36:29','2023-07-31 14:36:29','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(54,'2023-08-23','2023-08-26',109.1,NULL,8,'2023-07-31 14:37:17','2023-07-31 14:37:17','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(55,'2023-08-23','2023-08-26',109.1,NULL,8,'2023-07-31 14:37:49','2023-07-31 14:37:49','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(56,'2023-08-23','2023-08-26',109.1,NULL,8,'2023-07-31 14:39:03','2023-07-31 14:39:03','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(57,'2023-08-23','2023-08-26',109.1,NULL,8,'2023-07-31 14:39:25','2023-07-31 14:39:25','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(58,'2023-08-23','2023-08-26',109.1,NULL,8,'2023-07-31 14:40:27','2023-07-31 14:40:27','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(59,'2023-08-23','2023-08-26',109.1,NULL,8,'2023-07-31 14:42:57','2023-07-31 14:42:57','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(60,'2023-09-13','2023-09-15',108.71,NULL,8,'2023-08-01 08:23:14','2023-08-01 08:23:14','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(61,'2023-09-13','2023-09-15',108.71,NULL,8,'2023-08-01 08:23:53','2023-08-01 08:23:53','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(62,'2023-09-13','2023-09-15',108.71,NULL,8,'2023-08-01 08:27:46','2023-08-01 08:27:46','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(63,'2023-09-11','2023-09-14',49.41,NULL,8,'2023-08-01 09:15:57','2023-08-01 09:15:57','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(64,'2023-09-11','2023-09-14',49.41,NULL,8,'2023-08-01 09:21:41','2023-08-01 09:21:41','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(65,'2023-09-11','2023-09-14',365.65,NULL,8,'2023-08-01 09:27:29','2023-08-01 09:27:29','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(66,'2023-09-11','2023-09-14',43.92,NULL,8,'2023-08-01 09:35:11','2023-08-01 09:35:11','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(67,'2023-09-11','2023-09-14',48.31,NULL,8,'2023-08-01 09:37:57','2023-08-01 09:37:57','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(68,'2023-09-11','2023-09-14',48.31,NULL,8,'2023-08-01 09:41:07','2023-08-01 09:41:07','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(69,'2023-09-11','2023-09-14',6099.72,NULL,8,'2023-08-01 09:59:53','2023-08-01 09:59:53','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(70,'2023-09-12','2023-09-14',54.9,NULL,8,'2023-08-01 14:11:28','2023-08-01 14:11:28','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(71,'2023-09-27','2023-09-28',107.61,NULL,8,'2023-08-01 14:50:29','2023-08-01 14:50:29','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(72,'2023-08-08','2023-08-10',9,NULL,7,'2023-08-02 05:43:42','2023-08-02 05:43:42','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(73,'2023-08-20','2023-08-21',90,NULL,8,'2023-08-02 06:06:37','2023-08-02 06:06:37','pending','2d47f470-dc78-11ed-8493-97c361d41aef',30,0,0),(74,'2023-08-22','2023-08-24',68,NULL,7,'2023-08-02 06:23:11','2023-08-02 06:23:11','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(75,'2023-08-22','2023-08-24',55,NULL,7,'2023-08-02 06:25:24','2023-08-02 06:25:24','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(76,'2023-08-10','2023-08-11',60.4,NULL,8,'2023-08-02 06:34:54','2023-08-02 06:34:54','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(77,'2023-08-11','2023-08-12',60.4,NULL,8,'2023-08-02 06:40:37','2023-08-02 06:40:37','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0),(78,'2023-08-11','2023-08-12',609.53,NULL,8,'2023-08-02 06:49:11','2023-08-02 06:49:11','pending','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',30,0,0);
/*!40000 ALTER TABLE `Repost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RepostFixedPrice`
--

DROP TABLE IF EXISTS `RepostFixedPrice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RepostFixedPrice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repostId` int(11) NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `price` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `repostId` (`repostId`),
  CONSTRAINT `repostfixedprice_ibfk_1` FOREIGN KEY (`repostId`) REFERENCES `Repost` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RepostFixedPrice`
--

LOCK TABLES `RepostFixedPrice` WRITE;
/*!40000 ALTER TABLE `RepostFixedPrice` DISABLE KEYS */;
INSERT INTO `RepostFixedPrice` VALUES (3,22,'2022-11-20','2022-11-22',655,'2022-11-04 07:22:39','2022-11-04 07:22:39'),(4,22,'2022-11-25','2022-11-26',670,'2022-11-04 07:22:39','2022-11-04 07:22:39'),(6,19,'2022-12-31','2023-01-01',687,'2022-11-04 08:24:08','2022-11-04 08:24:08'),(7,24,'2023-04-12','2023-04-14',680,'2022-11-04 10:37:14','2022-11-04 10:37:14'),(8,26,'2023-03-26','2023-03-27',665,'2022-11-04 10:47:29','2022-11-04 10:47:29'),(9,26,'2023-03-28','2023-03-29',680,'2022-11-04 10:47:29','2022-11-04 10:47:29'),(12,27,'2023-02-21','2023-02-23',675,'2022-11-04 11:45:41','2022-11-04 11:45:41'),(13,27,'2023-02-25','2023-02-26',680,'2022-11-04 11:45:41','2022-11-04 11:45:41'),(14,28,'2023-04-02','2023-04-03',670,'2022-11-15 16:33:13','2022-11-15 16:33:13'),(15,28,'2023-04-05','2023-04-07',680,'2022-11-15 16:33:13','2022-11-15 16:33:13'),(18,29,'2023-06-15','2023-06-17',672,'2022-11-15 17:14:17','2022-11-15 17:14:17'),(19,29,'2023-06-22','2023-06-24',685,'2022-11-15 17:14:17','2022-11-15 17:14:17'),(20,30,'2023-07-27','2023-07-29',850,'2023-07-23 07:19:35','2023-07-23 07:19:35'),(21,30,'2023-07-23','2023-07-24',600,'2023-07-23 07:19:35','2023-07-23 07:19:35'),(22,30,'2023-07-25','2023-07-26',400,'2023-07-23 07:19:35','2023-07-23 07:19:35'),(23,33,'2023-07-25','2023-07-27',567,'2023-07-25 18:38:05','2023-07-25 18:38:05'),(24,35,'2023-07-26','2023-07-29',77,'2023-07-26 06:32:41','2023-07-26 06:32:41'),(25,49,'2023-09-11','2023-09-12',109.1,'2023-07-31 14:28:07','2023-07-31 14:28:07'),(26,49,'2023-09-13','2023-09-14',99.18,'2023-07-31 14:28:07','2023-07-31 14:28:07'),(27,50,'2023-09-11','2023-09-13',109.1,'2023-07-31 14:28:59','2023-07-31 14:28:59'),(28,51,'2023-09-11','2023-09-13',120.23,'2023-07-31 14:29:41','2023-07-31 14:29:41'),(29,52,'2023-09-11','2023-09-13',132.5,'2023-07-31 14:31:05','2023-07-31 14:31:05');
/*!40000 ALTER TABLE `RepostFixedPrice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Repost_Share`
--

DROP TABLE IF EXISTS `Repost_Share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Repost_Share` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservation_id` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `amount` float NOT NULL,
  `host_id` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `repost_id` int(11) NOT NULL,
  `is_paid_out` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reservation_id` (`reservation_id`),
  KEY `transaction_id` (`transaction_id`),
  KEY `repost_id` (`repost_id`),
  CONSTRAINT `Repost_Share_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `Reservation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Repost_Share_ibfk_2` FOREIGN KEY (`transaction_id`) REFERENCES `Transaction` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Repost_Share_ibfk_3` FOREIGN KEY (`repost_id`) REFERENCES `Repost` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Repost_Share`
--

LOCK TABLES `Repost_Share` WRITE;
/*!40000 ALTER TABLE `Repost_Share` DISABLE KEYS */;
/*!40000 ALTER TABLE `Repost_Share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reposts_Transaction`
--

DROP TABLE IF EXISTS `Reposts_Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reposts_Transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repost_id` int(11) NOT NULL,
  `payer_email` varchar(255) DEFAULT NULL,
  `payer_id` varchar(255) DEFAULT NULL,
  `receiver_email` varchar(255) DEFAULT NULL,
  `receiver_id` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT '1',
  `total` float NOT NULL,
  `transaction_fee` float DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `ipn_track_id` varchar(255) DEFAULT NULL,
  `payment_type` enum('booking','cancellation','host') DEFAULT 'booking',
  `payment_method_id` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `repost_id` (`repost_id`),
  CONSTRAINT `reposts_transaction_ibfk_1` FOREIGN KEY (`repost_id`) REFERENCES `Repost` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reposts_Transaction`
--

LOCK TABLES `Reposts_Transaction` WRITE;
/*!40000 ALTER TABLE `Reposts_Transaction` DISABLE KEYS */;
INSERT INTO `Reposts_Transaction` VALUES (1,13,'abdelrhman.sapry.alwtany@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3LpqezA3oQdQ8GEm15rWnSMQ',1640,NULL,'USD',NULL,'booking','pm_1LpqeoA3oQdQ8GEmFc4tJSGC','2022-10-06 09:46:35','2022-10-06 09:46:35'),(2,14,'abdelrhman.sapry.alwtany@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3Lpqj9A3oQdQ8GEm0LnoKw8H',1640,NULL,'USD',NULL,'booking','pm_1Lpqj8A3oQdQ8GEmFkcRWByh','2022-10-06 09:50:53','2022-10-06 09:50:53'),(3,15,'abdelrhman.sapry.alwtany@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3LpqksA3oQdQ8GEm0c88TSoS',1640,NULL,'USD',NULL,'booking','pm_1LpqkqA3oQdQ8GEmOt3mGizX','2022-10-06 09:52:39','2022-10-06 09:52:39'),(4,16,'abdelrhman.sapry.alwtany@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3LpqnbA3oQdQ8GEm17TFfN17',1640,NULL,'USD',NULL,'booking','pm_1LpqnZA3oQdQ8GEmcdYIfh1U','2022-10-06 09:55:28','2022-10-06 09:55:28'),(5,17,'abdelrhman.sapry.alwtany@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3Lrg8aA3oQdQ8GEm1U7tLewK',929,NULL,'USD',NULL,'booking','pm_1Lrg8ZA3oQdQ8GEm2lrs0vov','2022-10-11 10:56:42','2022-10-11 10:56:42'),(6,18,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3LvyFtA3oQdQ8GEm0DQAMthH',4222,NULL,'USD',NULL,'booking','pm_1LvyFrA3oQdQ8GEmxAXv1VXu','2022-10-23 07:05:58','2022-10-23 07:05:58'),(7,19,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3LxQR4A3oQdQ8GEm1b7P1lVq',2200,NULL,'USD',NULL,'booking','pm_1LxQR3A3oQdQ8GEmiyTD2Fn2','2022-10-27 07:23:32','2022-10-27 07:23:32'),(9,21,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3LyY4HA3oQdQ8GEm0ZDrS4dH',4268,NULL,'USD',NULL,'booking','pm_1LyY4GA3oQdQ8GEmo6aekRks','2022-10-30 09:44:38','2022-10-30 09:44:38'),(10,22,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3LzuzOA3oQdQ8GEm0xN87nmL',4268,NULL,'USD',NULL,'booking','pm_1LzuzMA3oQdQ8GEm22oP60Kw','2022-11-03 04:25:16','2022-11-03 04:25:16'),(11,23,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3M0MI1A3oQdQ8GEm1LcP7opZ',4268,NULL,'USD',NULL,'booking','pm_1M0MI0A3oQdQ8GEml4Y3t2YV','2022-11-04 09:34:19','2022-11-04 09:34:19'),(12,24,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3M0NGwA3oQdQ8GEm0CWdXcxR',3735,NULL,'USD',NULL,'booking','pm_1M0NGvA3oQdQ8GEm8uJrr6Rm','2022-11-04 10:37:16','2022-11-04 10:37:16'),(13,25,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3M0NJuA3oQdQ8GEm1JdagGyq',1100,NULL,'USD',NULL,'booking','pm_1M0NJtA3oQdQ8GEmPyhVmXHT','2022-11-04 10:40:20','2022-11-04 10:40:20'),(14,26,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3M0NQsA3oQdQ8GEm0SGREZa9',2200,NULL,'USD',NULL,'booking','pm_1M0NQqA3oQdQ8GEmCvJNN7bK','2022-11-04 10:47:32','2022-11-04 10:47:32'),(15,27,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3M0OJqA3oQdQ8GEm0THGMAdm',3300,NULL,'USD',NULL,'booking','pm_1M0OJpA3oQdQ8GEmNNrrlqGi','2022-11-04 11:44:20','2022-11-04 11:44:20'),(16,28,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3M4S4TA3oQdQ8GEm07paEmsx',2750,NULL,'USD',NULL,'booking','pm_1M4S4SA3oQdQ8GEmDjFbQJdo','2022-11-15 16:33:15','2022-11-15 16:33:15'),(17,29,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3M4S75A3oQdQ8GEm1yHcavZJ',4802,NULL,'USD',NULL,'booking','pm_1M4S74A3oQdQ8GEm82OWSX4c','2022-11-15 16:35:57','2022-11-15 16:35:57'),(18,8,'U2FsdGVkX18+HPnqPfUPXNSPg5a9wb46p2Ad9DfcXD/9v6EsHigqN0exnMO7VI0J','cus_OMZNTFmogUrtZg',NULL,NULL,'pi_3NZqkYIvM8AX56ru25ZGVSfE',750,NULL,'USD',NULL,'booking','pm_1NZqkTIvM8AX56ruKUj9HY5f','2023-07-31 07:42:43','2023-07-31 07:42:43'),(19,8,'U2FsdGVkX18+HPnqPfUPXNSPg5a9wb46p2Ad9DfcXD/9v6EsHigqN0exnMO7VI0J','cus_OMZNTFmogUrtZg',NULL,NULL,'pi_3NZqnWIvM8AX56ru1Fb67sVJ',1500,NULL,'USD',NULL,'booking','pm_1NZqnSIvM8AX56ruVS4fceOJ','2023-07-31 07:45:47','2023-07-31 07:45:47'),(20,8,'demo@radicalstart.com','cus_OMZNTFmogUrtZg',NULL,NULL,'pi_3NaDrxIvM8AX56ru13tI3NlN',1366,NULL,'USD',NULL,'booking','pm_1NaDrwIvM8AX56ruuSLe0ssk','2023-08-01 08:23:54','2023-08-01 08:23:54'),(21,8,'demo@radicalstart.com','cus_OMZNTFmogUrtZg',NULL,NULL,'pi_3NaDvjIvM8AX56ru0jIZDI05',1366,NULL,'USD',NULL,'booking','pm_1NaDviIvM8AX56ruJOMpzU7k','2023-08-01 08:27:48','2023-08-01 08:27:48');
/*!40000 ALTER TABLE `Reposts_Transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reservation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `hostId` varchar(255) NOT NULL,
  `guestId` varchar(255) NOT NULL,
  `checkIn` date NOT NULL,
  `checkOut` date NOT NULL,
  `guests` int(11) DEFAULT 1,
  `message` mediumtext DEFAULT NULL,
  `basePrice` float NOT NULL,
  `cleaningPrice` float DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `discount` float DEFAULT NULL,
  `discountType` varchar(255) DEFAULT NULL,
  `guestServiceFee` float DEFAULT NULL,
  `hostServiceFee` float DEFAULT NULL,
  `total` float(9,2) DEFAULT NULL,
  `confirmationCode` int(11) DEFAULT NULL,
  `paymentState` enum('pending','completed') DEFAULT 'pending',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `payoutId` int(11) DEFAULT NULL,
  `reservationState` enum('pending','approved','declined','completed','cancelled','expired') NOT NULL DEFAULT 'pending',
  `paymentMethodId` tinyint(1) DEFAULT NULL,
  `cancellationPolicy` int(11) DEFAULT NULL,
  `isSpecialPriceAverage` float DEFAULT NULL,
  `dayDifference` float DEFAULT NULL,
  `paymentIntentId` varchar(255) DEFAULT NULL,
  `taxRate` float DEFAULT 0,
  `isHold` tinyint(1) NOT NULL DEFAULT 0,
  `paymentAttempt` int(11) NOT NULL DEFAULT 0,
  `checkInStart` varchar(20) NOT NULL,
  `checkInEnd` varchar(20) NOT NULL,
  `bookingType` varchar(20) DEFAULT NULL,
  `hostServiceFeeType` varchar(255) NOT NULL,
  `hostServiceFeeValue` float NOT NULL,
  `isPublic` tinyint(1) DEFAULT 1,
  `splitAndShare` tinyint(1) DEFAULT 1,
  `swapId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
INSERT INTO `Reservation` VALUES (1,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-16','2022-08-19',1,'hhhhhhhhhhh',850,50,'EUR',0,NULL,78,234,2600.00,105040,'completed','2022-08-12 16:45:58','2022-10-22 06:55:00',NULL,'completed',2,1,850,3,'pi_3LW0zmA3oQdQ8GEm1wzJ0Ffx',0,0,0,'11','20','instant','percentage',9,1,1,NULL),(2,5,'977bc550-5069-11e9-a14e-635e0fd3bfa6','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-21','2022-08-24',1,'zzzzzzzzzz',650,NULL,'EUR',0,NULL,58.5,175.5,1950.00,723382,'completed','2022-08-13 03:48:10','2022-09-22 06:55:00',NULL,'expired',2,3,650,3,'pi_3LWBKbA3oQdQ8GEm06vg9MUW',0,0,0,'16','19','request','percentage',9,1,1,NULL),(3,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,771129,'pending','2022-08-22 17:16:14','2022-09-22 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(4,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,625010,'pending','2022-08-22 17:20:58','2022-09-22 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(5,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,791443,'pending','2022-08-22 17:26:01','2022-09-22 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(6,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,131807,'pending','2022-08-22 17:52:43','2022-09-22 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(7,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,481480,'completed','2022-08-22 17:53:39','2023-08-02 05:44:26',NULL,'expired',NULL,NULL,NULL,NULL,'pi_3NaXqUIvM8AX56ru2hW1Bq58',0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(8,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,794503,'pending','2022-08-22 17:54:23','2022-09-22 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(9,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,934035,'pending','2022-08-22 18:03:52','2022-09-22 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(10,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,866782,'pending','2022-08-22 18:05:47','2022-09-22 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(11,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,980231,'pending','2022-08-22 18:27:10','2022-09-22 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(12,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dxxxc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,433455,'pending','2022-08-22 18:27:52','2022-09-27 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(13,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dxxxc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,763556,'pending','2022-08-22 18:28:02','2022-09-27 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(14,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dxxxc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,767587,'pending','2022-08-22 18:28:08','2022-09-27 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(15,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dxxxc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,521211,'pending','2022-08-22 18:30:20','2022-09-27 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,0,NULL),(16,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dxxxc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,806174,'pending','2022-08-22 18:31:00','2022-09-27 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(17,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dxxxc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,462723,'pending','2022-08-22 20:37:48','2022-09-27 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(18,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dxxxc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,431171,'pending','2022-08-22 20:52:30','2022-09-27 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(19,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dxxxc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,511792,'pending','2022-08-22 21:57:51','2022-09-27 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,0,NULL),(20,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dxxxc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,969347,'pending','2022-08-22 21:58:10','2022-09-27 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(21,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dxxxc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,112679,'pending','2022-08-22 22:02:14','2022-09-27 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(22,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dxxxc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,204203,'pending','2022-08-22 22:03:33','2022-09-28 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(23,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dxxxc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,952913,'pending','2022-08-22 22:04:06','2022-09-28 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(24,123,'dddd','vfvfv','2022-10-23','2022-10-30',4,'dxxxc',15,NULL,'dol',NULL,NULL,NULL,2.2,50.00,988854,'pending','2022-08-22 22:07:09','2022-09-28 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(25,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,375314,'pending','2022-08-22 22:14:08','2022-09-28 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(26,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,267627,'pending','2022-08-22 22:14:10','2022-09-28 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(27,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,815989,'pending','2022-08-22 22:14:27','2022-09-28 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,0,NULL),(28,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,659027,'pending','2022-08-22 22:15:02','2022-09-28 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,0,NULL),(29,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,315504,'pending','2022-08-22 22:15:08','2022-09-28 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(30,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,949012,'pending','2022-08-22 22:15:10','2022-09-28 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(31,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,752929,'pending','2022-08-22 22:15:16','2022-09-28 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,0,NULL),(32,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,794055,'pending','2022-08-22 22:48:43','2022-09-29 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,0,NULL),(33,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,710027,'pending','2022-08-22 22:48:52','2022-09-29 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(34,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,617813,'pending','2022-08-22 22:56:58','2022-09-29 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(35,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,545827,'pending','2022-08-22 22:59:17','2022-08-30 07:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(36,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,340894,'pending','2022-08-22 23:02:45','2022-09-29 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(37,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,680415,'pending','2022-08-22 23:04:16','2022-09-29 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(38,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,723952,'pending','2022-08-22 23:12:15','2022-09-29 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(39,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,448350,'pending','2022-08-22 23:13:17','2022-09-29 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(40,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,742606,'pending','2022-08-22 23:14:08','2022-09-29 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(41,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,983413,'pending','2022-08-22 23:21:12','2022-09-29 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(42,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,570413,'pending','2022-08-22 23:21:21','2022-09-29 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(43,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,376479,'pending','2022-08-22 23:23:23','2022-10-06 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(44,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,116767,'pending','2022-08-22 23:31:06','2022-10-06 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(45,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,955535,'pending','2022-08-22 23:47:23','2022-10-06 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(46,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,483703,'pending','2022-08-22 23:47:43','2022-10-06 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(47,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,661234,'pending','2022-08-22 23:48:19','2022-10-06 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(48,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,744023,'pending','2022-08-22 23:53:39','2022-10-06 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(49,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,455099,'pending','2022-08-23 00:01:54','2022-10-06 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(50,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,752240,'pending','2022-08-23 00:16:45','2022-10-06 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(51,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,590284,'pending','2022-08-23 00:23:06','2022-10-06 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(52,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,181255,'pending','2022-08-23 00:26:11','2022-10-06 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(53,123,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,826302,'pending','2022-08-23 00:52:43','2022-10-18 06:55:00',NULL,'expired',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(54,8,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-10-23','2022-10-30',1,'Hello',15,NULL,'USD',NULL,NULL,NULL,2.2,50.00,220142,'completed','2022-08-23 03:11:18','2022-08-30 08:41:02',NULL,'completed',NULL,NULL,NULL,NULL,NULL,0,0,0,'10-23-2022','10-30-2022',NULL,'fee',1,1,1,NULL),(55,5,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-09-22','2022-09-24',0,'dssdfdsf fsdfsdfsd',650,NULL,'EUR',0,NULL,39,117,1300.00,328388,'pending','2022-09-18 16:29:39','2022-10-18 06:55:00',NULL,'expired',2,3,650,2,NULL,0,0,0,'16','19','request','percentage',9,0,0,NULL),(56,5,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-09-22','2022-09-24',0,'sadas asdasd asdasdasd asdasdsa',650,NULL,'EUR',0,NULL,39,117,1300.00,728472,'pending','2022-09-18 16:30:57','2022-10-18 06:55:00',NULL,'expired',2,3,650,2,NULL,0,0,0,'16','19','request','percentage',9,0,0,NULL),(57,5,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-09-22','2022-09-25',0,'afgdg dgdsfdsf fdsfds',650,NULL,'EUR',0,NULL,58.5,175.5,1950.00,172853,'pending','2022-09-18 16:33:41','2022-10-18 06:55:00',NULL,'expired',2,3,650,3,NULL,0,0,0,'16','19','request','percentage',9,1,1,NULL),(58,7,'977bc550-5069-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-09-29','2022-09-30',0,'edwwq dadsasd ddasdsadasd asdsa',550,45,'EUR',0,NULL,17.85,53.55,595.00,980353,'pending','2022-09-26 13:48:25','2022-10-18 06:55:00',NULL,'expired',2,2,550,1,NULL,0,0,0,'15','Flexible','request','percentage',9,0,0,NULL),(59,7,'977bc550-5069-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-09-27','2022-09-29',0,'sadsd adsad sdadad',550,45,'EUR',0,NULL,34.35,103.05,1145.00,281160,'pending','2022-09-27 06:41:13','2022-10-18 06:55:00',NULL,'expired',2,2,550,2,NULL,0,0,0,'15','Flexible','request','percentage',9,0,1,NULL),(60,7,'977bc550-5069-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-09-27','2022-09-29',0,'ascas sadsads fsasaf',550,45,'EUR',0,NULL,34.35,103.05,1145.00,732903,'pending','2022-09-27 06:47:11','2022-10-18 06:55:00',NULL,'expired',2,2,550,2,NULL,0,0,0,'15','Flexible','request','percentage',9,0,1,NULL),(61,7,'977bc550-5069-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-09-27','2022-09-29',0,'sdsas asdasd sadasdas',550,45,'EUR',0,NULL,34.35,103.05,1145.00,277140,'completed','2022-09-27 06:53:55','2022-10-18 06:55:00',NULL,'expired',2,2,550,2,'pi_3LmXg0A3oQdQ8GEm0fp3EE1J',0,0,0,'15','Flexible','request','percentage',9,0,0,NULL),(62,8,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-09-27','2022-09-30',0,'csa f afsfsa saasdas',750,25,'USD',0,NULL,68.25,204.75,2275.00,694523,'completed','2022-09-27 07:01:17','2022-10-18 06:55:00',NULL,'expired',2,3,750,3,'pi_3LmXn8A3oQdQ8GEm14sa5DOL',0,0,0,'10','20','request','percentage',9,0,1,NULL),(63,1,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-09-28','2022-09-30',0,'fds aassadasd',135,50,'USD',0,NULL,9.6,28.8,320.00,155142,'completed','2022-09-28 11:01:42','2022-10-18 06:55:00',NULL,'expired',2,2,135,2,'pi_3Lmy1LA3oQdQ8GEm0PPXcvTy',0,0,0,'14','19','request','percentage',9,0,1,NULL),(64,3,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-10-12','2022-10-14',0,'sad asdasd sdasdas',500,50,'USD',0,NULL,31.5,94.5,1050.00,690906,'completed','2022-09-28 11:32:29','2022-10-22 06:55:00',NULL,'expired',2,1,500,2,'pi_3LmyV7A3oQdQ8GEm1Ubzfekf',0,0,0,'14','22','request','percentage',9,0,1,NULL),(65,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-22','2022-11-25',1,'sda sadasdsdsa',550,103,'USD',0,NULL,52.59,157.77,1753.00,737335,'completed','2022-10-24 06:25:25','2022-10-29 06:55:00',NULL,'expired',2,1,550,3,'pi_3LwK6EA3oQdQ8GEm1RGiuKai',0,0,0,'10','15','request','percentage',9,0,0,NULL),(66,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-10-27','2022-10-29',1,'sdas sdasd sadasds',850,50,'EUR',0,NULL,52.5,157.5,1750.00,372835,'completed','2022-10-24 17:26:10','2022-10-29 06:55:00',NULL,'completed',2,1,850,2,'pi_3LwUPfA3oQdQ8GEm1GTwYjwa',0,0,0,'11','20','instant','percentage',9,0,0,NULL),(81,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2023-03-02','2023-03-09',1,'Finish Swap Booking',550,103,'USD',NULL,NULL,52.59,NULL,1805.59,703146,'completed','2022-10-31 14:46:24','2023-03-09 07:55:00',NULL,'completed',2,2,NULL,3,'pi_3LyzFsA3oQdQ8GEm1EoO8a1e',0,0,0,'2023-03-02','2023-03-09','instant','fee',1,0,0,5),(83,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-12-23','2022-12-27',1,'hi',550,103,'USD',0,NULL,69.09,207.27,2617.00,429163,'pending','2022-11-04 11:40:10','2022-11-07 07:55:00',NULL,'expired',2,1,628.5,4,NULL,0,0,0,'10','15','request','percentage',9,0,0,NULL),(84,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2023-03-10','2023-03-18',1,'Finish Swap Booking',550,103,'USD',NULL,NULL,36.09,NULL,1239.09,668289,'completed','2022-11-04 17:30:47','2023-03-18 06:55:00',NULL,'completed',2,2,NULL,2,'pi_3M0TjBA3oQdQ8GEm1pTACYmT',0,0,0,'2023-03-10','2023-03-18','instant','fee',1,0,0,6),(89,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2023-05-01','2023-05-09',1,'Finish Swap Booking',550,103,'USD',214.5,'3% weekly price discount',69.09,NULL,2172.09,263450,'completed','2022-11-05 13:23:02','2023-05-09 06:55:00',NULL,'completed',2,2,NULL,4,'pi_3M0mKxA3oQdQ8GEm0wn3VMGi',0,0,0,'2023-05-01','2023-05-09','instant','fee',1,0,0,7),(90,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-04-03','2023-04-18',0,'hello ahmed',750,300,'USD',450,'4% weekly price discount',333,999,11100.00,173940,'completed','2022-11-06 06:04:23','2022-11-07 07:55:00',NULL,'expired',2,3,750,15,'pi_3M11y0A3oQdQ8GEm0aWLbgrY',0,0,0,'10','20','request','percentage',9,0,0,NULL),(91,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-01-08','2023-01-19',0,'hi',750,300,'USD',330,'4% weekly price discount',246.6,739.8,8220.00,304198,'completed','2022-11-06 07:57:14','2022-11-08 07:55:00',NULL,'expired',2,3,750,11,'pi_3M13jDA3oQdQ8GEm1uIkrkIk',0,0,0,'10','20','request','percentage',9,0,0,NULL),(93,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-18','2022-11-30',1,'Finish Swap Booking',750,200,'USD',270,'4% weekly price discount',206.66,601.2,6680.00,443431,'completed','2022-11-06 09:18:32','2022-11-30 07:55:00',NULL,'completed',2,2,NULL,9,'pi_3M14ztA3oQdQ8GEm0n57MW4Z',0,0,0,'2022-11-18','2022-11-30','instant','percentage',9,0,0,10),(94,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2023-05-17','2023-05-24',1,'Finish Swap Booking',550,103,'USD',NULL,NULL,88.16,238.77,2653.00,369768,'completed','2022-11-15 17:37:42','2023-05-24 06:55:00',NULL,'completed',2,2,NULL,5,'pi_3M4T4sA3oQdQ8GEm0u0h6wUu',0,0,0,'2023-05-17','2023-05-24','instant','percentage',9,0,0,12),(95,5,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-04-19','2023-04-21',0,'Hello',650,50,'EUR',0,NULL,41.715,125.145,1350.00,191049,'completed','2023-04-16 17:30:25','2023-04-18 06:55:00',NULL,'expired',2,3,650,2,'pi_3MxZPCA3oQdQ8GEm1arPfaX2',0,0,0,'16','19','request','percentage',9,0,0,NULL),(96,5,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-04-23','2023-04-26',0,'hello',650,50,'EUR',0,NULL,61.8,185.4,2000.00,334559,'completed','2023-04-16 18:11:19','2023-04-26 06:55:00',NULL,'completed',2,3,650,3,'pi_3Mxa2mA3oQdQ8GEm08nEBZvG',0,0,0,'16','19','request','percentage',9,0,0,NULL),(97,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-06-19','2023-06-21',0,'Hello ',850,50,'EUR',0,NULL,54.075,162.225,1750.00,286205,'pending','2023-06-11 12:53:10','2023-06-21 06:55:00',NULL,'completed',2,1,850,2,NULL,0,0,0,'11','20','instant','percentage',9,1,1,NULL),(98,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-06-12','2023-06-14',0,'Hello 011',850,50,'EUR',0,NULL,54.075,162.225,1750.00,839875,'completed','2023-06-11 13:19:21','2023-06-14 06:55:00',NULL,'completed',2,1,850,2,'pi_3NHoAwA3oQdQ8GEm1DLwOlJE',0,0,0,'11','20','instant','percentage',9,0,0,NULL),(99,7,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-06-21','2023-06-30',0,'sdcsdcsdc',550,90,'EUR',148.5,'3% weekly price discount',151.281,453.843,4891.50,749755,'completed','2023-06-12 13:24:51','2023-06-14 06:55:00',NULL,'expired',2,2,550,9,'pi_3NIAjoA3oQdQ8GEm0Y2wJi3f',0,0,0,'15','Flexible','request','percentage',9,0,0,NULL),(100,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-23','2023-07-31',0,'4564565464 54645 6',750,200,'USD',240,'4% weekly price discount',184.38,553.14,5960.00,664203,'pending','2023-07-23 07:34:43','2023-07-24 06:55:00',NULL,'expired',1,3,750,8,NULL,0,0,0,'10','20','request','percentage',9,1,1,NULL),(101,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-23','2023-07-31',0,'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr',750,200,'USD',240,'4% weekly price discount',184.38,553.14,5960.00,515097,'pending','2023-07-23 07:40:24','2023-07-24 06:55:00',NULL,'expired',1,3,750,8,NULL,0,0,0,'10','20','request','percentage',9,0,0,NULL),(102,7,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-27','2023-07-31',1,'Hhhkbcjnv jgg',550,45,'EUR',0,NULL,66,198,2245.00,449179,'pending','2023-07-23 07:45:39','2023-07-25 06:55:00',NULL,'expired',1,2,550,4,NULL,0,0,0,'15','Flexible',NULL,'percentage',9,1,1,NULL),(103,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-26','2023-07-28',1,'Gggh',850,50,'EUR',0,NULL,51,153,1750.00,608361,'pending','2023-07-24 10:33:30','2023-07-29 06:55:00',NULL,'completed',1,1,850,2,NULL,0,0,0,'11','20',NULL,'percentage',9,1,1,NULL),(104,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-26','2023-07-29',0,'Hi ',850,50,'EUR',0,NULL,80.34,241.02,2600.00,173905,'pending','2023-07-26 07:45:30','2023-07-29 06:55:00',NULL,'completed',2,1,850,3,NULL,0,0,0,'11','20','instant','percentage',9,0,0,NULL),(105,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-26','2023-07-29',0,'Hi ',850,50,'EUR',0,NULL,80.34,241.02,2600.00,301831,'pending','2023-07-26 07:45:58','2023-07-29 06:55:00',NULL,'completed',2,1,850,3,NULL,0,0,0,'11','20','instant','percentage',9,0,0,NULL),(106,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-26','2023-07-29',0,'Hi ',850,50,'EUR',0,NULL,80.34,241.02,2600.00,968866,'pending','2023-07-26 07:46:04','2023-07-29 06:55:00',NULL,'completed',2,1,850,3,NULL,0,0,0,'11','20','instant','percentage',9,0,0,NULL),(107,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-26','2023-07-29',0,'Hi',850,50,'EUR',0,NULL,80.34,241.02,2600.00,239580,'pending','2023-07-26 08:03:10','2023-07-29 06:55:00',NULL,'completed',2,1,850,3,NULL,0,0,0,'11','20','instant','percentage',9,0,0,NULL),(108,7,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-27','2023-07-29',1,'Hhh',550,45,'EUR',0,NULL,33,99,1145.00,940221,'pending','2023-07-27 13:06:45','2023-07-28 06:55:00',NULL,'expired',2,2,550,2,NULL,0,0,0,'15','Flexible',NULL,'percentage',9,1,1,NULL),(109,7,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-29','2023-07-31',1,'Hhh',550,45,'EUR',0,NULL,33,99,1145.00,477862,'pending','2023-07-29 11:21:36','2023-07-30 06:55:00',NULL,'expired',2,2,550,2,NULL,0,0,0,'15','Flexible',NULL,'percentage',9,1,1,NULL),(110,7,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-29','2023-07-31',1,'Hhh',550,45,'EUR',0,NULL,33,99,1145.00,110862,'pending','2023-07-29 11:21:43','2023-07-30 06:55:00',NULL,'expired',2,2,550,2,NULL,0,0,0,'15','Flexible',NULL,'percentage',9,1,1,NULL),(111,7,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-29','2023-07-31',1,'Hhh',550,45,'EUR',0,NULL,33,99,1145.00,200240,'pending','2023-07-29 11:21:51','2023-07-30 06:55:00',NULL,'expired',1,2,550,2,NULL,0,0,0,'15','Flexible',NULL,'percentage',9,1,1,NULL),(112,7,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-29','2023-07-31',1,'Gg',550,45,'EUR',0,NULL,33,99,1145.00,235553,'pending','2023-07-29 11:40:22','2023-07-30 06:55:00',NULL,'expired',2,2,550,2,NULL,0,0,0,'15','Flexible',NULL,'percentage',9,1,1,NULL),(113,7,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-29','2023-07-31',1,'Gg',550,45,'EUR',0,NULL,33,99,1145.00,108164,'pending','2023-07-29 11:40:31','2023-07-30 06:55:00',NULL,'expired',2,2,550,2,NULL,0,0,0,'15','Flexible',NULL,'percentage',9,1,1,NULL),(114,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-10','2023-08-12',1,'tttttt',750,100,'USD',0,NULL,49.44,49.44,1600.00,755625,'pending','2023-07-30 20:44:59','2023-08-01 06:55:00',NULL,'expired',2,3,750,2,NULL,0,0,0,'10','20','request','percentage',3,0,0,NULL),(115,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-24','2023-08-25',1,'fff\n',750,100,'USD',0,NULL,26.265,26.265,850.00,311986,'pending','2023-07-30 23:02:08','2023-08-01 06:55:00',NULL,'expired',2,3,750,1,NULL,0,0,0,'10','20','request','percentage',3,0,0,NULL),(116,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-10','2023-08-11',1,'fff\n',750,100,'USD',0,NULL,26.265,26.265,850.00,255918,'pending','2023-07-31 06:42:44','2023-08-02 06:55:00',NULL,'expired',2,3,750,1,NULL,0,0,0,'10','20','request','percentage',3,0,0,NULL),(117,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-23','2023-08-25',1,'etert',850,50,'USD',0,NULL,54.075,54.075,1750.00,645428,'pending','2023-07-31 06:56:21','2023-07-31 06:56:21',NULL,'approved',2,1,850,2,NULL,0,0,0,'11','20','instant','percentage',3,0,0,NULL),(118,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-23','2023-08-25',1,'etert',850,50,'USD',0,NULL,54.075,54.075,1750.00,227608,'pending','2023-07-31 06:58:57','2023-07-31 06:58:57',NULL,'approved',2,1,850,2,NULL,0,0,0,'11','20','instant','percentage',3,0,0,NULL),(119,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-23','2023-08-25',1,'etert',850,50,'USD',0,NULL,54.075,54.075,1750.00,411256,'pending','2023-07-31 07:09:19','2023-07-31 07:09:19',NULL,'approved',2,1,850,2,NULL,0,0,0,'11','20','instant','percentage',3,0,0,NULL),(120,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-29','2023-08-31',1,'gggg\n',750,100,'USD',0,NULL,49.44,49.44,1600.00,457072,'completed','2023-07-31 07:13:42','2023-08-02 06:55:00',NULL,'expired',2,3,750,2,'pi_3NZqInIvM8AX56ru24LsBvOF',0,0,0,'10','20','request','percentage',3,0,0,NULL),(121,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-23','2023-08-24',1,'gg\n',750,100,'USD',0,NULL,26.265,26.265,850.00,116415,'pending','2023-07-31 07:37:20','2023-08-02 06:55:00',NULL,'expired',2,3,750,1,NULL,0,0,0,'10','20','request','percentage',3,0,0,NULL),(122,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-16','2023-08-17',1,'hhh\n',750,100,'USD',0,NULL,26.265,26.265,850.00,783938,'completed','2023-07-31 09:10:39','2023-08-02 06:55:00',NULL,'expired',2,3,750,1,'pi_3NZs7iIvM8AX56ru1WS54grz',0,0,0,'10','20','request','percentage',3,0,0,NULL),(123,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-18','2023-08-19',1,'gggg\n',750,100,'USD',0,NULL,26.265,26.265,850.00,876890,'pending','2023-07-31 11:26:48','2023-08-02 06:55:00',NULL,'expired',1,3,750,1,NULL,0,0,0,'10','20','request','percentage',3,0,0,NULL),(124,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-18','2023-08-19',1,'gggg\n',750,100,'USD',0,NULL,26.265,26.265,850.00,445278,'pending','2023-07-31 11:27:47','2023-08-02 06:55:00',NULL,'expired',1,3,750,1,NULL,0,0,0,'10','20','request','percentage',3,0,0,NULL),(125,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-18','2023-08-19',1,'yhhh\n',750,100,'USD',0,NULL,26.265,26.265,850.00,809288,'pending','2023-07-31 11:48:56','2023-08-02 06:55:00',NULL,'expired',1,3,750,1,NULL,0,0,0,'10','20','request','percentage',3,0,0,NULL),(126,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-18','2023-08-19',1,'yhhh\n',750,100,'USD',0,NULL,26.265,26.265,850.00,388629,'pending','2023-07-31 11:50:12','2023-08-02 06:55:00',NULL,'expired',1,3,750,1,NULL,0,0,0,'10','20','request','percentage',3,0,0,NULL),(127,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-18','2023-08-19',1,'yhhh\n',750,100,'USD',0,NULL,26.265,26.265,850.00,630374,'pending','2023-07-31 11:51:29','2023-08-02 06:55:00',NULL,'expired',1,3,750,1,NULL,0,0,0,'10','20','request','percentage',3,0,0,NULL),(128,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-18','2023-08-19',1,'yhhh\n',750,100,'USD',0,NULL,26.265,26.265,850.00,456158,'pending','2023-07-31 11:51:55','2023-08-02 06:55:00',NULL,'expired',1,3,750,1,NULL,0,0,0,'10','20','request','percentage',3,0,0,NULL),(129,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-18','2023-08-19',1,'yhhh\n',750,100,'USD',0,NULL,26.265,26.265,850.00,340284,'completed','2023-07-31 11:52:29','2023-08-03 06:55:00',NULL,'expired',2,3,750,1,'pi_3NZueHIvM8AX56ru0B6nLqQE',0,0,0,'10','20','request','percentage',3,0,0,NULL),(130,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-22','2023-08-25',1,'3dddd',750,100,'USD',0,NULL,72.615,72.615,2350.00,352023,'completed','2023-07-31 14:46:44','2023-08-03 06:55:00',NULL,'expired',2,3,750,3,'pi_3NZxMuIvM8AX56ru12o5DCqv',0,0,0,'10','20','request','percentage',3,0,0,NULL),(131,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-09-06','2023-09-08',1,'hurt\n',750,100,'USD',0,NULL,49.44,49.44,1600.00,847372,'completed','2023-08-01 08:29:22','2023-08-03 06:55:00',NULL,'expired',2,3,750,2,'pi_3NaDxHIvM8AX56ru1NcxlcfV',0,0,0,'10','20','request','percentage',3,0,0,NULL),(132,2,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','977bc550-5069-11e9-a14e-635e0fd3bfa6','2023-08-29','2023-08-31',1,'Heheh',250,50,'USD',0,NULL,15,49.41,550.00,732990,'pending','2023-08-01 11:31:29','2023-08-01 11:31:29',NULL,'approved',2,3,250,2,NULL,0,0,0,'Flexible','Flexible',NULL,'percentage',9,1,1,NULL),(133,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-09-12','2023-09-14',1,'hyy\n',750,100,'USD',0,NULL,49.44,49.44,1600.00,976101,'pending','2023-08-01 13:29:26','2023-08-03 06:55:00',NULL,'expired',2,3,750,2,NULL,0,0,0,'10','20','request','percentage',3,0,0,NULL),(134,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-09-12','2023-09-14',1,'hyy\n',750,100,'USD',0,NULL,49.44,49.44,1600.00,261973,'pending','2023-08-01 13:33:09','2023-08-03 06:55:00',NULL,'expired',2,3,750,2,NULL,0,0,0,'10','20','request','percentage',3,0,0,NULL),(135,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-09-12','2023-09-14',1,'46546',750,100,'USD',0,NULL,49.44,49.44,1600.00,825362,'completed','2023-08-01 14:12:53','2023-08-03 06:55:00',NULL,'expired',2,3,750,2,'pi_3NaJJhIvM8AX56ru065h3zas',0,0,0,'10','20','request','percentage',3,0,0,NULL),(136,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-10-11','2023-10-13',1,'5757',750,100,'USD',0,NULL,49.44,49.44,1600.00,603920,'pending','2023-08-01 14:14:53','2023-08-03 06:55:00',NULL,'expired',2,3,750,2,NULL,0,0,0,'10','20','request','percentage',3,0,0,NULL),(137,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-10-11','2023-10-13',1,'5757',750,100,'USD',0,NULL,49.44,49.44,1600.00,516486,'completed','2023-08-01 14:16:21','2023-08-03 06:55:00',NULL,'expired',2,3,750,2,'pi_3NaJN3IvM8AX56ru1Qs9EvC0',0,0,0,'10','20','request','percentage',3,0,0,NULL),(138,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-08-25','2023-08-26',1,'ft',750,100,'USD',0,NULL,26.265,26.265,850.00,205972,'completed','2023-08-02 06:27:47','2023-08-02 06:28:01',NULL,'pending',2,3,750,1,'pi_3NaYX9IvM8AX56ru1ReW24Gv',0,0,0,'10','20','request','percentage',3,0,0,NULL);
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ReservationSpecialPricing`
--

DROP TABLE IF EXISTS `ReservationSpecialPricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ReservationSpecialPricing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) DEFAULT NULL,
  `reservationId` int(11) DEFAULT NULL,
  `blockedDates` date NOT NULL,
  `isSpecialPrice` float DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ReservationSpecialPricing`
--

LOCK TABLES `ReservationSpecialPricing` WRITE;
/*!40000 ALTER TABLE `ReservationSpecialPricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `ReservationSpecialPricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reviews`
--

DROP TABLE IF EXISTS `Reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservationId` int(11) NOT NULL,
  `listId` int(11) NOT NULL,
  `authorId` char(36) NOT NULL,
  `userId` char(36) NOT NULL,
  `reviewContent` text DEFAULT NULL,
  `rating` float NOT NULL,
  `privateFeedback` mediumtext DEFAULT NULL,
  `parentId` int(11) DEFAULT 0,
  `automated` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `isAdmin` tinyint(1) DEFAULT 0,
  `isAdminEnable` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `reservationId` (`reservationId`),
  KEY `userId` (`userId`),
  CONSTRAINT `Reviews_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reviews`
--

LOCK TABLES `Reviews` WRITE;
/*!40000 ALTER TABLE `Reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `Reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SearchSettings`
--

DROP TABLE IF EXISTS `SearchSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SearchSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `minPrice` float NOT NULL,
  `maxPrice` float NOT NULL,
  `PriceRangecurrency` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SearchSettings`
--

LOCK TABLES `SearchSettings` WRITE;
/*!40000 ALTER TABLE `SearchSettings` DISABLE KEYS */;
INSERT INTO `SearchSettings` VALUES (1,10,10000,'USD','2019-03-27 11:53:47','2018-05-02 04:53:20');
/*!40000 ALTER TABLE `SearchSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SequelizeMeta`
--

DROP TABLE IF EXISTS `SequelizeMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `SequelizeMeta_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SequelizeMeta`
--

LOCK TABLES `SequelizeMeta` WRITE;
/*!40000 ALTER TABLE `SequelizeMeta` DISABLE KEYS */;
INSERT INTO `SequelizeMeta` VALUES ('20180804061511-addUserBanStatus.js'),('20180804062523-addIsReadColumnInThreads.js'),('20180809095644-createBedTypeTable.js'),('20180919114144-addBanUserDefault.js'),('20180924105437-updateUserLoginTable.js'),('20180924130941-addNewUserLoginTable.js'),('20180929101729-updateNulledBanUserStatus.js'),('20180929110523-addColumnsForSmsVerification.js'),('20180929112313-updateCountyListWithDialCodes.js'),('20190105123130-addHomePageTypeSiteSettings.js'),('20190202071052-addIsListActiveField.js'),('20190202103305-updatePaymentMethods.js'),('20190206111430-createReportUser.js'),('20190223073145-addIsDeleteAtField.js'),('20190225042333-addReviewsCountInListing.js'),('20190322050510-addSiteSettingsField.js'),('20190325035946-addListBlockedDates.js'),('20190429092459-addColumNewThread.js'),('20190430110742-changeListingDataCloum.js'),('20190503052141-addColumnItemDescriptionListSettingsTable.js'),('20190513044345-addMetaFields.js'),('20190513070310-insertStaticpage.js'),('20190514121558-addCancellationPolicyReservation.js'),('20190525050311-changeDataTypeForItemDescription.js'),('20190527125405-addIsAdminEnableReviews.js'),('20190531062204-addReservationSpecialPricing.js'),('20190603083234-modifyBlogAndStaticPage.js'),('20190603102231-deleteInboxItem.js'),('20190604051522-addReservationFields.js'),('20190614110520-addPhoneStatus.js'),('20190615092318-addCountryNameInUserProfile.js'),('20190622051622-changeColumnLocationUserProfile.js'),('20190701041011-changeColumnTypeInSiteSettingsValue.js'),('20190712094239-deleteCoverPhotoRecordsFromListingTable.js'),('20190824052016-addHomePageLogoSiteSettings.js'),('20190827080301-addHomeBannerImage.js'),('20190828122142-addEmailPageLogoSiteSettings.js'),('20190830111259-addHomeLogoHeightSettings.js'),('20190902042250-addStaticBlockInfo.js'),('20190903093907-addStatusFieldInBlock.js'),('20190910043026-addPaymentIntentIdInReservation.js'),('20191008110026-testMigration.js'),('20191020041756-addUserListing.js'),('20191108043353-updateSteps.js'),('20200110151340-addRoleIdToAdminUser.js'),('20200217052735-addIsVerifiedToPayoutTable.js'),('20200225061630-addIsVerifiedToPayoutTable.js'),('20200323101255-addAppAvailableStatus.js'),('20200323102340-addPlayStoreUrl.js'),('20200323102456-addAppStoreUrl.js'),('20200324122956-contactPageManage.js'),('20200325110911-addWhyHostInfoBlocks.js'),('20200326043522-addHelpStaticPageManage.js'),('20200413120822-changeColumnValueAtWhyHostInfoBlock.js'),('20200413133533-changeColumnValueWhyHostInfoBlock.js'),('20200609101516-addTaxRateinListing.js'),('20200609104246-addColumnInReservation.js'),('20200702125214-addNewColumnsInReservation.js'),('20200706135325-changeDialCodeForCyprus.js'),('20200707112614-updateCancellationContent.js'),('20200716101918-addNewColumnsInReservation.js'),('20200717064917-addBookingTypeColumninReservation.js'),('20200720134623-addBookingTypeColumnInReservation.js'),('20200721095812-AddServiceFeeInReservation.js'),('20200721095829-AddNonRefundableNightInCancellation.js'),('20200722081721-changeDefaultValueinCancellation.js'),('20200727121337-changeColumnvalueInReservation.js'),('20200826050109-addCookiePolicyStaticContent.js'),('20201015082101-addListSettingsImage.js'),('20201015114723-addSideMenuContent.js'),('20210107121042-updateProcessedInPaymentMethod.js'),('20210111061758-changeDateTypeToDateOnlyType.js'),('20210415133041-addStripeKeySiteSettings.js'),('20210422134359-addApprovalListing.js'),('20210423130614-addApproveListingSiteAdmin.js'),('20210508123922-addDefaultFaviconImageInSiteSetttingTable.js'),('20210608121826-approvalChanges.js'),('20210720102227-updateCancellationTable.js'),('20211004131331-removeDefaultValueCountry.js'),('20220809045105-create-Subgueests.js'),('20220809045105-create-Subguests_detaiil.js'),('20220809045105-create-Subguests_details.js'),('20220809045105-create-subguests.js'),('20220809045105-create-Subguestss.js'),('20220809051714-edit-Reservation.js'),('20220809051714-edit-Reservations.js'),('20220825124213-create-subguest.js'),('20220825124548-create-subguest-detail.js'),('20220825134423-test.js'),('20220826113029-reservationId and paid columns.js'),('20220826113553-remove paid column.js'),('20220827111731-modify-transaction.js'),('20220827224123-amountDataType.js'),('20220829154732-SubguestDetailPaymentIntentId.js'),('20220829183452-modify-subguestDetail.js'),('20220905161021-add-isRepost-in-listing.js'),('20220905161021-add-maxRepostPercentage-in-listing.js'),('20220905164232-create-repost.js'),('20220905174552-create-repost-share.js'),('20220906081046-create-repost-transaction.js'),('20220917115039-add-couponAmount-in-swap.js'),('20220917115039-add-couponCurrency-in-swap.js'),('20220917115039-add-couponType-in-swap.js'),('20220917115039-add-isAccepted-in-listing.js'),('20220917115039-add-isSwapAllow-in-listing.js'),('20220917115039-add-maxRepostPercentage-in-Repost.js'),('20220917115039-add-startAvailableDate-in-listing.js'),('20220917115039-add-swapAllowAnyDate-in-listing.js'),('20220917115039-add-swapBillDetails-in-swap.js'),('20220917115039-add-swapCity-in-listing.js'),('20220917115039-add-swapCountry-in-listing.js'),('20220917115039-add-swapCountryCode-in-listing.js'),('20220917115039-add-swapCountryName-in-listing.js'),('20220917115039-add-swapEndDate-in-listing.js'),('20220917115039-add-swapGuestListId-in-threads.js'),('20220917115039-add-swapHostListId-in-threads.js'),('20220917115039-add-swapId-in-Reservation.js'),('20220917115039-add-swapId-in-threads.js'),('20220917115039-add-swapStartDate-in-listing.js'),('20220917120052-create-swap.js'),('20221001165527-add_cleaningPriceMaxDays_to_ListingData.js'),('20221001165527-add_is_fixed_price_to_repost.js'),('20221001170436-create-repost-fixed-price.js'),('20221020163704-subguestDetail-spotStatus.js'),('20221024093505-coupon.js'),('20221105220056-bedroomsTable.js'),('20221105220502-BedTypes-bedRoomId-column.js'),('20221107193124-bedroom-column-SubguestDetails.js'),('20221112120931-create-wallet.js'),('20221112121148-create-wallet-transaction.js'),('20221113045932-addNumberOfRepostDays.js');
/*!40000 ALTER TABLE `SequelizeMeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServiceFees`
--

DROP TABLE IF EXISTS `ServiceFees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ServiceFees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `guestType` enum('fixed','percentage') NOT NULL,
  `guestValue` float NOT NULL,
  `hostType` enum('fixed','percentage') NOT NULL,
  `hostValue` float NOT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServiceFees`
--

LOCK TABLES `ServiceFees` WRITE;
/*!40000 ALTER TABLE `ServiceFees` DISABLE KEYS */;
INSERT INTO `ServiceFees` VALUES (1,'percentage',3,'percentage',9,'USD','2018-05-26 06:43:13','2018-05-26 06:43:13');
/*!40000 ALTER TABLE `ServiceFees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SideMenu`
--

DROP TABLE IF EXISTS `SideMenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SideMenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `isEnable` tinyint(1) DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SideMenu`
--

LOCK TABLES `SideMenu` WRITE;
/*!40000 ALTER TABLE `SideMenu` DISABLE KEYS */;
INSERT INTO `SideMenu` VALUES (1,'Flexible','Cancel up to 1 day prior to arrival and get a 100% refund.','block1',NULL,NULL,1,'2021-02-03 13:14:58','2021-02-03 13:14:58'),(2,'Moderate','Cancel up to 5 days prior to arrival and get a 50% refund.','block2',NULL,NULL,1,'2021-02-03 13:14:58','2021-02-03 13:14:58'),(3,'Strict','Cancel up to 7 days prior to arrival and get a 50% refund.','block3',NULL,NULL,1,'2021-02-03 13:14:58','2021-02-03 13:14:58');
/*!40000 ALTER TABLE `SideMenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SiteSettings`
--

DROP TABLE IF EXISTS `SiteSettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SiteSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SiteSettings`
--

LOCK TABLES `SiteSettings` WRITE;
/*!40000 ALTER TABLE `SiteSettings` DISABLE KEYS */;
INSERT INTO `SiteSettings` VALUES (1,'Site Name','siteName','Your Site','site_settings','2019-03-27 11:53:47','2021-10-27 18:02:59'),(2,'Site Title','siteTitle','Your Site Title','site_settings','2019-03-27 11:53:47','2021-10-27 18:02:59'),(3,'Meta Keyword','metaKeyword','Your Site Meta Keyword','site_settings','2019-03-27 11:53:47','2021-10-27 18:02:59'),(4,'Meta Discription','metaDescription','Your Site Meta Description','site_settings','2019-03-27 11:53:47','2021-10-27 18:02:59'),(10,'Facebook Link','facebookLink','https://www.facebook.com/radicalstartnow/','site_settings','2019-03-27 11:53:47','2021-10-27 18:02:59'),(11,'Twitter Link','twitterLink','https://twitter.com/radicalstartnow','site_settings','2019-03-27 11:53:47','2021-10-27 18:02:59'),(12,'Instagram Link','instagramLink','https://www.instagram.com/?hl=en','site_settings','2019-03-27 11:53:47','2021-10-27 18:02:59'),(64,'Logo Height','logoHeight','65','site_settings','2019-03-27 11:53:47','2021-10-27 18:02:59'),(65,'Logo Width','logoWidth','125','site_settings','2019-03-27 11:53:47','2021-10-27 18:02:59'),(66,'Home Page Banner Layout','homePageType','3','site_settings','2019-03-27 11:53:47','2021-10-27 18:02:59'),(67,'Video URL','videoLink','https://www.youtube.com/watch?v=5y2P4z7DM88','site_settings','2019-07-04 06:09:18','2021-10-27 18:02:59'),(68,'Phone Number Status','phoneNumberStatus','1','site_settings','2019-07-04 06:47:57','2021-10-27 18:02:59'),(72,'Home Logo Height','homeLogoHeight','65','site_settings','2019-09-06 06:41:03','2021-10-27 18:02:59'),(73,'Home Logo Width','homeLogoWidth','125','site_settings','2019-09-06 06:41:03','2021-10-27 18:02:59'),(77,'App Available Status','appAvailableStatus','1','site_settings','2020-04-13 11:33:08','2021-10-27 18:02:59'),(78,'PlayStore URL','playStoreUrl','https://play.google.com/store','site_settings','2020-04-13 11:33:08','2021-10-27 18:02:59'),(79,'AppStore URL','appStoreUrl','https://www.apple.com/ios/app-store/','site_settings','2020-04-13 11:33:09','2021-10-27 18:02:59'),(80,'email','email','support@yourwebsite.com','site_settings','2020-04-13 11:33:09','2021-10-27 18:02:59'),(81,'Phone Number','phoneNumber','+0 000 0000','site_settings','2020-04-13 11:33:09','2021-10-27 18:02:59'),(82,'Address','address','Your Location, Country','site_settings','2020-04-13 11:33:09','2021-10-27 18:02:59'),(83,'Stripe Publishable Key','stripePublishableKey','pk_test_51NHo0VAw4oPFgTvgE7ivP5olWmNzGoryNBTTcaJKudGoyP5dYqdhfZdynmGC8iHOl5mmIoFADAbZ1g9Nrzjl0j92004G8bpnTd','site_settings','2021-10-27 16:42:06','2021-10-27 18:02:59'),(84,'Listing Approval','listingApproval','0','site_settings','2021-10-27 16:42:07','2021-10-27 18:02:59'),(85,'Favicon Logo','faviconLogo','3b8e5dee4415efd0663e848509e87560.png','site_settings','2021-10-27 16:42:07','2021-10-27 16:42:07'),(86,'Recommended Swap','recommendedSwap','1','homeRecommended_settings','2022-09-24 11:12:14','2022-09-24 11:43:01'),(87,'Recommended Repost','recommendedRepost','1','homeRecommended_settings','2022-09-24 11:13:03','2022-09-24 11:43:01');
/*!40000 ALTER TABLE `SiteSettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StaticInfoBlock`
--

DROP TABLE IF EXISTS `StaticInfoBlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StaticInfoBlock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `isEnable` tinyint(1) DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StaticInfoBlock`
--

LOCK TABLES `StaticInfoBlock` WRITE;
/*!40000 ALTER TABLE `StaticInfoBlock` DISABLE KEYS */;
INSERT INTO `StaticInfoBlock` VALUES (1,'Rent amazing homes for your trip','Homes with high standards and better facilities',NULL,'header',1,'2019-09-06 06:41:03','2019-09-06 06:49:26'),(2,'Enjoy your trip!','Rent the home that\'s suitable for you & your family and enjoy your trip!',NULL,'block1',1,'2019-09-06 06:41:03','2023-06-14 13:34:37'),(3,'Trusted community!','Our community is completely driven by trust and your family safety is assured','e1f916093207db35c01154c4a82dc357.jpeg','block2',1,'2019-09-06 06:41:03','2019-09-06 06:49:26');
/*!40000 ALTER TABLE `StaticInfoBlock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StaticPage`
--

DROP TABLE IF EXISTS `StaticPage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StaticPage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageName` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `metaTitle` varchar(255) NOT NULL,
  `metaDescription` mediumtext NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StaticPage`
--

LOCK TABLES `StaticPage` WRITE;
/*!40000 ALTER TABLE `StaticPage` DISABLE KEYS */;
INSERT INTO `StaticPage` VALUES (1,'About Us','<p></p>','About Us','About Us','2019-07-12 07:58:42','2019-07-12 07:58:42'),(2,'Trust & Safety','<p></p>','Trust & Safety','Trust & Safety','2019-07-12 07:58:42','2019-07-12 07:58:42'),(3,'Travel Credit','<p></p>','Travel Credit','Travel Credit','2019-07-12 07:58:42','2019-07-12 07:58:42'),(4,'Terms & Privacy','<p></p>','Terms & Privacy','Terms & Privacy','2019-07-12 07:58:42','2019-07-12 07:58:42'),(5,'Help','<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen books. </p>','Help','Help page description','2020-04-13 11:33:10','2020-04-13 13:07:55'),(6,'Cookie Policy','<p></p>','Cookie Policy','Cookie Policy','2021-02-03 13:01:43','2021-02-03 13:01:43');
/*!40000 ALTER TABLE `StaticPage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subguest`
--

DROP TABLE IF EXISTS `Subguest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subguest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `reservationId` int(11) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subguest`
--

LOCK TABLES `Subguest` WRITE;
/*!40000 ALTER TABLE `Subguest` DISABLE KEYS */;
INSERT INTO `Subguest` VALUES (1,'abdelrhman.sapry.alwtany@gmail.com',38,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-22 23:12:15','2022-08-22 23:12:15'),(2,'qa@radicalstart.com ',38,NULL,'2022-08-22 23:12:15','2022-08-22 23:12:15'),(3,'abdelrhman.sapry.alwtany@gmail.com',39,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-22 23:13:17','2022-08-22 23:13:17'),(4,'qa@radicalstart.com ',39,NULL,'2022-08-22 23:13:17','2022-08-22 23:13:17'),(5,'abdelrhman.sapy.alwtany@gmail.com',40,NULL,'2022-08-22 23:14:08','2022-08-22 23:14:08'),(6,'qa@radicalstart.com ',40,NULL,'2022-08-22 23:14:08','2022-08-22 23:14:08'),(7,'abdelrhman.sapry.alwtany@gmail.com',41,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-22 23:21:13','2022-08-22 23:21:13'),(8,'qa@radicalstart.com ',41,NULL,'2022-08-22 23:21:13','2022-08-22 23:21:13'),(9,'abdelrhman.sapry.alwtany@gmail.com',42,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-22 23:21:21','2022-08-22 23:21:21'),(10,'qa@radicalstart.com ',42,NULL,'2022-08-22 23:21:21','2022-08-22 23:21:21'),(11,'abdelrhman.sapry.alwtany@gmail.com',43,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-22 23:23:23','2022-08-22 23:23:23'),(12,'qa@radicalstart.com ',43,NULL,'2022-08-22 23:23:23','2022-08-22 23:23:23'),(13,'abdelrhman.sapry.alwtany@gmail.com',44,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-22 23:31:06','2022-08-22 23:31:06'),(14,'qa@radicalstart.com ',44,NULL,'2022-08-22 23:31:06','2022-08-22 23:31:06'),(15,'abdelrhman.sapry.alwtany@gmail.com',47,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-22 23:48:19','2022-08-22 23:48:19'),(16,'qa@radicalstart.com ',47,NULL,'2022-08-22 23:48:19','2022-08-22 23:48:19'),(17,'abdelrhman.sapry.alwtany@gmail.com',48,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-22 23:53:41','2022-08-22 23:53:41'),(18,'qa@radicalstart.com ',48,NULL,'2022-08-22 23:53:41','2022-08-22 23:53:41'),(19,'abdelrhman.sapry.alwtany@gmail.com',49,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-23 00:01:54','2022-08-23 00:01:54'),(20,'qa@radicalstart.com ',49,NULL,'2022-08-23 00:01:54','2022-08-23 00:01:54'),(21,'abdelrhman.sapry.alwtany@gmail.com',50,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-23 00:16:45','2022-08-23 00:16:45'),(22,'qa@radicalstart.com ',50,NULL,'2022-08-23 00:16:45','2022-08-23 00:16:45'),(23,'abdelrhman.sapry.alwtany@gmail.com',51,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-23 00:23:06','2022-08-23 00:23:06'),(24,'qa@radicalstart.com ',51,NULL,'2022-08-23 00:23:06','2022-08-23 00:23:06'),(25,'abdelrhman.sapry.alwtany@gmail.com',52,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-23 00:26:11','2022-08-23 00:26:11'),(26,'qa@radicalstart.com ',52,NULL,'2022-08-23 00:26:11','2022-08-23 00:26:11'),(27,'abdelrhman.sapry.alwtany@gmail.com',53,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-23 00:52:43','2022-08-23 00:52:43'),(28,'qa@radicalstart.com ',53,NULL,'2022-08-23 00:52:43','2022-08-23 00:52:43'),(29,'abdelrhman.sapry.alwtany@gmail.com',54,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-23 03:11:18','2022-08-23 03:11:18'),(30,'qa@radicalstart.com ',54,NULL,'2022-08-23 03:11:18','2022-08-23 03:11:18'),(31,NULL,27,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-27 21:47:30','2022-08-27 21:47:30'),(32,NULL,21,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-27 22:01:29','2022-08-27 22:01:29'),(33,NULL,25,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-27 22:01:44','2022-08-27 22:01:44'),(34,'ahmedtaha200079@gmail.com',57,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-09-18 16:33:41','2022-09-18 16:33:41'),(35,'test2@test.com',57,NULL,'2022-09-18 16:33:41','2022-09-18 16:33:41'),(36,'ahmedtaha200079@gmail.com',59,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-09-27 06:41:13','2022-09-27 06:41:13'),(37,'test22@test.com',59,NULL,'2022-09-27 06:41:13','2022-09-27 06:41:13'),(38,'demo@radicalstart.com',59,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-09-27 06:41:13','2022-09-27 06:41:13'),(39,'abdelrhman.sapry.alwtany@gmail.com',59,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-09-27 06:41:13','2022-09-27 06:41:13'),(40,'ahmedtaha200079@gmail.com',60,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-09-27 06:47:11','2022-09-27 06:47:11'),(41,'demo@radicalstart.com',60,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-09-27 06:47:11','2022-09-27 06:47:11'),(42,'abdelrhman.sapry.alwtany@gmail.com',60,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-09-27 06:47:11','2022-09-27 06:47:11'),(43,'test32@test.com',60,NULL,'2022-09-27 06:47:11','2022-09-27 06:47:11'),(44,'ahmedtaha200079@gmail.com',62,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-09-27 07:01:17','2022-09-27 07:01:17'),(45,'demo@radicalstart.com',62,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-09-27 07:01:17','2022-09-27 07:01:17'),(46,'test33@test.com',62,NULL,'2022-09-27 07:01:17','2022-09-27 07:01:17'),(47,'abdelrhman.sapry.alwtany@gmail.com',62,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-09-27 07:01:17','2022-09-27 07:01:17'),(48,'abdelrhman.sapry.alwtany@gmail.com',63,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-09-28 11:01:42','2022-09-28 11:01:42'),(49,'test333@test.com',63,NULL,'2022-09-28 11:01:42','2022-09-28 11:01:42'),(50,NULL,64,NULL,'2022-09-28 11:32:29','2022-10-16 13:15:03'),(61,'test70@test.com',64,NULL,'2022-10-16 13:19:25','2022-10-16 13:19:25'),(62,'demo@radicalstart.com',97,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-06-11 12:53:10','2023-06-11 12:53:10'),(63,'demo@radicalstart.com',100,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-23 07:34:43','2023-07-23 07:34:43'),(64,'ahmadAli@gmail.com',100,NULL,'2023-07-23 07:34:43','2023-07-23 07:34:43'),(65,'ahmadjasem9@gmail.com',100,NULL,'2023-07-23 07:34:43','2023-07-23 07:34:43'),(66,'ahmadjasem@gmail.com',100,NULL,'2023-07-23 07:34:43','2023-07-23 07:34:43');
/*!40000 ALTER TABLE `Subguest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubguestDetail`
--

DROP TABLE IF EXISTS `SubguestDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubguestDetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subguestId` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `bed` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `reservationId` int(11) DEFAULT NULL,
  `paymentIntentId` varchar(255) DEFAULT NULL,
  `spotStatus` enum('pending','expired','approved','declined','completed','cancelled') DEFAULT 'pending',
  `bedroomNumber` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubguestDetail`
--

LOCK TABLES `SubguestDetail` WRITE;
/*!40000 ALTER TABLE `SubguestDetail` DISABLE KEYS */;
INSERT INTO `SubguestDetail` VALUES (1,NULL,NULL,4,NULL,'2022-08-22 23:53:41','2022-08-22 23:53:41',NULL,NULL,'pending',0),(2,NULL,NULL,5,NULL,'2022-08-22 23:53:41','2022-08-22 23:53:41',NULL,NULL,'pending',0),(3,NULL,10,4,NULL,'2022-08-23 00:01:54','2022-08-23 00:01:54',NULL,NULL,'pending',0),(4,NULL,5,5,NULL,'2022-08-23 00:01:54','2022-08-23 00:01:54',NULL,NULL,'pending',0),(5,NULL,10,4,NULL,'2022-08-23 00:26:44','2022-08-23 00:26:44',NULL,NULL,'pending',0),(6,NULL,5,5,NULL,'2022-08-23 00:26:44','2022-08-23 00:26:44',NULL,NULL,'pending',0),(7,27,10,4,'paid','2022-08-23 00:52:50','2022-11-07 07:55:00',NULL,NULL,'completed',0),(8,28,5,5,NULL,'2022-08-23 00:52:50','2022-08-23 00:52:50',NULL,NULL,'pending',0),(9,29,10,4,'paid','2022-08-23 03:11:18','2022-11-07 07:55:00',NULL,NULL,'completed',0),(10,30,5,5,NULL,'2022-08-23 03:11:18','2022-08-23 03:11:18',NULL,NULL,'pending',0),(11,31,NULL,NULL,'paid','2022-08-27 21:47:31','2022-11-07 07:55:00',NULL,NULL,'completed',0),(12,32,NULL,NULL,'paid','2022-08-27 22:01:29','2022-11-07 07:55:00',NULL,NULL,'completed',0),(13,33,NULL,NULL,'paid','2022-08-27 22:01:44','2022-11-07 07:55:00',NULL,NULL,'completed',0),(14,34,1005,NULL,'paid','2022-09-18 16:33:41','2022-11-07 07:55:00',57,NULL,'completed',0),(15,35,1003,NULL,'pending','2022-09-18 16:33:41','2022-09-18 16:33:41',57,NULL,'pending',0),(16,36,296,NULL,'paid','2022-09-27 06:41:13','2022-11-07 07:55:00',59,NULL,'completed',0),(17,38,295,NULL,'pending','2022-09-27 06:41:13','2022-09-27 06:41:13',59,NULL,'pending',0),(18,37,295,NULL,'pending','2022-09-27 06:41:13','2022-09-27 06:41:13',59,NULL,'pending',0),(19,39,295,NULL,'pending','2022-09-27 06:41:13','2022-09-27 06:41:13',59,NULL,'pending',0),(20,40,296,NULL,'paid','2022-09-27 06:47:11','2022-11-07 07:55:00',60,NULL,'completed',0),(21,41,295,NULL,'pending','2022-09-27 06:47:11','2022-09-27 06:47:11',60,NULL,'pending',0),(22,43,295,NULL,'pending','2022-09-27 06:47:11','2022-09-27 06:47:11',60,NULL,'pending',0),(23,42,295,NULL,'pending','2022-09-27 06:47:11','2022-09-27 06:47:11',60,NULL,'pending',0),(24,44,588,NULL,'paid','2022-09-27 07:01:17','2022-11-07 07:55:00',62,NULL,'completed',0),(25,45,585,NULL,'pending','2022-09-27 07:01:17','2022-09-27 07:01:17',62,NULL,'pending',0),(26,46,585,NULL,'pending','2022-09-27 07:01:17','2022-09-27 07:01:17',62,NULL,'pending',0),(27,47,585,NULL,'pending','2022-09-27 07:01:17','2022-09-27 07:01:17',62,NULL,'pending',0),(28,48,166,NULL,'paid','2022-09-28 11:01:42','2022-11-07 07:55:00',63,NULL,'completed',0),(29,49,164,NULL,'pending','2022-09-28 11:01:42','2022-09-28 11:01:42',63,NULL,'pending',0),(31,61,540,NULL,'pending','2022-09-28 11:32:29','2022-10-16 13:19:25',64,NULL,'pending',0),(32,62,902,NULL,'paid','2023-06-11 12:53:10','2023-06-11 12:53:12',97,'pi_3NHnlbA3oQdQ8GEm1wHllZLg','completed',0),(33,NULL,902,NULL,'pending','2023-06-11 12:53:10','2023-06-11 12:53:10',97,NULL,'pending',0),(34,63,2000,NULL,'paid','2023-07-23 07:34:43','2023-07-24 06:55:00',100,NULL,'completed',0),(35,64,3000,NULL,'pending','2023-07-23 07:34:43','2023-07-23 07:34:43',100,NULL,'pending',0),(36,66,1141,NULL,'pending','2023-07-23 07:34:43','2023-07-23 07:34:43',100,NULL,'pending',0),(37,65,3,NULL,'pending','2023-07-23 07:34:43','2023-07-23 07:34:43',100,NULL,'pending',0);
/*!40000 ALTER TABLE `SubguestDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubguestDetails`
--

DROP TABLE IF EXISTS `SubguestDetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubguestDetails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` float DEFAULT NULL,
  `bed` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `subguestId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `reservationId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubguestDetails`
--

LOCK TABLES `SubguestDetails` WRITE;
/*!40000 ALTER TABLE `SubguestDetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `SubguestDetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Subguests`
--

DROP TABLE IF EXISTS `Subguests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Subguests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `reservationId` int(11) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Subguests`
--

LOCK TABLES `Subguests` WRITE;
/*!40000 ALTER TABLE `Subguests` DISABLE KEYS */;
/*!40000 ALTER TABLE `Subguests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Swap`
--

DROP TABLE IF EXISTS `Swap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Swap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostId` varchar(255) NOT NULL,
  `guestId` varchar(255) NOT NULL,
  `hostListId` int(11) NOT NULL,
  `guestListId` int(11) NOT NULL,
  `checkIn` date NOT NULL,
  `checkOut` date NOT NULL,
  `swapStatus` enum('pending','accepted','rejected','payIn') DEFAULT 'pending',
  `swapCountry` varchar(255) DEFAULT NULL,
  `swapDatesSelected` int(11) DEFAULT NULL,
  `swapStayedNights` int(11) DEFAULT NULL,
  `swapIsSpecialPriceAssigned` tinyint(1) DEFAULT NULL,
  `swapIsAverage` varchar(255) DEFAULT NULL,
  `swapCurrency` varchar(255) DEFAULT NULL,
  `swapDayDifference` int(11) DEFAULT NULL,
  `swapIsDayTotal` varchar(255) DEFAULT NULL,
  `swapDiscount` varchar(255) DEFAULT NULL,
  `swapDiscountType` varchar(255) DEFAULT NULL,
  `swapCleaningPrice` varchar(255) DEFAULT NULL,
  `swapServiceFee` varchar(255) DEFAULT NULL,
  `swapTotal` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `couponAmount` varchar(255) DEFAULT NULL,
  `couponCurrency` varchar(255) DEFAULT NULL,
  `couponType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hostListId` (`hostListId`),
  KEY `guestListId` (`guestListId`),
  CONSTRAINT `swap_ibfk_1` FOREIGN KEY (`hostListId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `swap_ibfk_2` FOREIGN KEY (`guestListId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Swap`
--

LOCK TABLES `Swap` WRITE;
/*!40000 ALTER TABLE `Swap` DISABLE KEYS */;
INSERT INTO `Swap` VALUES (1,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',8,4,'2023-02-06','2023-02-15','accepted',NULL,5,4,NULL,'750','USD',4,'3000',NULL,NULL,'25','90.75','3115.75','2022-10-30 12:22:16','2022-10-31 11:24:00',NULL,NULL,NULL),(5,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589',4,8,'2023-03-02','2023-03-09','accepted','Ireland',4,3,NULL,'550','USD',3,'1650',NULL,NULL,'103','52.589999999999996','1805.59','2022-10-31 14:07:08','2022-10-31 14:46:28',NULL,NULL,NULL),(6,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589',4,8,'2023-03-10','2023-03-18','accepted','Ireland',6,2,NULL,'550','USD',2,'1100',NULL,NULL,'103','36.089999999999996','1239.09','2022-11-04 17:21:02','2022-11-04 17:30:52',NULL,NULL,NULL),(7,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589',4,8,'2023-05-01','2023-05-09','accepted','Ireland',4,4,NULL,'550','USD',4,'2200','214.5','3% weekly price discount','103','69.09','2372.09','2022-11-05 09:40:11','2022-11-05 13:23:07','200','USD','fixed'),(8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',8,2,'2022-11-15','2022-11-30','pending',NULL,6,9,NULL,'750','USD',9,'6750','270','4% weekly price discount','200','200.4','6880.4','2022-11-06 06:02:01','2022-11-06 06:02:01',NULL,NULL,NULL),(10,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',8,2,'2022-11-18','2022-11-30','accepted',NULL,3,9,NULL,'750','USD',9,'6750','270','4% weekly price discount','200','206.655','6886.655','2022-11-06 09:17:06','2022-11-06 09:18:36',NULL,NULL,NULL),(11,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589',4,8,'2023-05-10','2023-05-13','accepted','Ireland',3,NULL,NULL,NULL,'USD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-11-15 17:28:10','2022-11-15 17:35:51',NULL,NULL,NULL),(12,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589',4,8,'2023-05-17','2023-05-24','accepted','Ireland',2,5,NULL,'550','USD',5,'2750',NULL,NULL,'103','88.1577','2941.1577','2022-11-15 17:29:06','2022-11-15 17:37:46','200','USD','fixed'),(13,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',8,4,'2023-07-23','2023-07-29','pending',NULL,6,NULL,NULL,NULL,'USD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-23 05:57:14','2023-07-23 05:57:14',NULL,NULL,NULL),(14,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',8,2,'2023-07-23','2023-07-29','pending',NULL,6,NULL,NULL,NULL,'USD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-23 05:57:31','2023-07-23 05:57:31',NULL,NULL,NULL),(15,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',8,2,'2023-07-23','2023-07-29','pending',NULL,6,NULL,NULL,NULL,'USD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-23 05:57:51','2023-07-23 05:57:51',NULL,NULL,NULL),(16,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',8,2,'2023-07-23','2023-07-29','pending',NULL,6,NULL,NULL,NULL,'USD',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-23 05:58:40','2023-07-23 05:58:40',NULL,NULL,NULL),(17,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',8,4,'2023-07-24','2023-07-29','pending',NULL,5,5,0,'0.0','USD',0,NULL,'0.0',NULL,NULL,'0.0','0.0','2023-07-23 06:39:17','2023-07-23 06:39:17',NULL,NULL,NULL),(18,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',8,4,'2023-07-23','2023-07-29','pending',NULL,6,6,0,'0.0','USD',0,NULL,'0.0',NULL,NULL,'0.0','0.0','2023-07-23 07:08:28','2023-07-23 07:08:28',NULL,NULL,NULL),(19,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',8,2,'2023-08-02','2023-08-04','pending',NULL,2,2,0,'0.0','USD',0,NULL,'0.0',NULL,NULL,'0.0','0.0','2023-07-30 12:55:15','2023-07-30 12:55:15',NULL,NULL,NULL),(20,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',8,2,'2023-08-02','2023-08-04','pending',NULL,2,2,0,'0.0','USD',0,NULL,'0.0',NULL,NULL,'0.0','0.0','2023-07-30 12:55:25','2023-07-30 12:55:25',NULL,NULL,NULL),(21,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',8,2,'2023-08-02','2023-08-04','pending',NULL,2,2,0,'0.0','USD',0,NULL,'0.0',NULL,NULL,'0.0','0.0','2023-07-30 12:56:24','2023-07-30 12:56:24',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Swap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ThreadItems`
--

DROP TABLE IF EXISTS `ThreadItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ThreadItems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `threadId` int(11) NOT NULL,
  `sentBy` varchar(255) NOT NULL,
  `content` mediumtext DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT NULL,
  `type` enum('message','inquiry','preApproved','declined','approved','pending','cancelledByHost','cancelledByGuest','intantBooking','requestToBook','confirmed','expired','completed') DEFAULT 'message',
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `personCapacity` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `reservationId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `threadId` (`threadId`),
  CONSTRAINT `ThreadItems_ibfk_1` FOREIGN KEY (`threadId`) REFERENCES `Threads` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ThreadItems`
--

LOCK TABLES `ThreadItems` WRITE;
/*!40000 ALTER TABLE `ThreadItems` DISABLE KEYS */;
INSERT INTO `ThreadItems` VALUES (1,1,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','hhhhhhhhhhh',0,'intantBooking','2022-08-16','2022-08-19',1,'2022-08-12 16:46:04','2022-08-12 16:46:04',1),(2,2,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','zzzzzzzzzz',0,'requestToBook','2022-08-21','2022-08-24',1,'2022-08-13 03:48:15','2022-08-13 03:48:15',2),(3,3,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','sdsas asdasd sadasdas',0,'requestToBook','2022-09-27','2022-09-29',0,'2022-09-27 06:53:57','2022-09-27 06:53:57',61),(4,1,'977bc550-5069-11e9-a14e-635e0fd3bfa6',NULL,0,'completed','2022-08-16','2022-08-19',1,'2022-09-27 06:55:00','2022-09-27 06:55:00',1),(5,4,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','csa f afsfsa saasdas',0,'requestToBook','2022-09-27','2022-09-30',0,'2022-09-27 07:01:19','2022-09-27 07:01:19',62),(6,5,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','fds aassadasd',1,'expired','2022-09-28','2022-09-30',0,'2022-09-28 11:01:45','2023-06-12 13:18:25',63),(8,1,'977bc550-5069-11e9-a14e-635e0fd3bfa6',NULL,0,'completed','2022-08-16','2022-08-19',1,'2022-10-22 06:55:00','2022-10-22 06:55:00',1),(9,7,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','sda sadasdsdsa',1,'requestToBook','2022-11-22','2022-11-25',1,'2022-10-24 06:25:27','2022-10-31 16:12:38',65),(10,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','sdas sdasd sadasds',0,'intantBooking','2022-10-27','2022-10-29',1,'2022-10-24 17:26:13','2022-10-24 17:26:13',66),(15,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','hi',0,'message','2022-10-28','2022-10-28',0,'2022-10-28 05:05:09','2022-10-28 05:05:09',NULL),(16,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','how are you?',0,'message','2022-10-28','2022-10-28',0,'2022-10-28 05:05:50','2022-10-28 05:05:50',NULL),(18,8,'977bc550-5069-11e9-a14e-635e0fd3bfa6',NULL,1,'completed','2022-10-27','2022-10-29',1,'2022-10-29 06:55:00','2022-11-04 11:49:12',66),(35,26,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','this is good',1,'message','2023-03-02','2023-03-09',NULL,'2022-10-31 14:07:08','2022-10-31 16:13:01',NULL),(40,26,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','hi\n',0,'expired','2022-11-04','2022-11-04',0,'2022-11-04 11:49:57','2023-06-14 06:55:00',NULL),(41,31,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','hi',0,'message','2023-03-10','2023-03-18',NULL,'2022-11-04 17:21:02','2022-11-04 17:21:02',NULL),(42,32,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','hi',1,'message','2023-05-01','2023-05-09',NULL,'2022-11-05 09:40:11','2023-07-30 11:33:56',NULL),(43,33,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','hi',0,'message','2022-11-15','2022-11-30',NULL,'2022-11-06 06:02:01','2022-11-06 06:02:01',NULL),(44,33,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','hello ahmed',0,'requestToBook','2023-04-03','2023-04-18',0,'2022-11-06 06:04:25','2022-11-06 06:04:25',NULL),(45,33,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','hi',0,'requestToBook','2023-01-08','2023-01-19',0,'2022-11-06 07:57:17','2022-11-06 07:57:17',NULL),(46,34,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','hi bro',0,'message','2022-11-18','2022-11-30',NULL,'2022-11-06 08:43:32','2022-11-06 08:43:32',NULL),(47,35,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','sds',0,'message','2022-11-18','2022-11-30',NULL,'2022-11-06 09:17:06','2022-11-06 09:17:06',NULL),(48,36,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','hello how are you?',1,'message','2023-05-10','2023-05-13',NULL,'2022-11-15 17:28:10','2023-07-16 09:55:51',NULL),(49,37,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','hello man',1,'message','2023-05-17','2023-05-24',NULL,'2022-11-15 17:29:06','2023-06-13 09:28:47',NULL),(50,36,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','hi',1,'message','2022-11-15','2022-11-15',0,'2022-11-15 17:39:10','2023-07-16 09:55:51',NULL),(51,37,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','hi\n',1,'message','2022-11-15','2022-11-15',0,'2022-11-15 17:40:00','2023-06-13 09:28:47',NULL),(52,38,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','Hello',1,'requestToBook','2023-04-19','2023-04-21',0,'2023-04-16 17:30:27','2023-04-16 18:13:41',95),(53,38,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','hello',1,'requestToBook','2023-04-23','2023-04-26',0,'2023-04-16 18:11:21','2023-04-16 18:13:41',96),(54,38,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',NULL,1,'approved','2023-04-23','2023-04-26',0,'2023-04-16 18:16:25','2023-04-16 18:18:09',96),(55,38,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','حطيت لك المفتاح في عداد المية',1,'message','2023-04-16','2023-04-16',0,'2023-04-16 18:19:28','2023-06-12 13:18:34',NULL),(56,38,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',NULL,1,'completed','2023-04-23','2023-04-26',0,'2023-04-26 06:55:00','2023-06-12 13:18:34',96),(57,39,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','Hello 011',0,'intantBooking','2023-06-12','2023-06-14',0,'2023-06-11 13:19:23','2023-06-11 13:19:23',98),(58,40,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','sdcsdcsdc',0,'requestToBook','2023-06-21','2023-06-30',0,'2023-06-12 13:24:53','2023-06-12 13:24:53',99),(59,39,'977bc550-5069-11e9-a14e-635e0fd3bfa6',NULL,1,'completed','2023-06-12','2023-06-14',0,'2023-06-14 06:55:00','2023-06-14 14:39:35',98),(60,40,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','.\n',0,'message','2023-06-15','2023-06-15',0,'2023-06-15 13:36:12','2023-06-15 13:36:12',NULL),(61,41,'2d47f470-dc78-11ed-8493-97c361d41aef','Hhhhh',0,'inquiry','2023-07-13','2023-07-20',3,'2023-07-12 14:36:28','2023-07-12 14:36:28',NULL),(62,41,'2d47f470-dc78-11ed-8493-97c361d41aef','السلام عليكم ورحمة الله وبركاته',0,'message',NULL,NULL,NULL,'2023-07-12 14:46:40','2023-07-12 14:46:40',NULL),(63,42,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','54456 r56565 6',0,'message','2023-07-23','2023-07-29',NULL,'2023-07-23 05:57:14','2023-07-23 05:57:14',NULL),(64,43,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','7yf hgf h sa daf d  sdf',0,'message','2023-07-23','2023-07-29',NULL,'2023-07-23 05:57:31','2023-07-23 05:57:31',NULL),(65,44,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','hhhhhhhhhhhhhhhhhhhhhhhh',0,'message','2023-07-23','2023-07-29',NULL,'2023-07-23 05:57:51','2023-07-23 05:57:51',NULL),(66,45,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','hhhhhhhhhhhhhhhhhhhhhhhhh',0,'message','2023-07-23','2023-07-29',NULL,'2023-07-23 05:58:40','2023-07-23 05:58:40',NULL),(67,46,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','546545546544554646 546464 546456456 54645645 546546546 456456',0,'message','2023-07-24','2023-07-29',NULL,'2023-07-23 06:39:17','2023-07-23 06:39:17',NULL),(68,47,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','yyyyyyyyyyyyy',0,'message','2023-07-23','2023-07-29',NULL,'2023-07-23 07:08:28','2023-07-23 07:08:28',NULL),(69,35,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','fsadf',0,'message','2023-07-30','2023-07-30',0,'2023-07-30 11:34:22','2023-07-30 11:34:22',NULL),(70,48,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','hhhhh',0,'message','2023-08-02','2023-08-04',NULL,'2023-07-30 12:55:15','2023-07-30 12:55:15',NULL),(71,49,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','رسالة',0,'message','2023-08-02','2023-08-04',NULL,'2023-07-30 12:55:25','2023-07-30 12:55:25',NULL),(72,50,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','uuuuu',0,'message','2023-08-02','2023-08-04',NULL,'2023-07-30 12:56:24','2023-07-30 12:56:24',NULL),(73,7,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','sadfsdf',0,'message','2023-07-30','2023-07-30',0,'2023-07-30 15:06:40','2023-07-30 15:06:40',NULL),(74,33,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','gggg\n',0,'requestToBook','2023-08-29','2023-08-31',1,'2023-07-31 07:14:03','2023-07-31 07:14:03',NULL),(75,33,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','hhh\n',0,'requestToBook','2023-08-16','2023-08-17',1,'2023-07-31 09:10:44','2023-07-31 09:10:44',NULL),(76,33,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','yhhh\n',0,'requestToBook','2023-08-18','2023-08-19',1,'2023-07-31 11:52:30','2023-07-31 11:52:30',NULL),(77,33,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3dddd',0,'requestToBook','2023-08-22','2023-08-25',1,'2023-07-31 14:46:45','2023-07-31 14:46:45',NULL),(78,33,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','hurt\n',0,'requestToBook','2023-09-06','2023-09-08',1,'2023-08-01 08:29:24','2023-08-01 08:29:24',NULL),(79,33,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','46546',0,'requestToBook','2023-09-12','2023-09-14',1,'2023-08-01 14:13:44','2023-08-01 14:13:44',NULL),(80,33,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','5757',0,'requestToBook','2023-10-11','2023-10-13',1,'2023-08-01 14:22:36','2023-08-01 14:22:36',NULL),(81,33,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','ft',0,'requestToBook','2023-08-25','2023-08-26',1,'2023-08-02 06:28:01','2023-08-02 06:28:01',NULL);
/*!40000 ALTER TABLE `ThreadItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Threads`
--

DROP TABLE IF EXISTS `Threads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Threads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `host` varchar(255) NOT NULL,
  `guest` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `isRead` tinyint(1) DEFAULT NULL,
  `messageUpdatedDate` datetime DEFAULT NULL,
  `swapId` int(11) DEFAULT NULL,
  `swapGuestListId` int(11) DEFAULT NULL,
  `swapHostListId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listId` (`listId`),
  CONSTRAINT `Threads_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Threads`
--

LOCK TABLES `Threads` WRITE;
/*!40000 ALTER TABLE `Threads` DISABLE KEYS */;
INSERT INTO `Threads` VALUES (1,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-12 16:46:04','2022-10-22 06:55:00',0,'2022-08-12 16:46:03',NULL,NULL,NULL),(2,5,'977bc550-5069-11e9-a14e-635e0fd3bfa6','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-08-13 03:48:15','2022-08-13 03:48:15',0,'2022-08-13 03:48:15',NULL,NULL,NULL),(3,7,'977bc550-5069-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-09-27 06:53:57','2022-09-27 06:53:57',0,'2022-09-27 06:53:57',NULL,NULL,NULL),(4,8,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-09-27 07:01:19','2022-09-27 07:01:19',0,'2022-09-27 07:01:19',NULL,NULL,NULL),(5,1,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2022-09-28 11:01:45','2023-06-12 13:18:25',1,'2023-06-12 13:18:25',NULL,NULL,NULL),(7,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-10-24 06:25:27','2023-07-30 15:06:40',0,'2023-07-30 15:06:40',NULL,NULL,NULL),(8,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-10-24 17:26:13','2022-11-04 11:49:12',1,'2022-11-04 11:49:12',NULL,NULL,NULL),(26,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-10-31 14:07:08','2022-11-05 12:00:35',1,'2022-11-05 12:00:35',5,8,4),(31,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-04 17:21:02','2022-11-04 17:31:29',1,'2022-11-04 17:31:29',6,8,4),(32,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-05 09:40:11','2023-07-30 11:33:56',1,'2023-07-30 11:33:56',7,8,4),(33,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-06 06:02:01','2023-08-02 06:28:01',0,'2022-11-06 06:02:01',8,2,8),(34,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-06 08:43:32','2022-11-06 08:43:32',0,'2022-11-06 08:43:32',9,2,8),(35,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2022-11-06 09:17:06','2023-07-30 11:34:22',0,'2023-07-30 11:34:22',10,2,8),(36,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-15 17:28:10','2023-07-16 09:55:51',1,'2023-07-16 09:55:51',11,8,4),(37,4,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','3fcd41e0-376e-11ed-9bcb-1fd549eed589','2022-11-15 17:29:06','2023-06-13 09:28:47',1,'2023-06-13 09:28:47',12,8,4),(38,5,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-04-16 17:30:27','2023-06-12 13:18:34',1,'2023-06-12 13:18:34',NULL,NULL,NULL),(39,6,'977bc550-5069-11e9-a14e-635e0fd3bfa6','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-06-11 13:19:23','2023-07-24 13:51:15',1,'2023-06-15 13:36:35',NULL,NULL,NULL),(40,7,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-06-12 13:24:53','2023-07-23 07:44:10',1,'2023-07-15 07:40:23',NULL,NULL,NULL),(41,5,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','2d47f470-dc78-11ed-8493-97c361d41aef','2023-07-12 14:36:28','2023-07-19 14:33:45',1,NULL,NULL,NULL,NULL),(42,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-23 05:57:14','2023-07-23 05:57:14',0,'2023-07-23 05:57:14',13,4,8),(43,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-23 05:57:31','2023-07-23 05:57:31',0,'2023-07-23 05:57:31',14,2,8),(44,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-23 05:57:51','2023-07-23 05:57:51',0,'2023-07-23 05:57:51',15,2,8),(45,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-23 05:58:40','2023-07-24 13:51:19',1,'2023-07-23 05:58:40',16,2,8),(46,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-23 06:39:17','2023-07-23 06:39:17',0,'2023-07-23 06:39:17',17,4,8),(47,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-23 07:08:28','2023-07-24 13:51:10',1,'2023-07-23 07:08:28',18,4,8),(48,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-30 12:55:15','2023-07-30 12:55:15',0,'2023-07-30 12:55:15',19,2,8),(49,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-30 12:55:25','2023-07-30 12:55:25',0,'2023-07-30 12:55:25',20,2,8),(50,8,'3fcd41e0-376e-11ed-9bcb-1fd549eed589','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','2023-07-30 12:56:24','2023-07-30 15:06:47',1,'2023-07-30 15:06:47',21,2,8);
/*!40000 ALTER TABLE `Threads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservationId` int(11) NOT NULL,
  `payerEmail` varchar(255) DEFAULT NULL,
  `payerId` varchar(255) DEFAULT NULL,
  `receiverEmail` varchar(255) DEFAULT NULL,
  `receiverId` varchar(255) DEFAULT NULL,
  `transactionId` varchar(255) DEFAULT '1',
  `total` float NOT NULL,
  `transactionFee` float DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `ipn_track_id` varchar(255) DEFAULT NULL,
  `paymentType` enum('booking','cancellation','host') DEFAULT 'booking',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `paymentMethodId` tinyint(1) DEFAULT 1,
  `splitAndShare` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservationId` (`reservationId`),
  CONSTRAINT `Transaction_ibfk_1` FOREIGN KEY (`reservationId`) REFERENCES `Reservation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transaction`
--

LOCK TABLES `Transaction` WRITE;
/*!40000 ALTER TABLE `Transaction` DISABLE KEYS */;
INSERT INTO `Transaction` VALUES (1,1,'abdelrhman.sapry.alwtany@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3LW0zmA3oQdQ8GEm1wzJ0Ffx',3152,NULL,'USD',NULL,'booking','2022-08-12 16:46:04','2022-08-12 16:46:04',2,NULL),(2,2,'abdelrhman.sapry.alwtany@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3LWBKbA3oQdQ8GEm06vg9MUW',2364,NULL,'USD',NULL,'booking','2022-08-13 03:48:16','2022-08-13 03:48:16',2,NULL),(3,61,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3LmXg0A3oQdQ8GEm0fp3EE1J',1169,NULL,'USD',NULL,'booking','2022-09-27 06:53:57','2022-09-27 06:53:57',2,NULL),(4,62,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3LmXn8A3oQdQ8GEm14sa5DOL',588,NULL,'USD',NULL,'booking','2022-09-27 07:01:19','2022-09-27 07:01:19',2,NULL),(5,63,'abdelrhman.sapry.alwtany@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3Lmy1LA3oQdQ8GEm0PPXcvTy',166,NULL,'USD',NULL,'booking','2022-09-28 11:01:45','2022-09-28 11:01:45',2,NULL),(6,64,'abdelrhman.sapry.alwtany@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3LmyV7A3oQdQ8GEm1Ubzfekf',542,NULL,'USD',NULL,'booking','2022-09-28 11:32:31','2022-09-28 11:32:31',2,NULL),(7,65,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3LwK6EA3oQdQ8GEm1RGiuKai',1806,NULL,'USD',NULL,'booking','2022-10-24 06:25:27','2022-10-24 06:25:27',2,NULL),(8,66,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3LwUPfA3oQdQ8GEm1GTwYjwa',1777,NULL,'USD',NULL,'booking','2022-10-24 17:26:13','2022-10-24 17:26:13',2,NULL),(20,81,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3LyzFsA3oQdQ8GEm1EoO8a1e',1858,NULL,'USD',NULL,'booking','2022-10-31 14:46:26','2022-10-31 14:46:26',2,NULL),(21,84,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3M0TjBA3oQdQ8GEm1pTACYmT',1275,NULL,'USD',NULL,'booking','2022-11-04 17:30:50','2022-11-04 17:30:50',2,NULL),(26,89,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3M0mKxA3oQdQ8GEm0wn3VMGi',2241,NULL,'USD',NULL,'booking','2022-11-05 13:23:05','2022-11-05 13:23:05',2,NULL),(27,90,'demo@radicalstart.com','cus_MiLnirsjZng9r7',NULL,NULL,'pi_3M11y0A3oQdQ8GEm0aWLbgrY',11433,NULL,'USD',NULL,'booking','2022-11-06 06:04:25','2022-11-06 06:04:25',2,NULL),(28,91,'demo@radicalstart.com','cus_MiLnirsjZng9r7',NULL,NULL,'pi_3M13jDA3oQdQ8GEm1uIkrkIk',8467,NULL,'USD',NULL,'booking','2022-11-06 07:57:17','2022-11-06 07:57:17',2,NULL),(30,93,'demo@radicalstart.com','cus_MiLnirsjZng9r7',NULL,NULL,'pi_3M14ztA3oQdQ8GEm0n57MW4Z',6887,NULL,'USD',NULL,'booking','2022-11-06 09:18:34','2022-11-06 09:18:34',2,NULL),(31,94,'ahmedtaha200079@gmail.com','cus_METxH2nSWLTcPl',NULL,NULL,'pi_3M4T4sA3oQdQ8GEm0u0h6wUu',2741,NULL,'USD',NULL,'booking','2022-11-15 17:37:44','2022-11-15 17:37:44',2,NULL),(32,95,'demo@radicalstart.com','cus_MiLnirsjZng9r7',NULL,NULL,'pi_3MxZPCA3oQdQ8GEm1arPfaX2',1535,NULL,'USD',NULL,'booking','2023-04-16 17:30:27','2023-04-16 17:30:27',2,NULL),(33,96,'demo@radicalstart.com','cus_MiLnirsjZng9r7',NULL,NULL,'pi_3Mxa2mA3oQdQ8GEm08nEBZvG',2275,NULL,'USD',NULL,'booking','2023-04-16 18:11:21','2023-04-16 18:11:21',2,NULL),(34,97,'demo@radicalstart.com','cus_MiLnirsjZng9r7',NULL,NULL,'pi_3NHnlbA3oQdQ8GEm1wHllZLg',995,NULL,'USD',NULL,'booking','2023-06-11 12:53:12','2023-06-11 12:53:12',2,NULL),(35,98,'demo@radicalstart.com','cus_MiLnirsjZng9r7',NULL,NULL,'pi_3NHoAwA3oQdQ8GEm1DLwOlJE',1990,NULL,'USD',NULL,'booking','2023-06-11 13:19:23','2023-06-11 13:19:23',2,NULL),(36,99,'demo@radicalstart.com','cus_MiLnirsjZng9r7',NULL,NULL,'pi_3NIAjoA3oQdQ8GEm0Y2wJi3f',5564,NULL,'USD',NULL,'booking','2023-06-12 13:24:53','2023-06-12 13:24:53',2,NULL),(37,120,'demo@radicalstart.com','cus_OMZNTFmogUrtZg',NULL,NULL,'pi_3NZqInIvM8AX56ru24LsBvOF',1497,NULL,'USD',NULL,'booking','2023-07-31 07:14:03','2023-07-31 07:14:03',2,NULL),(38,122,'demo@radicalstart.com','cus_OMZNTFmogUrtZg',NULL,NULL,'pi_3NZs7iIvM8AX56ru1WS54grz',795,NULL,'USD',NULL,'booking','2023-07-31 09:10:44','2023-07-31 09:10:44',2,NULL),(39,129,'demo@radicalstart.com','cus_OMZNTFmogUrtZg',NULL,NULL,'pi_3NZueHIvM8AX56ru0B6nLqQE',795,NULL,'USD',NULL,'booking','2023-07-31 11:52:30','2023-07-31 11:52:30',2,NULL),(40,130,'demo@radicalstart.com','cus_OMZNTFmogUrtZg',NULL,NULL,'pi_3NZxMuIvM8AX56ru12o5DCqv',2198,NULL,'USD',NULL,'booking','2023-07-31 14:46:45','2023-07-31 14:46:45',2,NULL),(41,131,'demo@radicalstart.com','cus_OMZNTFmogUrtZg',NULL,NULL,'pi_3NaDxHIvM8AX56ru1NcxlcfV',1502,NULL,'USD',NULL,'booking','2023-08-01 08:29:24','2023-08-01 08:29:24',2,NULL),(42,135,'demo@radicalstart.com','cus_OMZNTFmogUrtZg',NULL,NULL,'pi_3NaJJhIvM8AX56ru065h3zas',1502,NULL,'USD',NULL,'booking','2023-08-01 14:13:44','2023-08-01 14:13:44',2,NULL),(43,137,'demo@radicalstart.com','cus_OMZNTFmogUrtZg',NULL,NULL,'pi_3NaJN3IvM8AX56ru1Qs9EvC0',1502,NULL,'USD',NULL,'booking','2023-08-01 14:22:36','2023-08-01 14:22:36',2,NULL),(44,138,'demo@radicalstart.com','cus_OMZNTFmogUrtZg',NULL,NULL,'pi_3NaYX9IvM8AX56ru1ReW24Gv',798,NULL,'USD',NULL,'booking','2023-08-02 06:28:01','2023-08-02 06:28:01',2,NULL);
/*!40000 ALTER TABLE `Transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransactionHistory`
--

DROP TABLE IF EXISTS `TransactionHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TransactionHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reservationId` int(11) NOT NULL,
  `userId` char(36) NOT NULL,
  `payoutId` int(11) NOT NULL,
  `payoutEmail` varchar(255) NOT NULL,
  `amount` float NOT NULL,
  `fees` float DEFAULT NULL,
  `currency` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `transactionId` varchar(255) DEFAULT NULL,
  `paymentMethodId` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reservationId` (`reservationId`),
  CONSTRAINT `TransactionHistory_ibfk_1` FOREIGN KEY (`reservationId`) REFERENCES `Reservation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransactionHistory`
--

LOCK TABLES `TransactionHistory` WRITE;
/*!40000 ALTER TABLE `TransactionHistory` DISABLE KEYS */;
INSERT INTO `TransactionHistory` VALUES (1,54,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',1,'dd@dd.com',50,NULL,'egy','2022-09-11 00:00:00','2022-09-11 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `TransactionHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `id` char(36) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `emailConfirmed` tinyint(1) DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userBanStatus` tinyint(1) DEFAULT 0,
  `userDeletedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('1a0dd610-20c3-11ee-bd2e-539a1d889026','hhh@gmail.com','$2a$08$OsKSBTfujfPMbZ.sAKqwYOLnr7bSMcHXYupk4r1i3XZ2ZtF6eF45u',1,'email','2023-07-12 14:48:02','2023-07-12 14:48:02',NULL,NULL),('216a4e80-f79b-11ed-bd2e-539a1d889026','test5@gmail.com','$2a$08$OsKSBTfujfPMbZ.sAKqwYOLnr7bSMcHXYupk4r1i3XZ2ZtF6eF45u',1,'email','2023-05-21 05:48:37','2023-05-21 05:48:37',NULL,NULL),('2cd07c00-10e5-11ee-bd2e-539a1d889026','aaa@gmail.com','$2a$08$OsKSBTfujfPMbZ.sAKqwYOLnr7bSMcHXYupk4r1i3XZ2ZtF6eF45u',1,'email','2023-06-22 10:11:38','2023-06-22 10:11:38',NULL,NULL),('2d47f470-dc78-11ed-8493-97c361d41aef','demo2@gmail.com','$2a$08$OsKSBTfujfPMbZ.sAKqwYOLnr7bSMcHXYupk4r1i3XZ2ZtF6eF45u',1,'email','2023-04-16 17:00:23','2023-04-16 17:00:23',0,NULL),('3fcd41e0-376e-11ed-9bcb-1fd549eed589','ahmedtaha200079@gmail.com','$2a$08$OsKSBTfujfPMbZ.sAKqwYOLnr7bSMcHXYupk4r1i3XZ2ZtF6eF45u',1,'email','2022-09-18 16:23:37','2022-09-18 16:23:37',0,NULL),('48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9','abdelrhman.sapry.alwtany@gmail.com','$2a$08$OsKSBTfujfPMbZ.sAKqwYOLnr7bSMcHXYupk4r1i3XZ2ZtF6eF45u',1,'email','2022-08-12 16:10:29','2022-08-12 16:10:29',0,NULL),('493f7c90-2b8b-11ee-a6e6-c97f3307257b','basel.nanaa71@gmail.com','$2a$08$7CC0BgYPTi4oL25ruRRcguS6xjVu4PZpPSo4aS1zazMicV1xofmrm',1,'email','2023-07-26 08:06:12','2023-07-26 08:06:12',0,NULL),('58c66a20-f7ab-11ed-bd2e-539a1d889026','teet1@gmail.com','$2a$08$OsKSBTfujfPMbZ.sAKqwYOLnr7bSMcHXYupk4r1i3XZ2ZtF6eF45u',1,'email','2023-05-21 07:44:41','2023-05-21 07:44:41',NULL,NULL),('686d5a50-f3c4-11ed-bd2e-539a1d889026','hhhh@gmail.com','$2a$08$OsKSBTfujfPMbZ.sAKqwYOLnr7bSMcHXYupk4r1i3XZ2ZtF6eF45u',1,'email','2023-05-16 08:34:00','2023-05-16 08:34:00',NULL,NULL),('977bc550-5069-11e9-a14e-635e0fd3bfa6','qa@radicalstart.com','$2a$08$OsKSBTfujfPMbZ.sAKqwYOLnr7bSMcHXYupk4r1i3XZ2ZtF6eF45u',1,'email','2019-03-27 08:23:25','2019-03-27 08:23:25',0,NULL),('9c276d50-14c0-11ee-a424-bd24a6095848','rabahnasi@gmail.com','$2a$08$OsKSBTfujfPMbZ.sAKqwYOLnr7bSMcHXYupk4r1i3XZ2ZtF6eF45u',1,'email','2023-06-27 07:59:58','2023-06-27 07:59:58',0,NULL),('9d1f15d0-005e-11ee-8c2a-c142d6c35686','demo44@gmail.com','$2a$08$OsKSBTfujfPMbZ.sAKqwYOLnr7bSMcHXYupk4r1i3XZ2ZtF6eF45u',1,'email','2023-06-01 09:28:05','2023-06-01 09:28:05',0,NULL),('a9ecf070-f497-11ed-bd2e-539a1d889026','test3@gmail.com','$2a$08$OsKSBTfujfPMbZ.sAKqwYOLnr7bSMcHXYupk4r1i3XZ2ZtF6eF45u',1,'email','2023-05-17 09:46:14','2023-05-24 08:06:42',NULL,NULL),('b15ebb70-f7aa-11ed-bd2e-539a1d889026','teet4@gmail.com','$2a$08$OsKSBTfujfPMbZ.sAKqwYOLnr7bSMcHXYupk4r1i3XZ2ZtF6eF45u',1,'email','2023-05-21 07:40:01','2023-05-21 07:40:01',NULL,NULL),('c4bb2220-f7ab-11ed-bd2e-539a1d889026','teet5@gmail.com','$2a$08$OsKSBTfujfPMbZ.sAKqwYOLnr7bSMcHXYupk4r1i3XZ2ZtF6eF45u',1,'email','2023-05-21 07:47:43','2023-05-21 07:47:43',NULL,NULL),('d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','demo@radicalstart.com','$2a$08$OsKSBTfujfPMbZ.sAKqwYOLnr7bSMcHXYupk4r1i3XZ2ZtF6eF45u',1,'email','2019-03-27 07:49:15','2019-03-27 07:49:15',0,NULL),('ecba1810-2c87-11ee-b289-61fce239156d','abdalrazak.it@gmail.com','$2a$08$Y6ozUWnMCrNTg4NGq5xr2O368vEro/NWizGN61sa8MM/OJhiNGJ2O',1,'email','2023-07-27 14:14:39','2023-07-27 14:14:39',0,NULL),('fc1aba80-005e-11ee-8c2a-c142d6c35686','demo45@gmail.com','$2a$08$OsKSBTfujfPMbZ.sAKqwYOLnr7bSMcHXYupk4r1i3XZ2ZtF6eF45u',1,'email','2023-06-01 09:30:45','2023-06-01 09:30:45',0,NULL);
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserAmenities`
--

DROP TABLE IF EXISTS `UserAmenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserAmenities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `amenitiesId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `listId` (`listId`),
  CONSTRAINT `UserAmenities_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=659 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserAmenities`
--

LOCK TABLES `UserAmenities` WRITE;
/*!40000 ALTER TABLE `UserAmenities` DISABLE KEYS */;
INSERT INTO `UserAmenities` VALUES (1,1,26,'2019-03-27 09:46:00','2019-03-27 09:46:00'),(2,1,25,'2019-03-27 09:46:00','2019-03-27 09:46:00'),(3,1,27,'2019-03-27 09:46:00','2019-03-27 09:46:00'),(4,1,73,'2019-03-27 09:46:00','2019-03-27 09:46:00'),(5,1,118,'2019-03-27 09:46:00','2019-03-27 09:46:00'),(28,6,27,'2019-07-04 10:52:39','2019-07-04 10:52:39'),(29,6,25,'2019-07-04 10:52:39','2019-07-04 10:52:39'),(30,6,118,'2019-07-04 10:52:39','2019-07-04 10:52:39'),(31,5,25,'2019-07-04 10:57:09','2019-07-04 10:57:09'),(32,5,73,'2019-07-04 10:57:09','2019-07-04 10:57:09'),(33,5,28,'2019-07-04 10:57:09','2019-07-04 10:57:09'),(40,2,25,'2019-07-04 11:02:18','2019-07-04 11:02:18'),(41,2,119,'2019-07-04 11:02:18','2019-07-04 11:02:18'),(42,2,73,'2019-07-04 11:02:18','2019-07-04 11:02:18'),(425,7,73,'2022-10-27 11:39:32','2022-10-27 11:39:32'),(426,7,118,'2022-10-27 11:39:32','2022-10-27 11:39:32'),(427,7,25,'2022-10-27 11:39:32','2022-10-27 11:39:32'),(428,7,27,'2022-10-27 11:39:32','2022-10-27 11:39:32'),(457,8,26,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(458,8,119,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(459,8,27,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(460,8,73,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(461,8,28,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(462,8,25,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(463,8,118,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(469,15,25,'2022-11-07 11:45:24','2022-11-07 11:45:24'),(470,15,26,'2022-11-07 11:45:24','2022-11-07 11:45:24'),(471,14,26,'2022-11-09 11:11:30','2022-11-09 11:11:30'),(472,14,25,'2022-11-09 11:11:30','2022-11-09 11:11:30'),(473,14,28,'2022-11-09 11:11:30','2022-11-09 11:11:30'),(652,4,119,'2022-11-15 18:14:14','2022-11-15 18:14:14'),(653,4,73,'2022-11-15 18:14:14','2022-11-15 18:14:14'),(654,4,28,'2022-11-15 18:14:14','2022-11-15 18:14:14'),(655,4,27,'2022-11-15 18:14:14','2022-11-15 18:14:14'),(656,4,25,'2022-11-15 18:14:14','2022-11-15 18:14:14'),(657,4,26,'2022-11-15 18:14:14','2022-11-15 18:14:14'),(658,4,118,'2022-11-15 18:14:14','2022-11-15 18:14:14');
/*!40000 ALTER TABLE `UserAmenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserClaim`
--

DROP TABLE IF EXISTS `UserClaim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserClaim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `UserClaim_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserClaim`
--

LOCK TABLES `UserClaim` WRITE;
/*!40000 ALTER TABLE `UserClaim` DISABLE KEYS */;
/*!40000 ALTER TABLE `UserClaim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserCoupon`
--

DROP TABLE IF EXISTS `UserCoupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserCoupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `couponId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserCoupon`
--

LOCK TABLES `UserCoupon` WRITE;
/*!40000 ALTER TABLE `UserCoupon` DISABLE KEYS */;
INSERT INTO `UserCoupon` VALUES (1,'3fcd41e0-376e-11ed-9bcb-1fd549eed589',1),(2,'3fcd41e0-376e-11ed-9bcb-1fd549eed589',1),(3,'3fcd41e0-376e-11ed-9bcb-1fd549eed589',1),(4,'3fcd41e0-376e-11ed-9bcb-1fd549eed589',1),(5,'3fcd41e0-376e-11ed-9bcb-1fd549eed589',1),(6,'3fcd41e0-376e-11ed-9bcb-1fd549eed589',3);
/*!40000 ALTER TABLE `UserCoupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserHouseRules`
--

DROP TABLE IF EXISTS `UserHouseRules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserHouseRules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `houseRulesId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listId` (`listId`),
  KEY `houseRulesId` (`houseRulesId`),
  CONSTRAINT `UserHouseRules_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UserHouseRules_ibfk_2` FOREIGN KEY (`houseRulesId`) REFERENCES `ListSettings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserHouseRules`
--

LOCK TABLES `UserHouseRules` WRITE;
/*!40000 ALTER TABLE `UserHouseRules` DISABLE KEYS */;
INSERT INTO `UserHouseRules` VALUES (1,1,'2019-03-27 09:49:54','2019-03-27 09:49:54',48),(2,1,'2019-03-27 09:49:54','2019-03-27 09:49:54',50),(3,1,'2019-03-27 09:49:54','2019-03-27 09:49:54',51),(4,2,'2019-03-27 09:52:48','2019-03-27 09:52:48',50),(5,2,'2019-03-27 09:52:48','2019-03-27 09:52:48',52),(25,7,'2019-11-13 11:56:53','2019-11-13 11:56:53',50),(104,8,'2022-11-06 04:56:52','2022-11-06 04:56:52',48),(105,8,'2022-11-06 04:56:52','2022-11-06 04:56:52',52),(106,8,'2022-11-06 04:56:52','2022-11-06 04:56:52',50),(107,8,'2022-11-06 04:56:52','2022-11-06 04:56:52',51),(108,8,'2022-11-06 04:56:52','2022-11-06 04:56:52',49),(109,15,'2022-11-09 10:33:57','2022-11-09 10:33:57',48),(110,15,'2022-11-09 10:33:57','2022-11-09 10:33:57',50),(111,14,'2022-11-09 12:01:51','2022-11-09 12:01:51',51),(112,14,'2022-11-09 12:01:51','2022-11-09 12:01:51',52),(113,5,'2023-04-16 18:38:57','2023-04-16 18:38:57',50),(114,5,'2023-04-16 18:38:57','2023-04-16 18:38:57',52),(115,5,'2023-04-16 18:38:57','2023-04-16 18:38:57',51),(145,6,'2023-07-19 10:49:52','2023-07-19 10:49:52',50),(146,6,'2023-07-19 10:49:52','2023-07-19 10:49:52',51),(147,6,'2023-07-19 10:49:52','2023-07-19 10:49:52',49),(168,4,'2023-07-20 12:52:49','2023-07-20 12:52:49',49),(169,4,'2023-07-20 12:52:49','2023-07-20 12:52:49',52),(170,4,'2023-07-20 12:52:49','2023-07-20 12:52:49',50),(171,4,'2023-07-20 12:52:49','2023-07-20 12:52:49',48),(172,4,'2023-07-20 12:52:49','2023-07-20 12:52:49',51);
/*!40000 ALTER TABLE `UserHouseRules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserListingData`
--

DROP TABLE IF EXISTS `UserListingData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserListingData` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `settingsId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `listId` (`listId`),
  CONSTRAINT `UserListingData_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=517 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserListingData`
--

LOCK TABLES `UserListingData` WRITE;
/*!40000 ALTER TABLE `UserListingData` DISABLE KEYS */;
INSERT INTO `UserListingData` VALUES (6,1,77,'2019-03-27 09:46:00','2019-03-27 09:46:00'),(7,1,5,'2019-03-27 09:46:00','2019-03-27 09:46:00'),(8,1,10,'2019-03-27 09:46:00','2019-03-27 09:46:00'),(9,1,16,'2019-03-27 09:46:00','2019-03-27 09:46:00'),(10,1,22,'2019-03-27 09:46:00','2019-03-27 09:46:00'),(76,6,76,'2019-07-04 10:52:39','2019-07-04 10:52:39'),(77,6,6,'2019-07-04 10:52:39','2019-07-04 10:52:39'),(78,6,10,'2019-07-04 10:52:39','2019-07-04 10:52:39'),(79,6,16,'2019-07-04 10:52:39','2019-07-04 10:52:39'),(80,6,22,'2019-07-04 10:52:39','2019-07-04 10:52:39'),(81,5,77,'2019-07-04 10:57:09','2019-07-04 10:57:09'),(82,5,5,'2019-07-04 10:57:09','2019-07-04 10:57:09'),(83,5,10,'2019-07-04 10:57:09','2019-07-04 10:57:09'),(84,5,16,'2019-07-04 10:57:09','2019-07-04 10:57:09'),(85,5,22,'2019-07-04 10:57:09','2019-07-04 10:57:09'),(96,2,74,'2019-07-04 11:02:18','2019-07-04 11:02:18'),(97,2,5,'2019-07-04 11:02:18','2019-07-04 11:02:18'),(98,2,10,'2019-07-04 11:02:18','2019-07-04 11:02:18'),(99,2,16,'2019-07-04 11:02:18','2019-07-04 11:02:18'),(100,2,22,'2019-07-04 11:02:18','2019-07-04 11:02:18'),(333,7,77,'2022-10-27 11:39:32','2022-10-27 11:39:32'),(334,7,5,'2022-10-27 11:39:32','2022-10-27 11:39:32'),(335,7,11,'2022-10-27 11:39:32','2022-10-27 11:39:32'),(336,7,22,'2022-10-27 11:39:32','2022-10-27 11:39:32'),(353,8,77,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(354,8,5,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(355,8,11,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(356,8,22,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(361,13,76,'2022-11-07 11:07:37','2022-11-07 11:07:37'),(362,13,5,'2022-11-07 11:07:37','2022-11-07 11:07:37'),(363,13,10,'2022-11-07 11:07:37','2022-11-07 11:07:37'),(364,13,2,'2022-11-07 11:07:37','2022-11-07 11:07:37'),(381,15,76,'2022-11-07 11:45:24','2022-11-07 11:45:24'),(382,15,5,'2022-11-07 11:45:24','2022-11-07 11:45:24'),(383,15,10,'2022-11-07 11:45:24','2022-11-07 11:45:24'),(384,15,2,'2022-11-07 11:45:24','2022-11-07 11:45:24'),(385,14,76,'2022-11-09 11:11:30','2022-11-09 11:11:30'),(386,14,5,'2022-11-09 11:11:30','2022-11-09 11:11:30'),(387,14,10,'2022-11-09 11:11:30','2022-11-09 11:11:30'),(388,14,2,'2022-11-09 11:11:30','2022-11-09 11:11:30'),(493,4,113,'2022-11-15 18:14:14','2022-11-15 18:14:14'),(494,4,7,'2022-11-15 18:14:14','2022-11-15 18:14:14'),(495,4,10,'2022-11-15 18:14:14','2022-11-15 18:14:14'),(496,4,22,'2022-11-15 18:14:14','2022-11-15 18:14:14'),(497,16,76,'2023-06-12 13:27:45','2023-06-12 13:27:45'),(498,16,5,'2023-06-12 13:27:45','2023-06-12 13:27:45'),(499,16,10,'2023-06-12 13:27:45','2023-06-12 13:27:45'),(500,16,22,'2023-06-12 13:27:45','2023-06-12 13:27:45'),(501,17,77,'2023-06-15 07:03:12','2023-06-15 07:03:12'),(502,17,5,'2023-06-15 07:03:12','2023-06-15 07:03:12'),(503,17,10,'2023-06-15 07:03:12','2023-06-15 07:03:12'),(504,17,22,'2023-06-15 07:03:12','2023-06-15 07:03:12'),(505,18,113,'2023-07-01 12:56:02','2023-07-01 12:56:02'),(506,18,6,'2023-07-01 12:56:02','2023-07-01 12:56:02'),(507,18,10,'2023-07-01 12:56:02','2023-07-01 12:56:02'),(508,18,2,'2023-07-01 12:56:02','2023-07-01 12:56:02'),(509,19,76,'2023-07-15 07:45:21','2023-07-15 07:45:21'),(510,19,7,'2023-07-15 07:45:21','2023-07-15 07:45:21'),(511,19,10,'2023-07-15 07:45:21','2023-07-15 07:45:21'),(512,19,23,'2023-07-15 07:45:21','2023-07-15 07:45:21'),(513,20,77,'2023-07-16 12:39:42','2023-07-16 12:39:42'),(514,20,5,'2023-07-16 12:39:42','2023-07-16 12:39:42'),(515,20,102,'2023-07-16 12:39:42','2023-07-16 12:39:42'),(516,20,23,'2023-07-16 12:39:42','2023-07-16 12:39:42');
/*!40000 ALTER TABLE `UserListingData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserListingSteps`
--

DROP TABLE IF EXISTS `UserListingSteps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserListingSteps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `step1` enum('inactive','active','completed') DEFAULT 'inactive',
  `step2` enum('inactive','active','completed') DEFAULT 'inactive',
  `step3` enum('inactive','active','completed') DEFAULT 'inactive',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `step4` enum('inactive','active','completed') DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `listId` (`listId`),
  CONSTRAINT `UserListingSteps_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserListingSteps`
--

LOCK TABLES `UserListingSteps` WRITE;
/*!40000 ALTER TABLE `UserListingSteps` DISABLE KEYS */;
INSERT INTO `UserListingSteps` VALUES (1,1,'completed','completed','completed','2019-03-27 09:45:45','2019-03-27 09:49:54','completed'),(2,2,'completed','completed','completed','2019-03-27 09:50:29','2019-03-27 09:52:49','completed'),(4,4,'completed','completed','completed','2019-03-27 09:56:38','2019-03-27 09:59:06','completed'),(5,5,'completed','completed','completed','2019-03-27 10:03:31','2019-03-27 10:05:46','completed'),(6,6,'completed','completed','completed','2019-03-27 10:07:00','2019-03-27 10:08:24','completed'),(7,7,'completed','completed','completed','2019-03-27 10:09:22','2019-03-27 10:11:05','completed'),(8,8,'completed','completed','completed','2020-01-23 05:50:56','2020-01-23 05:53:24','completed'),(10,13,'active','inactive','inactive','2022-11-07 11:07:37','2022-11-07 11:07:37','active'),(11,14,'completed','completed','completed','2022-11-07 11:13:20','2022-11-09 12:01:51','completed'),(12,15,'completed','completed','completed','2022-11-07 11:45:00','2022-11-09 10:33:57','completed'),(13,16,'active','inactive','inactive','2023-06-12 13:27:45','2023-06-12 13:27:45','active'),(14,17,'active','inactive','inactive','2023-06-15 07:03:13','2023-06-15 07:03:13','active'),(15,18,'active','inactive','inactive','2023-07-01 12:56:02','2023-07-01 12:56:02','active'),(16,19,'active','inactive','inactive','2023-07-15 07:45:22','2023-07-15 07:45:22','active'),(17,20,'active','inactive','inactive','2023-07-16 12:39:42','2023-07-16 12:39:42','active');
/*!40000 ALTER TABLE `UserListingSteps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserLogin`
--

DROP TABLE IF EXISTS `UserLogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserLogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `userId` varchar(255) DEFAULT NULL,
  `deviceType` varchar(255) DEFAULT NULL,
  `deviceId` varchar(255) DEFAULT NULL,
  `deviceDetail` mediumtext DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserLogin`
--

LOCK TABLES `UserLogin` WRITE;
/*!40000 ALTER TABLE `UserLogin` DISABLE KEYS */;
INSERT INTO `UserLogin` VALUES (1,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjgxODM0Mjc4LCJleHAiOjE2OTczODYyNzh9.i2AKiDhve-c5WoitPRpl4hmFEsAuVIlBabz4we16OHc','2d47f470-dc78-11ed-8493-97c361d41aef','android','eaVBQdv2SkCbe6acKaI0z7:APA91bGpM4qh70hdIaFvTwb9IdPv1jekyErhjVnb6wqfy4SXmBeZnoyLIpbApkD6jS03KNJ0XFXfe4w0oSw0jjCyZqBdK2z4kR5s9V6nNDmuRdKYDsxxg_HNnFnkVyUr6oIFQzGRBPKm','','2023-04-18 16:11:18','2023-04-18 16:11:18'),(2,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjgxODM4MzU2LCJleHAiOjE2OTczOTAzNTZ9.lRNglpQpENmxve-PZS-vRkcJPsOUAwjN7r9y2PylHFQ','2d47f470-dc78-11ed-8493-97c361d41aef','android','dbMiQguFQvWSizofqwPOff:APA91bHyqKFOLBSWh-qIXZCz3r_q5a2GOubWi2WU201cxE4zI9ljCxKZ_m9dOJIseFm1J7zi3P7HuVeMMgGnCrDoQalFcwQr-o6Ri18tqRgD0jMF-UmK1Ezf09x3PgsThMtcve4LqQk9','','2023-04-18 17:19:16','2023-04-18 17:19:16'),(3,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjgyNTM3MzQ4LCJleHAiOjE2OTgwODkzNDh9.jQNYDy_b9yEE9_EuKaNQSEGp2ZmciNr7VmymmRUeuH0','2d47f470-dc78-11ed-8493-97c361d41aef','iOS','eSDvRI4TvU2Roq2-DjJ8tT:APA91bF2Q_UMZbITdfS28mREYLWFXFWbNEMCfzn5PblC7CuY81oIx1o2qpQsGitMEywYSM4VjmgvIvdo4C79BINqbPMwZb9yioYB10Ln73d_O2QvBPphWwqjRLXzop58MvOmUdmFjv-Q','','2023-04-26 19:27:29','2023-04-26 19:29:08'),(4,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImQxZDZkNWEwLTUwNjQtMTFlOS1hMTRlLTYzNWUwZmQzYmZhNiIsImVtYWlsIjoiZGVtb0ByYWRpY2Fsc3RhcnQuY29tIiwiaWF0IjoxNjgyNTM3NDMzLCJleHAiOjE2OTgwODk0MzN9.vhJtg4nAdgO2o4VCyvRTaRBUfnC6_nVHDXYw8h1klr4','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','iOS','eSDvRI4TvU2Roq2-DjJ8tT:APA91bF2Q_UMZbITdfS28mREYLWFXFWbNEMCfzn5PblC7CuY81oIx1o2qpQsGitMEywYSM4VjmgvIvdo4C79BINqbPMwZb9yioYB10Ln73d_O2QvBPphWwqjRLXzop58MvOmUdmFjv-Q','','2023-04-26 19:30:33','2023-04-26 19:30:33'),(5,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImQxZDZkNWEwLTUwNjQtMTFlOS1hMTRlLTYzNWUwZmQzYmZhNiIsImVtYWlsIjoiZGVtb0ByYWRpY2Fsc3RhcnQuY29tIiwiaWF0IjoxNjgyNTk2OTc5LCJleHAiOjE2OTgxNDg5Nzl9.dBYQiZ_C4cvUZ8NfJVO63E1ogmVoFHjE-4VNgq_LiUw','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','iOS','fly6OgVp-0Dkp2q89uvWaV:APA91bG6BtPn-gPjKJkp2_EvgOarkqyXZJpGMJvZU-SFDIW-FSBERroy1IVQVDCIHKbIifS1_Lp0Uu93w7XJNvCsml_MnuObIy_I2lk38aqmV9F-qPHK2yDqdRgXA491GnvvJWPbP9eD','','2023-04-27 12:02:59','2023-04-27 12:02:59'),(7,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjg0MzE2NTE5LCJleHAiOjE2OTk4Njg1MTl9.F9XuGAnFKfRBTPDSFU-KbaP4LnFsCY2Hd_oVhoy9vek','2d47f470-dc78-11ed-8493-97c361d41aef','android','eQ5-iwctSq-kzPdqbujqAX:APA91bGrsJIEGtxtUPfmnFhNQeVhVgfQJrFRNvFfvYpwpV8a553_ylKF2J3su03La3B--mn4uI8cBLJg08s2SWo6Ovm6tp1PNlVi8G1Bim-3ZhLjXXribT_hfO53CNm5TGjR4ru5WDAt','{Input@23290} com.apollographql.apollo.api.Input@4cf','2023-05-16 07:42:33','2023-05-17 09:41:59'),(8,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NmQ1YTUwLWYzYzQtMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoiaGhoaEBnbWFpbC5jb20iLCJpYXQiOjE2ODQyMjYwNDAsImV4cCI6MTY5OTc3ODA0MH0.bv3pKBrdevl2MpGkXpxfJX-2Vo4u1FghXYi_NTUYT1Q','686d5a50-f3c4-11ed-bd2e-539a1d889026','android','djy7zgvQTMeG2b5D9yTuJ0:APA91bFyu7-a6dSd4Q0YMQB1afyX-tWOwtvScCtIBuQ0NDYWVAFMs4jgh7eVTinP-QAIBg4fUdHv5Ee9R-h98iiTEHINjd0K1M-CdkS7c13l96T4Muow2-1tY7lBK719H6K58Fv3P4MM','','2023-05-16 08:34:00','2023-05-16 08:34:00'),(9,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwiaWF0IjoxNjg0NzAyMDc0LCJleHAiOjE3MDAyNTQwNzR9.dBzFYGcyXh_t6jsZCWjUmlW9tvxqFAu3FyH6QLgV-eo','a9ecf070-f497-11ed-bd2e-539a1d889026','android','eQ5-iwctSq-kzPdqbujqAX:APA91bGrsJIEGtxtUPfmnFhNQeVhVgfQJrFRNvFfvYpwpV8a553_ylKF2J3su03La3B--mn4uI8cBLJg08s2SWo6Ovm6tp1PNlVi8G1Bim-3ZhLjXXribT_hfO53CNm5TGjR4ru5WDAt','{Input@23290} com.apollographql.apollo.api.Input@4cf','2023-05-17 09:46:14','2023-05-21 20:47:54'),(10,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwiaWF0IjoxNjg0MzE3MDY4LCJleHAiOjE2OTk4NjkwNjh9.J5GN68aO4lXiy6PPvT3dHH-6iNKH4Zv0moe792OnSkw','a9ecf070-f497-11ed-bd2e-539a1d889026','android','eQ5-iwctSq-kz12qbujqAR:BBA91bGrsJIEGtxtUPfmnFhNQeVhVgfQJrFRNvFfvYpwpV8a553_ylKF2J3su03La3B--mn4uI8cBLJg08s2SWo6Ovm6tp1PNlVi8G1Bim-3ZhLjXXribT_hfO53CNm5TGjR4ru5WDAt','{Input@23290} com.apollographql.apollo.api.Input@4cf','2023-05-17 09:51:08','2023-05-17 09:51:08'),(11,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwiaWF0IjoxNjg0NjIwNjg1LCJleHAiOjE3MDAxNzI2ODV9.3oWmkcMnk_vQ7K4bKfBwlzubqAgpVNkc56P_oAVOFKg','a9ecf070-f497-11ed-bd2e-539a1d889026','android','e5IsUZoiT0iGLLlWec3kdB:APA91bHyiZTebE0OAsdJY-J9VfDVzkooyjkY9xfovRKM7JArYmxL66EwxgaY57U9AU4drwP-8VPOAMACSdr7T7fsliP1fitceZvew0OPfwqD_28VlVF8ykRvHM6t-0rPJ49UvVNI7UGL','','2023-05-20 22:11:25','2023-05-20 22:11:25'),(12,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwiaWF0IjoxNjg0NjIwODQ2LCJleHAiOjE3MDAxNzI4NDZ9.kQ-lJQ1UzVzASeMkSlh-HTJpGEch7Kf6pCJdO_tfenE','a9ecf070-f497-11ed-bd2e-539a1d889026','android','e5IsUZoiT0iGLLlWec3kdB:APA91bGKV8AKDmmyRhhIzTJGqUDT8arogMGhtvCHdu8mJVw6Jf5DzRanpt0U373Cu3Wtw3gsa3qnW-tacnPkIW6_VLD93nJxvZB7AOoSaLTZ5Xu2ok5mrMoGt8CXZRftScuWtwx8-QLG','','2023-05-20 22:14:06','2023-05-20 22:14:06'),(13,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwiaWF0IjoxNjg0NjIwOTA0LCJleHAiOjE3MDAxNzI5MDR9.v38LTvk18aqVi3AKG5oJN09DyC89CxDkJ44wE6Gk0lM','a9ecf070-f497-11ed-bd2e-539a1d889026','android','e5IsUZoiT0iGLLlWec3kdB:APA91bHwGo6hLGX4k5iB5JjXeQFjU6_s8fk5keVtVVC2pcqDoUAXU1L-nLyM-V2X-AWND-3yHtTemy_oOQuGigYqo_cikJsN9O4RzNt9ZkwBiKTm2aSqR5RkvPfxKFC90rAR6vx_a4xo','','2023-05-20 22:15:04','2023-05-20 22:15:04'),(14,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjg0NjQ3Njk5LCJleHAiOjE3MDAxOTk2OTl9.-B0pYpv218cZOROZa-Wg-edLdZCNGWExXlZ2pRxxSpE','2d47f470-dc78-11ed-8493-97c361d41aef','android','fdgTIKZORwmUM5g5lI9rHx:APA91bExFqMaJS43M421Rffg_lB-N-hjGqRzY4TNyD1-sbXJymFnh6lhsqWG_XIXGQDqYaVHRpHSoSe-Li3zqlpkE9i5xZ8gTOkaNiV6RvAjYY8eezuVD5Nrk0I7JBDOGPQVvyZtNMxN','','2023-05-21 05:41:39','2023-05-21 05:41:39'),(15,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjIxNmE0ZTgwLWY3OWItMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDVAZ21haWwuY29tIiwiaWF0IjoxNjg0NjQ4MTE3LCJleHAiOjE3MDAyMDAxMTd9.ryT2FscyPiSKHXMQ7ozOz0y_OSiiLhzdYv6GlcklerI','216a4e80-f79b-11ed-bd2e-539a1d889026','android','e5IsUZoiT0iGLLlWec3kdB:APA91bEIhIWPIau1E-Zaxp3LklncpjXtpkcoPS3aoFe71_gZeriVeMp49lkFU3oh6o9Y02UsKyKAvKISGLfOBhvcnlc4ANbOYEhQHUrGI9FarF1DporjeApHm7oH_fsLchb8hL9W6z5P','','2023-05-21 05:48:37','2023-05-21 05:48:37'),(16,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwiaWF0IjoxNjg0NjU0MzcwLCJleHAiOjE3MDAyMDYzNzB9.F31lt8lbPhVeikZ-aeFC0SkC6i1gA6XEOOkOPTAWGHc','a9ecf070-f497-11ed-bd2e-539a1d889026','android','e5IsUZoiT0iGLLlWec3kdB:APA91bEIhIWPIau1E-Zaxp3LklncpjXtpkcoPS3aoFe71_gZeriVeMp49lkFU3oh6o9Y02UsKyKAvKISGLfOBhvcnlc4ANbOYEhQHUrGI9FarF1DporjeApHm7oH_fsLchb8hL9W6z5P','','2023-05-21 07:27:59','2023-05-21 07:32:50'),(17,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwiaWF0IjoxNjg0NjU0NjY5LCJleHAiOjE3MDAyMDY2Njl9.CRhKOjhlGRSfGb27omIJxFRnldnSe8auqXguk8LP6zM','a9ecf070-f497-11ed-bd2e-539a1d889026','android','dTth0OnKQwCwi_6Ib0D7FR:APA91bGIDc3wCmF4OqwHnDMDgQE8quhb48aogfTbkp0QoaH0ns5pjZHSQ1FhbE8-jl-Wiv53dRAtjsLae662ptpEjOoc_HDUdWTidMd7cmO3kXOGa1rPUtJIeTpK61gpsksBXLL8VPar','','2023-05-21 07:37:15','2023-05-21 07:37:49'),(18,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwiaWF0IjoxNjg0NjU0Njk5LCJleHAiOjE3MDAyMDY2OTl9.GMTdAzx6ygaEeWepnYGuXmmgvpxdO9wUFY3dSZ8_MQE','a9ecf070-f497-11ed-bd2e-539a1d889026','android','dTth0OnKQwCwi_6Ib0D7FR:APA91bHoiXc66fy3TL3HzyZCdbUd0cCEFKss1t_wfIfK2tcGoaBzktynRtD__bx-JX0cruA0QjCHof0ha3LXX2DCN4_dMxl1p32x1m6WONugA1ejz43ysY_Hv9zeHttBvnN7xeABVUo1','','2023-05-21 07:38:19','2023-05-21 07:38:19'),(19,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImIxNWViYjcwLWY3YWEtMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVldDRAZ21haWwuY29tIiwiaWF0IjoxNjg0NjU0ODAxLCJleHAiOjE3MDAyMDY4MDF9.NtiDGmaKsZMg_arZi5abedJ1BMHDbyQG-HmGwm1Utic','b15ebb70-f7aa-11ed-bd2e-539a1d889026','android','dTth0OnKQwCwi_6Ib0D7FR:APA91bHoiXc66fy3TL3HzyZCdbUd0cCEFKss1t_wfIfK2tcGoaBzktynRtD__bx-JX0cruA0QjCHof0ha3LXX2DCN4_dMxl1p32x1m6WONugA1ejz43ysY_Hv9zeHttBvnN7xeABVUo1','','2023-05-21 07:40:01','2023-05-21 07:40:01'),(20,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU4YzY2YTIwLWY3YWItMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVldDFAZ21haWwuY29tIiwiaWF0IjoxNjg0NjU1MDgxLCJleHAiOjE3MDAyMDcwODF9.OJP1G40p6T_xXfhZGSSRP9ddK_C8TdB2aID3SrJchEQ','58c66a20-f7ab-11ed-bd2e-539a1d889026','android','dTth0OnKQwCwi_6Ib0D7FR:APA91bEmnhTL4zYDsmroZ_j_ed7T3xk_bMvjTiL9c1bE_0xxpC7ZWfAu-DzZPHZt0mhdQIgDCcV2GFzlBfZvxFhDcw0fkTue4i2YNrs2cSaL2M1DrWujb-DoyrUP0StT-jiALmQzUzeQ','','2023-05-21 07:44:41','2023-05-21 07:44:41'),(21,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjU4YzY2YTIwLWY3YWItMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVldDFAZ21haWwuY29tIiwiaWF0IjoxNjg0NjU1MjA1LCJleHAiOjE3MDAyMDcyMDV9.MAtIwAfbltIuhhZUCdfe6WP1T8i4VmnSaTejf3rGbLI','58c66a20-f7ab-11ed-bd2e-539a1d889026','android','dTth0OnKQwCwi_6Ib0D7FR:APA91bERzEH4usXiKexV3YV9ercaDb_wfLrvCv9O0kI6cS2OJhxcc1KJCjLMAh_2WNNAg6LSMfjpxt-61v6QzZSaQNa8KBWSHx2yA3OhWD6dohufRfwIallcTqno6QlQSZYfFTZFa-Jr','','2023-05-21 07:46:45','2023-05-21 07:46:45'),(22,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImM0YmIyMjIwLWY3YWItMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVldDVAZ21haWwuY29tIiwiaWF0IjoxNjg0NjU1MjYzLCJleHAiOjE3MDAyMDcyNjN9.7yzd8xQSt0bgsYU4RdrnnwTmKhxUMBz2OKwsut3RAMk','c4bb2220-f7ab-11ed-bd2e-539a1d889026','android','dTth0OnKQwCwi_6Ib0D7FR:APA91bGsqc-zxPyyTFt1LqGF7fzabAXd2S9Pn0XeZibWG6qP15atiFeoCJoNtEI8utDYywC53JpttWwFUiJs6DbXJidLteASdjUFjtQwMbXlYjOPYXJG4nBqHy7c0PXlUTq2ggN-C4eS','','2023-05-21 07:47:43','2023-05-21 07:47:43'),(23,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwiaWF0IjoxNjg0NjU3MTQ3LCJleHAiOjE3MDAyMDkxNDd9.s6cFHF5IjX8aukzDWvhnkNfv_BaQvlfi5N04J6B6B34','a9ecf070-f497-11ed-bd2e-539a1d889026','android','fUkbwh1UTymCi04IUSb1L-:APA91bGp-1hG7BhoUK0iNB_4hai8V7-Rb8Kllej132HMGr6xyIvGlsQ6n2GJ62zBprEncr2XHRkzak7JDhd2MagelC9Mv28NR-ybtAJMfR4RleV7LTswbFMTlI53rEh6vQRzOC0di7rz','','2023-05-21 08:19:07','2023-05-21 08:19:07'),(24,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwiaWF0IjoxNjg0NjU5MzY4LCJleHAiOjE3MDAyMTEzNjh9.RVXtbyaGr0gsp4JGKZy8S_5Eo_LDJFmaPj59YzT4ofg','a9ecf070-f497-11ed-bd2e-539a1d889026','android','eK8qrUA-R8eUx_XB6dABdx:APA91bEyY2_Ac2MU_5NI82lw7vOtn82-hGiGweHIGzjYC5UKhYSPvMQVuCDm6MJSh8Ie61Ve_T07LUhlyYxegWtLVT4hd5ETC-ToLcg4Wzk_9TxCXAk9Yv4qn_Wo_FUuOSNOTUlf9lHs','','2023-05-21 08:56:08','2023-05-21 08:56:08'),(25,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwiaWF0IjoxNjg0NzA0MjU2LCJleHAiOjE3MDAyNTYyNTZ9.F-ZK1cYkdVmMcYh1Ba1tASxNRT3h2UAZq5pbbyswujM','a9ecf070-f497-11ed-bd2e-539a1d889026','android','fK_EmqTzQja2xPY7A0eEed:APA91bGsZgDW0IsA9Hk1-zMQK0MxRnl3QlXgPXfmDt3QP60zAShISpy04q2wsPcYul3AWXVyhDFyhKacB31KA9weKsOhywaWqG3Vz7N0LMt_tcPSfyMtAkbzESy0sX1gIJ_XW-uMr8bH','','2023-05-21 21:24:16','2023-05-21 21:24:16'),(26,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwiaWF0IjoxNjg0NzA2MjI5LCJleHAiOjE3MDAyNTgyMjl9.bG_MXmzZytKIl3zP7CPxWm102Y0gWdTbWV2If7XC0Xw','a9ecf070-f497-11ed-bd2e-539a1d889026','android','flq4tQjeT4C1ZfPgn8rJvo:APA91bErk3EuPwX2OYG1NPFaoBxjDLGgrQ3XN8AFS0IM8Bqq7iOHEwZT5vOcVSxY4cHx5A1qafZeKEmbH0rz0JBB4e2S98EnrY68QJlzIg8oVHMZIzybrmrafJiwWDKNYaViobQ3RVM-','','2023-05-21 21:57:09','2023-05-21 21:57:09'),(27,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwiaWF0IjoxNjg0ODIzMDA1LCJleHAiOjE3MDAzNzUwMDV9.0bRK-eDf2ofPQO9msRYGO51ypd5Foh1YS4zoewExx_E','a9ecf070-f497-11ed-bd2e-539a1d889026','android','cIvB3D5_QJu92ArsKHpd3D:APA91bEm7dvoB8mUjgDDOMb3nZpzIwzRPbeK7aKuK5w1GPyog3QcUt0eEyqr40ZoSD0FEK8ETXUOthHKrES_vgDYqXr2lJ2wyZfbLrhLfNo4I8tLQLoQWlztzMf7v3UZ-r4hazy0aTeS','','2023-05-23 06:23:25','2023-05-23 06:23:25'),(28,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwiaWF0IjoxNjg0ODI0NzQyLCJleHAiOjE3MDAzNzY3NDJ9.FgzO4yK0Uw1J6BQzaFzBcZO6yFGN93xnzsD_OCTWdtY','a9ecf070-f497-11ed-bd2e-539a1d889026','android','c6P9sXz3Q-SkCpIgkde8eN:APA91bGncEHln1T0TwRpcila8Z05ADqCjiBTe-uic1s8V7wcmZI1E7irOi7JSeu2x50ExsnbFzNAed3P9hHyb-Ouds5CEWbloEh-uhepT-oMZJejaQ_zYEI4dES_tL2N_OQifSm_XeAK','','2023-05-23 06:52:22','2023-05-23 06:52:22'),(29,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjg0ODc0ODAzLCJleHAiOjE3MDA0MjY4MDN9.sYC3ANMJKsXmYUkvHyTiuCOC2ns_u4iQ74JsFTuNIuI','2d47f470-dc78-11ed-8493-97c361d41aef','android','c6P9sXz3Q-SkCpIgkde8eN:APA91bH2d68kpJueIi_VhFfbO9PEnCw7Ez06rKS-HUMIwSM9iMcAmTSjx9Na-ijUOQZUdPcajc3n22lVXZ5ma7P-7TIAxiU-ADcp9mrwR90_nuVCnGKWFLMXmamBGC6GwgzEKiQsR5cq','','2023-05-23 20:46:43','2023-05-23 20:46:43'),(30,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwiaWF0IjoxNjg0OTA5ODM3LCJleHAiOjE3MDA0NjE4Mzd9.ewQSsgLR0qaa9WYjGtWcJCWYtu_ezcwcWofZkRrNknk','a9ecf070-f497-11ed-bd2e-539a1d889026','android','e54eorU1RoCWNnZboR8oZ1:APA91bE_Zzmv0SG8fo4mfkf4jqNUXq3FcEtCnOZEn1iT7Im5iHkYVCUjnjXLlAinFI0NLBk9snay071VJr9kPjfdoccFi_gszIUh0H8zul4sinvwopkqcnseJd5gHKHWqoFk7FF89Xmz','','2023-05-24 06:30:37','2023-05-24 06:30:37'),(31,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjg0OTExNjcyLCJleHAiOjE3MDA0NjM2NzJ9.URGFqb9kZd3vSyXMKSGWbxKvXWosRAIpupWC2l0aX-c','2d47f470-dc78-11ed-8493-97c361d41aef','android','fVn8PHVETyuDPd-tn7yZtp:APA91bH_8K89YYGvlzeet-RYQ2N-99R8tHJo-toyC1ZT459Qy058u442p0Qk6MazvBEcsP5C8WzZaEsuqnyqHaF5qIXsjPNIogYWUyMzxu8Ffsx2ke1GrrWkwErCx1BoA83yY7IWxokW','','2023-05-24 07:01:12','2023-05-24 07:01:12'),(32,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDJAZ21haWwuY29tIiwiaWF0IjoxNjg0OTExODA0LCJleHAiOjE3MDA0NjM4MDR9.bmOV-m9Qk1zHtmn2awiWt_pldMMkxdtTzenkltKy0Z4','a9ecf070-f497-11ed-bd2e-539a1d889026','android','erRRZQLAQzuuCxIbBuF5Jd:APA91bFh5_jYWwUvWDxXXobDrNznlGBDpuB-JhP5lJQ8ZB_zDaJKfx9TaOyz5SBPkc_V69LIBAflcOO6nPhoaY3eat40NORUyKsZO9zyGQwiJ_49GdKmOfWn1PqmfE6huq4QaisWv5xf','','2023-05-24 07:03:24','2023-05-24 07:03:24'),(33,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDNAZ21haWwuY29tIiwiaWF0IjoxNjg0OTE1NjAyLCJleHAiOjE3MDA0Njc2MDJ9.acWa5Zg4wo4ThEyHf_WRJXvMROzaRIAroNUXM69Z7Fc','a9ecf070-f497-11ed-bd2e-539a1d889026','android','erRRZQLAQzuuCxIbBuF5Jd:APA91bGRPl4GbqvkWfkGISP_kpKSkGt859FzkBvTuBiD7ydFQKYyO0LFMefQ96x2VU7aEQQWxq1aA8F01gJLVIWUfti2m6a09DnNbQea_Eu5RP_PZoCspBjCdZEX0S4z-5zAcVLgcUsK','','2023-05-24 07:46:49','2023-05-24 08:06:42'),(34,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImE5ZWNmMDcwLWY0OTctMTFlZC1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoidGVzdDNAZ21haWwuY29tIiwiaWF0IjoxNjg0OTE2MTY4LCJleHAiOjE3MDA0NjgxNjh9.rnLTzp-WMjTASV_RXJPg2_fWg2tED1kW_EvLCd6F-VI','a9ecf070-f497-11ed-bd2e-539a1d889026','android','erRRZQLAQzuuCxIbBuF5Jd:APA91bF3Hvp6G2zopHm4sxYsUUVdbLKpQT64G4WjLdHgYlhUbMG61CHP9GK6FnjrkMVNF83Owq_RuLT4hJPTTKNoOJyU5H_ZcXmpSXiKTHLReVk_lXLUFDqEGdSojoAMMYtfnlyOVV80','','2023-05-24 08:16:08','2023-05-24 08:16:08'),(35,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjg2MDM0MDI5LCJleHAiOjE3MDE1ODYwMjl9.UzOVzV6lUBJXTKAo7dOASvvh5uVNPKMaUMejYEvcmAQ','2d47f470-dc78-11ed-8493-97c361d41aef','android','fsPsvBKCTi2DWwbxeY3W7k:APA91bFTL2WdovmgSvkF4lcZbGcrhXtv1ECIVro8VNzDDZlaQtDgWmk0QcialBPOkQkbZzDMQnPrVYyailtTIp2WamsmYIOSa_wUmzRCxcyNzSF1qI5vp-f9JBNc1leVYX-Nd_Uci7D6','','2023-06-06 06:47:09','2023-06-06 06:47:09'),(36,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjg2MDM4MjAyLCJleHAiOjE3MDE1OTAyMDJ9.nfDrtWJNhAvDS63F87R0JRH6UhtCxg84HSJQjAUvsZM','2d47f470-dc78-11ed-8493-97c361d41aef','android','foZPhL6vR8ytFur-56Q7VI:APA91bFblGlWvJLs21H-SV4HWmXUCy5JPXRO2JtTBFNdfJvummlT2oa_c3hSht-IdXQXzqRs-dyC4eXb0XFWEL60JGO0sWGz3hAVRvE5VmI86Op1uvwrwFIeODlEZYq9RpkwdDZVwFHK','','2023-06-06 07:56:42','2023-06-06 07:56:42'),(37,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjg2NjU4NjgwLCJleHAiOjE3MDIyMTA2ODB9.BSqXlFsyNgly2n1u0ArPhSrpuVGQXc7YmbHqjaSmGrU','2d47f470-dc78-11ed-8493-97c361d41aef','android','fYza1nlITcuFJSseFNzt5s:APA91bGR8W5MLHNZA5kuuY--JxxpBI-uTymMuPEh-YxyYjWnf44yfHH-WHQWo3aUQiHsPsagJUjnfFNYoliYhWRnj9tVSQ7OUS6cR8v_UKDkQv2UtnD0SGVS9GiQ5FUWt1pcrDIzuBwj','','2023-06-13 12:18:00','2023-06-13 12:18:00'),(38,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjg2NzI4NDg0LCJleHAiOjE3MDIyODA0ODR9.ieXyeiu_wLuvLSNc_zugTRlgL1Kv8wcFzoKYSSfYkhc','2d47f470-dc78-11ed-8493-97c361d41aef','android','clbuBmXfTR6683FFGmruJT:APA91bEVCZG1QCF4hcgQPolRSbXPDwf51OqizXYbb4YigCiowcUSY2qpCaJQ6X2WI1Z562IODl78dVNdh0riHWLqqH_PNZoWKvGPwzzBqVPuFVr1ratffOXxWajCAoVV0QmWKBk-y5Cr','','2023-06-14 07:41:24','2023-06-14 07:41:24'),(39,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJjZDA3YzAwLTEwZTUtMTFlZS1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoiYWFhQGdtYWlsLmNvbSIsImlhdCI6MTY4NzQyODY5OCwiZXhwIjoxNzAyOTgwNjk4fQ.VzhAlI8cN3yJnTjbvmiNWoo0txDVdTRp6VQzCIfSX68','2cd07c00-10e5-11ee-bd2e-539a1d889026','android','dP4eBCXQTRa6BVE9q-zigG:APA91bGvoYj0DBIV95EryEN7U89GUq1Hpn50sDQdKCAolkqgNUpGKpWC2ST90ecDDQ8g0wTHVFaP5YQEzF0E-euljsTfxhtYidURlvKzl50rOsZ8FyYYIlU0Ot0Iga3ANYe_A6S_6IVE','','2023-06-22 10:11:38','2023-06-22 10:11:38'),(40,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjg4NDYwNTU2LCJleHAiOjE3MDQwMTI1NTZ9.A64Lw_oM8-Sm4B_nA6KwgZxp9o1ow6ihnecfL30fd4U','2d47f470-dc78-11ed-8493-97c361d41aef','android','e9NQRQI1Q1-gHn6zkXKI9H:APA91bHJ4Ls8vdErKggh8aAFLB33dWw5mol24eXob2Tn078KhK0EKt5zxqhxpl1H9GCThy-iCaxiKGEQIz7yG19ZFa9JQf1f3h5tHC730nG8aCEV6axpUG1iuELMwZRJ-ZmZq2XZfwJ0','','2023-07-04 08:49:16','2023-07-04 08:49:16'),(41,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjg4NzUwNDEyLCJleHAiOjE3MDQzMDI0MTJ9.Mkb_oFWKDgjKueWGLLKSaXpqJlheZ2FA35hQm1waIMo','2d47f470-dc78-11ed-8493-97c361d41aef','android','cNEJxKL7L1BVLE5eexMaJu:APA91bEzd4Q65710A-jzHvHq3kiqiHLwxQZNbW39SMfil79Q8bwJpWaoc4ZpOQrSDjv6TAqTEum1vd8a0Kc7LkH-iobsBePT8uwXxjgr9FwsqXVC0J1tdto4zDuOLWtFRIpmJpaBorpT','','2023-07-07 17:20:12','2023-07-07 17:20:12'),(42,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjg4ODE5OTUwLCJleHAiOjE3MDQzNzE5NTB9.SRC4MEvMTgtYwsaYHGhQ4FHQGOQMNpJqv7GKAMs_pEI','2d47f470-dc78-11ed-8493-97c361d41aef','android','dx3sn8UDQmSkvHPRlxv6Sb:APA91bGm05lQq7JS8NTQpls3V6vbdFriNnSBRjyOl5bihhd7SE0QemksTlqStwaOrPq7o2hxOXqLMqg2uMkRdaOCoFK7s6JlFC4al6NQVGoKzgQWwaksa1WrXw-d_xtBnUr0BjCWDqEY','','2023-07-08 12:39:10','2023-07-08 12:39:10'),(43,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjg4ODg0MjEwLCJleHAiOjE3MDQ0MzYyMTB9.c0pKzgEAV9k-VloXD-HHVLRnPJhRzO0QYWOhEMlP0-Q','2d47f470-dc78-11ed-8493-97c361d41aef','android','dawzbhKlQsekaTY3aub_2q:APA91bHe9By0Wy-qxeZeg4mTT-MW976I_16MRBaBDgKHfxp59U8mX960PyWyChUfRDx9IoZOwVnCTpl_uQ2azJOq2mDeKhb4IJvBttdbE-XC0O-HCJoJJm99S6TwnbYXzp1mHE2k5CQC','','2023-07-09 06:30:10','2023-07-09 06:30:10'),(45,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjFhMGRkNjEwLTIwYzMtMTFlZS1iZDJlLTUzOWExZDg4OTAyNiIsImVtYWlsIjoiaGhoQGdtYWlsLmNvbSIsImlhdCI6MTY4OTE3MzI4MiwiZXhwIjoxNzA0NzI1MjgyfQ.z5TiGvM5_dQkOHD1B3Yp2easomLcusugW6_Zmy3fO48','1a0dd610-20c3-11ee-bd2e-539a1d889026','android','e7UDUfRhShqYnnu3c7FBGH:APA91bF8f9D3fIZ6jgDopvVOcQctlWAE8CmpAtlgc7_0Fja8dgo7JEdPN5ewXp5qtReOzfWA2GqcsOLMxJWF9g6q_giYyxeaQ0yRxU15eGQXnKibznwrDEPcjVGQeYB1UpFslRec_mk3','','2023-07-12 14:48:02','2023-07-12 14:48:02'),(46,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjg5NDM5MzUwLCJleHAiOjE3MDQ5OTEzNTB9.QuOi6MrAsJuWTzomavu3oSTVbdYHbT49IgTekGgBmBM','2d47f470-dc78-11ed-8493-97c361d41aef','android','f2tVh_pmRIuf0uqcrpG55u:APA91bGarNxJ5qjl9MBMPkqFGO84qYviTUqR6-yEpVKxQxlWp9z671uuaTfOWjN1OgebKb7LS4M-3wvms50waXbVyXZ5E1q47uroaia1msbeL5brXDmtopshPYY3H131WD1FNlhvw7Tj','','2023-07-15 16:42:30','2023-07-15 16:42:30'),(47,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjg5NDQwMDE5LCJleHAiOjE3MDQ5OTIwMTl9.OisTl2PGnI0D7zv6maS7V4EseRTJ1p5qIwjqRAcJ2Js','2d47f470-dc78-11ed-8493-97c361d41aef','android','djJlvJ-WQkmLl6CiAWWEVq:APA91bGoRSzCYYCaQoWtCL7B2w5IF9NLrFnspG8ZZ3g7WFQy1U8zgq4QWXvBOWXXxPJ8aUw4_9g0WYAQOtga1X08TQeF2KqR0joY_-3kvnS7q2knSmcITHbDcavIf9Z_XOhnMSlkR1kq','','2023-07-15 16:53:39','2023-07-15 16:53:39'),(49,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImQxZDZkNWEwLTUwNjQtMTFlOS1hMTRlLTYzNWUwZmQzYmZhNiIsImVtYWlsIjoiZGVtb0ByYWRpY2Fsc3RhcnQuY29tIiwiaWF0IjoxNjkwMDk4MjExLCJleHAiOjE3MDU2NTAyMTF9.vyPhuUBzHAZ9AXAgwy1muWxZDTLJzUsu-jMOiFLtUFM','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','android','fsD1LmNzTMqFUD9KxHUf8-:APA91bFBfHmXVjYj_ovCMpTEObBlTXyG-a9BNWtY6-4oJiXPZ1y-2TKixlP_n8W5XCe3u6uhLhh_2FegNCthVqnGthvHf5MniTTYFYo24WaLWz2wrRTaXzw3WXFGEaTOE9Lns66ArwMl','','2023-07-23 07:43:31','2023-07-23 07:43:31'),(50,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjkwMjk5OTc5LCJleHAiOjE3MDU4NTE5Nzl9.OTesTBPFzvnGC3IYdNliK7fzP2pYKdiLGqoWPCgOXUU','2d47f470-dc78-11ed-8493-97c361d41aef','android','cMEvvRFrRBmzz-U4BDoYIB:APA91bEsh-OMvSpgMPzYoJ3VX52oaps7QmpNbNnp7kOX70j0l3AUPVl8Tsy0huH7D5MyNi2DSyxisr4Q18m4xRFjSgrM3VINGDVq5WkucqtzZKgHhVSz72aj9QVfxq50rO5KKlctkDCJ','','2023-07-25 15:46:19','2023-07-25 15:46:19'),(51,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQ5M2Y3YzkwLTJiOGItMTFlZS1hNmU2LWM5N2YzMzA3MjU3YiIsImVtYWlsIjoiYmFzZWwubmFuYWE3MUBnbWFpbC5jb20iLCJpYXQiOjE2OTAzNTg5MzUsImV4cCI6MTcwNTkxMDkzNX0.PGR2T8wYRv7zkujjEBytRDY0f-II0kng4LrsY4hU58I','493f7c90-2b8b-11ee-a6e6-c97f3307257b','android','fdGKqmjNTEuTeXj20wcvXE:APA91bEHm3CI03y8bsHQN6OM32TzliJ2qyxfR3GsnUnsYzYhTlqjeyve8W8jEJsTGoeXqEYiEHlaRVpT5ukTI7E8wsbrEEaUMiFYeMNEPi8OfZYpE6c8nEC0RXmQmNKLf8fRVsRsEEnW','','2023-07-26 08:08:55','2023-07-26 08:08:55'),(52,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjkwNDYzMDI4LCJleHAiOjE3MDYwMTUwMjh9.yh7D5-2msuz0DcxSP7emeZwU3ByfbDH1sh_mwM8N5gI','2d47f470-dc78-11ed-8493-97c361d41aef','android','eOJIel4xQsCYMoU9f92MCC:APA91bFhkTlVNQ69G9luXE_n5yYroyDMdRSIpPPEKLjr__s3YyiDZRMbBAXr0zlp6txMqnPbfu1C-8nqBrLTQuhyZNddr-c_o1RbW6fCdsPlQuRFvsuekUTBxqV8QngsiNaXoYHWmC-c','','2023-07-27 13:03:48','2023-07-27 13:03:48'),(53,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImQxZDZkNWEwLTUwNjQtMTFlOS1hMTRlLTYzNWUwZmQzYmZhNiIsImVtYWlsIjoiZGVtb0ByYWRpY2Fsc3RhcnQuY29tIiwiaWF0IjoxNjkwNDYzMTMyLCJleHAiOjE3MDYwMTUxMzJ9.s4ejsbCewQJ1JayOJR9TDFDjHp8a-_jxFVCRUkQzmmU','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','android','eW4EIokZQGW65ncPJJpIIm:APA91bHtGqer6pblq0C1BVfwU4DtjiggNcoUp9oSDNGR_eHWt2D48YxJvB4piYW6qlfB_-2d3njdJ-RoNcqBwCAtbPhoPU06uSH8PoRbK9F2FrJfaECg2EawSgvnwPP5yV16-Ttf4Zo2','','2023-07-27 13:05:32','2023-07-27 13:05:32'),(54,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImQxZDZkNWEwLTUwNjQtMTFlOS1hMTRlLTYzNWUwZmQzYmZhNiIsImVtYWlsIjoiZGVtb0ByYWRpY2Fsc3RhcnQuY29tIiwiaWF0IjoxNjkwNjI5NjU1LCJleHAiOjE3MDYxODE2NTV9.JHJR67OW_xa0atzNPoPoXIKjogiDa7CkOMzByikUttc','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6','android','clw-fGKpRoWGg2Uv1bfAcz:APA91bHJprhE9lJhgRP4DWKENQrmkgEU4c3UZReMK8U9NKgVveiHrz2D_WxLBC07t11KE-DOCfiXnm46Sgbu6a65J9KPAdGr5Vsu64fSsrL5yxTj5yOTd8z2i4tKhfeWKqku8HMw0IkC','','2023-07-29 11:20:55','2023-07-29 11:20:55'),(55,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjkwNjk3Mzc3LCJleHAiOjE3MDYyNDkzNzd9.22kmntYFDcMsGuWOBtLeRzvhhkICFE8dC4RgRxNt9DM','2d47f470-dc78-11ed-8493-97c361d41aef','android','eLqmuGQcR_KXImycsgLM0j:APA91bEZ5jzQWb2e-pXelwNZV8-Qt7iNtXAQNkY9JjPuU5zqZvixnQVVU8NFJ1Rz2gEnTBtUFm__nZ7xK2j3frdCNBfbIYIVG6qTk67fMZhzEsmnnFg_tS-IC1jLSNtWYnaNxTdKgegm','','2023-07-30 06:09:37','2023-07-30 06:09:37'),(56,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Ijk3N2JjNTUwLTUwNjktMTFlOS1hMTRlLTYzNWUwZmQzYmZhNiIsImVtYWlsIjoicWFAcmFkaWNhbHN0YXJ0LmNvbSIsImlhdCI6MTY5MDY5Nzg3NiwiZXhwIjoxNzA2MjQ5ODc2fQ.6bpRM1bs8gpROp_0XSmZAgzRpnsUivvTH7JtlZqXJNw','977bc550-5069-11e9-a14e-635e0fd3bfa6','android','elI14cC1S8m73AbCM6kbvB:APA91bGPYn_bAwLbBsgE8vo0ASHitD7WGwzbea3n8fC_GL3qh1XzsIWGWjp7bapgWc6dAOeIKNnaOaAFfPrtvBIRvz2FHmoxYNtMcwm-NKrVGL5PK00sEvyLTSq5jW-mRQKRdwPzfEhw','','2023-07-30 06:17:56','2023-07-30 06:17:56'),(57,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjJkNDdmNDcwLWRjNzgtMTFlZC04NDkzLTk3YzM2MWQ0MWFlZiIsImVtYWlsIjoiZGVtbzJAZ21haWwuY29tIiwiaWF0IjoxNjkwNzA2MTA0LCJleHAiOjE3MDYyNTgxMDR9.xtvogeIh6rAIezubRqxW0AiurmYfbXgNWtLg-nUJdP4','2d47f470-dc78-11ed-8493-97c361d41aef','android','fuFXzH3_T3ySKCgPUQWNjy:APA91bEyg8HVqLEQg5m4pMM9lA39HG9uF8yDyMrVXEKoby-dFazJZUX176H2VujoM8EcOxt-zdBDEM8__61pTc7DDd0tRgTsWDC-3OWsgSlknTEUClgSZ29Y6Htc8_k1tZLaVWAjsazz','','2023-07-30 08:35:04','2023-07-30 08:35:04'),(58,NULL,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6Ijk3N2JjNTUwLTUwNjktMTFlOS1hMTRlLTYzNWUwZmQzYmZhNiIsImVtYWlsIjoicWFAcmFkaWNhbHN0YXJ0LmNvbSIsImlhdCI6MTY5MDg4OTQxMSwiZXhwIjoxNzA2NDQxNDExfQ.qmvtW8gtylGv_zJ2JOzcR6V0UloA3-FUmIMTXa0ZUDo','977bc550-5069-11e9-a14e-635e0fd3bfa6','android','e1BWEiRGQ8aFN1E8OBx3TO:APA91bG81aTc5-OsfmD0ka9j2GqFmf0PYl-ok11iUSQz_CqcNV5G3Oh6J8-071ajSLkUs6E1UCt3IAmBUdaHR2Prda1rT7EUSCrU3GmbP9PiKA56EX4q5sAMlRNJNkPhvJE9biXNRh0P','','2023-08-01 11:30:11','2023-08-01 11:30:11');
/*!40000 ALTER TABLE `UserLogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserProfile`
--

DROP TABLE IF EXISTS `UserProfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserProfile` (
  `userId` char(36) NOT NULL DEFAULT '',
  `profileId` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `displayName` varchar(100) DEFAULT NULL,
  `dateOfBirth` varchar(100) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `phoneNumber` varchar(50) DEFAULT NULL,
  `preferredLanguage` varchar(50) DEFAULT NULL,
  `preferredCurrency` varchar(50) DEFAULT NULL,
  `info` mediumtext DEFAULT NULL,
  `location` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `stripeCusId` varchar(255) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `verificationCode` int(11) DEFAULT NULL,
  `countryCode` varchar(10) DEFAULT NULL,
  `countryName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `profileId` (`profileId`),
  UNIQUE KEY `UserProfile_profileId_unique` (`profileId`),
  CONSTRAINT `UserProfile_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserProfile`
--

LOCK TABLES `UserProfile` WRITE;
/*!40000 ALTER TABLE `UserProfile` DISABLE KEYS */;
INSERT INTO `UserProfile` VALUES ('1a0dd610-20c3-11ee-bd2e-539a1d889026',16,'ahmad','ali','Ahmad Ali','7-1995-12',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-12 14:48:02','2023-07-12 14:48:02',NULL,NULL,NULL,NULL,NULL),('216a4e80-f79b-11ed-bd2e-539a1d889026',8,'ali','ali','Ali Ali','2000/05/21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-05-21 05:48:37','2023-05-21 05:48:37',NULL,NULL,NULL,NULL,NULL),('2cd07c00-10e5-11ee-bd2e-539a1d889026',14,'ahmada','ali','Ahmada Ali','6-1994-22',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-06-22 10:11:38','2023-06-22 10:11:38',NULL,NULL,NULL,NULL,NULL),('2d47f470-dc78-11ed-8493-97c361d41aef',5,'Demo','User','Demo User','10-1994-5',NULL,'Male','9842280025','en','USD','I am a person who is positive about every aspect of life. There are many things I like to do, to see, and to experience. I like to read, I like to write; I like to think, I like to dream; I like to talk, I like to listen. I like to see the sunrise in the morning, I like to see the moonlight at night; I like to feel the music flowing on my face, I like to smell the wind coming from the ocean. I like to look at the clouds in the sky with a blank mind, I like to do thought experiment when I cannot sleep in the middle of the night. I like flowers in spring, rain in summer, leaves in autumn, and snow in winter. I like to sleep early, I like to get up late; I like to be alone, I like to be surrounded by people. I like country’s peace, I like metropolis’ noise; I like the beautiful west lake in Hangzhou, I like the flat cornfield in Campaign. I like delicious food and comfortable shoes; I like good books and romantic movies. I like the land and the nature, I like people. And, I like to laugh.','Architect based in Los Angeles,  CA.','2023-04-16 17:00:23','2023-08-02 06:06:38','cus_ONIoUNxGkak1U0',NULL,4868,'+91',NULL),('3fcd41e0-376e-11ed-9bcb-1fd549eed589',4,'Ahmed','Taha','Ahmed Taha','8-1991-6','d61ba8288aa9dc05f73b34d9d8fc4871.jpeg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-09-18 16:23:37','2022-09-18 16:29:40','cus_METxH2nSWLTcPl',NULL,NULL,NULL,NULL),('48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',3,'Abdelrhman','Alwtany','Abdelrhman Alwtany','5-1978-10','f929f1d1780ec0fe7872b49551e83532.jpeg',NULL,NULL,NULL,NULL,NULL,NULL,'2022-08-12 16:10:29','2022-08-12 16:46:01','cus_METxH2nSWLTcPl',NULL,NULL,NULL,NULL),('493f7c90-2b8b-11ee-a6e6-c97f3307257b',17,'Basel','Nanaa','Basel Nanaa','6-1995-1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-26 08:06:12','2023-07-26 08:06:12',NULL,NULL,NULL,NULL,NULL),('58c66a20-f7ab-11ed-bd2e-539a1d889026',10,'ahmad','ahmad','Ahmad Ahmad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-05-21 07:44:41','2023-05-21 07:44:41',NULL,NULL,NULL,NULL,NULL),('686d5a50-f3c4-11ed-bd2e-539a1d889026',6,'ahmad','ali','Ahmad Ali','5-2005-16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-05-16 08:34:00','2023-05-16 08:34:00',NULL,NULL,NULL,NULL,NULL),('977bc550-5069-11e9-a14e-635e0fd3bfa6',2,'Radical','QA','Radical QA','1-2000-1','d61ba8288aa9dc05f73b34d9d8fc4871.jpeg','Female',NULL,'en','EUR','I always wanted to be a great writer, like Victor Hugo who wrote \"Les Miserable\", or like Roman Roland who wrote \"John Christopher\". They have influenced millions of people through their books. I also wanted to be a great psychologist, like William James or Sigmund Freud, who could read people’s mind. Of course, I am nowhere close to these people, yet. I am just someone who does some teaching, some research, and some writing. But my dream is still alive.','Lives in The City, United Kingdom','2019-03-27 08:23:25','2023-08-01 11:31:29','cus_ON0puuesNlWWDV',NULL,NULL,NULL,NULL),('9c276d50-14c0-11ee-a424-bd24a6095848',15,'Rashed','Bahnasi','Rashed Bahnasi','1-2004-9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-06-27 07:59:58','2023-06-27 07:59:58',NULL,NULL,NULL,NULL,NULL),('9d1f15d0-005e-11ee-8c2a-c142d6c35686',12,'Ahmad','Ahmad','Ahmad Ahmad','10-10-2022',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-06-01 09:28:05','2023-06-01 09:28:05',NULL,NULL,NULL,NULL,NULL),('a9ecf070-f497-11ed-bd2e-539a1d889026',7,'Jasem','ahmad','Jasem ahmad','2021/05/24',NULL,'Male',NULL,NULL,NULL,'dffdg fdgdfgdfgdfgdgdfg fdg fd   dfgfdg  dgldf gldfk gfdk gldfg dlf g d;dg ldfg dfg fdlg fd g;df g;d fglfdgl ldfg ldf glfd glfd gldf gdyyyyyyyyyyy','ggggg','2023-05-17 09:46:14','2023-05-24 08:24:20',NULL,NULL,NULL,NULL,NULL),('b15ebb70-f7aa-11ed-bd2e-539a1d889026',9,'ahmad','ahmad','Ahmad Ahmad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-05-21 07:40:01','2023-05-21 07:40:01',NULL,NULL,NULL,NULL,NULL),('c4bb2220-f7ab-11ed-bd2e-539a1d889026',11,'ali','ali','Ali Ali','2004/05/21',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-05-21 07:47:43','2023-05-21 07:47:43',NULL,NULL,NULL,NULL,NULL),('d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',1,'Demo','User','Demo User','10-1994-5','13579aa2edf46b7a707be6b537259f45.jpeg','Male',NULL,'en','EUR','I am a person who is positive about every aspect of life. There are many things I like to do, to see, and to experience. I like to read, I like to write; I like to think, I like to dream; I like to talk, I like to listen. I like to see the sunrise in the morning, I like to see the moonlight at night; I like to feel the music flowing on my face, I like to smell the wind coming from the ocean. I like to look at the clouds in the sky with a blank mind, I like to do thought experiment when I cannot sleep in the middle of the night. I like flowers in spring, rain in summer, leaves in autumn, and snow in winter. I like to sleep early, I like to get up late; I like to be alone, I like to be surrounded by people. I like country’s peace, I like metropolis’ noise; I like the beautiful west lake in Hangzhou, I like the flat cornfield in Campaign. I like delicious food and comfortable shoes; I like good books and romantic movies. I like the land and the nature, I like people. And, I like to laugh.','Architect based in Los Angeles,  CA.','2019-03-27 07:49:16','2023-07-31 07:09:29','cus_OMZNTFmogUrtZg',NULL,NULL,'+91',NULL),('ecba1810-2c87-11ee-b289-61fce239156d',18,'Abdalrazak','HAJSAAED','Abdalrazak HAJSAAED','1991/01/01',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-07-27 14:14:39','2023-07-27 14:14:39',NULL,NULL,NULL,NULL,NULL),('fc1aba80-005e-11ee-8c2a-c142d6c35686',13,'Ahmad','Ahmad','Ahmad Ahmad','10-10-2022',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-06-01 09:30:45','2023-06-01 09:30:45',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `UserProfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserSafetyAmenities`
--

DROP TABLE IF EXISTS `UserSafetyAmenities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserSafetyAmenities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `safetyAmenitiesId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `listId` (`listId`),
  CONSTRAINT `UserSafetyAmenities_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserSafetyAmenities`
--

LOCK TABLES `UserSafetyAmenities` WRITE;
/*!40000 ALTER TABLE `UserSafetyAmenities` DISABLE KEYS */;
INSERT INTO `UserSafetyAmenities` VALUES (1,1,32,'2019-03-27 09:46:01','2019-03-27 09:46:01'),(2,1,29,'2019-03-27 09:46:01','2019-03-27 09:46:01'),(3,1,31,'2019-03-27 09:46:01','2019-03-27 09:46:01'),(19,6,30,'2019-07-04 10:52:39','2019-07-04 10:52:39'),(20,6,32,'2019-07-04 10:52:39','2019-07-04 10:52:39'),(21,5,30,'2019-07-04 10:57:10','2019-07-04 10:57:10'),(22,5,29,'2019-07-04 10:57:10','2019-07-04 10:57:10'),(23,5,31,'2019-07-04 10:57:10','2019-07-04 10:57:10'),(28,2,30,'2019-07-04 11:02:19','2019-07-04 11:02:19'),(29,2,32,'2019-07-04 11:02:19','2019-07-04 11:02:19'),(248,7,30,'2022-10-27 11:39:32','2022-10-27 11:39:32'),(249,7,32,'2022-10-27 11:39:32','2022-10-27 11:39:32'),(266,8,30,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(267,8,29,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(268,8,31,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(269,8,32,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(274,15,29,'2022-11-07 11:45:24','2022-11-07 11:45:24'),(275,15,30,'2022-11-07 11:45:24','2022-11-07 11:45:24'),(276,14,30,'2022-11-09 11:11:30','2022-11-09 11:11:30'),(277,14,29,'2022-11-09 11:11:30','2022-11-09 11:11:30'),(380,4,32,'2022-11-15 18:14:14','2022-11-15 18:14:14'),(381,4,29,'2022-11-15 18:14:14','2022-11-15 18:14:14'),(382,4,31,'2022-11-15 18:14:14','2022-11-15 18:14:14'),(383,4,30,'2022-11-15 18:14:14','2022-11-15 18:14:14');
/*!40000 ALTER TABLE `UserSafetyAmenities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserSpaces`
--

DROP TABLE IF EXISTS `UserSpaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserSpaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listId` int(11) NOT NULL,
  `spacesId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `listId` (`listId`),
  KEY `spacesId` (`spacesId`),
  CONSTRAINT `UserSpaces_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `UserSpaces_ibfk_2` FOREIGN KEY (`spacesId`) REFERENCES `ListSettings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserSpaces`
--

LOCK TABLES `UserSpaces` WRITE;
/*!40000 ALTER TABLE `UserSpaces` DISABLE KEYS */;
INSERT INTO `UserSpaces` VALUES (1,1,36,'2019-03-27 09:46:01','2019-03-27 09:46:01'),(2,1,34,'2019-03-27 09:46:01','2019-03-27 09:46:01'),(18,6,34,'2019-07-04 10:52:39','2019-07-04 10:52:39'),(19,6,36,'2019-07-04 10:52:39','2019-07-04 10:52:39'),(20,5,34,'2019-07-04 10:57:10','2019-07-04 10:57:10'),(21,5,33,'2019-07-04 10:57:10','2019-07-04 10:57:10'),(22,5,35,'2019-07-04 10:57:10','2019-07-04 10:57:10'),(26,2,34,'2019-07-04 11:02:19','2019-07-04 11:02:19'),(27,2,33,'2019-07-04 11:02:19','2019-07-04 11:02:19'),(144,7,34,'2022-10-27 11:39:32','2022-10-27 11:39:32'),(145,7,33,'2022-10-27 11:39:32','2022-10-27 11:39:32'),(146,7,36,'2022-10-27 11:39:32','2022-10-27 11:39:32'),(161,8,34,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(162,8,33,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(163,8,36,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(164,8,35,'2022-11-06 05:08:33','2022-11-06 05:08:33'),(169,15,36,'2022-11-07 11:45:24','2022-11-07 11:45:24'),(170,15,35,'2022-11-07 11:45:24','2022-11-07 11:45:24'),(171,14,36,'2022-11-09 11:11:30','2022-11-09 11:11:30'),(172,14,35,'2022-11-09 11:11:30','2022-11-09 11:11:30'),(225,4,34,'2022-11-15 18:14:14','2022-11-15 18:14:14'),(226,4,33,'2022-11-15 18:14:14','2022-11-15 18:14:14');
/*!40000 ALTER TABLE `UserSpaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserVerifiedInfo`
--

DROP TABLE IF EXISTS `UserVerifiedInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserVerifiedInfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` char(36) NOT NULL,
  `isEmailConfirmed` tinyint(1) DEFAULT 0,
  `isFacebookConnected` tinyint(1) DEFAULT 0,
  `isGoogleConnected` tinyint(1) DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `isIdVerification` tinyint(1) DEFAULT 0,
  `isPhoneVerified` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `UserVerifiedInfo_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserVerifiedInfo`
--

LOCK TABLES `UserVerifiedInfo` WRITE;
/*!40000 ALTER TABLE `UserVerifiedInfo` DISABLE KEYS */;
INSERT INTO `UserVerifiedInfo` VALUES (1,'d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',1,0,0,'2019-03-27 07:49:16','2019-03-27 07:49:16',0,0),(2,'977bc550-5069-11e9-a14e-635e0fd3bfa6',1,0,0,'2019-03-27 08:23:25','2019-03-27 08:23:25',0,0),(3,'48c1b7e0-1a59-11ed-ba5e-eb6f597a9da9',0,0,0,'2022-08-12 16:10:29','2022-08-12 16:10:29',0,0),(4,'3fcd41e0-376e-11ed-9bcb-1fd549eed589',1,0,0,'2022-09-18 16:23:37','2022-09-18 16:23:37',0,0),(5,'2d47f470-dc78-11ed-8493-97c361d41aef',0,0,0,'2023-04-16 17:00:23','2023-05-23 06:35:24',0,0),(6,'686d5a50-f3c4-11ed-bd2e-539a1d889026',0,0,0,'2023-05-16 08:34:00','2023-05-16 08:34:00',0,0),(7,'a9ecf070-f497-11ed-bd2e-539a1d889026',0,0,0,'2023-05-17 09:46:14','2023-05-17 09:46:14',0,0),(8,'216a4e80-f79b-11ed-bd2e-539a1d889026',0,0,0,'2023-05-21 05:48:37','2023-05-21 05:48:37',0,0),(9,'b15ebb70-f7aa-11ed-bd2e-539a1d889026',0,0,0,'2023-05-21 07:40:01','2023-05-21 07:40:01',0,0),(10,'58c66a20-f7ab-11ed-bd2e-539a1d889026',0,0,0,'2023-05-21 07:44:41','2023-05-21 07:44:41',0,0),(11,'c4bb2220-f7ab-11ed-bd2e-539a1d889026',0,0,0,'2023-05-21 07:47:43','2023-05-21 07:47:43',0,0),(12,'9d1f15d0-005e-11ee-8c2a-c142d6c35686',0,0,0,'2023-06-01 09:28:05','2023-06-01 09:28:05',0,0),(13,'fc1aba80-005e-11ee-8c2a-c142d6c35686',0,0,0,'2023-06-01 09:30:45','2023-06-01 09:30:45',0,0),(14,'2cd07c00-10e5-11ee-bd2e-539a1d889026',0,0,0,'2023-06-22 10:11:38','2023-06-22 10:11:38',0,0),(15,'9c276d50-14c0-11ee-a424-bd24a6095848',0,0,0,'2023-06-27 07:59:58','2023-06-27 07:59:58',0,0),(16,'1a0dd610-20c3-11ee-bd2e-539a1d889026',0,0,0,'2023-07-12 14:48:02','2023-07-12 14:48:02',0,0),(17,'493f7c90-2b8b-11ee-a6e6-c97f3307257b',0,0,0,'2023-07-26 08:06:12','2023-07-26 08:06:12',0,0),(18,'ecba1810-2c87-11ee-b289-61fce239156d',0,0,0,'2023-07-27 14:14:39','2023-07-27 14:14:39',0,0);
/*!40000 ALTER TABLE `UserVerifiedInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wallet`
--

DROP TABLE IF EXISTS `Wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(255) DEFAULT NULL,
  `balance` float DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wallet`
--

LOCK TABLES `Wallet` WRITE;
/*!40000 ALTER TABLE `Wallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `Wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WalletTransaction`
--

DROP TABLE IF EXISTS `WalletTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WalletTransaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isWithdrawal` tinyint(1) DEFAULT NULL,
  `reservationId` int(11) DEFAULT NULL,
  `balance` float DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `walletId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WalletTransaction`
--

LOCK TABLES `WalletTransaction` WRITE;
/*!40000 ALTER TABLE `WalletTransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `WalletTransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WhyHostInfoBlock`
--

DROP TABLE IF EXISTS `WhyHostInfoBlock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WhyHostInfoBlock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `value` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WhyHostInfoBlock`
--

LOCK TABLES `WhyHostInfoBlock` WRITE;
/*!40000 ALTER TABLE `WhyHostInfoBlock` DISABLE KEYS */;
INSERT INTO `WhyHostInfoBlock` VALUES (1,'Host Banner Title 1','hostBannerTitle1','It\'s simple to become a YourSite host','2020-04-13 11:33:10','2020-04-13 11:36:18'),(2,'Host Banner Image 1','hostBannerImage1','2ae2bf4b77268d77302393a6bd452041.jpeg','2020-04-13 11:33:10','2020-04-13 11:36:18'),(3,'Why Block Title 1','whyBlockTitle1','What is Lorem Ipsum?','2020-04-13 11:33:10','2020-04-13 12:14:24'),(4,'Why Block Title 2','whyBlockTitle2','This tool for our day to day work and our clients?','2020-04-13 11:33:10','2020-04-13 12:14:24'),(5,'Why Block Content 1','whyBlockContent1','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.  \n','2020-04-13 11:33:10','2020-04-13 12:14:24'),(6,'Why Block Content 2','whyBlockContent2','It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.','2020-04-13 11:33:10','2020-04-13 12:14:25'),(7,'Hosting Block Title Heading','hostingBlockTitleHeading','There are 3 Lorem Ipsum generators','2020-04-13 11:33:10','2020-04-13 12:15:58'),(8,'Hosting Block Title 1','hostingBlockTitle1','Lorem Ipsum','2020-04-13 11:33:10','2020-04-13 12:15:58'),(9,'Hosting Block Title 2','hostingBlockTitle2','Lorem Ipsum','2020-04-13 11:33:10','2020-04-13 12:15:59'),(10,'Hosting Block Title 3','hostingBlockTitle3','Lorem Ipsum','2020-04-13 11:33:10','2020-04-13 12:15:59'),(11,'Hosting Block Content 1','hostingBlockContent1','Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\n','2020-04-13 11:33:10','2020-04-13 12:15:59'),(12,'Hosting Block Content 2','hostingBlockContent2','Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\n','2020-04-13 11:33:10','2020-04-13 12:15:59'),(13,'Hosting Block Content 3','hostingBlockContent3','Lorem Ipsum is simply dummy text of the printing and typesetting industry.\n\n','2020-04-13 11:33:10','2020-04-13 12:15:59'),(14,'Cover Section Title 1','coverSectionTitle1','Use our generator to get your own','2020-04-13 11:33:10','2020-04-13 12:17:15'),(15,'Cover Section Image 1','coverSectionImage1','8f49e42fd6bab70ede68826ad0d4a03a.jpeg','2020-04-13 11:33:10','2020-04-13 12:17:15'),(16,'Cover Section Content 1','coverSectionContent1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.','2020-04-13 11:33:10','2020-04-13 12:17:15'),(17,'Cover Section Content 2','coverSectionContent2','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\n\n','2020-04-13 11:33:10','2020-04-13 12:17:16'),(18,'Cover Section Feature 1','coverSectionFeature1','Excepteur sint occaecat cupidatat non proident','2020-04-13 11:33:10','2020-04-13 12:17:16'),(19,'Cover Section Feature 2','coverSectionFeature2','quis nostrud exercitation ullamco laboris nisi','2020-04-13 11:33:10','2020-04-13 12:17:16'),(20,'Cover Section Feature 3','coverSectionFeature3','Sed ut perspiciatis unde omnis iste natus error sit','2020-04-13 11:33:10','2020-04-13 12:17:16'),(21,'Cover Section Feature 4','coverSectionFeature4','Nemo enim ipsam voluptatem quia voluptas sit aspernatur','2020-04-13 11:33:10','2020-04-13 12:17:16'),(22,'Cover Section Feature 5','coverSectionFeature5','Ut enim ad minima veniam, quis nostrum exercitationem','2020-04-13 11:33:10','2020-04-13 12:17:16'),(23,'Cover Section Feature 6','coverSectionFeature6','Excepteur sint occaecat cupidatat non proident','2020-04-13 11:33:10','2020-04-13 12:17:17'),(24,'Payment Title Heading','paymentTitleHeading','It to make a type specimen book','2020-04-13 11:33:10','2020-04-13 12:17:56'),(25,'Payment Title 1','paymentTitle1','Sed ut perspiciatis','2020-04-13 11:33:10','2020-04-13 12:17:56'),(26,'Payment Title 2','paymentTitle2','Nemo enim ipsam','2020-04-13 11:33:10','2020-04-13 12:17:57'),(27,'Payment Title 3','paymentTitle3','Neque porro','2020-04-13 11:33:10','2020-04-13 12:17:57'),(28,'Payment Content 1','paymentContent1','Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur\n\n','2020-04-13 11:33:10','2020-04-13 12:17:57'),(29,'Payment Content 2','paymentContent2','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt\n\n','2020-04-13 11:33:10','2020-04-13 12:17:57'),(30,'Payment Content 3','paymentContent3','Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum\n\n','2020-04-13 11:33:10','2020-04-13 12:17:57'),(31,'Quote Section Title 1','quoteSectionTitle1','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore','2020-04-13 11:33:10','2020-04-13 12:19:07'),(32,'Quote Section Title 2','quoteSectionTitle2','It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages','2020-04-13 11:33:10','2020-04-13 12:19:08'),(33,'Quote Section Content 1','quoteSectionContent1','software like Aldus PageMaker including versions of Lorem Ipsum.\n','2020-04-13 11:33:10','2020-04-13 12:19:08'),(34,'Quote Section Content 2','quoteSectionContent2','software like Aldus PageMaker including versions of Lorem Ipsum.\n','2020-04-13 11:33:10','2020-04-13 12:19:08'),(35,'Quote Section Image 1','quoteSectionImage1','0a584ba173af81174be5eb6a657667ad.jpeg','2020-04-13 11:33:10','2020-04-13 12:19:08'),(36,'Quote Section Image 2','quoteSectionImage2','083eb3e69d9eaca28ec8e2ca2cd8e350.jpeg','2020-04-13 11:33:10','2020-04-13 12:19:08'),(37,'Quote Section Button 1','quoteSectionButton1','Lorem Ipsum Text','2020-04-13 11:33:10','2020-04-13 12:19:09'),(38,'Quote Section Button 2','quoteSectionButton2','Lorem Ipsum Text','2020-04-13 11:33:10','2020-04-13 12:19:09'),(39,'FAQ Title 1','faqTitle1','Lorem ipsum dolor sit amet, consecteturt','2020-04-13 11:33:10','2020-04-13 12:19:40'),(40,'FAQ Title 2','faqTitle2','Lorem ipsum dolor sit amet, consecteturt','2020-04-13 11:33:10','2020-04-13 12:19:40'),(41,'FAQ Title 3','faqTitle3','Lorem ipsum dolor sit amet, consecteturt','2020-04-13 11:33:10','2020-04-13 12:19:40'),(42,'FAQ Title 4','faqTitle4','Lorem ipsum dolor sit amet, consecteturt','2020-04-13 11:33:10','2020-04-13 12:19:40'),(43,'FAQ Title 5','faqTitle5','','2020-04-13 11:33:10','2020-04-13 12:19:40'),(44,'FAQ Title 6','faqTitle6','','2020-04-13 11:33:10','2020-04-13 12:19:41'),(45,'FAQ Title 7','faqTitle7','','2020-04-13 11:33:10','2020-04-13 12:19:41'),(46,'FAQ Title 8','faqTitle8','','2020-04-13 11:33:10','2020-04-13 12:19:41'),(47,'FAQ Content 1','faqContent1','Exercitation in fugiat est ut ad ea cupidatat ut in cupidatat occaecat ut occaecat consequat est minim minim esse tempor laborum consequat esse adipisicing eu reprehenderit enim.\n\n','2020-04-13 11:33:10','2020-04-13 12:19:41'),(48,'FAQ Content 2','faqContent2','Exercitation in fugiat est ut ad ea cupidatat ut in cupidatat occaecat ut occaecat consequat est minim minim esse tempor laborum consequat esse adipisicing eu reprehenderit enim.\n\n','2020-04-13 11:33:10','2020-04-13 12:19:41'),(49,'FAQ Content 3','faqContent3','Exercitation in fugiat est ut ad ea cupidatat ut in cupidatat occaecat ut occaecat consequat est minim minim esse tempor laborum consequat esse adipisicing eu reprehenderit enim.\n\n','2020-04-13 11:33:10','2020-04-13 12:19:41'),(50,'FAQ Content 4','faqContent4','Exercitation in fugiat est ut ad ea cupidatat ut in cupidatat occaecat ut occaecat consequat est minim minim esse tempor laborum consequat esse adipisicing eu reprehenderit enim.\n\n','2020-04-13 11:33:10','2020-04-13 12:19:42'),(51,'FAQ Content 5','faqContent5','','2020-04-13 11:33:10','2020-04-13 12:19:42'),(52,'FAQ Content 6','faqContent6','','2020-04-13 11:33:10','2020-04-13 12:19:42'),(53,'FAQ Content 7','faqContent7','','2020-04-13 11:33:10','2020-04-13 12:19:42'),(54,'FAQ Content 8','faqContent8','','2020-04-13 11:33:10','2020-04-13 12:19:42');
/*!40000 ALTER TABLE `WhyHostInfoBlock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WishList`
--

DROP TABLE IF EXISTS `WishList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WishList` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wishListGroupId` int(11) NOT NULL,
  `listId` int(11) NOT NULL,
  `userId` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `isListActive` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wishListGroupId` (`wishListGroupId`),
  KEY `listId` (`listId`),
  CONSTRAINT `WishList_ibfk_1` FOREIGN KEY (`wishListGroupId`) REFERENCES `WishListGroup` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `WishList_ibfk_2` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WishList`
--

LOCK TABLES `WishList` WRITE;
/*!40000 ALTER TABLE `WishList` DISABLE KEYS */;
INSERT INTO `WishList` VALUES (1,1,6,'2d47f470-dc78-11ed-8493-97c361d41aef','2023-06-06 06:48:48','2023-08-03 12:00:00',1),(14,3,7,'9c276d50-14c0-11ee-a424-bd24a6095848','2023-07-27 08:49:06','2023-08-03 12:00:00',1);
/*!40000 ALTER TABLE `WishList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WishListGroup`
--

DROP TABLE IF EXISTS `WishListGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WishListGroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `userId` char(36) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `isPublic` int(11) DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WishListGroup`
--

LOCK TABLES `WishListGroup` WRITE;
/*!40000 ALTER TABLE `WishListGroup` DISABLE KEYS */;
INSERT INTO `WishListGroup` VALUES (1,'Houses','2d47f470-dc78-11ed-8493-97c361d41aef',0,'2023-06-06 06:48:42','2023-06-06 06:48:42'),(3,' Test','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',1,'2023-06-14 11:59:08','2023-06-14 11:59:08'),(4,'the favorite homes','d1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',1,'2023-06-15 06:14:47','2023-06-15 06:14:47'),(5,'test','9c276d50-14c0-11ee-a424-bd24a6095848',1,'2023-07-16 09:03:50','2023-07-16 09:03:50');
/*!40000 ALTER TABLE `WishListGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'newrentall'
--

--
-- Dumping routines for database 'newrentall'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-03 15:06:22
