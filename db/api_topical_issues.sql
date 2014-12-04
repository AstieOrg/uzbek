-- phpMyAdmin SQL Dump
-- version 4.1.14.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 05, 2014 at 04:02 AM
-- Server version: 5.5.29-MariaDB-log
-- PHP Version: 5.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `db_api`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_topical_issues`
--

CREATE TABLE IF NOT EXISTS `api_topical_issues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_date` date NOT NULL,
  `posted_date` date NOT NULL,
  `expired_date` date DEFAULT NULL,
  `langid` tinyint(4) NOT NULL,
  `author_id` tinyint(4) DEFAULT NULL,
  `title` varchar(200) NOT NULL,
  `brief` text NOT NULL,
  `content` text NOT NULL,
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
  `n_stats` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `api_topical_issues`
--

INSERT INTO `api_topical_issues` (`id`, `created_date`, `posted_date`, `expired_date`, `langid`, `author_id`, `title`, `brief`, `content`, `image`, `thumbnail_image`, `slider_image`, `url`, `source_url`, `file`, `icon_image`, `url_icon`, `source_icon`, `file_icon`, `filesize`, `filesize_icon`, `can_save`, `tags`, `n_stats`) VALUES
(3, '2014-12-05', '2014-12-05', NULL, 0, NULL, 'aaaaaaaaaa', 'aaaa', 'lolololo', '16d16b0c4026f8e167df931d4a6aded9.PNG', NULL, NULL, NULL, NULL, 'http://localhost/uzbek_new/public_assets/news/16d16b0c4026f8e167df931d4a6aded9.PNG', '3fb2acbf6d5d3efcfeb1a3ec1b3c6ac9.png', NULL, NULL, 'http://localhost/uzbek_new/public_assets/news/3fb2acbf6d5d3efcfeb1a3ec1b3c6ac9.png', NULL, NULL, NULL, NULL, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
