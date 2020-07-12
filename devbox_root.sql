-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: mysql-devbox.alwaysdata.net
-- Generation Time: Jul 12, 2020 at 10:27 PM
-- Server version: 10.4.12-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `devbox_root`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `img` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `img`, `description`, `created_at`, `updated_at`) VALUES
(1, 'zcategory_1', '1.jpg', 'cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat ', '2020-06-14 00:01:41', '2020-06-14 00:01:41'),
(2, 'category_2', '1.jpg', 'cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non ', '2020-06-14 00:01:41', '2020-06-14 00:01:41');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `notif_text` text DEFAULT NULL,
  `notif_type` varchar(100) DEFAULT NULL,
  `vu_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `amount` varchar(10) DEFAULT NULL,
  `method` varchar(10) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `end_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `amount`, `method`, `created_at`, `updated_at`, `end_at`, `user_id`) VALUES
(7, '9', 'STRIPE', '2020-07-11 20:46:42', '2020-07-11 20:46:42', '2020-08-11 20:46:42', 4),
(8, '9', 'STRIPE', '2020-07-11 20:49:05', '2020-07-11 20:49:05', '2020-08-11 20:49:05', 10);

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `reservation_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_note` text DEFAULT NULL,
  `prestataire_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `reservation_date`, `user_id`, `user_note`, `prestataire_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2020-06-16 00:52:07', 4, '', 1, 0, '2020-06-14 00:52:30', '2020-06-14 00:52:30', NULL),
(2, '2020-06-29 00:00:00', 4, '', 2, 0, '2020-06-29 03:33:56', '2020-06-29 03:33:56', NULL),
(3, '2020-06-29 03:36:00', 4, 'qsdqdqsdqsd', 5, 1, '2020-06-29 03:36:54', '2020-06-29 08:44:30', '2020-06-29 08:17:43'),
(4, '2020-06-30 12:40:00', 4, 'urgent !!', 4, 2, '2020-06-29 03:40:25', '2020-06-29 08:44:37', '2020-06-29 08:44:37'),
(5, '2020-07-06 12:06:00', 4, 'test', 5, 1, '2020-07-03 10:06:09', '2020-07-03 13:57:57', NULL),
(6, '2020-07-20 08:21:00', 7, NULL, 6, 1, '2020-07-05 00:21:51', '2020-07-05 20:40:39', NULL),
(7, '2020-07-18 21:15:00', 16, NULL, 4, 0, '2020-07-12 20:15:39', '2020-07-12 20:15:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `avatar` text DEFAULT 'placeholder.png',
  `bio` text DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `fb` text DEFAULT NULL,
  `fb_id` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `insta` text DEFAULT NULL,
  `user_type` int(11) DEFAULT 0,
  `category_id` int(11) DEFAULT 0,
  `status` int(11) DEFAULT 1,
  `adresse` text DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zip_code` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `avatar`, `bio`, `email`, `password`, `tel`, `fb`, `fb_id`, `google_id`, `insta`, `user_type`, `category_id`, `status`, `adresse`, `country`, `state`, `zip_code`, `latitude`, `longitude`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'updatesdsd', 'doe', 'avatar.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam', 'prestataire@app.io', '$2y$12$c4Ey74L8mP2SSIPt2q/L/.3C/yHRefrmr0xPfub836xA25mfp7dvG', '2135465454', 'https://www.facebook.com/', NULL, '', 'https://www.instagram.com', 1, 2, 1, 'street 12', 'Tunisie', 'Nabeul', '1001', '27.886917', '5.6', '2020-06-13 23:03:12', '2020-07-05 19:12:57', NULL),
(2, 'john ', 'doe', 'avatar.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam', 'prestataire_2@app.io', '$2y$12$lfNfLcMvRi.Sepxaj8pckeXJEldHKQ0LSraL9Ffl4gXud6AeZqCuq', '2135465454', 'https://www.facebook.com/', NULL, '', 'https://www.instagram.com', 1, 2, 1, 'street 12', 'Tunisie', 'Tunis', '1001', '30.886917', '8.537499', '2020-06-13 23:04:52', '2020-06-13 23:04:52', NULL),
(3, 'john ', 'doe', 'avatar.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam', 'user@app.io', '$2y$12$BzTDBq8RqlEq2V1B5Z8Ide4FrWp4uIsULyC/UMkiasiiXYPSijH8e', '2135465454', 'https://www.facebook.com/', NULL, '', 'https://www.instagram.com', 0, 0, 1, 'street 12', 'Tunisie', 'khairouan', '1001', '28.886917', '5.537499', '2020-06-13 23:05:51', '2020-06-13 23:05:51', NULL),
(4, 'Ala', 'Chamekh', 'avatar.png', ' Lorem ipsum dolor sit amet', 'chamekhala33@gmail.com', '$2y$12$6W4X/.O1S54xNsaRdw29xeOUBoar8nhiHA82rDqNrtV9tPeyjUp9e', '2135465454', 'https://www.facebook.com/', '10222434444225981', '', 'https://www.instagram.com', 1, 1, 1, 'street 124', 'Tunisie', 'khairouan', '1001', '40.886917', '12.537499', '2020-06-13 23:06:15', '2020-07-11 20:46:42', NULL),
(5, 'john ', 'doe', 'avatar.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam', 'prestataire_3@app.io', '$2y$12$lfNfLcMvRi.Sepxaj8pckeXJEldHKQ0LSraL9Ffl4gXud6AeZqCuq', '2135465454', 'https://www.facebook.com/', NULL, '', 'https://www.instagram.com', 1, 1, 1, 'street 12', 'Tunisie', 'Tunis', '1001', '28.999', '6.537499', '2020-06-13 23:04:52', '2020-06-13 23:04:52', NULL),
(6, 'efgh', 'abcd', 'avatar.png', 'qsdqsdqsds', 'test@app.io', '$2y$12$E37ZyfJEtFes3HRMZXv7cuSxqsPuq6bJpeorKHs4QUM11peR5JKH.', '452424', 'https://www.facebook.com/', NULL, '', 'https://www.instagram.com', 1, 2, 1, 'dfdsfdf', NULL, 'vilee', '52424224', NULL, NULL, '0000-00-00 00:00:00', '2020-07-05 16:10:00', NULL),
(7, 'qsdsddq', 'qsdsdqs', 'avatar.png', NULL, 't1est@app.io', '$2y$12$p0gM84o8QOx9eIsDpmft6.OqR31TNVjTaWcjgzv5w7/ZqJkNpeEr.', '2632232', 'https://www.facebook.com/', NULL, '', 'https://www.instagram.com', 0, 0, 1, 'sqdsdqsd', NULL, 'qsdqsd', '2323232', NULL, NULL, '2020-07-05 00:15:43', '2020-07-05 00:15:43', NULL),
(8, 'qsdsdqsd', 'abcded', 'avatar.png', NULL, 't3est@app.io', '$2y$12$UwiEWd0UVuHg55yq.Jzu1uTK258jv9jBXaEH2h6YKg9uHBihL4kyy', '542454', 'https://www.facebook.com/', NULL, '', 'https://www.instagram.com', 0, 0, 1, 'sfdfsdfsdf', NULL, 'sdfsdf', '3120', NULL, NULL, '2020-07-05 00:17:18', '2020-07-05 00:17:18', NULL),
(9, 'aaaa', 'aaa', 'avatar.png', 'aaaaaa', 'aaaa@live.fr', '$2y$12$/w4rMPRM5yMqAiGs/5kkDuA.KcfWcZdhboFpsDkF0Yvfz4TjCZ8/a', '123456789', 'https://www.facebook.com/', NULL, '', 'https://www.instagram.com', 1, 1, 1, 'sdffsdf', NULL, 'ville', '14587', '40.986917', '12.637499', '2020-07-05 00:23:16', '2020-07-05 00:23:16', NULL),
(10, 'ala eddine', 'chamekh', 'avatar.png', 'test description', 'chamekhala1@gmail.com', '$2y$12$J/ML8r8n.hHsNWhDtYjcnOuyPIwpx8Mk7GyscnzLhKNtSPOR69W1S', '28529742', 'chamekh.ala', NULL, '', 'chamekh.ala', 1, 2, 1, 'adress 1 ', NULL, 'paris', '3120', '36.8891165', '10.3222671', '2020-07-06 17:54:06', '2020-07-11 20:49:05', NULL),
(11, 'Ftiti', 'Fadhel', 'avatar.png', NULL, 'fadhel.dev@gmail.com', '$2y$12$WD/Qhf.jwjd4THlHlxMZwuHMrsF01tZE81l5DcGuEuRTiBA8m359m', '25976545', NULL, NULL, '', NULL, 0, 0, 1, 'Cité tahrir', NULL, 'Paris', '3130', '36.8425169', '10.1668601', '2020-07-06 19:09:07', '2020-07-06 19:09:07', NULL),
(12, 'Ala', 'Chamekh', 'avatar.png', NULL, 'chamekhala1123@gmail.com', '$2y$12$8DpUosZ01WRKfwp2JPp5qOZ8rBOfR0jc1dt2qzQxOIIZ6gQvjO7r6', '25451848', 'Chamekh.ala', NULL, '', 'Chamekhala', 0, 0, 1, 'Tunid', NULL, 'Paris', '10001', NULL, NULL, '2020-07-06 19:10:12', '2020-07-06 19:10:12', NULL),
(13, 'presta', 'Test', 'avatar.png', NULL, 'meneroie@gmail.com', '$2y$12$KXzCPIYofB110AoJfhqPmOD0xrun8A.VebJ1x9S/odeXmW1o3keKm', '06060606', NULL, NULL, '', NULL, 1, 2, 1, NULL, NULL, NULL, NULL, '48.9202746', '2.3817163', '2020-07-06 19:33:26', '2020-07-06 19:33:26', NULL),
(14, 'client', 'Test', 'avatar.png', NULL, 'Meneroiewebsite@gmail.com', '$2y$12$g9hAF/oNJeav9vZ9dkJ65eiEwuO.EGLZKJF1U8zHdbKQwyXA8M7xm', '07070707', NULL, NULL, '', NULL, 0, 0, 1, NULL, NULL, NULL, NULL, '48.9202739', '2.381713', '2020-07-06 19:34:42', '2020-07-06 19:34:42', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
