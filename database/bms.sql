-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2021 at 11:13 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bms`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_10_14_225956_create_raw_materials_table', 2),
(8, '2021_10_15_032227_create_units_table', 3),
(9, '2021_10_15_032228_create_products_table', 3),
(10, '2021_10_15_032715_create_product_materials_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(8, 'সল্টেস্ট', 1, '2021-10-14 23:34:25', '2021-10-14 23:34:25'),
(9, 'বাদামী', 1, '2021-10-14 23:40:34', '2021-10-14 23:40:34'),
(10, 'রিং বিস্কুট / ব্যাগের খামির', 1, '2021-10-14 23:42:29', '2021-10-14 23:42:29'),
(11, 'ডিম সোপ', 1, '2021-10-14 23:44:50', '2021-10-14 23:44:50'),
(12, 'ক্রিম', 1, '2021-10-14 23:46:51', '2021-10-14 23:46:51'),
(13, 'ডাইস বাদামি', 1, '2021-10-14 23:48:12', '2021-10-14 23:48:12'),
(14, 'মামা', 1, '2021-10-14 23:49:53', '2021-10-14 23:49:53'),
(15, 'নারকেল', 1, '2021-10-14 23:51:03', '2021-10-14 23:51:03'),
(16, 'রাক্ষসি', 1, '2021-10-14 23:56:21', '2021-10-14 23:56:21'),
(17, 'রুল ক্রিম', 1, '2021-10-14 23:57:26', '2021-10-14 23:57:26'),
(18, 'ডানিম', 1, '2021-10-14 23:58:42', '2021-10-14 23:58:42'),
(19, 'কেক / পেস্ট্রি কেক', 1, '2021-10-15 00:00:23', '2021-10-15 00:00:23'),
(20, 'সকাল সন্ধ্যা', 1, '2021-10-15 00:01:41', '2021-10-15 00:01:41'),
(21, 'টিসু কেক', 1, '2021-10-15 00:02:45', '2021-10-15 00:02:45');

-- --------------------------------------------------------

--
-- Table structure for table `product_materials`
--

CREATE TABLE `product_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `raw_material_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` double DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_materials`
--

INSERT INTO `product_materials` (`id`, `product_id`, `raw_material_id`, `unit_id`, `quantity`, `amount`, `total`, `created_at`, `updated_at`) VALUES
(52, 8, 14, NULL, NULL, NULL, NULL, '2021-10-14 23:34:25', '2021-10-14 23:34:25'),
(53, 8, 3, NULL, NULL, NULL, NULL, '2021-10-14 23:34:25', '2021-10-14 23:34:25'),
(54, 8, 4, NULL, NULL, NULL, NULL, '2021-10-14 23:34:25', '2021-10-14 23:34:25'),
(55, 8, 10, NULL, NULL, NULL, NULL, '2021-10-14 23:34:25', '2021-10-14 23:34:25'),
(56, 8, 8, NULL, NULL, NULL, NULL, '2021-10-14 23:34:25', '2021-10-14 23:34:25'),
(57, 8, 11, NULL, NULL, NULL, NULL, '2021-10-14 23:34:25', '2021-10-14 23:34:25'),
(58, 8, 9, NULL, NULL, NULL, NULL, '2021-10-14 23:34:25', '2021-10-14 23:34:25'),
(59, 8, 5, NULL, NULL, NULL, NULL, '2021-10-14 23:34:25', '2021-10-14 23:34:25'),
(60, 8, 6, NULL, NULL, NULL, NULL, '2021-10-14 23:34:25', '2021-10-14 23:34:25'),
(61, 8, 12, NULL, NULL, NULL, NULL, '2021-10-14 23:34:25', '2021-10-14 23:34:25'),
(62, 8, 13, NULL, NULL, NULL, NULL, '2021-10-14 23:34:25', '2021-10-14 23:34:25'),
(63, 9, 14, NULL, NULL, NULL, NULL, '2021-10-14 23:40:34', '2021-10-14 23:40:34'),
(64, 9, 3, NULL, NULL, NULL, NULL, '2021-10-14 23:40:34', '2021-10-14 23:40:34'),
(65, 9, 4, NULL, NULL, NULL, NULL, '2021-10-14 23:40:34', '2021-10-14 23:40:34'),
(66, 9, 10, NULL, NULL, NULL, NULL, '2021-10-14 23:40:34', '2021-10-14 23:40:34'),
(67, 9, 8, NULL, NULL, NULL, NULL, '2021-10-14 23:40:34', '2021-10-14 23:40:34'),
(68, 9, 9, NULL, NULL, NULL, NULL, '2021-10-14 23:40:34', '2021-10-14 23:40:34'),
(69, 9, 5, NULL, NULL, NULL, NULL, '2021-10-14 23:40:34', '2021-10-14 23:40:34'),
(70, 9, 6, NULL, NULL, NULL, NULL, '2021-10-14 23:40:34', '2021-10-14 23:40:34'),
(71, 10, 14, NULL, NULL, NULL, NULL, '2021-10-14 23:42:29', '2021-10-14 23:42:29'),
(72, 10, 3, NULL, NULL, NULL, NULL, '2021-10-14 23:42:29', '2021-10-14 23:42:29'),
(73, 10, 4, NULL, NULL, NULL, NULL, '2021-10-14 23:42:29', '2021-10-14 23:42:29'),
(74, 10, 10, NULL, NULL, NULL, NULL, '2021-10-14 23:42:29', '2021-10-14 23:42:29'),
(75, 10, 8, NULL, NULL, NULL, NULL, '2021-10-14 23:42:29', '2021-10-14 23:42:29'),
(76, 10, 13, NULL, NULL, NULL, NULL, '2021-10-14 23:42:29', '2021-10-14 23:42:29'),
(77, 11, 14, NULL, NULL, NULL, NULL, '2021-10-14 23:44:50', '2021-10-14 23:44:50'),
(78, 11, 3, NULL, NULL, NULL, NULL, '2021-10-14 23:44:50', '2021-10-14 23:44:50'),
(79, 11, 4, NULL, NULL, NULL, NULL, '2021-10-14 23:44:50', '2021-10-14 23:44:50'),
(80, 11, 10, NULL, NULL, NULL, NULL, '2021-10-14 23:44:50', '2021-10-14 23:44:50'),
(81, 11, 11, NULL, NULL, NULL, NULL, '2021-10-14 23:44:50', '2021-10-14 23:44:50'),
(82, 11, 6, NULL, NULL, NULL, NULL, '2021-10-14 23:44:50', '2021-10-14 23:44:50'),
(83, 11, 9, NULL, NULL, NULL, NULL, '2021-10-14 23:44:50', '2021-10-14 23:44:50'),
(84, 11, 8, NULL, NULL, NULL, NULL, '2021-10-14 23:44:50', '2021-10-14 23:44:50'),
(85, 11, 13, NULL, NULL, NULL, NULL, '2021-10-14 23:44:50', '2021-10-14 23:44:50'),
(86, 11, 15, NULL, NULL, NULL, NULL, '2021-10-14 23:44:50', '2021-10-14 23:44:50'),
(87, 12, 1, NULL, NULL, NULL, NULL, '2021-10-14 23:46:51', '2021-10-14 23:46:51'),
(88, 12, 3, NULL, NULL, NULL, NULL, '2021-10-14 23:46:51', '2021-10-14 23:46:51'),
(89, 12, 4, NULL, NULL, NULL, NULL, '2021-10-14 23:46:51', '2021-10-14 23:46:51'),
(90, 12, 10, NULL, NULL, NULL, NULL, '2021-10-14 23:46:51', '2021-10-14 23:46:51'),
(91, 12, 6, NULL, NULL, NULL, NULL, '2021-10-14 23:46:51', '2021-10-14 23:46:51'),
(92, 12, 11, NULL, NULL, NULL, NULL, '2021-10-14 23:46:51', '2021-10-14 23:46:51'),
(93, 12, 2, NULL, NULL, NULL, NULL, '2021-10-14 23:46:51', '2021-10-14 23:46:51'),
(94, 12, 8, NULL, NULL, NULL, NULL, '2021-10-14 23:46:51', '2021-10-14 23:46:51'),
(95, 13, 14, NULL, NULL, NULL, NULL, '2021-10-14 23:48:12', '2021-10-14 23:48:12'),
(96, 13, 3, NULL, NULL, NULL, NULL, '2021-10-14 23:48:12', '2021-10-14 23:48:12'),
(97, 13, 4, NULL, NULL, NULL, NULL, '2021-10-14 23:48:12', '2021-10-14 23:48:12'),
(98, 13, 10, NULL, NULL, NULL, NULL, '2021-10-14 23:48:12', '2021-10-14 23:48:12'),
(99, 13, 6, NULL, NULL, NULL, NULL, '2021-10-14 23:48:12', '2021-10-14 23:48:12'),
(100, 13, 9, NULL, NULL, NULL, NULL, '2021-10-14 23:48:12', '2021-10-14 23:48:12'),
(101, 13, 8, NULL, NULL, NULL, NULL, '2021-10-14 23:48:12', '2021-10-14 23:48:12'),
(102, 13, 5, NULL, NULL, NULL, NULL, '2021-10-14 23:48:12', '2021-10-14 23:48:12'),
(103, 14, 14, NULL, NULL, NULL, NULL, '2021-10-14 23:49:53', '2021-10-14 23:49:53'),
(104, 14, 3, NULL, NULL, NULL, NULL, '2021-10-14 23:49:53', '2021-10-14 23:49:53'),
(105, 14, 4, NULL, NULL, NULL, NULL, '2021-10-14 23:49:53', '2021-10-14 23:49:53'),
(106, 14, 10, NULL, NULL, NULL, NULL, '2021-10-14 23:49:53', '2021-10-14 23:49:53'),
(107, 14, 19, NULL, NULL, NULL, NULL, '2021-10-14 23:49:53', '2021-10-14 23:49:53'),
(108, 14, 8, NULL, NULL, NULL, NULL, '2021-10-14 23:49:53', '2021-10-14 23:49:53'),
(109, 14, 5, NULL, NULL, NULL, NULL, '2021-10-14 23:49:53', '2021-10-14 23:49:53'),
(110, 15, 14, NULL, NULL, NULL, NULL, '2021-10-14 23:51:03', '2021-10-14 23:51:03'),
(111, 15, 3, NULL, NULL, NULL, NULL, '2021-10-14 23:51:03', '2021-10-14 23:51:03'),
(112, 15, 10, NULL, NULL, NULL, NULL, '2021-10-14 23:51:03', '2021-10-14 23:51:03'),
(113, 15, 4, NULL, NULL, NULL, NULL, '2021-10-14 23:51:03', '2021-10-14 23:51:03'),
(114, 15, 20, NULL, NULL, NULL, NULL, '2021-10-14 23:51:03', '2021-10-14 23:51:03'),
(115, 15, 11, NULL, NULL, NULL, NULL, '2021-10-14 23:51:03', '2021-10-14 23:51:03'),
(116, 15, 6, NULL, NULL, NULL, NULL, '2021-10-14 23:51:03', '2021-10-14 23:51:03'),
(117, 15, 9, NULL, NULL, NULL, NULL, '2021-10-14 23:51:03', '2021-10-14 23:51:03'),
(118, 15, 13, NULL, NULL, NULL, NULL, '2021-10-14 23:51:03', '2021-10-14 23:51:03'),
(119, 16, 14, NULL, NULL, NULL, NULL, '2021-10-14 23:56:21', '2021-10-14 23:56:21'),
(120, 16, 3, NULL, NULL, NULL, NULL, '2021-10-14 23:56:21', '2021-10-14 23:56:21'),
(121, 16, 10, NULL, NULL, NULL, NULL, '2021-10-14 23:56:21', '2021-10-14 23:56:21'),
(122, 16, 4, NULL, NULL, NULL, NULL, '2021-10-14 23:56:21', '2021-10-14 23:56:21'),
(123, 16, 6, NULL, NULL, NULL, NULL, '2021-10-14 23:56:21', '2021-10-14 23:56:21'),
(124, 16, 11, NULL, NULL, NULL, NULL, '2021-10-14 23:56:21', '2021-10-14 23:56:21'),
(125, 16, 9, NULL, NULL, NULL, NULL, '2021-10-14 23:56:21', '2021-10-14 23:56:21'),
(126, 16, 5, NULL, NULL, NULL, NULL, '2021-10-14 23:56:21', '2021-10-14 23:56:21'),
(127, 16, 15, NULL, NULL, NULL, NULL, '2021-10-14 23:56:21', '2021-10-14 23:56:21'),
(128, 17, 1, NULL, NULL, NULL, NULL, '2021-10-14 23:57:26', '2021-10-14 23:57:26'),
(129, 17, 2, NULL, NULL, NULL, NULL, '2021-10-14 23:57:26', '2021-10-14 23:57:26'),
(130, 17, 3, NULL, NULL, NULL, NULL, '2021-10-14 23:57:26', '2021-10-14 23:57:26'),
(131, 17, 4, NULL, NULL, NULL, NULL, '2021-10-14 23:57:26', '2021-10-14 23:57:26'),
(132, 17, 10, NULL, NULL, NULL, NULL, '2021-10-14 23:57:26', '2021-10-14 23:57:26'),
(133, 17, 17, NULL, NULL, NULL, NULL, '2021-10-14 23:57:26', '2021-10-14 23:57:26'),
(134, 17, 18, NULL, NULL, NULL, NULL, '2021-10-14 23:57:26', '2021-10-14 23:57:26'),
(135, 18, 14, NULL, NULL, NULL, NULL, '2021-10-14 23:58:42', '2021-10-14 23:58:42'),
(136, 18, 3, NULL, NULL, NULL, NULL, '2021-10-14 23:58:42', '2021-10-14 23:58:42'),
(137, 18, 4, NULL, NULL, NULL, NULL, '2021-10-14 23:58:42', '2021-10-14 23:58:42'),
(138, 18, 10, NULL, NULL, NULL, NULL, '2021-10-14 23:58:42', '2021-10-14 23:58:42'),
(139, 18, 17, NULL, NULL, NULL, NULL, '2021-10-14 23:58:42', '2021-10-14 23:58:42'),
(140, 18, 8, NULL, NULL, NULL, NULL, '2021-10-14 23:58:42', '2021-10-14 23:58:42'),
(141, 19, 1, NULL, NULL, NULL, NULL, '2021-10-15 00:00:23', '2021-10-15 00:00:23'),
(142, 19, 3, NULL, NULL, NULL, NULL, '2021-10-15 00:00:23', '2021-10-15 00:00:23'),
(143, 19, 4, NULL, NULL, NULL, NULL, '2021-10-15 00:00:23', '2021-10-15 00:00:23'),
(144, 19, 5, NULL, NULL, NULL, NULL, '2021-10-15 00:00:23', '2021-10-15 00:00:23'),
(145, 19, 6, NULL, NULL, NULL, NULL, '2021-10-15 00:00:23', '2021-10-15 00:00:23'),
(146, 19, 7, NULL, NULL, NULL, NULL, '2021-10-15 00:00:23', '2021-10-15 00:00:23'),
(147, 19, 8, NULL, NULL, NULL, NULL, '2021-10-15 00:00:23', '2021-10-15 00:00:23'),
(148, 20, 1, NULL, NULL, NULL, NULL, '2021-10-15 00:01:41', '2021-10-15 00:01:41'),
(149, 20, 2, NULL, NULL, NULL, NULL, '2021-10-15 00:01:41', '2021-10-15 00:01:41'),
(150, 20, 4, NULL, NULL, NULL, NULL, '2021-10-15 00:01:41', '2021-10-15 00:01:41'),
(151, 20, 3, NULL, NULL, NULL, NULL, '2021-10-15 00:01:41', '2021-10-15 00:01:41'),
(152, 20, 5, NULL, NULL, NULL, NULL, '2021-10-15 00:01:41', '2021-10-15 00:01:41'),
(153, 20, 6, NULL, NULL, NULL, NULL, '2021-10-15 00:01:41', '2021-10-15 00:01:41'),
(154, 20, 7, NULL, NULL, NULL, NULL, '2021-10-15 00:01:41', '2021-10-15 00:01:41'),
(155, 20, 8, NULL, NULL, NULL, NULL, '2021-10-15 00:01:41', '2021-10-15 00:01:41'),
(156, 20, 9, NULL, NULL, NULL, NULL, '2021-10-15 00:01:41', '2021-10-15 00:01:41'),
(157, 21, 1, NULL, NULL, NULL, NULL, '2021-10-15 00:02:45', '2021-10-15 00:02:45'),
(158, 21, 2, NULL, NULL, NULL, NULL, '2021-10-15 00:02:45', '2021-10-15 00:02:45'),
(159, 21, 3, NULL, NULL, NULL, NULL, '2021-10-15 00:02:45', '2021-10-15 00:02:45'),
(160, 21, 4, NULL, NULL, NULL, NULL, '2021-10-15 00:02:45', '2021-10-15 00:02:45'),
(161, 21, 5, NULL, NULL, NULL, NULL, '2021-10-15 00:02:45', '2021-10-15 00:02:45'),
(162, 21, 6, NULL, NULL, NULL, NULL, '2021-10-15 00:02:45', '2021-10-15 00:02:45'),
(163, 21, 7, NULL, NULL, NULL, NULL, '2021-10-15 00:02:45', '2021-10-15 00:02:45'),
(164, 21, 8, NULL, NULL, NULL, NULL, '2021-10-15 00:02:45', '2021-10-15 00:02:45');

-- --------------------------------------------------------

--
-- Table structure for table `raw_materials`
--

CREATE TABLE `raw_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `raw_materials`
--

INSERT INTO `raw_materials` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ময়দা ১নং', 1, '2021-10-14 19:53:32', '2021-10-14 19:53:32'),
(2, 'ময়দা ২নং', 1, '2021-10-14 19:53:48', '2021-10-14 19:53:48'),
(3, 'চিনি', 1, '2021-10-14 19:54:15', '2021-10-14 19:54:15'),
(4, 'তৈল', 1, '2021-10-14 19:54:28', '2021-10-14 19:54:28'),
(5, 'ডিম', 1, '2021-10-14 19:54:41', '2021-10-14 19:54:41'),
(6, 'বেকিং', 1, '2021-10-14 19:54:50', '2021-10-14 19:54:50'),
(7, 'জেল', 1, '2021-10-14 19:54:55', '2021-10-14 19:54:55'),
(8, 'লবন', 1, '2021-10-14 19:55:01', '2021-10-14 19:55:01'),
(9, 'গ্লুকোজ', 1, '2021-10-14 19:55:14', '2021-10-14 19:55:14'),
(10, 'ডালডা', 1, '2021-10-14 19:56:59', '2021-10-14 19:56:59'),
(11, 'অ্যামোনিয়া', 1, '2021-10-14 19:57:12', '2021-10-14 19:57:12'),
(12, 'কালোজিরা', 1, '2021-10-14 19:57:33', '2021-10-14 19:57:33'),
(13, 'ফ্লেভার', 1, '2021-10-14 19:57:42', '2021-10-14 19:57:42'),
(14, 'ময়দা', 1, '2021-10-14 19:57:59', '2021-10-14 19:57:59'),
(15, 'রং', 1, '2021-10-14 19:58:06', '2021-10-14 19:58:06'),
(16, 'তিল', 1, '2021-10-14 19:58:14', '2021-10-14 19:58:14'),
(17, 'স্যাগারেন', 1, '2021-10-14 20:02:57', '2021-10-14 20:02:57'),
(18, 'ক্রিম', 1, '2021-10-14 20:03:12', '2021-10-14 20:03:12'),
(19, 'বিস্কুটের গুড়', 1, '2021-10-14 20:03:44', '2021-10-14 20:03:44'),
(20, 'নারকেল', 1, '2021-10-14 20:03:56', '2021-10-14 20:03:56');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 'Kilogram', 'KG', NULL, NULL),
(2, 'Litre', 'L', NULL, NULL),
(3, 'Milliliter', 'mL', NULL, NULL),
(4, 'Milligram', 'mg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Zahedur Rahman', 'zahedurr47@gmail.com', '2021-10-14 15:01:11', '$2y$10$vLhsXihhHnH8vazfl80NGeu.uXlShoKGJFoiU/Awxprz.04xnBUXW', 'Admin', 'sttuVZuEsR', '2021-10-14 15:01:11', '2021-10-14 15:01:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_materials`
--
ALTER TABLE `product_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_materials_product_id_foreign` (`product_id`),
  ADD KEY `product_materials_raw_material_id_foreign` (`raw_material_id`),
  ADD KEY `product_materials_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `raw_materials`
--
ALTER TABLE `raw_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `product_materials`
--
ALTER TABLE `product_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT for table `raw_materials`
--
ALTER TABLE `raw_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_materials`
--
ALTER TABLE `product_materials`
  ADD CONSTRAINT `product_materials_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_materials_raw_material_id_foreign` FOREIGN KEY (`raw_material_id`) REFERENCES `raw_materials` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_materials_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
