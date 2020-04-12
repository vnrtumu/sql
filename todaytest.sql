-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 03, 2020 at 09:11 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `todaytest`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL,
  `cust_nm` varchar(100) NOT NULL,
  `cust_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`cust_id`, `cust_nm`, `cust_type`) VALUES
(100, 'CITI Bank', 'Business'),
(101, 'HSBC Bank', 'Business');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `p_id` int(11) NOT NULL,
  `p_nm` varchar(100) NOT NULL,
  `p_cat` varchar(100) NOT NULL,
  `p_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`p_id`, `p_nm`, `p_cat`, `p_price`) VALUES
(50, 'PENCIL', 'STATIONARY', 40),
(51, 'PEN', 'STATIONARY', 50),
(52, 'SCALE', 'STATIONARY', 35),
(53, 'PAPERCLIP', 'STATIONARY', 20),
(54, 'CHAIR', 'FURNITURE', 1000),
(55, 'TABLE', 'FURNITURE', 2500),
(56, 'TABLE LAMP', 'FURNITURE', 1500),
(57, 'PEN BOX', 'STATIONARY', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `Sales_dtl`
--

CREATE TABLE `Sales_dtl` (
  `s_d_id` int(11) NOT NULL,
  `s_h_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `p_qty` int(11) NOT NULL,
  `p_dis_perc` int(11) NOT NULL,
  `s_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Sales_dtl`
--

INSERT INTO `Sales_dtl` (`s_d_id`, `s_h_id`, `p_id`, `p_qty`, `p_dis_perc`, `s_amount`) VALUES
(25, 1, 51, 4, 0, 200),
(26, 1, 50, 5, 0, 200),
(27, 2, 50, 10, 0, 400),
(28, 2, 53, 10, 0, 200),
(29, 3, 55, 2, 0, 5000),
(30, 3, 56, 3, 0, 4500),
(31, 4, 57, 1, 0, 1000),
(32, 4, 56, 2, 0, 3000),
(33, 5, 51, 2, 0, 100);

-- --------------------------------------------------------

--
-- Table structure for table `Sales_hdr`
--

CREATE TABLE `Sales_hdr` (
  `s_h_id` int(11) NOT NULL,
  `cust_id` int(11) NOT NULL,
  `sales_date` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Sales_hdr`
--

INSERT INTO `Sales_hdr` (`s_h_id`, `cust_id`, `sales_date`) VALUES
(1, 100, '10-01-20'),
(2, 100, '10-01-20'),
(3, 101, '10-Jan-20'),
(4, 101, '12-Jan-20'),
(5, 100, '02-Feb-20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`cust_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `Sales_dtl`
--
ALTER TABLE `Sales_dtl`
  ADD PRIMARY KEY (`s_d_id`);

--
-- Indexes for table `Sales_hdr`
--
ALTER TABLE `Sales_hdr`
  ADD PRIMARY KEY (`s_h_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `cust_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `Sales_dtl`
--
ALTER TABLE `Sales_dtl`
  MODIFY `s_d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `Sales_hdr`
--
ALTER TABLE `Sales_hdr`
  MODIFY `s_h_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
