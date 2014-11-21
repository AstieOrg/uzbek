-- MySQL dump 10.14  Distrib 5.5.29-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: db_api
-- ------------------------------------------------------
-- Server version	5.5.29-MariaDB-log

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
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `activityId` int(11) NOT NULL,
  `activityDesc` text NOT NULL,
  `source` varchar(20) NOT NULL,
  `datetimes` datetime NOT NULL,
  `n_status` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

LOCK TABLES `activity_log` WRITE;
/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_member`
--

DROP TABLE IF EXISTS `admin_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_member` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(46) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(46) DEFAULT NULL,
  `salt` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `n_status` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_member`
--

LOCK TABLES `admin_member` WRITE;
/*!40000 ALTER TABLE `admin_member` DISABLE KEYS */;
INSERT INTO `admin_member` VALUES (1,'admin','admin','admin@example.com','2014-08-08 05:56:36','admin','codekir v3.0','b2e982d12c95911b6abeacad24e256ff3fa47fdb',1);
/*!40000 ALTER TABLE `admin_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_category`
--

DROP TABLE IF EXISTS `api_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(200) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `relation` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `n_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_category`
--

LOCK TABLES `api_category` WRITE;
/*!40000 ALTER TABLE `api_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_lang`
--

DROP TABLE IF EXISTS `api_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_lang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_lang`
--

LOCK TABLES `api_lang` WRITE;
/*!40000 ALTER TABLE `api_lang` DISABLE KEYS */;
INSERT INTO `api_lang` VALUES (1,'Indonesia'),(2,'Inggris'),(3,'Rusia');
/*!40000 ALTER TABLE `api_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_member_interest`
--

DROP TABLE IF EXISTS `api_member_interest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_member_interest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `date_join` varchar(300) NOT NULL,
  `n_status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_member_interest`
--

LOCK TABLES `api_member_interest` WRITE;
/*!40000 ALTER TABLE `api_member_interest` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_member_interest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_menu_list`
--

DROP TABLE IF EXISTS `api_menu_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_menu_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nm_bhs` varchar(100) NOT NULL,
  `nm_eng` varchar(100) NOT NULL,
  `nm_rus` varchar(100) NOT NULL,
  `menu_type` int(11) NOT NULL,
  `menu_stat` int(11) DEFAULT NULL,
  `id_parent` int(11) DEFAULT NULL,
  `child_stat` int(11) DEFAULT NULL,
  `pos` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `author_id` varchar(100) NOT NULL,
  `stats` int(11) NOT NULL,
  `n_stats` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `id_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='List of the menu in the web.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_menu_list`
--

LOCK TABLES `api_menu_list` WRITE;
/*!40000 ALTER TABLE `api_menu_list` DISABLE KEYS */;
INSERT INTO `api_menu_list` VALUES (1,'aaa','aaa','aaa',0,0,NULL,NULL,0,'0000-00-00','',0,0),(2,'A','A','A',1,0,NULL,NULL,0,'2014-11-25','',0,0),(3,'cc','cc','cc',0,0,NULL,NULL,0,'2014-11-20','',0,0),(4,'1','1','1',1,1,1,1,0,'2014-11-21','astie',1,0),(5,'lalalaaaa','A','aaaaaa',0,0,NULL,NULL,0,'2014-11-21','',1,0),(9,'Profile','Profile','Hause',0,1,1,NULL,1,'2014-11-01','',0,0),(11,'','','',0,0,0,NULL,0,'0000-00-00','',0,0);
/*!40000 ALTER TABLE `api_menu_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_news_category`
--

DROP TABLE IF EXISTS `api_news_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_news_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `catName` varchar(100) DEFAULT NULL,
  `n_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_news_category`
--

LOCK TABLES `api_news_category` WRITE;
/*!40000 ALTER TABLE `api_news_category` DISABLE KEYS */;
INSERT INTO `api_news_category` VALUES (1,'Artikel',1),(2,'Agenda',1),(3,'Tentang',1),(4,'Afiliasi',1),(5,'Kepakaran',1),(6,'Buah Pikir',1),(7,'Perundangan',1),(8,'Repositori',1),(9,'Gallery',1);
/*!40000 ALTER TABLE `api_news_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_news_content`
--

DROP TABLE IF EXISTS `api_news_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_news_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) NOT NULL,
  `lid` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `brief` text NOT NULL,
  `content` text NOT NULL,
  `image` varchar(200) NOT NULL,
  `thumbnail_image` varchar(200) NOT NULL,
  `slider_image` varchar(200) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `articleType` int(11) NOT NULL COMMENT '1:news,2:profil,3:publikasi',
  `url` varchar(200) NOT NULL,
  `sourceurl` varchar(100) NOT NULL,
  `file` varchar(200) NOT NULL,
  `created_date` datetime NOT NULL,
  `expired_date` datetime NOT NULL,
  `posted_date` datetime NOT NULL,
  `fromwho` int(11) NOT NULL DEFAULT '0' COMMENT '0:web or admin ;1:user ;2:pages',
  `filesize` int(11) NOT NULL,
  `can_save` int(11) NOT NULL,
  `tags` text NOT NULL COMMENT 'format serialize tags',
  `authorid` int(11) NOT NULL,
  `n_status` int(11) NOT NULL DEFAULT '0',
  `topcontent` int(11) NOT NULL DEFAULT '0' COMMENT '0;standart;1:featured;2:review;3:interview',
  `lang_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `categoryid` (`categoryid`),
  KEY `created_date` (`created_date`),
  KEY `posted_date` (`posted_date`),
  KEY `n_status` (`n_status`),
  KEY `articleTypeID` (`articleType`),
  KEY `image` (`image`),
  KEY `parentID` (`parentid`),
  KEY `lid` (`lid`),
  KEY `online` (`fromwho`),
  KEY `expired_date` (`expired_date`),
  KEY `url` (`url`),
  KEY `aid` (`authorid`),
  KEY `file` (`file`),
  KEY `slider_image` (`slider_image`),
  KEY `sourceurl` (`filesize`),
  KEY `thumbnail_image` (`thumbnail_image`),
  KEY `topcontent` (`topcontent`),
  KEY `sourceurl_2` (`sourceurl`),
  KEY `can_save` (`can_save`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_news_content`
--

LOCK TABLES `api_news_content` WRITE;
/*!40000 ALTER TABLE `api_news_content` DISABLE KEYS */;
INSERT INTO `api_news_content` VALUES (1,0,0,'test','ada','adsaas','','','',0,0,'','','','2014-09-10 08:51:49','0000-00-00 00:00:00','2014-09-03 00:00:00',0,0,0,'',1,1,0,0),(2,0,0,'test','csacsaa','cascsacsa','','','',0,0,'','','','2014-10-02 12:02:40','0000-00-00 00:00:00','2014-10-01 00:00:00',0,0,0,'',1,1,0,0),(3,0,0,'','','&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;        &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;        &lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;','0e4974e00ab53caf3704aadd18f4dd98.png','','',3,1,'','','http://localhost/API/public_assets/news/0e4974e00ab53caf3704aadd18f4dd98.png','2014-10-15 11:39:51','0000-00-00 00:00:00','2014-11-17 16:35:46',0,0,0,'',1,1,0,0),(4,0,0,'','','&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/p&gt;','','','',3,2,'','','','2014-10-15 11:50:13','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'',1,1,0,0),(5,0,0,'artikel 1','tess','&lt;p class=&quot;text-justify&quot;&gt;                Integer nibh orci, elementum quis adipiscing non, tristique ut risus. Cras elementum, nunc vel egestas tincidunt, magna sem tristique dolor, vel molestie enim nibh non lectus. Aliquam lacinia ipsum ut risus dapibus ullamcorper congue risus feugiat. Praesent venenatis nibh id est egestas sagittis. Maecenas euismod diam id justo tempus a volutpat velit pretium. Duis enim quam, fringilla in dignissim eu, mattis in lectus. Maecenas rutrum turpis sed elit Integer nibh orci, elementum quis adipiscing non, tristique ut risus.            &lt;/p&gt;','','','',1,1,'','','http://localhost/API/','2014-10-15 11:54:26','0000-00-00 00:00:00','2014-10-15 00:00:00',0,0,0,'',1,1,0,0),(6,0,0,'betita','csaasas','csacacas','','','',1,1,'','','','2014-10-15 12:01:33','0000-00-00 00:00:00','2014-10-15 00:00:00',0,0,0,'',1,1,0,0),(7,0,0,'kliping','csasa','csacsacas','','','',1,2,'','','','2014-10-15 12:02:08','0000-00-00 00:00:00','2014-10-15 00:00:00',0,0,0,'',1,1,0,0),(8,0,0,'tes agenda','','','','','',2,0,'','','','2014-10-15 12:12:47','2014-10-22 11:10:00','2014-10-15 11:10:00',0,0,0,'',1,1,0,0),(9,0,0,'agenda 1','','','','','',2,0,'','','','2014-10-15 13:16:49','2014-10-05 12:15:00','2014-10-02 12:15:00',0,0,0,'',1,1,0,0),(10,0,0,'','','','','','',0,0,'','','','2014-11-20 20:45:43','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'',0,0,0,0),(11,0,0,'','','','','','',0,0,'','','','2014-11-20 20:48:45','0000-00-00 00:00:00','0000-00-00 00:00:00',0,0,0,'',0,0,0,0),(12,1,0,'','aaa','llalallalal','753bd1989fccfee6f61b84492a82de60.png','','',1,0,'','','http://localhost/uzbek/public_assets/news/753bd1989fccfee6f61b84492a82de60.png','2014-11-21 14:48:37','0000-00-00 00:00:00','2014-11-18 00:00:00',0,0,0,'',1,0,0,2);
/*!40000 ALTER TABLE `api_news_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_news_content_comment`
--

DROP TABLE IF EXISTS `api_news_content_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_news_content_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `contentid` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `n_status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `date` (`date`),
  KEY `userid` (`userid`),
  KEY `contentid` (`contentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_news_content_comment`
--

LOCK TABLES `api_news_content_comment` WRITE;
/*!40000 ALTER TABLE `api_news_content_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_news_content_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_news_content_repo`
--

DROP TABLE IF EXISTS `api_news_content_repo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_news_content_repo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `brief` text NOT NULL,
  `content` text NOT NULL,
  `typealbum` int(11) NOT NULL COMMENT '1:song;2:images;3:video',
  `gallerytype` int(11) NOT NULL COMMENT '0:content,1:contest',
  `files` varchar(200) NOT NULL COMMENT 'can be image or song',
  `thumbnail` varchar(200) NOT NULL,
  `fromwho` int(11) NOT NULL COMMENT '0;admin;1:user;2:pages',
  `otherid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `langType` int(11) NOT NULL DEFAULT '0',
  `langTitle` varchar(100) DEFAULT NULL,
  `langDesc` varchar(300) DEFAULT NULL,
  `n_status` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `otherid` (`otherid`),
  KEY `IDX_typeAlbum` (`typealbum`),
  KEY `IDX_Album_ID` (`gallerytype`),
  KEY `IDX_FROM_WHO` (`fromwho`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_news_content_repo`
--

LOCK TABLES `api_news_content_repo` WRITE;
/*!40000 ALTER TABLE `api_news_content_repo` DISABLE KEYS */;
INSERT INTO `api_news_content_repo` VALUES (1,'dadsadsa','xsaaac','ascas',0,0,'','',0,1,0,'0000-00-00 00:00:00',1,NULL,NULL,0),(2,'dadsadsa','xsaaac','ascas',0,0,'','',0,1,0,'0000-00-00 00:00:00',2,NULL,NULL,0),(3,'dadsadsa','xsaaac','ascas',0,0,'','',0,1,0,'0000-00-00 00:00:00',3,NULL,NULL,0);
/*!40000 ALTER TABLE `api_news_content_repo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_riwayat_pendidikan`
--

DROP TABLE IF EXISTS `api_riwayat_pendidikan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_riwayat_pendidikan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL DEFAULT '0',
  `tahun` varchar(4) DEFAULT NULL,
  `judul` varchar(200) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0:mtkuliah, 1:publikasi, 2:pekerjaan',
  `keterangan` varchar(300) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `n_status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_riwayat_pendidikan`
--

LOCK TABLES `api_riwayat_pendidikan` WRITE;
/*!40000 ALTER TABLE `api_riwayat_pendidikan` DISABLE KEYS */;
INSERT INTO `api_riwayat_pendidikan` VALUES (1,10049,'2131','sacsa',0,'csac','2014-11-17 12:47:35',0),(2,10049,'2131','csac',0,'ascas','2014-11-17 12:47:35',0),(3,10049,'2131','csaca',0,'csaca','2014-11-17 12:47:35',0),(4,10049,'2131','cas',1,'csaca','2014-11-17 12:47:35',0),(5,10049,'2131','asc',1,'csa','2014-11-17 12:47:35',0),(6,10049,'2131','cac',1,'casc','2014-11-17 12:47:35',0),(7,10049,'2131','csaca',2,'csac','2014-11-17 12:47:35',0),(8,10049,'2131','asc',2,'csa','2014-11-17 12:47:35',0),(9,10049,'2131','csac',2,'casc','2014-11-17 12:47:35',0),(10,10050,'','',0,'','2014-11-17 16:44:47',0),(11,10050,'','',0,'','2014-11-17 16:44:47',0),(12,10050,'','',0,'','2014-11-17 16:44:47',0),(13,10050,'','',1,'','2014-11-17 16:44:47',0),(14,10050,'','',1,'','2014-11-17 16:44:47',0),(15,10050,'','',1,'','2014-11-17 16:44:47',0),(16,10050,'','',2,'','2014-11-17 16:44:47',0),(17,10050,'','',2,'','2014-11-17 16:44:47',0),(18,10050,'','',2,'','2014-11-17 16:44:47',0),(19,10050,'','',0,'','2014-11-17 16:44:55',0),(20,10050,'','',0,'','2014-11-17 16:44:55',0),(21,10050,'','',0,'','2014-11-17 16:44:55',0),(22,10050,'','',1,'','2014-11-17 16:44:55',0),(23,10050,'','',1,'','2014-11-17 16:44:55',0),(24,10050,'','',1,'','2014-11-17 16:44:55',0),(25,10050,'','',2,'','2014-11-17 16:44:55',0),(26,10050,'','',2,'','2014-11-17 16:44:55',0),(27,10050,'','',2,'','2014-11-17 16:44:55',0),(28,10050,'','',0,'','2014-11-17 16:45:09',0),(29,10050,'','',0,'','2014-11-17 16:45:09',0),(30,10050,'','',0,'','2014-11-17 16:45:09',0),(31,10050,'','',1,'','2014-11-17 16:45:09',0),(32,10050,'','',1,'','2014-11-17 16:45:09',0),(33,10050,'','',1,'','2014-11-17 16:45:09',0),(34,10050,'','',2,'','2014-11-17 16:45:09',0),(35,10050,'','',2,'','2014-11-17 16:45:09',0),(36,10050,'','',2,'','2014-11-17 16:45:09',0);
/*!40000 ALTER TABLE `api_riwayat_pendidikan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_member`
--

DROP TABLE IF EXISTS `social_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_member` (
  `id` int(15) NOT NULL AUTO_INCREMENT,
  `nip` varchar(20) DEFAULT NULL,
  `name` varchar(46) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `verified_date` datetime NOT NULL,
  `img` varchar(200) DEFAULT NULL COMMENT 'GIID Image',
  `image_profile` varchar(200) NOT NULL,
  `small_img` varchar(200) DEFAULT NULL,
  `username` varchar(46) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `zipcode` int(10) NOT NULL,
  `sex` varchar(11) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `description` text,
  `middle_name` varchar(46) DEFAULT NULL,
  `last_name` varchar(46) DEFAULT NULL,
  `StreetName` varchar(150) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `pendidikan` varchar(20) DEFAULT NULL,
  `kepakaran` varchar(100) DEFAULT NULL,
  `alamatKantor` varchar(300) DEFAULT NULL,
  `tlpKantor` varchar(20) DEFAULT NULL,
  `keberhasilan` varchar(300) DEFAULT NULL,
  `n_status` int(3) NOT NULL DEFAULT '0' COMMENT ' pending , approved, verified, rejected , deleted ( 7 day ), deactivated ( kill my self )',
  `login_count` int(11) NOT NULL DEFAULT '0',
  `verified` tinyint(3) DEFAULT '0' COMMENT '0->no hp blm verified, 1->sudah verified.',
  `usertype` int(11) NOT NULL COMMENT '0:online;1:offline;2;existing',
  `email_token` varchar(50) DEFAULT NULL,
  `photo_moderation` int(11) NOT NULL,
  `salt` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10051 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_member`
--

LOCK TABLES `social_member` WRITE;
/*!40000 ALTER TABLE `social_member` DISABLE KEYS */;
INSERT INTO `social_member` VALUES (10043,NULL,'ovan',NULL,'ovan89@gmail.com','2014-07-16 07:53:04','0000-00-00 00:00:00',NULL,'',NULL,'admin',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,NULL,0,'codekir v3.0','b2e982d12c95911b6abeacad24e256ff3fa47fdb'),(10044,NULL,NULL,NULL,'cscasa','0000-00-00 00:00:00','0000-00-00 00:00:00',NULL,'',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'',0,'','b29ae6a39d92d241eb88425f0e249a8234ff3b59'),(10045,NULL,NULL,NULL,'ncjanca','2014-11-17 03:55:48','0000-00-00 00:00:00',NULL,'',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'3msajw73cieyn2ysyadi24',0,'ovancop1234','57067623e9f334a4842682a961add9bd2141da1a'),(10046,'csaca','cascsa',NULL,'nckncaknca','2014-11-17 04:08:37','0000-00-00 00:00:00',NULL,'',NULL,NULL,NULL,NULL,0,NULL,'0000-00-00',NULL,NULL,NULL,'csacasc','ascasc','cacsa','csacas','acasca','csaca',NULL,0,0,0,1,'weda23yimiys3acs27nj4y',0,'ovancop1234','146b958573c7b78f11130abbb00c6f06085b9b86'),(10047,NULL,NULL,NULL,'cacsacas','2014-11-17 05:43:26','0000-00-00 00:00:00',NULL,'',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'37ya2iywssi24jmed3yacn',0,'ovancop1234','db08ac19c565b170d167744edc204c751d0303ee'),(10048,NULL,NULL,NULL,'csaacacascas','2014-11-17 05:44:35','0000-00-00 00:00:00',NULL,'',NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,1,'a3wjes4sacmi27ny23diyy',0,'ovancop1234','7919565b4c17dcc9382bb52e8ad837aba2ba21f6'),(10049,'csacsa','csacsa',NULL,'csakmck','2014-11-17 05:45:56','0000-00-00 00:00:00',NULL,'',NULL,NULL,NULL,NULL,0,NULL,'0000-00-00',NULL,NULL,NULL,'csasc','csacas','cacas','cacacsa','cascsa','csaca','csacsaca',0,0,0,1,'csi2i2yae3n3y4swm7adyj',0,'ovancop1234','a4fed6a6a8cdbdb1d94317d1b3f9ef58149fe8c1'),(10050,'','',NULL,'','2014-11-17 09:40:35','0000-00-00 00:00:00',NULL,'',NULL,NULL,NULL,NULL,0,NULL,'0000-00-00',NULL,NULL,NULL,'','','','','','',NULL,0,0,0,1,'es3ay23j7yy42wasiindmc',0,'ovancop1234','d822cc6212695ea7b831e481159f7acae42a5877');
/*!40000 ALTER TABLE `social_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-22  4:15:42
