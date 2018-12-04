-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 04, 2018 at 06:08 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `createaccount`
--
CREATE DATABASE IF NOT EXISTS `createaccount` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `createaccount`;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Cust` int(11) NOT NULL,
  `AccountNo` int(11) NOT NULL,
  `AccountType` varchar(30) COLLATE utf8_bin NOT NULL,
  `holder` varchar(30) COLLATE utf8_bin NOT NULL,
  `Nominee` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `atm`
--

CREATE TABLE `atm` (
  `Cust` int(11) NOT NULL,
  `ATMID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `CardLimit` int(11) NOT NULL,
  `Type` varchar(30) COLLATE utf8_bin NOT NULL,
  `CardNo` bigint(20) NOT NULL,
  `ExpDate` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `atm`
--

INSERT INTO `atm` (`Cust`, `ATMID`, `Amount`, `CardLimit`, `Type`, `CardNo`, `ExpDate`) VALUES
(1, 12345, 200000, 25000, 'mastercard', 222233334444, '12/20/2017'),
(2, 12346, 300000, 50000, 'Visa', 1111222233334444, '12/20/2017'),
(3, 12347, 100000, 10000, 'Rupay', 555566667777, '01/06/2022');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Cust` int(11) NOT NULL,
  `Aadhar` bigint(12) NOT NULL,
  `Address` varchar(100) COLLATE utf8_bin NOT NULL,
  `Age` int(3) NOT NULL,
  `Pan` varchar(10) COLLATE utf8_bin NOT NULL,
  `Mobile` bigint(10) NOT NULL,
  `DOB` varchar(10) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Cust`, `Aadhar`, `Address`, `Age`, `Pan`, `Mobile`, `DOB`) VALUES
(1, 123456789012, 'NO 87 1ST MAIN ROAD KANAKA LAY OUT, BANASHANKARI 2ND STAGE', 22, '123456', 9986187263, '18/04/1998'),
(2, 123456789012, 'NO 87 1ST MAIN ROAD KANAKA LAY OUT, BANASHANKARI 2ND STAGE', 22, '123456', 9986187263, '18/04/1998'),
(3, 123456789012, 'NO 87 1ST MAIN ROAD KANAKA LAY OUT, BANASHANKARI 2ND STAGE', 22, '123456', 9986187263, '18/04/1998'),
(4, 123456789012, 'NO 87 1ST MAIN ROAD KANAKA LAY OUT, BANASHANKARI 2ND STAGE', 22, '123456', 9986187263, '18/04/1998'),
(5, 123456789012, 'NO 87 1ST MAIN ROAD KANAKA LAY OUT, BANASHANKARI 2ND STAGE', 34, '1234', 9986187263, '1/1/1970'),
(6, 123456789012, 'NO 87 1ST MAIN ROAD KANAKA LAY OUT, BANASHANKARI 2ND STAGE', 43, '123445', 9986187262, '13/11/1981'),
(7, 12345678456, 'NO 87 1ST MAIN ROAD KANAKA LAY OUT, BANASHANKARI 2ND STAGE', 21, '123446', 9986187332, '21/07/2000');

--
-- Triggers `customer`
--
DELIMITER $$
CREATE TRIGGER `insertLog` AFTER INSERT ON `customer` FOR EACH ROW INSERT INTO customer_logs VALUES(NEW.Cust,"inserted")
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer_logs`
--

CREATE TABLE `customer_logs` (
  `Cust` int(11) NOT NULL,
  `action` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `customer_logs`
--

INSERT INTO `customer_logs` (`Cust`, `action`) VALUES
(8, 'inserted');

-- --------------------------------------------------------

--
-- Table structure for table `fd`
--

CREATE TABLE `fd` (
  `Cust` int(11) NOT NULL,
  `FDid` int(11) NOT NULL,
  `Tenure` int(11) NOT NULL,
  `Interest` int(11) NOT NULL,
  `PrincipalAmount` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `fd`
--

INSERT INTO `fd` (`Cust`, `FDid`, `Tenure`, `Interest`, `PrincipalAmount`) VALUES
(5, 11, 3, 6, 100000),
(1, 1234, 3, 7, 30000),
(7, 34567, 3, 8, 125000),
(2, 123422, 4, 7, 45000),
(2, 123423, 5, 7, 70000),
(1, 123424, 2, 8, 100000),
(3, 123425, 2, 8, 100000),
(4, 123426, 1, 6, 125000),
(5, 123427, 4, 8, 25000),
(2, 123422222, 3, 7, 45000);

-- --------------------------------------------------------

--
-- Table structure for table `fundstransfer`
--

CREATE TABLE `fundstransfer` (
  `Cust` int(11) NOT NULL,
  `TransferID` int(11) NOT NULL,
  `TypeOfTransfer` varchar(30) COLLATE utf8_bin NOT NULL,
  `Amount` int(11) NOT NULL,
  `Beneficiary` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `fundstransfer`
--

INSERT INTO `fundstransfer` (`Cust`, `TransferID`, `TypeOfTransfer`, `Amount`, `Beneficiary`) VALUES
(1, 2456, 'NEFT Transfer', 2000, 'Aditya S'),
(2, 2457, 'RTGS Transfer', 500, 'Akash'),
(3, 2458, 'NEFT Transfer', 5000, 'Prasanna'),
(2, 2459, 'NEFT Transfer', 5000, 'Bhasker'),
(4, 2460, 'IMPS Transfer', 10000, 'Eshika'),
(5, 2461, 'NEFT Transfer', 3000, 'Harshitha'),
(5, 2462, 'IMPS Transfer', 6000, 'Ashritha');

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `Cust` int(11) NOT NULL,
  `InsuranceID` int(11) NOT NULL,
  `Tenure` int(11) NOT NULL,
  `Premium` int(11) NOT NULL,
  `Type` varchar(30) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`Cust`, `InsuranceID`, `Tenure`, `Premium`, `Type`) VALUES
(1, 111111, 3, 45000, 'Motor Insurance'),
(2, 111112, 5, 60000, 'he'),
(2, 111113, 5, 60000, 'Health insurance'),
(3, 111114, 2, 2000, 'property insurance'),
(4, 111115, 10, 10000, 'health insurance'),
(5, 111116, 7, 12000, 'health insurance'),
(6, 111117, 3, 12000, ' Other');

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `Cust` int(11) NOT NULL,
  `LoanID` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `Interest` int(11) NOT NULL,
  `Mortgage` varchar(3) COLLATE utf8_bin NOT NULL,
  `Payments` int(11) NOT NULL,
  `Surity` varchar(3) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`Cust`, `LoanID`, `Amount`, `Interest`, `Mortgage`, `Payments`, `Surity`) VALUES
(1, 111, 2000, 7, 'yes', 200, 'no'),
(2, 112, 40000, 8, 'yes', 4000, 'yes'),
(3, 113, 200000, 8, 'yes', 35000, 'yes'),
(4, 114, 4000, 7, 'yes', 3500, 'no'),
(5, 115, 9000, 7, 'yes', 900, 'no'),
(2, 116, 50000, 8, 'yes', 10000, 'yes'),
(3, 117, 60000, 8, 'yes', 10000, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `lockerfacility`
--

CREATE TABLE `lockerfacility` (
  `Cust` int(11) NOT NULL,
  `LockerID` int(11) NOT NULL,
  `TypeOfLocker` varchar(30) COLLATE utf8_bin NOT NULL,
  `LockerNo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `lockerfacility`
--

INSERT INTO `lockerfacility` (`Cust`, `LockerID`, `TypeOfLocker`, `LockerNo`) VALUES
(1, 11111, 'Small', 417),
(4, 11112, 'Big', 421),
(7, 11113, 'medium', 422);

-- --------------------------------------------------------

--
-- Table structure for table `mutualfunds`
--

CREATE TABLE `mutualfunds` (
  `Cust` int(11) NOT NULL,
  `AMFICode` varchar(10) COLLATE utf8_bin NOT NULL,
  `InitialInvestment` bigint(20) NOT NULL,
  `Portfolio` varchar(3) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `mutualfunds`
--

INSERT INTO `mutualfunds` (`Cust`, `AMFICode`, `InitialInvestment`, `Portfolio`) VALUES
(1, '1we3', 35000, 'yes'),
(3, '1we4', 70000, 'yes'),
(2, '1we5', 60000, 'no'),
(4, '1we6', 100000, 'no'),
(5, '1we7', 8000, 'yes'),
(3, '1we8', 450000, 'yes'),
(4, '1we9', 300000, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `rd`
--

CREATE TABLE `rd` (
  `Cust` int(11) NOT NULL,
  `RDid` int(11) NOT NULL,
  `Term` int(11) NOT NULL,
  `Interest` int(11) NOT NULL,
  `Amount` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `rd`
--

INSERT INTO `rd` (`Cust`, `RDid`, `Term`, `Interest`, `Amount`) VALUES
(1, 11111, 5, 7, 2000),
(2, 11112, 2, 6, 10000),
(2, 11113, 4, 8, 15000),
(3, 11114, 1, 8, 4000),
(4, 11115, 3, 7, 8000),
(5, 11116, 4, 8, 20000),
(7, 11113333, 5, 7, 2000),
(3, 22222222, 5, 7, 22222);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`AccountNo`),
  ADD KEY `Cust` (`Cust`);

--
-- Indexes for table `atm`
--
ALTER TABLE `atm`
  ADD PRIMARY KEY (`ATMID`),
  ADD KEY `Cust` (`Cust`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Cust`);

--
-- Indexes for table `customer_logs`
--
ALTER TABLE `customer_logs`
  ADD PRIMARY KEY (`Cust`);

--
-- Indexes for table `fd`
--
ALTER TABLE `fd`
  ADD PRIMARY KEY (`FDid`),
  ADD KEY `Cust` (`Cust`);

--
-- Indexes for table `fundstransfer`
--
ALTER TABLE `fundstransfer`
  ADD PRIMARY KEY (`TransferID`),
  ADD KEY `Cust` (`Cust`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`InsuranceID`),
  ADD KEY `Cust` (`Cust`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`LoanID`),
  ADD KEY `Cust` (`Cust`);

--
-- Indexes for table `lockerfacility`
--
ALTER TABLE `lockerfacility`
  ADD PRIMARY KEY (`LockerID`),
  ADD KEY `Cust` (`Cust`),
  ADD KEY `Cust_2` (`Cust`);

--
-- Indexes for table `mutualfunds`
--
ALTER TABLE `mutualfunds`
  ADD PRIMARY KEY (`AMFICode`),
  ADD KEY `Cust` (`Cust`);

--
-- Indexes for table `rd`
--
ALTER TABLE `rd`
  ADD PRIMARY KEY (`RDid`),
  ADD KEY `Cust` (`Cust`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`Cust`) REFERENCES `customer` (`Cust`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `atm`
--
ALTER TABLE `atm`
  ADD CONSTRAINT `atm_ibfk_1` FOREIGN KEY (`Cust`) REFERENCES `customer` (`Cust`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fd`
--
ALTER TABLE `fd`
  ADD CONSTRAINT `fd_ibfk_1` FOREIGN KEY (`Cust`) REFERENCES `customer` (`Cust`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fundstransfer`
--
ALTER TABLE `fundstransfer`
  ADD CONSTRAINT `fundstransfer_ibfk_1` FOREIGN KEY (`Cust`) REFERENCES `customer` (`Cust`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `insurance`
--
ALTER TABLE `insurance`
  ADD CONSTRAINT `insurance_ibfk_1` FOREIGN KEY (`Cust`) REFERENCES `customer` (`Cust`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`Cust`) REFERENCES `customer` (`Cust`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lockerfacility`
--
ALTER TABLE `lockerfacility`
  ADD CONSTRAINT `lockerfacility_ibfk_1` FOREIGN KEY (`Cust`) REFERENCES `customer` (`Cust`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `mutualfunds`
--
ALTER TABLE `mutualfunds`
  ADD CONSTRAINT `mutualfunds_ibfk_1` FOREIGN KEY (`Cust`) REFERENCES `customer` (`Cust`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rd`
--
ALTER TABLE `rd`
  ADD CONSTRAINT `rd_ibfk_1` FOREIGN KEY (`Cust`) REFERENCES `customer` (`Cust`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

--
-- Dumping data for table `pma__favorite`
--

INSERT INTO `pma__favorite` (`username`, `tables`) VALUES
('root', '[{\"db\":\"createaccount\",\"table\":\"mutualfunds\"},{\"db\":\"createaccount\",\"table\":\"fundstransfer\"},{\"db\":\"createaccount\",\"table\":\"account\"},{\"db\":\"createaccount\",\"table\":\"customer\"},{\"db\":\"createaccount\",\"table\":\"insurance\"},{\"db\":\"createaccount\",\"table\":\"atm\"},{\"db\":\"createaccount\",\"table\":\"rd\"},{\"db\":\"createaccount\",\"table\":\"loans\"},{\"db\":\"createaccount\",\"table\":\"fd\"},{\"db\":\"createaccount\",\"table\":\"createaccount\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"createaccount\",\"table\":\"lockerfacility\"},{\"db\":\"createaccount\",\"table\":\"atm\"},{\"db\":\"createaccount\",\"table\":\"fundstransfer\"},{\"db\":\"createaccount\",\"table\":\"mutualfunds\"},{\"db\":\"createaccount\",\"table\":\"fd\"},{\"db\":\"createaccount\",\"table\":\"customer\"},{\"db\":\"createaccount\",\"table\":\"insurance\"},{\"db\":\"createaccount\",\"table\":\"loans\"},{\"db\":\"createaccount\",\"table\":\"rd\"},{\"db\":\"createaccount\",\"table\":\"customer_logs\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float UNSIGNED NOT NULL DEFAULT '0',
  `y` float UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

--
-- Dumping data for table `pma__table_info`
--

INSERT INTO `pma__table_info` (`db_name`, `table_name`, `display_field`) VALUES
('createaccount', 'account', 'AccountType'),
('createaccount', 'atm', 'Type'),
('createaccount', 'customer', 'Address'),
('createaccount', 'fundstransfer', 'TypeOfTransfer'),
('createaccount', 'insurance', 'Type'),
('createaccount', 'loans', 'Mortgage'),
('createaccount', 'lockerfacility', 'TypeOfLocker'),
('createaccount', 'mutualfunds', 'AMFICode');

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2018-12-04 17:07:50', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":197}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
