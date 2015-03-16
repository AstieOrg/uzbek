-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 16 Mar 2015 pada 14.55
-- Versi Server: 5.6.20
-- PHP Version: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `project_uzbek`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `uzbemb_news_content`
--

CREATE TABLE IF NOT EXISTS `uzbemb_news_content` (
`id` int(11) NOT NULL,
  `parentid` int(11) NOT NULL,
  `menuId` tinyint(4) NOT NULL,
  `lid` int(11) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=40 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `uzbemb_news_content`
--
ALTER TABLE `uzbemb_news_content`
 ADD PRIMARY KEY (`id`), ADD KEY `categoryid` (`categoryid`), ADD KEY `created_date` (`created_date`), ADD KEY `posted_date` (`posted_date`), ADD KEY `n_status` (`n_status`), ADD KEY `articleTypeID` (`articleType`), ADD KEY `image` (`image`), ADD KEY `parentID` (`parentid`), ADD KEY `lid` (`lid`), ADD KEY `online` (`fromwho`), ADD KEY `expired_date` (`expired_date`), ADD KEY `url` (`url`), ADD KEY `aid` (`authorid`), ADD KEY `file` (`file`), ADD KEY `slider_image` (`slider_image`), ADD KEY `sourceurl` (`filesize`), ADD KEY `thumbnail_image` (`thumbnail_image`), ADD KEY `topcontent` (`topcontent`), ADD KEY `sourceurl_2` (`sourceurl`), ADD KEY `can_save` (`can_save`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `uzbemb_news_content`
--
ALTER TABLE `uzbemb_news_content`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
