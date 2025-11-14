-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : ven. 14 nov. 2025 à 14:15
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sushi_crousty`
--

-- --------------------------------------------------------

--
-- Structure de la table `boxes`
--

CREATE TABLE `boxes` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `pieces` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `boxes`
--

INSERT INTO `boxes` (`id`, `name`, `pieces`, `price`, `image`) VALUES
(1, 'Tasty Blend', 12, 12.50, 'tasty-blend'),
(2, 'Amateur Mix', 18, 15.90, 'amateur-mix'),
(3, 'Saumon Original', 11, 12.50, 'saumon-original'),
(4, 'Salmon Lovers', 18, 15.90, 'salmon-lovers'),
(5, 'Salmon Classic', 10, 15.90, 'salmon-classic'),
(6, 'Master Mix', 12, 15.90, 'master-mix'),
(7, 'Sunrise', 18, 15.90, 'sunrise'),
(8, 'Sando Box Chicken Katsu', 13, 15.90, 'sando-box-chicken-katsu'),
(9, 'Sando Box Salmon Aburi', 13, 15.90, 'sando-box-salmon-aburi'),
(10, 'Super Salmon', 24, 19.90, 'super-salmon'),
(11, 'California Dream', 24, 19.90, 'california-dream'),
(12, 'Gourmet Mix', 22, 24.50, 'gourmet-mix'),
(13, 'Fresh Mix', 22, 24.50, 'fresh-mix');

-- --------------------------------------------------------

--
-- Structure de la table `box_flavors`
--

CREATE TABLE `box_flavors` (
  `box_id` int(11) NOT NULL,
  `flavor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `box_flavors`
--

INSERT INTO `box_flavors` (`box_id`, `flavor_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(4, 1),
(4, 2),
(4, 4),
(5, 1),
(6, 1),
(6, 2),
(6, 5),
(7, 1),
(7, 2),
(7, 3),
(7, 5),
(8, 1),
(8, 2),
(8, 3),
(8, 6),
(9, 1),
(9, 2),
(9, 5),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(11, 1),
(11, 2),
(11, 5),
(11, 6),
(11, 7),
(11, 8),
(12, 1),
(12, 2),
(12, 4),
(12, 6),
(12, 8),
(12, 9),
(13, 1),
(13, 2),
(13, 3),
(13, 5),
(13, 8);

-- --------------------------------------------------------

--
-- Structure de la table `box_foods`
--

CREATE TABLE `box_foods` (
  `box_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `quantity` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `box_foods`
--

INSERT INTO `box_foods` (`box_id`, `food_id`, `quantity`) VALUES
(1, 1, 3.00),
(1, 2, 3.00),
(1, 3, 3.00),
(1, 4, 3.00),
(1, 5, 1.00),
(2, 1, 3.00),
(2, 5, 1.00),
(2, 6, 3.00),
(2, 7, 3.00),
(2, 8, 6.00),
(3, 1, 6.00),
(3, 2, 5.00),
(3, 5, 1.00),
(4, 1, 6.00),
(4, 2, 6.00),
(4, 5, 1.00),
(4, 7, 6.00),
(5, 2, 10.00),
(5, 5, 1.00),
(6, 1, 3.00),
(6, 2, 4.00),
(6, 5, 1.00),
(6, 9, 2.00),
(6, 10, 3.00),
(7, 1, 6.00),
(7, 5, 1.00),
(7, 6, 6.00),
(7, 11, 6.00),
(8, 1, 6.00),
(8, 5, 1.00),
(8, 6, 6.00),
(8, 11, 6.00),
(8, 12, 0.50),
(9, 1, 6.00),
(9, 5, 1.00),
(9, 11, 6.00),
(9, 13, 0.50),
(10, 1, 6.00),
(10, 5, 1.00),
(10, 6, 6.00),
(10, 7, 6.00),
(10, 14, 6.00),
(11, 1, 6.00),
(11, 5, 1.00),
(11, 11, 6.00),
(11, 15, 6.00),
(11, 16, 6.00),
(12, 5, 1.00),
(12, 17, 6.00),
(12, 18, 4.00),
(12, 19, 3.00),
(12, 20, 6.00),
(12, 21, 3.00),
(13, 4, 6.00),
(13, 5, 1.00),
(13, 6, 6.00),
(13, 22, 4.00),
(13, 23, 4.00),
(13, 24, 2.00);

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `adresse` varchar(255) DEFAULT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `code_postal` varchar(10) DEFAULT NULL,
  `cree_le` timestamp NOT NULL DEFAULT current_timestamp(),
  `role_id` int(11) NOT NULL DEFAULT 2
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `date_commande` timestamp NOT NULL DEFAULT current_timestamp(),
  `prix_total` decimal(10,2) NOT NULL,
  `statut` varchar(50) NOT NULL DEFAULT 'en_attente',
  `adresse_livraison` varchar(255) NOT NULL,
  `ville_livraison` varchar(100) NOT NULL,
  `code_postal_livraison` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `details_commande`
--

CREATE TABLE `details_commande` (
  `id` int(11) NOT NULL,
  `commande_id` int(11) NOT NULL,
  `box_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_unitaire` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `flavors`
--

CREATE TABLE `flavors` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `flavors`
--

INSERT INTO `flavors` (`id`, `name`) VALUES
(2, 'avocat'),
(3, 'cheese'),
(4, 'coriandre'),
(7, 'crevette'),
(1, 'saumon'),
(9, 'seriole lalandi'),
(8, 'spicy'),
(5, 'thon'),
(6, 'viande');

-- --------------------------------------------------------

--
-- Structure de la table `foods`
--

CREATE TABLE `foods` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `foods`
--

INSERT INTO `foods` (`id`, `name`) VALUES
(16, 'California Chicken Katsu'),
(15, 'California Crevette'),
(20, 'California French Salmon'),
(19, 'California French Touch'),
(4, 'California Pacific'),
(1, 'California Saumon Avocat'),
(10, 'California Thon Avocat'),
(11, 'California Thon Cuit Avocat'),
(21, 'California Yellowtail Ponzu'),
(5, 'Edamame/Salade de chou'),
(8, 'Maki Cheese Avocat'),
(14, 'Maki Salmon'),
(6, 'Maki Salmon Roll'),
(12, 'Sando Chicken Katsu'),
(13, 'Sando Salmon Aburi'),
(18, 'Signature Dragon Roll'),
(22, 'Signature Rock\'n Roll'),
(3, 'Spring Avocat Cheese'),
(7, 'Spring Saumon Avocat'),
(17, 'Spring Tataki Saumon'),
(23, 'Sushi Salmon'),
(2, 'Sushi Saumon'),
(24, 'Sushi Saumon Tsukudani'),
(9, 'Sushi Thon');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `nom`) VALUES
(1, 'admin'),
(2, 'client');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `boxes`
--
ALTER TABLE `boxes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `box_flavors`
--
ALTER TABLE `box_flavors`
  ADD PRIMARY KEY (`box_id`,`flavor_id`),
  ADD KEY `flavor_id` (`flavor_id`);

--
-- Index pour la table `box_foods`
--
ALTER TABLE `box_foods`
  ADD PRIMARY KEY (`box_id`,`food_id`),
  ADD KEY `food_id` (`food_id`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `role_id` (`role_id`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Index pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commande_id` (`commande_id`),
  ADD KEY `box_id` (`box_id`);

--
-- Index pour la table `flavors`
--
ALTER TABLE `flavors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `boxes`
--
ALTER TABLE `boxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `details_commande`
--
ALTER TABLE `details_commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `flavors`
--
ALTER TABLE `flavors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `box_flavors`
--
ALTER TABLE `box_flavors`
  ADD CONSTRAINT `box_flavors_ibfk_1` FOREIGN KEY (`box_id`) REFERENCES `boxes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `box_flavors_ibfk_2` FOREIGN KEY (`flavor_id`) REFERENCES `flavors` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `box_foods`
--
ALTER TABLE `box_foods`
  ADD CONSTRAINT `box_foods_ibfk_1` FOREIGN KEY (`box_id`) REFERENCES `boxes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `box_foods_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD CONSTRAINT `details_commande_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commandes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `details_commande_ibfk_2` FOREIGN KEY (`box_id`) REFERENCES `boxes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
