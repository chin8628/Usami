-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2017 at 01:33 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `usami`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `user_id` varchar(20) NOT NULL,
  `image_id` varchar(20) NOT NULL,
  `text` varchar(140) NOT NULL,
  `comm_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`user_id`, `image_id`, `text`, `comm_date`) VALUES
('Chiibi', '-56842990', 'Nice', '2017-04-24 05:46:19'),
('Chiibi1', '294815608', 'Good !!', '2017-04-24 01:06:33'),
('Chiibi1', '294815608', 'Nice !! Wow', '2017-04-24 01:06:46'),
('Chiibi2', '385936678', 'Nice', '2017-04-24 05:24:51');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `image_id` varchar(20) NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `image_name` varchar(50) NOT NULL,
  `desc` varchar(140) NOT NULL,
  `upload_date` datetime NOT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  `view` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`image_id`, `image_url`, `image_name`, `desc`, `upload_date`, `user_id`, `view`, `status`) VALUES
('-1078009130', '-1078009130.jpg', 'Tracer', '', '2017-04-24 05:27:45', 'Chiibi3', 1, 1),
('-1149498279', '-1149498279.jpg', 'Pic 1', '', '2017-04-23 23:51:55', 'Chiibi', 10, 1),
('-1585196128', '-1585196128.jpg', 'Pic 13', '', '2017-04-23 23:58:02', 'Chiibi', 1, 1),
('-1604400921', '-1604400921.jpg', 'Cat C3', '', '2017-04-24 05:59:23', 'seller', 1, 1),
('-1623576831', '-1623576831.jpg', 'Pic 14', '', '2017-04-23 23:58:12', 'Chiibi', 3, 1),
('-1662876864', '-1662876864.jpg', 'Pic 15', '', '2017-04-23 23:58:21', 'Chiibi', 1, 1),
('-1722495292', '-1722495292.jpg', 'Pic 16', '', '2017-04-23 23:58:29', 'Chiibi', 3, 1),
('-1729948824', '-1729948824.jpg', 'Lion C2', '', '2017-04-24 05:58:55', 'seller', 1, 1),
('-1796791959', '-1796791959.jpg', 'Pic 19', '', '2017-04-24 05:22:06', 'Chiibi2', 1, 1),
('-1894008760', '-1894008760.jpg', 'RedRoad', '', '2017-04-24 05:50:35', 'Chiibi5', 3, 1),
('-2104915208', '-2104915208.jpg', 'Lion C1', '', '2017-04-24 05:58:28', 'seller', 1, 1),
('-2125187662', '-2125187662.jpg', 'hanabi', '', '2017-04-24 05:40:33', 'Chiibi4', 1, 1),
('-321797247', '-321797247.jpg', 'Pic 17', '', '2017-04-24 00:25:11', 'Chiibi1', 1, 1),
('-324703581', '-324703581.jpg', 'D.va', '', '2017-04-24 05:29:34', 'Chiibi3', 1, 1),
('-56842990', '-56842990.jpg', 'Mercy', '', '2017-04-24 05:30:49', 'Chiibi3', 8, 1),
('-786878374', '-786878374.jpg', 'patosia', '', '2017-04-24 05:49:39', 'Chiibi5', 1, 1),
('-807983824', '-807983824.jpg', 'Widowmaker', '', '2017-04-24 05:28:56', 'Chiibi3', 1, 1),
('-811190127', '-811190127.jpg', 'Pic 9', '', '2017-04-23 23:54:33', 'Chiibi', 1, 1),
('-830998132', '-830998132.jpg', 'Pic 8', '', '2017-04-23 23:54:02', 'Chiibi', 2, 1),
('-920785620', '-920785620.jpg', 'Dragon C3 Wizz', '', '2017-04-24 06:01:06', 'seller', 1, 1),
('-981005062', '-981005062.jpg', 'BladeBlue', '', '2017-04-24 05:35:04', 'Chiibi4', 1, 1),
('101280909', '101280909.jpg', 'Fox C3', '', '2017-04-24 06:00:56', 'seller', 1, 1),
('1163477264', '1163477264.jpg', 'Pic 20', '', '2017-04-24 05:22:52', 'Chiibi2', 1, 1),
('1178956604', '1178956604.jpg', 'Pic 12', '', '2017-04-23 23:57:54', 'Chiibi', 1, 1),
('1194386770', '1194386770.jpg', 'Lotalin', '', '2017-04-24 05:41:56', 'Chiibi4', 3, 1),
('1214565345', '1214565345.jpg', 'Pic 11', '', '2017-04-23 23:57:41', 'Chiibi', 1, 0),
('1254789218', '1254789218.jpg', 'Pic 10', '', '2017-04-23 23:57:33', 'Chiibi', 5, 1),
('1381781579', '1381781579.jpg', 'Mei', '', '2017-04-24 05:30:15', 'Chiibi3', 1, 1),
('1448409822', '1448409822.jpg', 'Cabinia', '', '2017-04-24 05:44:08', 'Chiibi5', 1, 1),
('1463293600', '1463293600.jpg', 'Althem of heart', '', '2017-04-24 05:33:11', 'Chiibi4', 1, 1),
('1550626525', '1550626525.jpg', 'Buffalo C3 Gladiator', '', '2017-04-24 06:00:28', 'seller', 1, 1),
('1904533069', '1904533069.jpg', 'Pic 7', '', '2017-04-23 23:53:44', 'Chiibi', 1, 1),
('1904746823', '1904746823.jpg', 'Pic 22', '', '2017-04-24 05:25:31', 'Chiibi2', 1, 1),
('1958022378', '1958022378.jpg', 'Lelia', '', '2017-04-24 05:37:13', 'Chiibi4', 1, 1),
('199386628', '199386628.jpg', 'Pic 21', '', '2017-04-24 05:24:20', 'Chiibi2', 3, 1),
('260125115', '260125115.jpg', 'Pic 6', '', '2017-04-23 23:52:57', 'Chiibi', 2, 1),
('294815608', '294815608.jpg', 'Pic 5', '', '2017-04-23 23:52:43', 'Chiibi', 7, 1),
('324807966', '324807966.jpg', 'Dragon C3 Light', '', '2017-04-24 05:59:58', 'seller', 1, 1),
('331339223', '331339223.jpg', 'Pic 4', '', '2017-04-23 23:52:31', 'Chiibi', 6, 1),
('347555385', '347555385.jpg', 'Pic 3', '', '2017-04-23 23:52:18', 'Chiibi', 3, 1),
('385936678', '385936678.jpg', 'Pic 2', '', '2017-04-23 23:52:08', 'Chiibi', 5, 1),
('531725457', '531725457.jpg', 'Phara', '', '2017-04-24 05:28:15', 'Chiibi3', 1, 1),
('806199820', '806199820.jpg', 'Fox C3 Assassin', '', '2017-04-24 06:02:09', 'seller', 1, 1),
('94569875', '94569875.jpg', 'Pic 9', '', '2017-04-23 23:57:24', 'Chiibi', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` varchar(20) NOT NULL,
  `price` float NOT NULL,
  `pgroup_id` varchar(20) NOT NULL,
  `image_id` varchar(20) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `price`, `pgroup_id`, `image_id`, `user_id`) VALUES
('-1053751011', 0, 'usr', '-1722495292', 'Chiibi'),
('-1106901455', 0, 'usr', '-786878374', 'Chiibi5'),
('-1158062506', 0, 'usr', '-2125187662', 'Chiibi4'),
('-1171590146', 0, 'usr', '1958022378', 'Chiibi4'),
('-1202530424', 300, 'usr', '-1604400921', 'seller'),
('-1345060056', 0, 'usr', '-1894008760', 'Chiibi5'),
('-1366724815', 250, 'usr', '-1623576831', 'Chiibi'),
('-1410765213', 0, 'usr', '-324703581', 'Chiibi3'),
('-148402767', 0, 'usr', '1163477264', 'Chiibi2'),
('-1715264401', 0, 'usr', '-1796791959', 'Chiibi2'),
('-1844814225', 0, 'usr', '-811190127', 'Chiibi'),
('-2081418904', 0, 'usr', '-981005062', 'Chiibi4'),
('-2109033527', 0, 'usr', '-807983824', 'Chiibi3'),
('-219728845', 0, 'usr', '531725457', 'Chiibi3'),
('-288410795', 300, 'usr', '1550626525', 'seller'),
('-340692637', 450, 'usr', '101280909', 'seller'),
('-362386462', 0, 'usr', '260125115', 'Chiibi'),
('-393694233', 450, 'usr', '-920785620', 'seller'),
('-410626498', 250, 'usr', '331339223', 'Chiibi'),
('-5510375', 0, 'usr', '-1662876864', 'Chiibi'),
('-749236452', 0, 'usr', '294815608', 'Chiibi'),
('-837036461', 0, 'usr', '-56842990', 'Chiibi3'),
('1271931672', 0, 'usr', '1904533069', 'Chiibi'),
('1286407933', 430, 'usr', '-321797247', 'Chiibi1'),
('140453681', 400, 'usr', '94569875', 'Chiibi'),
('1586364343', 0, 'usr', '1904746823', 'Chiibi2'),
('1601173273', 0, 'usr', '347555385', 'Chiibi'),
('1661266979', 0, 'usr', '199386628', 'Chiibi2'),
('1664270306', 0, 'usr', '-830998132', 'Chiibi'),
('1704646382', 320, 'usr', '806199820', 'seller'),
('1780938114', 400, 'usr', '1254789218', 'Chiibi'),
('1794236619', 300, 'usr', '-1729948824', 'seller'),
('1812115806', 200, 'usr', '-2104915208', 'seller'),
('1945448117', 100, 'usr', '-1149498279', 'Chiibi'),
('2021107859', 0, 'usr', '1381781579', 'Chiibi3'),
('2036006494', 0, 'usr', '1178956604', 'Chiibi'),
('2116663769', 300, 'usr', '324807966', 'seller'),
('575923115', 0, 'usr', '385936678', 'Chiibi'),
('587692017', 0, 'usr', '1194386770', 'Chiibi4'),
('754430244', 0, 'usr', '1463293600', 'Chiibi4'),
('82519400', 0, 'usr', '-1078009130', 'Chiibi3'),
('851328397', 650, 'usr', '-1585196128', 'Chiibi'),
('949761812', 0, 'usr', '1448409822', 'Chiibi5'),
('prm30', 1000, 'prm', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_group`
--

CREATE TABLE `product_group` (
  `pgroup_id` varchar(20) NOT NULL,
  `pgroup_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_group`
--

INSERT INTO `product_group` (`pgroup_id`, `pgroup_name`) VALUES
('prm', 'premium'),
('usr', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `user_id` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `profile_image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`user_id`, `first_name`, `last_name`, `birthdate`, `profile_image`) VALUES
('admin', 'Admin', '', NULL, 'profile-placeholder.jpg'),
('Chiibi', 'Capoo', 'Bugcat', NULL, '2017431404.jpg'),
('Chiibi1', 'Chiibi', 'Buki', NULL, 'profile-placeholder.jpg'),
('Chiibi2', 'Choo', 'Choo', NULL, 'profile-placeholder.jpg'),
('Chiibi3', 'Kamoo', 'Kamoo', NULL, 'profile-placeholder.jpg'),
('Chiibi4', 'Yolo', '', NULL, 'profile-placeholder.jpg'),
('Chiibi5', 'mashmallow', '', NULL, 'profile-placeholder.jpg'),
('Seller', 'Merchant', '', NULL, 'profile-placeholder.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `profile_focus`
--

CREATE TABLE `profile_focus` (
  `user_id` varchar(20) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile_focus`
--

INSERT INTO `profile_focus` (`user_id`, `tag_id`) VALUES
('Chiibi', 49),
('Chiibi', 51),
('Chiibi', 122),
('Chiibi1', 49),
('Chiibi2', 51);

-- --------------------------------------------------------

--
-- Table structure for table `tag`
--

CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL,
  `tag_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag`
--

INSERT INTO `tag` (`tag_id`, `tag_name`) VALUES
(48, ''),
(49, 'kimi-no-nawa'),
(50, 'japan'),
(51, 'anime'),
(52, 'retro'),
(53, 'sci-fi'),
(54, 'overwatch'),
(55, 'dragonball'),
(56, 'game'),
(57, 'manga'),
(58, 'cartoon'),
(59, 'cute'),
(60, 'loli'),
(61, 'lolicon'),
(62, 'acrylic'),
(63, 'drawing'),
(64, 'attack-on-titan'),
(65, 'doramon'),
(66, 'conan'),
(67, 'makoto'),
(68, 'chinkai'),
(69, 'oda'),
(70, 'one-piece'),
(71, 'ไทย'),
(72, 'ประยุทธ์'),
(73, 'นายก'),
(74, 'อาหาร'),
(75, 'ขนม'),
(76, 'วิว'),
(77, 'ธรรมชาติ'),
(78, 'space'),
(79, 'love'),
(80, 'ความรัก'),
(81, 'ระเบิด'),
(82, '1990'),
(83, '90\'s'),
(84, 'computer'),
(85, 'robot'),
(86, 'bot'),
(87, 'natural'),
(88, 'working'),
(89, 'work'),
(90, 'business'),
(91, 'sport'),
(92, 'กีฬา'),
(93, 'ผี'),
(94, 'สยอง'),
(95, 'สยองขวัญ'),
(96, 'น่ากลัว'),
(97, 'ตลก'),
(98, 'ฮา'),
(99, 'การ์ตูน'),
(100, 'yuri'),
(101, 'gags'),
(102, 'fire'),
(103, 'ไฟ'),
(104, 'น้ำ'),
(105, 'ดิน'),
(106, 'ลม'),
(107, 'flower'),
(108, 'dark'),
(109, 'purple'),
(110, 'orange'),
(111, 'white'),
(112, 'chiibi'),
(113, 'ชีวิต'),
(114, 'isad'),
(115, 'webpro'),
(116, 'database'),
(117, 'give'),
(118, 'me'),
(119, 'a'),
(120, 'please'),
(121, 'red'),
(122, 'girl'),
(123, 'fantasy'),
(124, 'fastasy'),
(125, 'cool'),
(126, 'blue'),
(127, 'fan-art'),
(128, 'black'),
(129, 'spider'),
(130, 'widow'),
(131, 'sniper'),
(132, 'asia'),
(133, 'korea'),
(134, 'ice'),
(135, 'evil'),
(136, 'drama'),
(137, 'magic'),
(138, 'warm'),
(139, 'night'),
(140, 'art'),
(141, 'firework'),
(142, 'hollow'),
(143, 'house'),
(144, 'gray'),
(145, 'bloodly'),
(146, 'blade'),
(147, 'trickster');

-- --------------------------------------------------------

--
-- Table structure for table `tag_has`
--

CREATE TABLE `tag_has` (
  `tag_id` int(11) NOT NULL,
  `image_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tag_has`
--

INSERT INTO `tag_has` (`tag_id`, `image_id`) VALUES
(48, '-1149498279'),
(48, '-1585196128'),
(48, '-1662876864'),
(48, '-321797247'),
(48, '-811190127'),
(48, '-830998132'),
(48, '1178956604'),
(48, '1254789218'),
(48, '1904533069'),
(48, '260125115'),
(48, '294815608'),
(48, '347555385'),
(48, '385936678'),
(48, '94569875'),
(49, '-1623576831'),
(49, '331339223'),
(50, '199386628'),
(50, '331339223'),
(51, '-1623576831'),
(51, '-1796791959'),
(51, '-1894008760'),
(51, '1194386770'),
(51, '1463293600'),
(51, '1904746823'),
(51, '199386628'),
(51, '331339223'),
(52, '-1722495292'),
(53, '-1722495292'),
(53, '-324703581'),
(53, '-981005062'),
(54, '-1078009130'),
(54, '-1722495292'),
(54, '-324703581'),
(54, '-56842990'),
(54, '-807983824'),
(54, '1381781579'),
(54, '531725457'),
(55, '-1722495292'),
(56, '-1078009130'),
(56, '-1604400921'),
(56, '-1722495292'),
(56, '-1729948824'),
(56, '-2104915208'),
(56, '-324703581'),
(56, '-56842990'),
(56, '-807983824'),
(56, '531725457'),
(56, '806199820'),
(57, '-1722495292'),
(58, '-1722495292'),
(59, '-1722495292'),
(59, '-324703581'),
(59, '-56842990'),
(59, '1381781579'),
(59, '199386628'),
(60, '-1722495292'),
(60, '199386628'),
(61, '-1722495292'),
(62, '-1722495292'),
(63, '-1722495292'),
(64, '-1722495292'),
(65, '-1722495292'),
(66, '-1722495292'),
(67, '-1722495292'),
(68, '-1722495292'),
(69, '-1722495292'),
(70, '-1722495292'),
(71, '-1722495292'),
(72, '-1722495292'),
(73, '-1722495292'),
(74, '-1722495292'),
(75, '-1722495292'),
(76, '-1722495292'),
(77, '-1722495292'),
(78, '-1722495292'),
(79, '-1722495292'),
(80, '-1722495292'),
(81, '-1722495292'),
(82, '-1722495292'),
(83, '-1722495292'),
(84, '-1722495292'),
(85, '-1722495292'),
(85, '-324703581'),
(86, '-1722495292'),
(87, '-1722495292'),
(88, '-1722495292'),
(89, '-1722495292'),
(90, '-1722495292'),
(91, '-1722495292'),
(92, '-1722495292'),
(93, '-1722495292'),
(94, '-1722495292'),
(95, '-1722495292'),
(96, '-1722495292'),
(97, '-1722495292'),
(98, '-1722495292'),
(99, '-1722495292'),
(100, '-1722495292'),
(101, '-1722495292'),
(102, '-1722495292'),
(103, '-1722495292'),
(104, '-1722495292'),
(105, '-1722495292'),
(106, '-1722495292'),
(107, '-1722495292'),
(107, '1194386770'),
(108, '-1722495292'),
(108, '-1894008760'),
(108, '-2125187662'),
(108, '-981005062'),
(109, '-1722495292'),
(109, '-807983824'),
(110, '-1722495292'),
(111, '-1722495292'),
(112, '-1722495292'),
(113, '-1722495292'),
(114, '-1722495292'),
(115, '-1722495292'),
(116, '-1722495292'),
(117, '-1722495292'),
(118, '-1722495292'),
(119, '-1722495292'),
(119, '1163477264'),
(120, '-1722495292'),
(121, '-1796791959'),
(121, '-1894008760'),
(122, '-1796791959'),
(122, '-324703581'),
(122, '1194386770'),
(122, '1463293600'),
(122, '199386628'),
(123, '-1796791959'),
(123, '-786878374'),
(123, '1194386770'),
(123, '1448409822'),
(123, '1904746823'),
(124, '1163477264'),
(124, '1958022378'),
(125, '1163477264'),
(125, '1194386770'),
(125, '1904746823'),
(126, '1163477264'),
(126, '1958022378'),
(127, '-1078009130'),
(127, '-56842990'),
(127, '1381781579'),
(128, '531725457'),
(129, '-807983824'),
(130, '-807983824'),
(131, '-807983824'),
(132, '-324703581'),
(132, '1381781579'),
(133, '-324703581'),
(134, '1381781579'),
(135, '1381781579'),
(136, '-981005062'),
(136, '1463293600'),
(137, '1958022378'),
(138, '-2125187662'),
(139, '-2125187662'),
(140, '-1894008760'),
(140, '-2125187662'),
(141, '-2125187662'),
(142, '1448409822'),
(143, '1448409822'),
(144, '1448409822'),
(145, '-1894008760'),
(146, '-1894008760'),
(147, '-1604400921'),
(147, '-1729948824'),
(147, '-2104915208'),
(147, '-920785620'),
(147, '101280909'),
(147, '1550626525'),
(147, '324807966'),
(147, '806199820');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `tran_id` int(11) NOT NULL,
  `user_id` varchar(20) CHARACTER SET utf8 NOT NULL,
  `tran_type` varchar(3) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`tran_id`, `user_id`, `tran_type`, `amount`, `date`) VALUES
(16, 'Chiibi', 'DEP', 5000, '2017-04-24 00:17:06'),
(17, 'Chiibi', 'BPR', 1000, '2017-04-24 00:17:14'),
(18, 'Chiibi1', 'DEP', 2000, '2017-04-24 00:24:09'),
(19, 'Chiibi', 'ASO', 650, '2017-04-24 00:24:20'),
(20, 'Chiibi', 'ASO', 400, '2017-04-24 00:24:20'),
(21, 'Chiibi1', 'BAR', 1050, '2017-04-24 00:24:20'),
(22, 'Chiibi1', 'BPR', 1000, '2017-04-24 00:24:29'),
(23, 'Chiibi4', 'DEP', 1000, '2017-04-24 05:38:47'),
(24, 'Chiibi1', 'ASO', 430, '2017-04-24 05:38:56'),
(25, 'Chiibi4', 'BAR', 430, '2017-04-24 05:38:56'),
(26, 'Chiibi5', 'DEP', 1000, '2017-04-24 05:44:41'),
(27, 'Chiibi1', 'ASO', 430, '2017-04-24 05:46:48'),
(28, 'Chiibi', 'BAR', 430, '2017-04-24 05:46:48'),
(29, 'seller', 'DEP', 10000, '2017-04-24 05:57:51'),
(30, 'seller', 'BPR', 1000, '2017-04-24 05:57:59');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(50) NOT NULL,
  `coin` int(11) NOT NULL,
  `exp_date` datetime NOT NULL,
  `u_type` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `password`, `email`, `coin`, `exp_date`, `u_type`) VALUES
('admin', '00AE8AD42D0C586971025A1B94B757521667CB00019106911EDCCFD8DC1C7A2B', 'admin@gm.com', 0, '2017-04-24 02:15:58', 'ADM'),
('Chiibi', '71A642A1DE7611AB7544A61A0C686F903651A1D4D57A4AA6F262FB871C0DD719', 'Capoo@gmail.com', 24620, '2017-05-24 00:17:14', 'PRM'),
('Chiibi1', '71A642A1DE7611AB7544A61A0C686F903651A1D4D57A4AA6F262FB871C0DD719', 'buki@hotmail.com', 8810, '2017-05-24 00:24:29', 'PRM'),
('Chiibi2', '71A642A1DE7611AB7544A61A0C686F903651A1D4D57A4AA6F262FB871C0DD719', 'yoha@hotmail.com', 0, '2017-04-24 05:20:40', 'STD'),
('Chiibi3', '71A642A1DE7611AB7544A61A0C686F903651A1D4D57A4AA6F262FB871C0DD719', 'kamoo@ka.com', 0, '2017-04-24 05:26:30', 'STD'),
('Chiibi4', '71A642A1DE7611AB7544A61A0C686F903651A1D4D57A4AA6F262FB871C0DD719', 'yolo@lo.th', 4570, '2017-04-24 05:31:58', 'STD'),
('Chiibi5', '71A642A1DE7611AB7544A61A0C686F903651A1D4D57A4AA6F262FB871C0DD719', 'mash@low.com', 5000, '2017-04-24 05:42:55', 'STD'),
('Seller', '71A642A1DE7611AB7544A61A0C686F903651A1D4D57A4AA6F262FB871C0DD719', 'sell@g.com', 49000, '2017-05-24 05:57:59', 'PRM');

-- --------------------------------------------------------

--
-- Table structure for table `user_buy`
--

CREATE TABLE `user_buy` (
  `user_id` varchar(20) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `buy_date` datetime NOT NULL,
  `buy_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_buy`
--

INSERT INTO `user_buy` (`user_id`, `product_id`, `buy_date`, `buy_price`) VALUES
('Chiibi', '1286407933', '2017-04-24 05:46:48', 430),
('Chiibi1', '1780938114', '2017-04-24 00:24:20', 400),
('Chiibi1', '851328397', '2017-04-24 00:24:20', 650),
('Chiibi4', '1286407933', '2017-04-24 05:38:56', 430);

-- --------------------------------------------------------

--
-- Table structure for table `user_favorite`
--

CREATE TABLE `user_favorite` (
  `user_id` varchar(20) NOT NULL,
  `image_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_favorite`
--

INSERT INTO `user_favorite` (`user_id`, `image_id`) VALUES
('Chiibi1', '294815608'),
('Chiibi2', '385936678');

-- --------------------------------------------------------

--
-- Table structure for table `user_follow`
--

CREATE TABLE `user_follow` (
  `user_id` varchar(20) NOT NULL,
  `follower_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_follow`
--

INSERT INTO `user_follow` (`user_id`, `follower_id`) VALUES
('Chiibi', 'Chiibi1'),
('Chiibi', 'Chiibi2'),
('Chiibi', 'Chiibi3'),
('Chiibi', 'Chiibi4'),
('Chiibi', 'Chiibi5'),
('Chiibi2', 'Chiibi'),
('Chiibi3', 'Chiibi'),
('Chiibi4', 'Chiibi'),
('Chiibi5', 'Chiibi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`user_id`,`image_id`,`comm_date`),
  ADD KEY `comm_image_id_idx` (`image_id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `img_user_id_idx` (`user_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `prod_pgroup_id_idx` (`pgroup_id`),
  ADD KEY `prod_image_id_idx` (`image_id`),
  ADD KEY `user_id_idx` (`user_id`);

--
-- Indexes for table `product_group`
--
ALTER TABLE `product_group`
  ADD PRIMARY KEY (`pgroup_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- Indexes for table `profile_focus`
--
ALTER TABLE `profile_focus`
  ADD PRIMARY KEY (`user_id`,`tag_id`),
  ADD KEY `prof_tag_id_idx` (`tag_id`);

--
-- Indexes for table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `tag_has`
--
ALTER TABLE `tag_has`
  ADD PRIMARY KEY (`tag_id`,`image_id`),
  ADD KEY `th_image_id_idx` (`image_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`tran_id`),
  ADD KEY `tran_user_fk` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_buy`
--
ALTER TABLE `user_buy`
  ADD PRIMARY KEY (`user_id`,`product_id`),
  ADD KEY `ubuy_product_id_idx` (`product_id`);

--
-- Indexes for table `user_favorite`
--
ALTER TABLE `user_favorite`
  ADD PRIMARY KEY (`user_id`,`image_id`),
  ADD KEY `uf_image_id_idx` (`image_id`);

--
-- Indexes for table `user_follow`
--
ALTER TABLE `user_follow`
  ADD PRIMARY KEY (`user_id`,`follower_id`),
  ADD KEY `ufo_follower_id_idx` (`follower_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tag`
--
ALTER TABLE `tag`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `tran_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comm_image_id` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `comm_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `img_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `prod_image_id` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `prod_pgroup_id` FOREIGN KEY (`pgroup_id`) REFERENCES `product_group` (`pgroup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Constraints for table `profile`
--
ALTER TABLE `profile`
  ADD CONSTRAINT `pro_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `profile_focus`
--
ALTER TABLE `profile_focus`
  ADD CONSTRAINT `prof_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prof_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `tag_has`
--
ALTER TABLE `tag_has`
  ADD CONSTRAINT `th_image_id` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `th_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `tran_user_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_buy`
--
ALTER TABLE `user_buy`
  ADD CONSTRAINT `ubuy_product_id` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `ubuy_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_favorite`
--
ALTER TABLE `user_favorite`
  ADD CONSTRAINT `ufav_image_id` FOREIGN KEY (`image_id`) REFERENCES `image` (`image_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `ufav_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_follow`
--
ALTER TABLE `user_follow`
  ADD CONSTRAINT `ufo_follower_id` FOREIGN KEY (`follower_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `ufo_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
