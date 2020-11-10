-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2020 at 07:07 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_assessment`
--

-- --------------------------------------------------------

--
-- Table structure for table `assessment_criteria`
--

CREATE TABLE `assessment_criteria` (
  `assessment_criteria_id` bigint(10) NOT NULL,
  `assessment_criteria_name` varchar(50) DEFAULT NULL,
  `default_score` tinyint(2) DEFAULT NULL,
  `min_score` tinyint(4) DEFAULT NULL,
  `max_score` tinyint(4) DEFAULT NULL,
  `assessment_criteria_type` tinyint(4) DEFAULT NULL,
  `assessment_criteria_content` varchar(500) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_criteria_group`
--

CREATE TABLE `assessment_criteria_group` (
  `assessment_criteria_group_id` bigint(10) NOT NULL,
  `assessment_criteria_group_name` varchar(50) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_fomular`
--

CREATE TABLE `assessment_fomular` (
  `assessment_fomular_id` bigint(10) NOT NULL,
  `assessment_fomular_name` varchar(50) DEFAULT NULL,
  `assessment_fomular_content` varchar(500) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_fomular_mapping_criteria`
--

CREATE TABLE `assessment_fomular_mapping_criteria` (
  `assessment_fomular_mapping_criteria_id` bigint(10) NOT NULL,
  `assessment_fomular_mapping_criteria_group_id` bigint(10) DEFAULT NULL,
  `assessment_fomular_id` bigint(10) DEFAULT NULL,
  `isDisplay` tinyint(2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` bigint(10) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_fomular_mapping_criteria_group`
--

CREATE TABLE `assessment_fomular_mapping_criteria_group` (
  `assessment_fomular_mapping_criteria_group_id` bigint(10) NOT NULL,
  `assessment_fomular_id` bigint(10) DEFAULT NULL,
  `assessment_criteria_group_id` bigint(10) DEFAULT NULL,
  `isDisplay` tinyint(2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_level`
--

CREATE TABLE `assessment_level` (
  `assessment_level_id` bigint(10) NOT NULL,
  `assessment_period_id` bigint(10) DEFAULT NULL,
  `assessment_level_name` varchar(50) DEFAULT NULL,
  `assessment_level_order` tinyint(4) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_level_mapping_criteria`
--

CREATE TABLE `assessment_level_mapping_criteria` (
  `assessment_level_mapping_criteria_id` bigint(10) NOT NULL,
  `assessment_level_mapping_criteria_group_id` bigint(10) DEFAULT NULL,
  `assessment_criteria_id` bigint(10) DEFAULT NULL,
  `isDisplay` tinyint(2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_level_mapping_criteria_group`
--

CREATE TABLE `assessment_level_mapping_criteria_group` (
  `assessment_level_mapping_criteria_group_id` bigint(10) NOT NULL,
  `assessment_level_id` bigint(10) DEFAULT NULL,
  `assessment_criteria_group_id` bigint(10) DEFAULT NULL,
  `isDisplay` tinyint(2) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_level_mapping_employee`
--

CREATE TABLE `assessment_level_mapping_employee` (
  `assessment_level_mapping_employyee_id` bigint(10) NOT NULL,
  `assessment_level_id` bigint(10) DEFAULT NULL,
  `employee_id` bigint(10) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` bigint(10) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_level_mapping_has_employee`
--

CREATE TABLE `assessment_level_mapping_has_employee` (
  `assessment_level_mapping_has_employee_id` bigint(10) NOT NULL,
  `assessment_level_mapping_employee_id` bigint(10) DEFAULT NULL,
  `employee_id` bigint(10) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` bigint(10) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_period`
--

CREATE TABLE `assessment_period` (
  `assessment_period_id` bigint(10) NOT NULL,
  `assessment_period_name` varchar(50) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `promulgate` tinyint(4) DEFAULT NULL,
  `assessment_fomular_id` bigint(10) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` bigint(10) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_result`
--

CREATE TABLE `assessment_result` (
  `assessment_result_id` bigint(10) NOT NULL,
  `assessment_period_id` bigint(10) DEFAULT NULL,
  `employee_id` bigint(10) DEFAULT NULL,
  `evaluaing_level` tinyint(4) DEFAULT NULL,
  `assessment_result_content` varchar(500) DEFAULT NULL,
  `assessment_result_score` tinyint(4) DEFAULT NULL,
  `assessment_result_rated` varchar(20) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` bigint(10) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` bigint(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` bigint(10) NOT NULL,
  `employee_name` varchar(50) DEFAULT NULL,
  `employee_code` varchar(50) DEFAULT NULL,
  `genner` tinyint(2) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `created_by` bigint(10) DEFAULT NULL,
  `updated_date` date DEFAULT NULL,
  `updated_by` bigint(10) DEFAULT NULL,
  `passwords` varchar(50) DEFAULT NULL COMMENT 'passwords'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `employee_name`, `employee_code`, `genner`, `birthday`, `created_date`, `created_by`, `updated_date`, `updated_by`, `passwords`) VALUES
(1, 'can bo 01', 'CB01', 1, '0000-00-00', NULL, NULL, NULL, NULL, '1'),
(2, 'can bo 02', 'CB02', 0, '0000-00-00', NULL, NULL, NULL, NULL, '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assessment_criteria`
--
ALTER TABLE `assessment_criteria`
  ADD PRIMARY KEY (`assessment_criteria_id`);

--
-- Indexes for table `assessment_criteria_group`
--
ALTER TABLE `assessment_criteria_group`
  ADD PRIMARY KEY (`assessment_criteria_group_id`);

--
-- Indexes for table `assessment_fomular`
--
ALTER TABLE `assessment_fomular`
  ADD PRIMARY KEY (`assessment_fomular_id`);

--
-- Indexes for table `assessment_fomular_mapping_criteria`
--
ALTER TABLE `assessment_fomular_mapping_criteria`
  ADD PRIMARY KEY (`assessment_fomular_mapping_criteria_id`);

--
-- Indexes for table `assessment_fomular_mapping_criteria_group`
--
ALTER TABLE `assessment_fomular_mapping_criteria_group`
  ADD PRIMARY KEY (`assessment_fomular_mapping_criteria_group_id`);

--
-- Indexes for table `assessment_level`
--
ALTER TABLE `assessment_level`
  ADD PRIMARY KEY (`assessment_level_id`);

--
-- Indexes for table `assessment_level_mapping_criteria`
--
ALTER TABLE `assessment_level_mapping_criteria`
  ADD PRIMARY KEY (`assessment_level_mapping_criteria_id`);

--
-- Indexes for table `assessment_level_mapping_criteria_group`
--
ALTER TABLE `assessment_level_mapping_criteria_group`
  ADD PRIMARY KEY (`assessment_level_mapping_criteria_group_id`);

--
-- Indexes for table `assessment_level_mapping_employee`
--
ALTER TABLE `assessment_level_mapping_employee`
  ADD PRIMARY KEY (`assessment_level_mapping_employyee_id`);

--
-- Indexes for table `assessment_level_mapping_has_employee`
--
ALTER TABLE `assessment_level_mapping_has_employee`
  ADD PRIMARY KEY (`assessment_level_mapping_has_employee_id`);

--
-- Indexes for table `assessment_period`
--
ALTER TABLE `assessment_period`
  ADD PRIMARY KEY (`assessment_period_id`);

--
-- Indexes for table `assessment_result`
--
ALTER TABLE `assessment_result`
  ADD PRIMARY KEY (`assessment_result_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assessment_criteria`
--
ALTER TABLE `assessment_criteria`
  MODIFY `assessment_criteria_id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assessment_criteria_group`
--
ALTER TABLE `assessment_criteria_group`
  MODIFY `assessment_criteria_group_id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assessment_fomular`
--
ALTER TABLE `assessment_fomular`
  MODIFY `assessment_fomular_id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assessment_fomular_mapping_criteria`
--
ALTER TABLE `assessment_fomular_mapping_criteria`
  MODIFY `assessment_fomular_mapping_criteria_id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assessment_fomular_mapping_criteria_group`
--
ALTER TABLE `assessment_fomular_mapping_criteria_group`
  MODIFY `assessment_fomular_mapping_criteria_group_id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assessment_level`
--
ALTER TABLE `assessment_level`
  MODIFY `assessment_level_id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assessment_level_mapping_criteria`
--
ALTER TABLE `assessment_level_mapping_criteria`
  MODIFY `assessment_level_mapping_criteria_id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assessment_level_mapping_criteria_group`
--
ALTER TABLE `assessment_level_mapping_criteria_group`
  MODIFY `assessment_level_mapping_criteria_group_id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assessment_level_mapping_employee`
--
ALTER TABLE `assessment_level_mapping_employee`
  MODIFY `assessment_level_mapping_employyee_id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assessment_level_mapping_has_employee`
--
ALTER TABLE `assessment_level_mapping_has_employee`
  MODIFY `assessment_level_mapping_has_employee_id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assessment_period`
--
ALTER TABLE `assessment_period`
  MODIFY `assessment_period_id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assessment_result`
--
ALTER TABLE `assessment_result`
  MODIFY `assessment_result_id` bigint(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
