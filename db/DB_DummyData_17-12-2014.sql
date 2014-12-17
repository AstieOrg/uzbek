-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 17, 2014 at 06:08 AM
-- Server version: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ft2_uzbek`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE IF NOT EXISTS `activity_log` (
`id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `activityId` int(11) NOT NULL,
  `activityDesc` text NOT NULL,
  `source` varchar(20) NOT NULL,
  `datetimes` datetime NOT NULL,
  `n_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_member`
--

CREATE TABLE IF NOT EXISTS `admin_member` (
`id` int(15) NOT NULL,
  `name` varchar(46) DEFAULT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `register_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(46) DEFAULT NULL,
  `salt` varchar(200) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `n_status` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `admin_member`
--

INSERT INTO `admin_member` (`id`, `name`, `nickname`, `email`, `register_date`, `username`, `salt`, `password`, `n_status`) VALUES
(1, 'admin', 'admin', 'admin@example.com', '2014-08-07 22:56:36', 'admin', 'codekir v3.0', '9aca4c40eb8dbacd4eaf953055d770acd1c815e8', 1);

-- --------------------------------------------------------

--
-- Table structure for table `uzbemb_banner`
--

CREATE TABLE IF NOT EXISTS `uzbemb_banner` (
`id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `posted_date` date NOT NULL,
  `expired_date` date DEFAULT NULL,
  `langid` tinyint(4) NOT NULL,
  `author_id` tinyint(4) DEFAULT NULL,
  `title_bhs` varchar(200) NOT NULL,
  `brief_bhs` text NOT NULL,
  `content_bhs` text NOT NULL,
  `title_en` varchar(200) NOT NULL,
  `brief_en` text NOT NULL,
  `content_en` text NOT NULL,
  `title_uzbek` varchar(200) NOT NULL,
  `brief_uzbek` text NOT NULL,
  `content_uzbek` text NOT NULL,
  `image` varchar(200) NOT NULL,
  `thumbnail_image` varchar(200) DEFAULT NULL,
  `slider_image` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `source_url` varchar(100) DEFAULT NULL,
  `file` varchar(200) NOT NULL,
  `icon_image` varchar(200) NOT NULL,
  `url_icon` varchar(200) DEFAULT NULL,
  `source_icon` varchar(100) DEFAULT NULL,
  `file_icon` varchar(200) NOT NULL,
  `filesize` int(11) DEFAULT NULL,
  `filesize_icon` int(11) DEFAULT NULL,
  `can_save` int(11) DEFAULT NULL,
  `tags` text,
  `n_stats` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `uzbemb_banner`
--

INSERT INTO `uzbemb_banner` (`id`, `created_date`, `posted_date`, `expired_date`, `langid`, `author_id`, `title_bhs`, `brief_bhs`, `content_bhs`, `title_en`, `brief_en`, `content_en`, `title_uzbek`, `brief_uzbek`, `content_uzbek`, `image`, `thumbnail_image`, `slider_image`, `url`, `source_url`, `file`, `icon_image`, `url_icon`, `source_icon`, `file_icon`, `filesize`, `filesize_icon`, `can_save`, `tags`, `n_stats`) VALUES
(15, '2014-12-17', '2014-12-17', NULL, 0, 1, '', 'Uzbekistan', '', '', 'Uzbekistan', '', '', 'Uzbekistan', '', '75d8fe353e08199dc6444f6e1ab1d4f8.jpg', NULL, NULL, NULL, NULL, 'http://localhost/uzbek/framework/public_assets/banner/75d8fe353e08199dc6444f6e1ab1d4f8.jpg', '', NULL, NULL, '', NULL, NULL, NULL, NULL, 1),
(16, '2014-12-17', '2014-12-17', NULL, 0, 1, '', 'Uzbekistan 2', '', '', 'Uzbekistan 2', '', '', 'Uzbekistan 2', '', 'eb8e485a59f3d75dee60aba00aff81372.jpg', NULL, NULL, NULL, NULL, 'http://localhost/uzbek/framework/public_assets/banner/eb8e485a59f3d75dee60aba00aff81372.jpg', '', NULL, NULL, '', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `uzbemb_category`
--

CREATE TABLE IF NOT EXISTS `uzbemb_category` (
`id` int(11) NOT NULL,
  `category_name` varchar(200) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `relation` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `n_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uzbemb_contact_list`
--

CREATE TABLE IF NOT EXISTS `uzbemb_contact_list` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(300) NOT NULL,
  `n_stats` tinyint(4) NOT NULL DEFAULT '0',
  `date_received` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `uzbemb_contact_list`
--

INSERT INTO `uzbemb_contact_list` (`id`, `name`, `mail`, `address`, `subject`, `message`, `n_stats`, `date_received`) VALUES
(1, 'Kartika Dwintaputri S', 'kartikads27@gmail.com', 'Depok', 'Test Message', 'Try to send message :)', 0, '2014-12-12 18:29:46');

-- --------------------------------------------------------

--
-- Table structure for table `uzbemb_headlines`
--

CREATE TABLE IF NOT EXISTS `uzbemb_headlines` (
`id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `posted_date` date NOT NULL,
  `expired_date` date DEFAULT NULL,
  `langid` tinyint(4) NOT NULL,
  `author_id` tinyint(4) DEFAULT NULL,
  `title_bhs` varchar(200) NOT NULL,
  `brief_bhs` text NOT NULL,
  `content_bhs` text NOT NULL,
  `title_en` varchar(200) NOT NULL,
  `brief_en` text NOT NULL,
  `content_en` text NOT NULL,
  `title_uzbek` varchar(200) NOT NULL,
  `brief_uzbek` text NOT NULL,
  `content_uzbek` text NOT NULL,
  `image` varchar(200) NOT NULL,
  `thumbnail_image` varchar(200) DEFAULT NULL,
  `slider_image` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `source_url` varchar(100) DEFAULT NULL,
  `file` varchar(200) NOT NULL,
  `icon_image` varchar(200) NOT NULL,
  `url_icon` varchar(200) DEFAULT NULL,
  `source_icon` varchar(100) DEFAULT NULL,
  `file_icon` varchar(200) NOT NULL,
  `filesize` int(11) DEFAULT NULL,
  `filesize_icon` int(11) DEFAULT NULL,
  `can_save` int(11) DEFAULT NULL,
  `tags` text,
  `n_stats` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `uzbemb_headlines`
--

INSERT INTO `uzbemb_headlines` (`id`, `created_date`, `posted_date`, `expired_date`, `langid`, `author_id`, `title_bhs`, `brief_bhs`, `content_bhs`, `title_en`, `brief_en`, `content_en`, `title_uzbek`, `brief_uzbek`, `content_uzbek`, `image`, `thumbnail_image`, `slider_image`, `url`, `source_url`, `file`, `icon_image`, `url_icon`, `source_icon`, `file_icon`, `filesize`, `filesize_icon`, `can_save`, `tags`, `n_stats`) VALUES
(1, '2014-12-12', '0000-00-00', NULL, 0, 1, '', '', '&lt;font size=&quot;2&quot; style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px;&quot;&gt;&lt;font face=&quot;arial,helvetica,sans-serif&quot;&gt;Selamat datang di website resmi baru dari Kedutaan Besar Republik Uzbekistan di Jakarta.&lt;/font&gt;&lt;/font&gt;&lt;font size=&quot;2&quot; style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px;&quot;&gt;&lt;font face=&quot;arial,helvetica,sans-serif&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/font&gt;&lt;font size=&quot;2&quot; style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px;&quot;&gt;&lt;font face=&quot;arial,helvetica,sans-serif&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/font&gt;&lt;font size=&quot;2&quot; style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px;&quot;&gt;&lt;font face=&quot;arial,helvetica,sans-serif&quot;&gt;We hope this website will help you to enhance your knowledge and understanding about Uzbekistan, its presence in the Republic of Indonesia, and bilateral relations between our countries.&lt;/font&gt;&lt;/font&gt;&lt;font size=&quot;2&quot; style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px;&quot;&gt;&lt;font face=&quot;arial,helvetica,sans-serif&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/font&gt;&lt;font size=&quot;2&quot; style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px;&quot;&gt;&lt;font face=&quot;arial,helvetica,sans-serif&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/font&gt;&lt;font size=&quot;2&quot; style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px;&quot;&gt;&lt;font face=&quot;arial,helvetica,sans-serif&quot;&gt;Kami berharap website ini akan membantu Anda untuk meningkatkan pengetahuan dan pemahaman tentang Uzbekistan, dan di Negara Kesatuan Republik Indonesia, dan hubungan bilateral antara negara-negara kami.&lt;/font&gt;&lt;/font&gt;&lt;font size=&quot;2&quot; style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px;&quot;&gt;&lt;font face=&quot;arial,helvetica,sans-serif&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/font&gt;&lt;font size=&quot;2&quot; style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px;&quot;&gt;&lt;font face=&quot;arial,helvetica,sans-serif&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/font&gt;&lt;p id=&quot;result_box&quot; dir=&quot;ltr&quot; align=&quot;justify&quot; style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px;&quot;&gt;&lt;p align=&quot;justify&quot;&gt;&lt;p id=&quot;result_box&quot; dir=&quot;ltr&quot; align=&quot;justify&quot; style=&quot;text-align: left;&quot;&gt;&lt;font size=&quot;2&quot;&gt;Kami ingin Anda yang menarik dan informatif untuk mengunjungi website kami&lt;/font&gt;&lt;/p&gt;&lt;p align=&quot;justify&quot;&gt;&lt;font size=&quot;2&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;b&gt;Salam hangat,&lt;/b&gt;&lt;font size=&quot;2&quot;&gt;&lt;font face=&quot;arial,helvetica,sans-serif&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/font&gt;&lt;font size=&quot;2&quot;&gt;Kedutaan Besar Republik Uzbekistan&lt;/font&gt;&lt;/p&gt;&lt;/p&gt;&lt;/p&gt;', '', '', '&lt;p align=&quot;justify&quot; style=&quot;color: rgb(0, 0, 0); font-family: Verdana, Tahoma; font-size: 12px; line-height: 16px;&quot;&gt;&lt;span style=&quot;font-size: 14pt;&quot;&gt;&lt;font face=&quot;arial,helvetica,sans-serif&quot; size=&quot;2&quot;&gt;Dear our visitor,&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;justify&quot; style=&quot;color: rgb(0, 0, 0); font-family: Verdana, Tahoma; font-size: 12px; line-height: 16px;&quot;&gt;&lt;span style=&quot;font-size: 14pt;&quot;&gt;&lt;font face=&quot;arial,helvetica,sans-serif&quot; size=&quot;2&quot;&gt;&lt;br&gt;&lt;/font&gt;&lt;/span&gt;&lt;/p&gt;&lt;p align=&quot;justify&quot; style=&quot;color: rgb(0, 0, 0); font-family: Verdana, Tahoma; font-size: 12px; line-height: 16px;&quot;&gt;&lt;font size=&quot;2&quot;&gt;&lt;font face=&quot;arial,helvetica,sans-serif&quot;&gt;&amp;nbsp; &amp;nbsp;Welcome to the new official website of the Embassy of the Republic of Uzbekistan in Jakarta.&lt;br&gt;&lt;br&gt;&amp;nbsp; &amp;nbsp;We hope this website will help you to enhance your knowledge and understanding about Uzbekistan, its presence in the Republic of Indonesia, and bilateral relations between our countries.&lt;br&gt;&lt;br&gt;&amp;nbsp; Website has been designed to provide informat&lt;/font&gt;&lt;font face=&quot;arial,helvetica,sans-serif&quot;&gt;ion on a board range of topics about co-operation between Uzbekistan and Indonesia, their economic interaction as well as news and press releases on Uzbekistan economy and business, culture and tourism, education and science.&lt;br&gt;&amp;nbsp; &amp;nbsp;We wish you an interesting and informative visit to our website&amp;nbsp;&lt;br&gt;&lt;br&gt;&lt;b&gt;&amp;nbsp; &amp;nbsp;Warm Regards,&lt;/b&gt;&lt;br&gt;&amp;nbsp; &amp;nbsp;Embassy of the Republic of Uzbekistan&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;', '', '', '&lt;span style=&quot; font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;Sahifamizning aziz mehmonlari,&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;Oâ€™zbekiston Respublikasining Jakarta shahridagi elchixonasining yangi web-sahifasiga xush kelibsiz.&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; Web-sahifamiz sizni Oâ€™zbekiston mamlakati, elchixonamizning Indoneziya Respublikasidagi faoliyati hamda davlatlarimiz oâ€™rtasidagi ikki tomonlama munosabatlar haqida oâ€™z bilimlaringizni oshirishda yordam beradi degan umiddamiz.&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp;Ushbu web-sahifada Oâ€™zbekiston va Indoneziya oâ€™rtasidagi iqtisodiy va madaniy hamkorlik, mamlakat hayotidagi yangiliklar, Oâ€™zbekiston iqtisodiyoti va tadbirkorlik, madaniyat va turizm, taâ€™lim, ilm- fan va boshqa mavzudagi maâ€™lumotlar bilan boitilgan.&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; Sahifamizga tashrifingiz qiziqarli va sermazmun boâ€™lishini umid qilib qolamiz.&lt;/span&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;&lt;b style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;Yuksak ehtirom ila,&amp;nbsp;&lt;/b&gt;&lt;br style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: small; line-height: 16px; text-align: justify;&quot;&gt;Oâ€™zbekiston Respublikasining elchixonasi&amp;nbsp;&lt;/span&gt;', '', NULL, NULL, NULL, NULL, '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `uzbemb_lang`
--

CREATE TABLE IF NOT EXISTS `uzbemb_lang` (
`id` int(11) NOT NULL,
  `lang` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uzbemb_menu_bottom`
--

CREATE TABLE IF NOT EXISTS `uzbemb_menu_bottom` (
`id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `posted_date` date NOT NULL,
  `expired_date` date DEFAULT NULL,
  `langid` tinyint(4) NOT NULL,
  `author_id` tinyint(4) DEFAULT NULL,
  `title_bhs` varchar(200) NOT NULL,
  `brief_bhs` text NOT NULL,
  `content_bhs` text NOT NULL,
  `title_en` varchar(200) NOT NULL,
  `brief_en` text NOT NULL,
  `content_en` text NOT NULL,
  `title_uzbek` varchar(200) NOT NULL,
  `brief_uzbek` text NOT NULL,
  `content_uzbek` text NOT NULL,
  `image` varchar(200) NOT NULL,
  `thumbnail_image` varchar(200) DEFAULT NULL,
  `slider_image` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `source_url` varchar(100) DEFAULT NULL,
  `file` varchar(200) NOT NULL,
  `icon_image` varchar(200) NOT NULL,
  `url_icon` varchar(200) DEFAULT NULL,
  `source_icon` varchar(100) DEFAULT NULL,
  `file_icon` varchar(200) NOT NULL,
  `filesize` int(11) DEFAULT NULL,
  `filesize_icon` int(11) DEFAULT NULL,
  `can_save` int(11) DEFAULT NULL,
  `tags` text,
  `n_stats` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `uzbemb_menu_bottom`
--

INSERT INTO `uzbemb_menu_bottom` (`id`, `created_date`, `posted_date`, `expired_date`, `langid`, `author_id`, `title_bhs`, `brief_bhs`, `content_bhs`, `title_en`, `brief_en`, `content_en`, `title_uzbek`, `brief_uzbek`, `content_uzbek`, `image`, `thumbnail_image`, `slider_image`, `url`, `source_url`, `file`, `icon_image`, `url_icon`, `source_icon`, `file_icon`, `filesize`, `filesize_icon`, `can_save`, `tags`, `n_stats`) VALUES
(1, '2014-12-15', '2014-12-15', NULL, 0, 1, 'Uzbekistan &amp; Shanghai Coorperation Organization', 'Uzbekistan &amp; Shanghai Coorperation Organization', 'Uzbekistan &amp;amp; Shanghai Coorperation Organization', 'Uzbekistan &amp; Shanghai Coorperation Organization', 'Uzbekistan &amp; Shanghai Coorperation Organization', 'Uzbekistan &amp;amp; Shanghai Coorperation Organization', 'Uzbekistan &amp; Shanghai Coorperation Organization', 'Uzbekistan &amp; Shanghai Coorperation Organization', 'Uzbekistan &amp;amp; Shanghai Coorperation Organization', 'd77ae531d766050f336d03de29c219dc.jpg', NULL, NULL, NULL, NULL, 'http://localhost/uzbek/framework/public_assets/news/image/d77ae531d766050f336d03de29c219dc.jpg', 'a0d9f97a2345e25706f66acd373a7b1a.png', NULL, NULL, 'http://localhost/uzbek/framework/public_assets/news/icon/a0d9f97a2345e25706f66acd373a7b1a.png', NULL, NULL, NULL, NULL, 1),
(2, '2014-12-15', '2014-12-15', '0000-00-00', 0, 1, 'Visits', 'Visits', 'Visits', 'Visits', 'Visits', 'Visits', 'Visits', 'Visits', 'Visits', 'fce1e35bfdbcd6bf9d91df1f55741e9c.jpg', NULL, NULL, NULL, NULL, 'http://localhost/uzbek/framework/public_assets/news/image/fce1e35bfdbcd6bf9d91df1f55741e9c.jpg', '27ebe42476f4a20ac28068d1b2714df6.png', NULL, NULL, 'http://localhost/uzbek/framework/public_assets/news/icon/27ebe42476f4a20ac28068d1b2714df6.png', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `uzbemb_menu_list`
--

CREATE TABLE IF NOT EXISTS `uzbemb_menu_list` (
`id` int(11) NOT NULL,
  `nm_bhs` varchar(100) NOT NULL,
  `nm_eng` varchar(100) NOT NULL,
  `nm_uzbek` varchar(100) NOT NULL,
  `menu_type` int(11) NOT NULL,
  `is_child` int(11) NOT NULL,
  `id_parent` int(11) NOT NULL,
  `pos` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `author_id` varchar(100) NOT NULL,
  `n_stats` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List of the menu in the web.' AUTO_INCREMENT=33 ;

--
-- Dumping data for table `uzbemb_menu_list`
--

INSERT INTO `uzbemb_menu_list` (`id`, `nm_bhs`, `nm_eng`, `nm_uzbek`, `menu_type`, `is_child`, `id_parent`, `pos`, `date_created`, `author_id`, `n_stats`) VALUES
(1, 'Uzbekistan', 'Uzbekistan', 'Ozbekiston', 1, 0, 0, 0, '2014-12-12', '', 1),
(2, 'Presiden', 'President', 'President', 1, 0, 0, 0, '2014-12-12', '', 1),
(3, 'Kedutaan', 'Embassy', 'Elchixona', 0, 0, 0, 0, '2014-12-12', '', 1),
(4, 'Pemerintah', 'Government', 'Hukumat', 1, 1, 1, 0, '2014-12-12', '', 1),
(5, 'Oliy Majlis (Parlemen)', 'Oliy Majlis (Parliament)', 'Oliy Majlis', 1, 1, 1, 0, '2014-12-12', '', 1),
(6, 'Partai Politik dan Gerakan', 'Political Parties and Movements', 'Siyosiy Partiyalar va Xarakatlar', 1, 1, 1, 0, '2014-12-12', '', 1),
(7, 'Konstitusi', 'Constitution', 'Konstitutsiya', 1, 1, 1, 0, '2014-12-12', '', 1),
(8, 'Tentu Negara dan Lambang Uzbekistan', 'State and Symbol of Uzbekistan', 'Davlat Ramzlari', 1, 1, 0, 0, '2014-12-12', '', 1),
(9, 'Ekonomi dan Keuangan', 'Economy and Finance', 'Iqtisod va Moliya', 1, 1, 1, 0, '2014-12-12', '', 1),
(10, 'Sejarah', 'History', 'Tarix', 1, 1, 1, 0, '2014-12-12', '', 1),
(11, 'Budaya', 'Culture', 'Modaniyat', 1, 1, 1, 0, '2014-12-12', '', 1),
(12, 'Agama', 'Religion', 'Din', 1, 1, 1, 0, '2014-12-12', '', 1),
(13, 'Sains dan Pendidikan', 'Science and Education', 'Fan va Talim', 1, 1, 1, 0, '2014-12-12', '', 1),
(14, 'Kesehatan', 'HealthCare', 'HealthCare', 1, 1, 1, 0, '2014-12-12', '', 1),
(15, 'Olahraga', 'Sport', 'Sport', 1, 1, 1, 0, '2014-12-12', '', 1),
(16, 'Museum', 'Museums', 'Museums', 1, 1, 1, 0, '2014-12-12', '', 1),
(17, 'Kedutaan', 'Ambassador', 'Elchi', 1, 1, 3, 0, '2014-12-12', '', 1),
(18, 'Staf', 'Staff', 'Xodimlar', 1, 1, 3, 0, '2014-12-12', '', 1),
(19, 'Politik Luar Negeri', 'Foreign Policy', 'Tashqi Siyosat', 1, 0, 0, 1, '2014-12-12', '', 1),
(20, 'Keamanan', 'Security', 'Hafsizlik Masalasi', 1, 0, 0, 1, '2014-12-12', '', 1),
(21, 'Bisnis', 'Business', 'Biznes', 1, 0, 0, 1, '2014-12-12', '', 1),
(22, 'Turis', 'Tourism', 'Turizm', 1, 0, 0, 1, '2014-12-12', '', 1),
(23, 'Media Masa', 'Mass Media', 'Ommaviy Ahborot Vositalari', 1, 0, 0, 1, '2014-12-12', '', 1),
(24, 'Kerjasama', 'Cooperation', 'Aloqalar', 1, 0, 0, 1, '2014-12-12', '', 1),
(25, 'Pelayanan Konsuler', 'Consular Service', 'Konsullik Hizmati', 1, 0, 0, 1, '2014-12-12', '', 1),
(26, 'Berita', 'News', 'News', 0, 0, 0, 1, '2014-12-12', '', 1),
(27, 'Gambar Hidup', 'Movies', 'Filmlar', 1, 0, 0, 1, '2014-12-12', '', 1),
(28, 'Galeri Foto', 'Photo Gallery', 'Foto Galereya', 1, 0, 0, 1, '2014-12-12', '', 1),
(29, 'Hubungi Kami', 'Contact Us', 'Contact Us', 1, 0, 0, 1, '2014-12-12', '', 1),
(30, 'Iklim Investasi', 'Investment Climate', 'Investiya Iqlimi', 1, 1, 21, 1, '2014-12-12', '', 1),
(31, 'Peraturan Visa', 'Visa Regulations', 'Visa Regulations', 1, 1, 25, 1, '2014-12-12', '', 1),
(32, 'Kewarganegaraan', 'Citizinship', 'Fuqarolik Masalalari', 1, 1, 25, 1, '2014-12-12', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `uzbemb_news_category`
--

CREATE TABLE IF NOT EXISTS `uzbemb_news_category` (
`id` int(11) NOT NULL,
  `catName` varchar(100) DEFAULT NULL,
  `n_status` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `uzbemb_news_category`
--

INSERT INTO `uzbemb_news_category` (`id`, `catName`, `n_status`) VALUES
(1, 'Content', 1),
(2, 'Agenda', 1),
(3, 'Headline', 1),
(4, 'Afiliasi', 1),
(5, '', 1),
(6, '', 1),
(7, '', 1),
(8, '', 1),
(9, 'Gallery', 1);

-- --------------------------------------------------------

--
-- Table structure for table `uzbemb_news_content`
--

CREATE TABLE IF NOT EXISTS `uzbemb_news_content` (
`id` int(11) NOT NULL,
  `parentid` int(11) NOT NULL,
  `menuId` tinyint(4) NOT NULL,
  `lid` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
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
  `topcontent` int(11) NOT NULL DEFAULT '0' COMMENT '0;standart;1:featured;2:review;3:interview'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `uzbemb_news_content`
--

INSERT INTO `uzbemb_news_content` (`id`, `parentid`, `menuId`, `lid`, `lang_id`, `title`, `brief`, `content`, `image`, `thumbnail_image`, `slider_image`, `categoryid`, `articleType`, `url`, `sourceurl`, `file`, `created_date`, `expired_date`, `posted_date`, `fromwho`, `filesize`, `can_save`, `tags`, `authorid`, `n_status`, `topcontent`) VALUES
(1, 0, 4, 0, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', '&lt;p style=&quot;text-align: left;&quot;&gt;&lt;span style=&quot;text-align: left;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', '921d3a4c180cb4c2ccb22da9a6c3291a.jpg', '', '', 1, 0, '', '', 'http://localhost/uzbek/framework/public_assets/news/921d3a4c180cb4c2ccb22da9a6c3291a.jpg', '2014-12-15 17:45:14', '0000-00-00 00:00:00', '2014-12-15 00:00:00', 0, 0, 0, '', 1, 1, 0),
(2, 0, 0, 0, 0, 'Uzbekistan', 'This is Uzbekistan', '', 'eba9952b69425001bdd9fdfc8f3544c6.jpg', '', '', 9, 1, '', '', 'http://localhost/uzbek/framework/public_assets/gallery/images/eba9952b69425001bdd9fdfc8f3544c6.jpg', '2014-12-15 18:55:32', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 0),
(3, 0, 0, 0, 0, 'Meeting', 'Meeting in embassy', '', '7d49762cf76d38cc7a55518b1015f447.jpg', '', '', 9, 1, '', '', 'http://localhost/uzbek/framework/public_assets/gallery/images/7d49762cf76d38cc7a55518b1015f447.jpg', '2014-12-15 19:02:04', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 0, 0),
(4, 0, 26, 0, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit&amp;nbsp;Lorem ipsum dolor sit amet, consectetur adipiscing elit&amp;nbsp;Lorem ipsum dolor sit amet, consectetur adipiscing elit&amp;nbsp;Lorem ipsum dolor sit amet, consectetur adipiscing elit&amp;nbsp;Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '', '', '', 1, 0, '', '', '', '2014-12-17 05:37:52', '0000-00-00 00:00:00', '2014-12-17 00:00:00', 0, 0, 0, '', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `uzbemb_news_content_comment`
--

CREATE TABLE IF NOT EXISTS `uzbemb_news_content_comment` (
`id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `contentid` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `n_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uzbemb_news_content_repo`
--

CREATE TABLE IF NOT EXISTS `uzbemb_news_content_repo` (
`id` int(11) NOT NULL,
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
  `n_status` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `uzbemb_news_content_repo`
--

INSERT INTO `uzbemb_news_content_repo` (`id`, `title`, `brief`, `content`, `typealbum`, `gallerytype`, `files`, `thumbnail`, `fromwho`, `otherid`, `userid`, `created_date`, `langType`, `langTitle`, `langDesc`, `n_status`) VALUES
(1, '', '', 'b57f3ec6d119da866197799a8bb02ac3.jpg', 2, 9, 'http://localhost/uzbek/framework/public_assets/gallery/images/b57f3ec6d119da866197799a8bb02ac3.jpg', '', 0, 2, 0, '2014-12-15 18:57:23', 0, NULL, NULL, 1),
(2, '', '', 'b68d25c1f890c88f39f014a14c90a8ff.jpg', 2, 9, 'http://localhost/uzbek/framework/public_assets/gallery/images/b68d25c1f890c88f39f014a14c90a8ff.jpg', '', 0, 2, 0, '2014-12-15 18:57:23', 0, NULL, NULL, 1),
(3, '', '', 'e0199f295df081cfc13dbd8d37131b83.jpg', 2, 9, 'http://localhost/uzbek/framework/public_assets/gallery/images/e0199f295df081cfc13dbd8d37131b83.jpg', '', 0, 2, 0, '2014-12-15 18:57:23', 0, NULL, NULL, 1),
(4, '', '', 'e85a2d8bd6095c5b7eb2bd9166789016.jpg', 2, 9, 'http://localhost/uzbek/framework/public_assets/gallery/images/e85a2d8bd6095c5b7eb2bd9166789016.jpg', '', 0, 2, 0, '2014-12-15 18:57:23', 0, NULL, NULL, 1),
(5, '', '', '1467fa0cd45f5e64bd4fbdb7ef74349e.jpg', 2, 9, 'http://localhost/uzbek/framework/public_assets/gallery/images/1467fa0cd45f5e64bd4fbdb7ef74349e.jpg', '', 0, 3, 0, '2014-12-15 19:02:31', 0, NULL, NULL, 1),
(6, '', '', 'fdbe29fd0645ac7d584d74c31d9cf8f5.jpg', 2, 9, 'http://localhost/uzbek/framework/public_assets/gallery/images/fdbe29fd0645ac7d584d74c31d9cf8f5.jpg', '', 0, 3, 0, '2014-12-15 19:02:31', 0, NULL, NULL, 1),
(7, '', '', '51bf202471dabe17030e777c5e307e6a.jpg', 2, 9, 'http://localhost/uzbek/framework/public_assets/gallery/images/51bf202471dabe17030e777c5e307e6a.jpg', '', 0, 3, 0, '2014-12-15 19:02:31', 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `uzbemb_topical_issues`
--

CREATE TABLE IF NOT EXISTS `uzbemb_topical_issues` (
`id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `posted_date` date NOT NULL,
  `expired_date` date DEFAULT NULL,
  `langid` tinyint(4) NOT NULL,
  `author_id` tinyint(4) DEFAULT NULL,
  `title_bhs` varchar(200) NOT NULL,
  `brief_bhs` text NOT NULL,
  `content_bhs` text NOT NULL,
  `title_en` varchar(200) NOT NULL,
  `brief_en` text NOT NULL,
  `content_en` text NOT NULL,
  `title_uzbek` varchar(200) NOT NULL,
  `brief_uzbek` text NOT NULL,
  `content_uzbek` text NOT NULL,
  `image` varchar(200) NOT NULL,
  `thumbnail_image` varchar(200) DEFAULT NULL,
  `slider_image` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `source_url` varchar(100) DEFAULT NULL,
  `file` varchar(200) NOT NULL,
  `icon_image` varchar(200) NOT NULL,
  `url_icon` varchar(200) DEFAULT NULL,
  `source_icon` varchar(100) DEFAULT NULL,
  `file_icon` varchar(200) NOT NULL,
  `filesize` int(11) DEFAULT NULL,
  `filesize_icon` int(11) DEFAULT NULL,
  `can_save` int(11) DEFAULT NULL,
  `tags` text,
  `n_stats` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `uzbemb_topical_issues`
--

INSERT INTO `uzbemb_topical_issues` (`id`, `created_date`, `posted_date`, `expired_date`, `langid`, `author_id`, `title_bhs`, `brief_bhs`, `content_bhs`, `title_en`, `brief_en`, `content_en`, `title_uzbek`, `brief_uzbek`, `content_uzbek`, `image`, `thumbnail_image`, `slider_image`, `url`, `source_url`, `file`, `icon_image`, `url_icon`, `source_icon`, `file_icon`, `filesize`, `filesize_icon`, `can_save`, `tags`, `n_stats`) VALUES
(1, '2014-12-15', '2014-12-15', NULL, 0, 1, 'Pemilihan Umum 2014', 'Pemilihan Umum 2014', '&lt;p style=&quot;text-align: left;&quot;&gt;&lt;span style=&quot;text-align: left;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/span&gt;&lt;/p&gt;', 'Election 2014', 'Election 2014', '&lt;span style=&quot;line-height: 22.1000003814697px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/span&gt;', 'Election 2014', 'Election 2014', '&lt;span style=&quot;line-height: 22.1000003814697px;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/span&gt;', '1bf47eee5c6b8c3128fe8b0f931d62ea.jpg', NULL, NULL, NULL, NULL, 'http://localhost/uzbek/framework/public_assets/news/image/1bf47eee5c6b8c3128fe8b0f931d62ea.jpg', '67633b0d6bc0175c5d10e82da0ad405c.png', NULL, NULL, 'http://localhost/uzbek/framework/public_assets/news/icon/67633b0d6bc0175c5d10e82da0ad405c.png', NULL, NULL, NULL, NULL, 1),
(2, '2014-12-15', '2014-12-15', NULL, 0, 1, 'Problems of Water Resources in The Central Asia', 'Problems of Water Resources in The Central Asia', 'Problems of Water Resources in The Central Asia', 'Problems of Water Resources in The Central Asia', 'Problems of Water Resources in The Central Asia', 'Problems of Water Resources in The Central Asia', 'Problems of Water Resources in The Central Asia', 'Problems of Water Resources in The Central Asia', 'Problems of Water Resources in The Central Asia', 'a31bbb2cdb4695913abbad071c4d23a6.jpg', NULL, NULL, NULL, NULL, 'http://localhost/uzbek/framework/public_assets/news/image/a31bbb2cdb4695913abbad071c4d23a6.jpg', '19415466ef298585eecfcc3bda5172d3.png', NULL, NULL, 'http://localhost/uzbek/framework/public_assets/news/icon/19415466ef298585eecfcc3bda5172d3.png', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `uzbemb_video`
--

CREATE TABLE IF NOT EXISTS `uzbemb_video` (
`id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `posted_date` date NOT NULL,
  `expired_date` date DEFAULT NULL,
  `langid` tinyint(4) NOT NULL,
  `author_id` tinyint(4) DEFAULT NULL,
  `title_bhs` varchar(200) NOT NULL,
  `brief_bhs` text NOT NULL,
  `content_bhs` text NOT NULL,
  `title_en` varchar(200) NOT NULL,
  `brief_en` text NOT NULL,
  `content_en` text NOT NULL,
  `title_uzbek` varchar(200) NOT NULL,
  `brief_uzbek` text NOT NULL,
  `content_uzbek` text NOT NULL,
  `video` varchar(200) NOT NULL,
  `thumbnail_image` varchar(200) DEFAULT NULL,
  `slider_image` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `source_url` varchar(100) DEFAULT NULL,
  `file` varchar(200) NOT NULL,
  `icon_image` varchar(200) NOT NULL,
  `url_icon` varchar(200) DEFAULT NULL,
  `source_icon` varchar(100) DEFAULT NULL,
  `file_icon` varchar(200) NOT NULL,
  `filesize` int(11) DEFAULT NULL,
  `filesize_icon` int(11) DEFAULT NULL,
  `can_save` int(11) DEFAULT NULL,
  `tags` text,
  `n_stats` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_member`
--
ALTER TABLE `admin_member`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzbemb_banner`
--
ALTER TABLE `uzbemb_banner`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzbemb_category`
--
ALTER TABLE `uzbemb_category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzbemb_contact_list`
--
ALTER TABLE `uzbemb_contact_list`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzbemb_headlines`
--
ALTER TABLE `uzbemb_headlines`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzbemb_lang`
--
ALTER TABLE `uzbemb_lang`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzbemb_menu_bottom`
--
ALTER TABLE `uzbemb_menu_bottom`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzbemb_menu_list`
--
ALTER TABLE `uzbemb_menu_list`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD UNIQUE KEY `id_2` (`id`);

--
-- Indexes for table `uzbemb_news_category`
--
ALTER TABLE `uzbemb_news_category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzbemb_news_content`
--
ALTER TABLE `uzbemb_news_content`
 ADD PRIMARY KEY (`id`), ADD KEY `title` (`title`), ADD KEY `categoryid` (`categoryid`), ADD KEY `created_date` (`created_date`), ADD KEY `posted_date` (`posted_date`), ADD KEY `n_status` (`n_status`), ADD KEY `articleTypeID` (`articleType`), ADD KEY `image` (`image`), ADD KEY `parentID` (`parentid`), ADD KEY `lid` (`lid`), ADD KEY `online` (`fromwho`), ADD KEY `expired_date` (`expired_date`), ADD KEY `url` (`url`), ADD KEY `aid` (`authorid`), ADD KEY `file` (`file`), ADD KEY `slider_image` (`slider_image`), ADD KEY `sourceurl` (`filesize`), ADD KEY `thumbnail_image` (`thumbnail_image`), ADD KEY `topcontent` (`topcontent`), ADD KEY `sourceurl_2` (`sourceurl`), ADD KEY `can_save` (`can_save`);

--
-- Indexes for table `uzbemb_news_content_comment`
--
ALTER TABLE `uzbemb_news_content_comment`
 ADD PRIMARY KEY (`id`), ADD KEY `date` (`date`), ADD KEY `userid` (`userid`), ADD KEY `contentid` (`contentid`);

--
-- Indexes for table `uzbemb_news_content_repo`
--
ALTER TABLE `uzbemb_news_content_repo`
 ADD PRIMARY KEY (`id`), ADD KEY `otherid` (`otherid`), ADD KEY `IDX_typeAlbum` (`typealbum`), ADD KEY `IDX_Album_ID` (`gallerytype`), ADD KEY `IDX_FROM_WHO` (`fromwho`);

--
-- Indexes for table `uzbemb_topical_issues`
--
ALTER TABLE `uzbemb_topical_issues`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uzbemb_video`
--
ALTER TABLE `uzbemb_video`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `admin_member`
--
ALTER TABLE `admin_member`
MODIFY `id` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uzbemb_banner`
--
ALTER TABLE `uzbemb_banner`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `uzbemb_category`
--
ALTER TABLE `uzbemb_category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uzbemb_contact_list`
--
ALTER TABLE `uzbemb_contact_list`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uzbemb_headlines`
--
ALTER TABLE `uzbemb_headlines`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `uzbemb_lang`
--
ALTER TABLE `uzbemb_lang`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uzbemb_menu_bottom`
--
ALTER TABLE `uzbemb_menu_bottom`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `uzbemb_menu_list`
--
ALTER TABLE `uzbemb_menu_list`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `uzbemb_news_category`
--
ALTER TABLE `uzbemb_news_category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `uzbemb_news_content`
--
ALTER TABLE `uzbemb_news_content`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `uzbemb_news_content_comment`
--
ALTER TABLE `uzbemb_news_content_comment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uzbemb_news_content_repo`
--
ALTER TABLE `uzbemb_news_content_repo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `uzbemb_topical_issues`
--
ALTER TABLE `uzbemb_topical_issues`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `uzbemb_video`
--
ALTER TABLE `uzbemb_video`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
