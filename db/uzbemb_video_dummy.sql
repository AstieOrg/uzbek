-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 20, 2014 at 08:49 PM
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
-- Table structure for table `uzbemb_video`
--

CREATE TABLE IF NOT EXISTS `uzbemb_video` (
`id` int(11) NOT NULL,
  `created_date` date NOT NULL,
  `posted_date` date NOT NULL,
  `expired_date` date DEFAULT NULL,
  `langid` tinyint(4) NOT NULL,
  `author_id` tinyint(4) DEFAULT NULL,
  `video_type` varchar(50) NOT NULL,
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
  `file` varchar(200) NOT NULL,
  `filesize` int(11) DEFAULT NULL,
  `n_stats` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `uzbemb_video`
--

INSERT INTO `uzbemb_video` (`id`, `created_date`, `posted_date`, `expired_date`, `langid`, `author_id`, `video_type`, `title_bhs`, `brief_bhs`, `content_bhs`, `title_en`, `brief_en`, `content_en`, `title_uzbek`, `brief_uzbek`, `content_uzbek`, `video`, `thumbnail_image`, `file`, `filesize`, `n_stats`) VALUES
(1, '2014-12-20', '2014-12-20', NULL, 0, 1, 'file', '', '', '', 'TASHKENT-CAPITAL OF ISLAMIC CULTURE', '', '', '', '', '', 'fe206cce923637c4bb24a241c3ca6006.mp4', NULL, 'http://localhost/uzbek/framework/public_assets/video/fe206cce923637c4bb24a241c3ca6006.mp4', NULL, 1),
(2, '2014-12-20', '2014-12-20', NULL, 0, 1, 'file', '', '', '', '99th Session of The Executive Council of The UN World Tourism Organization', '', '', '', '', '', '7b7d86c4655a4b9fbb6a5a7c3195d5fe.mp4', NULL, 'http://localhost/uzbek/framework/public_assets/video/7b7d86c4655a4b9fbb6a5a7c3195d5fe.mp4', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `uzbemb_video`
--
ALTER TABLE `uzbemb_video`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `uzbemb_video`
--
ALTER TABLE `uzbemb_video`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
