-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 10 Des 2014 pada 10.12
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
-- Struktur dari tabel `uzbemb_news_category`
--

CREATE TABLE IF NOT EXISTS `uzbemb_news_category` (
`id` int(11) NOT NULL,
  `catName` varchar(100) DEFAULT NULL,
  `n_status` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data untuk tabel `uzbemb_news_category`
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

--
-- Indexes for dumped tables
--

--
-- Indexes for table `uzbemb_news_category`
--
ALTER TABLE `uzbemb_news_category`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `uzbemb_news_category`
--
ALTER TABLE `uzbemb_news_category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
