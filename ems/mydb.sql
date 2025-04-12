-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 21, 2024 at 01:13 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `emp`
--

CREATE TABLE `emp` (
  `eid` int(5) NOT NULL,
  `name` char(50) DEFAULT NULL,
  `email` char(50) DEFAULT NULL,
  `sal` double DEFAULT NULL,
  `dept` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `emp`
--

INSERT INTO `emp` (`eid`, `name`, `email`, `sal`, `dept`) VALUES
(1011, 'Vinod Kumar', 'vinod.kumar@infy.com', 45000, 'Tech Lead'),
(1012, 'Nitin Rakesh', 'nitin.rakesh@infy.com', 55000, 'Lead Analyst'),
(1013, 'Salil Pareekh', 'salil.pareekh@infy.com', 80000, 'Project Manager'),
(1014, 'Ravi Kumar', 'ravi.kumar@infy.com', 50000, 'Lead Analyst'),
(1015, 'Swetha Krishnan', 'swetha.k@infy.com', 45000, 'Tech Lead');

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `pid` int(11) NOT NULL,
  `firstname` char(50) NOT NULL,
  `lastname` char(50) NOT NULL,
  `username` char(10) NOT NULL,
  `password` char(10) NOT NULL,
  `email` char(50) NOT NULL,
  `role` char(5) NOT NULL DEFAULT 'User'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `persons`
--

INSERT INTO `persons` (`pid`, `firstname`, `lastname`, `username`, `password`, `email`, `role`) VALUES
(1, 'mohit', 'yadav', 'mohit123@', 'qwerty', 'md@gmail.com', 'User'),
(2, 'manas', 'chaoudhary', 'manas123@', 'qwerty', 'manas@gmail.com', 'User'),
(3, 'Rohit', 'Rana', 'rohit123@', 'qwerty', 'rohit123@gmail.com', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `rollno` int(11) NOT NULL,
  `name` char(50) NOT NULL,
  `percentage` double NOT NULL,
  `grade` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`rollno`, `name`, `percentage`, `grade`) VALUES
(101, 'Kunal', 80, 'A'),
(102, 'Kunal', 80, 'A'),
(103, 'Bhumi', 75, 'A');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`eid`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`rollno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `persons`
--
ALTER TABLE `persons`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
