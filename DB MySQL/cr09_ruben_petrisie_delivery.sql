-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2020 at 02:36 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_ruben_petrisie_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_ruben_petrisie_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_ruben_petrisie_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `fk_c_address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `fk_c_address`) VALUES
(101, 'Jhon', 'Bazo', 1),
(102, 'Mark', 'Duard', 2),
(103, 'Brat', 'Danielsen', 3),
(104, 'Vera', 'Duard', 1);

-- --------------------------------------------------------

--
-- Table structure for table `c_address`
--

CREATE TABLE `c_address` (
  `c_address_id` int(11) NOT NULL,
  `street` varchar(50) NOT NULL,
  `zip` varchar(50) NOT NULL,
  `city` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `c_address`
--

INSERT INTO `c_address` (`c_address_id`, `street`, `zip`, `city`) VALUES
(1, 'BelAir Ave', '500', 'Sugar'),
(2, 'entralGarden Str', '457', 'Napels'),
(3, 'Boulevard Ave', '3110', 'Cali');

-- --------------------------------------------------------

--
-- Table structure for table `drop_station`
--

CREATE TABLE `drop_station` (
  `drop_station_id` int(11) NOT NULL,
  `ds_address` varchar(50) DEFAULT NULL,
  `fk_package_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `fk_ds_hours` int(11) DEFAULT NULL,
  `fk_mds` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `drop_station`
--

INSERT INTO `drop_station` (`drop_station_id`, `ds_address`, `fk_package_id`, `customer_id`, `fk_ds_hours`, `fk_mds`) VALUES
(20, 'Grand Garden str', 4, 104, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ds_hours`
--

CREATE TABLE `ds_hours` (
  `ds_hours` int(11) NOT NULL,
  `open_hrs` time DEFAULT NULL,
  `close_hrs` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ds_hours`
--

INSERT INTO `ds_hours` (`ds_hours`, `open_hrs`, `close_hrs`) VALUES
(2017, '08:30:00', '19:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `fk_mds` int(11) DEFAULT NULL,
  `fk_process` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `package_id`, `fk_mds`, `fk_process`) VALUES
(12, 'Mark', 'Andersons', 4, NULL, 1),
(13, 'Lissy', 'Kempel', 2, NULL, 2),
(14, 'Sander', 'Green', 1, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `mds`
--

CREATE TABLE `mds` (
  `mds_id` int(11) NOT NULL,
  `mds_address` varchar(50) DEFAULT NULL,
  `mds_holidays` datetime DEFAULT NULL,
  `fk_employee` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `mds`
--

INSERT INTO `mds` (`mds_id`, `mds_address`, `mds_holidays`, `fk_employee`, `package_id`) VALUES
(1, 'Mercury Str', '2020-11-11 13:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `package_id` int(11) NOT NULL,
  `package_weight` float DEFAULT NULL,
  `package_cost` float DEFAULT NULL,
  `fk_customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`package_id`, `package_weight`, `package_cost`, `fk_customer_id`) VALUES
(1, 1.5, 2, 101),
(2, 2.1, 2.5, 102),
(3, 2.5, 3.2, 103),
(4, 3.9, 5.25, 104);

-- --------------------------------------------------------

--
-- Table structure for table `process`
--

CREATE TABLE `process` (
  `process_id` int(11) NOT NULL,
  `process_st_date` date DEFAULT NULL,
  `process_end_date` date DEFAULT NULL,
  `fk_process_status` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `process`
--

INSERT INTO `process` (`process_id`, `process_st_date`, `process_end_date`, `fk_process_status`, `package_id`) VALUES
(1, '2020-06-13', '2020-07-25', 2001, 4),
(2, '2020-07-10', '2020-07-15', 2002, 2),
(3, '2020-07-10', '2020-07-15', 2003, 3);

-- --------------------------------------------------------

--
-- Table structure for table `process_status`
--

CREATE TABLE `process_status` (
  `process_status_id` int(11) NOT NULL,
  `received` varchar(50) DEFAULT NULL,
  `on_hold` varchar(50) DEFAULT NULL,
  `send` varchar(50) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `process_status`
--

INSERT INTO `process_status` (`process_status_id`, `received`, `on_hold`, `send`, `package_id`) VALUES
(2001, 'YES', 'NO', 'YES', 4),
(2002, 'YES', 'YES', 'Pending', 2),
(2003, 'YES', 'NO', 'YES', 3);

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `r_id` int(11) NOT NULL,
  `r_fname` varchar(50) DEFAULT NULL,
  `r_lname` varchar(50) DEFAULT NULL,
  `fk_recipient_status` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `fk_process` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`r_id`, `r_fname`, `r_lname`, `fk_recipient_status`, `package_id`, `fk_process`) VALUES
(1, 'Kirsten', 'sterling', 1, 4, 1),
(2, 'Karl', 'Thomson', 2, 2, 2),
(3, 'Pistacho', 'Nero', 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `recipient_status`
--

CREATE TABLE `recipient_status` (
  `recipient_status_id` int(11) NOT NULL,
  `received_date` date DEFAULT NULL,
  `received_time` time DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `recipient_status`
--

INSERT INTO `recipient_status` (`recipient_status_id`, `received_date`, `received_time`, `package_id`) VALUES
(1, '2020-07-26', '17:00:00', 4),
(2, '2020-07-26', '16:30:00', 2),
(3, '2020-09-17', '15:00:00', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_c_address` (`fk_c_address`);

--
-- Indexes for table `c_address`
--
ALTER TABLE `c_address`
  ADD PRIMARY KEY (`c_address_id`);

--
-- Indexes for table `drop_station`
--
ALTER TABLE `drop_station`
  ADD PRIMARY KEY (`drop_station_id`),
  ADD KEY `fk_ds_hours` (`fk_ds_hours`),
  ADD KEY `fk_package_id` (`fk_package_id`),
  ADD KEY `fk_mds` (`fk_mds`);

--
-- Indexes for table `ds_hours`
--
ALTER TABLE `ds_hours`
  ADD PRIMARY KEY (`ds_hours`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_process` (`fk_process`);

--
-- Indexes for table `mds`
--
ALTER TABLE `mds`
  ADD PRIMARY KEY (`mds_id`),
  ADD KEY `fk_employee` (`fk_employee`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_customer_id` (`fk_customer_id`);

--
-- Indexes for table `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`process_id`),
  ADD KEY `fk_process_status` (`fk_process_status`);

--
-- Indexes for table `process_status`
--
ALTER TABLE `process_status`
  ADD PRIMARY KEY (`process_status_id`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`r_id`),
  ADD KEY `fk_recipient_status` (`fk_recipient_status`),
  ADD KEY `fk_process` (`fk_process`);

--
-- Indexes for table `recipient_status`
--
ALTER TABLE `recipient_status`
  ADD PRIMARY KEY (`recipient_status_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_c_address` FOREIGN KEY (`fk_c_address`) REFERENCES `c_address` (`c_address_id`) ON UPDATE CASCADE;

--
-- Constraints for table `drop_station`
--
ALTER TABLE `drop_station`
  ADD CONSTRAINT `drop_station_ibfk_1` FOREIGN KEY (`fk_ds_hours`) REFERENCES `ds_hours` (`ds_hours`),
  ADD CONSTRAINT `drop_station_ibfk_2` FOREIGN KEY (`fk_package_id`) REFERENCES `packages` (`package_id`),
  ADD CONSTRAINT `drop_station_ibfk_3` FOREIGN KEY (`fk_mds`) REFERENCES `mds` (`mds_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_process`) REFERENCES `process` (`process_id`);

--
-- Constraints for table `mds`
--
ALTER TABLE `mds`
  ADD CONSTRAINT `fk_employee` FOREIGN KEY (`fk_employee`) REFERENCES `employee` (`employee_id`) ON UPDATE CASCADE;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `fk_customer_id` FOREIGN KEY (`fk_customer_id`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE;

--
-- Constraints for table `process`
--
ALTER TABLE `process`
  ADD CONSTRAINT `process_ibfk_1` FOREIGN KEY (`fk_process_status`) REFERENCES `process_status` (`process_status_id`);

--
-- Constraints for table `recipient`
--
ALTER TABLE `recipient`
  ADD CONSTRAINT `recipient_ibfk_1` FOREIGN KEY (`fk_process`) REFERENCES `process` (`process_id`),
  ADD CONSTRAINT `recipient_ibfk_2` FOREIGN KEY (`fk_recipient_status`) REFERENCES `recipient_status` (`recipient_status_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
