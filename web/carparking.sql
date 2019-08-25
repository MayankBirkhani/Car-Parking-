-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 28, 2019 at 04:59 AM
-- Server version: 5.1.53
-- PHP Version: 5.3.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `carparking`
--

-- --------------------------------------------------------

--
-- Table structure for table `checkinout`
--

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
('123456', '2019-03-27', 'slot1', 'base1', '16:55', '16:56', 'checkedout');

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

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
-- Table structure for table `slot`
--

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
