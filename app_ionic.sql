-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 12 juin 2020 à 00:51
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
-- Base de données : `app_ionic`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresses`
--

CREATE TABLE `adresses` (
  `id` int(11) NOT NULL,
  `adresse` text DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `zip_code` varchar(100) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `adresses`
--

INSERT INTO `adresses` (`id`, `adresse`, `country_id`, `state_id`, `zip_code`, `latitude`, `longitude`, `created_at`, `updated_at`) VALUES
(1, 'street 1', 1, 1, '1001', '0', '0', '2020-06-11 15:38:01', '2020-06-11 15:38:01'),
(2, 'street 1', 1, 1, '1001', '0', '0', '2020-06-11 15:39:31', '2020-06-11 15:39:31'),
(3, 'street 1', 1, 1, '1001', '0', '0', '2020-06-11 17:13:11', '2020-06-11 17:13:11'),
(4, 'street 12', 2, 2, '1001', '0', '0', '2020-06-11 17:50:19', '2020-06-11 17:50:19');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'category test', '2020-06-11 23:22:01', '2020-06-11 23:22:04'),
(2, 'test2', '2020-06-11 23:22:07', '2020-06-11 23:22:09'),
(3, 'cat__test', '2020-06-11 23:22:12', '2020-06-11 23:22:14');

-- --------------------------------------------------------

--
-- Structure de la table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `code_iso` varchar(3) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `countries`
--

INSERT INTO `countries` (`id`, `code_iso`, `name`) VALUES
(1, 'TN', 'Tunisie'),
(2, 'FR', 'France');

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `notif_text` text DEFAULT NULL,
  `notif_type` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `vu_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `prestataire_id` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `method` varchar(100) DEFAULT NULL,
  `payed_at` datetime DEFAULT current_timestamp(),
  `end_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `payments`
--

INSERT INTO `payments` (`id`, `prestataire_id`, `amount`, `method`, `payed_at`, `end_at`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 'CREDIT_CARD', '2020-05-11 22:28:16', '2020-06-11 22:50:01', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 2, 10, 'CREDIT_CARD', '2020-05-11 22:28:16', '2020-06-11 22:50:19', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 2, 100, 'PAYPAL', '2020-04-11 21:46:07', '2020-05-11 22:50:22', '2020-06-11 21:46:07', '2020-06-11 21:46:07');

-- --------------------------------------------------------

--
-- Structure de la table `prestataires`
--

CREATE TABLE `prestataires` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `prestataires`
--

INSERT INTO `prestataires` (`id`, `user_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 2, 2, '2020-06-11 15:39:31', '2020-06-11 15:39:31'),
(2, 4, 3, '2020-06-11 17:50:20', '2020-06-11 17:50:20');

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
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservations`
--

INSERT INTO `reservations` (`id`, `reservation_date`, `user_id`, `prestataire_id`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2020-06-23 22:05:22', 3, 4, 0, '2020-06-11 23:06:31', '2020-06-11 22:15:44', '2020-06-11 22:15:44'),
(2, '2020-06-26 22:05:22', 3, 4, 1, '2020-06-11 23:06:36', '2020-06-11 22:15:19', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `country_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `states`
--

INSERT INTO `states` (`id`, `country_id`, `name`) VALUES
(1, 1, 'Tunis'),
(2, 2, 'Paris');

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
  `adresse_id` int(11) DEFAULT NULL,
  `user_type` int(11) DEFAULT 0,
  `status` int(11) DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp(),
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `avatar`, `email`, `password`, `tel`, `fb`, `insta`, `adresse_id`, `user_type`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'test_post', 'test_post', 'test_post.png', 'test_post@live.fr', 'eyJpdiI6IlorZ2ZxRW02T3pLeXlZdHJXMHRxWGc9PSIsInZhbHVlIjoiOHlpMGcvcTJXZlcvQUdZVEhoSXNVdz09IiwibWFjIjoiOTA0NzRjMmE4OGIzNzhlYTUxN2Q4ZjlmMmVkMjBmNDY4MDMxNjAyYTgyNzU3ZWIwMmY0YzQxYTg2NWNkZDcyMiJ9', '2135465454', 'fb.com', 'insta.com', 1, 0, 1, '2020-06-11 15:38:02', '2020-06-11 15:38:02', NULL),
(2, 'test_post_presta', 'test_post_presta', 'test_post_presta.png', 'test_post_presta@live.fr', 'eyJpdiI6IndEenhLSGZpY05zY0JmeFVxa3ZRYVE9PSIsInZhbHVlIjoidUx0bThaUGdDL3huK0wzbXVibjBEZz09IiwibWFjIjoiOTc2NTBlMDVmZmJlNmYwZWU4ZTk2OWIyNzhjYzg0MmU0M2FlNjIwNjgyMzdiOTJkZWRlNDMxZTRlMmM2NTZhOCJ9', '2135465454', 'fb.com', 'insta.com', 2, 1, 1, '2020-06-11 15:39:31', '2020-06-11 15:39:31', NULL),
(3, 'test_post_presta', 'test_post_presta', 'test_post_presta.png', 'user@user.fr', '$2y$12$rA2HQAPKCR9S.7/dkmo2vO67rKe1yV8MeDtu/tWnALsao5buJt7L6', '2135465454', 'fb.com', 'insta.com', 3, 0, 1, '2020-06-11 17:13:11', '2020-06-11 17:13:11', NULL),
(4, 'test_post_presta', 'test_post_presta', 'test_post_presta.png', 'user2@user.fr', '$2y$12$444owDkMoTgmvuzRsomEpe7.i5FiIn45naDbXnUFoHemQh7W1Vm1y', '2135465454', 'fb.com', 'insta.com', 4, 2, 1, '2020-06-11 17:50:20', '2020-06-11 17:50:20', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_adresse_countries` (`country_id`),
  ADD KEY `fk_adresse_states` (`state_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_notifications_users` (`user_id`);

--
-- Index pour la table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `prestataires`
--
ALTER TABLE `prestataires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_prestataires_countries` (`category_id`),
  ADD KEY `fk_prestataires_users` (`user_id`);

--
-- Index pour la table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_states_countries` (`country_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_adresses` (`adresse_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adresses`
--
ALTER TABLE `adresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `countries`
--
ALTER TABLE `countries`
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
-- AUTO_INCREMENT pour la table `prestataires`
--
ALTER TABLE `prestataires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adresses`
--
ALTER TABLE `adresses`
  ADD CONSTRAINT `fk_adresse_countries` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_adresse_states` FOREIGN KEY (`state_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `prestataires`
--
ALTER TABLE `prestataires`
  ADD CONSTRAINT `fk_prestataires_countries` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_prestataires_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `states`
--
ALTER TABLE `states`
  ADD CONSTRAINT `fk_states_countries` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_adresses` FOREIGN KEY (`adresse_id`) REFERENCES `adresses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
