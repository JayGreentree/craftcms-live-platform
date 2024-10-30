/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bynqvglmdlvkzclremupdhmxbodjyvgxvyxb` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_jbxvgusqmclkekjffqgchijuomlgkskyeahf` (`dateRead`),
  KEY `fk_dcuyqvpmdtaewjiutpndokpzrhecuhehtnzn` (`pluginId`),
  CONSTRAINT `fk_bwqxbeofuipjbjpzkqvjmfqsnbmgwuzkjtrj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dcuyqvpmdtaewjiutpndokpzrhecuhehtnzn` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int NOT NULL,
  `uri` text COLLATE utf8mb3_unicode_ci,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xtfmopwmvwqrupxxukxzsajbsotxwyyqepjs` (`sessionId`,`volumeId`),
  KEY `idx_nqavsnakamexqfskdebvjzichivytqtjcsyj` (`volumeId`),
  CONSTRAINT `fk_akgkzfisiuvihhrlpagnqknpckhxccjvkdma` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ipruxufigxmiopaqwepotjjqogkfnrzjzrnd` (`filename`,`folderId`),
  KEY `idx_mamjnelyyplugykpihlvfzcnnaibgwxayvnf` (`folderId`),
  KEY `idx_cvrngmcqpdinlqcvpksrypehtueodutnuqqu` (`volumeId`),
  KEY `fk_ncafnwhbltujoyaffwwtiagvyzagewgrihay` (`uploaderId`),
  CONSTRAINT `fk_arxzoocbombdhhtmwlzcqgtdfvhfmcfyodtt` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kgdsnhlurlsiiabegjpxtyfboputxxycuydt` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ncafnwhbltujoyaffwwtiagvyzagewgrihay` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wmeypnyhsvwlsodjjfqpzqqdbwvfxjqlpfaa` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `filename` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `volumeId` int DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qqdslsrlpxewayvsyyttiglesqmehctspegx` (`volumeId`,`assetId`,`location`),
  KEY `idx_dnoqcatvvadxlozxrijdnaqjiyjpifsoxmfg` (`assetId`,`format`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rzoqeedkjjufzcqjfblgfkqcrwkjhwrhhqbf` (`name`),
  KEY `idx_pncmceldinvxtkcwuobivpyxlowizlmpmfom` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fcwpincntriulvxqskobhwxumcocuhxhhcvx` (`groupId`),
  KEY `fk_ommscjfzijifwonxeoshhzqvxszsefagacdn` (`parentId`),
  CONSTRAINT `fk_iwiihxjmgjbcvcguzesqpzkgnigwtscdnnet` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ommscjfzijifwonxeoshhzqvxszsefagacdn` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zqewhvtbsymrmvbcajcmaudrvtelspbdujua` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eeubhyuquymlxasmrlkctlvmrmnfryuwgjai` (`name`),
  KEY `idx_ltpzxyhvbwyrcafjcdtjroobwiqaxmnsuedu` (`handle`),
  KEY `idx_pkqoweghcrhwspvlefhirffnxpvvztsokgdp` (`structureId`),
  KEY `idx_rbyqaorxqknviluaorsfunrpdgtgxuwpfmpl` (`fieldLayoutId`),
  KEY `idx_cunprdveavgfgauysiyulcjyarnwamfojitf` (`dateDeleted`),
  CONSTRAINT `fk_hqdomtutcqiyycxuiyfbrgaxpghqzcxxiprz` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jvvbyybeljwzoibqvnyawzzqsormzmhzqjql` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8mb3_unicode_ci,
  `template` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bbgddnnhgxvylvnttgruxpvfvqdywewllmbn` (`groupId`,`siteId`),
  KEY `idx_rxndjcsmemyonkjowptugxboyqigjargjleb` (`siteId`),
  CONSTRAINT `fk_oyearjxppoyvonykzcyyblmqwaygtiswwfmt` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tlvcviaxdclynfcsaadrqdugqatnveowulzp` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_qavgbgihripvkuzcdcdowxcwziefnzqfsesw` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_dqtueclmtfwrcaffixwwiqtjtlaantgryxza` (`siteId`),
  KEY `fk_kxzxsllgzqzcuvadakinegwedxtdmcpguoob` (`userId`),
  CONSTRAINT `fk_dqtueclmtfwrcaffixwwiqtjtlaantgryxza` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ftihskrftyzacriovwmliigallnikfcoeeuj` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_kxzxsllgzqzcuvadakinegwedxtdmcpguoob` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_tmdgryjlvuzsznvkdlhcaihgwhmqkckvpucb` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_jblreqpokdmnwcoeotzptlmejunlaiginwno` (`siteId`),
  KEY `fk_ozvpxdiscjtoiezifechwrcqdvxfvyebeziy` (`fieldId`),
  KEY `fk_mrsjzenwnwxbiqtkyzhqtjbinrqwjsblxrqk` (`userId`),
  CONSTRAINT `fk_irvdzxkedcznscuovdpfbwrmtoccbfhsbiqq` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_jblreqpokdmnwcoeotzptlmejunlaiginwno` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mrsjzenwnwxbiqtkyzhqtjbinrqwjsblxrqk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ozvpxdiscjtoiezifechwrcqdvxfvyebeziy` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  `field_pageContent_qmxkcsnd` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ubrjvfhmsbdvyywullgfqndsapzeucjzaorv` (`elementId`,`siteId`),
  KEY `idx_botjgyoyvoxkpnngntxxcadlpxlhdtbufwmn` (`siteId`),
  KEY `idx_rujqbcwvyuiklsgquwvnxsynothmalfeqnkb` (`title`),
  CONSTRAINT `fk_bqimpknuysztvbgzlswwltewclvtswllcbkk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xdmytzcrlytlfzygevojkyjjdohqriiuxbue` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_iwjhwasdjbyzkfuxminftbrrdmtbqqlhxbit` (`userId`),
  CONSTRAINT `fk_iwjhwasdjbyzkfuxminftbrrdmtbqqlhxbit` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text COLLATE utf8mb3_unicode_ci,
  `traces` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nrgkwhykypwcmyuojxyrzjosmhpiorjgtpzj` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sourceId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb3_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_cvfivwtzahehpulsoddoikqicfovnlcparpu` (`creatorId`,`provisional`),
  KEY `idx_vtpvlusqkhctxmyymtnmcreznigitojfutxn` (`saved`),
  KEY `fk_awcutgqwxwymfkeiimxkmisrwstdquicwqij` (`sourceId`),
  CONSTRAINT `fk_awcutgqwxwymfkeiimxkmisrwstdquicwqij` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gtweotwkbjxzegsuzjrrcuhxfkztpkrvoxbu` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementindexsettings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gqqldnzldvyxawxlzkspkuuegftfjpjtxutz` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oqoyrjxxzjqdcbkbwtnrizmuzfhsxcwtdbdh` (`dateDeleted`),
  KEY `idx_zhksgqkmlvaloldcgawebwcfdugxlzbodfkc` (`fieldLayoutId`),
  KEY `idx_dtlwhntihdnsdwfpbplfzhwqzjtmhqyrsear` (`type`),
  KEY `idx_yyxsmeruplqivvhdnldhlbxdisqlbxvhyyvz` (`enabled`),
  KEY `idx_gzmlomhffchdgekqnhdwgaznykirqhimlcde` (`archived`,`dateCreated`),
  KEY `idx_loinktiyvlzjvvatcdinrrextvyuhuszbjil` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_upeaverprzzpqmljbsshjqprdxnftvvuvjmj` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_jifttrqqtkeadvffayzkmmmxccrerzmuodmr` (`canonicalId`),
  KEY `fk_orllullztlhcaxqvyndblotjcnkzcltlslzt` (`draftId`),
  KEY `fk_qaiekezacrlqkkkxgkrqfumpdxawbyeebqfx` (`revisionId`),
  CONSTRAINT `fk_jifttrqqtkeadvffayzkmmmxccrerzmuodmr` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_orllullztlhcaxqvyndblotjcnkzcltlslzt` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qaiekezacrlqkkkxgkrqfumpdxawbyeebqfx` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_txepbyojmjbsstunepdxtezsxokpeyrecvza` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_caefhnfjjogvurchmofezupwobgmklrlvdul` (`elementId`,`siteId`),
  KEY `idx_dbftxvpfzecxmnqnxzsfoqhhdkberijojcfs` (`siteId`),
  KEY `idx_byvkwpxzheufpmrwukmjiqpnmrmabbdjhjwz` (`slug`,`siteId`),
  KEY `idx_kourwrwcwjrtoirgpehhiowndhlcyfwoselr` (`enabled`),
  KEY `idx_donokawrouapmupsauvrscxcxbccuydhltcu` (`uri`,`siteId`),
  CONSTRAINT `fk_opdawknmmobsceiznrfrjsiltxmrrbsfplix` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ugacbkyxabmypxvysyuxvuysavjcpgjmttgo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uklcsxwaryhakereuapmbsqtrrytmasvsvtb` (`postDate`),
  KEY `idx_ontthowqetyblgokjeeqyffmbpqjwlwoqjlp` (`expiryDate`),
  KEY `idx_dzdssjhohrxppfewbmxckxgtwinvtsfciyoa` (`authorId`),
  KEY `idx_lokqzspdnbptmlyzkijqmmyhwwikqusstpyr` (`sectionId`),
  KEY `idx_whntssjdlwmatodqwjvkxlcfloawcetjnysi` (`typeId`),
  KEY `fk_tdvklrapbcjwpzmeydnkotwahxtahdxhbpsp` (`parentId`),
  CONSTRAINT `fk_mvnfpeypmbvmkacijqahfsuwkcsqupmotcvv` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tdvklrapbcjwpzmeydnkotwahxtahdxhbpsp` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_vzvxmegyieqxtyagklyqexmfsdopxwtbbatz` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yahtmncedrnmywqzgsflvqxxzpqbrrhlylyo` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zghbscpipioohwvwqpkexlkfddimxibshozf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8mb3_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dzjyboybcluwyggfasnnhyvvivfykfgrwypl` (`name`,`sectionId`),
  KEY `idx_piythuseqowesnrpnhdkwkjsgcqxftuptrlx` (`handle`,`sectionId`),
  KEY `idx_ueuucgfaprdmsgbksojtsquuibrxjykkxgbo` (`sectionId`),
  KEY `idx_pbcmdrlwcluqnqbcyspiotayfafaecydjhjv` (`fieldLayoutId`),
  KEY `idx_crwqhahjgfhhvzrzghfxtmndhajxrdkbqrij` (`dateDeleted`),
  CONSTRAINT `fk_boemofuiubeormdjpmvczujthxrcvlnjfbnv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ivpqnjdlskilaqqaxwbbvurxorrcfxhwnbwj` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expressforms_forms`
--

DROP TABLE IF EXISTS `expressforms_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressforms_forms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `color` varchar(20) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `submissionTitle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `saveSubmissions` tinyint(1) NOT NULL DEFAULT '1',
  `adminNotification` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `adminEmails` text COLLATE utf8mb3_unicode_ci,
  `submitterNotification` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `submitterEmailField` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `spamCount` int unsigned NOT NULL DEFAULT '0',
  `fields` mediumtext COLLATE utf8mb3_unicode_ci,
  `integrations` mediumtext COLLATE utf8mb3_unicode_ci,
  `sortOrder` int DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`),
  UNIQUE KEY `expressforms_forms_handle_unq_idx` (`handle`),
  KEY `expressforms_forms_sortOrder_idx` (`sortOrder`),
  KEY `expressforms_forms_fieldLayoutId_fk` (`fieldLayoutId`),
  CONSTRAINT `expressforms_forms_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expressforms_resource_fields`
--

DROP TABLE IF EXISTS `expressforms_resource_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressforms_resource_fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resourceId` int NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `settings` mediumtext COLLATE utf8mb3_unicode_ci,
  `category` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sortOrder` int NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `expressforms_resource_fields_resourceId_handle_category_unq_idx` (`resourceId`,`handle`,`category`),
  KEY `expressforms_resource_fields_sortOrder_idx` (`sortOrder`),
  CONSTRAINT `expressforms_resource_fields_resourceId_fk` FOREIGN KEY (`resourceId`) REFERENCES `expressforms_resources` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expressforms_resources`
--

DROP TABLE IF EXISTS `expressforms_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressforms_resources` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typeClass` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb3_unicode_ci,
  `sortOrder` int NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `expressforms_resources_typeClass_handle_unq_idx` (`typeClass`,`handle`),
  KEY `expressforms_resources_sortOrder_idx` (`sortOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `expressforms_submissions`
--

DROP TABLE IF EXISTS `expressforms_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expressforms_submissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `formId` int NOT NULL,
  `incrementalId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `expressforms_submissions_incrementalId_unq_idx` (`incrementalId`),
  KEY `expressforms_submissions_formId_fk` (`formId`),
  CONSTRAINT `expressforms_submissions_formId_fk` FOREIGN KEY (`formId`) REFERENCES `expressforms_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `expressforms_submissions_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_boxmkrjrocqgkfqfkttldwstjqltcfctlnxq` (`name`),
  KEY `idx_bxdtxvyjsscnmhhjdinorlndxlchlpqvclra` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gaflslipwzcmescdgxsdysogqihzwijwliwj` (`layoutId`,`fieldId`),
  KEY `idx_ktschqeqneyaumecznddwzhhocpceidxmcla` (`sortOrder`),
  KEY `idx_qatyxjcipxikqwzsrlfkmacifbddheuanafv` (`tabId`),
  KEY `idx_dtomhihtfnntdixodecmoaucghjgfznnnsuj` (`fieldId`),
  CONSTRAINT `fk_bmxrcdahqgahnkzwtckuymaaspemddbthyau` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nwedqidcntvdeveosxucfmliijobptyndnhy` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rwasgppscsberucsthdqrhsmniuloofmrcnb` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bvactqzwjvqatlbdqavydsmelagavvdtchzs` (`dateDeleted`),
  KEY `idx_sknnoofyqbmmevcxdoudbowxxqjuogynmzri` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `elements` text COLLATE utf8mb3_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rpuaerbtcjbnwmrptkgodurlgnkadfnmkeel` (`sortOrder`),
  KEY `idx_drkbkwvtnmcxoxuxxgysxpmepnnuoapdnrmb` (`layoutId`),
  CONSTRAINT `fk_slwqumvvakmvutcptgevfzipkwiblmfvtavp` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8mb3_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `instructions` text COLLATE utf8mb3_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8mb3_unicode_ci,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ntxogccspkvfhzswmfojbfelgsutyhpchlkb` (`handle`,`context`),
  KEY `idx_nbohoumovvuseqnsrssqrhtlqzlisvtvifis` (`groupId`),
  KEY `idx_ddpovhojwykeafhxwoeqnyembgrywcmjymvx` (`context`),
  CONSTRAINT `fk_ojjkgwzlxpfhienxqqwhsyhxptvgwqsxmbwi` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_agjdyqbmbxcpfwbootsbuxagemtoiuuoiycj` (`name`),
  KEY `idx_xcsldmzujjkclbcdrixcwfihjokkvfzetcts` (`handle`),
  KEY `idx_mmiyqvkhbmnmfvkbbytnawvtxdbhdrirsqga` (`fieldLayoutId`),
  KEY `idx_spuegihqmhewleuuqnioqheuxwcibdqaijma` (`sortOrder`),
  CONSTRAINT `fk_cnzeaymugnbgabnngnxuazaetenujyxuyvom` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_rgtfgbcwruiwzmtvwlgkzytrstydvcryxmhf` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `scope` text COLLATE utf8mb3_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ldxouxtuxbyhlcggqkohjkpjclccdfqbwgun` (`accessToken`),
  UNIQUE KEY `idx_qqpjpyrwtixnoxkkeeilwjarptpholzfmqvi` (`name`),
  KEY `fk_ylrwiqehrhmwlknfhxbhkemnygzdskrrphrq` (`schemaId`),
  CONSTRAINT `fk_ylrwiqehrhmwlknfhxbhkemnygzdskrrphrq` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `helplinks_sections`
--

DROP TABLE IF EXISTS `helplinks_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `helplinks_sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `heading` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `links` text COLLATE utf8mb3_unicode_ci,
  `position` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_apnseeezcnlazxksatawxzvhdzlfgchtrukr` (`heading`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8mb3_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8mb3_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `ownerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qptkaerrywgzhrzthdmtecoxgrmllkoejcpc` (`ownerId`),
  KEY `idx_nfwqxlqjotlnzfluwwtckkbnrpphuahdmelk` (`fieldId`),
  KEY `idx_syvhmdtwgysuidwglhihyjdltssqdyqkvazh` (`typeId`),
  KEY `idx_gxeaixdjcetkfbplbjobtrkxbpdlpugcaojb` (`sortOrder`),
  CONSTRAINT `fk_fnxktbugtwjbkmzmmmllgxdmydmivzehjsbv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hfqmdbuzwkttalzpxzugrdwiaambpiniydab` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uwrctbgqzazibpsxngisfyovonouvrdfkrsg` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zdtchwenxpbuhtemvgfgqkycffzsdokdrltp` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_asopnugahvvzqgxcnhgdhzszzclzlfbwwhjt` (`name`,`fieldId`),
  KEY `idx_phannypvaeheokcdaaknrwrzuiiawthpibjv` (`handle`,`fieldId`),
  KEY `idx_dfzoivqxhsahmjbyawihaznndirqekamovnr` (`fieldId`),
  KEY `idx_xllzcjahjbbqazxulasgiennjufcubpuiwoz` (`fieldLayoutId`),
  CONSTRAINT `fk_mkploxzwalvihplfaecpwcdunrrmjzfkhbcf` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pmxnqdzoxuqclunaqelgheifbxsygvkalwfb` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hmfulnoyeomwsuhsscezanqmcdnchptdrbgq` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vlvjtoihrfvdbmqzejgjfggdbgwqetdiwieg` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_isjtdjjbtzoqfxgnfpqwjdrlltrmmxfsvpyx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_fnpafbulkkcwqgeeviigkhxczdzaopxahkkm` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tfdytbxmrygyhebugfjpcjelxrbjwpryveav` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_pvhcilslctlhlocrjrtbcgurthnplvvmeupf` (`sourceId`),
  KEY `idx_zvyhdaednndkbposiqmrfhmyysvuryetyjuk` (`targetId`),
  KEY `idx_ewyimgwglgemptordkhsdhomkgixwgidyrvl` (`sourceSiteId`),
  CONSTRAINT `fk_binqygebebjmfxzvtgrvvvcusfqfwyqrycyy` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_shwhxxujevoayebhevuyqdbjnrrfsjvtrmxv` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yvwrezyllihwymlskkocosmbdioxlubnaonq` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sourceId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ankzvvowmdlpslxglvgtaytqejoskvlboeyc` (`sourceId`,`num`),
  KEY `fk_qgzqebgriwgxrakqlxzucmfggqhaloanhgof` (`creatorId`),
  CONSTRAINT `fk_ijekvbxfudswqanegigrmvhlzakmtirxhekr` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qgzqebgriwgxrakqlxzucmfggqhaloanhgof` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_jtbmurkxujljwekbiktulkfxsnxfpcnqzsng` (`keywords`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'end',
  `previewTargets` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iupncycelszwqiaoqlvjjyszwovafckjyxwi` (`handle`),
  KEY `idx_kofzsynranypsrqmzlaslrocliqpsocluzfo` (`name`),
  KEY `idx_aelzivwczzoelpuclimalvbddqtkagmrsugk` (`structureId`),
  KEY `idx_lwjmvfqayzirvezphhuucccyxrdjtynrqmqj` (`dateDeleted`),
  CONSTRAINT `fk_uetemrszonvvollzkrexuvjxxvvrcvgijecc` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8mb3_unicode_ci,
  `template` varchar(500) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_owmbsjxnbjsmtwixheilxihuelkimkucohlc` (`sectionId`,`siteId`),
  KEY `idx_yfpubbgebdindcybwhneyyuqxlgwkupjovbz` (`siteId`),
  CONSTRAINT `fk_nhqffteostuplkpcglzxvuyvqcibfhhbomrh` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qneyclzvmskxauxnfqikoddngmqpxkdckxbb` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yhouefqeiehzxphezknozqtnfrirrujnivov` (`uid`),
  KEY `idx_riwaspvmuayacaljxlkdnfalmghdvvfcnscf` (`token`),
  KEY `idx_lldetsfgcpxrneaaetohgpnvtxihrbckphqq` (`dateUpdated`),
  KEY `idx_qtbacvnrcdvkcxsaedqrkmmovmemxxuohsez` (`userId`),
  CONSTRAINT `fk_agvgtmqmxyyjqdfdlzjekewzontfxopjzdfa` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zdetbktouyhonvkzxauufbvqddbyfbyptxxw` (`userId`,`message`),
  CONSTRAINT `fk_ciwfaiktktthrzoadonyvfdjnwwkhszslaai` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_qlslmxhnxzvqeyvudabnupuwphpobtwwjtso` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vqualehegxfbflbqqawnohvbiygwmojdcehy` (`dateDeleted`),
  KEY `idx_majqwnxfkgzkiwqrrebemjwcvycqrlfrlcrw` (`handle`),
  KEY `idx_czjvrwcxrazzxgzyyunyxhuyaqrqvuhwsuxv` (`sortOrder`),
  KEY `fk_sksmbidavoindfuehtxuvkvtychqhnmvtmwn` (`groupId`),
  CONSTRAINT `fk_sksmbidavoindfuehtxuvkvtychqhnmvtmwn` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sprig_playgrounds`
--

DROP TABLE IF EXISTS `sprig_playgrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sprig_playgrounds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `component` text COLLATE utf8mb3_unicode_ci,
  `variables` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mgxmhfbdznxuaoovqbjyryxuwtfbhbcbyipj` (`structureId`,`elementId`),
  KEY `idx_odeinyncvjphthaxvlvyssbebexnbsculjwb` (`root`),
  KEY `idx_wpmnlafjoplovhnvosaqfyffuogvmnjsfexr` (`lft`),
  KEY `idx_rthumrkvktjtkcxxbmrcbmanisjvvwrjhowp` (`rgt`),
  KEY `idx_teejtywtxcknwrjseupmgbufimtmlxgnjzxd` (`level`),
  KEY `idx_azmohfdpulqtglsdsousjkyiuvpuxhficfag` (`elementId`),
  CONSTRAINT `fk_exxcpgvfbwtrnrnaxlrttvwtciubcstxiamf` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hfoosgmfimshutgiouamzrcvtccqsvrgjrfo` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ozqxiccsnxpckrzxnqvtwotowlmwropaxvzx` (`key`,`language`),
  KEY `idx_yypzzohacdonuymrheijfyrloftmjhtjulms` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_idclwhnhxfljtydfzgeexfzfwhwfokxnhspv` (`name`),
  KEY `idx_qoioltmfkscpyqahtjfjfdcerlkopggoczyk` (`handle`),
  KEY `idx_fuyqikbhxzvmihaokvjpfrlszbqtzcymxyrs` (`dateDeleted`),
  KEY `fk_bvegzvyvuodgnplwytgvwvwvqsmapfogjfjl` (`fieldLayoutId`),
  CONSTRAINT `fk_bvegzvyvuodgnplwytgvwvwvqsmapfogjfjl` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fwrpxjfmjjewbtzfushxoazwhsognvvlhmtw` (`groupId`),
  CONSTRAINT `fk_btfpnasdngaqbbhujkgksijurvhwfpvgrsyg` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tdooopxlkrlqvzfjqfqyjxsqrypfjcufuuyj` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cacheId` int NOT NULL,
  `elementId` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_glmqhowzwqwqmxmyogvyfwvcrglfcuncqzkh` (`cacheId`),
  KEY `idx_nlnjzcnnkahqfcsdtgoqutctrtutgfzkqksf` (`elementId`),
  CONSTRAINT `fk_cawagppssxqxjfepsqnlwexoqxedpuoejtbu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dtughbvychtlnuvjnuoacthqfcilcvuxvisy` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecachequeries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cacheId` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lbfrnzjmyxqbawhhdkjvfhglbboyigynayhm` (`cacheId`),
  KEY `idx_ejafhrtyibvcskntdsewiguinnggexdvopsp` (`type`),
  CONSTRAINT `fk_ilxtogzsodhnbfwxlujulvgvhtdwdsnnuquk` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecaches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siteId` int NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jgcywsltxvsihshewjauhbuuvwopmiswmgcq` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_zfqxfxfkvkrucbevzzwxxsctldsxsquuiquq` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_zscjyazdoegfzgjotvgcddavgtoumaefyfpm` (`siteId`),
  CONSTRAINT `fk_ovyeikmqxixnoxkvbfcjuesadolcgwugppuu` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8mb3_unicode_ci NOT NULL,
  `route` text COLLATE utf8mb3_unicode_ci,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wttolbuppbeyrtmdladegwaawjnrjbhsnwbi` (`token`),
  KEY `idx_tgkjgnlyivxnktkfysiffslfiwqiksfbjxnp` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb3_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tbrerzltfuzkmqbbmsjcyxegkviznuomlfoe` (`handle`),
  KEY `idx_urqwcaponashfctoowompewscookunpeczzo` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wevlpoyfxmnbzwfraxndmrxixumiaghlqcgh` (`groupId`,`userId`),
  KEY `idx_tujrkyidcozreivuezmxvrunpttrpgohkvoq` (`userId`),
  CONSTRAINT `fk_iasayxtzphwohpmngmccqeveerpzohzkqhqi` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ututwsbnosyztusrhgopegnqsbssqyrstgqj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dbepnygjnqifabfukwlikpwxfppezfjjzawn` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_varmefvqaxevfdutzrmjeuripgdcvontjqxy` (`permissionId`,`groupId`),
  KEY `idx_qgbsapeamhhbsxtdokralnytvysbuvywnmbs` (`groupId`),
  CONSTRAINT `fk_gylwhsqcrpbstrgrqbaojkknteakqbacegwo` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vzidaatwnowglhohfjjpovbebdqqgozrsrpn` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ymzjmrqvxzkxmppzwmskbvywuuftxmvyeylw` (`permissionId`,`userId`),
  KEY `idx_yxjdxpxzxqenqgloswrdwxjkkvrytexsfmbr` (`userId`),
  CONSTRAINT `fk_fjpzifskopohhmasmuwiekoivygleucjbstj` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tpapapdvmywwpbdirgcmtzclqzezawikzvum` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8mb3_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_pwiycxjqwqvppkktotvghxbwmrmdifrgnhko` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `username` varchar(100) COLLATE utf8mb3_unicode_ci NOT NULL,
  `photoId` int DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_thrdruxxvgtyttoqzwjbrrvwjfvwqhwrhuhm` (`uid`),
  KEY `idx_cqeoifbukyrifrmuswwqrjzofulgbgvlpkoz` (`verificationCode`),
  KEY `idx_neijjabgnzbvwlaozopaglbiyivsjvbsdvxs` (`email`),
  KEY `idx_ftdntrrasgqpvbxtlcbphhuoocsegrcharlb` (`username`),
  KEY `fk_gsjhanwfvdqdbfrgelaqkxcrrtfinlkedswv` (`photoId`),
  CONSTRAINT `fk_gsjhanwfvdqdbfrgelaqkxcrrtfinlkedswv` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ylugppiihvyzxptifrviloblbzkputagmtyl` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_izazabvygtkqjbefiygksonykxjdosubvkdr` (`name`,`parentId`,`volumeId`),
  KEY `idx_xicdeavdxchxoxzpjrpybopaohkvshrbyaqn` (`parentId`),
  KEY `idx_xgwnpayhuihnhzqlfskbeejzyynprllisbvz` (`volumeId`),
  CONSTRAINT `fk_aovvzzvglemkzdmbzmvxpblsdgcpiellqwql` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gfhvmrdldqslpzqgchulajslmvjoevtmyeej` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8mb3_unicode_ci,
  `settings` text COLLATE utf8mb3_unicode_ci,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ilenhkaumpdtmiizswooknkkddxwpjyvfgwu` (`name`),
  KEY `idx_veiyrwogmzqkcjaqvjwctjvcsnyabyzrbrjs` (`handle`),
  KEY `idx_ovyfymaenyivnxoalzuexihyxctpkjqkryxu` (`fieldLayoutId`),
  KEY `idx_pmvykgckvzjszfkefjkvbzmyrruespyfwdgn` (`dateDeleted`),
  CONSTRAINT `fk_gqrsrlurvlgeqrytvhttmprzrohxcyzbttys` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb3_unicode_ci NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text COLLATE utf8mb3_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ycfbkexzmpbynahcjmqpvmgspnrzuudcgggu` (`userId`),
  CONSTRAINT `fk_peqkhkuwzxdunpdrrtjtcloucxnzfxqvsnek` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-30  0:41:26
/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.9-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES
(1,1,1,NULL,'2024-10-30 05:14:46','2024-10-30 05:14:46','adc75126-b115-47e3-9c4c-d4c062b00321',NULL),
(2,2,1,'Live','2024-10-30 05:20:05','2024-10-30 05:24:00','fdc0498c-1e29-4d2f-8969-f538e6a5e7c5',NULL),
(3,3,1,'Live','2024-10-30 05:20:05','2024-10-30 05:20:05','b13607bb-6f3f-4932-9614-56f8b9ba88ea',NULL),
(4,4,1,'Live','2024-10-30 05:24:00','2024-10-30 05:24:00','538bc4bb-62b0-4abc-ab5d-30357fb93e91',NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES
(1,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2024-10-30 05:14:46','2024-10-30 05:14:46',NULL,NULL,'40a24f9f-7efa-4114-93d0-2bf821dec972'),
(2,NULL,NULL,NULL,1,'craft\\elements\\Entry',1,0,'2024-10-30 05:20:05','2024-10-30 05:24:00',NULL,NULL,'9685c6ed-8b54-4d4e-b45d-358e764a20fd'),
(3,2,NULL,1,1,'craft\\elements\\Entry',1,0,'2024-10-30 05:20:05','2024-10-30 05:20:05',NULL,NULL,'27393d06-c565-45f7-818a-68737181619c'),
(4,2,NULL,2,1,'craft\\elements\\Entry',1,0,'2024-10-30 05:24:00','2024-10-30 05:24:00',NULL,NULL,'fb15c639-e67c-456e-8910-cc08ddb705ea');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES
(1,1,1,NULL,NULL,1,'2024-10-30 05:14:46','2024-10-30 05:14:46','a0453efb-e078-40b5-ab59-7ca8c8577f0d'),
(2,2,1,'live','__home__',1,'2024-10-30 05:20:05','2024-10-30 05:20:05','d00c6d4c-4e9a-48d0-88e6-1115e63fa7df'),
(3,3,1,'live','__home__',1,'2024-10-30 05:20:05','2024-10-30 05:20:05','e0b924fc-c1b1-4c99-9492-95f5b3aed085'),
(4,4,1,'live','__home__',1,'2024-10-30 05:24:00','2024-10-30 05:24:00','f6a29212-04cc-4ac1-8c58-97bba4d23795');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES
(2,1,NULL,1,NULL,'2024-10-30 05:20:00',NULL,NULL,'2024-10-30 05:20:05','2024-10-30 05:20:05','014f2332-19c0-477a-868c-1b359022b65b'),
(3,1,NULL,1,NULL,'2024-10-30 05:20:00',NULL,NULL,'2024-10-30 05:20:05','2024-10-30 05:20:05','083bd71c-463d-43a9-ad98-78cc2a287178'),
(4,1,NULL,1,NULL,'2024-10-30 05:20:00',NULL,NULL,'2024-10-30 05:24:00','2024-10-30 05:24:00','8226df4c-71e4-446a-a304-9fb7b01eeacd');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES
(1,1,1,'Live','live',1,'site',NULL,'{section.name|raw}',1,'2024-10-30 05:20:05','2024-10-30 05:23:59',NULL,'afe859ab-a824-4cb6-b0d3-f5ac4875f6dc');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `expressforms_forms`
--

LOCK TABLES `expressforms_forms` WRITE;
/*!40000 ALTER TABLE `expressforms_forms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `expressforms_forms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `expressforms_resource_fields`
--

LOCK TABLES `expressforms_resource_fields` WRITE;
/*!40000 ALTER TABLE `expressforms_resource_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `expressforms_resource_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `expressforms_resources`
--

LOCK TABLES `expressforms_resources` WRITE;
/*!40000 ALTER TABLE `expressforms_resources` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `expressforms_resources` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `expressforms_submissions`
--

LOCK TABLES `expressforms_submissions` WRITE;
/*!40000 ALTER TABLE `expressforms_submissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `expressforms_submissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES
(1,'Common','2024-10-30 05:14:46','2024-10-30 05:14:46',NULL,'44b77bba-4e86-470a-b7a7-5e11e6d2c210');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES
(1,1,3,1,0,1,'2024-10-30 05:23:59','2024-10-30 05:23:59','f22b9c46-3741-49d3-b697-6e8c046dbe8e');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES
(1,'craft\\elements\\Entry','2024-10-30 05:20:05','2024-10-30 05:20:05',NULL,'276a6a9f-e002-4b30-9528-aca6a2f33404'),
(2,'craft\\elements\\Asset','2024-10-30 05:22:14','2024-10-30 05:22:14',NULL,'e095f873-f290-4a2e-bf25-e2f9c6a8a8ea');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES
(2,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null}]',1,'2024-10-30 05:22:14','2024-10-30 05:22:14','3f4211fa-77da-4201-b055-fb94327110e8'),
(3,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"width\":100,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"fieldUid\":\"e38b3013-2388-4553-8e5e-bdb2c7049481\"}]',1,'2024-10-30 05:23:59','2024-10-30 05:23:59','8e94e43d-af1b-4109-856f-8cfd7025d6af');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES
(1,1,'Images','images','global',NULL,'',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:9bdd7649-336f-4968-bee0-cc914c191f18\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:9bdd7649-336f-4968-bee0-cc914c191f18\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":[\"volume:9bdd7649-336f-4968-bee0-cc914c191f18\"],\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2024-10-30 05:23:06','2024-10-30 05:23:06','e38b3013-2388-4553-8e5e-bdb2c7049481'),
(2,1,'Page Content','pageContent','global','qmxkcsnd','',0,'none',NULL,'craft\\ckeditor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"columnType\":\"text\",\"defaultTransform\":\"\",\"initJs\":null,\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"removeEmptyTags\":false,\"removeInlineStyles\":false,\"removeNbsp\":false,\"showUnpermittedFiles\":\"\",\"showUnpermittedVolumes\":\"\"}','2024-10-30 05:27:08','2024-10-30 05:27:08','ff93bb62-24e0-4fe9-8f03-0c63b76fdffd');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `helplinks_sections`
--

LOCK TABLES `helplinks_sections` WRITE;
/*!40000 ALTER TABLE `helplinks_sections` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `helplinks_sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES
(1,'3.9.13','3.8.0.1',0,'ezghyynlnjqd','3@tgfbyszajb','2024-10-30 05:14:46','2024-10-30 05:39:26','39c3453e-9571-44ea-b4fe-da2bc5e21e10');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES
(1,'craft','Install','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','c0e473e2-0978-4290-b48f-325eea16b6bf'),
(2,'craft','m150403_183908_migrations_table_changes','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','2ad44284-7911-454e-8167-77051bb3dbe0'),
(3,'craft','m150403_184247_plugins_table_changes','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','5d83e596-32d1-4226-ad2f-4aedd06eba67'),
(4,'craft','m150403_184533_field_version','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','0f08a1d7-803f-468a-8ce1-9202fd28ec89'),
(5,'craft','m150403_184729_type_columns','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','ade19818-27ac-4de1-8b84-718b9dc91683'),
(6,'craft','m150403_185142_volumes','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','4e750555-7234-4752-9ff9-3714cdae954a'),
(7,'craft','m150428_231346_userpreferences','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','f8d95ce1-56da-4a9b-b5a9-3557b5d03828'),
(8,'craft','m150519_150900_fieldversion_conversion','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','f345e7f3-5a0f-4381-adf6-2ffeb6836cb8'),
(9,'craft','m150617_213829_update_email_settings','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','84cf5d81-f852-4fd5-b6ee-faa211cacb82'),
(10,'craft','m150721_124739_templatecachequeries','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','f9ba6740-d374-4588-b364-b48224f3db6d'),
(11,'craft','m150724_140822_adjust_quality_settings','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','c74bc184-854f-41e4-90d1-d450fe69ea38'),
(12,'craft','m150815_133521_last_login_attempt_ip','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','6ead21a0-c0bc-4102-8474-3aed21b53ba3'),
(13,'craft','m151002_095935_volume_cache_settings','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','0b0c25a9-c0aa-48b4-9102-d578efb14238'),
(14,'craft','m151005_142750_volume_s3_storage_settings','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','f5f58366-0d01-4481-9ff9-f58f8b762471'),
(15,'craft','m151016_133600_delete_asset_thumbnails','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','42e23e7c-0d9c-487d-a9a0-c9af7dab9425'),
(16,'craft','m151209_000000_move_logo','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','01711932-1835-4927-ba6d-452486132555'),
(17,'craft','m151211_000000_rename_fileId_to_assetId','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','87809a89-7573-413c-80b9-c2e8b19abfee'),
(18,'craft','m151215_000000_rename_asset_permissions','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','1a210b92-49b4-41b5-bc99-415824f237d4'),
(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','8094e363-1b85-481a-867d-16ff29e071a1'),
(20,'craft','m160708_185142_volume_hasUrls_setting','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','1c2909ca-b378-4225-8949-faafb1a5f9e0'),
(21,'craft','m160714_000000_increase_max_asset_filesize','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','97b8b3cf-955f-4464-93b0-54fe33c2a883'),
(22,'craft','m160727_194637_column_cleanup','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','dfc2db38-f936-44be-97ed-d7da444f8671'),
(23,'craft','m160804_110002_userphotos_to_assets','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','3833ab14-b27f-4eeb-88cd-eb06d821262e'),
(24,'craft','m160807_144858_sites','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','d8db2982-65bb-45c1-8478-d235c168168c'),
(25,'craft','m160829_000000_pending_user_content_cleanup','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','580459aa-f537-409c-9683-c1e564b28571'),
(26,'craft','m160830_000000_asset_index_uri_increase','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','10a7bd65-201f-4328-9518-476cbd7ac51e'),
(27,'craft','m160912_230520_require_entry_type_id','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','739728ee-e3c9-4d4b-bbdd-076ab7f12bf8'),
(28,'craft','m160913_134730_require_matrix_block_type_id','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','95276495-2109-4c20-bcd8-a1759566e752'),
(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','332a651f-9096-4075-a8ac-810a054e255e'),
(30,'craft','m160920_231045_usergroup_handle_title_unique','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','7f50fc23-04e8-477a-a72e-6277fad14bb5'),
(31,'craft','m160925_113941_route_uri_parts','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','c18bf54a-6af0-4b80-8f58-be5fcd78f0f5'),
(32,'craft','m161006_205918_schemaVersion_not_null','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','f0901de8-de0f-46fe-9a0b-86895aa14a1c'),
(33,'craft','m161007_130653_update_email_settings','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','c8a50dd7-d4fa-4b7b-937e-9c511b4647dc'),
(34,'craft','m161013_175052_newParentId','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','dfcbd7cf-9e8e-426e-9df7-025832a1037d'),
(35,'craft','m161021_102916_fix_recent_entries_widgets','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','9e259827-bb01-4c21-80fd-f7965e13a7ea'),
(36,'craft','m161021_182140_rename_get_help_widget','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','f18dbd0f-1dc0-42c6-825f-005cc7a88518'),
(37,'craft','m161025_000000_fix_char_columns','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','5c1e30f5-1db7-48d5-901e-37f7445b125e'),
(38,'craft','m161029_124145_email_message_languages','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','e1a46b82-acdd-45b0-9e3a-5f8b32450020'),
(39,'craft','m161108_000000_new_version_format','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','6dbad784-397f-43b5-a1ae-f7b3fa8f48c7'),
(40,'craft','m161109_000000_index_shuffle','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','8d772bc3-3246-48de-b8ce-a297a369846e'),
(41,'craft','m161122_185500_no_craft_app','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','084d9f72-e582-458f-8df7-be093fbccde3'),
(42,'craft','m161125_150752_clear_urlmanager_cache','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','bc036798-8674-4c96-ac9e-5b209d85fcf5'),
(43,'craft','m161220_000000_volumes_hasurl_notnull','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','4be4513f-85cb-4141-a0e6-1424da248136'),
(44,'craft','m170114_161144_udates_permission','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','78a20476-e79b-442d-ba8e-cea131b23cf5'),
(45,'craft','m170120_000000_schema_cleanup','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','060df25b-fe26-4c68-bc5e-b7c901127df9'),
(46,'craft','m170126_000000_assets_focal_point','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','9cdcfabf-9c3d-4e4f-bf10-a700ef888c2f'),
(47,'craft','m170206_142126_system_name','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','81fe293b-78f1-460d-ad26-429bc177f109'),
(48,'craft','m170217_044740_category_branch_limits','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','d6185754-cc07-4876-8f19-5dd1cf9e60cf'),
(49,'craft','m170217_120224_asset_indexing_columns','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','43712289-d5dd-4e5b-a954-727edf0f2a82'),
(50,'craft','m170223_224012_plain_text_settings','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','9f521ae9-0a57-47dd-8329-f6200b8b0854'),
(51,'craft','m170227_120814_focal_point_percentage','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','38eb0d4d-9574-4e48-9a79-5668a9f40f4f'),
(52,'craft','m170228_171113_system_messages','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','1e562452-7859-492a-9477-b8a491541438'),
(53,'craft','m170303_140500_asset_field_source_settings','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','ee7829a1-a81e-4c46-8035-8e36134b72cd'),
(54,'craft','m170306_150500_asset_temporary_uploads','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','8a4a5276-022b-44ac-842a-cc311560401e'),
(55,'craft','m170523_190652_element_field_layout_ids','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','6196eda4-374c-433a-af64-b8602c9c5500'),
(56,'craft','m170621_195237_format_plugin_handles','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','0e39e890-1620-48a6-8fd5-84da46d45c93'),
(57,'craft','m170630_161027_deprecation_line_nullable','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','7eda1a09-888d-4e3a-88a7-d4ef8973344d'),
(58,'craft','m170630_161028_deprecation_changes','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','936ec555-de9d-4ef0-9d3f-8fcd03ce2f27'),
(59,'craft','m170703_181539_plugins_table_tweaks','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','2f0a66f9-3105-4107-ae21-e3fdb533dfa2'),
(60,'craft','m170704_134916_sites_tables','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','5a1818f7-cd9d-42a8-9807-09774aca412c'),
(61,'craft','m170706_183216_rename_sequences','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','837db475-1c32-493a-8d02-91cd5afa46a0'),
(62,'craft','m170707_094758_delete_compiled_traits','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','ccc88347-5085-448c-ad0e-5cbc09c2970d'),
(63,'craft','m170731_190138_drop_asset_packagist','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','77b70e77-87ee-4607-b1ab-25cd53cc5c65'),
(64,'craft','m170810_201318_create_queue_table','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','84b24c3a-1df0-4f1e-8b59-5d117bf193c9'),
(65,'craft','m170903_192801_longblob_for_queue_jobs','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','8e78ce51-4ab0-46b2-b734-212662f01818'),
(66,'craft','m170914_204621_asset_cache_shuffle','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','be37b159-962e-4c20-a7a9-06bd289759eb'),
(67,'craft','m171011_214115_site_groups','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','1f6a50fe-1687-4b8c-8cab-f9769ae1659d'),
(68,'craft','m171012_151440_primary_site','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','cbaa4d9f-815f-4f1e-ac55-ea5fc299eca1'),
(69,'craft','m171013_142500_transform_interlace','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','22a6390c-2b90-4e1d-9336-d44f6ad0764f'),
(70,'craft','m171016_092553_drop_position_select','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','6628d5ab-f585-43d1-9545-8745bc6310db'),
(71,'craft','m171016_221244_less_strict_translation_method','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','bee74dc6-8d52-4e6c-a54a-f90feb43afc2'),
(72,'craft','m171107_000000_assign_group_permissions','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','d7338337-644d-45c9-9f9c-e0fddb1b1f27'),
(73,'craft','m171117_000001_templatecache_index_tune','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','ba9a3acc-45f8-4233-802d-763e20ffc154'),
(74,'craft','m171126_105927_disabled_plugins','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','1aaa73bc-64be-4c53-9d4a-112510a89f6b'),
(75,'craft','m171130_214407_craftidtokens_table','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','9e96da8a-bddd-4c55-b5fe-e034af125dee'),
(76,'craft','m171202_004225_update_email_settings','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','44a70351-974a-4c7c-8b41-1bbffc9c60dc'),
(77,'craft','m171204_000001_templatecache_index_tune_deux','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','da3fb691-e7f6-48d4-9860-251804e19899'),
(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','6f24f79b-41e2-4adb-867b-5ce51dc4045d'),
(79,'craft','m171218_143135_longtext_query_column','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','6c73d639-f2e6-465d-91a9-1acba97e7dee'),
(80,'craft','m171231_055546_environment_variables_to_aliases','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','6861b2a2-0248-486d-ba79-0f4a72b62e9f'),
(81,'craft','m180113_153740_drop_users_archived_column','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','62a03d4d-014f-4a5d-99bf-8d779add9226'),
(82,'craft','m180122_213433_propagate_entries_setting','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','6a3ed8f7-a342-48e3-8f1c-9f83babe143a'),
(83,'craft','m180124_230459_fix_propagate_entries_values','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','9fea557b-2f8d-4995-82d8-f4b5633e6a90'),
(84,'craft','m180128_235202_set_tag_slugs','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','0edc6164-b6e6-430a-b284-15df5d2409bc'),
(85,'craft','m180202_185551_fix_focal_points','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','593a3856-7ab3-4a61-8de3-8869ac0d3919'),
(86,'craft','m180217_172123_tiny_ints','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','cb92f170-dbaf-4bb2-a9ef-7f30cfda787b'),
(87,'craft','m180321_233505_small_ints','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','a2ec0bd5-0ca0-4ba9-8a0e-bad0bb49847f'),
(88,'craft','m180404_182320_edition_changes','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','7ecc8777-022d-4b37-a855-fee1f4be96cb'),
(89,'craft','m180411_102218_fix_db_routes','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','bf26a79d-eab2-4a26-abd5-e629181d4817'),
(90,'craft','m180416_205628_resourcepaths_table','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','76711896-58b2-4a4e-b27b-280bca2c0377'),
(91,'craft','m180418_205713_widget_cleanup','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','a1a65e54-6867-4158-a35e-0c3f6c060293'),
(92,'craft','m180425_203349_searchable_fields','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','716d82ef-b87c-44b0-9131-05a6d14f5217'),
(93,'craft','m180516_153000_uids_in_field_settings','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','e5c27c74-4cf6-44fb-bb8a-63d800e5f0f9'),
(94,'craft','m180517_173000_user_photo_volume_to_uid','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','e8396e10-33cd-4dae-9d5b-c04e292b6d4b'),
(95,'craft','m180518_173000_permissions_to_uid','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','01542f7a-8db9-4efe-a9b9-a56137169657'),
(96,'craft','m180520_173000_matrix_context_to_uids','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','a0c8a9f8-c312-4b54-b606-71b04997069e'),
(97,'craft','m180521_172900_project_config_table','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','47238884-5c45-4808-a08d-9ffc2d8abec7'),
(98,'craft','m180521_173000_initial_yml_and_snapshot','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','bab2ddde-8926-4bd9-bbdb-a8a3527dc165'),
(99,'craft','m180731_162030_soft_delete_sites','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','d4f275ff-7e36-4885-b722-394e527e0b2c'),
(100,'craft','m180810_214427_soft_delete_field_layouts','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','f6a92bb2-525d-4fd5-a26a-6b02fe5c9f0f'),
(101,'craft','m180810_214439_soft_delete_elements','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','bcc6dcf8-6f9a-49b8-8615-f417c6f1c436'),
(102,'craft','m180824_193422_case_sensitivity_fixes','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','157d3670-99a7-479b-9f7f-70f3cbf772ee'),
(103,'craft','m180901_151639_fix_matrixcontent_tables','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','7905d6df-d259-41d9-9627-802bd191a041'),
(104,'craft','m180904_112109_permission_changes','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','62c326c1-8a21-4f4e-8f59-45413b3cd5a5'),
(105,'craft','m180910_142030_soft_delete_sitegroups','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','597adcf6-97a0-4ab2-8a97-1da2adfcbde3'),
(106,'craft','m181011_160000_soft_delete_asset_support','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','c03d85b5-29e2-4e90-96a8-4d14f921a6f1'),
(107,'craft','m181016_183648_set_default_user_settings','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','a148fd89-f0d5-42e6-9291-ff2f0733b9ea'),
(108,'craft','m181017_225222_system_config_settings','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','8c270878-c6b2-4b2c-93d9-3d133c531f48'),
(109,'craft','m181018_222343_drop_userpermissions_from_config','2024-10-30 05:14:48','2024-10-30 05:14:48','2024-10-30 05:14:48','e5dd9d3a-9487-4853-9bc5-5dc9d1086274'),
(110,'craft','m181029_130000_add_transforms_routes_to_config','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','81b566c3-883a-46ea-b797-de99857a238b'),
(111,'craft','m181112_203955_sequences_table','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','b33e6bb7-04c7-42a3-a28d-030021f41deb'),
(112,'craft','m181121_001712_cleanup_field_configs','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','d2ef0bc8-661b-4bdb-a79a-f7438dc47da2'),
(113,'craft','m181128_193942_fix_project_config','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','ebd8089f-be5a-4559-95be-0abf0d84d746'),
(114,'craft','m181130_143040_fix_schema_version','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','fa0bc519-e6c3-42bb-a072-0ff05acb91aa'),
(115,'craft','m181211_143040_fix_entry_type_uids','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','26b3079e-483d-4ebb-9939-d16654fba7ea'),
(116,'craft','m181217_153000_fix_structure_uids','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','7864c97f-d43e-4cb7-be8e-629674556ae0'),
(117,'craft','m190104_152725_store_licensed_plugin_editions','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','22f3f0e2-cd48-4130-8918-75380a3bd5ff'),
(118,'craft','m190108_110000_cleanup_project_config','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','9ca7876e-20e5-47d6-97cc-00bffcd1811f'),
(119,'craft','m190108_113000_asset_field_setting_change','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','8ccd8072-3dde-4b08-b04d-97b62c91d86f'),
(120,'craft','m190109_172845_fix_colspan','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','5a036d9d-87a2-43e0-a746-895d08a568ff'),
(121,'craft','m190110_150000_prune_nonexisting_sites','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','113e0c22-f903-49c0-84c0-97f79834a38f'),
(122,'craft','m190110_214819_soft_delete_volumes','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','775b2768-bd79-4d3b-bfe7-b7933e5ff340'),
(123,'craft','m190112_124737_fix_user_settings','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','b04b7bf8-93cd-453c-87a0-a3268812b22e'),
(124,'craft','m190112_131225_fix_field_layouts','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','92ccd6ae-d555-439c-bcc7-53e9a9e06a7d'),
(125,'craft','m190112_201010_more_soft_deletes','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','e44bfe45-c766-4b68-b599-4578dfa023f8'),
(126,'craft','m190114_143000_more_asset_field_setting_changes','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','632ba572-aafd-4e65-8e6f-bca52926133f'),
(127,'craft','m190121_120000_rich_text_config_setting','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','87a192f1-7f6d-4663-8385-65ccacddcca7'),
(128,'craft','m190125_191628_fix_email_transport_password','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','fb2af349-73a7-40cb-b9fd-214c9f35149f'),
(129,'craft','m190128_181422_cleanup_volume_folders','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','33f57117-a737-415f-952d-d4f672480a3c'),
(130,'craft','m190205_140000_fix_asset_soft_delete_index','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','e5bbc811-9068-4658-b18c-6e25a280e027'),
(131,'craft','m190218_143000_element_index_settings_uid','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','ad094ace-1d5f-471f-93e5-e794f5ebb69e'),
(132,'craft','m190312_152740_element_revisions','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','20fa934e-1f2f-43ee-8e1a-f0664271ed7c'),
(133,'craft','m190327_235137_propagation_method','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','bfefa6ed-c7e7-422a-820f-c8f9abed701c'),
(134,'craft','m190401_223843_drop_old_indexes','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','7dc38058-294b-4d79-adf9-4bd40227a704'),
(135,'craft','m190416_014525_drop_unique_global_indexes','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','b2d1e186-7402-4e3a-b2f1-56034db29452'),
(136,'craft','m190417_085010_add_image_editor_permissions','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','c432035c-9ae5-481a-99fc-883c0cb757bb'),
(137,'craft','m190502_122019_store_default_user_group_uid','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','79e7c7e7-3154-4109-b94b-12582d1f2251'),
(138,'craft','m190504_150349_preview_targets','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','9d50d3b2-3ede-4f1b-aa3c-ac2411454824'),
(139,'craft','m190516_184711_job_progress_label','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','c6b3a987-3943-4a1a-917b-ce1d5a28325f'),
(140,'craft','m190523_190303_optional_revision_creators','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','40a03b9f-0636-4f2d-a2b2-f8942881839c'),
(141,'craft','m190529_204501_fix_duplicate_uids','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','6cc90789-e9cc-4ea8-8683-9da4a99ae8f8'),
(142,'craft','m190605_223807_unsaved_drafts','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','fa6ebfe8-1d3a-4eca-aa1a-a1e4cb7e9d90'),
(143,'craft','m190607_230042_entry_revision_error_tables','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','5d746923-b2fe-46a0-9844-032fc3750653'),
(144,'craft','m190608_033429_drop_elements_uid_idx','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','8880726d-79a2-4597-9a22-0c8c25abdf9a'),
(145,'craft','m190617_164400_add_gqlschemas_table','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','0be76e5f-fa30-4d84-8817-0ae435ee64bf'),
(146,'craft','m190624_234204_matrix_propagation_method','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','5994b462-ca67-456c-ade6-e85d8caa7d35'),
(147,'craft','m190711_153020_drop_snapshots','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','27143ae5-7296-4767-864b-e1d3dec02e90'),
(148,'craft','m190712_195914_no_draft_revisions','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','75525da4-7843-44ea-995f-46f58e06c242'),
(149,'craft','m190723_140314_fix_preview_targets_column','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','a9007555-5472-40c6-afab-393e57bfb3cd'),
(150,'craft','m190820_003519_flush_compiled_templates','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','8239d5d2-e03b-4b9d-9b8d-2d4e44e6f630'),
(151,'craft','m190823_020339_optional_draft_creators','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','df8be931-b867-4415-a922-c29ce984d588'),
(152,'craft','m190913_152146_update_preview_targets','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','66f95071-e637-4083-b77c-1cf97ed14b29'),
(153,'craft','m191107_122000_add_gql_project_config_support','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','fc7c0d53-0774-4b5f-bc7f-67106a7d366f'),
(154,'craft','m191204_085100_pack_savable_component_settings','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','e232133c-d41d-4f42-ba1d-1a9e26427729'),
(155,'craft','m191206_001148_change_tracking','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','45386e53-84ff-4849-8a42-8ffc4b013103'),
(156,'craft','m191216_191635_asset_upload_tracking','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','e094aef5-226c-4c92-8434-4ff540759f31'),
(157,'craft','m191222_002848_peer_asset_permissions','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','acff8782-042d-4dbd-b959-b26c854d9241'),
(158,'craft','m200127_172522_queue_channels','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','c55f5aa2-0571-4ae7-93fa-d881b4840078'),
(159,'craft','m200211_175048_truncate_element_query_cache','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','0624a4f2-3c7d-4232-83ce-1df3011f4d92'),
(160,'craft','m200213_172522_new_elements_index','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','7893212a-a226-4b83-925f-39db78021932'),
(161,'craft','m200228_195211_long_deprecation_messages','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','b16688d3-a663-420c-99c7-ec43552e5487'),
(162,'craft','m200306_054652_disabled_sites','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','f0e6a22c-c445-4d95-a0ed-6429776ed747'),
(163,'craft','m200522_191453_clear_template_caches','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','3813d204-fad1-4f77-8a4c-59e0ce6e80d6'),
(164,'craft','m200606_231117_migration_tracks','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','09deb803-e394-4f6e-81c3-f0910a891d89'),
(165,'craft','m200619_215137_title_translation_method','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','94da624d-4507-40a1-942b-6a8ef00a27fe'),
(166,'craft','m200620_005028_user_group_descriptions','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','1b141384-1a4d-4f10-8c94-50d5f86408f9'),
(167,'craft','m200620_230205_field_layout_changes','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','b834c3bc-d54a-4925-8a6f-8d37c8f97f57'),
(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','a26973d1-2f9a-4f72-9bb0-d1ac72a04fa9'),
(169,'craft','m200629_112700_remove_project_config_legacy_files','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','2f571b1f-19ca-49b7-a8ff-48b9f5c89cf1'),
(170,'craft','m200630_183000_drop_configmap','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','a022f5b4-24b1-4669-8a15-7c8825ae8f67'),
(171,'craft','m200715_113400_transform_index_error_flag','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','dd603677-0f4b-44b4-86b2-3def4f818648'),
(172,'craft','m200716_110900_replace_file_asset_permissions','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','0f816836-cd24-4bca-9489-788d943b616b'),
(173,'craft','m200716_153800_public_token_settings_in_project_config','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','2c7f262c-256e-4d2c-a575-8266f56f5d26'),
(174,'craft','m200720_175543_drop_unique_constraints','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','2b1daea3-4395-41d3-9695-5293f936ff0d'),
(175,'craft','m200825_051217_project_config_version','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','64e1b729-e689-48c1-b01b-646ea54bd765'),
(176,'craft','m201116_190500_asset_title_translation_method','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','03ac7aed-786f-44c0-87fe-f78a8eb098a5'),
(177,'craft','m201124_003555_plugin_trials','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','7febc48a-6315-436b-bb66-ccb3eef5126b'),
(178,'craft','m210209_135503_soft_delete_field_groups','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','5fcbd010-8638-4bef-ae86-2367f2485305'),
(179,'craft','m210212_223539_delete_invalid_drafts','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','aab65f5f-0f93-4aba-8174-ec2d26aa3a42'),
(180,'craft','m210214_202731_track_saved_drafts','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','91ad048e-5ade-416e-9550-70b1f7ed25a4'),
(181,'craft','m210223_150900_add_new_element_gql_schema_components','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','5e840467-2236-43e6-a28c-17e46e0676b5'),
(182,'craft','m210302_212318_canonical_elements','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','df9abee3-02b7-4537-9269-d7c6d15f1cf3'),
(183,'craft','m210326_132000_invalidate_projectconfig_cache','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','6b02c240-8d0b-40f4-ba5a-94af899aed59'),
(184,'craft','m210329_214847_field_column_suffixes','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','aa5a883d-8834-4672-a71a-620d4e8d7494'),
(185,'craft','m210331_220322_null_author','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','17379bcb-bd64-48aa-8cef-af0590dcd596'),
(186,'craft','m210405_231315_provisional_drafts','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','b21a24ff-0f94-4e21-8386-96eb4f236225'),
(187,'craft','m210602_111300_project_config_names_in_config','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','7fce225e-8348-448a-8f24-86b180b9ce88'),
(188,'craft','m210611_233510_default_placement_settings','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','03310446-ce5d-4a7e-b878-137372729bee'),
(189,'craft','m210613_145522_sortable_global_sets','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','4464a5f3-f619-4342-82ab-941a5916de06'),
(190,'craft','m210613_184103_announcements','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','81c50f6a-f4ac-4c66-be1f-0c90abe41861'),
(191,'craft','m210829_000000_element_index_tweak','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','ee0438e1-c27e-4b82-a438-2a56d4f71927'),
(192,'craft','m220209_095604_add_indexes','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','26ffeb86-f96a-4e6b-8a17-28e7347fded8'),
(193,'craft','m220214_000000_truncate_sessions','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','712af131-1974-42fa-9af4-5ec5c154c2d5'),
(194,'craft','m230221_185926_drop_element_fks','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','52e4cdcb-4ce2-4199-b7a4-a712184c9a5f'),
(195,'craft','m230226_013114_drop_plugin_license_columns','2024-10-30 05:14:49','2024-10-30 05:14:49','2024-10-30 05:14:49','e19d157a-4a68-4d3a-87fe-abe432f4365d'),
(196,'plugin:express-forms','Install','2024-10-30 05:18:39','2024-10-30 05:18:39','2024-10-30 05:18:39','351df504-b0f8-4405-b2f7-9da2296572eb'),
(197,'plugin:express-forms','m190417_182337_ChangeResourceFieldUniqueIndex','2024-10-30 05:18:39','2024-10-30 05:18:39','2024-10-30 05:18:39','f1983b5e-9cdc-4525-8c74-c8849950e561'),
(198,'plugin:sprig','Install','2024-10-30 05:18:57','2024-10-30 05:18:57','2024-10-30 05:18:57','0a7a3c53-4b45-4224-b2c4-9b17501a8c80'),
(199,'plugin:sprig','m201020_120000_add_playgrounds_table','2024-10-30 05:18:57','2024-10-30 05:18:57','2024-10-30 05:18:57','8ae94867-07a0-4e81-9a43-fb0789565432'),
(200,'plugin:redactor','m180430_204710_remove_old_plugins','2024-10-30 05:19:04','2024-10-30 05:19:04','2024-10-30 05:19:04','1e4ab17e-8158-4ca0-987e-935887b3542b'),
(201,'plugin:redactor','Install','2024-10-30 05:19:04','2024-10-30 05:19:04','2024-10-30 05:19:04','5389fa44-1ebc-4030-be0a-253d22152dc8'),
(202,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2024-10-30 05:19:04','2024-10-30 05:19:04','2024-10-30 05:19:04','92ed8913-78ae-4792-90e6-2128656d38f9'),
(203,'plugin:help-links','Install','2024-10-30 05:19:08','2024-10-30 05:19:08','2024-10-30 05:19:08','3c075b5a-d2b9-4845-88c4-7aaca9223d23'),
(204,'plugin:express-forms','m220919_071702_IncreaseIntegrationFieldSettingSize','2024-10-30 05:39:26','2024-10-30 05:39:26','2024-10-30 05:39:26','4211e16b-74fc-4621-8a9a-4a4e7fd0ac94');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES
(1,'ckeditor','1.5.0','1.0.0','2024-10-30 05:18:28','2024-10-30 05:18:28','2024-10-30 05:37:59','c7db92fd-71e3-4b1e-9946-2435866047fb'),
(2,'cheat-sheet','2.0.3','1.0.0','2024-10-30 05:18:33','2024-10-30 05:18:33','2024-10-30 05:18:33','ffd9b48a-69e2-4bf9-8240-3ad480e619e1'),
(3,'express-forms','1.1.4','1.0.2','2024-10-30 05:18:37','2024-10-30 05:18:37','2024-10-30 05:39:26','5ba59021-9aa5-45db-9782-1d697894376c'),
(4,'youtubeliveembed','1.0.8','1.0.9','2024-10-30 05:18:48','2024-10-30 05:18:48','2024-10-30 05:18:48','8bbfaa59-8923-46fd-81c0-85621b7c6d04'),
(5,'twigpack','1.2.18','1.0.0','2024-10-30 05:18:53','2024-10-30 05:18:53','2024-10-30 05:40:45','97c41419-eebd-4285-981e-a51ed826cd0e'),
(6,'sprig','1.13.0','1.0.1','2024-10-30 05:18:57','2024-10-30 05:18:57','2024-10-30 05:18:57','37fa6b9c-2d34-483c-9732-55cd70440b84'),
(7,'redactor','2.10.12','2.3.0','2024-10-30 05:19:04','2024-10-30 05:19:04','2024-10-30 05:40:10','c900454d-ed45-46f0-97de-4d79140befaf'),
(8,'help-links','1.0.9','1.0.0','2024-10-30 05:19:08','2024-10-30 05:19:08','2024-10-30 05:19:08','d28e8705-0699-412b-b83d-5a37d958b3d5');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES
('dateModified','1730266766'),
('email.fromEmail','\"jgreentreevin@gmail.com\"'),
('email.fromName','\"Church Online\"'),
('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.autocapitalize','true'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.autocomplete','false'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.autocorrect','true'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.class','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.disabled','false'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.id','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.instructions','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.label','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.max','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.min','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.name','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.orientation','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.placeholder','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.readonly','false'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.requirable','false'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.size','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.step','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.tip','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.title','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.warning','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.0.width','100'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.1.fieldUid','\"e38b3013-2388-4553-8e5e-bdb2c7049481\"'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.1.instructions','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.1.label','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.1.required','false'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.1.tip','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.1.warning','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.elements.1.width','100'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.name','\"Content\"'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.fieldLayouts.276a6a9f-e002-4b30-9528-aca6a2f33404.tabs.0.sortOrder','1'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.handle','\"live\"'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.hasTitleField','true'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.name','\"Live\"'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.section','\"f27f97d3-7d16-47cd-8f60-2e2115f89def\"'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.sortOrder','1'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.titleFormat','\"{section.name|raw}\"'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.titleTranslationKeyFormat','null'),
('entryTypes.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc.titleTranslationMethod','\"site\"'),
('fieldGroups.44b77bba-4e86-470a-b7a7-5e11e6d2c210.name','\"Common\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.columnSuffix','null'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.contentColumnType','\"string\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.fieldGroup','\"44b77bba-4e86-470a-b7a7-5e11e6d2c210\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.handle','\"images\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.instructions','\"\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.name','\"Images\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.searchable','false'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.allowedKinds.0','\"image\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.allowSelfRelations','false'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.allowUploads','true'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.defaultUploadLocationSource','\"volume:9bdd7649-336f-4968-bee0-cc914c191f18\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.defaultUploadLocationSubpath','\"\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.limit','\"\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.localizeRelations','false'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.previewMode','\"full\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.restrictFiles','\"1\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.selectionLabel','\"\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.showSiteMenu','false'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.showUnpermittedFiles','false'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.showUnpermittedVolumes','false'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.singleUploadLocationSource','\"volume:9bdd7649-336f-4968-bee0-cc914c191f18\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.singleUploadLocationSubpath','\"\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.source','null'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.sources.0','\"volume:9bdd7649-336f-4968-bee0-cc914c191f18\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.targetSiteId','null'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.useSingleFolder','false'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.validateRelatedElements','false'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.settings.viewMode','\"large\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.translationKeyFormat','null'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.translationMethod','\"site\"'),
('fields.e38b3013-2388-4553-8e5e-bdb2c7049481.type','\"craft\\\\fields\\\\Assets\"'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.columnSuffix','\"qmxkcsnd\"'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.contentColumnType','\"text\"'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.fieldGroup','\"44b77bba-4e86-470a-b7a7-5e11e6d2c210\"'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.handle','\"pageContent\"'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.instructions','\"\"'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.name','\"Page Content\"'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.searchable','false'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.settings.availableTransforms','\"*\"'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.settings.availableVolumes','\"*\"'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.settings.columnType','\"text\"'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.settings.defaultTransform','\"\"'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.settings.initJs','null'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.settings.purifierConfig','\"\"'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.settings.purifyHtml','\"1\"'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.settings.removeEmptyTags','false'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.settings.removeInlineStyles','false'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.settings.removeNbsp','false'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.settings.showUnpermittedFiles','\"\"'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.settings.showUnpermittedVolumes','\"\"'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.translationKeyFormat','null'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.translationMethod','\"none\"'),
('fields.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd.type','\"craft\\\\ckeditor\\\\Field\"'),
('meta.__names__.44b77bba-4e86-470a-b7a7-5e11e6d2c210','\"Common\"'),
('meta.__names__.5ac11c1a-4c54-4be3-b52e-a2b6ca22829b','\"Church Online\"'),
('meta.__names__.696178da-83aa-45ce-9014-21667762d6b8','\"Church Online\"'),
('meta.__names__.9bdd7649-336f-4968-bee0-cc914c191f18','\"Images\"'),
('meta.__names__.afe859ab-a824-4cb6-b0d3-f5ac4875f6dc','\"Live\"'),
('meta.__names__.e38b3013-2388-4553-8e5e-bdb2c7049481','\"Images\"'),
('meta.__names__.f27f97d3-7d16-47cd-8f60-2e2115f89def','\"Live\"'),
('meta.__names__.ff93bb62-24e0-4fe9-8f03-0c63b76fdffd','\"Page Content\"'),
('plugins.cheat-sheet.edition','\"standard\"'),
('plugins.cheat-sheet.enabled','true'),
('plugins.cheat-sheet.schemaVersion','\"1.0.0\"'),
('plugins.ckeditor.edition','\"standard\"'),
('plugins.ckeditor.enabled','true'),
('plugins.ckeditor.schemaVersion','\"1.0.0\"'),
('plugins.express-forms.edition','\"lite\"'),
('plugins.express-forms.enabled','true'),
('plugins.express-forms.schemaVersion','\"1.0.2\"'),
('plugins.help-links.edition','\"standard\"'),
('plugins.help-links.enabled','true'),
('plugins.help-links.schemaVersion','\"1.0.0\"'),
('plugins.redactor.edition','\"standard\"'),
('plugins.redactor.enabled','true'),
('plugins.redactor.schemaVersion','\"2.3.0\"'),
('plugins.sprig.edition','\"standard\"'),
('plugins.sprig.enabled','true'),
('plugins.sprig.schemaVersion','\"1.0.1\"'),
('plugins.twigpack.edition','\"standard\"'),
('plugins.twigpack.enabled','true'),
('plugins.twigpack.schemaVersion','\"1.0.0\"'),
('plugins.youtubeliveembed.edition','\"standard\"'),
('plugins.youtubeliveembed.enabled','true'),
('plugins.youtubeliveembed.schemaVersion','\"1.0.9\"'),
('sections.f27f97d3-7d16-47cd-8f60-2e2115f89def.defaultPlacement','\"end\"'),
('sections.f27f97d3-7d16-47cd-8f60-2e2115f89def.enableVersioning','true'),
('sections.f27f97d3-7d16-47cd-8f60-2e2115f89def.handle','\"live\"'),
('sections.f27f97d3-7d16-47cd-8f60-2e2115f89def.name','\"Live\"'),
('sections.f27f97d3-7d16-47cd-8f60-2e2115f89def.propagationMethod','\"all\"'),
('sections.f27f97d3-7d16-47cd-8f60-2e2115f89def.siteSettings.5ac11c1a-4c54-4be3-b52e-a2b6ca22829b.enabledByDefault','true'),
('sections.f27f97d3-7d16-47cd-8f60-2e2115f89def.siteSettings.5ac11c1a-4c54-4be3-b52e-a2b6ca22829b.hasUrls','true'),
('sections.f27f97d3-7d16-47cd-8f60-2e2115f89def.siteSettings.5ac11c1a-4c54-4be3-b52e-a2b6ca22829b.template','\"index.twig\"'),
('sections.f27f97d3-7d16-47cd-8f60-2e2115f89def.siteSettings.5ac11c1a-4c54-4be3-b52e-a2b6ca22829b.uriFormat','\"__home__\"'),
('sections.f27f97d3-7d16-47cd-8f60-2e2115f89def.type','\"single\"'),
('siteGroups.696178da-83aa-45ce-9014-21667762d6b8.name','\"Church Online\"'),
('sites.5ac11c1a-4c54-4be3-b52e-a2b6ca22829b.baseUrl','\"$PRIMARY_SITE_URL\"'),
('sites.5ac11c1a-4c54-4be3-b52e-a2b6ca22829b.handle','\"default\"'),
('sites.5ac11c1a-4c54-4be3-b52e-a2b6ca22829b.hasUrls','true'),
('sites.5ac11c1a-4c54-4be3-b52e-a2b6ca22829b.language','\"en-US\"'),
('sites.5ac11c1a-4c54-4be3-b52e-a2b6ca22829b.name','\"Church Online\"'),
('sites.5ac11c1a-4c54-4be3-b52e-a2b6ca22829b.primary','true'),
('sites.5ac11c1a-4c54-4be3-b52e-a2b6ca22829b.siteGroup','\"696178da-83aa-45ce-9014-21667762d6b8\"'),
('sites.5ac11c1a-4c54-4be3-b52e-a2b6ca22829b.sortOrder','1'),
('system.edition','\"solo\"'),
('system.live','true'),
('system.name','\"Church Online\"'),
('system.schemaVersion','\"3.8.0.1\"'),
('system.timeZone','\"America/Los_Angeles\"'),
('users.allowPublicRegistration','false'),
('users.defaultGroup','null'),
('users.photoSubpath','null'),
('users.photoVolumeUid','null'),
('users.requireEmailVerification','true'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.autocapitalize','true'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.autocomplete','false'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.autocorrect','true'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.class','null'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.disabled','false'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.id','null'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.instructions','null'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.label','null'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.max','null'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.min','null'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.name','null'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.orientation','null'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.placeholder','null'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.readonly','false'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.requirable','false'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.size','null'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.step','null'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.tip','null'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.title','null'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\AssetTitleField\"'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.warning','null'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.elements.0.width','100'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.name','\"Content\"'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.fieldLayouts.e095f873-f290-4a2e-bf25-e2f9c6a8a8ea.tabs.0.sortOrder','1'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.handle','\"images\"'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.hasUrls','true'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.name','\"Images\"'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.settings.path','\"@webroot/images/\"'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.sortOrder','1'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.titleTranslationKeyFormat','null'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.titleTranslationMethod','null'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.type','\"craft\\\\volumes\\\\Local\"'),
('volumes.9bdd7649-336f-4968-bee0-cc914c191f18.url','\"/images/\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES
(1,2,1,1,NULL),
(2,2,1,2,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES
(1,'username',0,1,' jaygreentree '),
(1,'firstname',0,1,''),
(1,'lastname',0,1,''),
(1,'fullname',0,1,''),
(1,'email',0,1,' jgreentreevin gmail com '),
(1,'slug',0,1,''),
(2,'slug',0,1,' live '),
(2,'title',0,1,' live ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES
(1,NULL,'Live','live','single',1,'all','end',NULL,'2024-10-30 05:20:05','2024-10-30 05:20:05',NULL,'f27f97d3-7d16-47cd-8f60-2e2115f89def');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES
(1,1,1,1,'__home__','index.twig',1,'2024-10-30 05:20:05','2024-10-30 05:20:05','4a55728e-b572-4ee4-8e78-14e7817b67f6');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES
(1,'Church Online','2024-10-30 05:14:46','2024-10-30 05:14:46',NULL,'696178da-83aa-45ce-9014-21667762d6b8');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES
(1,1,1,1,'Church Online','default','en-US',1,'$PRIMARY_SITE_URL',1,'2024-10-30 05:14:46','2024-10-30 05:14:46',NULL,'5ac11c1a-4c54-4be3-b52e-a2b6ca22829b');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sprig_playgrounds`
--

LOCK TABLES `sprig_playgrounds` WRITE;
/*!40000 ALTER TABLE `sprig_playgrounds` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sprig_playgrounds` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES
(1,'{\"language\":\"en-US\"}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES
(1,'jaygreentree',NULL,NULL,NULL,'jgreentreevin@gmail.com','$2y$13$w.RBOLzsxmaB.Ln4I3tqdep4WY95cKfmiPo6lmuXB9TXu8z.y.cJK',1,0,0,0,'2024-10-30 05:18:00',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2024-10-30 05:14:47','2024-10-30 05:14:47','2024-10-30 05:18:00','1eb19b04-46f4-4bdb-b754-b65e84fcc348');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES
(1,NULL,1,'Images','','2024-10-30 05:22:14','2024-10-30 05:22:14','6c5e4c6e-21fc-49fb-a89e-c9727b9d9ac9');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES
(1,2,'Images','images','craft\\volumes\\Local',1,'/images/','site',NULL,'{\"path\":\"@webroot\\/images\\/\"}',1,'2024-10-30 05:22:14','2024-10-30 05:22:14',NULL,'9bdd7649-336f-4968-bee0-cc914c191f18');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES
(1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2024-10-30 05:18:00','2024-10-30 05:18:00','c0b7f4bb-0de7-418f-aabb-3a5ea5238260'),
(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2024-10-30 05:18:00','2024-10-30 05:18:00','7ed79bc5-a632-4cfc-b65b-0d0ddc83b415'),
(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2024-10-30 05:18:00','2024-10-30 05:18:00','d9866fe9-19ca-45fd-9374-c9b0857491bf'),
(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2024-10-30 05:18:00','2024-10-30 05:18:00','195625dd-1bb8-4323-8169-39aec1d2ed78');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-30  0:41:26
