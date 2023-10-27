-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 27, 2023 at 08:51 AM
-- Server version: 8.1.0
-- PHP Version: 8.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_app_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `from_stop_id` int NOT NULL,
  `to_stop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `name`, `from_stop_id`, `to_stop_id`) VALUES
(1, 'Bus-Cairo-Asyut', 1, 5),
(2, 'Bus-Cairo-Giza', 1, 2),
(3, 'Bus-AlFayyum-AlMinya', 3, 5),
(4, 'Bus-AlMinya-Asyut', 4, 5),
(5, 'Bus-Giza-AlMinya', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `stops`
--

CREATE TABLE `stops` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stops`
--

INSERT INTO `stops` (`id`, `name`) VALUES
(1, 'Cairo'),
(2, 'Giza'),
(3, 'AlFayyum'),
(4, 'AlMinya'),
(5, 'Asyut');

-- --------------------------------------------------------

--
-- Table structure for table `trips`
--

CREATE TABLE `trips` (
  `id` int NOT NULL,
  `bus_id` int NOT NULL,
  `at_day` date NOT NULL,
  `at_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trips`
--

INSERT INTO `trips` (`id`, `bus_id`, `at_day`, `at_time`) VALUES
(1, 1, '2023-10-30', '07:00:00'),
(2, 2, '2023-10-30', '07:00:00'),
(3, 3, '2023-10-30', '07:00:00'),
(4, 4, '2023-10-30', '07:00:00'),
(5, 5, '2023-10-30', '07:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `trip_booking`
--

CREATE TABLE `trip_booking` (
  `id` int NOT NULL,
  `trip_id` int NOT NULL,
  `from_stop_id` int NOT NULL,
  `to_stop_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trip_booking`
--

INSERT INTO `trip_booking` (`id`, `trip_id`, `from_stop_id`, `to_stop_id`) VALUES
(44, 1, 2, 4),
(45, 1, 1, 5),
(46, 1, 1, 5),
(47, 1, 1, 5),
(48, 1, 4, 5),
(49, 1, 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_from_stop_id` (`from_stop_id`),
  ADD KEY `fk_to_stop_id` (`to_stop_id`);

--
-- Indexes for table `stops`
--
ALTER TABLE `stops`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bus` (`bus_id`);

--
-- Indexes for table `trip_booking`
--
ALTER TABLE `trip_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_trip_id` (`trip_id`),
  ADD KEY `fk_from_stop_id_` (`from_stop_id`),
  ADD KEY `fk_to_stop_id_` (`to_stop_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stops`
--
ALTER TABLE `stops`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `trip_booking`
--
ALTER TABLE `trip_booking`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bus`
--
ALTER TABLE `bus`
  ADD CONSTRAINT `fk_from_stop_id` FOREIGN KEY (`from_stop_id`) REFERENCES `stops` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_to_stop_id` FOREIGN KEY (`to_stop_id`) REFERENCES `stops` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `fk_bus` FOREIGN KEY (`bus_id`) REFERENCES `bus` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `trip_booking`
--
ALTER TABLE `trip_booking`
  ADD CONSTRAINT `fk_from_stop_id_` FOREIGN KEY (`from_stop_id`) REFERENCES `stops` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_to_stop_id_` FOREIGN KEY (`to_stop_id`) REFERENCES `stops` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `fk_trip_id` FOREIGN KEY (`trip_id`) REFERENCES `trips` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
