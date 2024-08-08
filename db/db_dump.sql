-- MySQL dump 10.13  Distrib 5.7.29, for osx10.15 (x86_64)

--

-- Host: localhost    Database: rentall_v_3_2

-- ------------------------------------------------------

-- Server version	5.7.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */

;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */

;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */

;

/*!40101 SET NAMES utf8 */

;

/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */

;

/*!40103 SET TIME_ZONE='+00:00' */

;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */

;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */

;
use rentall_v_3_2;

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */

;

/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */

;

--

-- Table structure for table `AdminPrivileges`

--

DROP TABLE IF EXISTS `AdminPrivileges`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE `AdminPrivileges` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `roleId` int(11) NOT NULL,
    `previlegeId` int(11) NOT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`),
    KEY `roleId` (`roleId`),
    CONSTRAINT `AdminPrivileges_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `AdminRoles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `AdminPrivileges`

--

LOCK TABLES `AdminPrivileges` WRITE;

/*!40000 ALTER TABLE `AdminPrivileges` DISABLE KEYS */

;

/*!40000 ALTER TABLE `AdminPrivileges` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `AdminRoles`

--

DROP TABLE IF EXISTS `AdminRoles`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE `AdminRoles` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `description` text,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `AdminRoles`

--

LOCK TABLES `AdminRoles` WRITE;

/*!40000 ALTER TABLE `AdminRoles` DISABLE KEYS */

;

/*!40000 ALTER TABLE `AdminRoles` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `AdminUser`

--

DROP TABLE IF EXISTS `AdminUser`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE `AdminUser` (
    `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
    `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `emailConfirmed` tinyint(1) DEFAULT '0',
    `isSuperAdmin` tinyint(1) DEFAULT '0',
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    `roleId` int(11) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `admin_user_email` (`email`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `AdminUser`

--

LOCK TABLES `AdminUser` WRITE;

/*!40000 ALTER TABLE `AdminUser` DISABLE KEYS */

;


/*!40000 ALTER TABLE `AdminUser` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `Banner`

--

DROP TABLE IF EXISTS `Banner`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE `Banner` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `content` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `isEnable` tinyint(1) NOT NULL DEFAULT '1',
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `Banner`

--

LOCK TABLES `Banner` WRITE;

/*!40000 ALTER TABLE `Banner` DISABLE KEYS */

;

INSERT INTO
    `Banner`
VALUES
    (
        1,
        'Lorum Ipsum.',
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        1,
        '2019-03-27 11:53:46',
        '2018-05-02 04:49:38'
    );

/*!40000 ALTER TABLE `Banner` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `BedTypes`

--

DROP TABLE IF EXISTS `BedTypes`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE `BedTypes` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `listId` int(11) NOT NULL,
    `bedCount` int(11) DEFAULT NULL,
    `bedType` int(11) DEFAULT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`),
    KEY `listId` (`listId`),
    KEY `bedType` (`bedType`),
    CONSTRAINT `BedTypes_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `BedTypes_ibfk_2` FOREIGN KEY (`bedType`) REFERENCES `ListSettings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 80 DEFAULT CHARSET = latin1;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `BedTypes`

--

LOCK TABLES `BedTypes` WRITE;

/*!40000 ALTER TABLE `BedTypes` DISABLE KEYS */

;

INSERT INTO
    `BedTypes`
VALUES
    (
        4,
        1,
        1,
        16,
        '2019-03-27 09:46:01',
        '2019-03-27 09:46:01'
    ),(
        5,
        1,
        2,
        17,
        '2019-03-27 09:46:01',
        '2019-03-27 09:46:01'
    ),(
        6,
        1,
        3,
        17,
        '2019-03-27 09:46:01',
        '2019-03-27 09:46:01'
    ),(
        41,
        7,
        1,
        16,
        '2019-03-27 10:09:36',
        '2019-03-27 10:09:36'
    ),(
        42,
        7,
        4,
        17,
        '2019-03-27 10:09:36',
        '2019-03-27 10:09:36'
    ),(
        43,
        7,
        2,
        16,
        '2019-03-27 10:09:36',
        '2019-03-27 10:09:36'
    ),(
        44,
        7,
        3,
        17,
        '2019-03-27 10:09:36',
        '2019-03-27 10:09:36'
    ),(
        45,
        7,
        5,
        18,
        '2019-03-27 10:09:36',
        '2019-03-27 10:09:36'
    ),(
        46,
        7,
        6,
        19,
        '2019-03-27 10:09:36',
        '2019-03-27 10:09:36'
    ),(
        49,
        6,
        1,
        16,
        '2019-07-04 10:52:39',
        '2019-07-04 10:52:39'
    ),(
        50,
        6,
        2,
        16,
        '2019-07-04 10:52:39',
        '2019-07-04 10:52:39'
    ),(
        51,
        5,
        1,
        16,
        '2019-07-04 10:57:10',
        '2019-07-04 10:57:10'
    ),(
        52,
        5,
        2,
        18,
        '2019-07-04 10:57:10',
        '2019-07-04 10:57:10'
    ),(
        53,
        5,
        3,
        18,
        '2019-07-04 10:57:10',
        '2019-07-04 10:57:10'
    ),(
        58,
        3,
        1,
        20,
        '2019-07-04 11:00:34',
        '2019-07-04 11:00:34'
    ),(
        59,
        3,
        2,
        19,
        '2019-07-04 11:00:34',
        '2019-07-04 11:00:34'
    ),(
        60,
        3,
        3,
        20,
        '2019-07-04 11:00:34',
        '2019-07-04 11:00:34'
    ),(
        61,
        2,
        1,
        17,
        '2019-07-04 11:02:19',
        '2019-07-04 11:02:19'
    ),(
        62,
        2,
        2,
        16,
        '2019-07-04 11:02:19',
        '2019-07-04 11:02:19'
    ),(
        74,
        8,
        1,
        16,
        '2020-04-13 13:10:34',
        '2020-04-13 13:10:34'
    ),(
        75,
        8,
        2,
        20,
        '2020-04-13 13:10:34',
        '2020-04-13 13:10:34'
    ),(
        76,
        8,
        3,
        19,
        '2020-04-13 13:10:34',
        '2020-04-13 13:10:34'
    ),(
        77,
        8,
        4,
        19,
        '2020-04-13 13:10:34',
        '2020-04-13 13:10:34'
    ),(
        78,
        8,
        5,
        20,
        '2020-04-13 13:10:34',
        '2020-04-13 13:10:34'
    ),(
        79,
        4,
        1,
        16,
        '2020-08-10 07:12:12',
        '2020-08-10 07:12:12'
    );

/*!40000 ALTER TABLE `BedTypes` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `BlogDetails`

--

DROP TABLE IF EXISTS `BlogDetails`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE `BlogDetails` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `pageTitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `metaTitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `metaDescription` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
    `pageUrl` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
    `isEnable` tinyint(1) NOT NULL DEFAULT '1',
    `footerCategory` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    `isPrivate` tinyint(1) DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `BlogDetails`

--

LOCK TABLES `BlogDetails` WRITE;

/*!40000 ALTER TABLE `BlogDetails` DISABLE KEYS */

;

/*!40000 ALTER TABLE `BlogDetails` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `Cancellation`

--

DROP TABLE IF EXISTS `Cancellation`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE `Cancellation` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `policyName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `policyContent` mediumtext COLLATE utf8mb4_unicode_ci,
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
    `isEnable` tinyint(1) NOT NULL DEFAULT '1',
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    `nonRefundableNightsPriorCheckIn` int(11) DEFAULT '0',
    `nonRefundableNightsBeforeCheckIn` int(11) DEFAULT '1',
    `nonRefundableNightsDuringCheckIn` int(11) DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `Cancellation`

--

LOCK TABLES `Cancellation` WRITE;

/*!40000 ALTER TABLE `Cancellation` DISABLE KEYS */

;

INSERT INTO
    `Cancellation`
VALUES
    (
        1,
        'Flexible',
        'Cancel up to 1 day prior to arrival and get a 100% refund',
        1,
        100,
        100,
        100,
        100,
        100,
        0,
        100,
        100,
        100,
        1,
        '2017-06-09 22:43:35',
        '2017-06-09 22:43:35',
        0,
        1,
        0
    ),(
        2,
        'Moderate',
        'Cancel up to 5 days prior to arrival and get a 50% refund',
        5,
        100,
        50,
        50,
        100,
        100,
        0,
        100,
        100,
        100,
        1,
        '2017-06-09 22:46:10',
        '2017-06-09 22:46:10',
        0,
        1,
        0
    ),(
        3,
        'Strict',
        'Cancel up to 7 days prior to arrival and get a 50% refund',
        7,
        50,
        0,
        0,
        100,
        0,
        0,
        100,
        100,
        100,
        1,
        '2017-06-09 22:47:38',
        '2017-06-09 22:47:38',
        0,
        0,
        0
    );

/*!40000 ALTER TABLE `Cancellation` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `CancellationDetails`

--

DROP TABLE IF EXISTS `CancellationDetails`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE `CancellationDetails` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `reservationId` int(11) NOT NULL,
    `cancellationPolicy` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `refundToGuest` float NOT NULL,
    `payoutToHost` float NOT NULL,
    `guestServiceFee` float NOT NULL,
    `hostServiceFee` float NOT NULL,
    `total` float NOT NULL,
    `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `cancelledBy` enum('host', 'guest') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    `createdAt` datetime NOT NULL,
    `updatedAt` datetime NOT NULL,
    PRIMARY KEY (`id`),
    KEY `reservationId` (`reservationId`),
    CONSTRAINT `CancellationDetails_ibfk_1` FOREIGN KEY (`reservationId`) REFERENCES `Reservation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `CancellationDetails`

--

LOCK TABLES `CancellationDetails` WRITE;

/*!40000 ALTER TABLE `CancellationDetails` DISABLE KEYS */

;

/*!40000 ALTER TABLE `CancellationDetails` ENABLE KEYS */

;

UNLOCK TABLES;

--

-- Table structure for table `Country`

--

DROP TABLE IF EXISTS `Country`;

/*!40101 SET @saved_cs_client     = @@character_set_client */

;

/*!40101 SET character_set_client = utf8 */

;

CREATE TABLE `Country` (
    `id` int(11) NOT NULL AUTO_INCREMENT,
    `countryCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `countryName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
    `isEnable` tinyint(1) NOT NULL DEFAULT '1',
    `createdAt` datetime DEFAULT '2018-09-29 11:22:19',
    `updatedAt` datetime DEFAULT '2018-09-29 11:22:19',
    `dialCode` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
    PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 242 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

/*!40101 SET character_set_client = @saved_cs_client */

;

--

-- Dumping data for table `Country`

--

LOCK TABLES `Country` WRITE;

/*!40000 ALTER TABLE `Country` DISABLE KEYS */

;

INSERT INTO
    `Country`
VALUES
    (
        1,
        'DZ',
        'Algeria',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+213'
    ),(
        2,
        'AF',
        'Afghanistan',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+93'
    ),(
        3,
        'AL',
        'Albania',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+355'
    ),(
        4,
        'AS',
        'AmericanSamoa',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 684'
    ),(
        5,
        'AD',
        'Andorra',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+376'
    ),(
        6,
        'AO',
        'Angola',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+244'
    ),(
        7,
        'AI',
        'Anguilla',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 264'
    ),(
        8,
        'AQ',
        'Antarctica',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+672'
    ),(
        9,
        'AG',
        'Antigua and Barbuda',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1268'
    ),(
        10,
        'AR',
        'Argentina',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+54'
    ),(
        11,
        'AM',
        'Armenia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+374'
    ),(
        12,
        'AW',
        'Aruba',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+297'
    ),(
        13,
        'AU',
        'Australia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+61'
    ),(
        14,
        'AT',
        'Austria',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+43'
    ),(
        15,
        'AZ',
        'Azerbaijan',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+994'
    ),(
        16,
        'BS',
        'Bahamas',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 242'
    ),(
        17,
        'BH',
        'Bahrain',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+973'
    ),(
        18,
        'BD',
        'Bangladesh',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+880'
    ),(
        19,
        'BB',
        'Barbados',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 246'
    ),(
        20,
        'BY',
        'Belarus',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+375'
    ),(
        21,
        'BE',
        'Belgium',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+32'
    ),(
        22,
        'BZ',
        'Belize',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+501'
    ),(
        23,
        'BJ',
        'Benin',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+229'
    ),(
        24,
        'BM',
        'Bermuda',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 441'
    ),(
        25,
        'BT',
        'Bhutan',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+975'
    ),(
        26,
        'BO',
        'Bolivia, Plurinational State of',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+591'
    ),(
        27,
        'BA',
        'Bosnia and Herzegovina',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+387'
    ),(
        28,
        'BW',
        'Botswana',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+267'
    ),(
        29,
        'BR',
        'Brazil',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+55'
    ),(
        30,
        'IO',
        'British Indian Ocean Territory',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+246'
    ),(
        31,
        'BN',
        'Brunei Darussalam',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+673'
    ),(
        32,
        'BG',
        'Bulgaria',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+359'
    ),(
        33,
        'BF',
        'Burkina Faso',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+226'
    ),(
        34,
        'BI',
        'Burundi',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+257'
    ),(
        35,
        'KH',
        'Cambodia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+855'
    ),(
        36,
        'CM',
        'Cameroon',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+237'
    ),(
        37,
        'CA',
        'Canada',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1'
    ),(
        38,
        'CV',
        'Cape Verde',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+238'
    ),(
        39,
        'KY',
        'Cayman Islands',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+ 345'
    ),(
        40,
        'CF',
        'Central African Republic',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+236'
    ),(
        41,
        'TD',
        'Chad',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+235'
    ),(
        42,
        'CL',
        'Chile',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+56'
    ),(
        43,
        'CN',
        'China',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+86'
    ),(
        44,
        'CX',
        'Christmas Island',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+61'
    ),(
        45,
        'CC',
        'Cocos (Keeling) Islands',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+61'
    ),(
        46,
        'CO',
        'Colombia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+57'
    ),(
        47,
        'KM',
        'Comoros',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+269'
    ),(
        48,
        'CG',
        'Congo',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+242'
    ),(
        49,
        'CD',
        'Congo, The Democratic Republic of the',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+243'
    ),(
        50,
        'CK',
        'Cook Islands',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+682'
    ),(
        51,
        'CR',
        'Costa Rica',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+506'
    ),(
        52,
        'CI',
        'Cote d\'Ivoire',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+225'
    ),(
        53,
        'HR',
        'Croatia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+385'
    ),(
        54,
        'CU',
        'Cuba',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+53'
    ),(
        55,
        'CY',
        'Cyprus',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+357'
    ),(
        56,
        'CZ',
        'Czech Republic',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+420'
    ),(
        57,
        'DK',
        'Denmark',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+45'
    ),(
        58,
        'DJ',
        'Djibouti',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+253'
    ),(
        59,
        'DM',
        'Dominica',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 767'
    ),(
        60,
        'DO',
        'Dominican Republic',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 849'
    ),(
        61,
        'EC',
        'Ecuador',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+593'
    ),(
        62,
        'EG',
        'Egypt',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+20'
    ),(
        63,
        'SV',
        'El Salvador',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+503'
    ),(
        64,
        'GQ',
        'Equatorial Guinea',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+240'
    ),(
        65,
        'ER',
        'Eritrea',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+291'
    ),(
        66,
        'EE',
        'Estonia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+372'
    ),(
        67,
        'ET',
        'Ethiopia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+251'
    ),(
        68,
        'FK',
        'Falkland Islands (Malvinas)',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+500'
    ),(
        69,
        'FO',
        'Faroe Islands',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+298'
    ),(
        70,
        'FJ',
        'Fiji',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+679'
    ),(
        71,
        'FI',
        'Finland',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+358'
    ),(
        72,
        'FR',
        'France',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+33'
    ),(
        73,
        'GF',
        'French Guiana',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+594'
    ),(
        74,
        'PF',
        'French Polynesia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+689'
    ),(
        75,
        'GA',
        'Gabon',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+241'
    ),(
        76,
        'GM',
        'Gambia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+220'
    ),(
        77,
        'GE',
        'Georgia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+995'
    ),(
        78,
        'DE',
        'Germany',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+49'
    ),(
        79,
        'GH',
        'Ghana',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+233'
    ),(
        80,
        'GI',
        'Gibraltar',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+350'
    ),(
        81,
        'GR',
        'Greece',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+30'
    ),(
        82,
        'GL',
        'Greenland',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+299'
    ),(
        83,
        'GD',
        'Grenada',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 473'
    ),(
        84,
        'GP',
        'Guadeloupe',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+590'
    ),(
        85,
        'GU',
        'Guam',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 671'
    ),(
        86,
        'GT',
        'Guatemala',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+502'
    ),(
        87,
        'GG',
        'Guernsey',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+44'
    ),(
        88,
        'GN',
        'Guinea',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+224'
    ),(
        89,
        'GW',
        'Guinea-Bissau',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+245'
    ),(
        90,
        'GY',
        'Guyana',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+595'
    ),(
        91,
        'HT',
        'Haiti',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+509'
    ),(
        92,
        'VA',
        'Holy See (Vatican City State)',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+379'
    ),(
        93,
        'HN',
        'Honduras',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+504'
    ),(
        94,
        'HK',
        'Hong Kong',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+852'
    ),(
        95,
        'HU',
        'Hungary',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+36'
    ),(
        96,
        'IS',
        'Iceland',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+354'
    ),(
        97,
        'IN',
        'India',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+91'
    ),(
        98,
        'ID',
        'Indonesia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+62'
    ),(
        99,
        'IR',
        'Iran, Islamic Republic of',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+98'
    ),(
        100,
        'IQ',
        'Iraq',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+964'
    ),(
        101,
        'IE',
        'Ireland',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+353'
    ),(
        102,
        'IM',
        'Isle of Man',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+44'
    ),(
        103,
        'IL',
        'Israel',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+972'
    ),(
        104,
        'IT',
        'Italy',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+39'
    ),(
        105,
        'JM',
        'Jamaica',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 876'
    ),(
        106,
        'JP',
        'Japan',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+81'
    ),(
        107,
        'JE',
        'Jersey',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+44'
    ),(
        108,
        'JO',
        'Jordan',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+962'
    ),(
        109,
        'KZ',
        'Kazakhstan',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+7 7'
    ),(
        110,
        'KE',
        'Kenya',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+254'
    ),(
        111,
        'KI',
        'Kiribati',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+686'
    ),(
        112,
        'KP',
        'Korea, Democratic People\'s Republic of',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+850'
    ),(
        113,
        'KR',
        'Korea, Republic of',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+82'
    ),(
        114,
        'KW',
        'Kuwait',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+965'
    ),(
        115,
        'KG',
        'Kyrgyzstan',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+996'
    ),(
        116,
        'LA',
        'Lao People\'s Democratic Republic',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+856'
    ),(
        117,
        'LV',
        'Latvia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+371'
    ),(
        118,
        'LB',
        'Lebanon',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+961'
    ),(
        119,
        'LS',
        'Lesotho',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+266'
    ),(
        120,
        'LR',
        'Liberia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+231'
    ),(
        121,
        'LY',
        'Libyan Arab Jamahiriya',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+218'
    ),(
        122,
        'LI',
        'Liechtenstein',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+423'
    ),(
        123,
        'LT',
        'Lithuania',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+370'
    ),(
        124,
        'LU',
        'Luxembourg',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+352'
    ),(
        125,
        'MO',
        'Macao',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+853'
    ),(
        126,
        'MK',
        'Macedonia, The Former Yugoslav Republic of',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+389'
    ),(
        127,
        'MG',
        'Madagascar',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+261'
    ),(
        128,
        'MW',
        'Malawi',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+265'
    ),(
        129,
        'MY',
        'Malaysia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+60'
    ),(
        130,
        'MV',
        'Maldives',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+960'
    ),(
        131,
        'ML',
        'Mali',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+223'
    ),(
        132,
        'MT',
        'Malta',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+356'
    ),(
        133,
        'MH',
        'Marshall Islands',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+692'
    ),(
        134,
        'MQ',
        'Martinique',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+596'
    ),(
        135,
        'MR',
        'Mauritania',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+222'
    ),(
        136,
        'MU',
        'Mauritius',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+230'
    ),(
        137,
        'YT',
        'Mayotte',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+262'
    ),(
        138,
        'MX',
        'Mexico',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+52'
    ),(
        139,
        'FM',
        'Micronesia, Federated States of',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+691'
    ),(
        140,
        'MD',
        'Moldova, Republic of',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+373'
    ),(
        141,
        'MC',
        'Monaco',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+377'
    ),(
        142,
        'MN',
        'Mongolia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+976'
    ),(
        143,
        'ME',
        'Montenegro',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+382'
    ),(
        144,
        'MS',
        'Montserrat',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1664'
    ),(
        145,
        'MA',
        'Morocco',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+212'
    ),(
        146,
        'MZ',
        'Mozambique',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+258'
    ),(
        147,
        'MM',
        'Myanmar',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+95'
    ),(
        148,
        'NA',
        'Namibia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+264'
    ),(
        149,
        'NR',
        'Nauru',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+674'
    ),(
        150,
        'NP',
        'Nepal',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+977'
    ),(
        151,
        'NL',
        'Netherlands',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+31'
    ),(
        152,
        'AN',
        'Netherlands Antilles',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+599'
    ),(
        153,
        'NC',
        'New Caledonia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+687'
    ),(
        154,
        'NZ',
        'New Zealand',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+64'
    ),(
        155,
        'NI',
        'Nicaragua',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+505'
    ),(
        156,
        'NE',
        'Niger',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+227'
    ),(
        157,
        'NG',
        'Nigeria',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+234'
    ),(
        158,
        'NU',
        'Niue',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+683'
    ),(
        159,
        'NF',
        'Norfolk Island',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+672'
    ),(
        160,
        'MP',
        'Northern Mariana Islands',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 670'
    ),(
        161,
        'NO',
        'Norway',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+47'
    ),(
        162,
        'OM',
        'Oman',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+968'
    ),(
        163,
        'PK',
        'Pakistan',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+92'
    ),(
        164,
        'PW',
        'Palau',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+680'
    ),(
        165,
        'PS',
        'Palestinian Territory, Occupied',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+970'
    ),(
        166,
        'PA',
        'Panama',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+507'
    ),(
        167,
        'PG',
        'Papua New Guinea',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+675'
    ),(
        168,
        'PY',
        'Paraguay',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+595'
    ),(
        169,
        'PE',
        'Peru',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+51'
    ),(
        170,
        'PH',
        'Philippines',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+63'
    ),(
        171,
        'PN',
        'Pitcairn',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+872'
    ),(
        172,
        'PL',
        'Poland',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+48'
    ),(
        173,
        'PT',
        'Portugal',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+351'
    ),(
        174,
        'PR',
        'Puerto Rico',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 939'
    ),(
        175,
        'QA',
        'Qatar',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+974'
    ),(
        176,
        'RO',
        'Romania',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+40'
    ),(
        177,
        'RU',
        'Russia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+7'
    ),(
        178,
        'RW',
        'Rwanda',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+250'
    ),(
        179,
        'RE',
        'Réunion',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+262'
    ),(
        180,
        'BL',
        'Saint Barthélemy',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+590'
    ),(
        181,
        'SH',
        'Saint Helena, Ascension and Tristan Da Cunha',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+290'
    ),(
        182,
        'KN',
        'Saint Kitts and Nevis',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 869'
    ),(
        183,
        'LC',
        'Saint Lucia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 758'
    ),(
        184,
        'MF',
        'Saint Martin',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+590'
    ),(
        185,
        'PM',
        'Saint Pierre and Miquelon',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+508'
    ),(
        186,
        'VC',
        'Saint Vincent and the Grenadines',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 784'
    ),(
        187,
        'WS',
        'Samoa',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+685'
    ),(
        188,
        'SM',
        'San Marino',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+378'
    ),(
        189,
        'ST',
        'Sao Tome and Principe',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+239'
    ),(
        190,
        'SA',
        'Saudi Arabia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+966'
    ),(
        191,
        'SN',
        'Senegal',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+221'
    ),(
        192,
        'RS',
        'Serbia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+381'
    ),(
        193,
        'SC',
        'Seychelles',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+248'
    ),(
        194,
        'SL',
        'Sierra Leone',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+232'
    ),(
        195,
        'SG',
        'Singapore',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+65'
    ),(
        196,
        'SK',
        'Slovakia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+421'
    ),(
        197,
        'SI',
        'Slovenia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+386'
    ),(
        198,
        'SB',
        'Solomon Islands',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+677'
    ),(
        199,
        'SO',
        'Somalia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+252'
    ),(
        200,
        'ZA',
        'South Africa',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+27'
    ),(
        201,
        'GS',
        'South Georgia and the South Sandwich Islands',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+500'
    ),(
        202,
        'ES',
        'Spain',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+34'
    ),(
        203,
        'LK',
        'Sri Lanka',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+94'
    ),(
        204,
        'SD',
        'Sudan',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+249'
    ),(
        205,
        'SR',
        'Suriname',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+597'
    ),(
        206,
        'SJ',
        'Svalbard and Jan Mayen',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+47'
    ),(
        207,
        'SZ',
        'Swaziland',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+268'
    ),(
        208,
        'SE',
        'Sweden',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+46'
    ),(
        209,
        'CH',
        'Switzerland',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+41'
    ),(
        210,
        'SY',
        'Syrian Arab Republic',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+963'
    ),(
        211,
        'TW',
        'Taiwan, Province of China',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+886'
    ),(
        212,
        'TJ',
        'Tajikistan',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+992'
    ),(
        213,
        'TZ',
        'Tanzania, United Republic of',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+255'
    ),(
        214,
        'TH',
        'Thailand',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+66'
    ),(
        215,
        'TL',
        'Timor-Leste',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+670'
    ),(
        216,
        'TG',
        'Togo',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+228'
    ),(
        217,
        'TK',
        'Tokelau',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+690'
    ),(
        218,
        'TO',
        'Tonga',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+676'
    ),(
        219,
        'TT',
        'Trinidad and Tobago',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 868'
    ),(
        220,
        'TN',
        'Tunisia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+216'
    ),(
        221,
        'TR',
        'Turkey',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+90'
    ),(
        222,
        'TM',
        'Turkmenistan',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+993'
    ),(
        223,
        'TC',
        'Turks and Caicos Islands',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 649'
    ),(
        224,
        'TV',
        'Tuvalu',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+688'
    ),(
        225,
        'UG',
        'Uganda',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+256'
    ),(
        226,
        'UA',
        'Ukraine',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+380'
    ),(
        227,
        'AE',
        'United Arab Emirates',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+971'
    ),(
        228,
        'GB',
        'United Kingdom',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+44'
    ),(
        229,
        'US',
        'United States',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1'
    ),(
        230,
        'UY',
        'Uruguay',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+598'
    ),(
        231,
        'UZ',
        'Uzbekistan',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+998'
    ),(
        232,
        'VU',
        'Vanuatu',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+678'
    ),(
        233,
        'VE',
        'Venezuela, Bolivarian Republic of',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+58'
    ),(
        234,
        'VN',
        'Viet Nam',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+84'
    ),(
        235,
        'VG',
        'Virgin Islands, British',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 284'
    ),(
        236,
        'VI',
        'Virgin Islands, U.S.',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+1 340'
    ),(
        237,
        'WF',
        'Wallis and Futuna',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+681'
    ),(
        238,
        'YE',
        'Yemen',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+967'
    ),(
        239,
        'ZM',
        'Zambia',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+260'
    ),(
        240,
        'ZW',
        'Zimbabwe',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+263'
    ),(
        241,
        'AX',
        'Åland Islands',
        1,
        '2019-03-27 11:53:47',
        '2018-09-29 11:22:19',
        '+358'
    );
    /*!40000 ALTER TABLE `Country` ENABLE KEYS */;
UNLOCK TABLES;
--
    -- Table structure for table `Currencies`
    --
    DROP TABLE IF EXISTS `Currencies`;
    /*!40101 SET @saved_cs_client     = @@character_set_client */;
    /*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Currencies` (
        `id` int(11) NOT NULL AUTO_INCREMENT,
        `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
        `isEnable` tinyint(1) NOT NULL DEFAULT '1',
        `isBaseCurrency` tinyint(1) NOT NULL DEFAULT '0',
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        `isPayment` tinyint(1) DEFAULT '0',
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 33 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
    /*!40101 SET character_set_client = @saved_cs_client */;
--
    -- Dumping data for table `Currencies`
    --
    LOCK TABLES `Currencies` WRITE;
    /*!40000 ALTER TABLE `Currencies` DISABLE KEYS */;
INSERT INTO
    `Currencies`
VALUES
    (
        1,
        'AUD',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        1
    ),(
        2,
        'BGN',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        1
    ),(
        3,
        'BRL',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        1
    ),(
        4,
        'CAD',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        5,
        'CHF',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        6,
        'CNY',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        7,
        'CZK',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        8,
        'DKK',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        9,
        'EUR',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        1
    ),(
        10,
        'GBP',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        11,
        'HKD',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        12,
        'HRK',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        13,
        'HUF',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        14,
        'IDR',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        15,
        'ILS',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        16,
        'INR',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        17,
        'JPY',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        18,
        'KRW',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        19,
        'MXN',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        20,
        'MYR',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        21,
        'NOK',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        22,
        'NZD',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        23,
        'PHP',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        1
    ),(
        24,
        'PLN',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        25,
        'RON',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        26,
        'RUB',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        1
    ),(
        27,
        'SEK',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    ),(
        28,
        'SGD',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        1
    ),(
        29,
        'THB',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        1
    ),(
        30,
        'TRY',
        1,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        1
    ),(
        31,
        'USD',
        1,
        1,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        1
    ),(
        32,
        'ZAR',
        0,
        0,
        '2019-03-27 11:53:47',
        '2018-05-02 04:52:36',
        0
    );
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
        `currencyCode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
        `rate` float NOT NULL,
        `isBase` tinyint(1) DEFAULT '0',
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 196 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
    /*!40101 SET character_set_client = @saved_cs_client */;
--
    -- Dumping data for table `CurrencyRates`
    --
    LOCK TABLES `CurrencyRates` WRITE;
    /*!40000 ALTER TABLE `CurrencyRates` DISABLE KEYS */;
INSERT INTO
    `CurrencyRates`
VALUES
    (
        1,
        'AED',
        3.67299,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        2,
        'AFN',
        76.9606,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        3,
        'ALGO',
        2.29542,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        4,
        'ALL',
        104.85,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        5,
        'AMD',
        481.616,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        6,
        'ANG',
        1.79954,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        7,
        'AOA',
        582.5,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        8,
        'ARS',
        72.7684,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        9,
        'ATOM',
        0.180685,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        10,
        'AUD',
        1.39788,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        11,
        'AWG',
        1.8002,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        12,
        'AZN',
        1.7025,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        13,
        'BAM',
        1.6584,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        14,
        'BAT',
        3.72939,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        15,
        'BBD',
        2,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        16,
        'BCH',
        0.00326131,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        17,
        'BDT',
        85.0021,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        18,
        'BGN',
        1.65802,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        19,
        'BHD',
        0.377043,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        20,
        'BIF',
        1933.08,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        21,
        'BMD',
        1,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        22,
        'BND',
        1.37437,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        23,
        'BOB',
        6.92209,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        24,
        'BRL',
        5.4394,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        25,
        'BSD',
        1,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        26,
        'BSV',
        0.00439559,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        27,
        'BTC',
        0.0000832476,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        28,
        'BTN',
        75.0785,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        29,
        'BWP',
        11.7667,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        30,
        'BYN',
        2.45701,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        31,
        'BYR',
        24570.1,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        32,
        'BZD',
        2.02075,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        33,
        'CAD',
        1.33835,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        34,
        'CDF',
        1976.96,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        35,
        'CHF',
        0.914449,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        36,
        'CLF',
        0.028224,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        37,
        'CLP',
        788.799,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        38,
        'CNH',
        6.969,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        39,
        'CNY',
        6.9677,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        40,
        'COMP',
        0.00568424,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        41,
        'COP',
        3759.1,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        42,
        'CRC',
        591.136,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        43,
        'CUC',
        1,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        44,
        'CVE',
        94.37,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        45,
        'CZK',
        22.3483,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        46,
        'DAI',
        0.982655,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        47,
        'DASH',
        0.0103002,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        48,
        'DJF',
        178.432,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        49,
        'DKK',
        6.32902,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        50,
        'DOP',
        58.537,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        51,
        'DZD',
        128.472,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        52,
        'EEK',
        14.6137,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        53,
        'EGP',
        15.9608,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        54,
        'EOS',
        0.325998,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        55,
        'ERN',
        15.0031,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        56,
        'ETB',
        35.6747,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        57,
        'ETC',
        0.143215,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        58,
        'ETH',
        0.00251766,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        59,
        'EUR',
        0.849672,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        60,
        'FJD',
        2.1318,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        61,
        'FKP',
        0.766205,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        62,
        'GBP',
        0.766205,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        63,
        'GEL',
        3.085,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        64,
        'GGP',
        0.766205,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        65,
        'GHS',
        5.78436,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        66,
        'GIP',
        0.766205,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        67,
        'GMD',
        51.87,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        68,
        'GNF',
        9671.3,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        69,
        'GTQ',
        7.71918,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        70,
        'GYD',
        209.457,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        71,
        'HKD',
        7.75055,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        72,
        'HNL',
        24.7561,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        73,
        'HRK',
        6.335,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        74,
        'HTG',
        112.61,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        75,
        'HUF',
        294.21,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        76,
        'IDR',
        14717.7,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        77,
        'ILS',
        3.41022,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        78,
        'IMP',
        0.766205,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        79,
        'INR',
        74.9355,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        80,
        'IQD',
        1196.81,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        81,
        'ISK',
        136.45,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        82,
        'JEP',
        0.766205,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        83,
        'JMD',
        148.759,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        84,
        'JOD',
        0.709,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        85,
        'JPY',
        105.894,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        86,
        'KES',
        108.1,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        87,
        'KGS',
        76.9803,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        88,
        'KHR',
        4111.41,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        89,
        'KMF',
        419.97,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        90,
        'KNC',
        0.593666,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        91,
        'KRW',
        1186.52,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        92,
        'KWD',
        0.305912,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        93,
        'KYD',
        0.835492,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        94,
        'KZT',
        420.841,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        95,
        'LAK',
        9093.75,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        96,
        'LBP',
        1515.79,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        97,
        'LINK',
        0.0736022,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        98,
        'LKR',
        185.715,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        99,
        'LRD',
        199.325,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        100,
        'LSL',
        17.5839,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        101,
        'LTC',
        0.0171689,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        102,
        'LTL',
        3.22484,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        103,
        'LVL',
        0.656261,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        104,
        'LYD',
        1.36883,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        105,
        'MAD',
        9.28491,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        106,
        'MDL',
        16.5915,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        107,
        'MGA',
        3853.2,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        108,
        'MKD',
        52.2256,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        109,
        'MKR',
        0.00162502,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        110,
        'MMK',
        1358.9,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        111,
        'MNT',
        2847.83,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        112,
        'MOP',
        8.00285,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        113,
        'MRO',
        357,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        114,
        'MTL',
        0.683738,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        115,
        'MUR',
        39.6797,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        116,
        'MVR',
        15.4,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        117,
        'MWK',
        744.24,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        118,
        'MXN',
        22.4659,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        119,
        'MYR',
        4.1965,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        120,
        'MZN',
        70.956,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        121,
        'NAD',
        17.39,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        122,
        'NGN',
        386.72,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        123,
        'NIO',
        34.9028,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        124,
        'NOK',
        9.04086,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        125,
        'NPR',
        120.128,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        126,
        'NZD',
        1.51651,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        127,
        'OMG',
        0.569201,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        128,
        'OMR',
        0.385046,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        129,
        'OXT',
        5.18269,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        130,
        'PAB',
        1,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        131,
        'PEN',
        3.55144,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        132,
        'PGK',
        3.5275,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        133,
        'PHP',
        49.0717,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        134,
        'PKR',
        168.824,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        135,
        'PLN',
        3.74929,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        136,
        'PYG',
        6951.52,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        137,
        'QAR',
        3.65011,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        138,
        'REP',
        0.0460193,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        139,
        'RON',
        4.1096,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        140,
        'RSD',
        99.915,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        141,
        'RUB',
        73.7052,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        142,
        'RWF',
        961.837,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        143,
        'SAR',
        3.75001,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        144,
        'SBD',
        8.22591,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        145,
        'SCR',
        17.8325,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        146,
        'SEK',
        8.75745,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        147,
        'SGD',
        1.37352,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        148,
        'SHP',
        0.766205,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        149,
        'SLL',
        9826.32,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        150,
        'SOS',
        579.918,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        151,
        'SRD',
        7.458,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        152,
        'SSP',
        130.26,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        153,
        'STD',
        21292.8,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        154,
        'SVC',
        8.77212,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        155,
        'SZL',
        17.5826,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        156,
        'THB',
        31.16,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        157,
        'TJS',
        10.3407,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        158,
        'TMT',
        3.5,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        159,
        'TND',
        2.724,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        160,
        'TOP',
        2.2793,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        161,
        'TRY',
        7.32458,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        162,
        'TTD',
        6.77998,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        163,
        'TWD',
        29.4143,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        164,
        'TZS',
        2330.85,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        165,
        'UAH',
        27.7146,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        166,
        'UGX',
        3694.19,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        167,
        'USD',
        1,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        168,
        'USDC',
        1,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        169,
        'UYU',
        42.6407,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        170,
        'UZS',
        10263.8,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        171,
        'VEF',
        248488,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        172,
        'VES',
        270695,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        173,
        'VND',
        23278.5,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        174,
        'VUV',
        112.896,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        175,
        'WST',
        2.6287,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        176,
        'XAF',
        557.349,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        177,
        'XAG',
        0.0351475,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        178,
        'XAU',
        0.00049204,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        179,
        'XCD',
        2.70255,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        180,
        'XDR',
        0.709289,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        181,
        'XLM',
        9.53193,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        182,
        'XOF',
        557.349,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        183,
        'XPD',
        0.00045914,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        184,
        'XPF',
        101.393,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        185,
        'XPT',
        0.00102042,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        186,
        'XRP',
        3.35065,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        187,
        'XTZ',
        0.271095,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        188,
        'YER',
        250.35,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        189,
        'ZAR',
        17.6784,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        190,
        'ZEC',
        0.0106952,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        191,
        'ZMK',
        5253.08,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        192,
        'ZMW',
        18.4712,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        193,
        'ZRX',
        2.15478,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        194,
        'ZWL',
        322,
        0,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    ),(
        195,
        'USD',
        1,
        1,
        '2020-08-10 07:00:01',
        '2020-08-10 07:00:01'
    );
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
        `documentStatus` enum('pending', 'approved') DEFAULT 'pending',
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB DEFAULT CHARSET = latin1;
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
        `userId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
        `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
        `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        PRIMARY KEY (`id`),
        KEY `userId` (`userId`),
        CONSTRAINT `EmailToken_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
    /*!40101 SET character_set_client = @saved_cs_client */;
--
    -- Dumping data for table `EmailToken`
    --
    LOCK TABLES `EmailToken` WRITE;
    /*!40000 ALTER TABLE `EmailToken` DISABLE KEYS */;
INSERT INTO
    `EmailToken`
VALUES
    (
        1,
        'd1d6d5a0-5064-11e9-a14e-635e0fd3bfa6',
        'demo@radicalstart.com',
        '1553672955896',
        '2019-03-27 07:49:16',
        '2019-03-27 07:49:16'
    ),(
        2,
        '977bc550-5069-11e9-a14e-635e0fd3bfa6',
        'qa@radicalstart.com',
        '1553675005475',
        '2019-03-27 08:23:25',
        '2019-03-27 08:23:25'
    );
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
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;
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
        `isEnable` tinyint(1) NOT NULL DEFAULT '1',
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = latin1;
    /*!40101 SET character_set_client = @saved_cs_client */;
--
    -- Dumping data for table `FooterBlock`
    --
    LOCK TABLES `FooterBlock` WRITE;
    /*!40000 ALTER TABLE `FooterBlock` DISABLE KEYS */;
INSERT INTO
    `FooterBlock`
VALUES
    (
        1,
        '24/7 customer support',
        'If you need help while traveling or hosting, contact us at our toll free number: 000 000 0000 000',
        '6,00,00,000 host guarantee',
        'Hosts are protected against property damages for up to 6,00,00,000.',
        'Verified ID',
        'We aim to build a trusted community by giving you more info when youre deciding who to host or stay with.',
        1,
        '2018-05-22 11:12:19',
        '2018-05-23 05:37:44'
    ),(
        2,
        'one',
        'hkh',
        'one ',
        'jkjh',
        'one ',
        'nknk',
        1,
        '2018-05-22 11:14:18',
        '2018-05-22 11:14:18'
    ),(
        3,
        'one',
        'hkhih',
        'one ',
        'nhjlkhk',
        'one ',
        'klnklh',
        1,
        '2018-05-22 11:15:07',
        '2018-05-22 11:15:07'
    ),(
        4,
        'fdf',
        'fdsfds',
        'fdsfd',
        'fdsfds',
        'fdsff',
        'fdssdfds',
        1,
        '2018-05-22 11:34:58',
        '2018-05-22 11:34:58'
    ),(
        5,
        'fdf',
        'fdsfds',
        'fdsfd',
        'fdsfds',
        'fdsff',
        'fdss',
        1,
        '2018-05-22 11:35:14',
        '2018-05-22 11:35:14'
    ),(
        6,
        'fdf',
        'fdsfds',
        'fdsf',
        'fdsfd',
        'fds',
        'fdss',
        1,
        '2018-05-22 11:39:06',
        '2018-05-22 11:39:06'
    );
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
        `userId` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
        `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
        `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        PRIMARY KEY (`id`),
        KEY `userId` (`userId`),
        CONSTRAINT `ForgotPassword_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `User` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
    /*!40101 SET character_set_client = @saved_cs_client */;
--
    -- Dumping data for table `ForgotPassword`
    --
    LOCK TABLES `ForgotPassword` WRITE;
    /*!40000 ALTER TABLE `ForgotPassword` DISABLE KEYS */;
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
    ) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = latin1;
    /*!40101 SET character_set_client = @saved_cs_client */;
--
    -- Dumping data for table `HomeBanner`
    --
    LOCK TABLES `HomeBanner` WRITE;
    /*!40000 ALTER TABLE `HomeBanner` DISABLE KEYS */;
INSERT INTO
    `HomeBanner`
VALUES
    (
        1,
        '818214bdca262e754911eb475382f629.jpeg',
        1,
        '2019-09-06 06:47:24',
        '2019-09-06 06:47:24'
    ),(
        2,
        'a6d84b2d66e7362ce92066073bd80b00.jpeg',
        1,
        '2019-09-06 06:47:24',
        '2019-09-06 06:47:24'
    ),(
        3,
        '368bae930482d951c44ff6585787944e.jpeg',
        1,
        '2019-09-06 06:47:24',
        '2019-09-06 06:47:24'
    ),(
        4,
        '610723903989676c52e84d33248546e1.jpeg',
        1,
        '2019-09-06 06:47:24',
        '2019-09-06 06:47:24'
    );
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
        `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
        `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
        `buttonLabel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
        `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        PRIMARY KEY (`id`)
    ) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
    /*!40101 SET character_set_client = @saved_cs_client */;
--
    -- Dumping data for table `ImageBanner`
    --
    LOCK TABLES `ImageBanner` WRITE;
    /*!40000 ALTER TABLE `ImageBanner` DISABLE KEYS */;
INSERT INTO
    `ImageBanner`
VALUES
    (
        1,
        'Lorem Ipsum is simply dummy text',
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
        'Lorem Ipsum',
        'e2a09ac3819002edffd36a2d61e8c5c5.jpeg',
        '2019-03-27 11:53:47',
        '2019-07-04 11:11:08'
    );
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
        `calendarStatus` enum('available', 'blocked', 'reservation') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
        `isSpecialPrice` float DEFAULT NULL,
        PRIMARY KEY (`id`),
        KEY `listId` (`listId`),
        KEY `reservationId` (`reservationId`),
        CONSTRAINT `ListBlockedDates_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
        CONSTRAINT `ListBlockedDates_ibfk_2` FOREIGN KEY (`reservationId`) REFERENCES `Reservation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
    /*!40101 SET character_set_client = @saved_cs_client */;
--
    -- Dumping data for table `ListBlockedDates`
    --
    LOCK TABLES `ListBlockedDates` WRITE;
    /*!40000 ALTER TABLE `ListBlockedDates` DISABLE KEYS */;
INSERT INTO
    `ListBlockedDates`
VALUES
    (
        1,
        7,
        NULL,
        '2019-07-04',
        '2019-07-04 06:49:04',
        '2019-07-04 06:56:10',
        NULL,
        'blocked',
        10
    ),(
        2,
        7,
        NULL,
        '2019-07-05',
        '2019-07-04 06:49:04',
        '2019-07-04 06:56:10',
        NULL,
        'blocked',
        10
    );
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
        `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
        `url` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        PRIMARY KEY (`id`),
        KEY `listId` (`listId`),
        CONSTRAINT `ListCalendar_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
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
        `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
        `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '0',
        `isCover` int(11) DEFAULT '0',
        `createdAt` datetime NOT NULL,
        `updatedAt` datetime NOT NULL,
        PRIMARY KEY (`id`),
        KEY `listId` (`listId`),
        CONSTRAINT `ListPhotos_ibfk_1` FOREIGN KEY (`listId`) REFERENCES `Listing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE = InnoDB AUTO_INCREMENT = 93 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
    /*!40101 SET character_set_client = @saved_cs_client */;
--
    -- Dumping data for table `ListPhotos`
    --
    LOCK TABLES `ListPhotos` WRITE;
    /*!40000 ALTER TABLE `ListPhotos` DISABLE KEYS */;
INSERT INTO
    `ListPhotos`
VALUES
    (
        57,
        1,
        'dcda484c967e8df86e64f0f394498c6b.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:36:39',
        '2020-01-23 05:36:39'
    ),(
        58,
        1,
        '394d7c5d3da2621b559887435d8011d0.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:36:39',
        '2020-01-23 05:36:39'
    ),(
        60,
        1,
        '8698cc427d4e10b7eb6aaf5038db0040.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:36:39',
        '2020-01-23 05:36:39'
    ),(
        61,
        2,
        '77d1573a6965309f7a2c23ea11cef7e0.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:37:31',
        '2020-01-23 05:37:31'
    ),(
        62,
        2,
        'afd75f9701dbf592ce119162fc3e38b7.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:37:31',
        '2020-01-23 05:37:31'
    ),(
        63,
        2,
        '866f343a16430b0a9b97bfd3b1b6a587.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:37:31',
        '2020-01-23 05:37:31'
    ),(
        64,
        2,
        'b486b9fc9dde068102e964f37b5ff855.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:37:31',
        '2020-01-23 05:37:31'
    ),(
        65,
        3,
        'da06a23c01f8a092370cea8803249b4f.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:38:35',
        '2020-01-23 05:38:35'
    ),(
        67,
        3,
        '8e3a897a800f2c828a16032533a5f209.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:38:35',
        '2020-01-23 05:38:35'
    ),(
        68,
        3,
        'db757d32c2f546843c4ee734641c53c5.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:38:35',
        '2020-01-23 05:38:35'
    ),(
        69,
        3,
        '3628f4dc2294d66e680ccf7bb41682f9.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:38:35',
        '2020-01-23 05:38:35'
    ),(
        70,
        3,
        '27acc79bfce120f16cea205e51a3f324.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:39:29',
        '2020-01-23 05:39:29'
    ),(
        71,
        4,
        '42050893b5a4b64369f84033cf43987f.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:40:03',
        '2020-01-23 05:40:03'
    ),(
        72,
        4,
        '6b0622e937f88571711c52bbdf290bc8.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:40:03',
        '2020-01-23 05:40:03'
    ),(
        73,
        4,
        '3e135cfea39185357f38a98ba1f201b0.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:40:11',
        '2020-01-23 05:40:11'
    ),(
        74,
        4,
        '91cac4f4d0d3e9cc72ff6ad75c38e663.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:40:19',
        '2020-01-23 05:40:19'
    ),(
        75,
        5,
        '8ad7c57de58e95f65aae90ddd2360008.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:41:36',
        '2020-01-23 05:41:36'
    ),(
        76,
        5,
        '84958eea5f87554e55b6544659b5710a.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:41:42',
        '2020-01-23 05:41:42'
    ),(
        77,
        5,
        '5f15b1ad8688df1c85d321995a0c0737.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:41:49',
        '2020-01-23 05:41:49'
    ),(
        78,
        5,
        '14a9105e3a02bd3ee426fc872b3a7e74.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:41:54',
        '2020-01-23 05:41:54'
    ),(
        79,
        6,
        '9d956fb476a25976009d856703a59e84.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:42:24',
        '2020-01-23 05:42:24'
    ),(
        80,
        6,
        '42a7e827a18c9a51b7b8fedebac09349.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:42:32',
        '2020-01-23 05:42:32'
    ),(
        81,
        6,
        '8c649d8e694481e5bc77196a7634d397.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:42:37',
        '2020-01-23 05:42:37'
    ),(
        82,
        6,
        '9be399d3fd4c13f2b03c719728847b68.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:42:45',
        '2020-01-23 05:42:45'
    ),(
        83,
        6,
        '182abd0d95358fc8616e4461928d27ae.jpeg',
        'image/jpeg',
        0,
        '2020-01-23 05:42:51',