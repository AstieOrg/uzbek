-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 04, 2015 at 02:11 PM
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
-- Table structure for table `uzbemb_contactus`
--

CREATE TABLE IF NOT EXISTS `uzbemb_contactus` (
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
-- Dumping data for table `uzbemb_contactus`
--

INSERT INTO `uzbemb_contactus` (`id`, `created_date`, `posted_date`, `expired_date`, `langid`, `author_id`, `title_bhs`, `brief_bhs`, `content_bhs`, `title_en`, `brief_en`, `content_en`, `title_uzbek`, `brief_uzbek`, `content_uzbek`, `image`, `thumbnail_image`, `slider_image`, `url`, `source_url`, `file`, `icon_image`, `url_icon`, `source_icon`, `file_icon`, `filesize`, `filesize_icon`, `can_save`, `tags`, `n_stats`) VALUES
(1, '2014-12-12', '2015-05-04', NULL, 0, 1, '', '', '&amp;lt;h4&amp;gt;Kantor Kami&amp;lt;/h4&amp;gt;\r\n\r\n&amp;lt;table border=&amp;quot;0&amp;quot; cellpadding=&amp;quot;4&amp;quot; cellspacing=&amp;quot;0&amp;quot; class=&amp;quot;home_content&amp;quot; style=&amp;quot;border-collapse:collapse; border-spacing:0px; box-sizing:border-box; font-family:verdana,tahoma; font-size:12px; line-height:17.142858505249px; width:499px&amp;quot;&amp;gt;\r\n	&amp;lt;tbody&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td&amp;gt;Alamat&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;:&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;Jl. Daksa III. 14, Kebayoran Baru, Jakarta Selatan&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td&amp;gt;No.Telp&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;:&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;(62-21) 7200950/7200972&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td&amp;gt;Email&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;:&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;inbox@uzbemb.or.id&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n	&amp;lt;/tbody&amp;gt;\r\n&amp;lt;/table&amp;gt;', '', '', '&amp;lt;h4&amp;gt;Our Office&amp;lt;/h4&amp;gt;\r\n\r\n&amp;lt;table border=&amp;quot;0&amp;quot; cellpadding=&amp;quot;4&amp;quot; cellspacing=&amp;quot;0&amp;quot; class=&amp;quot;home_content&amp;quot; style=&amp;quot;border-collapse:collapse; border-spacing:0px; box-sizing:border-box; font-family:verdana,tahoma; font-size:12px; line-height:17.142858505249px; width:100%&amp;quot;&amp;gt;\r\n	&amp;lt;tbody&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td&amp;gt;Address&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;:&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;Jl. Daksa III. 14, Kebayoran Baru, Jakarta Selatan&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td&amp;gt;Phone Number&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;:&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;(62-21) 7200950/7200972&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td&amp;gt;Email Address&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;:&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;inbox@uzbemb.or.id&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n	&amp;lt;/tbody&amp;gt;\r\n&amp;lt;/table&amp;gt;', '', '', '&amp;lt;h4&amp;gt;Our Office&amp;lt;/h4&amp;gt;\r\n\r\n&amp;lt;table border=&amp;quot;0&amp;quot; cellpadding=&amp;quot;4&amp;quot; cellspacing=&amp;quot;0&amp;quot; class=&amp;quot;home_content&amp;quot; style=&amp;quot;border-collapse:collapse; border-spacing:0px; box-sizing:border-box; font-family:verdana,tahoma; font-size:12px; line-height:17.142858505249px; width:499px&amp;quot;&amp;gt;\r\n	&amp;lt;tbody&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td&amp;gt;Address&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;:&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;Jl. Daksa III. 14, Kebayoran Baru, Jakarta Selatan&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td&amp;gt;Phone Number&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;:&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;(62-21) 7200950/7200972&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n		&amp;lt;tr&amp;gt;\r\n			&amp;lt;td&amp;gt;Email Address&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;:&amp;lt;/td&amp;gt;\r\n			&amp;lt;td&amp;gt;inbox@uzbemb.or.id&amp;lt;/td&amp;gt;\r\n		&amp;lt;/tr&amp;gt;\r\n	&amp;lt;/tbody&amp;gt;\r\n&amp;lt;/table&amp;gt;', '', NULL, NULL, NULL, NULL, '', '', NULL, NULL, '', NULL, NULL, NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `uzbemb_contactus`
--
ALTER TABLE `uzbemb_contactus`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `uzbemb_contactus`
--
ALTER TABLE `uzbemb_contactus`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
