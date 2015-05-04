-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 16 Apr 2015 pada 10.53
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
-- Struktur dari tabel `uzbemb_repo`
--

CREATE TABLE IF NOT EXISTS `uzbemb_repo` (
`id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `category` varchar(200) NOT NULL,
  `brief` text NOT NULL,
  `content` text NOT NULL,
  `typealbum` int(11) NOT NULL COMMENT '1:song;2:images;3:video',
  `gallerytype` int(11) NOT NULL COMMENT '0:book',
  `files` varchar(200) NOT NULL COMMENT 'can be image or song',
  `filename` varchar(200) NOT NULL,
  `realname` varchar(200) NOT NULL,
  `thumbnail` varchar(200) NOT NULL,
  `authorid` int(11) NOT NULL,
  `created_date` datetime NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `uzbemb_repo`
--
ALTER TABLE `uzbemb_repo`
 ADD PRIMARY KEY (`id`), ADD KEY `otherid` (`authorid`), ADD KEY `IDX_typeAlbum` (`typealbum`), ADD KEY `IDX_Album_ID` (`gallerytype`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `uzbemb_repo`
--
ALTER TABLE `uzbemb_repo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
