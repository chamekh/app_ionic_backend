-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 14 juin 2020 à 02:00
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `latest_app_ionic`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'category_1', '2020-06-14 00:01:41', '2020-06-14 00:01:41'),
(2, 'category_2', '2020-06-14 00:01:41', '2020-06-14 00:01:41');

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
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
-- Structure de la table `payments`
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
-- Déchargement des données de la table `payments`
--

INSERT INTO `payments` (`id`, `amount`, `method`, `created_at`, `updated_at`, `end_at`, `user_id`) VALUES
(1, '10', 'PAYPAL', '2020-06-14 00:19:54', '2020-06-14 00:19:54', '2020-07-14 00:19:27', 1),
(2, '10', 'PAYPAL', '2020-05-14 00:19:54', '2020-05-14 00:19:54', '2020-06-14 00:19:27', 1),
(3, '10', 'CARD', '2020-06-14 00:19:54', '2020-06-14 00:19:54', '2020-07-14 00:19:27', 2);

-- --------------------------------------------------------

--
-- Structure de la table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `reservation_date` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `prestataire_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`id`, `reservation_date`, `user_id`, `prestataire_id`, `status`, `created_at`, `updated_at`) VALUES
(1, '2020-06-16 00:52:07', 4, 1, 0, '2020-06-14 00:52:30', '2020-06-14 00:52:30');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `fb` text DEFAULT NULL,
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
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `avatar`, `email`, `password`, `tel`, `fb`, `insta`, `user_type`, `category_id`, `status`, `adresse`, `country`, `state`, `zip_code`, `latitude`, `longitude`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test_post_presta', 'test_post_presta', 'test_presta.png', 'prestataire@app.io', '$2y$12$c4Ey74L8mP2SSIPt2q/L/.3C/yHRefrmr0xPfub836xA25mfp7dvG', '2135465454', 'fb.com', 'insta.com', 1, 2, 1, 'street 12', 'Tunisie', 'Nabeul', '1001', '27.886917', '5.6', '2020-06-13 23:03:12', '2020-06-13 23:03:12', NULL),
(2, 'test_post_presta_2', 'test_post_presta_2', 'test_presta.png', 'prestataire_2@app.io', '$2y$12$lfNfLcMvRi.Sepxaj8pckeXJEldHKQ0LSraL9Ffl4gXud6AeZqCuq', '2135465454', 'fb.com', 'insta.com', 1, 2, 1, 'street 12', 'Tunisie', 'Tunis', '1001', '30.886917', '8.537499', '2020-06-13 23:04:52', '2020-06-13 23:04:52', NULL),
(3, 'test_post_user', 'test_post_user', 'test_user.png', 'user@app.io', '$2y$12$BzTDBq8RqlEq2V1B5Z8Ide4FrWp4uIsULyC/UMkiasiiXYPSijH8e', '2135465454', 'fb.com', 'insta.com', 0, 0, 1, 'street 12', 'Tunisie', 'khairouan', '1001', '28.886917', '5.537499', '2020-06-13 23:05:51', '2020-06-13 23:05:51', NULL),
(4, 'test_post_user_2', 'test_post_user_2', 'test_user.png', 'user_2@app.io', '$2y$12$sE8togUe6PBZXpn3yRz7e.x25GRVr3w179nkKa8cU4Bo/QmBZUTla', '2135465454', 'fb.com', 'insta.com', 0, 0, 1, 'street 12', 'Tunisie', 'khairouan', '1001', '40.886917', '12.537499', '2020-06-13 23:06:15', '2020-06-13 23:06:15', NULL),
(5, 'test_post_presta_3', 'test_post_presta_3', 'test_presta.png', 'prestataire_3@app.io', '$2y$12$lfNfLcMvRi.Sepxaj8pckeXJEldHKQ0LSraL9Ffl4gXud6AeZqCuq', '2135465454', 'fb.com', 'insta.com', 1, 2, 1, 'street 12', 'Tunisie', 'Tunis', '1001', '28.999', '6.537499', '2020-06-13 23:04:52', '2020-06-13 23:04:52', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
