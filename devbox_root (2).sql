-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: mysql-devbox.alwaysdata.net
-- Generation Time: Aug 15, 2020 at 08:55 PM
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
(10, '9', 'STRIPE', '2020-07-14 17:56:54', '2020-07-14 17:56:54', '2020-08-14 17:56:54', 21),
(11, '9', 'STRIPE', '2020-07-14 19:25:12', '2020-07-14 19:25:12', '2020-08-14 19:25:12', 25),
(12, '9', 'STRIPE', '2020-07-14 19:25:12', '2020-07-14 19:25:12', '2020-08-14 19:25:12', 23);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL,
  `presta_id` int(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rating`
--

INSERT INTO `rating` (`id`, `user_id`, `presta_id`, `value`, `created_at`, `updated_at`) VALUES
(5, 3, 25, '4', '2020-08-15 18:38:13', '2020-08-15 18:38:13');

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
(9, '2020-07-25 09:00:00', 22, 'Test reserv', 21, 1, '2020-07-14 18:00:18', '2020-07-14 18:01:24', NULL),
(10, '2020-07-14 12:40:00', 26, 'Hhh', 25, 1, '2020-07-14 19:26:21', '2020-07-14 19:26:47', NULL),
(11, '2020-07-14 12:30:00', 26, 'Bbb', 25, 2, '2020-07-14 19:30:49', '2020-07-14 19:31:54', '2020-07-14 19:31:54'),
(12, '2020-07-31 20:33:00', 26, 'Ggg', 25, 1, '2020-07-14 19:33:16', '2020-07-14 19:33:39', NULL),
(13, '2020-07-14 23:23:00', 21, NULL, 25, 0, '2020-07-14 21:23:56', '2020-07-14 21:23:56', NULL),
(14, '2020-07-17 23:27:00', 21, NULL, 25, 0, '2020-07-14 21:27:27', '2020-07-14 21:27:27', NULL),
(15, '2020-07-19 22:39:00', 21, NULL, 23, 1, '2020-07-14 21:40:07', '2020-07-14 21:41:47', NULL),
(16, '2020-07-14 22:40:00', 21, 'zqdqdsdqsdqsdqsdqs', 23, 2, '2020-07-14 21:40:14', '2020-07-14 21:41:50', '2020-07-14 21:41:50');

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
  `status` int(11) DEFAULT 0,
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
(1, 'updatesdsd', 'doe', 'avatar.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam', 'prestataire@app.io', '$2y$12$c4Ey74L8mP2SSIPt2q/L/.3C/yHRefrmr0xPfub836xA25mfp7dvG', '2135465454', 'https://www.facebook.com/', NULL, '', 'https://www.instagram.com', 1, 2, 1, 'street 12', 'France', 'Paris', '75000', '27.886917', '5.6', '2020-06-13 23:03:12', '2020-07-05 19:12:57', NULL),
(3, 'john qsdqs', 'doe', 'avatar.png', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam', 'user@app.io', '$2y$12$BzTDBq8RqlEq2V1B5Z8Ide4FrWp4uIsULyC/UMkiasiiXYPSijH8e', '2135465454', 'https://www.facebook.com/', NULL, '', 'https://www.instagram.com', 0, 0, 1, 'street 12', 'France', 'Nice', '50000', '28.886917', '5.537499', '2020-06-13 23:05:51', '2020-06-13 23:05:51', NULL),
(21, 'Ala Eddine', 'Chamekh', 'U-1594749370.png', 'Test pour prestataire', 'chamekhala@gmail.com', '$2y$12$c4Ey74L8mP2SSIPt2q/L/.3C/yHRefrmr0xPfub836xA25mfp7dvG', '28529742', 'chamekh.ala', NULL, '112900037970108515951', 'Chamekhala', 0, 0, 1, 'Rue 123', NULL, 'Paris', '75000', '36.6925949', '10.491475', '2020-07-14 17:54:48', '2020-07-14 17:56:54', NULL),
(23, 'Chamekh', 'Ala', 'U-1594764341.png', 'my description ..... ', 'chamekh_3ala@hotmail.com', '$2y$12$c4Ey74L8mP2SSIPt2q/L/.3C/yHRefrmr0xPfub836xA25mfp7dvG', '555555655', '', '10222434444225981', NULL, NULL, 1, 1, 1, 'Hdjdjdj', NULL, 'Kdjjdddj', 'Sjekksjs', '36.6925949', '10.491475', '2020-07-14 19:00:04', '2020-07-14 22:05:41', NULL),
(24, '\'Fadhel', 'Ftiti', 'U-1594753459.png', NULL, 'fadhelcluba@live.fr', '$2y$12$LKEsX74x3wgyjhxslldIuOYf5cqSmGbTYQTPfQBTPuEqoMKWdn.Cu', '25976545', 'facebook.com', '3645501352129968', NULL, 'instagram.com', 0, 0, 1, 'Cité tahrir', NULL, 'Kairouan', '3120', '35.8499724', '9.5975861', '2020-07-14 19:02:37', '2020-07-14 19:04:19', NULL),
(25, 'fadhel', 'ftiti', 'U-1594753682.png', NULL, 'fadhel.dev@gmail.com', '$2y$12$EnCKo6jmwlzSiCPm4ENtz.m00PhjDPX7Qh.dJbHWmBt6KVah2PELO', '25976545', 'facebook.com', NULL, '111938818113230107491', 'instagram.com', 1, 1, 1, 'Cité tahrir', NULL, 'Sousse', '3120', '35.8499471', '9.5976988', '2020-07-14 19:08:02', '2020-07-14 19:25:12', NULL),
(26, 'Fteiti', 'Aziz', 'U-1594754212.png', NULL, 'azizi@gmail.com', '$2y$12$n6DTpn./j02sXTcR7keWnOfWS5apg0vtd/kckeW5M7syU6N6GOVWe', '53031956', 'facebook.com', '863677587375755', NULL, 'Instagram.com', 0, 0, 1, 'Cite tahrir', NULL, 'Kaiouan', '3120', '10.491475', '9.5976988', '2020-07-14 19:16:52', '2020-07-14 19:16:52', NULL),
(27, 'Meneroie', 'Tan', 'U-1594801136.png', NULL, 'meneroie@gmail.com', '$2y$12$xGyVoxz4q5A4p1hoczsTruaJuyhYK5pKK2yA.ZRXk9kKNfS239NAS', '0782162495', NULL, NULL, '101066963818421835838', NULL, 0, 0, 1, '123 rue faubourg saint Martin ', NULL, 'Paris ', '75010', NULL, NULL, '2020-07-15 08:18:56', '2020-07-15 08:18:56', NULL),
(28, 'Test', 'Test', 'U-1594801742.png', NULL, 'Meneroiewebsite@gmail.com', '$2y$12$s6yZcr20MXtZ1tLldb140Ok/Phks3bd4BMjIJPkt50GcyfPKWKjAm', '0288654546', NULL, NULL, NULL, NULL, 1, 2, 0, '53 rue dhdj', NULL, 'paris', '75005', '48.9241915', '2.3852783', '2020-07-15 08:29:02', '2020-07-15 08:29:02', NULL);

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
-- Indexes for table `rating`
--
ALTER TABLE `rating`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
