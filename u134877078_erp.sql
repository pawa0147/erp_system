-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 02, 2026 at 06:48 PM
-- Server version: 11.8.8-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u134877078_erp`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `status` enum('Present','Absent','Half Day','Leave') DEFAULT 'Present',
  `work_mode` varchar(20) DEFAULT 'Office',
  `check_in` time DEFAULT NULL,
  `check_out` time DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `employee_id`, `date`, `status`, `work_mode`, `check_in`, `check_out`, `notes`) VALUES
(4, 5, '2026-01-05', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(5, 6, '2026-01-05', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(6, 9, '2026-01-05', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(7, 8, '2026-01-05', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(8, 7, '2026-01-05', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(9, 10, '2026-01-05', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(10, 13, '2026-01-05', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(11, 15, '2026-01-05', 'Present', 'Office', '10:00:00', '17:40:00', NULL),
(12, 11, '2026-01-05', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(13, 16, '2026-01-05', 'Present', 'Office', '10:00:00', '17:51:00', NULL),
(14, 12, '2026-01-05', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(15, 18, '2026-01-05', 'Present', 'Office', '10:00:00', '16:15:00', NULL),
(16, 17, '2026-01-05', 'Present', 'Office', '10:00:00', '17:46:00', NULL),
(17, 19, '2026-01-05', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(18, 20, '2026-01-05', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(19, 14, '2026-01-05', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(20, 21, '2026-01-05', 'Present', 'Office', '10:00:00', '15:51:00', NULL),
(21, 22, '2026-01-05', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(22, 20, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(23, 9, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(24, 14, '2026-01-06', 'Present', 'Office', '10:00:00', '16:54:00', NULL),
(25, 13, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(26, 22, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(27, 12, '2026-01-06', 'Present', 'Office', '10:00:00', '16:53:00', NULL),
(28, 19, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(29, 10, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(30, 11, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(31, 21, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(32, 8, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(33, 6, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(34, 7, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(35, 16, '2026-01-06', 'Present', 'Office', '10:00:00', '16:51:00', NULL),
(36, 17, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(37, 15, '2026-01-06', 'Present', 'Office', '10:00:00', '16:39:00', NULL),
(38, 5, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(39, 18, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(40, 23, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(41, 24, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(42, 25, '2026-01-06', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(43, 9, '2026-01-07', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(44, 18, '2026-01-07', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(45, 15, '2026-01-07', 'Present', 'Office', '10:00:00', '16:19:00', NULL),
(46, 13, '2026-01-07', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(47, 14, '2026-01-07', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(48, 12, '2026-01-07', 'Present', 'Office', '10:00:00', '17:07:00', NULL),
(49, 10, '2026-01-07', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(50, 11, '2026-01-07', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(51, 21, '2026-01-07', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(52, 20, '2026-01-07', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(53, 22, '2026-01-07', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(54, 24, '2026-01-07', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(55, 19, '2026-01-07', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(56, 23, '2026-01-07', 'Present', 'Office', '10:00:00', '16:03:00', NULL),
(57, 17, '2026-01-07', 'Present', 'Office', '10:00:00', '17:05:00', NULL),
(58, 8, '2026-01-07', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(59, 16, '2026-01-07', 'Present', 'Office', '10:00:00', '16:42:00', NULL),
(60, 25, '2026-01-07', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(61, 5, '2026-01-07', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(62, 6, '2026-01-07', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(63, 7, '2026-01-07', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(64, 15, '2026-01-08', 'Present', 'Office', '01:44:00', '09:21:00', NULL),
(65, 23, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(66, 23, '2026-01-10', 'Present', 'Office', '00:57:00', '01:35:00', NULL),
(67, 23, '2026-01-12', 'Present', 'Office', '15:01:00', '16:38:00', NULL),
(68, 23, '2026-01-14', 'Present', 'Office', '02:06:00', '02:13:00', NULL),
(69, 5, '2026-01-14', 'Present', 'Office', '02:14:00', '02:25:00', NULL),
(70, 23, '2026-01-17', 'Present', 'Office', '10:00:00', '13:49:00', NULL),
(71, 20, '2026-01-17', 'Present', 'Office', '10:10:00', '18:00:00', NULL),
(72, 19, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(73, 6, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(74, 13, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(75, 17, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(76, 9, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(77, 22, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(78, 8, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(79, 15, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(80, 14, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(81, 11, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(82, 21, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(83, 25, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(84, 10, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(85, 7, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(86, 5, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(87, 16, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(88, 12, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(89, 18, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(90, 24, '2026-01-17', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(91, 23, '2026-01-18', 'Present', 'Office', '01:07:00', '23:26:00', NULL),
(92, 23, '2026-01-20', 'Present', 'Office', '02:47:00', '14:43:00', NULL),
(93, 8, '2026-01-20', 'Present', 'Office', '03:06:00', NULL, NULL),
(94, 26, '2026-01-20', 'Present', 'Office', '03:22:00', '03:22:00', NULL),
(95, 20, '2026-01-20', 'Present', 'Office', '11:19:00', NULL, NULL),
(96, 22, '2026-01-20', 'Present', 'Office', '11:20:00', NULL, NULL),
(97, 16, '2026-01-20', 'Present', 'Office', '11:23:00', NULL, NULL),
(98, 15, '2026-01-20', 'Present', 'Office', '11:25:00', NULL, NULL),
(99, 19, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(100, 6, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(101, 20, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(102, 13, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(103, 17, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(104, 9, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(105, 22, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(106, 8, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(107, 15, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(108, 14, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(109, 11, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(110, 21, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(111, 25, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(112, 10, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(113, 26, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(114, 7, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(115, 5, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(116, 16, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(117, 12, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(118, 18, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(119, 24, '2026-01-09', 'Present', 'Office', '10:00:00', '17:00:00', NULL),
(120, 13, '2026-01-20', 'Present', 'Office', '14:01:00', NULL, NULL),
(121, 11, '2026-01-20', 'Present', 'Office', '14:41:00', NULL, NULL),
(122, 18, '2026-01-20', 'Present', 'Office', '15:07:00', NULL, NULL),
(123, 17, '2026-01-20', 'Present', 'Office', '15:12:00', NULL, NULL),
(124, 20, '2026-01-21', 'Present', 'Office', '11:07:00', NULL, NULL),
(125, 11, '2026-01-21', 'Present', 'Office', '11:41:00', NULL, NULL),
(126, 15, '2026-01-21', 'Present', 'Office', '12:16:00', NULL, NULL),
(127, 6, '2026-01-21', 'Present', 'Office', '12:25:00', NULL, NULL),
(128, 22, '2026-01-21', 'Present', 'Office', '12:26:00', NULL, NULL),
(129, 13, '2026-01-21', 'Present', 'Office', '15:38:00', NULL, NULL),
(130, 16, '2026-01-21', 'Present', 'Office', '16:40:00', '16:40:00', NULL),
(131, 23, '2026-01-21', 'Present', 'Office', '19:34:00', '20:03:00', NULL),
(132, 18, '2026-01-22', 'Present', 'Office', '10:42:00', NULL, NULL),
(133, 20, '2026-01-22', 'Present', 'Office', '11:24:00', NULL, NULL),
(134, 22, '2026-01-22', 'Present', 'Office', '11:31:00', NULL, NULL),
(135, 17, '2026-01-22', 'Present', 'Office', '12:15:00', NULL, NULL),
(136, 16, '2026-01-22', 'Present', 'Office', '12:33:00', '13:19:00', NULL),
(137, 11, '2026-01-22', 'Present', 'Office', '13:02:00', NULL, NULL),
(138, 8, '2026-01-22', 'Present', 'Office', '13:46:00', NULL, NULL),
(139, 22, '2026-01-23', 'Present', 'Office', '12:44:00', NULL, NULL),
(140, 23, '2026-01-23', 'Present', 'Office', '14:07:00', '15:28:00', NULL),
(141, 12, '2026-01-27', 'Present', 'Office', '11:36:00', '18:00:00', NULL),
(142, 11, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(143, 19, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(144, 6, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(145, 20, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(146, 13, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(147, 17, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(148, 9, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(149, 22, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(150, 8, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(151, 15, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(152, 14, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(153, 21, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(154, 25, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(155, 23, '2026-01-27', 'Present', 'Office', '10:00:00', '13:08:00', NULL),
(156, 10, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(157, 26, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(158, 7, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(159, 5, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(160, 16, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(161, 18, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(162, 24, '2026-01-27', 'Present', 'Office', '10:00:00', '18:00:00', NULL),
(163, 12, '2026-01-28', 'Present', 'Office', '12:34:00', NULL, NULL),
(164, 11, '2026-01-28', 'Present', 'Office', '13:51:00', NULL, NULL),
(165, 18, '2026-01-28', 'Present', 'Office', '16:40:00', NULL, NULL),
(166, 12, '2026-01-29', 'Present', 'Office', '12:08:00', NULL, NULL),
(167, 20, '2026-01-29', 'Present', 'Office', '13:01:00', NULL, NULL),
(168, 23, '2026-01-29', 'Present', 'Office', '13:06:00', NULL, NULL),
(169, 18, '2026-01-30', 'Present', 'Office', '10:40:00', NULL, NULL),
(170, 23, '2026-01-30', 'Present', 'Office', '11:43:00', NULL, NULL),
(171, 12, '2026-01-30', 'Present', 'Office', '11:55:00', '17:07:00', NULL),
(172, 11, '2026-01-30', 'Present', 'Office', '12:05:00', NULL, NULL),
(173, 12, '2026-02-02', 'Present', 'Office', '11:24:00', NULL, NULL),
(174, 11, '2026-02-02', 'Present', 'Office', '11:28:00', NULL, NULL),
(175, 23, '2026-02-02', 'Present', 'Office', '11:31:00', NULL, NULL),
(176, 16, '2026-02-02', 'Present', 'Office', '13:36:00', NULL, NULL),
(177, 20, '2026-02-03', 'Present', 'Office', '12:05:00', NULL, NULL),
(178, 12, '2026-02-04', 'Present', 'Office', '00:01:00', '00:04:00', NULL),
(179, 11, '2026-02-12', 'Present', 'Office', '16:48:00', NULL, NULL),
(180, 8, '2026-03-12', 'Present', 'Office', '00:27:00', '00:31:00', NULL),
(181, 28, '2026-03-31', 'Present', 'Office', '13:20:00', '13:23:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action_type` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` int(11) NOT NULL,
  `quotation_ref_id` int(11) DEFAULT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_email` varchar(255) DEFAULT NULL,
  `client_phone` varchar(50) DEFAULT NULL,
  `client_address` text DEFAULT NULL,
  `bill_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `tax_percent` decimal(5,2) DEFAULT 0.00,
  `tax_amount` decimal(10,2) DEFAULT 0.00,
  `total_amount` decimal(10,2) NOT NULL,
  `status` enum('Unpaid','Paid','Overdue') DEFAULT 'Unpaid',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `client_id` int(11) DEFAULT NULL,
  `verification_code` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`id`, `quotation_ref_id`, `client_name`, `client_email`, `client_phone`, `client_address`, `bill_date`, `due_date`, `subtotal`, `tax_percent`, `tax_amount`, `total_amount`, `status`, `notes`, `created_at`, `client_id`, `verification_code`) VALUES
(1, NULL, 'Aisha Jamadar', 'abirafilmsphoto7@gmail.com', '9136567747', 'Abiraa Photo & Films, Shop no 01, Kashish galaxy Apt, 90ft road, Kalyan east - 421 306.', '2025-12-25', '2025-06-23', 15000.00, 0.00, 0.00, 15000.00, 'Paid', '', '2025-12-25 15:16:41', 1, NULL),
(2, NULL, 'Sanjay Kamble', 'shardasadanlatur@gmail.com', '9657272387', 'Arvi Ta, Dist Latur 413531', '2025-12-25', '2025-10-15', 20000.00, 0.00, 0.00, 20000.00, 'Paid', '', '2025-12-26 02:56:41', 2, NULL),
(4, NULL, 'SP Info pvt ltd', 'head.info@spinfo.co.in', '7620030801', 'Office no. 810, 8th Floor,\r\nGlobal Business Hub,\r\nEON Free Zone, Kharadi,\r\nPune, Maharashtra - 411014', '2026-02-12', '2026-02-12', 20500.00, 0.00, 0.00, 20500.00, 'Paid', '', '2026-02-12 10:00:40', 4, NULL),
(5, NULL, 'Blofon', '', '', '', '2026-03-02', '2026-03-05', 68000.00, 0.00, 0.00, 68000.00, 'Unpaid', '', '2026-03-02 06:50:18', 5, NULL),
(6, NULL, 'Blofon', '', '', '', '2026-03-02', '2026-03-04', 635.00, 0.00, 0.00, 635.00, 'Unpaid', '', '2026-03-02 06:53:45', 5, NULL),
(7, NULL, 'Geocon Consultancy', 'geoconconsultancy@gmail.com', '', 'Bunglow A/21 1st Floor, Rajarshi Shahu Society, Opp. Walwekar Lawns,\r\nBibwewadi, Pune, Maharashtra\r\n411037, India', '2026-06-14', '2026-06-15', 21500.00, 0.00, 0.00, 21500.00, 'Overdue', '', '2026-06-14 14:41:45', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bill_items`
--

CREATE TABLE `bill_items` (
  `id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `bill_items`
--

INSERT INTO `bill_items` (`id`, `bill_id`, `description`, `quantity`, `unit_price`, `total`) VALUES
(1, 1, 'Standard Static Website Development\r\nScope:\r\n• 4-5 Pages (Home, About, Services, Contact)\r\n• Mobile & Desktop Responsive\r\n• Contact Form Integration\r\n• Basic SEO Friendly Structure', 1.00, 13000.00, 13000.00),
(2, 1, 'Domain Name Registration (1 Year) - .com / .in / .org (Charged at actuals, est.)', 1.00, 500.00, 500.00),
(3, 1, 'Standard Web Hosting (1 Year) - Includes SSL, Email Accounts, and Daily Backups', 1.00, 1500.00, 1500.00),
(4, 2, 'Website Development & Customization\r\nScope:\r\n• Upto 7-8 pages (About, Social Work, Gallery, Videos, Contact, etc.)\r\n• Mobile, tablet & desktop responsive design\r\n• Photo gallery & Video section\r\n• Contact form & Social media links\r\n• Basic SEO setup\r\n• Includes Testing & Quality Check', 1.00, 20000.00, 20000.00),
(6, 4, 'Custom Web Application Development - PHP/MySQL /\r\nStack. Includes Admin Panel, User Management, and Reporting.', 1.00, 20500.00, 20500.00),
(7, 5, 'Project Cost Breakdown – Card Design & Packaging\r\n\r\n1. Card System and Concept Development — ₹10,000\r\nCreation of the master visual language including layout structure, typography system, color palette, grid setup, and base template for all cards.\r\n\r\n2. Standard Category Cards (50 Cards) — ₹25,000\r\nDesign adaptation using the approved template, including content placement, alignment, consistency checks, and preparation of print-ready files.\r\n\r\n3. Special Cards (12 Cards) — ₹18,000\r\nCustom design treatment for special cards requiring additional layout attention, unique visual elements, and refined detailing.\r\n\r\n4. Box Packaging Design — ₹15,000\r\nComplete packaging artwork including dieline placement, front and back design, bleed and margin setup, and final print production files.\r\n\r\nTotal Project Cost: ₹68,000', 1.00, 68000.00, 68000.00),
(8, 6, 'Project Cost Breakdown – Card Design & Packaging\r\n\r\n1. Card System and Concept Development — €95\r\nCreation of the master visual language including layout structure, typography system, color palette, grid setup, and base template for all cards.\r\n\r\n2. Standard Category Cards (50 Cards) — €235\r\nDesign adaptation using the approved template, including content placement, alignment, consistency checks, and preparation of print-ready files.\r\n\r\n3. Special Cards (12 Cards) — €170\r\nCustom design treatment for special cards requiring additional layout attention, unique visual elements, and refined detailing.\r\n\r\n4. Box Packaging Design — €135\r\nComplete packaging artwork including dieline placement, front and back design, bleed and margin setup, and final print production files.\r\n\r\nTotal Project Cost: €635', 1.00, 635.00, 635.00),
(9, 7, 'Custom Web Application Development - PHP/MySQL / MERN Stack. Includes Admin Panel, User Management, and Reporting.', 1.00, 13500.00, 13500.00),
(10, 7, 'Standard Web Hosting and Maintanance (1 Year) - Includes SSL, Basic Google SEO, and Daily Backups', 1.00, 8000.00, 8000.00);

-- --------------------------------------------------------

--
-- Table structure for table `calendar_events`
--

CREATE TABLE `calendar_events` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `color` varchar(20) DEFAULT '#3b82f6',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `recipient_name` varchar(255) NOT NULL,
  `recipient_details` text DEFAULT NULL,
  `issue_date` date NOT NULL,
  `duration_start` date DEFAULT NULL,
  `duration_end` date DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` enum('Draft','Issued') DEFAULT 'Issued',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `verification_code` varchar(64) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `certificate_code` varchar(50) DEFAULT NULL,
  `issued_by` int(11) DEFAULT NULL,
  `signatory` varchar(50) DEFAULT 'founder',
  `client_id` int(11) DEFAULT NULL,
  `data_payload` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `type`, `recipient_name`, `recipient_details`, `issue_date`, `duration_start`, `duration_end`, `description`, `status`, `created_at`, `verification_code`, `employee_id`, `certificate_code`, `issued_by`, `signatory`, `client_id`, `data_payload`) VALUES
(27, 'Notice', 'All Members', 'All Teams', '2026-01-28', NULL, NULL, 'Hello Team,\r\n\r\nWe are implementing a structured team system at Webworks Studios to ensure better coordination and accountability.\r\n\r\nEach team will now function under an assigned Team Lead.\r\nAll communication, task updates, clarifications, and submissions must be routed through your respective Team Lead only.\r\n\r\nPlease understand:\r\n\r\nYour Team Lead is your first point of contact\r\n\r\nInstructions given by the Team Lead must be followed strictly\r\n\r\nIndividual reporting to management without routing through the Team Lead is not encouraged unless specifically asked\r\n\r\nThis structure is effective immediately.\r\nLet’s maintain discipline, professionalism, and timely delivery.\r\n\r\n— Kashinath\r\nFounder, Webworks Studios', 'Issued', '2026-01-28 06:19:20', '6f2a9f001e0e7c6e5da637e033865ce7', NULL, NULL, NULL, 'founder', NULL, NULL),
(29, NULL, 'Aarti Gaikwad', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 06:12:04', 'df38c6ae2c624e109d831d74e42ff714', 19, 'CERT-2026-0019', 1, 'co_founder', NULL, NULL),
(30, NULL, 'Aayush Tongale', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 06:14:53', 'ed3f63c01050ed2c0eb8172b1173bd73', 6, 'CERT-2026-0006', 1, 'co_founder', NULL, NULL),
(31, NULL, 'Aditi Kulkarni ', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 06:14:59', '3ee4000f2cc4fca434f12c5042d699e9', 20, 'CERT-2026-0020', 1, 'co_founder', NULL, NULL),
(32, NULL, 'Amisha Ankush Parodhi', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 06:15:08', '9993a611392ee01be1febd41a81ccf92', 13, 'CERT-2026-0013', 1, 'co_founder', NULL, NULL),
(33, NULL, 'Atharv Farakate', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 06:15:15', '5c9866d1b4c3cdef2fcd7c8f6d836158', 9, 'CERT-2026-0009', 1, 'co_founder', NULL, NULL),
(34, NULL, 'Chaitanya Shelar', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 06:15:37', 'a4191dda45a84a23409ba6c70d99be51', 22, 'CERT-2026-0022', 1, 'co_founder', NULL, NULL),
(35, NULL, 'Disha Amol Gaikwad ', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 06:15:45', 'd284856de5b1b59c49c0a256f844a7a5', 15, 'CERT-2026-0015', 1, 'co_founder', NULL, NULL),
(36, NULL, 'Hrishikesh Gaware ', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 06:15:56', '9d0a8689ca03fc1a819101e894f97feb', 14, 'CERT-2026-0014', 1, 'co_founder', NULL, NULL),
(37, NULL, 'Hritik Shingare', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 06:16:19', '19511bf5750706c4104f7e1409cd05b2', 11, 'CERT-2026-0011', 1, 'co_founder', NULL, NULL),
(38, NULL, 'Manali Wangwad', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 06:16:28', '5c81669d905ba780983c833145a88dd7', 21, 'CERT-2026-0021', 1, 'co_founder', NULL, NULL),
(39, NULL, 'Pawan amrut saindane', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 06:16:34', '05778fd07a2bdb9fcef70a1d02907bb2', 25, 'CERT-2026-0025', 1, 'co_founder', NULL, NULL),
(40, NULL, 'Sai Kashid', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 07:30:35', '53cbfed171423efe60e74ea6c631fc27', 23, 'CERT-2026-0023', 1, 'co_founder', NULL, NULL),
(41, NULL, 'Sairaj Ashok Deshmukh', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 07:30:43', '5b90077cb6bd16e52e21dccaa02e030e', 10, 'CERT-2026-0010', 1, 'co_founder', NULL, NULL),
(42, NULL, 'Shreya Mote', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 07:30:50', '64a057a926ed8c9a501687a067841686', 7, 'CERT-2026-0007', 1, 'co_founder', NULL, NULL),
(43, NULL, 'Shruti Patil', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 07:30:59', 'ee09aa6a9738c724154023bccda8dc85', 16, 'CERT-2026-0016', 1, 'co_founder', NULL, NULL),
(44, NULL, 'Siddhesh ', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 07:31:06', '047f19bdc7edfb504a79090d95c13c22', 12, 'CERT-2026-0012', 1, 'co_founder', NULL, NULL),
(45, NULL, 'Sujwal Potdar', NULL, '2026-02-04', NULL, NULL, NULL, 'Issued', '2026-02-04 07:31:13', 'a7673435a338036ce925a02b9a35aeef', 18, 'CERT-2026-0018', 1, 'co_founder', NULL, NULL),
(47, NULL, 'Ashtvinayak Lingayat', NULL, '2026-02-09', NULL, NULL, NULL, 'Issued', '2026-02-09 10:10:28', '02c991e1799ce9fd2a5c486ea1c5036e', 17, 'CERT-2026-0017', 1, 'co_founder', NULL, NULL),
(48, NULL, 'Kashinath Gaikwad', NULL, '2026-02-10', NULL, NULL, NULL, 'Issued', '2026-02-10 09:09:25', 'ecc96bb4f236cfe2ce768e18804de510', 27, 'CERT-2026-0027', 1, 'co_founder', NULL, NULL),
(49, 'Internship', 'Deepak Kumar', 'Technical Intern', '2026-02-04', '2026-01-05', '2026-02-04', '', 'Issued', '2026-02-12 16:33:25', 'af1c3cd28f49732db0acc609e5d16e54', NULL, NULL, NULL, 'co_founder', NULL, NULL),
(50, NULL, 'Deepak Kumar', NULL, '2026-02-12', NULL, NULL, NULL, 'Issued', '2026-02-12 16:34:30', '012a302c40124622c43c78f23c78c92f', 8, 'CERT-2026-0008', 1, 'co_founder', NULL, NULL),
(51, 'Internship', 'Harshada Akotkar', 'Technical Intern', '2026-02-04', '2026-01-05', '2026-02-04', '', 'Issued', '2026-03-27 06:51:08', 'ed9c72c59de66b5a3653370fcbbeda06', NULL, NULL, NULL, 'co_founder', NULL, NULL),
(52, 'Internship', 'Shravan Dnyandev Ghuge', 'Technical Intern', '2026-05-02', '2026-04-01', '2026-05-01', '', 'Issued', '2026-05-03 09:12:44', 'f989344af58b43e6ddfc1cd20315b0e8', NULL, NULL, NULL, 'co_founder', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `chat_groups`
--

CREATE TABLE `chat_groups` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` enum('department','public','private') DEFAULT 'public',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chat_groups`
--

INSERT INTO `chat_groups` (`id`, `name`, `description`, `type`, `created_at`) VALUES
(1, 'General', 'General discussion for everyone', 'public', '2026-01-17 19:31:16'),
(2, 'Marketing Dept', 'Marketing team collaboration', 'department', '2026-01-17 19:31:16'),
(3, 'Development Dept', 'Dev team & code discussion', 'department', '2026-01-17 19:31:16'),
(4, 'HR & Admin', 'HR related discussions', 'department', '2026-01-17 19:31:16'),
(5, 'Sales Team', 'Sales updates and leads', 'department', '2026-01-17 19:31:16');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `referral_source` varchar(100) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `total_project_amount` decimal(10,2) DEFAULT 0.00,
  `amount_received` decimal(10,2) DEFAULT 0.00,
  `payment_status` enum('Pending','Partial','Paid','Overdue') DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `name`, `email`, `phone`, `address`, `company_name`, `status`, `referral_source`, `notes`, `created_at`, `total_project_amount`, `amount_received`, `payment_status`) VALUES
(1, 'Aisha Jamadar', 'abirafilmsphoto7@gmail.com', '9136567747', 'Abiraa Photo & Films, Shop no 01, Kashish galaxy Apt, 90ft road, Kalyan east - 421 306.', 'Abiraa Studio', 'Active', 'Direct', '', '2025-12-25 15:15:36', 15000.00, 15000.00, 'Paid'),
(2, 'Sanjay Kamble', 'shardasadanlatur@gmail.com', '9657272387', 'Arvi Ta, Dist Latur 413531', 'Sharda Sadan School', 'Active', 'Direct', '', '2025-12-25 15:48:44', 20000.00, 40000.00, 'Paid'),
(3, 'Padam Jadhav', 'Padamjadhav1000@gmail.com', '7350557979', 'Flat No. 101, First Floor\r\nSurvey No. 176, Shantai Niwas\r\nBhekarainagar, Phursungi, Pune - 412308', 'PBJ Infra', 'Active', 'Referral', '', '2025-12-25 15:51:29', 17000.00, 12000.00, 'Partial'),
(4, 'Anil Patil', 'head.info@spinfo.co.in', '7620030801', 'Office no. 810, 8th Floor,\r\nGlobal Business Hub,\r\nEON Free Zone, Kharadi,\r\nPune, Maharashtra - 411014', 'SP Info', 'Active', 'Direct', '', '2026-02-12 09:56:55', 20500.00, 5000.00, 'Partial'),
(5, 'Blofon', '', '', '', 'Blofon', 'Active', 'Direct', '', '2026-03-02 06:46:49', 70000.00, 0.00, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `client_users`
--

CREATE TABLE `client_users` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `company_calendar`
--

CREATE TABLE `company_calendar` (
  `id` int(11) NOT NULL,
  `event_name` varchar(255) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `type` enum('Holiday','Event','Meeting','Festival','Other') DEFAULT 'Event',
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `company_calendar`
--

INSERT INTO `company_calendar` (`id`, `event_name`, `event_date`, `type`, `description`, `created_at`) VALUES
(2, 'Republic Day', '2026-01-26', 'Holiday', 'Commemorating the enactment of the Constitution of India.', '2026-01-12 11:03:06'),
(3, 'Independence Day', '2026-08-15', 'Holiday', 'Celebrating national independence.', '2026-01-12 11:03:06'),
(4, 'Gandhi Jayanti', '2026-10-02', 'Holiday', 'Birthday of Mahatma Gandhi.', '2026-01-12 11:03:06'),
(5, 'Holi', '2026-03-04', 'Festival', 'The festival of colors.', '2026-01-12 11:03:06'),
(6, 'Gudi Padwa', '2026-03-19', 'Festival', 'Traditional New Year.', '2026-01-12 11:03:06'),
(7, 'Ram Navami', '2026-03-27', 'Festival', 'Birth of Lord Rama.', '2026-01-12 11:03:06'),
(8, 'Mahavir Jayanti', '2026-03-31', 'Festival', 'Birth of Lord Mahavir.', '2026-01-12 11:03:06'),
(9, 'Good Friday', '2026-04-03', 'Festival', 'Observing the crucifixion of Jesus.', '2026-01-12 11:03:06'),
(10, 'Dr. Ambedkar Jayanti', '2026-04-14', 'Festival', 'Birthday of Dr. B.R. Ambedkar.', '2026-01-12 11:03:06'),
(11, 'Raksha Bandhan', '2026-08-27', 'Festival', 'Celebrating the brother-sister bond.', '2026-01-12 11:03:06'),
(12, 'Janmashtami', '2026-09-04', 'Festival', 'Birth of Lord Krishna.', '2026-01-12 11:03:06'),
(13, 'Ganesh Chaturthi', '2026-09-14', 'Festival', 'Festival of Lord Ganesha.', '2026-01-12 11:03:06'),
(14, 'Dussehra', '2026-10-20', 'Festival', 'Victory of good over evil.', '2026-01-12 11:03:06'),
(15, 'Diwali', '2026-11-08', 'Festival', 'The festival of lights.', '2026-01-12 11:03:06'),
(16, 'Guru Nanak Jayanti', '2026-11-24', 'Festival', 'Birth of Guru Nanak.', '2026-01-12 11:03:06'),
(17, 'Christmas', '2026-12-25', 'Festival', 'Celebrating the birth of Jesus Christ.', '2026-01-12 11:03:06'),
(18, 'World Environment Day', '2026-06-05', 'Event', 'Focus on environmental issues.', '2026-01-12 11:03:06'),
(19, 'Engineers Day', '2026-09-15', 'Event', 'Tribute to Sir M. Visvesvaraya.', '2026-01-12 11:03:06');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `employment_type` enum('Full Time','Part Time','Intern','Contract') DEFAULT 'Full Time',
  `college_name` varchar(100) DEFAULT NULL,
  `joining_date` date DEFAULT NULL,
  `base_salary` decimal(10,2) DEFAULT 0.00,
  `address` text DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(50) DEFAULT NULL,
  `pan_card` varchar(50) DEFAULT NULL,
  `status` enum('Active','Resigned','Terminated') DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `profile_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `full_name`, `email`, `phone`, `designation`, `employment_type`, `college_name`, `joining_date`, `base_salary`, `address`, `bank_name`, `account_number`, `ifsc_code`, `pan_card`, `status`, `created_at`, `profile_image`) VALUES
(5, 'Shriniwas Mashale', 'shrimashale@gmail.com', '9322164737', 'Developer', 'Full Time', '', '2026-01-05', 10000.00, '405, Malhar Hights, nahre\r\nnahre', '', '', '', '', 'Active', '2026-01-05 05:44:30', 'uploads/employees/emp_695b4fbedb20a.jpeg'),
(6, 'Aayush Tongale', 'tongaleaayush@gmail.com', '9096098805', 'Technical Intern', 'Intern', 'ZCOER', '2026-01-05', 0.00, 'Narhe, Pune', '', '', '', '', 'Active', '2026-01-05 05:48:41', 'uploads/employees/emp_695b54eb4ea22.jpeg'),
(7, 'Shreya Mote', 'shreyamote96@gmail.com', '9075994887', 'Technical Intern', 'Intern', 'ZCOER', '2026-01-05', 0.00, 'Narhe, Pune', '', '', '', '', 'Active', '2026-01-05 05:55:18', 'uploads/employees/emp_695b529440d1a.jpg'),
(8, 'Deepak Kumar', 'dkjha4770@gmail.com', '7479754628', 'Technical Intern', 'Intern', '', '2026-01-05', 0.00, '', '', '', '', '', 'Active', '2026-01-05 05:56:54', 'uploads/employees/emp_695b534739cf5.jpeg'),
(9, 'Atharv Farakate', 'atharvfarakate@gmail.com', '8767972189', 'Technical Intern', 'Intern', 'Zcoer', '2026-01-05', 0.00, 'Vrundavan Srushti , Near zeal college , Narhe , Pune', '', '', '', '', 'Active', '2026-01-05 05:59:36', 'uploads/employees/emp_695b538892b93.jpeg'),
(10, 'Sairaj Ashok Deshmukh', 'sairajdeshmukh51@gmail.com', '8007422703', 'Technical intern', 'Intern', 'ZCOER', '2026-01-05', 0.00, 'Flat no. 36, A wing, Ganeshpark Society, Shantinagar, Kirtinagar, Vadgaon Budruk, Pune, Maharashtra', '', '', '', '', 'Active', '2026-01-05 06:02:00', 'uploads/employees/emp_695b53d894585.jpeg'),
(11, 'Hritik Shingare', 'hruthikshingare1@gmail.com', '9356419957', 'Technical Intern', 'Intern', 'ZCOER', '2026-01-05', 0.00, 'Zolo Pinnacle - PG in Narhe | Ladies & Gents PG Madhuram Choudhary Building, Abhinav College Rd, near Walhekar Chowk, Narhe, Pune, Maharashtra 411041', '', '', '', '', 'Active', '2026-01-05 06:02:59', 'uploads/employees/emp_695b5413632f6.png'),
(12, 'Siddhesh ', 'siduborde1234@gmail.com', '7219330922', 'Technical intern', 'Intern', 'ZCOER', '2026-01-05', 0.00, '', '', '', '', '', 'Active', '2026-01-05 06:03:11', 'uploads/employees/emp_695b5575794c3.jpg'),
(13, 'Amisha Ankush Parodhi', 'amishaaa44@gmail.com', '9359842485', 'Technical Intern', 'Intern', '', '2026-01-05', 0.00, 'Moraya Elegance near zeal college of Engineering and research', '', '', '', '', 'Active', '2026-01-05 06:04:54', 'uploads/employees/emp_695b5486af010.jpg'),
(14, 'Hrishikesh Gaware ', 'hrishigaware63@gmail.com', '+91 7276142636', 'Technical Intern', 'Intern', 'Zcoer', '2026-01-05', 0.00, 'Ganesh Apartment, abhinav college road,narhe,pune', '', '', '', '', 'Active', '2026-01-05 06:05:32', 'uploads/employees/emp_695b54ac8cd31.jpg'),
(15, 'Disha Amol Gaikwad ', 'gdisha79359@gmail.com', '7276221379', 'Technical Intern ', 'Intern', 'ZCOER', '2026-01-05', 0.00, 'Narhe , Pune ', '', '', '', '', 'Active', '2026-01-05 06:05:58', NULL),
(16, 'Shruti Patil', 'patilshrutii2005@gmail.com', '7721073634', 'Technical Intern', 'Intern', 'zcoer', '2026-01-05', 0.00, 'Narhe, Pune', '', '', '', '', 'Active', '2026-01-05 06:06:23', NULL),
(17, 'Ashtvinayak Lingayat', 'lingayatashtvinayak11@gmail.com', '9356769152', 'Technical intern', 'Intern', 'ZCOER', '2026-01-05', 0.00, '', '', '', '', '', 'Active', '2026-01-05 06:06:36', 'uploads/employees/emp_695b54ecd4a88.jpg'),
(18, 'Sujwal Potdar', 'sujwalpotdar5571@gmail.com', '9373408794', 'Technical Intern', 'Intern', 'ZCOER', '2026-01-05', 0.00, 'Shlok Avenue, near BeFit Gym zeal chowk, Narhe, Pune 411041', 'BOB ', '', '', '', 'Active', '2026-01-05 06:07:36', NULL),
(19, 'Aarti Gaikwad', 'aartiitp2006@gmail.com', '9604296473', 'Technical intern', 'Intern', '', '2026-01-05', 0.00, 'Moraya Elegance,near Zeal college of Engineering and research\r\n', '', '', '', '', 'Active', '2026-01-05 06:11:08', 'uploads/employees/emp_695b5632c0271.jpg'),
(20, 'Aditi Kulkarni ', 'aditikulkarni910@gmail.com', '9028051909', 'Technical Intern ', 'Intern', 'ZCOER', '2026-01-05', 0.00, 'Moraya Elegance, near Zeal College of Engineering and research, Narhe, Pune ', '', '', '', '', 'Active', '2026-01-05 06:12:07', 'uploads/employees/emp_695b569badd94.jpeg'),
(21, 'Manali Wangwad', 'manaliwangwad09@gmail.com', '8767531718', 'Technical Intern', 'Intern', 'ZCOER', '2026-01-05', 0.00, 'Zolo Pinnacle - PG in Narhe | Ladies & Gents PG Madhuram Choudhary Building, Abhinav College Rd, near Walhekar Chowk, Narhe, Pune, Maharashtra 411041', '', '', '', '', 'Active', '2026-01-05 06:17:13', NULL),
(22, 'Chaitanya Shelar', 'chaitanyashelar125@gmail.com', '9307222958', 'Technical Intern ', 'Intern', 'Zeal College of Engineering and Research, Narhe , Pune', '2026-01-05', 0.00, 'Ish Apartment , Narhe , Pune Maharashtra, 411041', '', '', '', '', 'Active', '2026-01-05 06:38:46', 'uploads/employees/emp_695b5d53c1230.jpg'),
(23, 'Sai Kashid', 'saeekashid106@gmail.com', '9503437575', 'Technical Intern', 'Intern', 'ZCOER', '2026-01-05', 0.00, 'Orchid Living girls hostel pg,Narhe ,Pune,411041', '', '', '', '', 'Active', '2026-01-06 06:26:44', NULL),
(24, 'Vaibhav Bhaskar Panhale ', 'Panhalevaibhav9@gmail.com', '7499193729', 'Technical Intern', 'Intern', 'ZCOER', '2026-01-06', 0.00, 'narhe,pune', '', '', '', '', 'Active', '2026-01-06 06:41:55', NULL),
(25, 'Pawan amrut saindane', 'saindanepavan4@gmail.com', '8600580975', 'Technical Intern', 'Intern', 'ZCOER', '2026-01-06', 0.00, 'ish apartment , flat no. 303 , maratha hotel , narhe , pune', '', '', '', '', 'Active', '2026-01-06 09:05:45', NULL),
(26, 'Sharayu Bhartiya', 'sharayubhartiya@gmail.com', '7499551367', 'HR Manager', 'Full Time', '', '2026-01-19', 0.00, 'Latur, Maharashtra', '', '', '', '', 'Active', '2026-01-19 21:34:30', 'uploads/employees/emp_696ea36689bd6.jpeg'),
(27, 'Kashinath Gaikwad', 'kashinathgaikwad844@gmail.com', '08208650416', 'Intern', 'Intern', 'ZCOER', '2026-01-05', 0.00, '405, Malhar Hights, Narhe Pune', '', '', '', '', 'Active', '2026-02-10 09:08:48', 'uploads/employees/emp_698af5a0d133a.jpg'),
(28, 'Shravan Dnyandev Ghuge', 'shravan45x@gmail.com', '9422958592', 'Intern', 'Intern', 'ZCOER', '2026-04-01', 0.00, '', 'State Bank of India', '42477669964', 'SBIN0011648', 'DRUPG4617K', 'Active', '2026-03-31 07:49:44', 'uploads/employees/emp_69cb7c98e75dd.png');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_anonymous` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `finance_records`
--

CREATE TABLE `finance_records` (
  `id` int(11) NOT NULL,
  `type` enum('Income','Expense') NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `transaction_date` date NOT NULL,
  `description` text DEFAULT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `client_id` int(11) DEFAULT NULL,
  `bill_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `finance_records`
--

INSERT INTO `finance_records` (`id`, `type`, `category`, `amount`, `transaction_date`, `description`, `reference_id`, `payment_method`, `created_at`, `client_id`, `bill_id`) VALUES
(1, 'Income', 'Project Payment', 15000.00, '2025-12-25', '', NULL, 'UPI', '2025-12-25 15:44:54', 1, NULL),
(2, 'Expense', 'Other', 15000.00, '2025-12-25', 'Personal Transfer', NULL, 'UPI', '2025-12-25 15:45:32', 1, NULL),
(3, 'Income', 'Project Payment', 20000.00, '2025-12-26', '', NULL, 'UPI', '2025-12-26 02:58:15', 2, NULL),
(4, 'Income', 'Project Payment', 12000.00, '2025-12-26', '', NULL, 'UPI', '2025-12-26 02:58:32', 3, NULL),
(5, 'Expense', 'Other', 32000.00, '2025-12-26', 'Peronal Transfer', NULL, 'UPI', '2025-12-26 03:01:01', NULL, NULL),
(7, 'Income', 'Other Income', 4500.00, '2026-01-19', '', NULL, 'UPI', '2026-01-21 14:09:45', NULL, NULL),
(8, 'Expense', 'Other Expense', 500.00, '2026-01-19', 'Bahgavati', NULL, 'UPI', '2026-01-21 14:11:25', NULL, NULL),
(9, 'Expense', 'Utilities', 440.00, '2026-01-20', 'Stamp', NULL, 'UPI', '2026-01-21 14:13:24', NULL, NULL),
(10, 'Expense', 'Other Expense', 1000.00, '2026-01-20', 'Bahgavati', NULL, 'UPI', '2026-01-21 14:14:27', NULL, NULL),
(11, 'Expense', 'Other Expense', 70.00, '2026-01-21', 'Travel', NULL, 'UPI', '2026-01-21 14:17:15', NULL, NULL),
(12, 'Expense', 'Other Expense', 500.00, '2026-01-21', 'Sanket', NULL, 'UPI', '2026-01-21 14:33:06', NULL, NULL),
(13, 'Expense', 'Other Expense', 300.00, '2026-01-21', 'Travel(Deepak and Saif)', NULL, 'UPI', '2026-01-21 15:45:34', NULL, NULL),
(14, 'Expense', 'Other Expense', 80.00, '2026-01-21', 'kashinath(Medical)', NULL, 'UPI', '2026-01-23 09:53:22', NULL, NULL),
(15, 'Expense', 'Other Expense', 335.00, '2026-01-22', 'Food', NULL, 'UPI', '2026-01-23 09:54:43', NULL, NULL),
(16, 'Expense', 'Other Expense', 110.00, '2026-01-22', 'Petrol', NULL, 'UPI', '2026-01-23 09:55:44', NULL, NULL),
(17, 'Expense', 'Other Expense', 1054.47, '2026-01-23', 'food(ordered)', NULL, 'UPI', '2026-01-23 09:57:14', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leave_applications`
--

CREATE TABLE `leave_applications` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `leave_type` varchar(50) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `status` enum('Pending','Approved','Rejected') DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `leave_applications`
--

INSERT INTO `leave_applications` (`id`, `employee_id`, `leave_type`, `start_date`, `end_date`, `reason`, `status`, `created_at`) VALUES
(1, 23, 'Sick Leave', '2026-01-09', '2026-01-16', 'Medical', 'Rejected', '2026-01-09 11:18:46'),
(2, 23, 'Sick Leave', '2026-01-10', '2026-01-11', 'Feaver', 'Rejected', '2026-01-09 11:33:01'),
(3, 18, 'Sick Leave', '2026-01-21', '2026-01-23', 'doctor says to take bed rest', 'Pending', '2026-01-20 09:38:35');

-- --------------------------------------------------------

--
-- Table structure for table `leave_balances`
--

CREATE TABLE `leave_balances` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `leave_type` varchar(50) DEFAULT NULL,
  `total_days` int(11) DEFAULT 12,
  `used_days` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `leave_balances`
--

INSERT INTO `leave_balances` (`id`, `employee_id`, `leave_type`, `total_days`, `used_days`) VALUES
(1, 26, 'Casual Leave', 12, 0),
(2, 26, 'Sick Leave', 10, 0),
(3, 26, 'Paid Leave', 15, 0),
(4, 26, 'Unpaid Leave', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `legal_documents`
--

CREATE TABLE `legal_documents` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `doc_type` enum('Contract','Agreement','NDA','Invoice','Other') DEFAULT 'Other',
  `client_id` int(11) DEFAULT NULL,
  `file_path` varchar(555) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `status` enum('Active','Expired','Draft') DEFAULT 'Active',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_calendar`
--

CREATE TABLE `marketing_calendar` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_campaigns`
--

CREATE TABLE `marketing_campaigns` (
  `id` int(11) NOT NULL,
  `campaign_name` varchar(255) DEFAULT NULL,
  `platform` varchar(100) DEFAULT NULL,
  `status` enum('active','paused','completed','scheduled') DEFAULT 'scheduled',
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `budget` decimal(10,2) NOT NULL,
  `spend` decimal(10,2) DEFAULT 0.00,
  `clicks` int(11) DEFAULT 0,
  `impressions` int(11) DEFAULT 0,
  `cpc` decimal(10,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `conversions` int(11) DEFAULT 0,
  `reach` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `message` text DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `type` enum('text','image','file','call_start','call_end','system') DEFAULT 'text',
  `context` enum('private','group') DEFAULT 'private',
  `status` enum('sent','delivered','read') DEFAULT 'sent',
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `reactions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `sender_id`, `receiver_id`, `message`, `attachment`, `type`, `context`, `status`, `is_read`, `created_at`, `reactions`) VALUES
(1, 25, 20, 'hi', NULL, 'text', 'private', 'read', 1, '2026-01-13 20:41:06', NULL),
(2, 25, 8, 'hi', NULL, 'text', 'private', 'sent', 0, '2026-01-13 20:42:37', NULL),
(3, 25, 8, 'https://meet.jit.si/Webworks_HmJt52oH', NULL, 'call_start', 'private', 'sent', 0, '2026-01-13 20:42:41', NULL),
(4, 1, 7, 'hi', NULL, 'text', 'private', 'read', 1, '2026-01-13 20:44:38', NULL),
(5, 7, 1, 'https://meet.jit.si/Webworks_KViDsOv5', NULL, 'call_start', 'private', 'read', 1, '2026-01-13 20:45:20', NULL),
(6, 7, 1, 'hello', NULL, 'text', 'private', 'read', 1, '2026-01-13 20:49:27', NULL),
(7, 25, 21, 'hii', NULL, 'text', 'private', 'read', 1, '2026-01-17 04:39:49', NULL),
(8, 25, 21, '', '../../uploads/chat/chat_696b13768f283.pdf', 'file', 'private', 'read', 1, '2026-01-17 04:43:34', NULL),
(9, 21, 25, 'Generative AI Studio_page-0001.jpg', '../../uploads/chat/chat_696b1473ce028.jpg', 'image', 'private', 'read', 1, '2026-01-17 04:47:47', NULL),
(10, 1, 7, 'https://meet.jit.si/Webworks_bxskds', NULL, 'call_start', 'private', 'sent', 0, '2026-01-17 05:06:56', NULL),
(11, 1, 7, 'https://meet.jit.si/Webworks_y13vhm', NULL, 'call_start', 'private', 'sent', 0, '2026-01-17 05:07:17', NULL),
(12, 1, 25, 'hi', NULL, 'text', 'private', 'read', 1, '2026-01-17 06:56:15', NULL),
(13, 25, 22, 'hiii', NULL, 'text', 'private', 'read', 1, '2026-01-17 07:02:31', NULL),
(14, 1, 25, 'hii', NULL, 'text', 'private', 'read', 1, '2026-01-17 08:12:02', NULL),
(16, 25, 1, 'hello', NULL, 'text', 'group', 'read', 1, '2026-01-18 13:21:37', NULL),
(17, 1, 1, '> hello', NULL, 'text', 'group', 'sent', 0, '2026-01-18 14:21:09', NULL),
(18, 1, 1, 'hi', NULL, 'text', 'group', 'sent', 0, '2026-01-18 14:32:44', NULL),
(21, 25, 1, '> > hello hello', NULL, 'text', 'group', 'read', 1, '2026-01-18 15:20:56', NULL),
(22, 25, 1, 'hello', NULL, 'text', 'group', 'read', 1, '2026-01-18 15:21:02', NULL),
(23, 25, 22, 'hii', NULL, 'text', 'private', 'read', 1, '2026-01-18 15:21:09', NULL),
(24, 25, 22, 'hii', NULL, 'text', 'private', 'read', 1, '2026-01-18 15:21:10', NULL),
(25, 25, 22, 'hii', NULL, 'text', 'private', 'read', 1, '2026-01-18 15:21:11', NULL),
(26, 25, 22, 'hii', NULL, 'text', 'private', 'read', 1, '2026-01-18 15:21:14', NULL),
(27, 25, 22, 'hii', NULL, 'text', 'private', 'read', 1, '2026-01-18 15:21:15', NULL),
(28, 25, 22, 'hii', NULL, 'text', 'private', 'read', 1, '2026-01-18 15:21:15', NULL),
(29, 25, 22, 'hii', NULL, 'text', 'private', 'read', 1, '2026-01-18 15:21:15', NULL),
(30, 25, 22, 'hii', NULL, 'text', 'private', 'read', 1, '2026-01-18 15:21:16', NULL),
(31, 25, 22, 'hello', NULL, 'text', 'private', 'read', 1, '2026-01-18 15:21:24', NULL),
(32, 25, 22, 'hello', NULL, 'text', 'private', 'read', 1, '2026-01-18 15:21:26', NULL),
(33, 25, 22, 'hello', NULL, 'text', 'private', 'read', 1, '2026-01-18 15:21:29', NULL),
(34, 25, 1, '> hi hey', NULL, 'text', 'group', 'read', 1, '2026-01-18 16:02:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `monitoring_logs`
--

CREATE TABLE `monitoring_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `window_title` varchar(255) DEFAULT NULL,
  `app_name` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT 0,
  `timestamp` timestamp NULL DEFAULT current_timestamp(),
  `device_type` varchar(20) DEFAULT 'Desktop'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `month_year` varchar(7) NOT NULL,
  `base_salary` decimal(10,2) DEFAULT 0.00,
  `present_days` int(11) DEFAULT 0,
  `total_days` int(11) NOT NULL,
  `calculated_salary` decimal(10,2) DEFAULT 0.00,
  `bonus` decimal(10,2) DEFAULT 0.00,
  `deductions` decimal(10,2) DEFAULT 0.00,
  `net_salary` decimal(10,2) DEFAULT 0.00,
  `status` enum('Pending','Paid') DEFAULT 'Pending',
  `payment_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_finance`
--

CREATE TABLE `personal_finance` (
  `id` int(11) NOT NULL,
  `type` enum('Income','Expense','Investment','Savings') NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `amount` decimal(12,2) NOT NULL,
  `transaction_date` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `personal_finance`
--

INSERT INTO `personal_finance` (`id`, `type`, `category`, `amount`, `transaction_date`, `description`, `payment_method`, `created_at`) VALUES
(1, 'Income', 'Food & Dining', 500.00, '2025-12-26', 'Mammy', 'UPI', '2025-12-26 07:00:51'),
(2, 'Income', 'Food & Dining', 2000.00, '2026-01-09', 'Mammy', 'UPI', '2026-01-09 07:58:39'),
(3, 'Expense', 'Food & Dining', 500.00, '2026-01-09', '', 'UPI', '2026-01-09 07:58:53'),
(4, 'Expense', 'Food & Dining', 110.00, '2026-01-09', 'Chiken', 'UPI', '2026-01-10 03:25:27'),
(5, 'Expense', 'Groceries', 65.00, '2026-01-09', 'Groceries', 'UPI', '2026-01-10 03:26:38'),
(6, 'Expense', 'Utilities', 338.00, '2026-01-09', 'Recharge', 'UPI', '2026-01-10 03:27:37'),
(7, 'Expense', 'Food & Dining', 35.00, '2026-01-09', 'Snacks', 'UPI', '2026-01-10 03:28:29'),
(8, 'Expense', 'Groceries', 70.00, '2026-01-09', 'Groceries', 'UPI', '2026-01-10 03:29:19'),
(9, 'Expense', 'Groceries', 23.00, '2026-01-09', 'Groceries', 'UPI', '2026-01-10 03:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('Not Started','In Progress','On Hold','Completed','Cancelled') DEFAULT 'Not Started',
  `start_date` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `client_id`, `title`, `description`, `status`, `start_date`, `deadline`, `budget`, `created_at`) VALUES
(2, 4, 'Website Development', '', 'Completed', '2026-02-12', '2026-02-13', 20500.00, '2026-02-12 09:57:32');

-- --------------------------------------------------------

--
-- Table structure for table `project_tasks`
--

CREATE TABLE `project_tasks` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_name` varchar(255) NOT NULL,
  `status` enum('Pending','In Progress','Completed') DEFAULT 'Pending',
  `due_date` date DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(11) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `client_email` varchar(255) DEFAULT NULL,
  `client_phone` varchar(50) DEFAULT NULL,
  `client_address` text DEFAULT NULL,
  `quotation_date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `tax_percent` decimal(5,2) DEFAULT 0.00,
  `tax_amount` decimal(10,2) DEFAULT 0.00,
  `total_amount` decimal(10,2) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `client_id` int(11) DEFAULT NULL,
  `verification_code` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quotations`
--

INSERT INTO `quotations` (`id`, `client_name`, `client_email`, `client_phone`, `client_address`, `quotation_date`, `due_date`, `subtotal`, `tax_percent`, `tax_amount`, `total_amount`, `notes`, `created_at`, `client_id`, `verification_code`) VALUES
(1, 'kashinath', 'kashinath@gmail.com', '8208650416', 'Pune', '2025-12-25', NULL, 20000.00, 0.00, 0.00, 20000.00, '', '2025-12-25 08:15:33', NULL, '723a4b5480a02b0aaed6b4ea188e33b1'),
(2, 'Ranjan Zambare', '', '', 'Pune', '2025-12-25', NULL, 17700.00, 0.00, 0.00, 17700.00, '', '2025-12-25 08:53:40', NULL, 'db752925f81b0798b98d838127d7c2e1'),
(5, 'Cleaning Guru', 'cleaninguru22@gmail.com', '', 'Shanti Apartment Asudgoan, Sector 4A, Sector 4B, Khanda Colony, Panvel, Navi Mumbai, Maharashtra 410206', '2026-01-05', NULL, 13000.00, 0.00, 0.00, 13000.00, '', '2026-01-05 06:48:21', NULL, NULL),
(8, 'Krishna Kumar Varma ', '', '+91 9403659659', '41 CITY HUB ,GADITAL HADAPSAR, Pune, Maharashtra, 411028', '2026-01-21', NULL, 19500.00, 0.00, 0.00, 19500.00, 'Afterwards,Yearly Maintenance will be 5000 per year', '2026-01-21 10:53:21', NULL, NULL),
(9, 'Krishna Kumar Varma ', '', '+91 9403659659', '41 CITY HUB ,GADITAL HADAPSAR, Pune, Maharashtra, 411028', '2026-01-21', NULL, 27500.00, 0.00, 0.00, 27500.00, 'Afterwards Yearly Maintenance will be charged 5000(after a year)', '2026-01-21 11:13:10', NULL, NULL),
(10, 'SP Info pvt ltd', 'sr.manager.spinfo@gmail.com', '8421811146', 'Office no 810 , 8th floor Global business hub, Kharadi , pune', '2026-01-21', NULL, 21000.00, 0.00, 0.00, 21000.00, '', '2026-01-21 12:05:53', NULL, NULL),
(11, 'SP Info pvt ltd', 'sr.manager.spinfo@gmail.com', '', 'Office no 810 , 8th floor Global business hub, Kharadi , pune', '2026-01-21', NULL, 15000.00, 0.00, 0.00, 15000.00, '', '2026-01-21 12:22:30', NULL, NULL),
(15, 'Pratik Darade', '', '+91 7414 941 424', 'Pune', '2026-02-06', NULL, 15000.00, 0.00, 0.00, 15000.00, 'Note: The above amount is applicable for one month only.', '2026-02-06 16:56:27', NULL, NULL),
(17, 'Zero dust ', 'cleaninguru22@gmail.com', '', 'Shanti Apartment Asudgoan, Sector 4A, Sector 4B, Khanda Colony, Panvel, Navi Mumbai, \r\nMaharashtra 410206', '2026-02-12', NULL, 13000.00, 0.00, 0.00, 13000.00, '', '2026-02-12 13:09:12', NULL, NULL),
(18, 'Rohit Aher', '', '', '', '2026-03-09', NULL, 1520000.00, 0.00, 0.00, 1520000.00, '', '2026-03-09 12:57:51', NULL, NULL),
(19, 'SP Info pvt ltd', 'head.info@spinfo.co.in', '7620030801', 'Office no. 810, 8th Floor,\r\nGLOBAL BUSINESS HUB,\r\nEON Free Zone, Kharadi,\r\nPune, Maharashtra 411014', '2026-04-06', NULL, 65000.00, 0.00, 0.00, 65000.00, '', '2026-04-06 08:42:36', NULL, NULL),
(20, 'SP Info pvt ltd', 'head.info@spinfo.co.in', '', 'Office no. 810, 8th Floor,\r\nGLOBAL BUSINESS HUB,\r\nEON Free Zone, Kharadi,\r\nPune, Maharashtra 411014', '2026-04-06', NULL, 65000.00, 0.00, 0.00, 65000.00, '', '2026-04-06 08:46:21', NULL, NULL),
(21, 'GEOCON Group', 'geoconconsultancy@gmail.com', '+91 8999077545', 'GEOCON Consultancy \r\nBunglow A/21 1st Floor, Rajarshi Shahu Society, Opp. Walwekar Lawns, Bibwewadi, Pune, Maharashtra \r\n411037, India ', '2026-04-11', NULL, 20500.00, 0.00, 0.00, 20500.00, '', '2026-04-11 09:13:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `quotation_items`
--

CREATE TABLE `quotation_items` (
  `id` int(11) NOT NULL,
  `quotation_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `quotation_items`
--

INSERT INTO `quotation_items` (`id`, `quotation_id`, `description`, `quantity`, `unit_price`, `total`) VALUES
(1, 1, 'Website Development', 1.00, 20000.00, 20000.00),
(2, 2, 'Standard Static Website Development\r\nScope:\r\n• 4-5 Pages (Home, About, Services, Contact)\r\n• Mobile & Desktop Responsive\r\n• Contact Form Integration\r\n• Basic SEO Friendly Structure', 1.00, 13000.00, 13000.00),
(3, 2, 'Domain Name Registration (1 Year) - .com / .in / .org (Charged at actuals, est.)', 1.00, 1200.00, 1200.00),
(4, 2, 'Standard Web Hosting (1 Year) - Includes SSL, Email Accounts, and Daily Backups', 1.00, 3500.00, 3500.00),
(7, 5, 'Standard Static Website Development\r\nScope:\r\n• 4-5 Pages (Home, About, Services, Contact)\r\n• Mobile & Desktop Responsive\r\n• Contact Form Integration\r\n• Basic SEO Friendly Structure', 1.00, 10000.00, 10000.00),
(8, 5, 'Domain Name Registration (1 Year) - .com / .in / .org (Charged at actuals, est.)', 1.00, 1000.00, 1000.00),
(9, 5, 'Standard Web Hosting (1 Year) - Includes SSL, Email Accounts, and Daily Backups', 1.00, 2000.00, 2000.00),
(14, 8, 'Domain Name Registration (1 Year) - .com / .in / .org (Charged at actuals, est.)', 1.00, 1000.00, 1000.00),
(15, 8, 'Standard Web Hosting (1 Year) - Includes SSL, Email Accounts, and Daily Backups', 1.00, 3000.00, 3000.00),
(16, 8, 'Standard Static Website Development\r\nScope:\r\n• 4-5 Pages (Home, About, Services, Contact)\r\n• Mobile & Desktop Responsive\r\n• Contact Form Integration\r\n• Basic SEO Friendly Structure', 1.00, 15500.00, 15500.00),
(17, 9, 'Domain Name Registration (1 Year) - .com / .in / .org (Charged at actuals, est.)', 1.00, 1000.00, 1000.00),
(18, 9, 'Standard Web Hosting (1 Year) - Includes SSL, Email Accounts, and Daily Backups', 1.00, 3000.00, 3000.00),
(19, 9, 'Standard Static Website Development\r\nScope:\r\n• 4-5 Pages (Home, About, Services, Contact)\r\n• Mobile & Desktop Responsive\r\n• Contact Form Integration\r\n• Basic SEO Friendly Structure', 1.00, 15500.00, 15500.00),
(20, 9, 'On-Page SEO Optimization\r\n• Keyword Research\r\n• Meta Tags Update\r\n• Site Speed Analysis\r\n• Google Search Console Setup', 1.00, 8000.00, 8000.00),
(21, 10, 'Custom Web Application Development - PHP/MySQL / MERN Stack. Includes Admin Panel, User Management, and Reporting.', 1.00, 18000.00, 18000.00),
(22, 10, 'Standard Web Hosting (1 Year) - Includes SSL, Email Accounts, and Daily Backups', 1.00, 3000.00, 3000.00),
(23, 11, 'Standard Static Website Development\r\nScope:\r\n• 4-5 Pages (Home, About, Services, Contact)\r\n• Mobile & Desktop Responsive\r\n• Contact Form Integration\r\n• Basic SEO Friendly Structure', 1.00, 12000.00, 12000.00),
(24, 11, 'Standard Web Hosting (1 Year) - Includes SSL, Email Accounts, and Daily Backups', 1.00, 3000.00, 3000.00),
(28, 15, 'Daily Creative Social Media Posts\r\n• Custom Design for Instagram\r\n• Branded with Logo\r\n• High-quality static & carousel creatives\r\n• Optimized post dimensions\r\n\r\nSource Files\r\n• Editable source files included\r\n• Files shared via Google Drive\r\n\r\nDaily Stories\r\n• Daily Instagram story creatives\r\n• Engagement stickers (polls, CTAs, Q&A)\r\n• Brand-consistent designs\r\n\r\nProfessional Reel Shoot (4 Reels)\r\n• Shoot with professional camera\r\n• Vertical format for Instagram Reels\r\n• Multiple angles & shots\r\n\r\nProfessional Reel Editing\r\n• High-quality video editing\r\n• Smooth transitions & color correction\r\n• Trending music & text animations\r\n• Brand watermark included\r\n\r\nInstagram Account Handling\r\n• Complete account management\r\n• Content planning & scheduling\r\n• Caption writing & hashtag research\r\n• Posting at optimal timings\r\n\r\nPerformance Monitoring\r\n• Reach & engagement monitoring\r\n• Monthly performance report', 1.00, 15000.00, 15000.00),
(32, 17, 'Standard Static Website Development\r\nScope:\r\n• 4-5 Pages (Home, About, Services, Contact)\r\n• Mobile & Desktop Responsive\r\n• Contact Form Integration\r\n• Basic SEO Friendly Structure', 1.00, 10000.00, 10000.00),
(33, 17, 'Domain Name Registration (1 Year) - .com / .in / .org (Charged at actuals, est.)', 1.00, 1000.00, 1000.00),
(34, 17, 'Standard Web Hosting (1 Year) - Includes SSL, Email Accounts, and Daily Backups', 1.00, 2000.00, 2000.00),
(35, 18, 'UI/UX Design - ₹1,20,000\r\nFrontend Development - ₹3,00,000\r\nBackend Development - ₹4,50,000 \r\nDatabase Architecture - ₹80,000  \r\nWorkflow Automation - ₹1,20,000\r\nReporting System  - ₹1,00,000\r\nEmail Integration  - ₹80,000 \r\nLanding Pages & Forms - ₹1,20,000\r\nAPI Framework  - ₹60,000   \r\nSecurity     - ₹60,000 \r\nTesting      - ₹70,000  \r\nDeployment   - ₹60,000 ', 1.00, 1520000.00, 1520000.00),
(36, 19, 'Pricing Breakdown\r\nComponent	                 Cost (INR)\r\nFrontend Development	   ₹15,000\r\nBackend Development	   ₹18,000\r\nAdmin Panel	                   ₹9,000\r\nUser Management	           ₹7,000\r\nReporting	                   ₹6,000\r\nBasic SEO	                   ₹5,000\r\nHosting & Deployment	   ₹5,000', 1.00, 65000.00, 65000.00),
(37, 20, 'Pricing Breakdown: \r\n\r\nFrontend Development - ₹15,000\r\nBackend Development  - ₹18,000\r\nAdmin Panel - ₹9,000\r\nUser Management - ₹7,000\r\nReporting - ₹6,000\r\nBasic SEO - ₹5,000\r\nHosting & Deployment - ₹5,000', 1.00, 65000.00, 65000.00),
(38, 21, 'Custom Web Application Development - PHP/MySQL / MERN Stack. Includes Admin Panel, User Management, and Reporting.', 1.00, 12500.00, 12500.00),
(39, 21, 'Standard Web Hosting (1 Year) - Includes SSL, Email Accounts, and Daily Backups', 1.00, 8000.00, 8000.00);

-- --------------------------------------------------------

--
-- Table structure for table `rd_files`
--

CREATE TABLE `rd_files` (
  `id` int(11) NOT NULL,
  `folder_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `link_url` text DEFAULT NULL,
  `file_type` enum('gsheet','gdoc','gslide','gdrive','pdf','other') DEFAULT 'other',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rd_files`
--

INSERT INTO `rd_files` (`id`, `folder_id`, `name`, `link_url`, `file_type`, `created_at`) VALUES
(5, 12, 'R&D', 'https://drive.google.com/drive/folders/1f0Rjqv5KDfMPyiP7Ce0rjE1BV_NBJJn3?usp=drive_link', 'gdrive', '2026-02-12 15:14:29');

-- --------------------------------------------------------

--
-- Table structure for table `rd_folders`
--

CREATE TABLE `rd_folders` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `department` varchar(100) DEFAULT 'General',
  `password_hash` varchar(255) DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `rd_folders`
--

INSERT INTO `rd_folders` (`id`, `name`, `department`, `password_hash`, `is_locked`, `created_at`) VALUES
(9, 'Dev', 'Web Development', '$2y$10$TDJ4Aaui0trMaVFeWESrx.s8IAyxfMImnrYSnD2dQtEFTuoQAQ1pO', 1, '2026-01-30 06:30:13'),
(12, 'R&D', 'General', '$2y$10$LlduVK0o9c6vLIfSj3jAdu3/iJECGExSVDmTkGOLORZ5LrTfJjVcm', 1, '2026-02-12 15:04:16');

-- --------------------------------------------------------

--
-- Table structure for table `recurring_invoices`
--

CREATE TABLE `recurring_invoices` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `frequency` enum('monthly','quarterly','yearly') NOT NULL,
  `next_due_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','paused') DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_leads`
--

CREATE TABLE `sales_leads` (
  `id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `founder_name` varchar(150) DEFAULT NULL,
  `contact_number` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `business_type` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `gst_number` varchar(50) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `status` enum('New','Contacted','Proposal Sent','Negotiation','Converted','Lost') DEFAULT 'New',
  `notes` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `title`, `description`, `price`) VALUES
(1, 'Static Website Package (Social/Leader)', 'Website Development & Customization\nScope:\n• Upto 7-8 pages (About, Social Work, Gallery, Videos, Contact, etc.)\n• Mobile, tablet & desktop responsive design\n• Photo gallery & Video section\n• Contact form & Social media links\n• Basic SEO setup\n• Includes Testing & Quality Check', 28000.00),
(2, 'Domain Registration', 'Domain Name Registration (1 Year) - .com / .in / .org (Charged at actuals, est.)', 1200.00),
(3, 'Web Hosting (Standard)', 'Standard Web Hosting (1 Year) - Includes SSL, Email Accounts, and Daily Backups', 3500.00),
(4, 'Monthly Maintenance', 'Monthly Website Maintenance - Includes content updates, contact form monitoring, and backups.', 3000.00),
(5, 'Dynamic Web Application', 'Custom Web Application Development - PHP/MySQL / MERN Stack. Includes Admin Panel, User Management, and Reporting.', 50000.00),
(6, 'E-Commerce Website', 'Full E-Commerce Setup - Product Management, Payment Gateway Integration, Cart, Checkout, and Order Management.', 45000.00),
(7, 'Static Website Development (Basic)', 'Standard Static Website Development\nScope:\n• 4-5 Pages (Home, About, Services, Contact)\n• Mobile & Desktop Responsive\n• Contact Form Integration\n• Basic SEO Friendly Structure', 13000.00),
(8, 'Yearly Website Maintenance (AMC)', 'Annual Maintenance Contract (1 Year)\n• Monthly Backup\n• Content Updates (Text/Photos)\n• Security Monitoring\n• Priority Support', 15000.00),
(9, 'Logo Design Package', 'Professional Logo Design\n• 3 Unique Concepts\n• High Resolution Files (PNG, JPG, PDF, SVG)\n• Source File included', 3500.00),
(10, 'Social Media Graphics Pack', '10 Creative Social Media Posts\n• Custom Design for FB/Insta\n• Branded with Logo\n• Source Files included', 5000.00),
(11, 'SEO Audit & Optimization', 'On-Page SEO Optimization\n• Keyword Research\n• Meta Tags Update\n• Site Speed Analysis\n• Google Search Console Setup', 8000.00),
(12, 'Content Writing Services', 'Professional Website Content Writing\n• Per Page (approx 500 words)\n• SEO Friendly\n• Plagiarism Free', 800.00),
(13, 'Google Business Profile Setup', 'GMB Setup & Verification\n• Profile Optimization\n• Adding Photos & Services\n• Location Verification Support', 2500.00),
(14, 'Payment Gateway Integration', 'Integration of Payment Gateway (Razorpay/PhonePe)\n• Account Setup Assistance\n• Testing & Live Mode Activation', 3000.00),
(15, 'Professional Email Setup', 'Business Email Setup (Google Workspace / Zoho)\n• DNS Configuration (MX/SPF/DKIM)\n• Account Creation (per domain)', 1500.00),
(16, 'Website Speed Optimization', 'Performance Optimization\n• Image Compression\n• Caching Setup\n• Core Web Vitals Improvement', 4000.00),
(17, 'Malware Removal & Security', 'Hacked Site Recovery\n• Malware Cleaning\n• Security Firewall Installation\n• Vulnerability Patching', 5000.00),
(18, 'Facebook/Instagram Ad Setup', 'Ad Campaign Setup\n• Audience Targeting\n• Creative Design (1 Ad)\n• Pixel Installation', 3000.00),
(19, 'UI/UX Design Service', 'Custom UI/UX Design (Figma)\n• Homepage + 2 Inner Pages\n• Modern Layout\n• Interactive Prototype', 10000.00);

-- --------------------------------------------------------

--
-- Table structure for table `social_accounts`
--

CREATE TABLE `social_accounts` (
  `id` int(11) NOT NULL,
  `platform_name` varchar(100) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password_enc` varchar(555) DEFAULT NULL,
  `profile_url` varchar(555) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `assigned_manager` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `access_token` text DEFAULT NULL,
  `refresh_token` text DEFAULT NULL,
  `token_expiry` datetime DEFAULT NULL,
  `platform_id` varchar(255) DEFAULT NULL,
  `account_status` enum('active','expired','error') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `social_accounts`
--

INSERT INTO `social_accounts` (`id`, `platform_name`, `username`, `password_enc`, `profile_url`, `client_id`, `assigned_manager`, `notes`, `created_at`, `access_token`, `refresh_token`, `token_expiry`, `platform_id`, `account_status`) VALUES
(4, 'Other', 'webworkssstudio', 'webworks12@#', 'https://www.threads.com/@webworkssstudio', NULL, 'Hritik Shingare', '', '2026-01-05 07:05:32', NULL, NULL, NULL, NULL, 'active'),
(5, 'Gmail / Google', 'cleaninguru22@gmail.com', 'Sunoj@0722', '', NULL, 'Hritik Shingare', '', '2026-01-05 07:09:18', NULL, NULL, NULL, NULL, 'active'),
(6, 'Gmail / Google', 'founder.webworksstudio@gmail.com', 'Webworks12@#', '', NULL, 'Hritik Shingare', '', '2026-01-05 11:39:49', NULL, NULL, NULL, NULL, 'active'),
(7, 'Instagram', 'webworkssstudio', 'Webworks12@#', 'https://www.instagram.com/webworkssstudio?utm_source=ig_web_button_share_sheet&igsh=ZDNlZDc0MzIxNw==', NULL, 'Hritik Shingare', '', '2026-01-06 05:46:06', NULL, NULL, NULL, NULL, 'active'),
(8, 'LinkedIn', 'kashinathgaikwad305@gmail.com', 'Webworks12@#', 'https://www.linkedin.com/in/hackwithim/', NULL, 'Hritik Shingare', '', '2026-01-06 09:35:15', NULL, NULL, NULL, NULL, 'active'),
(9, 'Twitter / X', '@frameworksbywws', 'framework@123', 'https://x.com/frameworksbywws', NULL, 'Hritik Shingare', '', '2026-01-21 07:09:30', NULL, NULL, NULL, NULL, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `social_posts`
--

CREATE TABLE `social_posts` (
  `id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `media_url` varchar(255) DEFAULT NULL,
  `platforms` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `scheduled_time` datetime DEFAULT NULL,
  `status` enum('draft','scheduled','published','failed') DEFAULT 'draft',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ;

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `setting_key` varchar(50) NOT NULL,
  `setting_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`setting_key`, `setting_value`) VALUES
('company_email', 'info@webworksstudio.site'),
('company_name', 'Webworks Studios'),
('currency_symbol', '₹'),
('tax_rate', '18');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `assigned_to` int(11) NOT NULL,
  `assigned_by` int(11) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `priority` enum('Low','Medium','High','Urgent') DEFAULT 'Medium',
  `status` enum('Pending','In Progress','Completed','On Hold') DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `assigned_to`, `assigned_by`, `due_date`, `priority`, `status`, `created_at`) VALUES
(5, 'Wordpress Website', 'Truffs & Nuts - Website \r\nCredentials :\r\nLink: https://dimgrey-zebra-908769-hostingersite-com-928794.hostingersite.com/wp-login.php?redirect_to=https%3A%2F%2Fdimgrey-zebra-908769-hostingersite-com-928794.hostingersite.com%2Fwp-admin%2F&reauth=1\r\n\r\nUsername : Sai\r\nPassword: Sai12@#', 10, 1, '2026-01-08', 'High', 'Completed', '2026-01-05 06:08:59'),
(6, 'ERP SYSTEM', 'College ERP', 5, 1, '2026-01-20', 'Medium', 'Completed', '2026-01-05 06:14:57'),
(7, 'Wordpress Website', 'A WordPress website is built using WordPress, the world’s most widely used Content Management System (CMS). It enables individuals and businesses to create fully customizable, responsive, and SEO-friendly websites without complex coding.', 19, 1, '2026-01-10', 'High', 'Completed', '2026-01-05 06:32:57'),
(8, 'Cleaning Guru meta ad', 'Cleaning Guru delivers expert home and office cleaning with trained professionals, eco-friendly products, and guaranteed satisfaction.\r\nSchedule your cleaning in minutes and let us handle the rest.', 6, 1, '2026-01-10', 'Medium', 'Pending', '2026-01-05 06:40:32'),
(9, 'Web Development', 'Design and develop modern, responsive, and high-performance websites that help businesses build credibility, attract customers, and grow online.', 8, 1, '2026-01-10', 'Medium', 'Completed', '2026-01-05 06:50:08'),
(10, 'Web Development', 'Design and develop modern, responsive, and high-performance websites that help businesses build credibility, attract customers, and grow online.', 17, 1, '2026-01-10', 'Medium', 'Completed', '2026-01-05 06:50:52'),
(11, 'Web Development', 'Design and develop modern, responsive, and high-performance websites that help businesses build credibility, attract customers, and grow online.', 20, 1, '2026-01-10', 'Medium', 'Completed', '2026-01-05 06:55:31'),
(12, 'Web Development', 'Design and develop modern, responsive, and high-performance websites that help businesses build credibility, attract customers, and grow online.', 13, 1, '2026-01-10', 'Medium', 'Completed', '2026-01-05 06:56:00'),
(13, 'Web Development', 'Design and develop modern, responsive, and high-performance websites that help businesses build credibility, attract customers, and grow online.', 9, 1, '2026-01-10', 'Medium', 'Completed', '2026-01-05 06:57:06'),
(14, 'Web Development', 'Design and develop modern, responsive, and high-performance websites that help businesses build credibility, attract customers, and grow online.', 22, 1, '2026-01-10', 'Medium', 'Completed', '2026-01-05 06:58:06'),
(15, 'Web Development', 'Design and develop modern, responsive, and high-performance websites that help businesses build credibility, attract customers, and grow online.', 14, 1, '2026-01-10', 'Medium', 'Completed', '2026-01-05 06:59:18'),
(16, 'Web Development', 'Design and develop modern, responsive, and high-performance websites that help businesses build credibility, attract customers, and grow online.', 21, 1, '2026-01-10', 'Medium', 'Completed', '2026-01-05 07:00:02'),
(17, 'Web Development', 'Design and develop modern, responsive, and high-performance websites that help businesses build credibility, attract customers, and grow online.', 7, 1, '2026-01-10', 'Medium', 'Pending', '2026-01-05 07:00:36'),
(18, 'Web Development', 'Design and develop modern, responsive, and high-performance websites that help businesses build credibility, attract customers, and grow online.', 16, 1, '2026-01-10', 'Medium', 'Completed', '2026-01-05 07:01:42'),
(19, 'WEb Development', 'Design and develop modern, responsive, and high-performance websites that help businesses build credibility, attract customers, and grow online.', 12, 1, '2026-01-10', 'Medium', 'Completed', '2026-01-05 07:02:23'),
(20, 'Web Development', 'Design and develop modern, responsive, and high-performance websites that help businesses build credibility, attract customers, and grow online.', 18, 1, '2026-01-10', 'Medium', 'Completed', '2026-01-05 07:03:08'),
(21, 'Web Development', 'Design and develop modern, responsive, and high-performance websites that help businesses build credibility, attract customers, and grow online.', 15, 1, '2026-01-10', 'Medium', 'Completed', '2026-01-05 07:04:15'),
(22, 'Web Development', 'Design and develop modern, responsive, and high-performance websites that help businesses build credibility, attract customers, and grow online.', 11, 1, '2026-01-10', 'Medium', 'Completed', '2026-01-05 07:05:13'),
(23, 'Web Development', 'Create a clean and attractive design by choosing colors, fonts, images, and layout that match the website’s purpose.', 9, 1, '2026-01-07', 'Medium', 'Completed', '2026-01-06 06:50:38'),
(24, 'Web Development', 'Create a clean and attractive design by choosing colors, fonts, images, and layout that match the website’s purpose.', 8, 1, '2026-01-07', 'Medium', 'Completed', '2026-01-06 06:51:12'),
(25, 'Web Development', 'Create a clean and attractive design by choosing colors, fonts, images, and layout that match the website’s purpose.', 15, 1, '2026-01-07', 'Medium', 'Completed', '2026-01-06 06:51:47'),
(26, 'Web Development', 'Create a clean and attractive design by choosing colors, fonts, images, and layout that match the website’s purpose.', 24, 1, '2026-01-07', 'Medium', 'Completed', '2026-01-06 06:52:17'),
(27, 'Web Development', 'Create a clean and attractive design by choosing colors, fonts, images, and layout that match the website’s purpose.', 23, 1, '2026-01-07', 'Medium', 'Completed', '2026-01-06 06:52:51'),
(28, 'Web Development', 'Create a clean and attractive design by choosing colors, fonts, images, and layout that match the website’s purpose.', 14, 1, '2026-01-07', 'Medium', 'Completed', '2026-01-06 06:53:23'),
(29, 'Web Development', 'Create a clean and attractive design by choosing colors, fonts, images, and layout that match the website’s purpose.', 7, 1, '2026-01-07', 'Medium', 'Pending', '2026-01-06 06:53:51'),
(30, 'On-Page SEO Analysis', 'This task involves reviewing and optimizing individual web pages to improve search engine rankings. It includes checking titles, meta descriptions, headings, URL structure, content quality, keyword usage, internal links, and images.', 19, 1, '2026-01-07', 'Medium', 'Pending', '2026-01-06 06:57:33'),
(31, 'On-Page SEO Analysis', 'This task involves reviewing and optimizing individual web pages to improve search engine rankings. It includes checking titles, meta descriptions, headings, URL structure, content quality, keyword usage, internal links, and images.', 20, 1, '2026-01-07', 'Medium', 'Completed', '2026-01-06 06:58:05'),
(32, 'On-Page SEO Analysis', 'This task involves reviewing and optimizing individual web pages to improve search engine rankings. It includes checking titles, meta descriptions, headings, URL structure, content quality, keyword usage, internal links, and images.', 13, 1, '2026-01-07', 'Medium', 'Pending', '2026-01-06 06:58:30'),
(33, 'On-Page SEO Analysis', 'This task involves reviewing and optimizing individual web pages to improve search engine rankings. It includes checking titles, meta descriptions, headings, URL structure, content quality, keyword usage, internal links, and images.', 17, 1, '2026-01-07', 'Medium', 'Completed', '2026-01-06 06:59:40'),
(34, 'On-Page SEO Analysis', 'This task involves reviewing and optimizing individual web pages to improve search engine rankings. It includes checking titles, meta descriptions, headings, URL structure, content quality, keyword usage, internal links, and images.', 22, 1, '2026-01-07', 'Medium', 'Completed', '2026-01-06 07:00:05'),
(35, 'On-Page SEO Analysis', 'This task involves reviewing and optimizing individual web pages to improve search engine rankings. It includes checking titles, meta descriptions, headings, URL structure, content quality, keyword usage, internal links, and images.', 21, 1, '2026-01-07', 'Medium', 'Completed', '2026-01-06 07:00:43'),
(37, 'On-Page SEO Analysis', 'This task involves reviewing and optimizing individual web pages to improve search engine rankings. It includes checking titles, meta descriptions, headings, URL structure, content quality, keyword usage, internal links, and images.', 10, 1, '2026-01-07', 'Medium', 'Completed', '2026-01-06 07:01:46'),
(38, 'On-Page SEO Analysis', 'This task involves reviewing and optimizing individual web pages to improve search engine rankings. It includes checking titles, meta descriptions, headings, URL structure, content quality, keyword usage, internal links, and images.', 16, 1, '2026-01-07', 'Medium', 'Completed', '2026-01-06 07:02:20'),
(39, 'On-Page SEO Analysis', 'This task involves reviewing and optimizing individual web pages to improve search engine rankings. It includes checking titles, meta descriptions, headings, URL structure, content quality, keyword usage, internal links, and images.', 18, 1, '2026-01-07', 'Medium', 'Completed', '2026-01-06 07:03:17'),
(40, 'On-Page SEO Analysis', 'This task involves reviewing and optimizing individual web pages to improve search engine rankings. It includes checking titles, meta descriptions, headings, URL structure, content quality, keyword usage, internal links, and images.', 12, 1, '2026-01-07', 'Medium', 'Completed', '2026-01-06 07:04:24'),
(42, 'On-Page SEO Analysis', 'This task involves reviewing and optimizing individual web pages to improve search engine rankings. It includes checking titles, meta descriptions, headings, URL structure, content quality, keyword usage, internal links, and images.', 11, 1, '2026-01-07', 'Medium', 'Completed', '2026-01-06 07:06:14'),
(43, 'On-Page SEO Analysis', 'This task involves reviewing and optimizing individual web pages to improve search engine rankings. It includes checking titles, meta descriptions, headings, URL structure, content quality, keyword usage, internal links, and images.', 6, 1, '2026-01-07', 'Medium', 'Pending', '2026-01-06 07:08:14'),
(44, 'WordPress Dashboard Exploration', 'Log in to WordPress dashboard and explore:\r\nPosts\r\nPages\r\nThemes\r\n\r\nPlugins', 19, 1, '2026-01-08', 'Medium', 'Pending', '2026-01-07 10:08:38'),
(45, 'WordPress Dashboard Exploration', 'Log in to WordPress dashboard and explore:\r\nPosts\r\nPages\r\nThemes', 6, 1, '2026-01-08', 'Medium', 'Pending', '2026-01-07 10:09:09'),
(46, 'WordPress Dashboard Exploration', 'Log in to WordPress dashboard and explore:\r\nPosts\r\nPages\r\nThemes', 20, 1, '2026-01-08', 'Medium', 'Completed', '2026-01-07 10:09:37'),
(48, 'WordPress Dashboard Exploration', 'Log in to WordPress dashboard and explore:\r\nPosts\r\nPages\r\nThemes', 13, 1, '2026-01-08', 'Medium', 'Pending', '2026-01-07 10:10:22'),
(49, 'WordPress Dashboard Exploration', 'Log in to WordPress dashboard and explore:\r\nPosts\r\nPages\r\nThemes', 17, 1, '2026-01-08', 'Medium', 'Completed', '2026-01-07 10:10:48'),
(50, 'WordPress Dashboard Exploration', 'Log in to WordPress dashboard and explore:\r\nPosts\r\nPages\r\nThemes', 9, 1, '2026-01-08', 'Medium', 'Pending', '2026-01-07 10:11:14'),
(51, 'Install and Use Rank Math SEO Plugin', 'Install Rank Math plugin in WordPress. Use it to:\r\nSet focus keyword\r\nAdd SEO title and meta description', 22, 1, '2026-01-08', 'Medium', 'Completed', '2026-01-07 10:12:42'),
(53, 'Install and Use Rank Math SEO Plugin', 'Install Rank Math plugin in WordPress. Use it to:\r\nSet focus keyword\r\nAdd SEO title and meta description', 8, 1, '2026-01-08', 'Medium', 'Completed', '2026-01-07 10:13:23'),
(54, 'R&D', 'Research about ads', 15, 1, '2026-01-08', 'Medium', 'Completed', '2026-01-07 10:14:23'),
(55, 'Install and Use Rank Math SEO Plugin', 'Install Rank Math plugin in WordPress. Use it to:\r\nSet focus keyword\r\nAdd SEO title and meta description', 14, 1, '2026-01-08', 'Medium', 'Pending', '2026-01-07 10:14:52'),
(56, 'Install and Use Rank Math SEO Plugin', 'Install Rank Math plugin in WordPress. Use it to:\r\nSet focus keyword\r\nAdd SEO title and meta description', 11, 1, '2026-01-08', 'Medium', 'Completed', '2026-01-07 10:15:19'),
(57, 'Install and Use Rank Math SEO Plugin', 'Install Rank Math plugin in WordPress. Use it to:\r\nSet focus keyword\r\nAdd SEO title and meta description', 21, 1, '2026-01-08', 'Medium', 'Completed', '2026-01-07 10:15:56'),
(58, 'Install and Use Rank Math SEO Plugin', 'Install Rank Math plugin in WordPress. Use it to:\r\nSet focus keyword\r\nAdd SEO title and meta description', 25, 1, '2026-01-08', 'Medium', 'Completed', '2026-01-07 10:16:29'),
(59, 'Install and Use Rank Math SEO Plugin', 'Install Rank Math plugin in WordPress. Use it to:\r\nSet focus keyword\r\nAdd SEO title and meta description', 10, 1, '2026-01-08', 'Medium', 'Completed', '2026-01-07 10:17:00'),
(60, 'Ad Creative Analysis', 'Find 5 Facebook or Instagram ads and analyze:\r\nAd format (image/video/carousel)\r\nHeadline\r\nDescription', 7, 1, '2026-01-08', 'Medium', 'Completed', '2026-01-07 10:19:39'),
(61, 'Ad Creative Analysis', 'Find 5 Facebook or Instagram ads and analyze:\r\nAd format (image/video/carousel)\r\nHeadline\r\nDescription', 12, 1, '2026-01-08', 'Medium', 'Completed', '2026-01-07 10:20:20'),
(62, 'Ad Creative Analysis', 'Find 5 Facebook or Instagram ads and analyze:\r\nAd format (image/video/carousel)\r\nHeadline\r\nDescription', 18, 1, '2026-01-08', 'Medium', 'Completed', '2026-01-07 10:20:49'),
(63, 'Ad Creative Analysis', 'Find 5 Facebook or Instagram ads and analyze:\r\nAd format (image/video/carousel)\r\nHeadline\r\nDescription', 24, 1, '2026-01-08', 'Medium', 'Completed', '2026-01-07 10:21:32'),
(64, 'R & D', 'Topic:Cyber Security', 16, 1, '2026-01-08', 'Medium', 'Completed', '2026-01-07 10:23:03'),
(65, 'R & D', 'Research About Marketing', 23, 1, '2026-01-08', 'Medium', 'Completed', '2026-01-07 10:24:43');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT 'viewer',
  `college_name` varchar(100) DEFAULT NULL,
  `permissions` text DEFAULT NULL,
  `avatar_url` varchar(255) DEFAULT 'assets/img/default_avatar.png',
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password_hash`, `role`, `college_name`, `permissions`, `avatar_url`, `is_active`, `created_at`) VALUES
(1, 'admin', 'admin@webworks.com', '$2y$10$lbiyq4YahJ7APDupggBXNuBXGxh7tny02/iiRlLhZ5CbRg8UiZmOW', 'admin', '', '[]', 'assets/img/default_avatar.png', 1, '2025-12-26 05:13:32'),
(7, 'Shriniwas', 'shrimashale@gmail.com', '$2y$10$ybRF0oHIzHayMVyJfFDVCOydOBG7R.FEuX7YqO5jNiBgo29MJAoAm', 'employee', '', '[\"projects\",\"attendance\"]', 'assets/img/default_avatar.png', 1, '2026-01-05 05:44:45'),
(8, 'Aayush', 'tongaleaayush@gmail.com', '$2y$10$ud6znSiBZJzcnnI6R3DaYem.mZEp89j3FmTScXgEFB43p.n2C7Klm', 'employee', '', '[\"billing\",\"projects\"]', 'assets/img/default_avatar.png', 1, '2026-01-05 05:49:45'),
(9, 'Shreya', 'shreyamote96@gmail.com', '$2y$10$76DNVbe4Nldre24Obx19cOJabGEMI6RX9JZiWgMUp6oSujSEdh7nO', 'employee', NULL, NULL, 'assets/img/default_avatar.png', 1, '2026-01-05 05:55:36'),
(10, 'Atharv', 'atharvfarakate@gmail.com', '$2y$10$WzAHHT3uFGm0HdfuNG/FmOCeLKylfM0M9gVyDJCFnGDDg/huZpFu2', 'employee', NULL, NULL, 'assets/img/default_avatar.png', 1, '2026-01-05 05:59:55'),
(11, 'Sairaj', 'sairajdeshmukh51@gmail.com', '$2y$10$5wp.NgB2Q7Latc7u.4QWKuzWoXpAmBsqYCwm/dTHTui0Y8OMAZx6q', 'employee', NULL, NULL, 'assets/img/default_avatar.png', 1, '2026-01-05 06:02:13'),
(12, 'Hritik', 'hruthikshingare1@gmail.com', '$2y$10$dC8VKJqMZNuRO/mvaoKYNeIaUNovm2FEzZBgIy6wInJGNvsf5J0re', 'employee', '', '[\"hr\",\"social\"]', 'assets/img/default_avatar.png', 1, '2026-01-05 06:04:38'),
(13, 'Siddhesh', 'siduborde1234@gmail.com', '$2y$10$1El1hfBPIv1kUS1RVykpJu/tXdk2DahEXMZzBXBFh4RApu70TYpim', 'manager', '', '[\"billing\",\"clients\",\"projects\"]', 'assets/img/default_avatar.png', 1, '2026-01-05 06:04:56'),
(14, 'Amisha', 'amishaaa44@gmail.com', '$2y$10$KAKm9A7hX0sWY0frFii49u42pBQP/cYVa0cFl8g6uQFoATuplxg32', 'employee', NULL, NULL, 'assets/img/default_avatar.png', 1, '2026-01-05 06:05:10'),
(15, 'Disha', 'gdisha79359@gmail.com', '$2y$10$/FSEc8U8H2jM3TjD9/98tePZgLLrQ.lbmlbplwvK.3Fgel9mtNLoy', 'employee', '', '[\"hr\",\"attendance\",\"finance\",\"legal\",\"tasks\"]', 'assets/img/default_avatar.png', 1, '2026-01-05 06:06:55'),
(16, 'Hrishikesh', 'hrishigaware63@gmail.com', '$2y$10$yHQRDs4tT7pMD3CkzOMq5.TxxHYUPpd6ODq9vz8UPJHooCcElV0T2', 'employee', NULL, NULL, 'assets/img/default_avatar.png', 1, '2026-01-05 06:07:04'),
(17, 'Shruti', 'patilshrutii2005@gmail.com', '$2y$10$Evv3tCIssF1BXHNct4aiLOjBlKkGcRyrv.8aInCHcrEjLzPeMvHX6', 'employee', NULL, NULL, 'assets/img/default_avatar.png', 1, '2026-01-05 06:07:16'),
(18, 'Ashtvinayak', 'lingayatashtvinayak11@gmail.com', '$2y$10$gTrrqsTFkVbvvWvhIKBXoOMaT7xVtJZgT9PuQ/npTn/usZU7ApKo2', 'employee', NULL, NULL, 'assets/img/default_avatar.png', 1, '2026-01-05 06:07:32'),
(19, 'Sujwal', 'sujwalpotdar5571@gmail.com', '$2y$10$9vvX5BZXrfZ49M9uOm9xBue6zF5VUl9eCaMpxB9FRuPMMXCKh/bw6', 'employee', NULL, NULL, 'assets/img/default_avatar.png', 1, '2026-01-05 06:10:59'),
(20, 'Aarti', 'aartiitp2006@gmail.com', '$2y$10$hyFNz/qLtssyQZUVL04Jj.mRXy2z1bUZeCdN6HVT9Megfwqhxj94y', 'employee', NULL, NULL, 'assets/img/default_avatar.png', 1, '2026-01-05 06:13:54'),
(21, 'Aditi', 'aditikulkarni910@gmail.com', '$2y$10$QqGCzTRGhhYGwM1rUwf8MOxb5dzqQI5uoMCpgzpHTscXbveKi4t3m', 'employee', NULL, NULL, 'assets/img/default_avatar.png', 1, '2026-01-05 06:14:05'),
(22, 'Deepak', 'dkjha4770@gmail.com', '$2y$10$VN.NFyll5f0nZ0PZFyZCbOC7ysgJiEkaG2n7QAGDw8ZtZsxqinkI2', 'employee', NULL, NULL, 'assets/img/default_avatar.png', 1, '2026-01-05 06:15:50'),
(23, 'Manali', 'manaliwangwad09@gmail.com', '$2y$10$fZCwu2M2mtG.0gMb3vmYLOUgdfOBqVvBkYvjIvgdW0vnDUn1DdYeG', 'employee', NULL, NULL, 'assets/img/default_avatar.png', 1, '2026-01-05 06:17:36'),
(24, 'Chaitanya', 'chaitanyashelar125@gmail.com', '$2y$10$9MbGAqQ4hZUIkP0PDgoHYe1yGzS.RQSXOcbq7/2HHbIh59BA/sYSe', 'employee', NULL, NULL, 'assets/img/default_avatar.png', 1, '2026-01-05 06:42:48'),
(25, 'Sai', 'saeekashid106@gmail.com', '$2y$10$2OALed41wiOhj9TUVKnLTuPswyTO94cVFZDrss0AWkucF8KNnfDoG', 'employee', '', '[\"billing\",\"clients\",\"finance\",\"research\"]', 'assets/img/default_avatar.png', 1, '2026-01-06 06:29:27'),
(26, 'Vaibhav', 'Panhalevaibhav9@gmail.com', '$2y$10$RUKiZyaXllPe3zdRBufB6ukrOgVpXXvf7u5YYdktykCMkxxn0DKPa', 'employee', NULL, NULL, 'assets/img/default_avatar.png', 1, '2026-01-06 06:42:27'),
(27, 'Ashwini', 'ashwini.golande@zealeducation.com', '$2y$10$FrOm58JxC0v9CnJdtNqt4ekqOyM4lj3yWGp3L7WvZ2RuyiQNm0lpO', 'college_staff', 'ZCOER', '[]', 'assets/img/default_avatar.png', 1, '2026-01-06 09:04:54'),
(28, 'Pawan', 'saindanepavan4@gmail.com', '$2y$10$9VCZTJGu8q32yhPp99QwOuNVgAyrrycRX1cZYhdd/W8sXRGpYTlWK', 'employee', NULL, NULL, 'assets/img/default_avatar.png', 1, '2026-01-06 09:08:13'),
(30, 'Sharayu', 'sharayubhartiya@gmail.com', '$2y$10$3BYjfrgnwMZ490IQL28r1uxVSF0pTkpCyGeOGoeoKGLM0yePyqV.a', 'employee', '', '[\"hr\",\"attendance\",\"legal\",\"tasks\",\"certificates\"]', 'assets/img/default_avatar.png', 1, '2026-01-19 21:34:47'),
(31, 'Shravan', 'shravan45x@gmail.com', '$2y$10$DB.2/mkkBil8kkvphgHo3.Ynpnadlr/RATa72QrHlwmsu6h9VaEN.', 'employee', NULL, NULL, 'assets/img/default_avatar.png', 1, '2026-03-31 07:50:11');

-- --------------------------------------------------------

--
-- Table structure for table `user_activity`
--

CREATE TABLE `user_activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(128) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `location_data` text DEFAULT NULL,
  `login_time` datetime DEFAULT current_timestamp(),
  `last_activity` datetime DEFAULT current_timestamp(),
  `device_info` varchar(255) DEFAULT NULL,
  `status` enum('active','logged_out','timeout') DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `user_activity`
--

INSERT INTO `user_activity` (`id`, `user_id`, `session_id`, `ip_address`, `location_data`, `login_time`, `last_activity`, `device_info`, `status`) VALUES
(1, 1, '9gpkop8q12f31eimd7c03doieh', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2025-12-26 10:43:37', '2025-12-26 12:30:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(2, 1, '16utn8m62b6sh5u7kshs7bq94g', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2025-12-26 16:43:34', '2025-12-26 16:48:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(3, 1, '519kdl6n3s34q7gub8cg17plmv', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2025-12-26 20:47:24', '2025-12-26 23:00:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(4, 1, 'ofghg8hfvdtpdnbmdetkbund3m', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2025-12-27 10:32:19', '2025-12-27 11:19:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(5, 1, 'aq930il3u5862l1bllsahu495v', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-03 15:56:14', '2026-01-03 17:44:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(6, 1, '14088vep1523fmalp9vqde50rn', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-03 16:08:31', '2026-01-03 17:46:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(8, 1, '42h9j7d1j8b92bo0j7nufeq3h9', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-03 17:49:58', '2026-01-03 18:27:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(9, 1, '1cfbn6l0vcs1f2hcokj16pculm', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-03 18:31:47', '2026-01-03 23:38:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(10, 1, 'lcah3qni4ndatl72j6rdr2pkao', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-04 10:29:41', '2026-01-04 10:29:41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(11, 1, 'es2rr4m5io0kjuoq1mtuta6nbr', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-04 10:30:25', '2026-01-04 10:33:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(13, 1, '2ldd3uuru1akn61t8gfgvo578v', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-04 10:39:05', '2026-01-04 10:40:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(16, 1, 'e5j52tp0htlhcp6cfskl5n8tcf', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-04 10:48:21', '2026-01-04 10:48:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(18, 1, '9oc0nokqhpum0asgi70pdgce52', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-04 10:53:18', '2026-01-04 10:55:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(20, 1, '7caoq9m9ob8jffng0m95f1e3jc', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-04 11:01:12', '2026-01-04 11:02:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(21, 1, 'l9c3h6buavf8bld9m0v3gbat0c', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-04 16:20:10', '2026-01-04 16:25:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(23, 1, 'dkovf1ltnrmufqjvmitdmh300o', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-04 16:25:39', '2026-01-04 16:25:39', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(25, 1, 'ca13mjhjl2isvj805btmj0pl22', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-04 16:33:11', '2026-01-04 16:50:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(27, 1, 'qn6o9k808u7cgl0cfunctat270', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-04 16:51:14', '2026-01-04 16:51:19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(28, 1, 'g9s00b30ncr3pt1s7b1c7a31nj', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"API Error\\\"}', '2026-01-04 21:46:19', '2026-01-04 21:51:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(30, 1, '53oi3htlp18tmqqbfpj8jgrs21', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-04 21:52:06', '2026-01-04 21:52:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(32, 1, 'qv38p1mqr0kf59f3bn5khpvg1b', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-04 21:58:16', '2026-01-04 21:59:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(34, 1, 'ocm8du8eimn086lvt5e1svdsnp', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-04 22:03:17', '2026-01-04 22:14:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(37, 1, 'o8l2g4otadjbv5nrlsg8nh5s4f', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-05 09:40:13', '2026-01-05 09:46:40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(38, 1, 'ctstg5ei4tmt57npt5fa59skef', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-05 10:53:56', '2026-01-05 11:05:37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(39, 1, '1u4107d06vetgsck5at3vo5si5', '2409:40c2:314a:ed2d:949b:a861:3881:16db', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411005\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:314a:ed2d:949b:a861:3881:16db\\\"}', '2026-01-05 05:42:28', '2026-01-05 07:24:57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(40, 7, '25nl3jqepirmffic0tb45e65mc', '2409:40c2:314a:ed2d:8800:4d5e:a566:3394', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411005\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:314a:ed2d:8800:4d5e:a566:3394\\\"}', '2026-01-05 05:46:18', '2026-01-05 05:46:41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(41, 7, '7tdc0ietph1e3mhhphjoeqasa9', '2409:40c2:314a:ed2d:8800:4d5e:a566:3394', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411005\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:314a:ed2d:8800:4d5e:a566:3394\\\"}', '2026-01-05 05:47:20', '2026-01-05 05:56:07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(42, 8, 'bg0e03bqg8njln9e3fbn09coun', '2409:40c2:35:a1d1:4916:290:202e:590d', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:35:a1d1:4916:290:202e:590d\\\"}', '2026-01-05 05:49:52', '2026-01-05 05:50:43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(43, 8, 'es9646tlu1nc0v1s7juir1pa8q', '2409:40c2:35:a1d1:4916:290:202e:590d', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:35:a1d1:4916:290:202e:590d\\\"}', '2026-01-05 05:50:52', '2026-01-05 06:24:39', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(44, 8, 'pvtv5qn350ckp2g66lrh0uhuk3', '2409:40c2:314a:ed2d:2127:109b:374d:bb85', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411005\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:314a:ed2d:2127:109b:374d:bb85\\\"}', '2026-01-05 05:55:38', '2026-01-05 05:59:59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'logged_out'),
(45, 8, 'u4iusbu1sqsph73gfoirvug71b', '2409:40c2:542a:8a99:8000::', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Ashta\\\",\\\"zip\\\":\\\"415002\\\",\\\"lat\\\":16.9596,\\\"lon\\\":74.4174,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:542a:8a99:8000::\\\"}', '2026-01-05 05:55:56', '2026-01-05 06:07:43', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'logged_out'),
(46, 7, '80o8tb6fsv6t3t26ae9u8pdm4h', '2409:40c2:314a:ed2d:8800:4d5e:a566:3394', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411005\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:314a:ed2d:8800:4d5e:a566:3394\\\"}', '2026-01-05 05:56:27', '2026-01-05 07:06:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(47, 8, 'ri2uu79gioisi80bb65qensskm', '152.58.31.121', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"152.58.31.121\\\"}', '2026-01-05 05:56:29', '2026-01-05 06:02:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(48, 8, 'jfu7tg5h14bge8n07qpga8s69o', '47.11.16.212', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440001\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio infocomm ltd\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"47.11.16.212\\\"}', '2026-01-05 05:56:37', '2026-01-05 06:12:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'logged_out'),
(49, 8, 'corrc1khrr6fadmhmcvhkqlu2l', '2409:40c2:3058:ec6b:f1cd:8455:1a2f:3283', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Dharashiv\\\",\\\"zip\\\":\\\"413405\\\",\\\"lat\\\":18.1863,\\\"lon\\\":76.0407,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:3058:ec6b:f1cd:8455:1a2f:3283\\\"}', '2026-01-05 05:56:41', '2026-01-05 06:05:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(50, 8, 'lg2mfhl2f7s2b87h3eins249rv', '2409:40c2:6437:877d:8000::', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nashik\\\",\\\"zip\\\":\\\"422222\\\",\\\"lat\\\":20.0024,\\\"lon\\\":73.7945,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:6437:877d:8000::\\\"}', '2026-01-05 05:56:46', '2026-01-05 05:56:46', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(51, 8, '8727pref4tcbt7tfuob77mnu9c', '2409:40c2:1015:50e8:9426:58e:9ce7:c95', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1015:50e8:9426:58e:9ce7:c95\\\"}', '2026-01-05 05:56:49', '2026-01-05 06:08:08', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.2 Safari/605.1.15', 'logged_out'),
(52, 8, 'sr07677pngbnoulcacj3kto1p8', '2409:40c2:10c:b0da:20a8:c0ba:c23c:ded', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:10c:b0da:20a8:c0ba:c23c:ded\\\"}', '2026-01-05 05:56:59', '2026-01-05 06:13:48', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1', 'logged_out'),
(53, 8, 'r3d3rdsiu5cahtfrboeqcl42vh', '2409:40c2:6437:877d:8000::', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nashik\\\",\\\"zip\\\":\\\"422222\\\",\\\"lat\\\":20.0024,\\\"lon\\\":73.7945,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:6437:877d:8000::\\\"}', '2026-01-05 05:57:18', '2026-01-05 05:58:17', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(54, 8, 'l6j122uoc6hunpvu0vffj0i7rd', '2409:40c2:12a8:7680:9c18:8dff:fe96:7edf', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:12a8:7680:9c18:8dff:fe96:7edf\\\"}', '2026-01-05 05:57:22', '2026-01-05 05:58:53', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'logged_out'),
(55, 8, 'phmi5vg3vdvtilnpulpnuu61vq', '2409:40c2:1011:ef24:48e0:78f1:3b4f:362b', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1011:ef24:48e0:78f1:3b4f:362b\\\"}', '2026-01-05 05:57:37', '2026-01-05 06:07:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(56, 8, 'muct41sl8nk5bncu7jj8rl6jnl', '2401:4900:52f5:ce1f:fcd6:856e:32cc:ae96', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:52f5:ce1f:fcd6:856e:32cc:ae96\\\"}', '2026-01-05 05:58:09', '2026-01-05 05:58:10', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'logged_out'),
(57, 8, '6rjgldn7o1ccmsfl95vrsu374n', '2409:40c2:109:7f3b:e025:f704:75da:4420', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:109:7f3b:e025:f704:75da:4420\\\"}', '2026-01-05 05:59:06', '2026-01-05 06:03:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(58, 8, 'jhf45351rhpjgt4uotdnpc4scp', '2402:3a80:c95:b19f:d0b2:7a5:b2cb:21dc', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Vodafone Idea Ltd.\\\",\\\"org\\\":\\\"Vodafone Idea Ltd.\\\",\\\"as\\\":\\\"AS38266 Vodafone Idea Ltd\\\",\\\"query\\\":\\\"2402:3a80:c95:b19f:d0b2:7a5:b2cb:21dc\\\"}', '2026-01-05 06:00:21', '2026-01-05 06:08:37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(59, 8, 'k0trac1pp5f6007rn3k52sqf34', '2409:40c2:12a8:7680:9c18:8dff:fe96:7edf', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:12a8:7680:9c18:8dff:fe96:7edf\\\"}', '2026-01-05 06:00:55', '2026-01-05 06:22:42', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(60, 8, '4isd28hcqbbcripi0189rstnsk', '2401:4900:52f5:ce1f:fcd6:856e:32cc:ae96', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:52f5:ce1f:fcd6:856e:32cc:ae96\\\"}', '2026-01-05 06:02:11', '2026-01-05 06:05:59', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(61, 11, 'tmsp8v170k12dg721h4rn22ang', '152.58.31.121', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"152.58.31.121\\\"}', '2026-01-05 06:03:05', '2026-01-05 06:09:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(62, 8, 'rdt6coul7gnu84qvehrhuedsn2', '2402:3a80:c95:b19f:cda0:11b5:ac63:36', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Vodafone Idea Ltd.\\\",\\\"org\\\":\\\"Vodafone Idea Ltd.\\\",\\\"as\\\":\\\"AS38266 Vodafone Idea Ltd\\\",\\\"query\\\":\\\"2402:3a80:c95:b19f:cda0:11b5:ac63:36\\\"}', '2026-01-05 06:03:40', '2026-01-05 06:10:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(63, 8, 'c7vil7iqj0t94ajpri1u69dc2u', '2409:40c2:109:7f3b:e025:f704:75da:4420', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:109:7f3b:e025:f704:75da:4420\\\"}', '2026-01-05 06:04:42', '2026-01-05 06:09:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(64, 14, '3rjm34cqm4touikpocqgug5etr', '2409:40c2:3058:ec6b:f1cd:8455:1a2f:3283', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Dharashiv\\\",\\\"zip\\\":\\\"413405\\\",\\\"lat\\\":18.1863,\\\"lon\\\":76.0407,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:3058:ec6b:f1cd:8455:1a2f:3283\\\"}', '2026-01-05 06:05:33', '2026-01-06 08:59:40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(65, 8, '8ig4ik08dlj0c7jcqkggsh9lga', '2409:40c2:105a:4fc2:900e:aef:fa15:dc82', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:105a:4fc2:900e:aef:fa15:dc82\\\"}', '2026-01-05 06:06:22', '2026-01-05 06:07:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'logged_out'),
(66, 15, 'jvo24uukksa4gntoc0sh3qpdr8', '2401:4900:52f5:ce1f:fcd6:856e:32cc:ae96', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:52f5:ce1f:fcd6:856e:32cc:ae96\\\"}', '2026-01-05 06:07:16', '2026-01-05 06:07:58', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(67, 12, 'u09q3oi9hhkl283e2rqahmvhj7', '2409:40c2:1011:ef24:48e0:78f1:3b4f:362b', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1011:ef24:48e0:78f1:3b4f:362b\\\"}', '2026-01-05 06:07:37', '2026-01-05 06:25:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(68, 10, '6lcdcd86a47ccgeee4fi3j4cdr', '2409:40c2:1015:50e8:9426:58e:9ce7:c95', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1015:50e8:9426:58e:9ce7:c95\\\"}', '2026-01-05 06:08:26', '2026-01-05 06:56:33', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.2 Safari/605.1.15', 'active'),
(69, 17, 'mm4hopcujnm6gjb8gq8m338gat', '2402:3a80:c95:b19f:d0b2:7a5:b2cb:21dc', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Vodafone Idea Ltd.\\\",\\\"org\\\":\\\"Vodafone Idea Ltd.\\\",\\\"as\\\":\\\"AS38266 Vodafone Idea Ltd\\\",\\\"query\\\":\\\"2402:3a80:c95:b19f:d0b2:7a5:b2cb:21dc\\\"}', '2026-01-05 06:09:00', '2026-01-05 12:17:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(70, 13, '69jcho8k305gg53v0mr3ptohif', '2409:40c2:109:7f3b:e025:f704:75da:4420', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:109:7f3b:e025:f704:75da:4420\\\"}', '2026-01-05 06:09:38', '2026-01-05 07:29:37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(71, 8, '502dl2090aroe9r3al4g0km948', '2402:3a80:c95:b19f:cda0:11b5:ac63:36', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Vodafone Idea Ltd.\\\",\\\"org\\\":\\\"Vodafone Idea Ltd.\\\",\\\"as\\\":\\\"AS38266 Vodafone Idea Ltd\\\",\\\"query\\\":\\\"2402:3a80:c95:b19f:cda0:11b5:ac63:36\\\"}', '2026-01-05 06:10:35', '2026-01-05 06:11:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(72, 15, 'ti8guuob65m8q71u44vt0l8beg', '2401:4900:52f5:ce1f:fcd6:856e:32cc:ae96', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:52f5:ce1f:fcd6:856e:32cc:ae96\\\"}', '2026-01-05 06:10:50', '2026-01-05 06:13:49', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(73, 19, '1kv9uh41hh9blgrq0215gqjosb', '2402:3a80:c95:b19f:cda0:11b5:ac63:36', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Vodafone Idea Ltd.\\\",\\\"org\\\":\\\"Vodafone Idea Ltd.\\\",\\\"as\\\":\\\"AS38266 Vodafone Idea Ltd\\\",\\\"query\\\":\\\"2402:3a80:c95:b19f:cda0:11b5:ac63:36\\\"}', '2026-01-05 06:12:25', '2026-01-05 10:45:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(74, 8, 'i1cm6rk5gltdvgutal1a2mvmf0', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\"}', '2026-01-05 06:12:32', '2026-01-05 06:12:32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'logged_out'),
(75, 8, 'e2urtjqpk9a577ea9446qghtem', '47.11.16.212', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440001\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio infocomm ltd\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"47.11.16.212\\\"}', '2026-01-05 06:13:35', '2026-01-05 06:13:36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(76, 8, 'sj053g6e6g5j96kr39erg1bqt6', '47.11.16.212', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440001\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio infocomm ltd\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"47.11.16.212\\\"}', '2026-01-05 06:13:37', '2026-01-05 06:13:37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(77, 8, 'fnlffcfo2m0jctaj45udmr6cpo', '47.11.16.212', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440001\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio infocomm ltd\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"47.11.16.212\\\"}', '2026-01-05 06:13:38', '2026-01-05 06:14:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'logged_out'),
(78, 18, '6dr96gatt1003gt0k2nsbskbvm', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\"}', '2026-01-05 06:14:11', '2026-01-05 10:45:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(79, 8, '0ek7s8lhe99j5j587hvvucpt5s', '2409:40c2:1011:ef24:48e0:78f1:3b4f:362b', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1011:ef24:48e0:78f1:3b4f:362b\\\"}', '2026-01-05 06:14:17', '2026-01-05 06:23:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(80, 8, '57pqmqevuo2v9207up6rm2h12v', '2409:40c2:10c:b0da:20a8:c0ba:c23c:ded', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:10c:b0da:20a8:c0ba:c23c:ded\\\"}', '2026-01-05 06:14:34', '2026-01-05 06:15:03', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1', 'logged_out'),
(81, 20, 'j4rvrf0b8b4dv1omkh55rc58od', '47.11.16.212', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440001\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio infocomm ltd\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"47.11.16.212\\\"}', '2026-01-05 06:14:35', '2026-01-05 06:14:35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(82, 20, 'mhp8j7m3tuhqbl98tn6qknje8a', '47.11.16.212', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440001\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio infocomm ltd\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"47.11.16.212\\\"}', '2026-01-05 06:14:36', '2026-01-05 06:15:59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(83, 21, '82l38b2hc609t2b7bs67poog6a', '2409:40c2:10c:b0da:20a8:c0ba:c23c:ded', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:10c:b0da:20a8:c0ba:c23c:ded\\\"}', '2026-01-05 06:15:28', '2026-01-05 06:15:35', 'Mozilla/5.0 (iPhone; CPU iPhone OS 17_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 Mobile/15E148 Safari/604.1', 'active'),
(84, 22, '566vjbv9hhpqfte3ump1kghvbb', '2409:40c2:105a:4fc2:900e:aef:fa15:dc82', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:105a:4fc2:900e:aef:fa15:dc82\\\"}', '2026-01-05 06:16:01', '2026-01-05 10:40:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(85, 9, 'arfna97vb0jnbc8dapjfq5bjm6', '2409:40c2:35:a1d1:4916:290:202e:590d', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:35:a1d1:4916:290:202e:590d\\\"}', '2026-01-05 06:16:35', '2026-01-05 06:16:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(86, 16, '4ljnriomggr1tbcr6s2cu95c90', '2409:40c2:12a8:7680:9c18:8dff:fe96:7edf', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:12a8:7680:9c18:8dff:fe96:7edf\\\"}', '2026-01-05 06:23:26', '2026-01-05 06:23:35', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(87, 23, 'pjcvnc91t8bvu6l3htsd11r6kp', '2409:40c2:1011:ef24:48e0:78f1:3b4f:362b', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1011:ef24:48e0:78f1:3b4f:362b\\\"}', '2026-01-05 06:23:38', '2026-01-05 10:21:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(88, 23, 'j26211lm1pcvfobe9n2cmk0g58', '2409:40c2:1011:ef24:48e0:78f1:3b4f:362b', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1011:ef24:48e0:78f1:3b4f:362b\\\"}', '2026-01-05 06:23:38', '2026-01-05 06:23:38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(89, 8, 'lhd26irfcbm5m3kecbh224cgns', '2409:40c2:35:a1d1:4916:290:202e:590d', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:35:a1d1:4916:290:202e:590d\\\"}', '2026-01-05 06:24:54', '2026-01-05 07:20:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(90, 12, 'hd7lrt3b570e4ppd4kd8s01q6g', '2409:40c2:1011:ef24:48e0:78f1:3b4f:362b', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1011:ef24:48e0:78f1:3b4f:362b\\\"}', '2026-01-05 06:27:52', '2026-01-05 06:27:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(91, 12, 'nc8itm66ced5r39dd85qg536pu', '2409:40c2:1011:ef24:48e0:78f1:3b4f:362b', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1011:ef24:48e0:78f1:3b4f:362b\\\"}', '2026-01-05 06:27:54', '2026-01-05 11:39:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(92, 21, 'ob34jf6tsbhmq2tm7k54m8qafn', '2409:40c2:10c:b0da:28bb:91a3:cfeb:a9e8', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:10c:b0da:28bb:91a3:cfeb:a9e8\\\"}', '2026-01-05 06:29:34', '2026-01-05 06:33:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(93, 1, 'hunalldf5po2i27vn1opbe2pti', '2409:40c2:543b:a413:fc19:b3ff:fecf:f8eb', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Ashta\\\",\\\"zip\\\":\\\"415002\\\",\\\"lat\\\":16.9596,\\\"lon\\\":74.4174,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:543b:a413:fc19:b3ff:fecf:f8eb\\\"}', '2026-01-05 06:37:00', '2026-01-05 06:42:48', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'logged_out'),
(94, 21, 'kpqak9oi0pl51sbc1vpoeojs8i', '2409:40c2:10c:b0da:28bb:91a3:cfeb:a9e8', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:10c:b0da:28bb:91a3:cfeb:a9e8\\\"}', '2026-01-05 06:39:48', '2026-01-05 06:46:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active');
INSERT INTO `user_activity` (`id`, `user_id`, `session_id`, `ip_address`, `location_data`, `login_time`, `last_activity`, `device_info`, `status`) VALUES
(95, 24, 's8h0efi5b3fpirf6qq0br64f87', '2409:40c2:543b:a413:117b:248a:2740:5c3e', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Ashta\\\",\\\"zip\\\":\\\"415002\\\",\\\"lat\\\":16.9596,\\\"lon\\\":74.4174,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:543b:a413:117b:248a:2740:5c3e\\\"}', '2026-01-05 06:43:17', '2026-01-05 06:44:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(96, 16, '8d1cpv8ase2igpk14m9pp8m0rf', '2409:40c2:12a8:7680:f437:b49a:8aa9:f0f3', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:12a8:7680:f437:b49a:8aa9:f0f3\\\"}', '2026-01-05 06:49:06', '2026-01-05 09:40:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(97, 21, 'btddofpeu2ijipboq4o3375mmh', '2409:40c2:10c:b0da:28bb:91a3:cfeb:a9e8', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:10c:b0da:28bb:91a3:cfeb:a9e8\\\"}', '2026-01-05 06:58:52', '2026-01-05 07:04:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(98, 15, 'odk4eia50b8cr9g1m4ct3e4n3t', '2401:4900:52f5:ce1f:fcd6:856e:32cc:ae96', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:52f5:ce1f:fcd6:856e:32cc:ae96\\\"}', '2026-01-05 07:07:04', '2026-01-05 07:07:09', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(99, 24, '9cf38f9qno2dk4ik7gl455npcp', '2409:40c2:543b:a413:b433:b71e:671:474e', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Ashta\\\",\\\"zip\\\":\\\"415002\\\",\\\"lat\\\":16.9596,\\\"lon\\\":74.4174,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:543b:a413:b433:b71e:671:474e\\\"}', '2026-01-05 07:11:55', '2026-01-05 07:11:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(100, 15, 'om7p3lqvojrt09eud313f0m59i', '2401:4900:52f5:ce1f:fcd6:856e:32cc:ae96', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:52f5:ce1f:fcd6:856e:32cc:ae96\\\"}', '2026-01-05 07:41:23', '2026-01-05 07:42:11', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(101, 10, 'n3f2ko42lp0u5kgl1hhif3bpbd', '2409:40c2:3058:ec6b:9b3:8105:2077:4da7', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Dharashiv\\\",\\\"zip\\\":\\\"413405\\\",\\\"lat\\\":18.1863,\\\"lon\\\":76.0407,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:3058:ec6b:9b3:8105:2077:4da7\\\"}', '2026-01-05 08:32:06', '2026-01-05 08:33:39', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.2 Safari/605.1.15', 'active'),
(102, 15, 'km52avpjnuuj9cjqhn9qmuansb', '2401:4900:52f5:ce1f:fcd6:856e:32cc:ae96', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:52f5:ce1f:fcd6:856e:32cc:ae96\\\"}', '2026-01-05 08:32:22', '2026-01-05 09:13:40', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(103, 21, '1vpvsgtsj0nktlvo391hqr6tlv', '2409:40c2:10c:b0da:28bb:91a3:cfeb:a9e8', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:10c:b0da:28bb:91a3:cfeb:a9e8\\\"}', '2026-01-05 09:13:14', '2026-01-05 09:13:18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(104, 21, '6qpslte24uvii84k877jj0th0r', '2409:40c2:10c:b0da:28bb:91a3:cfeb:a9e8', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:10c:b0da:28bb:91a3:cfeb:a9e8\\\"}', '2026-01-05 09:55:04', '2026-01-05 11:00:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(105, 16, 'nnmbm9g4l69ajvam82ul3h86eh', '2409:40c2:12a8:7680:d19a:b99e:1cd3:4c2', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:12a8:7680:d19a:b99e:1cd3:4c2\\\"}', '2026-01-05 11:18:15', '2026-01-05 12:13:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(106, 20, '4oi6a6h6f7g0qdqq88q49pd871', '152.58.14.210', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411002\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"RELIANCEJIO\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"152.58.14.210\\\"}', '2026-01-05 12:02:42', '2026-01-05 12:15:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(107, 11, 'r40no3890cqg7rjcv63jjsme0p', '47.11.40.96', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413006\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio infocomm ltd\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"47.11.40.96\\\"}', '2026-01-05 12:06:41', '2026-01-05 12:17:43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(108, 24, '6ec58ba3qh5oloc2c642v361rt', '2409:40c2:543b:a413:c141:dcdc:a96d:494b', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Ashta\\\",\\\"zip\\\":\\\"415002\\\",\\\"lat\\\":16.9596,\\\"lon\\\":74.4174,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:543b:a413:c141:dcdc:a96d:494b\\\"}', '2026-01-05 12:07:09', '2026-01-05 12:07:44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(109, 22, 'gku5jcph1kohgt04vvebsr2cha', '2409:40c2:105a:4fc2:7cec:99bb:845d:dc88', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:105a:4fc2:7cec:99bb:845d:dc88\\\"}', '2026-01-05 12:07:25', '2026-01-06 06:19:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(110, 21, '6tnqgmvln82e2ors0ci7ju9vh9', '2409:40c2:10c:b0da:4900:43d3:812:ca0e', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:10c:b0da:4900:43d3:812:ca0e\\\"}', '2026-01-05 12:08:24', '2026-01-05 12:24:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(111, 15, 'dlk75nnbp8qsu31e9sdlsv0elm', '2401:4900:57c8:b05e:62d2:2a99:bb8a:91d7', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440003\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:57c8:b05e:62d2:2a99:bb8a:91d7\\\"}', '2026-01-05 12:08:50', '2026-01-05 12:09:42', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(112, 15, 'e0r8n860h2aufchopt68n0abor', '2401:4900:57c8:b05e:62d2:2a99:bb8a:91d7', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440003\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:57c8:b05e:62d2:2a99:bb8a:91d7\\\"}', '2026-01-05 12:10:15', '2026-01-05 12:10:16', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'logged_out'),
(113, 18, 'gc87qr5cknundrrm6abaflaos4', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\"}', '2026-01-05 12:15:28', '2026-01-05 12:15:28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'logged_out'),
(114, 21, '9fe57sjaol1j7mlq18rm50ao4h', '2409:40c2:10c:b0da:4900:43d3:812:ca0e', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:10c:b0da:4900:43d3:812:ca0e\\\"}', '2026-01-06 04:45:03', '2026-01-06 04:47:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(115, 21, 's17qnos878fljt7gukpa6vkuhc', '2409:40c2:10c:b0da:4900:43d3:812:ca0e', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:10c:b0da:4900:43d3:812:ca0e\\\"}', '2026-01-06 04:54:19', '2026-01-06 04:54:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(116, 10, 't3oqqolbjb2fthvs9t1uhdgub1', '2409:40c2:14:ba4b:b563:75df:9fe9:2b34', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440010\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:14:ba4b:b563:75df:9fe9:2b34\\\"}', '2026-01-06 04:55:01', '2026-01-06 08:51:17', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.2 Safari/605.1.15', 'active'),
(117, 16, 'qipi44ghull9furfddiia1bnsk', '2409:40c2:1013:d176:3dcb:892b:2cf0:b15a', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1013:d176:3dcb:892b:2cf0:b15a\\\"}', '2026-01-06 05:05:23', '2026-01-06 11:24:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(118, 24, 'f0cl53k5fugs5fkrv361h5her3', '2409:40c2:315c:237a:c425:4fff:fef9:58c0', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411005\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:315c:237a:c425:4fff:fef9:58c0\\\"}', '2026-01-06 05:07:50', '2026-01-06 05:08:27', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(119, 13, 's8re6pecpu1re8dk1r8rutp4ci', '2409:40c2:2c:2b46:39ed:7246:f110:dc26', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440010\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:2c:2b46:39ed:7246:f110:dc26\\\"}', '2026-01-06 05:07:59', '2026-01-06 11:08:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(120, 20, 'nc6l1bcinrrp2u3aod16cg5buo', '47.11.19.208', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440001\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio infocomm ltd\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"47.11.19.208\\\"}', '2026-01-06 05:09:19', '2026-01-06 06:16:43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(121, 11, 'cibdncn3ht2avhpnu2gci9m2vh', '47.11.41.246', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413006\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio infocomm ltd\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"47.11.41.246\\\"}', '2026-01-06 05:12:52', '2026-01-06 05:15:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(122, 12, 'ec38c1v4777o3tt2p8s9uu4qn4', '2409:40c2:105:126:21e8:30bf:8f36:533e', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:105:126:21e8:30bf:8f36:533e\\\"}', '2026-01-06 05:12:56', '2026-01-06 05:51:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(123, 23, '4d780m19fkt50apgbmpkjfv2ab', '2409:40c2:105:126:21e8:30bf:8f36:533e', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:105:126:21e8:30bf:8f36:533e\\\"}', '2026-01-06 05:15:02', '2026-01-06 05:15:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(124, 22, '6j3qg9uu6sin0u63jfga0sofer', '2409:40c2:2a:37c6:7850:f8ff:fea7:41e3', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440010\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:2a:37c6:7850:f8ff:fea7:41e3\\\"}', '2026-01-06 05:16:07', '2026-01-06 05:17:12', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(125, 8, '54fbniau30tdt74labhe6lo1n5', '2409:40c2:1053:ebf2:24f2:4005:dd66:3eb7', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411017\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1053:ebf2:24f2:4005:dd66:3eb7\\\"}', '2026-01-06 05:20:18', '2026-01-06 05:21:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(126, 9, '28orcsmjckpmmdequ79o606g8j', '2409:40c2:1053:ebf2:24f2:4005:dd66:3eb7', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411017\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1053:ebf2:24f2:4005:dd66:3eb7\\\"}', '2026-01-06 05:22:03', '2026-01-06 05:22:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(127, 21, '6cu3ajcgiuincnmnq5dq3gt373', '2409:40c2:10c:b0da:51b9:5d60:97ae:55c5', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:10c:b0da:51b9:5d60:97ae:55c5\\\"}', '2026-01-06 05:27:50', '2026-01-06 06:19:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(128, 17, 'dfm6e9pa3shmctkr1vdhap3q97', '2401:4900:530e:511c:1555:97ba:9b2e:dd36', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:530e:511c:1555:97ba:9b2e:dd36\\\"}', '2026-01-06 05:30:03', '2026-01-06 11:21:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'logged_out'),
(129, 18, '2i42kelbuaa7h5h711i451pg5c', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\"}', '2026-01-06 05:30:41', '2026-01-06 09:40:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(130, 15, 'kajrsp043oc33dods8011041sn', '2401:4900:530e:511c:91b2:ab0e:3880:b68a', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:530e:511c:91b2:ab0e:3880:b68a\\\"}', '2026-01-06 05:33:00', '2026-01-06 05:34:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0', 'active'),
(131, 7, '9o90o10p5o4fijr59tb8er019s', '2401:4900:503d:d747:a935:4ceb:4ed7:a6a3', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:503d:d747:a935:4ceb:4ed7:a6a3\\\"}', '2026-01-06 06:13:08', '2026-01-06 06:24:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(132, 15, '1j5jm49sqemtt6c2ltvr9fdnql', '2401:4900:530e:511c:31ee:9bd:cd8f:5da9', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:530e:511c:31ee:9bd:cd8f:5da9\\\"}', '2026-01-06 06:18:30', '2026-01-06 06:18:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0', 'logged_out'),
(133, 1, 'amocnmprfhh5hucv9eoqnukv4v', '2401:4900:530e:511c:31ee:9bd:cd8f:5da9', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:530e:511c:31ee:9bd:cd8f:5da9\\\"}', '2026-01-06 06:22:05', '2026-01-06 07:32:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0', 'active'),
(134, 19, 'v1n4r5ridlfko4gjs0eh9jtsd0', '2409:40c2:105:126:95de:c157:5194:bc76', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:105:126:95de:c157:5194:bc76\\\"}', '2026-01-06 06:24:56', '2026-01-06 06:26:26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(135, 25, 'tg0p65jamvqb3d8qs070bu97e1', '2409:40c2:2a:37c6:a115:1ab8:fe4d:e7d6', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440010\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:2a:37c6:a115:1ab8:fe4d:e7d6\\\"}', '2026-01-06 06:29:51', '2026-01-06 07:08:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(136, 15, 's5udra2ulddcmacr6udjhqfkfj', '2401:4900:530e:511c:32f0:534c:4b73:edd9', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:530e:511c:32f0:534c:4b73:edd9\\\"}', '2026-01-06 06:30:52', '2026-01-06 06:31:02', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(137, 26, 'i7edmnudkb8gbm73elasn2ctrn', '2409:40c2:105:126:a52a:a8ea:50fc:f49a', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:105:126:a52a:a8ea:50fc:f49a\\\"}', '2026-01-06 08:46:16', '2026-01-06 11:18:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(138, 1, '2k3094bq5nbbb1tas97i7mi1mv', '2409:40c2:601c:306:6c3f:e47d:8e7a:d9cb', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nashik\\\",\\\"zip\\\":\\\"422003\\\",\\\"lat\\\":20.0024,\\\"lon\\\":73.7945,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:601c:306:6c3f:e47d:8e7a:d9cb\\\"}', '2026-01-06 09:02:31', '2026-01-06 09:04:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(139, 12, 'p9ifoulijvcm6s8outvn0g9em6', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\"}', '2026-01-06 09:03:02', '2026-01-06 09:35:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(140, 15, '2kv9ik5fdprvkqb4457rurjkha', '2401:4900:530e:511c:c035:e19a:3720:1942', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:530e:511c:c035:e19a:3720:1942\\\"}', '2026-01-06 09:03:27', '2026-01-06 10:57:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0', 'logged_out'),
(141, 27, 'k2oof0tl5t5va5tapjb0fvovlc', '2409:40c2:601c:306:6c3f:e47d:8e7a:d9cb', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nashik\\\",\\\"zip\\\":\\\"422003\\\",\\\"lat\\\":20.0024,\\\"lon\\\":73.7945,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:601c:306:6c3f:e47d:8e7a:d9cb\\\"}', '2026-01-06 09:05:06', '2026-01-06 09:06:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(142, 28, '2cnhnvb4mtiaa6343be665u0kn', '2401:4900:562e:1f90:3c7a:cdff:fef5:82b8', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411017\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:562e:1f90:3c7a:cdff:fef5:82b8\\\"}', '2026-01-06 09:08:58', '2026-01-06 09:12:38', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Mobile Safari/537.36', 'active'),
(143, 28, 'jbt9tmk6o6oql9ssi4nlo90159', '2401:4900:562e:1f90:3c7a:cdff:fef5:82b8', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411017\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:562e:1f90:3c7a:cdff:fef5:82b8\\\"}', '2026-01-06 09:12:53', '2026-01-06 09:13:43', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Mobile Safari/537.36', 'logged_out'),
(144, 28, 'ripkatiuufdg7speqm992ollb3', '2401:4900:562e:1f90:3c7a:cdff:fef5:82b8', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411017\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:562e:1f90:3c7a:cdff:fef5:82b8\\\"}', '2026-01-06 09:14:57', '2026-01-06 09:14:57', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Mobile Safari/537.36', 'active'),
(145, 28, 'b6esgt9qs00gvram6vvqa4me9p', '2401:4900:562e:1f90:3c7a:cdff:fef5:82b8', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411017\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:562e:1f90:3c7a:cdff:fef5:82b8\\\"}', '2026-01-06 09:14:59', '2026-01-06 09:15:49', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Mobile Safari/537.36', 'active'),
(146, 19, '3mnjl6cuorprch7bj4l2guv6ne', '152.58.31.178', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"152.58.31.178\\\"}', '2026-01-06 09:26:26', '2026-01-06 10:56:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(147, 13, 'op6ia1hjci8gbaq0fjlr2klh01', '2409:40c2:2c:2b46:40c7:239a:d672:91e0', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440010\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:2c:2b46:40c7:239a:d672:91e0\\\"}', '2026-01-06 11:10:26', '2026-01-06 11:10:48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(148, 19, 'lei0alpp21l5l4v2vg5rhjt57f', '2409:40c2:12a3:5698:84ee:84b3:b482:f8b2', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:12a3:5698:84ee:84b3:b482:f8b2\\\"}', '2026-01-06 11:18:50', '2026-01-06 11:19:18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(149, 21, 'bn011098fcri3c6h095od70g5i', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\"}', '2026-01-06 11:26:47', '2026-01-06 11:27:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(150, 24, 'fstp5gop8ptl92s7o52duqgdio', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\"}', '2026-01-06 11:26:52', '2026-01-06 11:30:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(151, 14, '2neor9lni4tk7ui1lt8ttrsm2a', '2409:40c2:3058:ec6b:7db0:90df:87a9:672a', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Dharashiv\\\",\\\"zip\\\":\\\"413405\\\",\\\"lat\\\":18.1863,\\\"lon\\\":76.0407,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:3058:ec6b:7db0:90df:87a9:672a\\\"}', '2026-01-06 11:27:05', '2026-01-06 11:27:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(152, 22, '3undvcm4n5pq74pfmrn6ldfn28', '2409:40c2:12a3:5698:cce9:f5ff:fef6:9e33', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:12a3:5698:cce9:f5ff:fef6:9e33\\\"}', '2026-01-06 11:27:27', '2026-01-06 11:27:31', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(153, 18, 'djnd6c7fjd4ui7jvgc6lrhhft1', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\"}', '2026-01-06 11:30:16', '2026-01-06 11:31:22', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(154, 8, '6vjvn2mro1e2bd1og0ie5nj5eq', '2409:40c2:1053:ebf2:34b2:50ff:fefe:d4f', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411017\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1053:ebf2:34b2:50ff:fefe:d4f\\\"}', '2026-01-06 17:33:27', '2026-01-06 17:34:02', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(155, 10, '2pcpjmoepllu0sbfi7ldh4kcll', '2409:40c2:101d:9be5:84be:c1ff:feea:21ad', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:101d:9be5:84be:c1ff:feea:21ad\\\"}', '2026-01-07 04:28:24', '2026-01-07 04:28:25', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(156, 10, 'd0m0v52vfljiga08o12eecbt53', '2409:40c2:101d:9be5:84be:c1ff:feea:21ad', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:101d:9be5:84be:c1ff:feea:21ad\\\"}', '2026-01-07 04:28:43', '2026-01-07 04:28:48', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(157, 10, 'v72chht0aa52c12ktsra88h5vi', '2409:40c2:101d:9be5:84be:c1ff:feea:21ad', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:101d:9be5:84be:c1ff:feea:21ad\\\"}', '2026-01-07 04:48:38', '2026-01-07 04:48:46', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(158, 19, '1qoqtm6q4vb1tqjthn6rpg8po3', '2409:4042:2e1d:a6a6::9bc8:9203', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440024\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:4042:2e1d:a6a6::9bc8:9203\\\"}', '2026-01-07 04:53:43', '2026-01-07 04:53:56', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(159, 15, 'c2sp80klovlao9iav30v6n6go9', '2401:4900:ad4a:c48:731d:8737:7182:730a', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411016\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:ad4a:c48:731d:8737:7182:730a\\\"}', '2026-01-07 05:00:42', '2026-01-07 05:01:32', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(160, 14, 'cpla9ttoedpajcrkfijeqp30au', '2402:3a80:c97:a9a2:ecb2:b7ff:fe6d:d4b8', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Vodafone Idea Ltd.\\\",\\\"org\\\":\\\"Vodafone Idea Ltd.\\\",\\\"as\\\":\\\"AS38266 Vodafone Idea Ltd\\\",\\\"query\\\":\\\"2402:3a80:c97:a9a2:ecb2:b7ff:fe6d:d4b8\\\"}', '2026-01-07 05:05:25', '2026-01-07 05:05:45', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active');
INSERT INTO `user_activity` (`id`, `user_id`, `session_id`, `ip_address`, `location_data`, `login_time`, `last_activity`, `device_info`, `status`) VALUES
(161, 16, 'mp6sht1urfe9gh37rc8h0p0k2p', '2409:40c2:3116:ba77:8434:1297:aca5:b3e0', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411005\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:3116:ba77:8434:1297:aca5:b3e0\\\"}', '2026-01-07 05:06:16', '2026-01-07 08:41:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(162, 10, '6fgk9ub6qmo6bsauu7sstdfi2n', '2409:40c2:101d:9be5:49b9:23cd:331c:55e7', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:101d:9be5:49b9:23cd:331c:55e7\\\"}', '2026-01-07 05:06:25', '2026-01-07 05:39:09', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.2 Safari/605.1.15', 'active'),
(163, 13, '0thnob4a8lg217kspll6aq8rcn', '2409:40c2:2c:2b46:fd24:41fb:2c33:2b66', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440010\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:2c:2b46:fd24:41fb:2c33:2b66\\\"}', '2026-01-07 05:06:42', '2026-01-07 11:30:26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(164, 11, 'br1pqgc2b15dqnr3snsi3bc72j', '152.58.16.156', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411009\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"RELIANCEJIO\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"152.58.16.156\\\"}', '2026-01-07 05:10:31', '2026-01-07 05:11:45', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(165, 12, '72ij84nvbhp9356j7kkv14jsh0', '2409:40c2:1298:37f3:66:3b7b:6ca7:6b6c', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1298:37f3:66:3b7b:6ca7:6b6c\\\"}', '2026-01-07 05:11:38', '2026-01-07 05:12:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(166, 23, '66fpas4itndt0k63e472ddm7lv', '2409:40c2:1298:37f3:66:3b7b:6ca7:6b6c', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1298:37f3:66:3b7b:6ca7:6b6c\\\"}', '2026-01-07 05:13:06', '2026-01-07 06:28:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(167, 21, 'u2ql8o4kv65vnngitu80gjpqg7', '2409:40c2:3040:2b7:b969:1ce2:7b27:eae1', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Dharashiv\\\",\\\"zip\\\":\\\"413405\\\",\\\"lat\\\":18.1863,\\\"lon\\\":76.0407,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:3040:2b7:b969:1ce2:7b27:eae1\\\"}', '2026-01-07 05:20:41', '2026-01-07 05:20:45', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(168, 24, 's3r788cb2tn9nu470anov56tbq', '2409:40c2:1059:da37:41e6:dac4:ff7b:565b', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1059:da37:41e6:dac4:ff7b:565b\\\"}', '2026-01-07 05:20:49', '2026-01-07 05:22:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(169, 21, '8s6di7rard9a01rpeena126jc8', '2409:40c2:3040:2b7:b969:1ce2:7b27:eae1', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Dharashiv\\\",\\\"zip\\\":\\\"413405\\\",\\\"lat\\\":18.1863,\\\"lon\\\":76.0407,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:3040:2b7:b969:1ce2:7b27:eae1\\\"}', '2026-01-07 05:24:20', '2026-01-07 05:24:30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(170, 21, 'o5vqfpm4n6640vltoc81idqsa7', '2409:40c2:3040:2b7:b969:1ce2:7b27:eae1', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Dharashiv\\\",\\\"zip\\\":\\\"413405\\\",\\\"lat\\\":18.1863,\\\"lon\\\":76.0407,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:3040:2b7:b969:1ce2:7b27:eae1\\\"}', '2026-01-07 05:26:43', '2026-01-07 05:26:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(171, 26, 'art20543qsoncbqtlgagiufi7p', '2409:40c2:1044:c777:4093:f1ca:6c5e:bb4f', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411009\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1044:c777:4093:f1ca:6c5e:bb4f\\\"}', '2026-01-07 05:27:51', '2026-01-07 10:48:32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(172, 20, '05jr1g1u7sdujo6a027jerdqas', '152.58.16.156', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411009\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"RELIANCEJIO\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"152.58.16.156\\\"}', '2026-01-07 05:28:23', '2026-01-07 05:35:27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(173, 25, 'hoggblniacig4irncq23vahtt9', '2409:40c2:12a3:5698:41b6:347b:b618:c012', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:12a3:5698:41b6:347b:b618:c012\\\"}', '2026-01-07 05:37:13', '2026-01-07 07:06:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(174, 18, 'nuihs3facukb6b13n3dboer6um', '2409:40c2:12a3:5698:7cdb:f864:78c4:7a96', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:12a3:5698:7cdb:f864:78c4:7a96\\\"}', '2026-01-07 05:45:45', '2026-01-07 11:35:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'logged_out'),
(175, 22, 'b8649faria8ebmtgjrqj1rjnsa', '2409:40c2:12a3:5698:d876:d37a:4039:572a', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:12a3:5698:d876:d37a:4039:572a\\\"}', '2026-01-07 05:47:40', '2026-01-07 05:48:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(176, 21, 'jnmml5h83q0usnceeh995vfgn4', '2409:40c2:1059:da37:84d4:3354:dcda:c1c5', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1059:da37:84d4:3354:dcda:c1c5\\\"}', '2026-01-07 05:48:37', '2026-01-07 05:48:37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(177, 14, 'slj35nik25f0dd7oulr7o03q2n', '2409:40c2:3058:ec6b:1de8:7d4c:2434:a4ec', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Dharashiv\\\",\\\"zip\\\":\\\"413405\\\",\\\"lat\\\":18.1863,\\\"lon\\\":76.0407,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:3058:ec6b:1de8:7d4c:2434:a4ec\\\"}', '2026-01-07 06:00:37', '2026-01-07 11:30:45', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(178, 17, '692lqsjrtjhbtq146374cn7agh', '2401:4900:ad4a:c48:21a9:2844:4420:91d7', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411016\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:ad4a:c48:21a9:2844:4420:91d7\\\"}', '2026-01-07 06:26:19', '2026-01-07 06:26:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'logged_out'),
(179, 11, 'f4a7atc6c5npsii1bd2g7udlmt', '152.58.16.156', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411009\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"RELIANCEJIO\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"152.58.16.156\\\"}', '2026-01-07 06:38:23', '2026-01-07 06:38:23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(180, 28, '7tqcsj5p6l3f7sm7mp1olnnd18', '2409:40c2:1059:da37:b83e:7e07:c94:6239', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1059:da37:b83e:7e07:c94:6239\\\"}', '2026-01-07 08:53:27', '2026-01-07 08:54:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(181, 12, 'ummh5tne3d17s3l929pg86enet', '2409:40c2:1298:37f3:cdc:1e8b:3e72:1dab', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1298:37f3:cdc:1e8b:3e72:1dab\\\"}', '2026-01-07 08:56:35', '2026-01-07 09:11:41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(182, 15, '52a9lcsnc0f4lnrcnqfddtk0rp', '2401:4900:ad4a:c48:8980:b01b:8047:3c6a', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411016\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:ad4a:c48:8980:b01b:8047:3c6a\\\"}', '2026-01-07 10:01:47', '2026-01-07 10:04:19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0', 'logged_out'),
(183, 25, '5j25pvq0sf6tj717il991b22un', '2409:40c2:12a3:5698:41b6:347b:b618:c012', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:12a3:5698:41b6:347b:b618:c012\\\"}', '2026-01-07 10:02:35', '2026-01-07 10:33:43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'logged_out'),
(184, 1, 'nsusjva901p3mele62sbn95005', '2401:4900:ad4a:c48:8980:b01b:8047:3c6a', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411016\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:ad4a:c48:8980:b01b:8047:3c6a\\\"}', '2026-01-07 10:04:36', '2026-01-07 10:31:18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0', 'logged_out'),
(185, 7, 'u029usp6ktnsjnt40lpm2gbfm7', '152.59.6.58', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413006\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"152.59.6.58\\\"}', '2026-01-07 10:27:02', '2026-01-07 10:27:26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(186, 15, '607qnf3bp2p7960jrs4vrbj4ql', '2401:4900:ad4a:c48:8980:b01b:8047:3c6a', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411016\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:ad4a:c48:8980:b01b:8047:3c6a\\\"}', '2026-01-07 10:31:50', '2026-01-07 10:49:35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:146.0) Gecko/20100101 Firefox/146.0', 'logged_out'),
(187, 1, '7rd7ieugtfh8cd9dr8nt3dcre4', '2409:40c2:1044:c777:58f9:e38d:a497:b816', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411009\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1044:c777:58f9:e38d:a497:b816\\\"}', '2026-01-07 10:32:55', '2026-01-07 10:33:33', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(188, 25, 'vbltt6mp913nh77vn5700oeu7o', '2409:40c2:12a3:5698:41b6:347b:b618:c012', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:12a3:5698:41b6:347b:b618:c012\\\"}', '2026-01-07 10:33:51', '2026-01-07 11:21:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(189, 19, 'rag0d1vvntg6kcphpuh453bant', '2409:40c2:12a3:5698:a8d9:d735:44e2:8536', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:12a3:5698:a8d9:d735:44e2:8536\\\"}', '2026-01-07 10:54:19', '2026-01-07 10:54:42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(190, 13, 'e0rm6a53qu2sntlq6n0tom7hcl', '2409:40c2:101d:35b5:55e0:557e:8fab:306e', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:101d:35b5:55e0:557e:8fab:306e\\\"}', '2026-01-07 11:34:30', '2026-01-07 11:36:37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(191, 24, 'ff9fu24ke5v9e2eclmt6vhcr4a', '2409:40c2:101a:bc3e:f82f:69ff:fea3:90bd', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:101a:bc3e:f82f:69ff:fea3:90bd\\\"}', '2026-01-07 11:40:37', '2026-01-07 11:40:37', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(192, 24, 'tt4m25juo49ve0in53lihjimjh', '2409:40c2:101a:bc3e:f82f:69ff:fea3:90bd', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:101a:bc3e:f82f:69ff:fea3:90bd\\\"}', '2026-01-07 11:40:38', '2026-01-07 11:41:12', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(193, 21, '2igr1lpbuvio4nakfoiv90dogb', '152.59.63.216', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"152.59.63.216\\\"}', '2026-01-07 11:41:41', '2026-01-07 11:41:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(194, 15, 'fofbp49ho6qq35je54gvms4dqm', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-08 01:44:46', '2026-01-08 09:21:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(195, 1, '2vp5adq8sbo1p1rkvgg8p17eon', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-08 09:22:19', '2026-01-08 09:22:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(196, 15, 'j0s02501si701j7jmtmr9cdkop', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-08 09:22:58', '2026-01-08 10:10:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(197, 1, 'sr15hvvp9a19piee3cua4kg4m1', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-08 13:45:16', '2026-01-08 13:58:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(198, 1, 'cfcaqkm3fkj1utd49sgfpaacf2', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-08 13:58:37', '2026-01-08 14:23:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(199, 1, 'dnv08lrba3iia1gr5djq9sphui', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-08 19:43:22', '2026-01-08 22:43:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(200, 1, 'hoffo2krobo7bsb20g5d2g58km', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-08 22:43:58', '2026-01-09 00:03:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(201, 1, 'qtpmtld4u6jumfh1btaj2i51rb', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-09 00:02:43', '2026-01-09 00:04:44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(202, 1, 'dshjifcnde2h37egrucau0iku1', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-09 00:08:32', '2026-01-09 15:21:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(203, 25, 's3eb2c7vc17qu0i085ilalq586', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-09 15:21:58', '2026-01-09 15:22:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(204, 1, 'cipmv5a5qcl8lf0g9a02niv51p', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-09 15:22:43', '2026-01-09 16:36:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(205, 25, '36pft0g1jp18hddiuilpeameqh', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-09 16:38:48', '2026-01-09 17:00:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(206, 1, '3p4upukn22pls9ncsmeci1ms57', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-09 17:01:07', '2026-01-09 17:01:23', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(207, 25, '1p4ml17affgf9pqaaoghd55gb1', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-09 17:01:49', '2026-01-09 17:03:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(208, 1, 'mt9ljlqarug62c1019gg24kp0d', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-09 17:03:24', '2026-01-09 17:03:42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(209, 25, '5s8mi9m3jm3lk0jhim9pdugj6c', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-09 17:04:12', '2026-01-09 17:04:26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(210, 1, 'u0dh5tq6641a5n0u5i3hsiva6a', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"API Error\\\"}', '2026-01-09 21:28:12', '2026-01-09 21:28:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(211, 25, 'lcgq8ja2sunb8vfnjvjl1aoggm', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"API Error\\\"}', '2026-01-09 21:28:58', '2026-01-09 21:30:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(212, 1, 'idhfq2cf6pdsnfqgo08fugm8v8', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-09 21:31:36', '2026-01-09 21:33:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(213, 25, 'as7rdm04elqvtq3jg939n4h7k2', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"API Error\\\"}', '2026-01-09 21:34:35', '2026-01-10 00:53:35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(214, 1, '0h6j38outk6ho4ih7sb7aejpu7', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\",\\\"latitude\\\":\\\"18.5401344\\\",\\\"longitude\\\":\\\"73.8557952\\\",\\\"gps_precision\\\":\\\"exact\\\"}', '2026-01-10 00:54:38', '2026-01-10 00:56:37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(215, 25, '62jvqoeqg8ugoupbjjgkqddlfr', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\",\\\"latitude\\\":\\\"18.5401344\\\",\\\"longitude\\\":\\\"73.8557952\\\",\\\"gps_precision\\\":\\\"exact\\\"}', '2026-01-10 00:57:35', '2026-01-10 00:57:35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(216, 1, 'lfd11aai3113l9mu7roudjqd20', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\",\\\"latitude\\\":\\\"18.4539041\\\",\\\"longitude\\\":\\\"73.8200633\\\",\\\"gps_precision\\\":\\\"exact\\\"}', '2026-01-10 00:58:25', '2026-01-10 01:08:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(217, 1, 'roiiaic24afkrkl5i8m7h4att9', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\",\\\"latitude\\\":\\\"18.5401344\\\",\\\"longitude\\\":\\\"73.8557952\\\",\\\"gps_precision\\\":\\\"exact\\\"}', '2026-01-10 01:09:04', '2026-01-10 01:09:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(218, 1, 'u0agq20d2al2eu0qevefrttkaa', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\",\\\"latitude\\\":\\\"18.5401344\\\",\\\"longitude\\\":\\\"73.8557952\\\",\\\"gps_precision\\\":\\\"exact\\\"}', '2026-01-10 01:12:37', '2026-01-10 01:19:38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(219, 1, '9d020ik9lpia3psc6ea0785955', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\"}', '2026-01-10 01:20:25', '2026-01-10 01:32:38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(220, 1, '7dr8ktj90nk25nk2ddda1ob4id', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-10 01:33:54', '2026-01-10 01:33:59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(221, 25, 'lf55k54sbhcic9lpba2bcfgtqn', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-10 01:35:43', '2026-01-10 01:35:43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(222, 1, 'mjeg4gnibhc6oetbst53ifrbn4', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-10 01:36:31', '2026-01-10 01:36:35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(223, 1, 'ah3kftpepdqt1d82rucrbq1qsb', '::1', '{\\\"status\\\":\\\"fail\\\",\\\"message\\\":\\\"reserved range\\\",\\\"query\\\":\\\"::1\\\",\\\"latitude\\\":\\\"18.5401344\\\",\\\"longitude\\\":\\\"73.8557952\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-10 01:57:31', '2026-01-10 08:49:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(224, 1, 'pu1r00bp2fpngtnp2nkluh64q8', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.5401344\\\",\\\"longitude\\\":\\\"73.8557952\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-10 08:51:09', '2026-01-10 09:04:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(225, 25, 'nf9ffhkd17rs1nnq31q790fuhf', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"17.6700736\\\",\\\"longitude\\\":\\\"75.9010467\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-12 15:01:24', '2026-01-12 16:33:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(226, 1, 'totik5st386llrqt8dcrf5oo47', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.4493462\\\",\\\"longitude\\\":\\\"73.8255196\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-12 16:38:35', '2026-01-12 17:04:30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(227, 1, '89t34b1t8ubh9ohb317rivnlbo', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"17.6700736\\\",\\\"longitude\\\":\\\"75.9010467\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-13 00:46:43', '2026-01-13 00:46:43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(228, 1, 'ee44knp3fr53epapca7l0jdn09', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"21.13536\\\",\\\"longitude\\\":\\\"79.0822912\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-14 02:05:35', '2026-01-14 02:06:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(229, 25, 'uip0028hqd9qpqem8n6k62n2fc', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"21.13536\\\",\\\"longitude\\\":\\\"79.0822912\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-14 02:06:12', '2026-01-14 02:11:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(230, 25, '1ivo6j0bahoslkumc1s2gutoe4', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"21.13536\\\",\\\"longitude\\\":\\\"79.0822912\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-14 02:11:48', '2026-01-14 02:11:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(231, 25, 'nl0nklp6crr6irvf4a3u8g5u3i', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"21.13536\\\",\\\"longitude\\\":\\\"79.0822912\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-14 02:12:27', '2026-01-14 02:12:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(232, 1, '8d38ass5hpddb1oebvjuftrec2', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"21.13536\\\",\\\"longitude\\\":\\\"79.0822912\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-14 02:13:43', '2026-01-14 02:14:32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(233, 7, 'ur6ok7kpt5d2amjb005ubdq0me', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"21.13536\\\",\\\"longitude\\\":\\\"79.0822912\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-14 02:14:59', '2026-01-14 02:25:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(234, 1, 'kr6sqp5i0bo7ichdlarrgetqjg', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"21.13536\\\",\\\"longitude\\\":\\\"79.0822912\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-14 02:25:45', '2026-01-14 02:25:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(235, 1, 'rqsqes5rgov7okrnhvgsf9eg37', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"21.13536\\\",\\\"longitude\\\":\\\"79.0822912\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-14 02:30:06', '2026-01-14 02:30:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(236, 1, '9oembl6kkjo1p78iva2q0hp5di', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.442116301000766\\\",\\\"longitude\\\":\\\"73.82603260200155\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-17 10:06:01', '2026-01-17 10:07:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(237, 25, 'apdasuogdjtnep1gtopf1kpt24', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"21.1365\\\",\\\"longitude\\\":\\\"79.0962\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-17 10:08:41', '2026-01-17 10:09:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(238, 21, 'sgjieqv3eh49u7ma1cpammd0u8', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.44212\\\",\\\"longitude\\\":\\\"73.82607986885246\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-17 10:10:47', '2026-01-17 10:11:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(239, 25, 'l59218ltbaf5qpg43kpd0h7jec', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.442116301000766\\\",\\\"longitude\\\":\\\"73.82603260200155\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-17 10:11:22', '2026-01-17 10:13:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(240, 21, '1llic44h8nb9r7qrbqsla95qgs', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.442126138906467\\\",\\\"longitude\\\":\\\"73.82602447795664\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-17 10:13:50', '2026-01-17 10:16:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(241, 1, '98th38mun4colnjnvjg7dodsck', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"21.1365\\\",\\\"longitude\\\":\\\"79.0962\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-17 10:16:33', '2026-01-17 10:17:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(242, 21, 'lk1u379mmje3ujces1orkseb3i', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.442115\\\",\\\"longitude\\\":\\\"73.82603\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-17 10:17:28', '2026-01-17 10:17:35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(243, 25, 'n8f7j78vpqnqhrr0ljmpj6mmuq', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.442128932842653\\\",\\\"longitude\\\":\\\"73.8260219647669\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-17 10:18:17', '2026-01-17 10:30:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(244, 1, 'eulhnngev8cahu1kveeoque5p4', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.442116301000766\\\",\\\"longitude\\\":\\\"73.82603260200155\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-17 10:31:11', '2026-01-17 12:29:17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(245, 25, 'p80a50f3uc4fl8tq2emjvgs5fu', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.44925016594929\\\",\\\"longitude\\\":\\\"73.8256214601002\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-17 12:31:37', '2026-01-17 12:32:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(246, 1, 'qhbq2g9a11igi8ktjnp736f716', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.44925016594929\\\",\\\"longitude\\\":\\\"73.8256214601002\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-17 12:34:28', '2026-01-17 13:41:45', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(247, 25, 'mfb1bohak6513hmojo1ckf1ghh', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.44925016594929\\\",\\\"longitude\\\":\\\"73.8256214601002\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-17 13:42:15', '2026-01-17 13:42:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(248, 1, '9bbfqc92o0fmva54q6d6jet45k', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.44925016594929\\\",\\\"longitude\\\":\\\"73.8256214601002\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-17 13:43:26', '2026-01-17 13:48:17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(249, 25, 'fq1tq9oorgv94fvatoq0dbhcie', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.44925016594929\\\",\\\"longitude\\\":\\\"73.8256214601002\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-17 13:48:36', '2026-01-17 13:48:44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(250, 1, 'dclaekjpuqgm55mcsf8l7k9vu7', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.449205379399142\\\",\\\"longitude\\\":\\\"73.82562192390557\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-17 13:49:20', '2026-01-18 01:06:38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(251, 25, 'i0sukeokmpkpke5pla72i075rk', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.453911662339053\\\",\\\"longitude\\\":\\\"73.82014560672161\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-18 01:07:49', '2026-01-18 01:19:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out');
INSERT INTO `user_activity` (`id`, `user_id`, `session_id`, `ip_address`, `location_data`, `login_time`, `last_activity`, `device_info`, `status`) VALUES
(252, 25, 'klhk5fka4crfdc9cq82hn9fnb7', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.45393575476338\\\",\\\"longitude\\\":\\\"73.82011723502445\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-18 01:19:27', '2026-01-18 01:46:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(253, 1, '575cad36bm916k2kbd8qfba24a', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.45393575476338\\\",\\\"longitude\\\":\\\"73.82011723502445\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-18 01:46:55', '2026-01-18 02:04:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(254, 1, 'fkk6d8sorur9m3sio2mm4re5cm', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.45388213995435\\\",\\\"longitude\\\":\\\"73.82007970541088\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-18 18:50:11', '2026-01-18 18:50:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(255, 25, 'a735iu5j0pscn6mqf1dab2uqml', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.453971735669448\\\",\\\"longitude\\\":\\\"73.8198764955881\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-18 18:51:16', '2026-01-18 18:51:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(256, 1, 'vk5sv96qnkbiivq4hm6tis2ja2', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.45393575476338\\\",\\\"longitude\\\":\\\"73.82011723502445\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-18 18:51:50', '2026-01-18 20:49:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(257, 25, 'kfb7hck2ivrbk9og1t99aiii56', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.45390624715726\\\",\\\"longitude\\\":\\\"73.8201889389692\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-18 20:50:40', '2026-01-18 23:26:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(258, 1, 'sbqnc6s0lvbrsovt0a553pgehh', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.45381457188494\\\",\\\"longitude\\\":\\\"73.8202249301558\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-18 23:26:16', '2026-01-18 23:48:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(259, 1, 'frbrmq2o2rilq4lqd3bqqkvsr9', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.453952916811552\\\",\\\"longitude\\\":\\\"73.81997376260125\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-19 00:29:36', '2026-01-19 00:30:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(262, 1, '7hko6np8gcd419thhq9eu88dq3', '::1', '{\\\"status\\\":\\\"success\\\",\\\"city\\\":\\\"Localhost\\\",\\\"country\\\":\\\"Local Machine\\\",\\\"service_provider\\\":\\\"Internal\\\",\\\"latitude\\\":\\\"18.453949\\\",\\\"longitude\\\":\\\"73.820107\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-20 02:36:29', '2026-01-20 02:38:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(263, 1, 'j7j373k6tnc92e1eesnrehsu8k', '2409:40c2:110:ada6:b958:d202:a76:be64', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:110:ada6:b958:d202:a76:be64\\\"}', '2026-01-19 21:14:01', '2026-01-19 21:16:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(264, 25, 'h3bkucpcq2e66f4lr61nf023km', '2409:40c2:110:ada6:b958:d202:a76:be64', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:110:ada6:b958:d202:a76:be64\\\"}', '2026-01-19 21:17:07', '2026-01-19 21:17:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(265, 1, '8e5p3g56ogq1nebvvkro9i9rgk', '2409:40c2:110:ada6:b958:d202:a76:be64', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:110:ada6:b958:d202:a76:be64\\\",\\\"latitude\\\":\\\"18.453949\\\",\\\"longitude\\\":\\\"73.820107\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-19 21:26:40', '2026-01-19 21:28:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(266, 25, 'sbkjhsp87293n934onvaprhjus', '2409:40c2:110:ada6:b958:d202:a76:be64', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:110:ada6:b958:d202:a76:be64\\\",\\\"latitude\\\":\\\"18.453949\\\",\\\"longitude\\\":\\\"73.820107\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-19 21:28:31', '2026-01-19 21:29:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(267, 1, '9iqpu3m75c00m1410g2210thbl', '2409:40c2:110:ada6:b958:d202:a76:be64', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:110:ada6:b958:d202:a76:be64\\\",\\\"latitude\\\":\\\"18.453949\\\",\\\"longitude\\\":\\\"73.820107\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-19 21:29:54', '2026-01-19 21:36:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(268, 22, 'go5bq6nh994v2vcfmboamu75fi', '2409:40c2:101c:40f4:2471:67ff:fe37:7938', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:101c:40f4:2471:67ff:fe37:7938\\\",\\\"latitude\\\":\\\"18.4431057\\\",\\\"longitude\\\":\\\"73.8332513\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-19 21:36:00', '2026-01-19 21:38:21', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(269, 30, 'hlk04jk8hk008f44cir6lds550', '2409:40c2:110:ada6:b958:d202:a76:be64', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:110:ada6:b958:d202:a76:be64\\\",\\\"latitude\\\":\\\"18.453949\\\",\\\"longitude\\\":\\\"73.820107\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-19 21:37:12', '2026-01-19 21:39:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(270, 1, 'p8pukj1juknricomb7q1aga3c4', '2409:40c2:110:ada6:b958:d202:a76:be64', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:110:ada6:b958:d202:a76:be64\\\",\\\"latitude\\\":\\\"18.453949\\\",\\\"longitude\\\":\\\"73.820107\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-19 21:40:38', '2026-01-19 21:43:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(271, 30, '9bgbir1ionfr8spl9q8iukmul3', '2409:40c2:110:ada6:b958:d202:a76:be64', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:110:ada6:b958:d202:a76:be64\\\",\\\"latitude\\\":\\\"18.453949\\\",\\\"longitude\\\":\\\"73.820107\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-19 21:52:24', '2026-01-19 21:52:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(272, 1, '3ovtiab4f2ndhf42aojvr45k71', '2409:40c2:110:ada6:b958:d202:a76:be64', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:110:ada6:b958:d202:a76:be64\\\",\\\"latitude\\\":\\\"18.453949\\\",\\\"longitude\\\":\\\"73.820107\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-19 21:53:02', '2026-01-19 21:53:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(273, 25, 'qjvda0n1h4avqetnf5ig4pft3q', '2409:40c2:110:ada6:b958:d202:a76:be64', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:110:ada6:b958:d202:a76:be64\\\",\\\"latitude\\\":\\\"18.453949\\\",\\\"longitude\\\":\\\"73.820107\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-19 21:54:10', '2026-01-19 21:55:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(274, 1, 'ic6v60evehanporqgvt75l94af', '2409:40c2:110:ada6:c27:465d:1b1d:b6f3', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:110:ada6:c27:465d:1b1d:b6f3\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-20 05:02:34', '2026-01-20 05:03:45', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(275, 21, 'j2uq8175d1irivs6bq81jjkuf7', '2409:40c2:640a:da3a:bccc:63a2:d84a:e6f5', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nashik\\\",\\\"zip\\\":\\\"422003\\\",\\\"lat\\\":20.0024,\\\"lon\\\":73.7945,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:640a:da3a:bccc:63a2:d84a:e6f5\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-20 05:49:56', '2026-01-20 05:50:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(276, 24, 'q16srsdhgf3b59ttdvm2behov3', '2409:40c2:104f:1156:d89c:ce32:a1a9:b74c', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411002\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:104f:1156:d89c:ce32:a1a9:b74c\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-20 05:50:57', '2026-01-20 05:50:57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(277, 24, 'tnk79ot70bm6ob5o8n6f82j2s0', '2409:40c2:104f:1156:d89c:ce32:a1a9:b74c', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411002\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:104f:1156:d89c:ce32:a1a9:b74c\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-20 05:50:58', '2026-01-20 06:26:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(278, 17, 'i4880sr1ajd115nqrlcs80nj1f', '2401:4900:7c80:f237:84f:f88f:6da7:fff5', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:7c80:f237:84f:f88f:6da7:fff5\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-20 05:53:52', '2026-01-20 06:01:43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36 Edg/143.0.0.0', 'active'),
(279, 15, '4ci9n7880d7jvsnf041olqvml5', '2401:4900:7c80:f237:694c:2f50:d857:7a15', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:7c80:f237:694c:2f50:d857:7a15\\\",\\\"geo_error\\\":\\\"Skipped by User\\\"}', '2026-01-20 05:55:28', '2026-01-20 05:55:39', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(280, 15, '960ric40i6t683u5a9d67ghai6', '2401:4900:7c80:f237:cc7c:c4f:30c5:39f', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:7c80:f237:cc7c:c4f:30c5:39f\\\",\\\"latitude\\\":\\\"18.5246091\\\",\\\"longitude\\\":\\\"73.8786239\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-20 05:57:52', '2026-01-20 06:02:44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:147.0) Gecko/20100101 Firefox/147.0', 'active'),
(281, 22, 'r6v5bme4o0ubs7pmkhn4gk6tjk', '2409:40c2:101c:40f4:d82e:ccff:fec8:bc09', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:101c:40f4:d82e:ccff:fec8:bc09\\\",\\\"latitude\\\":\\\"18.443311\\\",\\\"longitude\\\":\\\"73.8330627\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-20 08:04:41', '2026-01-20 08:07:26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(282, 14, 'vj25phochgjp3vdm0palf9h0s2', '2409:40c2:705d:c76e:8000::', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"P\\\\u0101lam\\\",\\\"zip\\\":\\\"431720\\\",\\\"lat\\\":19.0181,\\\"lon\\\":76.9456,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:705d:c76e:8000::\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-20 08:31:26', '2026-01-20 08:31:40', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(283, 25, 'b26s0cvg90lajrpr04htrphkme', '2401:4900:5317:e4cd:6d67:893c:2fd3:fd1a', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411017\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:5317:e4cd:6d67:893c:2fd3:fd1a\\\",\\\"latitude\\\":\\\"18.4433119\\\",\\\"longitude\\\":\\\"73.8330709\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-20 09:10:42', '2026-01-20 09:12:10', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', 'logged_out'),
(284, 12, 'rn51lg721em0j8kd3dt28c5tjd', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-20 09:11:25', '2026-01-20 09:15:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(285, 1, 'q164cojfkt60nv1csa5kfpfdcq', '2409:40c2:101c:40f4:814e:e622:3150:34b3', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:101c:40f4:814e:e622:3150:34b3\\\",\\\"latitude\\\":\\\"18.4433119\\\",\\\"longitude\\\":\\\"73.8330709\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-20 09:13:28', '2026-01-20 09:14:34', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Mobile Safari/537.36', 'active'),
(286, 19, '9767drk9rusqaii6fq9pl5sssv', '2409:40c2:300a:7d80:70c2:d58c:1f2e:ec54', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413006\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:300a:7d80:70c2:d58c:1f2e:ec54\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-20 09:37:43', '2026-01-20 09:39:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(287, 18, 'k6tqeaco60u127lp4g5eehp464', '2409:40c2:1e:2f7d:8000::', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1e:2f7d:8000::\\\",\\\"latitude\\\":\\\"18.4492279\\\",\\\"longitude\\\":\\\"73.8256042\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-20 09:42:27', '2026-01-20 09:42:40', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(288, 21, '1v8b8lkga9li63c5hfitvudf3b', '2409:40c2:104f:1156:b82f:e589:6f9c:dfaf', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411002\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:104f:1156:b82f:e589:6f9c:dfaf\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-20 11:01:17', '2026-01-20 11:01:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(289, 21, 'chjpgh0sv4liohoquenr7nd2f5', '2409:40c2:640a:da3a:9d6a:b873:a1ae:9a2', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nashik\\\",\\\"zip\\\":\\\"422003\\\",\\\"lat\\\":20.0024,\\\"lon\\\":73.7945,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:640a:da3a:9d6a:b873:a1ae:9a2\\\",\\\"latitude\\\":\\\"18.44933830723474\\\",\\\"longitude\\\":\\\"73.8255132007481\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 05:37:37', '2026-01-21 05:37:43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(290, 12, 'ejl8mgvmm9h151rdeti10m95a1', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-21 06:11:30', '2026-01-21 07:09:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(291, 15, 'k9h59ki8vi3h3ohj86g8dmnl69', '2401:4900:c0aa:88b3:e9f3:dac1:f1e1:f892', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411013\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:c0aa:88b3:e9f3:dac1:f1e1:f892\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-21 06:46:13', '2026-01-21 06:46:33', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(292, 1, '338ok3u2asq9f8id0s5l7jm666', '2401:4900:1c45:11cf:d7ff:eb0d:dac6:ebd8', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS24560 Bharti Airtel Ltd., Telemedia Services\\\",\\\"query\\\":\\\"2401:4900:1c45:11cf:d7ff:eb0d:dac6:ebd8\\\",\\\"latitude\\\":\\\"18.4453553\\\",\\\"longitude\\\":\\\"73.8337031\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 06:55:00', '2026-01-21 06:55:36', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(293, 8, '31umkbpehjrh1efmjn3kf16t5i', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\",\\\"latitude\\\":\\\"18.448897\\\",\\\"longitude\\\":\\\"73.825409\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 06:55:20', '2026-01-21 06:59:59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(294, 24, 'n3aqb08rvtq3mh8lu567d58dqs', '2409:40c2:640a:da3a:2848:5a4a:8916:4ca', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nashik\\\",\\\"zip\\\":\\\"422003\\\",\\\"lat\\\":20.0024,\\\"lon\\\":73.7945,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:640a:da3a:2848:5a4a:8916:4ca\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-21 06:56:49', '2026-01-21 06:57:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(295, 14, 'kp68tj3i5f8p7h76g7aogi9iat', '2409:40c2:705d:c76e:9d0b:7ad5:d5c2:3f60', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"P\\\\u0101lam\\\",\\\"zip\\\":\\\"431720\\\",\\\"lat\\\":19.0181,\\\"lon\\\":76.9456,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:705d:c76e:9d0b:7ad5:d5c2:3f60\\\",\\\"latitude\\\":\\\"18.44933830723474\\\",\\\"longitude\\\":\\\"73.8255132007481\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 10:08:26', '2026-01-21 10:08:30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(296, 1, 'e6ec2hgp46pria4ccb53p4hkd4', '2401:4900:1c45:11cf:d7ff:eb0d:dac6:ebd8', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS24560 Bharti Airtel Ltd., Telemedia Services\\\",\\\"query\\\":\\\"2401:4900:1c45:11cf:d7ff:eb0d:dac6:ebd8\\\",\\\"latitude\\\":\\\"18.4453463\\\",\\\"longitude\\\":\\\"73.8337024\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 10:14:45', '2026-01-21 10:14:45', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(297, 1, 'bqme1s381tf9r1e9v04nc1nhnd', '2401:4900:1c45:11cf:d7ff:eb0d:dac6:ebd8', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS24560 Bharti Airtel Ltd., Telemedia Services\\\",\\\"query\\\":\\\"2401:4900:1c45:11cf:d7ff:eb0d:dac6:ebd8\\\",\\\"latitude\\\":\\\"18.4453463\\\",\\\"longitude\\\":\\\"73.8337024\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 10:14:47', '2026-01-21 10:15:08', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(298, 1, '3jt4nhehkq51tlnpghh4221um6', '2401:4900:1c45:11cf:53fc:e007:ce5f:7db9', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS24560 Bharti Airtel Ltd., Telemedia Services\\\",\\\"query\\\":\\\"2401:4900:1c45:11cf:53fc:e007:ce5f:7db9\\\",\\\"latitude\\\":\\\"18.4453407\\\",\\\"longitude\\\":\\\"73.8337205\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 10:24:25', '2026-01-21 10:37:53', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(299, 1, 'ft65gphsgttfjn50i23akhp9jr', '2409:40c2:129c:f6ac:11d2:cf91:8bc3:fe5', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:129c:f6ac:11d2:cf91:8bc3:fe5\\\",\\\"latitude\\\":\\\"18.453949\\\",\\\"longitude\\\":\\\"73.820107\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 10:38:53', '2026-01-21 10:40:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(300, 1, 'es9n6pn9o3r2rs504bmhf6r625', '2409:4081:12:2eb9:cf03:a13f:f2fe:14e3', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:4081:12:2eb9:cf03:a13f:f2fe:14e3\\\",\\\"latitude\\\":\\\"18.4453418\\\",\\\"longitude\\\":\\\"73.8337109\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 10:41:54', '2026-01-21 10:53:22', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(301, 24, 'sqguh98hngesg7194h3ornlhlc', '2409:40c2:100b:45b:a8dc:3340:9c7c:dbd4', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:100b:45b:a8dc:3340:9c7c:dbd4\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-21 10:50:19', '2026-01-21 10:50:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(302, 1, '3sph72h2hgjpvbmacvd88596t1', '2409:4081:12:2eb9:cf03:a13f:f2fe:14e3', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:4081:12:2eb9:cf03:a13f:f2fe:14e3\\\",\\\"latitude\\\":\\\"18.4453336\\\",\\\"longitude\\\":\\\"73.833713\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 10:57:21', '2026-01-21 10:57:21', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(303, 1, 'rao39fotm5h5uj2r0jcs0pcsmq', '2409:4081:12:2eb9:cf03:a13f:f2fe:14e3', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:4081:12:2eb9:cf03:a13f:f2fe:14e3\\\",\\\"latitude\\\":\\\"18.4453336\\\",\\\"longitude\\\":\\\"73.833713\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 10:57:21', '2026-01-21 10:58:03', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(304, 1, 'ao82m63gbcotj7mr52tu8s2al2', '2409:4081:12:2eb9:cf03:a13f:f2fe:14e3', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:4081:12:2eb9:cf03:a13f:f2fe:14e3\\\",\\\"latitude\\\":\\\"18.4453336\\\",\\\"longitude\\\":\\\"73.833713\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 11:03:19', '2026-01-21 11:03:33', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(305, 1, 'sat2q8s894vurssl58e1ca0s4d', '2409:4081:12:2eb9:cf03:a13f:f2fe:14e3', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:4081:12:2eb9:cf03:a13f:f2fe:14e3\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-21 11:05:28', '2026-01-21 11:18:48', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(306, 17, 'ekqj6c2o9tg82np56jqroelgjg', '2402:3a80:c95:86bf:5588:366b:3876:e940', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Vodafone Idea Ltd.\\\",\\\"org\\\":\\\"Vodafone Idea Ltd.\\\",\\\"as\\\":\\\"AS38266 Vodafone Idea Ltd\\\",\\\"query\\\":\\\"2402:3a80:c95:86bf:5588:366b:3876:e940\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-21 11:10:27', '2026-01-21 11:10:35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'logged_out'),
(307, 1, 'm34nsd05kfe5j34iac2mmsdvpg', '2409:40c2:129c:f6ac:11d2:cf91:8bc3:fe5', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:129c:f6ac:11d2:cf91:8bc3:fe5\\\",\\\"latitude\\\":\\\"18.453949\\\",\\\"longitude\\\":\\\"73.820107\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 12:01:21', '2026-01-21 12:22:30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(308, 25, 'mdldroqmfa6egn79leqpuuum3v', '2409:4081:12:2eb9:60b2:c384:3619:26cf', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:4081:12:2eb9:60b2:c384:3619:26cf\\\",\\\"latitude\\\":\\\"18.444977882844643\\\",\\\"longitude\\\":\\\"73.8339029188246\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 14:04:13', '2026-01-21 14:18:27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(309, 1, 'mhdo42e6t5j9hs10b2f71phpev', '2409:4081:12:2eb9:60b2:c384:3619:26cf', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:4081:12:2eb9:60b2:c384:3619:26cf\\\",\\\"latitude\\\":\\\"18.445150543711783\\\",\\\"longitude\\\":\\\"73.83399994509129\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 14:19:05', '2026-01-21 14:27:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(310, 25, 'sd60jhvhhho989h030815ctcn5', '2409:4081:12:2eb9:60b2:c384:3619:26cf', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:4081:12:2eb9:60b2:c384:3619:26cf\\\",\\\"latitude\\\":\\\"18.44504869019269\\\",\\\"longitude\\\":\\\"73.83401042854044\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 14:31:57', '2026-01-21 14:33:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'logged_out'),
(311, 25, 'ej4tasa8kgfqos43su7aggd7os', '2401:4900:ad43:60ac:b53a:3038:88bf:b881', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411015\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:ad43:60ac:b53a:3038:88bf:b881\\\",\\\"latitude\\\":\\\"18.4447802\\\",\\\"longitude\\\":\\\"73.8338108\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-21 15:44:31', '2026-01-21 15:45:36', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(312, 25, '76opdnca0oncq4asjh6p4ge1et', '2401:4900:1c45:11cf:ec87:ed2c:13d1:646a', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS24560 Bharti Airtel Ltd., Telemedia Services\\\",\\\"query\\\":\\\"2401:4900:1c45:11cf:ec87:ed2c:13d1:646a\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-21 17:57:37', '2026-01-21 17:58:07', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(313, 19, 'iru5qe2hd07lldclilm4k4q8qr', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-22 05:12:41', '2026-01-22 05:13:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(314, 21, 'n9rpguokv33oa08u0lvmgi592m', '2409:40c2:1016:daea:6007:2e85:d4be:a0f', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1016:daea:6007:2e85:d4be:a0f\\\",\\\"latitude\\\":\\\"18.44914154616402\\\",\\\"longitude\\\":\\\"73.82571530480554\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-22 05:54:48', '2026-01-22 06:00:39', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active');
INSERT INTO `user_activity` (`id`, `user_id`, `session_id`, `ip_address`, `location_data`, `login_time`, `last_activity`, `device_info`, `status`) VALUES
(315, 24, '1vr5g6jkictpdmo6efv9vji0ng', '2409:40c2:1016:daea:bc23:51b3:76c4:2438', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1016:daea:bc23:51b3:76c4:2438\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-22 06:01:58', '2026-01-22 06:18:42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(316, 18, 't5u9ie6pfdtbmf6vpor2ttefco', '2409:40c2:3103:34e:cbde:c696:4f42:c28c', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413002\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:3103:34e:cbde:c696:4f42:c28c\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-22 06:45:56', '2026-01-22 06:46:04', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(317, 17, 'ds3qr8ad5hl2tkj8en40engea4', '2401:4900:5615:4bb0:aca5:2013:50a4:2254', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:5615:4bb0:aca5:2013:50a4:2254\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-22 07:03:58', '2026-01-22 07:35:52', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'logged_out'),
(318, 12, 'th7er38qcht3p2maoov30fj4nb', '2409:40c2:1010:92ef:409d:a52:46bc:b0c6', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1010:92ef:409d:a52:46bc:b0c6\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-22 07:32:52', '2026-01-22 07:32:57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(319, 22, '5a0v4oadls3c36b9ok8ghoip3m', '2409:40c2:102b:98ec:8000::', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411015\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:102b:98ec:8000::\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-22 08:16:09', '2026-01-22 08:16:09', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Mobile Safari/537.36', 'active'),
(320, 22, 'vn9lb5kdd47av8b05cl033f8m3', '2409:40c2:102b:98ec:8000::', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411015\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:102b:98ec:8000::\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-22 08:16:25', '2026-01-22 08:16:26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/143.0.0.0 Safari/537.36', 'active'),
(321, 1, 'c4777dbp4nf2f111qmng40p0eg', '2401:4900:1c44:9e03:b063:f3ea:5ca7:e758', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS24560 Bharti Airtel Ltd., Telemedia Services\\\",\\\"query\\\":\\\"2401:4900:1c44:9e03:b063:f3ea:5ca7:e758\\\",\\\"latitude\\\":\\\"18.4453514\\\",\\\"longitude\\\":\\\"73.8337043\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-23 06:41:10', '2026-01-23 06:46:00', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(322, 24, 'q9hvaljghmlkviesqe61cgv3if', '2409:40c2:102a:48e2:45dc:e2d9:9f14:5fbf', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411015\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:102a:48e2:45dc:e2d9:9f14:5fbf\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-23 07:14:43', '2026-01-23 07:14:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(323, 1, 'dmocs6gfbfanth5c071b3glhm5', '2409:40c2:305f:364d:5a87:428e:d511:5a08', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413002\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:305f:364d:5a87:428e:d511:5a08\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-23 08:29:02', '2026-01-23 08:29:02', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(324, 1, 'cfb452d6fljinfh8ku7vqopfvg', '2409:40c2:305f:364d:5a87:428e:d511:5a08', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413002\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:305f:364d:5a87:428e:d511:5a08\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-23 08:29:02', '2026-01-23 08:29:03', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(325, 1, 'an8iim2dfd9d98lme07fuuoefc', '2409:40c2:305f:364d:5a87:428e:d511:5a08', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413002\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:305f:364d:5a87:428e:d511:5a08\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-23 08:29:03', '2026-01-23 08:29:03', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(326, 1, '459hs4k3itllspdoinqi3f3s6l', '2409:40c2:305f:364d:5a87:428e:d511:5a08', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413002\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:305f:364d:5a87:428e:d511:5a08\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-23 08:29:04', '2026-01-23 08:29:16', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(327, 25, 'sfhph0jn7edv85mf05rdp1j5n1', '2409:40c2:305f:364d:30cc:7a27:6c49:2dc7', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413002\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:305f:364d:30cc:7a27:6c49:2dc7\\\",\\\"latitude\\\":\\\"18.449205379399142\\\",\\\"longitude\\\":\\\"73.82562192390557\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-23 08:37:23', '2026-01-23 09:57:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'logged_out'),
(328, 25, 'b37tg40of3kinfnb7urb92qk3i', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\",\\\"latitude\\\":\\\"18.449270042349447\\\",\\\"longitude\\\":\\\"73.82561745499781\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-23 09:58:33', '2026-01-23 09:58:40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'logged_out'),
(329, 13, 'bno28df04vb264652n7m8t2srg', '2409:40c2:842e:b9f3:5ac:ad89:e788:cc48', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Aurangabad\\\",\\\"zip\\\":\\\"431001\\\",\\\"lat\\\":19.8776,\\\"lon\\\":75.3423,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:842e:b9f3:5ac:ad89:e788:cc48\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-27 06:06:24', '2026-01-27 06:06:24', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(330, 13, 'h9rcfe33n4qhdfdk5r7s8bmim5', '2409:40c2:842e:b9f3:5ac:ad89:e788:cc48', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Aurangabad\\\",\\\"zip\\\":\\\"431001\\\",\\\"lat\\\":19.8776,\\\"lon\\\":75.3423,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:842e:b9f3:5ac:ad89:e788:cc48\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-27 06:06:25', '2026-01-27 11:06:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(331, 12, 'gvcvd8ms1sicbiett7vach2tmn', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\",\\\"geo_error\\\":\\\"Skipped by User\\\"}', '2026-01-27 06:12:04', '2026-01-27 06:51:19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(332, 21, 'oif9c8jkisnfpbk6hmhm5tin3q', '2409:40c2:3156:8471:f8a3:9850:53fe:e52f', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413002\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:3156:8471:f8a3:9850:53fe:e52f\\\",\\\"latitude\\\":\\\"18.44923997403269\\\",\\\"longitude\\\":\\\"73.82562463276693\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-27 06:14:38', '2026-01-27 06:16:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(333, 24, 'gr9h6ci6klt82dd37792qb5c98', '2409:40c2:2c:856a:c57d:e1ea:9875:85f9', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440010\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:2c:856a:c57d:e1ea:9875:85f9\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-27 06:16:13', '2026-01-27 06:19:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(334, 21, 'a4j6mbfr8oifg4glvsm5ueak00', '2409:40c2:3156:8471:f8a3:9850:53fe:e52f', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413002\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:3156:8471:f8a3:9850:53fe:e52f\\\",\\\"latitude\\\":\\\"18.449026836417186\\\",\\\"longitude\\\":\\\"73.82571451712991\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-27 06:18:30', '2026-01-27 06:18:30', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(335, 17, '369va9dh4bfqjp4f9rl31871un', '2401:4900:c0b7:3c93:611f:bbad:e99e:2f3', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411013\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:c0b7:3c93:611f:bbad:e99e:2f3\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-01-27 06:22:24', '2026-01-27 06:23:35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'active'),
(336, 25, '92mt47m2tcta8r92chp4elm00u', '2409:40c2:f:4fac:c4b9:b7a:74b9:41b1', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440003\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:f:4fac:c4b9:b7a:74b9:41b1\\\",\\\"latitude\\\":\\\"18.449245906853225\\\",\\\"longitude\\\":\\\"73.82562101956778\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-27 07:10:44', '2026-01-27 07:12:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'logged_out'),
(337, 1, 'n2a6160uabp1lvmgeu304amgmg', '2409:40c2:f:4fac:c4b9:b7a:74b9:41b1', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440003\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:f:4fac:c4b9:b7a:74b9:41b1\\\",\\\"latitude\\\":\\\"18.449245906853225\\\",\\\"longitude\\\":\\\"73.82562101956778\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-27 07:38:32', '2026-01-27 07:38:42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'active'),
(338, 1, 'h5ibfgg6gr2m45fd3jf6ql4ebq', '2409:40c2:f:4fac:d48e:328a:80e3:5231', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440003\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:f:4fac:d48e:328a:80e3:5231\\\",\\\"latitude\\\":\\\"18.449245906853225\\\",\\\"longitude\\\":\\\"73.82562101956778\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-27 08:08:46', '2026-01-27 08:08:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'active'),
(339, 1, 'pog1raf6f3sh1iusrh9erh5207', '2409:40c2:1058:3a9c:18af:d334:99c7:c97b', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1058:3a9c:18af:d334:99c7:c97b\\\",\\\"latitude\\\":\\\"18.449214156354465\\\",\\\"longitude\\\":\\\"73.82561911670619\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-27 10:50:48', '2026-01-27 10:52:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'logged_out'),
(340, 20, '9rksi71a2arrtli245uacj6253', '2409:40c2:1058:3a9c:18af:d334:99c7:c97b', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1058:3a9c:18af:d334:99c7:c97b\\\",\\\"latitude\\\":\\\"18.449246209142274\\\",\\\"longitude\\\":\\\"73.82562287980807\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-27 10:52:35', '2026-01-27 10:54:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(341, 21, '36cqjqupnvkd8m1f5o8mg9c153', '47.11.5.98', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440002\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio infocomm ltd\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"47.11.5.98\\\",\\\"latitude\\\":\\\"21.1524\\\",\\\"longitude\\\":\\\"79.0805\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-27 11:26:25', '2026-01-27 11:26:36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(342, 1, 'ujnqmh79d53oi1ib1gk33d144m', '2409:40c2:201e:9e8:b889:2ecd:551f:c302', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"GA\\\",\\\"regionName\\\":\\\"Goa\\\",\\\"city\\\":\\\"Panjim\\\",\\\"zip\\\":\\\"403001\\\",\\\"lat\\\":15.5016,\\\"lon\\\":73.8234,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:201e:9e8:b889:2ecd:551f:c302\\\",\\\"latitude\\\":\\\"18.44273519100665\\\",\\\"longitude\\\":\\\"73.83462115376153\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-28 06:18:18', '2026-01-28 07:17:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(343, 13, 'l941tt0njfigl9qm9ljcclcqqd', '2409:40c2:315b:8fce:ec22:3ef6:1d8e:e2f4', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413002\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:315b:8fce:ec22:3ef6:1d8e:e2f4\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-28 07:04:22', '2026-01-28 07:04:39', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(344, 12, '3nahr727cohgo8npcj7a73i6km', '2409:40c2:1026:8ee2:706d:317e:1fdb:e7b2', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1026:8ee2:706d:317e:1fdb:e7b2\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-28 08:21:05', '2026-01-28 08:21:12', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(345, 19, 'j83l6dq6m316qm2s30jp5r6pur', '2409:40c2:f:4fac:1d36:8a42:1504:45ec', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440003\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:f:4fac:1d36:8a42:1504:45ec\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-28 11:10:43', '2026-01-28 11:11:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(346, 13, '6v7nal47b033q9h0sati5v77bt', '2409:40c2:315b:8fce:9de:6376:6e1a:ac5a', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413002\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:315b:8fce:9de:6376:6e1a:ac5a\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-29 06:38:01', '2026-01-30 06:25:37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(347, 21, '8506qbvj9gncp3kss7ftct43kv', '2409:40c2:106:4fba:2894:c793:8960:f997', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440001\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:106:4fba:2894:c793:8960:f997\\\",\\\"latitude\\\":\\\"18.44933830723474\\\",\\\"longitude\\\":\\\"73.8255132007481\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-29 07:31:36', '2026-01-29 07:32:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(348, 25, 'q6ucs3pc46r9hf5jj57kopv56v', '2409:40c2:111:d7f8:949e:a68c:60b5:b268', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:111:d7f8:949e:a68c:60b5:b268\\\",\\\"latitude\\\":\\\"18.449245906853225\\\",\\\"longitude\\\":\\\"73.82562101956778\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-29 07:36:33', '2026-01-29 07:36:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'active'),
(349, 19, '1dlp9ssik99g5ostef510lc4oo', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-30 05:10:58', '2026-01-30 05:11:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(350, 25, 'frqj5iu045lgm6tb25o98dj8ga', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\",\\\"latitude\\\":\\\"18.449193069593477\\\",\\\"longitude\\\":\\\"73.82551469977801\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-30 06:13:54', '2026-01-30 06:13:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'active'),
(351, 25, 'o8mg2708ou1ae4nbqltaiodibo', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\",\\\"latitude\\\":\\\"18.449193069593477\\\",\\\"longitude\\\":\\\"73.82551469977801\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-30 06:14:04', '2026-01-30 06:14:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'active'),
(352, 25, 'k6ed2tgu00qtvetrh8eja9pt59', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\",\\\"latitude\\\":\\\"18.449193069593477\\\",\\\"longitude\\\":\\\"73.82551469977801\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-30 06:14:10', '2026-01-30 06:22:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'active'),
(353, 1, 'v1jnu47uu68jdb1ltjq22j55bm', '2409:40c2:3103:cd79:64da:781a:6159:7998', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413002\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:3103:cd79:64da:781a:6159:7998\\\",\\\"latitude\\\":\\\"18.44926592246541\\\",\\\"longitude\\\":\\\"73.82562371372477\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-01-30 06:28:08', '2026-01-30 06:33:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(354, 12, 'clsiqe5q8k61hc66n0b0spf8cu', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-30 06:35:11', '2026-01-30 06:35:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(355, 13, 'dm4va13ll4lc7gs9687fcm964q', '2409:40c2:5047:223e:6963:cdb1:2fe:f29c', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Kolh\\\\u0101pur\\\",\\\"zip\\\":\\\"416122\\\",\\\"lat\\\":16.6956,\\\"lon\\\":74.2317,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:5047:223e:6963:cdb1:2fe:f29c\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-01-30 11:24:45', '2026-01-30 11:37:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(356, 13, '6h7gdhdvdt736uiapmg44k62hk', '2409:40c2:3003:8ccb:8546:96ad:92a4:a2a2', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413006\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:3003:8ccb:8546:96ad:92a4:a2a2\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-02-02 05:54:30', '2026-02-03 18:08:38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(357, 12, '4s5kpb7o7deml18aej2egpsi8a', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-02-02 05:58:34', '2026-02-02 05:58:43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(358, 25, 'rfd3niljp4qlmrnjhnsqno68ps', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\",\\\"latitude\\\":\\\"18.449094068700322\\\",\\\"longitude\\\":\\\"73.82560050514385\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-02-02 06:01:08', '2026-02-02 06:01:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'active'),
(359, 17, '6flm649fls461ougv62h9bm7g9', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-02-02 08:06:03', '2026-02-02 08:07:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'active'),
(360, 21, '7boacaqa5fb2vnvkjtu05clcvr', '2409:40c2:2d:afa9:40b9:ad28:b9f3:2f9d', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440010\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:2d:afa9:40b9:ad28:b9f3:2f9d\\\",\\\"latitude\\\":\\\"18.445522\\\",\\\"longitude\\\":\\\"73.8274995\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-02-03 06:35:46', '2026-02-03 06:43:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(361, 13, '74ma7q6ht1uom5qmumuok5bon4', '103.112.10.89', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Kopargaon\\\",\\\"zip\\\":\\\"423601\\\",\\\"lat\\\":19.8766,\\\"lon\\\":74.4801,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Speedmaxx Digital Networks Pvt Ltd\\\",\\\"org\\\":\\\"Speedmaxx Digital Networks Pvt Ltd\\\",\\\"as\\\":\\\"AS137169 Speedmaxx Digital Networks Pvt Ltd\\\",\\\"query\\\":\\\"103.112.10.89\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-02-03 18:31:24', '2026-02-03 18:53:19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(362, 1, 'kk7es1f1vp97oqru7j146q49um', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\",\\\"latitude\\\":\\\"18.44912063074927\\\",\\\"longitude\\\":\\\"73.8256040883564\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-02-04 06:10:39', '2026-02-04 06:16:35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'active'),
(363, 13, 'fpqupcnh2imer2rnmbk46kj7hk', '2409:40c2:105a:8ea7:142b:cb0a:4ed0:b5bc', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:105a:8ea7:142b:cb0a:4ed0:b5bc\\\",\\\"geo_error\\\":\\\"User Denied Permission\\\"}', '2026-02-04 06:45:01', '2026-02-04 06:45:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(364, 1, '970gufj27vsj6hoq59tfifvrbm', '49.248.216.237', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Mumbai\\\",\\\"zip\\\":\\\"400017\\\",\\\"lat\\\":19.0748,\\\"lon\\\":72.8856,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tata Teleservices (Maharashtra) Ltd\\\",\\\"org\\\":\\\"Cesr IPS\\\",\\\"as\\\":\\\"AS17762 Tata Teleservices Maharashtra Ltd\\\",\\\"query\\\":\\\"49.248.216.237\\\",\\\"latitude\\\":\\\"18.449246209142274\\\",\\\"longitude\\\":\\\"73.82562287980807\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-02-04 07:30:16', '2026-02-04 07:31:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'logged_out'),
(365, 1, 'ej18k73qvng7mj5640hl1vv4u9', '2409:40c2:201f:2c2:a50d:ccf7:c3d7:c030', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"GA\\\",\\\"regionName\\\":\\\"Goa\\\",\\\"city\\\":\\\"Panjim\\\",\\\"zip\\\":\\\"403001\\\",\\\"lat\\\":15.5016,\\\"lon\\\":73.8234,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:201f:2c2:a50d:ccf7:c3d7:c030\\\",\\\"latitude\\\":\\\"18.44313585057284\\\",\\\"longitude\\\":\\\"73.8339819462022\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-02-06 05:40:18', '2026-02-06 05:40:42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(366, 1, '3us740go3dj57cr0pd5j29rv1v', '2409:40c2:5401:2485:8d19:e8d0:a296:6432', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Kolh\\\\u0101pur\\\",\\\"zip\\\":\\\"416122\\\",\\\"lat\\\":16.6956,\\\"lon\\\":74.2317,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:5401:2485:8d19:e8d0:a296:6432\\\",\\\"latitude\\\":\\\"18.44320096622011\\\",\\\"longitude\\\":\\\"73.83441840042894\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-02-06 16:39:26', '2026-02-06 16:58:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(367, 1, 'ovnholbij46rq5dm490uaj570g', '2401:4900:acbd:35b6:1d60:d13f:cc8b:eee6', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:acbd:35b6:1d60:d13f:cc8b:eee6\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-02-08 13:55:37', '2026-02-08 13:55:43', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'logged_out'),
(368, 1, 'nta5rufl67hrffla8q7g0ju1kc', '2401:4900:acbd:35b6:3445:4a2:40c3:2b82', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:acbd:35b6:3445:4a2:40c3:2b82\\\",\\\"latitude\\\":\\\"19.1122961\\\",\\\"longitude\\\":\\\"73.9713857\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-02-08 17:02:46', '2026-02-08 17:03:26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(369, 1, 'o00rpp3rspk23krooi7hc6le3f', '2409:40c2:3154:bcd:3455:a684:570f:276', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413002\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:3154:bcd:3455:a684:570f:276\\\",\\\"latitude\\\":\\\"18.443269971729674\\\",\\\"longitude\\\":\\\"73.83422822515891\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-02-09 07:25:08', '2026-02-10 08:58:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(370, 1, 'c4imodclpvgg132k57335gvf5b', '2409:40c2:106:8c00:c13e:69fe:6f9e:6c4b', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440001\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:106:8c00:c13e:69fe:6f9e:6c4b\\\",\\\"latitude\\\":\\\"18.44898482164906\\\",\\\"longitude\\\":\\\"73.82451157034527\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-02-10 09:01:04', '2026-02-10 13:49:27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(371, 1, 'vkv1cc5hksujru93233a876g3b', '2409:40c2:2504:ffc:7dc5:1246:ba73:f450', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"GA\\\",\\\"regionName\\\":\\\"Goa\\\",\\\"city\\\":\\\"Panjim\\\",\\\"zip\\\":\\\"403004\\\",\\\"lat\\\":15.5016,\\\"lon\\\":73.8234,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:2504:ffc:7dc5:1246:ba73:f450\\\",\\\"latitude\\\":\\\"18.443306500000002\\\",\\\"longitude\\\":\\\"73.83413875\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-02-12 09:45:02', '2026-02-12 10:01:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(372, 12, '7lgvncofsis3l5ovoc0jf59jgb', '2409:40c2:11b:f3ef:bd06:3a9e:426b:3252', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:11b:f3ef:bd06:3a9e:426b:3252\\\",\\\"geo_error\\\":\\\"Skipped by User\\\"}', '2026-02-12 11:18:48', '2026-02-12 11:18:48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active');
INSERT INTO `user_activity` (`id`, `user_id`, `session_id`, `ip_address`, `location_data`, `login_time`, `last_activity`, `device_info`, `status`) VALUES
(373, 12, 'rvl21lol2h2f4uml053j9g7r2i', '2409:40c2:11b:f3ef:bd06:3a9e:426b:3252', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440008\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:11b:f3ef:bd06:3a9e:426b:3252\\\",\\\"geo_error\\\":\\\"Skipped by User\\\"}', '2026-02-12 11:18:48', '2026-02-12 11:18:48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(374, 1, 'eqtfro6r5grbptkmmc8n5bmvq1', '223.233.86.150', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Ltd.\\\",\\\"as\\\":\\\"AS24560 Bharti Airtel Ltd., Telemedia Services\\\",\\\"query\\\":\\\"223.233.86.150\\\",\\\"latitude\\\":\\\"18.4453597\\\",\\\"longitude\\\":\\\"73.8337035\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-02-12 12:52:17', '2026-02-12 13:09:28', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(375, 1, '1uajrpvtgo4993jigqlopqv1ea', '2409:40c2:2046:ae8c:44a5:9e4f:a45b:15e', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"GA\\\",\\\"regionName\\\":\\\"Goa\\\",\\\"city\\\":\\\"Panjim\\\",\\\"zip\\\":\\\"403004\\\",\\\"lat\\\":15.5016,\\\"lon\\\":73.8234,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:2046:ae8c:44a5:9e4f:a45b:15e\\\",\\\"latitude\\\":\\\"18.443722\\\",\\\"longitude\\\":\\\"73.83353\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-02-12 15:01:28', '2026-02-12 15:15:03', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'active'),
(376, 1, '5opqduon27rjic4jdh4sv4v45a', '2409:40c2:2046:ae8c:44a5:9e4f:a45b:15e', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"GA\\\",\\\"regionName\\\":\\\"Goa\\\",\\\"city\\\":\\\"Panjim\\\",\\\"zip\\\":\\\"403004\\\",\\\"lat\\\":15.5016,\\\"lon\\\":73.8234,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:2046:ae8c:44a5:9e4f:a45b:15e\\\",\\\"latitude\\\":\\\"18.4433185\\\",\\\"longitude\\\":\\\"73.83388550000001\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-02-12 15:22:13', '2026-02-12 16:35:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36 Edg/144.0.0.0', 'active'),
(377, 1, 'pn7srbfdergmpesg7nu8rdvje6', '2409:40c2:304b:43f0:6113:fe15:8d06:a0d2', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413006\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:304b:43f0:6113:fe15:8d06:a0d2\\\",\\\"latitude\\\":\\\"17.6686\\\",\\\"longitude\\\":\\\"75.3197\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-02-16 08:21:04', '2026-02-16 08:21:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'active'),
(378, 1, '1a4dmtrd0hib4trqu8l8529lbt', '2409:40c2:1012:9a60:eaaf:f27c:83:13e7', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411002\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1012:9a60:eaaf:f27c:83:13e7\\\",\\\"latitude\\\":\\\"18.449337\\\",\\\"longitude\\\":\\\"73.8255488\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-02-25 05:46:39', '2026-02-25 05:46:55', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'active'),
(379, 1, 'hj39ne75q226q8hk2a5kkeu0tn', '2409:40c2:29:18f8:716e:4d:26e0:205', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440002\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:29:18f8:716e:4d:26e0:205\\\",\\\"latitude\\\":\\\"18.442871198472943\\\",\\\"longitude\\\":\\\"73.83427500984659\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-02-26 17:25:17', '2026-02-26 17:25:27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'active'),
(380, 1, '5j30cb27m064nsl0ur55c1evvg', '2409:40c2:200e:7b30:18ab:f98f:e98b:b887', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"GA\\\",\\\"regionName\\\":\\\"Goa\\\",\\\"city\\\":\\\"Panjim\\\",\\\"zip\\\":\\\"403001\\\",\\\"lat\\\":15.5016,\\\"lon\\\":73.8234,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:200e:7b30:18ab:f98f:e98b:b887\\\",\\\"latitude\\\":\\\"18.443232763566346\\\",\\\"longitude\\\":\\\"73.8339698741869\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-03-02 05:20:02', '2026-03-02 06:53:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'active'),
(381, 1, 'l6r4i6htdkcg2gth4bbba0uvv3', '42.108.236.174', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Vodafone Essar Limited-Value Added Services\\\",\\\"org\\\":\\\"Hutchison Max Telecom Limited\\\",\\\"as\\\":\\\"AS38266 Vodafone Idea Ltd\\\",\\\"query\\\":\\\"42.108.236.174\\\",\\\"latitude\\\":\\\"18.443127178077027\\\",\\\"longitude\\\":\\\"73.83410826454859\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-03-09 12:47:55', '2026-03-09 13:30:44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'active'),
(382, 1, 'j559hicu5thb16maiai6cg80t8', '2402:3a80:1bf6:8fba:ec7f:e039:76ad:bce2', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Vodafone Idea Ltd.\\\",\\\"org\\\":\\\"Vodafone Idea Ltd.\\\",\\\"as\\\":\\\"AS38266 Vodafone Idea Ltd\\\",\\\"query\\\":\\\"2402:3a80:1bf6:8fba:ec7f:e039:76ad:bce2\\\",\\\"latitude\\\":\\\"18.44344836099968\\\",\\\"longitude\\\":\\\"73.83405742654196\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-03-11 18:54:43', '2026-03-11 18:56:48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'logged_out'),
(383, 22, 'fa3o39r5nssqotrdspmqvdlmm9', '2402:3a80:1bf6:8fba:ec7f:e039:76ad:bce2', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411006\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Vodafone Idea Ltd.\\\",\\\"org\\\":\\\"Vodafone Idea Ltd.\\\",\\\"as\\\":\\\"AS38266 Vodafone Idea Ltd\\\",\\\"query\\\":\\\"2402:3a80:1bf6:8fba:ec7f:e039:76ad:bce2\\\",\\\"latitude\\\":\\\"18.443395917432458\\\",\\\"longitude\\\":\\\"73.83408929153016\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-03-11 18:57:37', '2026-03-11 18:58:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'logged_out'),
(384, 1, 'ogjjgms7pas12to864f4rkreji', '2409:40c2:311d:dfbd:8f4:65b5:cc1b:1d66', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413002\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:311d:dfbd:8f4:65b5:cc1b:1d66\\\",\\\"latitude\\\":\\\"18.44874\\\",\\\"longitude\\\":\\\"73.825851\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-03-27 06:45:56', '2026-03-27 06:56:42', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'logged_out'),
(385, 1, 'e6a14g7dbf9ja83dm1pv3fcb3c', '2409:40c2:105d:c6fc:d06a:5464:944a:c2c1', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411018\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:105d:c6fc:d06a:5464:944a:c2c1\\\",\\\"latitude\\\":\\\"18.443293675941362\\\",\\\"longitude\\\":\\\"73.83463065229641\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-03-29 17:04:50', '2026-03-29 17:11:36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'active'),
(386, 1, 'fu29l7j95if1bc8hoo0k3lo3tj', '223.233.81.145', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Ltd.\\\",\\\"as\\\":\\\"AS24560 Bharti Airtel Ltd., Telemedia Services\\\",\\\"query\\\":\\\"223.233.81.145\\\",\\\"latitude\\\":\\\"18.445314537672363\\\",\\\"longitude\\\":\\\"73.83396838036535\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-03-30 15:22:44', '2026-03-30 15:23:17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'logged_out'),
(387, 1, 'v0dudt6861cv0umpv6uksi4uvs', '2409:40c2:6008:c5c7:fdde:f378:1dfc:d300', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nashik\\\",\\\"zip\\\":\\\"422003\\\",\\\"lat\\\":20.0024,\\\"lon\\\":73.7945,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:6008:c5c7:fdde:f378:1dfc:d300\\\",\\\"latitude\\\":\\\"18.449007\\\",\\\"longitude\\\":\\\"73.824379\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-03-31 07:39:06', '2026-03-31 07:56:38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'active'),
(388, 31, 'afcb669qpqf327sji76f6qm7m1', '2409:40c2:305e:7a21:3c82:3e40:4d10:d2e9', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413006\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:305e:7a21:3c82:3e40:4d10:d2e9\\\",\\\"latitude\\\":\\\"18.4487677\\\",\\\"longitude\\\":\\\"73.8248135\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-03-31 07:50:59', '2026-03-31 07:51:00', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Mobile Safari/537.36', 'active'),
(389, 31, '2tqd7rkdf1ulbnp105lk2tfm7a', '2409:40c2:305e:7a21:3c82:3e40:4d10:d2e9', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413006\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:305e:7a21:3c82:3e40:4d10:d2e9\\\",\\\"latitude\\\":\\\"18.4487677\\\",\\\"longitude\\\":\\\"73.8248135\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-03-31 07:51:29', '2026-03-31 07:51:30', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', 'logged_out'),
(390, 31, 'ke5gkgdg1ftcmd7ph7cjkctqmb', '2409:40c2:305e:7a21:8ca0:be3c:be95:8041', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Solapur\\\",\\\"zip\\\":\\\"413006\\\",\\\"lat\\\":17.6735,\\\"lon\\\":75.9051,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:305e:7a21:8ca0:be3c:be95:8041\\\",\\\"geo_error\\\":\\\"Unknown Error\\\"}', '2026-03-31 07:52:01', '2026-03-31 07:53:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'logged_out'),
(391, 1, 'sa18kleq06atda7ep6tb7budp0', '2409:40c2:1294:6558:c84:90d0:9e91:d333', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411002\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1294:6558:c84:90d0:9e91:d333\\\",\\\"latitude\\\":\\\"18.44297740603511\\\",\\\"longitude\\\":\\\"73.83429633880114\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-04-05 14:49:59', '2026-04-05 14:50:45', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'active'),
(392, 1, 'vltkim1mta3hdbj1cb7b7pd829', '223.233.81.241', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Ltd.\\\",\\\"as\\\":\\\"AS24560 Bharti Airtel Ltd., Telemedia Services\\\",\\\"query\\\":\\\"223.233.81.241\\\",\\\"latitude\\\":\\\"18.44518366666667\\\",\\\"longitude\\\":\\\"73.83385600000001\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-04-05 16:39:55', '2026-04-05 16:39:55', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'active'),
(393, 1, '9mqrk69ia1djrh9ps3hf2eia7l', '223.233.81.241', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Ltd.\\\",\\\"as\\\":\\\"AS24560 Bharti Airtel Ltd., Telemedia Services\\\",\\\"query\\\":\\\"223.233.81.241\\\",\\\"latitude\\\":\\\"18.445331627268583\\\",\\\"longitude\\\":\\\"73.83392247118502\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-04-05 16:41:37', '2026-04-05 16:49:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'active'),
(394, 1, '40jl2bi4vq2uao3m19ak6ah918', '113.193.243.12', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Tikona Infinet Ltd.\\\",\\\"org\\\":\\\"Tikona Digital Networks Pvt.Ltd\\\",\\\"as\\\":\\\"AS45528 Tikona Infinet Ltd.\\\",\\\"query\\\":\\\"113.193.243.12\\\",\\\"latitude\\\":\\\"18.562895583701827\\\",\\\"longitude\\\":\\\"73.91726581554009\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-04-06 08:30:33', '2026-04-06 08:46:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'active'),
(395, 1, 'uprjchpai116187ri97943ion1', '223.233.84.24', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Limited\\\",\\\"org\\\":\\\"Bharti Airtel Ltd.\\\",\\\"as\\\":\\\"AS24560 Bharti Airtel Ltd., Telemedia Services\\\",\\\"query\\\":\\\"223.233.84.24\\\",\\\"latitude\\\":\\\"18.445127\\\",\\\"longitude\\\":\\\"73.834183\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-04-11 09:03:25', '2026-04-11 09:13:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'active'),
(396, 1, '4cqge468r3tqae0hd06u1k8p79', '2401:4900:1c44:d4ea:8afd:de8e:71e:aeca', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411007\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS24560 Bharti Airtel Ltd., Telemedia Services\\\",\\\"query\\\":\\\"2401:4900:1c44:d4ea:8afd:de8e:71e:aeca\\\",\\\"latitude\\\":\\\"18.4453514\\\",\\\"longitude\\\":\\\"73.8337055\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-04-11 09:14:41', '2026-04-11 09:15:46', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'active'),
(397, 1, '8oqldtt7667fbmanfjtk28lpo2', '2409:40c2:205a:ac7b:c8ac:207f:57a0:1d9e', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"GA\\\",\\\"regionName\\\":\\\"Goa\\\",\\\"city\\\":\\\"Mapusa\\\",\\\"zip\\\":\\\"403507\\\",\\\"lat\\\":15.5906,\\\"lon\\\":73.8105,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:205a:ac7b:c8ac:207f:57a0:1d9e\\\",\\\"latitude\\\":\\\"18.4432172\\\",\\\"longitude\\\":\\\"73.8348669\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-05-03 09:07:31', '2026-05-03 09:07:31', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'active'),
(398, 1, 'rik2a3tpactorqneo4vnhfk7rp', '2409:40c2:205a:ac7b:c8ac:207f:57a0:1d9e', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"GA\\\",\\\"regionName\\\":\\\"Goa\\\",\\\"city\\\":\\\"Mapusa\\\",\\\"zip\\\":\\\"403507\\\",\\\"lat\\\":15.5906,\\\"lon\\\":73.8105,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:205a:ac7b:c8ac:207f:57a0:1d9e\\\",\\\"latitude\\\":\\\"18.4432172\\\",\\\"longitude\\\":\\\"73.8348669\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-05-03 09:07:32', '2026-05-03 09:14:04', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'active'),
(399, 1, '25mgsb92m46n3tv923vf9tqimi', '2409:40c2:205a:ac7b:c8ac:207f:57a0:1d9e', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"GA\\\",\\\"regionName\\\":\\\"Goa\\\",\\\"city\\\":\\\"Mapusa\\\",\\\"zip\\\":\\\"403507\\\",\\\"lat\\\":15.5906,\\\"lon\\\":73.8105,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:205a:ac7b:c8ac:207f:57a0:1d9e\\\",\\\"latitude\\\":\\\"18.4432172\\\",\\\"longitude\\\":\\\"73.8348669\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-05-03 09:16:23', '2026-05-03 09:16:26', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', 'active'),
(400, 1, 'nsi96r20fl4g051448j4a5hen5', '2409:40c2:2e:341c:ddae:30af:8f63:e3a6', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Nagpur\\\",\\\"zip\\\":\\\"440016\\\",\\\"lat\\\":21.1463,\\\"lon\\\":79.0849,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:2e:341c:ddae:30af:8f63:e3a6\\\",\\\"latitude\\\":\\\"18.443043090958255\\\",\\\"longitude\\\":\\\"73.83390884992049\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-06-14 14:36:11', '2026-06-14 14:41:45', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'active'),
(401, 1, '60k22golhphi45aurb6nk7s2kk', '2409:40c2:5005:1b14:708d:e7bd:32db:d3d6', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Kolh\\\\u0101pur\\\",\\\"zip\\\":\\\"416216\\\",\\\"lat\\\":16.6956,\\\"lon\\\":74.2317,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:5005:1b14:708d:e7bd:32db:d3d6\\\",\\\"latitude\\\":\\\"18.44318834766559\\\",\\\"longitude\\\":\\\"73.83375896976096\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-06-18 07:11:02', '2026-06-18 07:14:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'active'),
(402, 1, 'ofh1i2i2j3t7931lbvnpo72qci', '2401:4900:79d0:b27d:497:cfff:fedb:46ce', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:79d0:b27d:497:cfff:fedb:46ce\\\",\\\"latitude\\\":\\\"19.1835709\\\",\\\"longitude\\\":\\\"77.0306809\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-06-19 07:45:26', '2026-06-19 07:45:27', 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Mobile Safari/537.36', 'active'),
(403, 1, 'sdsmnk5v8lqr32mll5gf1pcnff', '2401:4900:79d0:b27d:497:cfff:fedb:46ce', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:79d0:b27d:497:cfff:fedb:46ce\\\",\\\"geo_error\\\":\\\"Request Timed Out\\\"}', '2026-06-19 07:45:59', '2026-06-19 07:46:34', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'logged_out'),
(404, 1, '98qulrfmeuc8eb8mbgafmt9lp3', '2401:4900:79e0:13a3:7c31:64ff:fe08:bff3', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411005\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:79e0:13a3:7c31:64ff:fe08:bff3\\\",\\\"latitude\\\":\\\"19.1869848\\\",\\\"longitude\\\":\\\"77.0295699\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-06-20 12:30:56', '2026-06-20 12:36:45', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'active'),
(405, 1, 'rild2jbpv7jt3l88s8b52u7n4v', '2401:4900:79e0:13a3:552f:9285:4ed6:49e8', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411005\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:79e0:13a3:552f:9285:4ed6:49e8\\\",\\\"latitude\\\":\\\"18.5344\\\",\\\"longitude\\\":\\\"73.883\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-06-20 12:39:31', '2026-06-20 12:50:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'active'),
(406, 1, 'gkah0ff4cbe809gu45th511ae3', '2401:4900:79d3:60e1:1c90:a75a:2201:54c0', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:79d3:60e1:1c90:a75a:2201:54c0\\\",\\\"latitude\\\":\\\"19.187531\\\",\\\"longitude\\\":\\\"77.029442\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-06-20 16:26:01', '2026-06-20 17:00:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'active'),
(407, 1, 'qv80b4688r572plihifq5p17re', '2401:4900:57cb:adc7:996a:f12a:c1f9:5751', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:57cb:adc7:996a:f12a:c1f9:5751\\\",\\\"latitude\\\":\\\"18.445178442920827\\\",\\\"longitude\\\":\\\"73.82336056279728\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-06-26 07:25:09', '2026-06-26 07:29:50', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'active'),
(408, 1, '3hn9e7jiv55g54hbv8a98j5kg3', '2401:4900:ad26:118:1cbd:8955:6e89:3294', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:ad26:118:1cbd:8955:6e89:3294\\\",\\\"latitude\\\":\\\"18.44530463025675\\\",\\\"longitude\\\":\\\"73.82340598536331\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-07-02 18:26:52', '2026-07-02 18:40:18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'logged_out'),
(409, 1, 'bci9l9i76f3b2dfine44sch58c', '2409:40c2:1033:ebeb:75f2:c341:8f08:1335', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411002\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"org\\\":\\\"Reliance Jio Infocomm Limited\\\",\\\"as\\\":\\\"AS55836 Reliance Jio Infocomm Limited\\\",\\\"query\\\":\\\"2409:40c2:1033:ebeb:75f2:c341:8f08:1335\\\",\\\"latitude\\\":\\\"18.444754\\\",\\\"longitude\\\":\\\"73.828894\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-07-02 18:27:14', '2026-07-02 18:45:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'active'),
(410, 1, '1om837cgbkmj548218snuvqojv', '2401:4900:ad26:118:1cbd:8955:6e89:3294', '{\\\"status\\\":\\\"success\\\",\\\"country\\\":\\\"India\\\",\\\"countryCode\\\":\\\"IN\\\",\\\"region\\\":\\\"MH\\\",\\\"regionName\\\":\\\"Maharashtra\\\",\\\"city\\\":\\\"Pune\\\",\\\"zip\\\":\\\"411001\\\",\\\"lat\\\":18.5211,\\\"lon\\\":73.8502,\\\"timezone\\\":\\\"Asia\\\\/Kolkata\\\",\\\"isp\\\":\\\"Bharti Airtel Ltd\\\",\\\"org\\\":\\\"Bharti Airtel Limited\\\",\\\"as\\\":\\\"AS45609 Bharti Airtel Ltd. AS for GPRS Service\\\",\\\"query\\\":\\\"2401:4900:ad26:118:1cbd:8955:6e89:3294\\\",\\\"latitude\\\":\\\"18.44530463025675\\\",\\\"longitude\\\":\\\"73.82340598536331\\\",\\\"gps_precision\\\":\\\"exact\\\",\\\"source\\\":\\\"GPS\\\"}', '2026-07-02 18:44:04', '2026-07-02 18:44:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `user_stickers`
--

CREATE TABLE `user_stickers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `verification_code` (`verification_code`);

--
-- Indexes for table `bill_items`
--
ALTER TABLE `bill_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_id` (`bill_id`);

--
-- Indexes for table `calendar_events`
--
ALTER TABLE `calendar_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `verification_code` (`verification_code`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `chat_groups`
--
ALTER TABLE `chat_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_users`
--
ALTER TABLE `client_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `company_calendar`
--
ALTER TABLE `company_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finance_records`
--
ALTER TABLE `finance_records`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_applications`
--
ALTER TABLE `leave_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_balances`
--
ALTER TABLE `leave_balances`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_type` (`employee_id`,`leave_type`);

--
-- Indexes for table `legal_documents`
--
ALTER TABLE `legal_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `marketing_calendar`
--
ALTER TABLE `marketing_calendar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `receiver_id` (`receiver_id`);

--
-- Indexes for table `monitoring_logs`
--
ALTER TABLE `monitoring_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`);

--
-- Indexes for table `personal_finance`
--
ALTER TABLE `personal_finance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `project_tasks`
--
ALTER TABLE `project_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `verification_code` (`verification_code`);

--
-- Indexes for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_id` (`quotation_id`);

--
-- Indexes for table `rd_files`
--
ALTER TABLE `rd_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `folder_id` (`folder_id`);

--
-- Indexes for table `rd_folders`
--
ALTER TABLE `rd_folders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `recurring_invoices`
--
ALTER TABLE `recurring_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `sales_leads`
--
ALTER TABLE `sales_leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `social_posts`
--
ALTER TABLE `social_posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`setting_key`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_activity`
--
ALTER TABLE `user_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user_stickers`
--
ALTER TABLE `user_stickers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bill_items`
--
ALTER TABLE `bill_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `calendar_events`
--
ALTER TABLE `calendar_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `chat_groups`
--
ALTER TABLE `chat_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `client_users`
--
ALTER TABLE `client_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `company_calendar`
--
ALTER TABLE `company_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `finance_records`
--
ALTER TABLE `finance_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `leave_applications`
--
ALTER TABLE `leave_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leave_balances`
--
ALTER TABLE `leave_balances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `legal_documents`
--
ALTER TABLE `legal_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marketing_calendar`
--
ALTER TABLE `marketing_calendar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `monitoring_logs`
--
ALTER TABLE `monitoring_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payroll`
--
ALTER TABLE `payroll`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_finance`
--
ALTER TABLE `personal_finance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_tasks`
--
ALTER TABLE `project_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `quotation_items`
--
ALTER TABLE `quotation_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `rd_files`
--
ALTER TABLE `rd_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rd_folders`
--
ALTER TABLE `rd_folders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `recurring_invoices`
--
ALTER TABLE `recurring_invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_leads`
--
ALTER TABLE `sales_leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `social_accounts`
--
ALTER TABLE `social_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `social_posts`
--
ALTER TABLE `social_posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user_activity`
--
ALTER TABLE `user_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;

--
-- AUTO_INCREMENT for table `user_stickers`
--
ALTER TABLE `user_stickers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bill_items`
--
ALTER TABLE `bill_items`
  ADD CONSTRAINT `bill_items_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `client_users`
--
ALTER TABLE `client_users`
  ADD CONSTRAINT `client_users_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `legal_documents`
--
ALTER TABLE `legal_documents`
  ADD CONSTRAINT `legal_documents_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `payroll`
--
ALTER TABLE `payroll`
  ADD CONSTRAINT `payroll_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_tasks`
--
ALTER TABLE `project_tasks`
  ADD CONSTRAINT `project_tasks_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD CONSTRAINT `quotation_items_ibfk_1` FOREIGN KEY (`quotation_id`) REFERENCES `quotations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `rd_files`
--
ALTER TABLE `rd_files`
  ADD CONSTRAINT `rd_files_ibfk_1` FOREIGN KEY (`folder_id`) REFERENCES `rd_folders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `recurring_invoices`
--
ALTER TABLE `recurring_invoices`
  ADD CONSTRAINT `recurring_invoices_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `social_accounts`
--
ALTER TABLE `social_accounts`
  ADD CONSTRAINT `social_accounts_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_activity`
--
ALTER TABLE `user_activity`
  ADD CONSTRAINT `user_activity_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
