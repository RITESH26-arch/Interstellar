-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2026 at 07:20 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `interstellar_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `ename` varchar(150) NOT NULL,
  `etype` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `event_date` date NOT NULL,
  `frequency` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--  

INSERT INTO `events` (`event_id`, `ename`, `etype`, `description`, `event_date`, `frequency`, `created_at`) VALUES
(1, 'Earth at Perihelion', 'Earth Orbit Event', 'Earth closest to Sun', '2026-01-03', 'Yearly', '2026-02-26 22:36:14'),
(2, 'Quadrantids Peak', 'Meteor Shower', 'Quadrantids meteor shower peak', '2026-01-03', 'Yearly', '2026-02-26 22:36:14'),
(3, 'Annular Solar Eclipse', 'Solar Eclipse', 'Annular solar eclipse', '2026-02-17', 'Rare', '2026-02-26 22:36:14'),
(4, '6-Planet Parade', 'Planetary Alignment', 'Six planet alignment', '2026-02-28', 'Rare', '2026-02-26 22:36:14'),
(5, 'Total Lunar Eclipse', 'Lunar Eclipse', 'Total blood moon', '2026-03-02', 'Rare', '2026-02-26 22:36:14'),
(6, 'March Equinox', 'Seasonal Event', 'Spring equinox', '2026-03-20', 'Yearly', '2026-02-26 22:36:14'),
(7, 'Lyrids Peak', 'Meteor Shower', 'Lyrids meteor shower peak', '2026-04-22', 'Yearly', '2026-02-26 22:36:14'),
(8, 'Eta Aquariids Peak', 'Meteor Shower', 'Eta Aquariids peak', '2026-05-06', 'Yearly', '2026-02-26 22:36:14'),
(9, 'Blue Moon', 'Full Moon Event', 'Second full moon of month', '2026-05-31', 'Rare', '2026-02-26 22:36:14'),
(10, 'June Solstice', 'Seasonal Event', 'Summer solstice', '2026-06-21', 'Yearly', '2026-02-26 22:36:14'),
(11, 'Delta Aquariids Peak', 'Meteor Shower', 'Delta Aquariids peak', '2026-07-31', 'Yearly', '2026-02-26 22:36:14'),
(12, 'Total Solar Eclipse', 'Solar Eclipse', 'Total solar eclipse', '2026-08-12', 'Rare', '2026-02-26 22:36:14'),
(13, 'Perseids Peak', 'Meteor Shower', 'Perseids meteor shower peak', '2026-08-12', 'Yearly', '2026-02-26 22:36:14'),
(14, 'Partial Lunar Eclipse', 'Lunar Eclipse', 'Partial lunar eclipse', '2026-08-27', 'Rare', '2026-02-26 22:36:14'),
(15, 'September Equinox', 'Seasonal Event', 'Autumn equinox', '2026-09-23', 'Yearly', '2026-02-26 22:36:14'),
(16, 'Orionids Peak', 'Meteor Shower', 'Orionids meteor shower peak', '2026-10-21', 'Yearly', '2026-02-26 22:36:14'),
(17, 'Mars-Jupiter Conjunction', 'Planet Event', 'Mars and Jupiter close conjunction', '2026-11-14', 'Rare', '2026-02-26 22:36:14'),
(18, 'Geminids Peak', 'Meteor Shower', 'Geminids meteor shower peak', '2026-12-13', 'Yearly', '2026-02-26 22:36:14'),
(19, 'Ursids Peak', 'Meteor Shower', 'Ursids meteor shower peak', '2026-12-22', 'Yearly', '2026-02-26 22:36:14'),
(20, 'Earth at Perihelion', 'Earth Orbit Event', 'Earth closest to Sun', '2027-01-03', 'Yearly', '2026-02-26 22:36:14'),
(21, 'Annular Solar Eclipse', 'Solar Eclipse', 'Annular solar eclipse', '2027-02-06', 'Rare', '2026-02-26 22:36:14'),
(22, 'March Equinox', 'Seasonal Event', 'Spring equinox', '2027-03-20', 'Yearly', '2026-02-26 22:36:14'),
(23, 'Lyrids Peak', 'Meteor Shower', 'Lyrids meteor shower peak', '2027-04-22', 'Yearly', '2026-02-26 22:36:14'),
(24, 'Eta Aquariids Peak', 'Meteor Shower', 'Eta Aquariids peak', '2027-05-06', 'Yearly', '2026-02-26 22:36:14'),
(25, 'June Solstice', 'Seasonal Event', 'Summer solstice', '2027-06-21', 'Yearly', '2026-02-26 22:36:14'),
(26, 'Total Solar Eclipse', 'Solar Eclipse', 'Total solar eclipse', '2027-08-02', 'Rare', '2026-02-26 22:36:14'),
(27, 'Perseids Peak', 'Meteor Shower', 'Perseids meteor shower peak', '2027-08-12', 'Yearly', '2026-02-26 22:36:14'),
(28, 'September Equinox', 'Seasonal Event', 'Autumn equinox', '2027-09-23', 'Yearly', '2026-02-26 22:36:14'),
(29, 'Orionids Peak', 'Meteor Shower', 'Orionids meteor shower peak', '2027-10-21', 'Yearly', '2026-02-26 22:36:14'),
(30, 'Geminids Peak', 'Meteor Shower', 'Geminids meteor shower peak', '2027-12-13', 'Yearly', '2026-02-26 22:36:14'),
(31, 'Partial Lunar Eclipse', 'Lunar Eclipse', 'Partial lunar eclipse', '2028-01-12', 'Rare', '2026-02-26 22:36:14'),
(32, 'Annular Solar Eclipse', 'Solar Eclipse', 'Annular solar eclipse', '2028-01-26', 'Rare', '2026-02-26 22:36:14'),
(33, 'March Equinox', 'Seasonal Event', 'Spring equinox', '2028-03-20', 'Yearly', '2026-02-26 22:36:14'),
(34, 'Eta Aquariids Peak', 'Meteor Shower', 'Eta Aquariids peak', '2028-05-06', 'Yearly', '2026-02-26 22:36:14'),
(35, 'June Solstice', 'Seasonal Event', 'Summer solstice', '2028-06-21', 'Yearly', '2026-02-26 22:36:14'),
(36, 'Perseids Peak', 'Meteor Shower', 'Perseids meteor shower peak', '2028-08-12', 'Yearly', '2026-02-26 22:36:14'),
(37, 'September Equinox', 'Seasonal Event', 'Autumn equinox', '2028-09-22', 'Yearly', '2026-02-26 22:36:14'),
(38, 'Geminids Peak', 'Meteor Shower', 'Geminids meteor shower peak', '2028-12-13', 'Yearly', '2026-02-26 22:36:14');

-- --------------------------------------------------------

--
-- Table structure for table `event_visibility`
--

CREATE TABLE `event_visibility` (
  `ev_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `location` varchar(100) NOT NULL,
  `visibility` enum('HIGH','MEDIUM','LOW') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_visibility`
--

INSERT INTO `event_visibility` (`ev_id`, `event_id`, `location`, `visibility`) VALUES
(1, 1, 'India', 'HIGH'),
(2, 1, 'USA', 'MEDIUM'),
(3, 1, 'UK', 'LOW'),
(4, 1, 'Australia', 'HIGH'),
(5, 1, 'Canada', 'MEDIUM'),
(6, 2, 'India', 'LOW'),
(7, 2, 'USA', 'HIGH'),
(8, 2, 'UK', 'MEDIUM'),
(9, 2, 'Australia', 'MEDIUM'),
(10, 2, 'Canada', 'HIGH'),
(11, 3, 'India', 'HIGH'),
(12, 3, 'USA', 'LOW'),
(13, 3, 'UK', 'HIGH'),
(14, 3, 'Australia', 'MEDIUM'),
(15, 3, 'Canada', 'LOW'),
(16, 4, 'India', 'MEDIUM'),
(17, 4, 'USA', 'HIGH'),
(18, 4, 'UK', 'LOW'),
(19, 4, 'Australia', 'HIGH'),
(20, 4, 'Canada', 'MEDIUM'),
(21, 5, 'India', 'HIGH'),
(22, 5, 'USA', 'MEDIUM'),
(23, 5, 'UK', 'HIGH'),
(24, 5, 'Australia', 'LOW'),
(25, 5, 'Canada', 'MEDIUM'),
(26, 6, 'India', 'LOW'),
(27, 6, 'USA', 'HIGH'),
(28, 6, 'UK', 'MEDIUM'),
(29, 6, 'Australia', 'HIGH'),
(30, 6, 'Canada', 'LOW'),
(31, 7, 'India', 'HIGH'),
(32, 7, 'USA', 'MEDIUM'),
(33, 7, 'UK', 'LOW'),
(34, 7, 'Australia', 'MEDIUM'),
(35, 7, 'Canada', 'HIGH'),
(36, 8, 'India', 'MEDIUM'),
(37, 8, 'USA', 'HIGH'),
(38, 8, 'UK', 'HIGH'),
(39, 8, 'Australia', 'LOW'),
(40, 8, 'Canada', 'MEDIUM'),
(41, 9, 'India', 'HIGH'),
(42, 9, 'USA', 'LOW'),
(43, 9, 'UK', 'MEDIUM'),
(44, 9, 'Australia', 'HIGH'),
(45, 9, 'Canada', 'LOW'),
(46, 10, 'India', 'MEDIUM'),
(47, 10, 'USA', 'HIGH'),
(48, 10, 'UK', 'LOW'),
(49, 10, 'Australia', 'HIGH'),
(50, 10, 'Canada', 'MEDIUM'),
(51, 11, 'India', 'HIGH'),
(52, 11, 'USA', 'MEDIUM'),
(53, 11, 'UK', 'HIGH'),
(54, 11, 'Australia', 'LOW'),
(55, 11, 'Canada', 'MEDIUM'),
(56, 12, 'India', 'LOW'),
(57, 12, 'USA', 'HIGH'),
(58, 12, 'UK', 'MEDIUM'),
(59, 12, 'Australia', 'HIGH'),
(60, 12, 'Canada', 'LOW'),
(61, 13, 'India', 'HIGH'),
(62, 13, 'USA', 'LOW'),
(63, 13, 'UK', 'HIGH'),
(64, 13, 'Australia', 'MEDIUM'),
(65, 13, 'Canada', 'MEDIUM'),
(66, 14, 'India', 'MEDIUM'),
(67, 14, 'USA', 'HIGH'),
(68, 14, 'UK', 'LOW'),
(69, 14, 'Australia', 'HIGH'),
(70, 14, 'Canada', 'MEDIUM'),
(71, 15, 'India', 'HIGH'),
(72, 15, 'USA', 'MEDIUM'),
(73, 15, 'UK', 'HIGH'),
(74, 15, 'Australia', 'LOW'),
(75, 15, 'Canada', 'HIGH'),
(76, 16, 'India', 'LOW'),
(77, 16, 'USA', 'HIGH'),
(78, 16, 'UK', 'MEDIUM'),
(79, 16, 'Australia', 'HIGH'),
(80, 16, 'Canada', 'LOW'),
(81, 17, 'India', 'HIGH'),
(82, 17, 'USA', 'MEDIUM'),
(83, 17, 'UK', 'LOW'),
(84, 17, 'Australia', 'MEDIUM'),
(85, 17, 'Canada', 'HIGH'),
(86, 18, 'India', 'MEDIUM'),
(87, 18, 'USA', 'HIGH'),
(88, 18, 'UK', 'HIGH'),
(89, 18, 'Australia', 'LOW'),
(90, 18, 'Canada', 'MEDIUM'),
(91, 19, 'India', 'HIGH'),
(92, 19, 'USA', 'LOW'),
(93, 19, 'UK', 'MEDIUM'),
(94, 19, 'Australia', 'HIGH'),
(95, 19, 'Canada', 'LOW'),
(96, 20, 'India', 'MEDIUM'),
(97, 20, 'USA', 'HIGH'),
(98, 20, 'UK', 'LOW'),
(99, 20, 'Australia', 'HIGH'),
(100, 20, 'Canada', 'MEDIUM'),
(101, 21, 'India', 'HIGH'),
(102, 21, 'USA', 'MEDIUM'),
(103, 21, 'UK', 'HIGH'),
(104, 21, 'Australia', 'LOW'),
(105, 21, 'Canada', 'MEDIUM'),
(106, 22, 'India', 'LOW'),
(107, 22, 'USA', 'HIGH'),
(108, 22, 'UK', 'MEDIUM'),
(109, 22, 'Australia', 'HIGH'),
(110, 22, 'Canada', 'LOW'),
(111, 23, 'India', 'HIGH'),
(112, 23, 'USA', 'LOW'),
(113, 23, 'UK', 'HIGH'),
(114, 23, 'Australia', 'MEDIUM'),
(115, 23, 'Canada', 'MEDIUM'),
(116, 24, 'India', 'MEDIUM'),
(117, 24, 'USA', 'HIGH'),
(118, 24, 'UK', 'LOW'),
(119, 24, 'Australia', 'HIGH'),
(120, 24, 'Canada', 'MEDIUM'),
(121, 25, 'India', 'HIGH'),
(122, 25, 'USA', 'MEDIUM'),
(123, 25, 'UK', 'HIGH'),
(124, 25, 'Australia', 'LOW'),
(125, 25, 'Canada', 'HIGH'),
(126, 26, 'India', 'LOW'),
(127, 26, 'USA', 'HIGH'),
(128, 26, 'UK', 'MEDIUM'),
(129, 26, 'Australia', 'HIGH'),
(130, 26, 'Canada', 'LOW'),
(131, 27, 'India', 'HIGH'),
(132, 27, 'USA', 'MEDIUM'),
(133, 27, 'UK', 'LOW'),
(134, 27, 'Australia', 'MEDIUM'),
(135, 27, 'Canada', 'HIGH'),
(136, 28, 'India', 'MEDIUM'),
(137, 28, 'USA', 'HIGH'),
(138, 28, 'UK', 'HIGH'),
(139, 28, 'Australia', 'LOW'),
(140, 28, 'Canada', 'MEDIUM'),
(141, 29, 'India', 'HIGH'),
(142, 29, 'USA', 'LOW'),
(143, 29, 'UK', 'MEDIUM'),
(144, 29, 'Australia', 'HIGH'),
(145, 29, 'Canada', 'LOW'),
(146, 30, 'India', 'MEDIUM'),
(147, 30, 'USA', 'HIGH'),
(148, 30, 'UK', 'LOW'),
(149, 30, 'Australia', 'HIGH'),
(150, 30, 'Canada', 'MEDIUM'),
(151, 31, 'India', 'HIGH'),
(152, 31, 'USA', 'MEDIUM'),
(153, 31, 'UK', 'HIGH'),
(154, 31, 'Australia', 'LOW'),
(155, 31, 'Canada', 'MEDIUM'),
(156, 32, 'India', 'LOW'),
(157, 32, 'USA', 'HIGH'),
(158, 32, 'UK', 'MEDIUM'),
(159, 32, 'Australia', 'HIGH'),
(160, 32, 'Canada', 'LOW'),
(161, 33, 'India', 'HIGH'),
(162, 33, 'USA', 'LOW'),
(163, 33, 'UK', 'HIGH'),
(164, 33, 'Australia', 'MEDIUM'),
(165, 33, 'Canada', 'MEDIUM'),
(166, 34, 'India', 'MEDIUM'),
(167, 34, 'USA', 'HIGH'),
(168, 34, 'UK', 'LOW'),
(169, 34, 'Australia', 'HIGH'),
(170, 34, 'Canada', 'MEDIUM'),
(171, 35, 'India', 'HIGH'),
(172, 35, 'USA', 'MEDIUM'),
(173, 35, 'UK', 'HIGH'),
(174, 35, 'Australia', 'LOW'),
(175, 35, 'Canada', 'HIGH'),
(176, 36, 'India', 'LOW'),
(177, 36, 'USA', 'HIGH'),
(178, 36, 'UK', 'MEDIUM'),
(179, 36, 'Australia', 'HIGH'),
(180, 36, 'Canada', 'LOW'),
(181, 37, 'India', 'HIGH'),
(182, 37, 'USA', 'MEDIUM'),
(183, 37, 'UK', 'LOW'),
(184, 37, 'Australia', 'MEDIUM'),
(185, 37, 'Canada', 'HIGH'),
(186, 38, 'India', 'MEDIUM'),
(187, 38, 'USA', 'HIGH'),
(188, 38, 'UK', 'HIGH'),
(189, 38, 'Australia', 'LOW'),
(190, 38, 'Canada', 'MEDIUM');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `prediction_id` int(11) DEFAULT NULL,
  `sent_at` datetime DEFAULT current_timestamp(),
  `status` enum('PENDING','SENT','FAILED') DEFAULT 'PENDING'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `predictions`
--

CREATE TABLE `predictions` (
  `prediction_id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `p_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `security_questions`
--

CREATE TABLE `security_questions` (
  `id` int(11) NOT NULL,
  `question` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `security_questions`
--

INSERT INTO `security_questions` (`id`, `question`) VALUES
(1, 'What is your School Name'),
(2, 'What is your favourite Movie'),
(3, 'What is your favourite Food');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `location` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `location`) VALUES
(1, 'sneha@gmail.com', 'sneha@gmail.com', '59b6bc9484a2c8ea7c20a3c0778088295e6f8e62a6a90b6d535b3b6bceb2fcd0', 'pune'),
(7, 'sneha1@gmail.com', 'sneha1@gmail.com', '59b6bc9484a2c8ea7c20a3c0778088295e6f8e62a6a90b6d535b3b6bceb2fcd0', 'pune'),
(8, 'snehaghule@gmail.com', 'snehaghule@gmail.com', 'befa850ccf0c8a6e3f4e8b63c0a3997a9fdc7d8e088bdf2e4a61577282cb28ec', 'pune'),
(12, 'sneha2@gmail.com', 'sneha2@gmail.com', 'befa850ccf0c8a6e3f4e8b63c0a3997a9fdc7d8e088bdf2e4a61577282cb28ec', 'Pune'),
(13, 'snehaghule2247@gmail.com', 'snehaghule2247@gmail.com', 'befa850ccf0c8a6e3f4e8b63c0a3997a9fdc7d8e088bdf2e4a61577282cb28ec', 'Mumbai');

-- --------------------------------------------------------

--
-- Table structure for table `user_security`
--

CREATE TABLE `user_security` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_security`
--

INSERT INTO `user_security` (`id`, `user_id`, `question_id`, `answer`) VALUES
(1, 1, 2, 'f2e5d762060797916b7d886ca149b16e14117f8553d5bab5487d5ed5a8fabb81'),
(2, 7, 3, '9ed1515819dec61fd361d5fdabb57f41ecce1a5fe1fe263b98c0d6943b9b232e'),
(3, 8, 3, '9ed1515819dec61fd361d5fdabb57f41ecce1a5fe1fe263b98c0d6943b9b232e'),
(7, 12, 1, 'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad'),
(8, 13, 3, '9ed1515819dec61fd361d5fdabb57f41ecce1a5fe1fe263b98c0d6943b9b232e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`);

--
-- Indexes for table `event_visibility`
--
ALTER TABLE `event_visibility`
  ADD PRIMARY KEY (`ev_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`event_id`),
  ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `security_questions`
--
ALTER TABLE `security_questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_security`
--
ALTER TABLE `user_security`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `question_id` (`question_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `event_visibility`
--
ALTER TABLE `event_visibility`
  MODIFY `ev_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=191;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `security_questions`
--
ALTER TABLE `security_questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user_security`
--
ALTER TABLE `user_security`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event_visibility`
--
ALTER TABLE `event_visibility`
  ADD CONSTRAINT `event_visibility_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE;

--
-- Constraints for table `user_security`
--
ALTER TABLE `user_security`
  ADD CONSTRAINT `user_security_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `user_security_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `security_questions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

