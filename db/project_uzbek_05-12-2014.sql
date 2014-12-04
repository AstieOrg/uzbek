-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 04 Des 2014 pada 18.33
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
-- Struktur dari tabel `activity_log`
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
-- Struktur dari tabel `admin_member`
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
-- Dumping data untuk tabel `admin_member`
--

INSERT INTO `admin_member` (`id`, `name`, `nickname`, `email`, `register_date`, `username`, `salt`, `password`, `n_status`) VALUES
(1, 'admin', 'admin', 'admin@example.com', '2014-08-08 05:56:36', 'admin', 'codekir v3.0', 'b2e982d12c95911b6abeacad24e256ff3fa47fdb', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_category`
--

CREATE TABLE IF NOT EXISTS `api_category` (
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
-- Struktur dari tabel `api_contact_list`
--

CREATE TABLE IF NOT EXISTS `api_contact_list` (
`id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `tel` smallint(6) DEFAULT NULL,
  `subject` varchar(100) NOT NULL,
  `message` varchar(300) NOT NULL,
  `n_stats` tinyint(4) NOT NULL,
  `date_received` date NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data untuk tabel `api_contact_list`
--

INSERT INTO `api_contact_list` (`id`, `name`, `mail`, `tel`, `subject`, `message`, `n_stats`, `date_received`) VALUES
(1, 'astie', 'astie@gmail.com', 0, 'lalal', 'test', 0, '2014-12-03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_lang`
--

CREATE TABLE IF NOT EXISTS `api_lang` (
`id` int(11) NOT NULL,
  `lang` varchar(100) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data untuk tabel `api_lang`
--

INSERT INTO `api_lang` (`id`, `lang`) VALUES
(1, 'Indonesia'),
(2, 'Inggris'),
(3, 'Rusia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_member_interest`
--

CREATE TABLE IF NOT EXISTS `api_member_interest` (
`id` int(11) NOT NULL,
  `userid` int(11) NOT NULL DEFAULT '0',
  `category_id` int(11) NOT NULL DEFAULT '0',
  `date_join` varchar(300) NOT NULL,
  `n_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_menu_list`
--

CREATE TABLE IF NOT EXISTS `api_menu_list` (
`id` int(11) NOT NULL,
  `nm_bhs` varchar(100) NOT NULL,
  `nm_eng` varchar(100) NOT NULL,
  `nm_rus` varchar(100) NOT NULL,
  `menu_type` int(11) NOT NULL,
  `is_child` int(11) NOT NULL,
  `id_parent` int(11) NOT NULL,
  `pos` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `author_id` varchar(100) NOT NULL,
  `n_stats` tinyint(1) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List of the menu in the web.' AUTO_INCREMENT=17 ;

--
-- Dumping data untuk tabel `api_menu_list`
--

INSERT INTO `api_menu_list` (`id`, `nm_bhs`, `nm_eng`, `nm_rus`, `menu_type`, `is_child`, `id_parent`, `pos`, `date_created`, `author_id`, `n_stats`) VALUES
(1, 'Foreign Policy test edit', 'Foreign Policy edit bro', 'Foreign Policy', 0, 0, 0, 0, '2014-12-03', '', 0),
(16, 'test insert', 'test insert', 'test insert', 0, 0, 0, 0, '2014-12-04', '', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_news_category`
--

CREATE TABLE IF NOT EXISTS `api_news_category` (
`id` int(11) NOT NULL,
  `catName` varchar(100) DEFAULT NULL,
  `n_status` int(11) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data untuk tabel `api_news_category`
--

INSERT INTO `api_news_category` (`id`, `catName`, `n_status`) VALUES
(1, 'Artikel', 1),
(2, 'Agenda', 1),
(3, 'Tentang', 1),
(4, 'Afiliasi', 1),
(5, 'Kepakaran', 1),
(6, 'Buah Pikir', 1),
(7, 'Perundangan', 1),
(8, 'Repositori', 1),
(9, 'Gallery', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_news_content`
--

CREATE TABLE IF NOT EXISTS `api_news_content` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Dumping data untuk tabel `api_news_content`
--

INSERT INTO `api_news_content` (`id`, `parentid`, `menuId`, `lid`, `lang_id`, `title`, `brief`, `content`, `image`, `thumbnail_image`, `slider_image`, `categoryid`, `articleType`, `url`, `sourceurl`, `file`, `created_date`, `expired_date`, `posted_date`, `fromwho`, `filesize`, `can_save`, `tags`, `authorid`, `n_status`, `topcontent`) VALUES
(6, 0, 0, 0, 0, 'betita', 'csaasas', 'csacacas', '', '', '', 1, 1, '', '', '', '2014-10-15 12:01:33', '0000-00-00 00:00:00', '2014-10-15 00:00:00', 0, 0, 0, '', 1, 1, 0),
(7, 0, 0, 0, 0, 'kliping', 'csasa', 'csacsacas', '', '', '', 1, 2, '', '', '', '2014-10-15 12:02:08', '0000-00-00 00:00:00', '2014-10-15 00:00:00', 0, 0, 0, '', 1, 1, 0),
(8, 0, 0, 0, 0, 'tes agenda', '', '', '', '', '', 2, 0, '', '', '', '2014-10-15 12:12:47', '2014-10-22 11:10:00', '2014-10-15 11:10:00', 0, 0, 0, '', 1, 1, 0),
(9, 0, 0, 0, 0, 'agenda 1', '', '', '', '', '', 2, 0, '', '', '', '2014-10-15 13:16:49', '2014-10-05 12:15:00', '2014-10-02 12:15:00', 0, 0, 0, '', 1, 1, 0),
(10, 0, 0, 0, 0, '', '', '', '', '', '', 0, 0, '', '', '', '2014-11-20 20:45:43', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 1, 0),
(11, 0, 0, 0, 0, '', '', '', '', '', '', 0, 0, '', '', '', '2014-11-20 20:48:45', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 1, 0),
(12, 1, 0, 0, 2, '', 'aaa', 'llalallalal', '753bd1989fccfee6f61b84492a82de60.png', '', '', 1, 0, '', '', 'http://localhost/uzbek/public_assets/news/753bd1989fccfee6f61b84492a82de60.png', '2014-11-21 14:48:37', '0000-00-00 00:00:00', '2014-11-18 00:00:00', 0, 0, 0, '', 1, 1, 0),
(13, 0, 0, 0, 1, '', 'aaa', 'aaa', '', '', '', 1, 0, '', '', '', '2014-12-03 16:22:40', '0000-00-00 00:00:00', '2014-12-02 00:00:00', 0, 0, 0, '', 1, 1, 0),
(14, 0, 0, 0, 0, '', '123', '123', '', '', '', 1, 0, '', '', '', '2014-12-03 16:37:32', '0000-00-00 00:00:00', '2014-12-03 00:00:00', 0, 0, 0, '', 1, 1, 0),
(15, 0, 0, 0, 0, '', 'alalalalal', 'alalalallalal', '', '', '', 1, 0, '', '', '', '2014-12-03 16:38:18', '0000-00-00 00:00:00', '2014-12-04 00:00:00', 0, 0, 0, '', 1, 1, 0),
(16, 0, 0, 0, 0, '', 'blabla', 'blabla', '', '', '', 1, 0, '', '', '', '2014-12-03 16:43:04', '0000-00-00 00:00:00', '2014-12-03 00:00:00', 0, 0, 0, '', 1, 1, 0),
(17, 0, 0, 0, 0, '', 'aa', 'aa', '', '', '', 1, 0, '', '', '', '2014-12-03 16:55:37', '0000-00-00 00:00:00', '2014-12-04 00:00:00', 0, 0, 0, '', 1, 1, 0),
(19, 0, 0, 0, 0, '', '234', '', '', '', '', 1, 0, '', '', '', '2014-12-03 17:03:19', '0000-00-00 00:00:00', '2014-12-04 00:00:00', 0, 0, 0, '', 1, 1, 0),
(24, 0, 0, 0, 0, 'test album', 'aslkdajlskjdla', '', '841016cb06fa8a3ef3dc3f08dfd82d7f.JPG', '', '', 9, 1, '', '', 'http://localhost/uzbek/public_assets/gallery/images/841016cb06fa8a3ef3dc3f08dfd82d7f.JPG', '2014-12-04 08:36:22', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 2, 0),
(25, 0, 0, 0, 0, 'masuk album', 'album masuk', '', 'bbbce2abc5861a1f4ccde3b9d6095f37.JPG', '', '', 9, 1, '', '', 'http://localhost/uzbek/public_assets/gallery/images/bbbce2abc5861a1f4ccde3b9d6095f37.JPG', '2014-12-04 08:37:37', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, 0, 0, '', 0, 1, 0),
(26, 0, 1, 0, 0, 'test', 'test', 'test foreign policy', '40c55ffb77356c3ae17235b747ca036d.JPG', '', '', 1, 0, '', '', 'http://localhost/uzbek/public_assets/news/40c55ffb77356c3ae17235b747ca036d.JPG', '2014-12-04 08:39:27', '0000-00-00 00:00:00', '2014-12-10 00:00:00', 0, 0, 0, '', 1, 2, 0),
(27, 0, 1, 0, 1, 'Foreign Policy', 'Objective', '&lt;h2 style=&quot;color: rgb(0, 0, 0); font-family: Verdana, Tahoma; line-height: 16px;&quot;&gt;&lt;br&gt;&lt;/h2&gt;', '', '', '', 1, 0, '', '', '', '2014-12-04 09:02:10', '0000-00-00 00:00:00', '2014-12-04 00:00:00', 0, 0, 0, '', 1, 2, 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_news_content_comment`
--

CREATE TABLE IF NOT EXISTS `api_news_content_comment` (
`id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `contentid` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date` datetime NOT NULL,
  `n_status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_news_content_repo`
--

CREATE TABLE IF NOT EXISTS `api_news_content_repo` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data untuk tabel `api_news_content_repo`
--

INSERT INTO `api_news_content_repo` (`id`, `title`, `brief`, `content`, `typealbum`, `gallerytype`, `files`, `thumbnail`, `fromwho`, `otherid`, `userid`, `created_date`, `langType`, `langTitle`, `langDesc`, `n_status`) VALUES
(1, 'dadsadsa', 'xsaaac', 'ascas', 0, 0, '', '', 0, 1, 0, '0000-00-00 00:00:00', 1, NULL, NULL, 0),
(2, 'dadsadsa', 'xsaaac', 'ascas', 0, 0, '', '', 0, 1, 0, '0000-00-00 00:00:00', 2, NULL, NULL, 0),
(3, 'dadsadsa', 'xsaaac', 'ascas', 0, 0, '', '', 0, 1, 0, '0000-00-00 00:00:00', 3, NULL, NULL, 0),
(4, '', '', '', 2, 9, 'http://localhost/uzbek/', '', 0, 25, 0, '2014-12-04 08:37:45', 0, NULL, NULL, 2),
(5, '', '', 'eb066f0ab1ea2bc140b505919d3e4b60.JPG', 2, 9, 'http://localhost/uzbek/public_assets/gallery/images/eb066f0ab1ea2bc140b505919d3e4b60.JPG', '', 0, 25, 0, '2014-12-04 08:38:01', 0, NULL, NULL, 1),
(6, '', '', 'eab52a4b38141d9a11189b64ab4691f5.JPG', 2, 9, 'http://localhost/uzbek/public_assets/gallery/images/eab52a4b38141d9a11189b64ab4691f5.JPG', '', 0, 25, 0, '2014-12-04 08:38:01', 0, NULL, NULL, 1),
(7, '', '', '43c2355752480bb3b2428ce479f2cc02.JPG', 2, 9, 'http://localhost/uzbek/public_assets/gallery/images/43c2355752480bb3b2428ce479f2cc02.JPG', '', 0, 25, 0, '2014-12-04 08:38:01', 0, NULL, NULL, 1),
(8, '', '', '56781a9adb34915ac51a436abb086e91.JPG', 2, 9, 'http://localhost/uzbek/public_assets/gallery/images/56781a9adb34915ac51a436abb086e91.JPG', '', 0, 25, 0, '2014-12-04 12:01:55', 0, NULL, NULL, 1),
(9, '', '', 'f92d1f85a5d86df745620558964dad23.JPG', 2, 9, 'http://localhost/uzbek/public_assets/gallery/images/f92d1f85a5d86df745620558964dad23.JPG', '', 0, 25, 0, '2014-12-04 12:01:55', 0, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `api_riwayat_pendidikan`
--

CREATE TABLE IF NOT EXISTS `api_riwayat_pendidikan` (
`id` int(11) NOT NULL,
  `userID` int(11) NOT NULL DEFAULT '0',
  `tahun` varchar(4) DEFAULT NULL,
  `judul` varchar(200) DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0:mtkuliah, 1:publikasi, 2:pekerjaan',
  `keterangan` varchar(300) DEFAULT NULL,
  `createDate` datetime NOT NULL,
  `n_status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=37 ;

--
-- Dumping data untuk tabel `api_riwayat_pendidikan`
--

INSERT INTO `api_riwayat_pendidikan` (`id`, `userID`, `tahun`, `judul`, `type`, `keterangan`, `createDate`, `n_status`) VALUES
(1, 10049, '2131', 'sacsa', 0, 'csac', '2014-11-17 12:47:35', 0),
(2, 10049, '2131', 'csac', 0, 'ascas', '2014-11-17 12:47:35', 0),
(3, 10049, '2131', 'csaca', 0, 'csaca', '2014-11-17 12:47:35', 0),
(4, 10049, '2131', 'cas', 1, 'csaca', '2014-11-17 12:47:35', 0),
(5, 10049, '2131', 'asc', 1, 'csa', '2014-11-17 12:47:35', 0),
(6, 10049, '2131', 'cac', 1, 'casc', '2014-11-17 12:47:35', 0),
(7, 10049, '2131', 'csaca', 2, 'csac', '2014-11-17 12:47:35', 0),
(8, 10049, '2131', 'asc', 2, 'csa', '2014-11-17 12:47:35', 0),
(9, 10049, '2131', 'csac', 2, 'casc', '2014-11-17 12:47:35', 0),
(10, 10050, '', '', 0, '', '2014-11-17 16:44:47', 0),
(11, 10050, '', '', 0, '', '2014-11-17 16:44:47', 0),
(12, 10050, '', '', 0, '', '2014-11-17 16:44:47', 0),
(13, 10050, '', '', 1, '', '2014-11-17 16:44:47', 0),
(14, 10050, '', '', 1, '', '2014-11-17 16:44:47', 0),
(15, 10050, '', '', 1, '', '2014-11-17 16:44:47', 0),
(16, 10050, '', '', 2, '', '2014-11-17 16:44:47', 0),
(17, 10050, '', '', 2, '', '2014-11-17 16:44:47', 0),
(18, 10050, '', '', 2, '', '2014-11-17 16:44:47', 0),
(19, 10050, '', '', 0, '', '2014-11-17 16:44:55', 0),
(20, 10050, '', '', 0, '', '2014-11-17 16:44:55', 0),
(21, 10050, '', '', 0, '', '2014-11-17 16:44:55', 0),
(22, 10050, '', '', 1, '', '2014-11-17 16:44:55', 0),
(23, 10050, '', '', 1, '', '2014-11-17 16:44:55', 0),
(24, 10050, '', '', 1, '', '2014-11-17 16:44:55', 0),
(25, 10050, '', '', 2, '', '2014-11-17 16:44:55', 0),
(26, 10050, '', '', 2, '', '2014-11-17 16:44:55', 0),
(27, 10050, '', '', 2, '', '2014-11-17 16:44:55', 0),
(28, 10050, '', '', 0, '', '2014-11-17 16:45:09', 0),
(29, 10050, '', '', 0, '', '2014-11-17 16:45:09', 0),
(30, 10050, '', '', 0, '', '2014-11-17 16:45:09', 0),
(31, 10050, '', '', 1, '', '2014-11-17 16:45:09', 0),
(32, 10050, '', '', 1, '', '2014-11-17 16:45:09', 0),
(33, 10050, '', '', 1, '', '2014-11-17 16:45:09', 0),
(34, 10050, '', '', 2, '', '2014-11-17 16:45:09', 0),
(35, 10050, '', '', 2, '', '2014-11-17 16:45:09', 0),
(36, 10050, '', '', 2, '', '2014-11-17 16:45:09', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `social_member`
--

CREATE TABLE IF NOT EXISTS `social_member` (
`id` int(15) NOT NULL,
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
  `password` varchar(200) DEFAULT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10051 ;

--
-- Dumping data untuk tabel `social_member`
--

INSERT INTO `social_member` (`id`, `nip`, `name`, `nickname`, `email`, `register_date`, `verified_date`, `img`, `image_profile`, `small_img`, `username`, `last_login`, `city`, `zipcode`, `sex`, `birthday`, `description`, `middle_name`, `last_name`, `StreetName`, `phone_number`, `pendidikan`, `kepakaran`, `alamatKantor`, `tlpKantor`, `keberhasilan`, `n_status`, `login_count`, `verified`, `usertype`, `email_token`, `photo_moderation`, `salt`, `password`) VALUES
(10043, NULL, 'ovan', NULL, 'ovan89@gmail.com', '2014-07-16 07:53:04', '0000-00-00 00:00:00', NULL, '', NULL, 'admin', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, NULL, 0, 'codekir v3.0', 'b2e982d12c95911b6abeacad24e256ff3fa47fdb'),
(10044, NULL, NULL, NULL, 'cscasa', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '', 0, '', 'b29ae6a39d92d241eb88425f0e249a8234ff3b59'),
(10045, NULL, NULL, NULL, 'ncjanca', '2014-11-17 03:55:48', '0000-00-00 00:00:00', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '3msajw73cieyn2ysyadi24', 0, 'ovancop1234', '57067623e9f334a4842682a961add9bd2141da1a'),
(10046, 'csaca', 'cascsa', NULL, 'nckncaknca', '2014-11-17 04:08:37', '0000-00-00 00:00:00', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, '0000-00-00', NULL, NULL, NULL, 'csacasc', 'ascasc', 'cacsa', 'csacas', 'acasca', 'csaca', NULL, 0, 0, 0, 1, 'weda23yimiys3acs27nj4y', 0, 'ovancop1234', '146b958573c7b78f11130abbb00c6f06085b9b86'),
(10047, NULL, NULL, NULL, 'cacsacas', '2014-11-17 05:43:26', '0000-00-00 00:00:00', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, '37ya2iywssi24jmed3yacn', 0, 'ovancop1234', 'db08ac19c565b170d167744edc204c751d0303ee'),
(10048, NULL, NULL, NULL, 'csaacacascas', '2014-11-17 05:44:35', '0000-00-00 00:00:00', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 1, 'a3wjes4sacmi27ny23diyy', 0, 'ovancop1234', '7919565b4c17dcc9382bb52e8ad837aba2ba21f6'),
(10049, 'csacsa', 'csacsa', NULL, 'csakmck', '2014-11-17 05:45:56', '0000-00-00 00:00:00', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, '0000-00-00', NULL, NULL, NULL, 'csasc', 'csacas', 'cacas', 'cacacsa', 'cascsa', 'csaca', 'csacsaca', 0, 0, 0, 1, 'csi2i2yae3n3y4swm7adyj', 0, 'ovancop1234', 'a4fed6a6a8cdbdb1d94317d1b3f9ef58149fe8c1'),
(10050, '', '', NULL, '', '2014-11-17 09:40:35', '0000-00-00 00:00:00', NULL, '', NULL, NULL, NULL, NULL, 0, NULL, '0000-00-00', NULL, NULL, NULL, '', '', '', '', '', '', NULL, 0, 0, 0, 1, 'es3ay23j7yy42wasiindmc', 0, 'ovancop1234', 'd822cc6212695ea7b831e481159f7acae42a5877');

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
-- Indexes for table `api_category`
--
ALTER TABLE `api_category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_contact_list`
--
ALTER TABLE `api_contact_list`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_lang`
--
ALTER TABLE `api_lang`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_member_interest`
--
ALTER TABLE `api_member_interest`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_menu_list`
--
ALTER TABLE `api_menu_list`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`), ADD UNIQUE KEY `id_2` (`id`);

--
-- Indexes for table `api_news_category`
--
ALTER TABLE `api_news_category`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `api_news_content`
--
ALTER TABLE `api_news_content`
 ADD PRIMARY KEY (`id`), ADD KEY `title` (`title`), ADD KEY `categoryid` (`categoryid`), ADD KEY `created_date` (`created_date`), ADD KEY `posted_date` (`posted_date`), ADD KEY `n_status` (`n_status`), ADD KEY `articleTypeID` (`articleType`), ADD KEY `image` (`image`), ADD KEY `parentID` (`parentid`), ADD KEY `lid` (`lid`), ADD KEY `online` (`fromwho`), ADD KEY `expired_date` (`expired_date`), ADD KEY `url` (`url`), ADD KEY `aid` (`authorid`), ADD KEY `file` (`file`), ADD KEY `slider_image` (`slider_image`), ADD KEY `sourceurl` (`filesize`), ADD KEY `thumbnail_image` (`thumbnail_image`), ADD KEY `topcontent` (`topcontent`), ADD KEY `sourceurl_2` (`sourceurl`), ADD KEY `can_save` (`can_save`);

--
-- Indexes for table `api_news_content_comment`
--
ALTER TABLE `api_news_content_comment`
 ADD PRIMARY KEY (`id`), ADD KEY `date` (`date`), ADD KEY `userid` (`userid`), ADD KEY `contentid` (`contentid`);

--
-- Indexes for table `api_news_content_repo`
--
ALTER TABLE `api_news_content_repo`
 ADD PRIMARY KEY (`id`), ADD KEY `otherid` (`otherid`), ADD KEY `IDX_typeAlbum` (`typealbum`), ADD KEY `IDX_Album_ID` (`gallerytype`), ADD KEY `IDX_FROM_WHO` (`fromwho`);

--
-- Indexes for table `api_riwayat_pendidikan`
--
ALTER TABLE `api_riwayat_pendidikan`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_member`
--
ALTER TABLE `social_member`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`), ADD UNIQUE KEY `email` (`email`);

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
-- AUTO_INCREMENT for table `api_category`
--
ALTER TABLE `api_category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `api_contact_list`
--
ALTER TABLE `api_contact_list`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `api_lang`
--
ALTER TABLE `api_lang`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `api_member_interest`
--
ALTER TABLE `api_member_interest`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `api_menu_list`
--
ALTER TABLE `api_menu_list`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `api_news_category`
--
ALTER TABLE `api_news_category`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `api_news_content`
--
ALTER TABLE `api_news_content`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `api_news_content_comment`
--
ALTER TABLE `api_news_content_comment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `api_news_content_repo`
--
ALTER TABLE `api_news_content_repo`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `api_riwayat_pendidikan`
--
ALTER TABLE `api_riwayat_pendidikan`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `social_member`
--
ALTER TABLE `social_member`
MODIFY `id` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10051;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
