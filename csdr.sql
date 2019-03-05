-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 05, 2019 at 10:48 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `csdr`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `EMAIL` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `RANK` int(8) NOT NULL,
  `FULL_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_TOKEN` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_archived_answers`
--

CREATE TABLE `tbl_archived_answers` (
  `DATASET_ID` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `SPLIT_FILE_ID` int(8) NOT NULL,
  `QUESTION_ID` int(8) NOT NULL,
  `UBIT_NAME` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ANSWER` varchar(1024) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_archived_datasets`
--

CREATE TABLE `tbl_archived_datasets` (
  `DATASET_ID` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `DATASET_FILETYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `DATASET_FILE` mediumblob NOT NULL,
  `SPLIT_FILE_ID` int(8) NOT NULL,
  `SPLIT_RANGE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ARCHIVED_TIME` datetime NOT NULL,
  `UBIT_NAME` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_ASSIGNED` datetime NOT NULL,
  `FILE_SUBMITTED` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_archived_questions`
--

CREATE TABLE `tbl_archived_questions` (
  `DATASET_ID` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `QUESTION_ID` int(8) NOT NULL,
  `QUESTION` varchar(512) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_current_dataset`
--

CREATE TABLE `tbl_current_dataset` (
  `DATASET_ID` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `DATASET_NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `DATASET_DESCRIPTION` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `DATASET_FILETYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `DATSET_FILE` mediumblob NOT NULL,
  `DATASET_SPLITNUM` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dataset_questions`
--

CREATE TABLE `tbl_dataset_questions` (
  `DATASET_ID` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `QUESTION_ID` int(8) NOT NULL,
  `QUESTION` varchar(512) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review_answers`
--

CREATE TABLE `tbl_review_answers` (
  `DATASET_ID` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `SPLIT_FILE_ID` int(8) NOT NULL,
  `QUESTION_ID` int(8) NOT NULL,
  `UBIT_NAME` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ANSWER` varchar(1024) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_splitted_datasets`
--

CREATE TABLE `tbl_splitted_datasets` (
  `DATASET_ID` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `SPLIT_FILE_ID` int(8) NOT NULL,
  `SPLIT_RANGE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `UBIT_NAME` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `USER_TOKEN_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_ASSIGNED_TIME` datetime NOT NULL,
  `FILE_SUBMITTED_TIME` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_archived_answers`
--
ALTER TABLE `tbl_archived_answers`
  ADD PRIMARY KEY (`DATASET_ID`,`SPLIT_FILE_ID`,`QUESTION_ID`);

--
-- Indexes for table `tbl_archived_datasets`
--
ALTER TABLE `tbl_archived_datasets`
  ADD PRIMARY KEY (`DATASET_ID`,`SPLIT_FILE_ID`);

--
-- Indexes for table `tbl_archived_questions`
--
ALTER TABLE `tbl_archived_questions`
  ADD PRIMARY KEY (`DATASET_ID`,`QUESTION_ID`);

--
-- Indexes for table `tbl_current_dataset`
--
ALTER TABLE `tbl_current_dataset`
  ADD PRIMARY KEY (`DATASET_ID`);

--
-- Indexes for table `tbl_dataset_questions`
--
ALTER TABLE `tbl_dataset_questions`
  ADD PRIMARY KEY (`DATASET_ID`,`QUESTION_ID`);

--
-- Indexes for table `tbl_review_answers`
--
ALTER TABLE `tbl_review_answers`
  ADD PRIMARY KEY (`DATASET_ID`,`SPLIT_FILE_ID`,`QUESTION_ID`);

--
-- Indexes for table `tbl_splitted_datasets`
--
ALTER TABLE `tbl_splitted_datasets`
  ADD PRIMARY KEY (`DATASET_ID`,`SPLIT_FILE_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_archived_answers`
--
ALTER TABLE `tbl_archived_answers`
  ADD CONSTRAINT `tbl_archived_answers_ibfk_1` FOREIGN KEY (`DATASET_ID`) REFERENCES `tbl_archived_datasets` (`DATASET_ID`);

--
-- Constraints for table `tbl_archived_questions`
--
ALTER TABLE `tbl_archived_questions`
  ADD CONSTRAINT `tbl_archived_questions_ibfk_1` FOREIGN KEY (`DATASET_ID`) REFERENCES `tbl_archived_datasets` (`DATASET_ID`);

--
-- Constraints for table `tbl_dataset_questions`
--
ALTER TABLE `tbl_dataset_questions`
  ADD CONSTRAINT `tbl_dataset_questions_ibfk_1` FOREIGN KEY (`DATASET_ID`) REFERENCES `tbl_current_dataset` (`DATASET_ID`);

--
-- Constraints for table `tbl_review_answers`
--
ALTER TABLE `tbl_review_answers`
  ADD CONSTRAINT `tbl_review_answers_ibfk_1` FOREIGN KEY (`DATASET_ID`) REFERENCES `tbl_current_dataset` (`DATASET_ID`);

--
-- Constraints for table `tbl_splitted_datasets`
--
ALTER TABLE `tbl_splitted_datasets`
  ADD CONSTRAINT `tbl_splitted_datasets_ibfk_1` FOREIGN KEY (`DATASET_ID`) REFERENCES `tbl_current_dataset` (`DATASET_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
