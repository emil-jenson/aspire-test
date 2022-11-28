-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 28, 2022 at 07:07 PM
-- Server version: 5.7.26
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aspire_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `token` text NOT NULL,
  `abilities` text NOT NULL,
  `tokenable_id` text NOT NULL,
  `tokenable_type` text NOT NULL,
  `last_used_at` datetime DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `name`, `token`, `abilities`, `tokenable_id`, `tokenable_type`, `last_used_at`, `updated_at`, `created_at`) VALUES
(1, 'TutsForWeb', 'ab5eff58c7e56fb40849c83444869502bef90a08660dbf65c36c01f6bb80c9a3', '[\"*\"]', '2', 'App\\Models\\User', NULL, '2022-11-26 19:57:42', '2022-11-26 19:57:42'),
(2, 'TutsForWeb', '85efc8613b50a622cb6077aa22033a198b8d862c46133138f627b061e659b982', '[\"*\"]', '3', 'App\\Models\\User', NULL, '2022-11-26 20:00:06', '2022-11-26 20:00:06'),
(3, 'TutsForWeb', '9c71724cd0ac719f238328901c5a46db3819f205d54d298f830a5535e15cb498', '[\"*\"]', '4', 'App\\Models\\User', NULL, '2022-11-27 19:16:10', '2022-11-27 19:16:10'),
(4, 'TutsForWeb', '98598e3981ceb4617d0000515b04e79fd4021c83f7d8ec384c1deccc111391ac', '[\"*\"]', '5', 'App\\Models\\User', NULL, '2022-11-27 19:19:40', '2022-11-27 19:19:40'),
(5, 'TutsForWeb', '2de678c7a09398b151e5f9c669a7c98bd7464827fc25b4023e2edb1b938a981c', '[\"*\"]', '5', 'App\\Models\\User', NULL, '2022-11-27 19:19:49', '2022-11-27 19:19:49'),
(6, 'TutsForWeb', '23c2f4b044e7e1ee97abfe94d90bfef848978c410c5e079fc095a6446c107cd9', '[\"*\"]', '6', 'App\\Models\\User', NULL, '2022-11-27 19:28:16', '2022-11-27 19:28:16'),
(7, 'TutsForWeb', '33866b1800e7f3ab3ebf26c671d5f02ce60e5050141290465e42537d2ba7782a', '[\"*\"]', '6', 'App\\Models\\User', NULL, '2022-11-27 19:28:29', '2022-11-27 19:28:29'),
(8, 'TutsForWeb', 'd50a44edc2260472f678267fe9e88539f33a40b54ff93a0492e4cf14a25b6363', '[\"*\"]', '6', 'App\\Models\\User', NULL, '2022-11-27 19:30:09', '2022-11-27 19:30:09'),
(9, 'TutsForWeb', 'fe3f97260fb0ba6d97c59a1492274223f4f69a3bf1a8fe59eedd399143a5969a', '[\"*\"]', '6', 'App\\Models\\User', NULL, '2022-11-27 19:30:25', '2022-11-27 19:30:25'),
(10, 'TutsForWeb', '6fc9eef06d037c1f8ca5802a5b1eda3c1fa12a449ee4edac478b09dc3305d97e', '[\"*\"]', '7', 'App\\Models\\User', NULL, '2022-11-27 19:30:33', '2022-11-27 19:30:33'),
(11, 'TutsForWeb', '7c7133133a1a2becac3b4a40150d26e9ccfd5cd689db9e71082ce4c246a69dda', '[\"*\"]', '7', 'App\\Models\\User', NULL, '2022-11-27 19:31:00', '2022-11-27 19:31:00'),
(12, 'TutsForWeb', '9a95512a47d8ff016e81aa91512ed65007c4dfd237e4a74b66540a013ebedc7a', '[\"*\"]', '7', 'App\\Models\\User', '2022-11-28 18:49:00', '2022-11-28 18:49:00', '2022-11-27 19:42:14'),
(13, 'aspireTest', '3cfed7f2f53a8519feacdc34eeae9e254f31764637ab6a0674cd757a61dcaff2', '[\"*\"]', '7', 'App\\Models\\User', NULL, '2022-11-27 20:43:13', '2022-11-27 20:43:13'),
(14, 'aspireTest', '0ea2f1450006b7b5aa0681cf9a8b49926ce70680e7838a20f83f2e6a053f4796', '[\"*\"]', '8', 'App\\Models\\User', NULL, '2022-11-27 20:43:23', '2022-11-27 20:43:23'),
(15, 'aspireTest', '1bc77755f26e1cd4c2a10380548e60108f1b47ac381ac6b506017d5a3a1c68e4', '[\"*\"]', '8', 'App\\Models\\User', NULL, '2022-11-27 20:43:31', '2022-11-27 20:43:31'),
(16, 'aspireTest', '307eb7032b1d42e6d458e308e632cd4cef269d052456024a3b68634667656ed1', '[\"*\"]', '9', 'App\\Models\\User', NULL, '2022-11-27 20:47:21', '2022-11-27 20:47:21'),
(17, 'aspireTest', '15e4d798a7f467f1a67cc64c05c7f4c920cd0633537c2bacfed6dfbe27ffc8c6', '[\"*\"]', '9', 'App\\Models\\User', NULL, '2022-11-27 20:47:59', '2022-11-27 20:47:59'),
(18, 'aspireTest', 'a6cc9a3e26cf0b53c696091517d009f7a004ca21db7fdd7bb94c0c9ee2c446d1', '[\"*\"]', '9', 'App\\Models\\User', '2022-11-28 18:49:00', '2022-11-28 18:49:00', '2022-11-28 18:41:07'),
(19, 'aspireTest', 'be960e80de1060ca370bda337badc48018eabe9404c2ad1b59991b6768b80182', '[\"*\"]', '1', 'App\\Models\\User', NULL, '2022-11-28 19:01:16', '2022-11-28 19:01:16'),
(20, 'aspireTest', '5e4ad67e1e42188a1b5816b3003b4e3e414d04352bf3628a321249011bf42b8b', '[\"*\"]', '2', 'App\\Models\\User', NULL, '2022-11-28 19:02:01', '2022-11-28 19:02:01'),
(21, 'aspireTest', 'dd4d4a50aa01adf7a69d632324e741c500ba72965561947c66430f4df136ed73', '[\"*\"]', '2', 'App\\Models\\User', '2022-11-28 19:05:01', '2022-11-28 19:05:01', '2022-11-28 19:02:16'),
(22, 'aspireTest', '84f9e654327e050644cf53198fd2e6678933e8ecf327f78a6ef722b4a22606cc', '[\"*\"]', '1', 'App\\Models\\User', NULL, '2022-11-28 19:03:14', '2022-11-28 19:03:14'),
(23, 'aspireTest', 'a2cf120623002ffc099d69630daa7762f9e02fc0723fd3026206b7c3fa825637', '[\"*\"]', '1', 'App\\Models\\User', '2022-11-28 19:04:12', '2022-11-28 19:04:12', '2022-11-28 19:03:36');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Admin', NULL, NULL),
(2, 'Customer', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0= Inactive, 1= active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@aspire-test.com', NULL, '$2y$10$ZLLxVzYquW9aiUCMdFuHv.JOiolKj7S3uV9k8nAKlW7oajlQIvuLe', NULL, 1, 1, '2022-11-28 13:31:16', '2022-11-28 13:31:16'),
(2, 'John Doe', 'test@aspire-test.com', NULL, '$2y$10$LdrRH0qyElQoSYkoDL5WveDdE0RHBM/GQj.ojTAnyzq8kc1vzpQLi', NULL, 2, 1, '2022-11-28 13:32:01', '2022-11-28 13:32:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_loan_repayments`
--

DROP TABLE IF EXISTS `user_loan_repayments`;
CREATE TABLE IF NOT EXISTS `user_loan_repayments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loan_request_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `repayment_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `repay_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `paid_on` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_loan_repayments`
--

INSERT INTO `user_loan_repayments` (`id`, `loan_request_id`, `amount`, `repayment_date`, `status`, `repay_amount`, `paid_on`, `created_at`, `updated_at`) VALUES
(1, 1, '5000.00', '2022-12-05', 2, '5000.00', '2022-11-28 00:00:00', '2022-11-28 19:02:44', '2022-11-28 19:04:38'),
(2, 1, '5000.00', '2022-12-12', 2, '5000.00', '2022-11-28 00:00:00', '2022-11-28 19:02:44', '2022-11-28 19:05:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_loan_requests`
--

DROP TABLE IF EXISTS `user_loan_requests`;
CREATE TABLE IF NOT EXISTS `user_loan_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `loan_amount` int(11) NOT NULL,
  `term` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_loan_requests`
--

INSERT INTO `user_loan_requests` (`id`, `user_id`, `loan_amount`, `term`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 10000, 2, 4, '2022-11-28 19:02:44', '2022-11-28 19:05:01');

-- --------------------------------------------------------

--
-- Table structure for table `user_loan_statuses`
--

DROP TABLE IF EXISTS `user_loan_statuses`;
CREATE TABLE IF NOT EXISTS `user_loan_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_loan_statuses`
--

INSERT INTO `user_loan_statuses` (`id`, `value`, `created_at`, `updated_at`) VALUES
(1, 'Pending', '2022-11-28 00:00:00', '2022-11-28 00:00:00'),
(2, 'Admin approved', '2022-11-28 00:00:00', '2022-11-28 00:00:00'),
(3, 'Admin rejected', '2022-11-28 00:00:00', '2022-11-28 00:00:00'),
(4, 'Fully paid', '2022-11-28 00:00:00', '2022-11-28 00:00:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
