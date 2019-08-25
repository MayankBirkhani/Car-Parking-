-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Apr 18, 2019 at 05:54 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carparking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `contact`, `email`, `address`, `username`, `password`) VALUES
(1, 'admin', '987456123', 'admin@gmail.com', 'Delhi', 'admin', 'admin@123');

-- --------------------------------------------------------

--
-- Table structure for table `checkinout`
--

DROP TABLE IF EXISTS `checkinout`;
CREATE TABLE IF NOT EXISTS `checkinout` (
  `carno` varchar(20) NOT NULL,
  `date` varchar(20) NOT NULL,
  `slotid` varchar(20) NOT NULL,
  `floorid` varchar(20) NOT NULL,
  `intime` varchar(20) NOT NULL,
  `outtime` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `checkinout`
--

INSERT INTO `checkinout` (`carno`, `date`, `slotid`, `floorid`, `intime`, `outtime`, `status`) VALUES
('UK041234', '2019-03-26', 'slot2', 'base1', '15:56', '', 'checkedin'),
('UK048833', '2019-03-26', 'slot1', 'base1', '15:54', '', 'checkedin'),
('UK042345', '2019-03-26', 'slot3', 'base1', '15:58', '', 'checkedin'),
('UK044567', '2019-03-26', 'slot4', 'base1', '15:59', '', 'checkedin'),
('UK044567', '2019-03-26', 'slot5', 'base1', '16:00', '', 'checkedin'),
('UK045678', '2019-03-26', 'slot5', 'base2', '16:00', '', 'checkedin'),
('UK043456', '2019-03-27', 'slot1', 'base1', '10:08', '13:05', 'checkedout'),
('UK043456', '2019-03-27', 'slot1', 'base1', '13:06', '13:09', 'checkedout'),
('UK043456', '2019-03-27', 'slot1', 'base1', '13:11', '13:14', 'checkedout'),
('123456', '2019-03-27', 'slot1', 'base1', '16:55', '16:56', 'checkedout'),
('UK042345', '2019-03-28', 'slot1', 'base1', '10:36', '10:37', 'checkedout'),
('uk5555', '2019-03-28', 'slot10', 'base3', '17:24', '', 'checkedin'),
('', '', '', '', '', '', 'checkedin'),
('UK2023', '2019-04-09', 'slot1', 'base1', '23:24', '', 'checkedin'),
('UK4578', '2019-04-10', 'slot1', 'base1', '10:22', '', 'checkedin'),
('suk5566', '2019-04-13', 'slot1', 'base1', '19:27', '', 'checkedin');

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

DROP TABLE IF EXISTS `floor`;
CREATE TABLE IF NOT EXISTS `floor` (
  `floorid` varchar(30) NOT NULL,
  `no_of_slots` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `floor`
--

INSERT INTO `floor` (`floorid`, `no_of_slots`) VALUES
('base1', 10),
('base2', 10),
('base3', 10);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `logindate` varchar(255) NOT NULL,
  `logintime` varchar(255) NOT NULL,
  `logoutdate` varchar(255) NOT NULL,
  `logouttime` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `logindate`, `logintime`, `logoutdate`, `logouttime`) VALUES
('karan', 'karan@123', '17/04/2019', '05.44.20pm', '17/04/2019', '03.03.53pm'),
('raman', 'raman@123', '17/04/2019', '05.46.02pm', '17/04/2019', '01.36.59pm'),
('karan', 'karan@123', '17/04/2019', '06.06.49pm', '17/04/2019', '03.03.53pm'),
('karan', 'karan@123', '17/04/2019', '06.09.53pm', '17/04/2019', '03.03.53pm'),
('karan', 'karan@123', '17/04/2019', '06.58.58pm', '17/04/2019', '03.03.53pm'),
('raman', 'raman@123', '17/04/2019', '07.02.59pm', '17/04/2019', '01.36.59pm');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
CREATE TABLE IF NOT EXISTS `register` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `DOB` varchar(255) NOT NULL,
  `age` int(3) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `firstname`, `lastname`, `DOB`, `age`, `contact`, `email`, `username`, `password`, `address`, `gender`) VALUES
(1, 'karan', 'rathor', '1999-01-01', 20, '545454', 'karan@gmail.com', 'karan', 'karan@123', 'tikonia, haldwani', 'male'),
(2, 'raman', 'gupta', '2000-03-10', 19, '789845', 'raman@gmail.com', 'raman', 'raman@123', 'gujrat', 'male'),
(3, 'nitin', 'rastogi', '1996-04-19', 23, '784565', 'nitin@gmail.com', 'nitin', 'nitin@123', 'mukhani, haldwani', 'male'),
(4, 'rakesh', 'joshi', '1995-07-07', 24, '456545', 'rakesh@gmail.com', 'rakesh', 'rakesh@123', 'punjab', 'male');

-- --------------------------------------------------------

--
-- Table structure for table `slot`
--

DROP TABLE IF EXISTS `slot`;
CREATE TABLE IF NOT EXISTS `slot` (
  `slotid` varchar(20) NOT NULL,
  `floorid` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slot`
--

INSERT INTO `slot` (`slotid`, `floorid`) VALUES
('slot1', 'base1'),
('slot2', 'base1'),
('slot3', 'base1'),
('slot4', 'base1'),
('slot5', 'base1'),
('slot6', 'base1'),
('slot7', 'base1'),
('slot8', 'base1'),
('slot9', 'base1'),
('slot10', 'base1'),
('slot1', 'base2'),
('slot2', 'base2'),
('slot3', 'base2'),
('slot4', 'base2'),
('slot5', 'base2'),
('slot6', 'base2'),
('slot7', 'base2'),
('slot8', 'base2'),
('slot9', 'base2'),
('slot10', 'base2'),
('slot1', 'base3'),
('slot2', 'base3'),
('slot3', 'base3'),
('slot4', 'base3'),
('slot5', 'base3'),
('slot6', 'base3'),
('slot7', 'base3'),
('slot8', 'base3'),
('slot9', 'base3'),
('slot10', 'base3');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
