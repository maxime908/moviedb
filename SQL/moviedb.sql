-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 20 mars 2026 à 21:30
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `moviedb`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id_categorie` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id_categorie`, `name`) VALUES
(1, 'Action'),
(2, 'Aventure'),
(3, 'Science-Fiction'),
(4, 'Drame'),
(5, 'Comédie'),
(6, 'Romance'),
(7, 'Thriller'),
(8, 'Horreur'),
(9, 'Fantastique'),
(10, 'Animation'),
(11, 'Documentaire'),
(12, 'Historique'),
(13, 'Crime'),
(14, 'Guerre'),
(15, 'Biopic');

-- --------------------------------------------------------

--
-- Structure de la table `movies`
--

CREATE TABLE `movies` (
  `id_movie` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `releaseYear` int(11) NOT NULL,
  `author` varchar(200) NOT NULL,
  `likes` int(11) NOT NULL,
  `dislikes` int(11) NOT NULL,
  `img` text NOT NULL,
  `video` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `movies`
--

INSERT INTO `movies` (`id_movie`, `name`, `description`, `releaseYear`, `author`, `likes`, `dislikes`, `img`, `video`) VALUES
(1, 'Inception', 'Un voleur infiltre les rêves pour voler des secrets.', 2010, 'Christopher Nolan', 1283, 44, 'https://image.tmdb.org/t/p/w500/edv5CZvWj09upOsy2Y6IwDhK8bt.jpg', 'https://www.youtube.com/watch?v=YoHD9XEInc0'),
(2, 'Interstellar', 'Exploration spatiale pour sauver l’humanité.', 2014, 'Christopher Nolan', 1500, 60, 'https://image.tmdb.org/t/p/w500/rAiYTfKGqDCRIIqo664sY9XZIvQ.jpg', 'https://www.youtube.com/watch?v=zSWdZVtXT7E'),
(3, 'Avatar', 'Un marine découvre une planète extraterrestre.', 2009, 'James Cameron', 2000, 100, 'https://m.media-amazon.com/images/I/41kTVLeW1CL._AC_.jpg', 'https://www.youtube.com/watch?v=5PSNL1qE6VY'),
(4, 'Titanic', 'Une histoire d’amour sur un paquebot mythique.', 1997, 'James Cameron', 1800, 80, 'https://image.tmdb.org/t/p/w500/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg', 'https://www.youtube.com/watch?v=kVrqfYjkTdQ'),
(5, 'The Dark Knight', 'Batman affronte le Joker.', 2008, 'Christopher Nolan', 1700, 40, 'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg', 'https://www.youtube.com/watch?v=EXeTwQWrcwY'),
(6, 'Matrix', 'Un hacker découvre la réalité simulée.', 1999, 'Wachowski', 1600, 30, 'https://m.media-amazon.com/images/I/51vpnbwFHrL._AC_.jpg', 'https://www.youtube.com/watch?v=vKQi3bBA1y8'),
(7, 'Gladiator', 'Un général romain devient gladiateur.', 2000, 'Ridley Scott', 1432, 73, 'https://image.tmdb.org/t/p/w500/ty8TGRuvJLPUmAR1H1nRIsgwvim.jpg', 'https://www.youtube.com/watch?v=owK1qxDselE'),
(8, 'Jurassic Park', 'Des dinosaures recréés prennent le contrôle.', 1993, 'Steven Spielberg', 1300, 60, 'https://image.tmdb.org/t/p/w500/9i3plLl89DHMz7mahksDaAo7HIS.jpg', 'https://www.youtube.com/watch?v=QWBKEmWWL38'),
(9, 'Avengers Endgame', 'Les héros affrontent Thanos.', 2019, 'Marvel Studios', 2100, 120, 'https://m.media-amazon.com/images/I/81ExhpBEbHL._AC_SY679_.jpg', 'https://www.youtube.com/watch?v=TcMBFSGVi1c'),
(10, 'Forrest Gump', 'La vie extraordinaire d’un homme simple.', 1994, 'Robert Zemeckis', 1900, 20, 'https://image.tmdb.org/t/p/w500/clolk7rB5lAjs41SD0Vt6IXYLMm.jpg', 'https://www.youtube.com/watch?v=bLvqoHBptjg');

-- --------------------------------------------------------

--
-- Structure de la table `movies_categories`
--

CREATE TABLE `movies_categories` (
  `id_movies_categories` int(11) NOT NULL,
  `id_movie` int(11) NOT NULL,
  `id_category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `movies_categories`
--

INSERT INTO `movies_categories` (`id_movies_categories`, `id_movie`, `id_category`) VALUES
(1, 1, 3),
(2, 1, 1),
(3, 2, 3),
(4, 3, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id_movie`);

--
-- Index pour la table `movies_categories`
--
ALTER TABLE `movies_categories`
  ADD PRIMARY KEY (`id_movies_categories`),
  ADD KEY `id_movie` (`id_movie`),
  ADD KEY `id_category` (`id_category`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `movies`
--
ALTER TABLE `movies`
  MODIFY `id_movie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `movies_categories`
--
ALTER TABLE `movies_categories`
  MODIFY `id_movies_categories` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `movies_categories`
--
ALTER TABLE `movies_categories`
  ADD CONSTRAINT `movies_categories_ibfk_1` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`id_movie`),
  ADD CONSTRAINT `movies_categories_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id_categorie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
