-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2022 at 07:36 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `admitted_pat`
--

CREATE TABLE `admitted_pat` (
  `pat_id` int(4) NOT NULL,
  `ward_no` varchar(50) DEFAULT NULL,
  `bed_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admitted_pat`
--

INSERT INTO `admitted_pat` (`pat_id`, `ward_no`, `bed_no`) VALUES
(1, 'gen-3', '1'),
(3, 'emr-4', '2'),
(6, 'gen-3', '1'),
(7, 'emr-1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `app_id` int(4) NOT NULL,
  `doc_id` int(4) DEFAULT NULL,
  `pat_id` int(4) DEFAULT NULL,
  `time_slot` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`app_id`, `doc_id`, `pat_id`, `time_slot`) VALUES
(2, 3, 1, '2022-04-28 09:40:00'),
(3, 1, 2, '2022-04-28 09:30:27'),
(4, 7, 3, '2022-04-29 17:00:00'),
(5, 8, 4, '2022-04-27 14:30:00'),
(6, 9, 5, '2022-04-27 17:30:00'),
(7, 4, 6, '2022-04-27 17:30:00'),
(8, 10, 7, '2022-04-27 15:00:00'),
(9, 8, 8, '2022-04-28 15:00:00'),
(10, 9, 9, '2022-04-30 18:00:00'),
(11, 9, 10, '2022-04-27 18:30:00'),
(12, 9, 11, '2022-04-29 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doc_id` int(4) NOT NULL,
  `doc_name` varchar(50) NOT NULL,
  `time_slot` varchar(50) NOT NULL,
  `speciality` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doc_id`, `doc_name`, `time_slot`, `speciality`) VALUES
(1, 'Dr. Abdul Kamal', '9:30 am-2:00 pm', 'Orthopedic'),
(2, 'Alok Rahman', '9:30 am-2:00 pm', 'General Surgery'),
(3, 'Prof. Nayan Chakravarty', '9:30 am-2:00 pm', 'Gynae'),
(4, 'Dr. Parvin Jahan', '5:00 pm-9:30 pm', 'Gynae'),
(5, 'Dr. Aparna Khan', '5:00 pm-9:30 pm', 'ENT'),
(6, 'Dr. Nazimuddin Chowdhuri', '9:30 am-2:00 pm', 'General Surgery'),
(7, 'Prof. Dr. ABM Samsu', '5:00 pm-9:30 pm', 'ENT'),
(8, 'Dr. Tahmidur Ramim', '2:30 pm-5:00 pm ', 'Dermatology'),
(9, 'Dr. Hosne Ara', '5:00 pm-9:30 pm', 'Internal medicine'),
(10, 'Brig. Dr. Nazimuddin Hossen', '2:30 pm-5:00 pm ', 'Emergency medicine');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(4) NOT NULL,
  `emp_name` varchar(50) NOT NULL,
  `emp_dept` varchar(50) NOT NULL,
  `emp_salary` int(10) NOT NULL,
  `doc_id` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_name`, `emp_dept`, `emp_salary`, `doc_id`) VALUES
(15, 'Dr. Abdul Kamal', 'Doctor', 40000, 1),
(16, 'Alok Rahman', 'Doctor', 40000, 2),
(17, 'Prof. Nayan Chakravarty', 'Doctor', 40000, 3),
(18, 'Dr. Parvin Jahan', 'Doctor', 40000, 4),
(23, 'Dr. Aparna Khan', 'Doctor', 40000, 5),
(24, 'Debendra Mukherji', 'Cleaning', 20000, NULL),
(25, 'Kulsum Begum', 'Cleaning', 20000, NULL),
(26, 'Raisul Hossain', 'Nursing', 25000, NULL),
(27, 'Niloy Islam', 'Nursing', 30000, NULL),
(28, 'Dr. Nazimuddin Chowdhuri', 'Doctor', 40000, 6),
(29, '', '', 0, NULL),
(30, 'Prof. Dr. ABM Samsu', 'Doctor', 45000, 7),
(31, 'Dr. Tahmidur Ramim', 'Doctor', 40000, 8),
(32, 'Dr. Hosne Ara', 'Doctor', 45000, 9),
(33, 'Brig. Dr. Nazimuddin Hossen', 'Doctor', 50000, 10);

-- --------------------------------------------------------

--
-- Table structure for table `med_record`
--

CREATE TABLE `med_record` (
  `record_id` int(4) NOT NULL,
  `pat_id` int(4) DEFAULT NULL,
  `doc_id` int(4) DEFAULT NULL,
  `app_id` int(4) DEFAULT NULL,
  `prescription` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `med_record`
--

INSERT INTO `med_record` (`record_id`, `pat_id`, `doc_id`, `app_id`, `prescription`) VALUES
(1, 1, 3, 2, '1) Napa\r\n2) Histasin\r\n3) Nupraphen'),
(2, 2, 1, 3, '1) Hydroxychloroquine\r\n2) Hydroxyurea\r\n3) Napa Extra\r\n'),
(3, 3, 7, 4, '1) Caplyta\r\n2) Captopril'),
(4, 4, 8, 5, '1) Wegovy\r\n2) Welchol\r\n3) Welireg\r\n4) Wellbaby DHA'),
(5, 5, 9, 6, '1) Winlevi\r\n2) WinRho\r\n3) WinRho SDF\r\n4) Witch hazel topical\r\n5) Wixela Inhub'),
(6, 6, 4, 7, '1) Jolessa\r\n2) Jolivette\r\n3) Jornay PM\r\n4) Jublia\r\n5) Juleber\r\n6) Juluca'),
(7, 7, 10, 8, '1) Jelmyto\r\n2) Jemperli'),
(8, 8, 8, 9, '1) Olopatadine\r\n2) Olopatadine nasal\r\n3) Olopatadine ophthalmic\r\n4) Olux\r\n5) Omalizumab'),
(9, 9, 9, 10, '1) Oxandrolone\r\n2) Oxazepam\r\n3) Oxcarbazepine\r\n4) Oxtella XR'),
(10, 10, 9, 11, '1) Ortho Tri-Cyclen\r\n2) Oseltamivir'),
(11, 11, 9, 12, '1) Onglyza\r\n2) Onpattro\r\n3) Onureg');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `pat_id` int(4) NOT NULL,
  `pat_name` varchar(50) NOT NULL,
  `pat_age` int(4) NOT NULL,
  `pat_weight` int(4) NOT NULL,
  `pat_gender` varchar(50) NOT NULL,
  `indication` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`pat_id`, `pat_name`, `pat_age`, `pat_weight`, `pat_gender`, `indication`) VALUES
(1, 'Chameli Biswas', 32, 68, 'Female', 'Pregnancy'),
(2, 'Sudeep Basak', 45, 72, 'Male', 'Broken Bone'),
(3, 'Mojid Mia', 56, 66, 'Male', 'Hearing Issue'),
(4, 'Arnab Datta', 22, 70, 'Male', 'Body Rash'),
(5, 'Khalid Paloyan', 44, 86, 'Male', 'Diarrhea'),
(6, 'Soma Rahman', 36, 77, 'Female', 'Pregnancy'),
(7, 'Joy Hasan', 82, 104, 'Male', 'Accident'),
(8, 'Hasnat Ashik', 62, 68, 'Male', 'Allergy'),
(9, 'Eva Ajad', 22, 42, 'Female', 'Pneumonia'),
(10, 'Adiba Nawar', 62, 50, 'Female', 'Fever'),
(11, 'Ali H. Dewan', 44, 78, 'Male', 'Headache');

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE `ward` (
  `ward_no` varchar(50) NOT NULL,
  `doc_id` int(4) DEFAULT NULL,
  `bed_no` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ward`
--

INSERT INTO `ward` (`ward_no`, `doc_id`, `bed_no`) VALUES
('emr-1', 7, 4),
('emr-2', 8, 4),
('emr-3', 9, 4),
('emr-4', 10, 4),
('gen-1', 1, 10),
('gen-2', 1, 10),
('gen-3', 4, 10),
('gen-4', 5, 10),
('gen-5', 6, 10),
('gen-6', 6, 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admitted_pat`
--
ALTER TABLE `admitted_pat`
  ADD PRIMARY KEY (`pat_id`),
  ADD KEY `admitted_pat_ibfk_1` (`ward_no`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`app_id`),
  ADD KEY `doc_id` (`doc_id`),
  ADD KEY `pat_id` (`pat_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doc_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `doc_id` (`doc_id`);

--
-- Indexes for table `med_record`
--
ALTER TABLE `med_record`
  ADD PRIMARY KEY (`record_id`),
  ADD KEY `pat_id` (`pat_id`),
  ADD KEY `doc_id` (`doc_id`),
  ADD KEY `app_id` (`app_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`pat_id`);

--
-- Indexes for table `ward`
--
ALTER TABLE `ward`
  ADD PRIMARY KEY (`ward_no`),
  ADD KEY `doc_id` (`doc_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `app_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doc_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `med_record`
--
ALTER TABLE `med_record`
  MODIFY `record_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `pat_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admitted_pat`
--
ALTER TABLE `admitted_pat`
  ADD CONSTRAINT `admitted_pat_ibfk_1` FOREIGN KEY (`ward_no`) REFERENCES `ward` (`ward_no`);

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `doctor` (`doc_id`),
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`pat_id`) REFERENCES `patient` (`pat_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `doctor` (`doc_id`);

--
-- Constraints for table `med_record`
--
ALTER TABLE `med_record`
  ADD CONSTRAINT `med_record_ibfk_1` FOREIGN KEY (`pat_id`) REFERENCES `patient` (`pat_id`),
  ADD CONSTRAINT `med_record_ibfk_2` FOREIGN KEY (`doc_id`) REFERENCES `doctor` (`doc_id`),
  ADD CONSTRAINT `med_record_ibfk_3` FOREIGN KEY (`app_id`) REFERENCES `appointment` (`app_id`);

--
-- Constraints for table `ward`
--
ALTER TABLE `ward`
  ADD CONSTRAINT `ward_ibfk_1` FOREIGN KEY (`doc_id`) REFERENCES `doctor` (`doc_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
