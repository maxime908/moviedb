-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : sam. 21 mars 2026 à 22:33
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
(15, 'Biopic'),
(17, 'Super-héros'),
(18, 'Psychologique'),
(19, 'Famille'),
(20, 'Aventure épique'),
(21, 'Post-apocalyptique'),
(22, 'Survie'),
(23, 'Policier'),
(24, 'Enquête'),
(25, 'Espionnage'),
(26, 'Cyberpunk'),
(27, 'Space Opera'),
(28, 'Alien'),
(29, 'Monstre'),
(30, 'Zombie'),
(31, 'Vampire'),
(32, 'Magie'),
(33, 'Fantaisie sombre'),
(34, 'Médiéval'),
(35, 'Mythologie'),
(36, 'Antiquité'),
(37, 'Sport'),
(38, 'Musical'),
(39, 'Danse'),
(40, 'Road Trip'),
(41, 'Teen'),
(42, 'Lycée'),
(43, 'Université'),
(44, 'Buddy Movie'),
(45, 'Braquage'),
(46, 'Prison'),
(47, 'Politique'),
(48, 'Justice'),
(49, 'Procès'),
(50, 'Business'),
(51, 'Finance'),
(52, 'Technologie'),
(53, 'IA'),
(54, 'Voyage dans le temps'),
(55, 'Multivers'),
(56, 'Réalité virtuelle'),
(57, 'Catastrophe'),
(58, 'Nature'),
(59, 'Animaux'),
(60, 'Pirates'),
(61, 'Western'),
(62, 'Samouraï'),
(63, 'Arts martiaux'),
(64, 'Guerre moderne'),
(65, 'Guerre antique'),
(66, 'Docu-fiction');

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
(12, 'Inception', 'Un voleur capable d’entrer dans les rêves doit accomplir une mission impossible : implanter une idée.', 2010, 'Christopher Nolan', 3978, 1041, 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/watch?v=YoHD9XEInc0'),
(13, 'Interstellar', 'Une équipe explore un trou de ver pour sauver l’humanité d’une extinction imminente.', 2014, 'Christopher Nolan', 9672, 638, 'https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg', 'https://www.youtube.com/watch?v=zSWdZVtXT7E'),
(14, 'The Dark Knight', 'Batman affronte le Joker, un criminel imprévisible qui sème le chaos à Gotham.', 2008, 'Christopher Nolan', 9979, 987, 'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg', 'https://www.youtube.com/watch?v=EXeTwQWrcwY'),
(15, 'Pulp Fiction', 'Les vies de criminels s’entrecroisent dans une série d’histoires violentes et décalées.', 1994, 'Quentin Tarantino', 4546, 388, 'https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg', 'https://www.youtube.com/watch?v=s7EdQ4FqbhY'),
(16, 'Fight Club', 'Un employé de bureau forme un club de combat clandestin qui dégénère.', 1999, 'David Fincher', 8571, 1113, 'https://image.tmdb.org/t/p/w500/bptfVGEQuv6vDTIMVCHjJ9Dz8PX.jpg', 'https://www.youtube.com/watch?v=SUXWAEX2jlg'),
(17, 'Forrest Gump', 'Un homme simple traverse les moments clés de l’histoire américaine.', 1994, 'Robert Zemeckis', 3931, 786, 'https://image.tmdb.org/t/p/w500/arw2vcBveWOVZr6pxd9XTd1TdQa.jpg', 'https://www.youtube.com/watch?v=bLvqoHBptjg'),
(18, 'The Matrix', 'Un hacker découvre la vérité sur la réalité simulée appelée Matrix.', 1999, 'Lana Wachowski', 9543, 2209, 'https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg', 'https://www.youtube.com/watch?v=vKQi3bBA1y8'),
(19, 'Gladiator', 'Un général romain trahi cherche vengeance dans l’arène.', 2000, 'Ridley Scott', 7945, 1568, 'https://image.tmdb.org/t/p/w500/ty8TGRuvJLPUmAR1H1nRIsgwvim.jpg', 'https://www.youtube.com/watch?v=owK1qxDselE'),
(20, 'Titanic', 'Une histoire d’amour tragique à bord du Titanic.', 1997, 'James Cameron', 7067, 1186, 'https://image.tmdb.org/t/p/w500/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg', 'https://www.youtube.com/watch?v=kVrqfYjkTdQ'),
(21, 'Jurassic Park', 'Des scientifiques recréent des dinosaures dans un parc qui tourne mal.', 1993, 'Steven Spielberg', 4761, 1003, 'https://fr.web.img2.acsta.net/medias/nmedia/00/02/11/66/affiche.jpg', 'https://www.youtube.com/watch?v=lc0UehYemQA'),
(22, 'Avengers: Endgame', 'Les Avengers affrontent Thanos pour sauver l’univers.', 2019, 'Anthony Russo', 8834, 822, 'https://image.tmdb.org/t/p/w500/or06FN3Dka5tukK1e9sl16pB3iy.jpg', 'https://www.youtube.com/watch?v=TcMBFSGVi1c'),
(23, 'Spider-Man: No Way Home', 'Spider-Man fait face aux conséquences de son identité révélée.', 2021, 'Jon Watts', 7014, 1212, 'https://image.tmdb.org/t/p/w500/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg', 'https://www.youtube.com/watch?v=JfVOs4VSpmA'),
(24, 'The Lion King', 'Un jeune lion doit accepter son destin de roi.', 1994, 'Roger Allers', 5750, 254, 'https://image.tmdb.org/t/p/w500/2bXbqYdUdNVa8VIWXVfclP2ICtT.jpg', 'https://www.youtube.com/watch?v=7TavVZMewpY'),
(25, 'Frozen', 'Deux sœurs découvrent le pouvoir de la glace et de l’amour.', 2013, 'Chris Buck', 8125, 1512, 'https://image.tmdb.org/t/p/w500/kgwjIb2JDHRhNk13lmSxiClFjVk.jpg', 'https://www.youtube.com/watch?v=TbQm5doF_Uc'),
(26, 'Joker', 'Un homme sombre bascule dans la folie et devient le Joker.', 2019, 'Todd Phillips', 4635, 635, 'https://image.tmdb.org/t/p/w500/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg', 'https://www.youtube.com/watch?v=zAGVQLHvwOY'),
(27, 'Avatar', 'Un marine découvre un monde extraterrestre fascinant et dangereux.', 2009, 'James Cameron', 6935, 202, 'https://image.tmdb.org/t/p/w500/kyeqWdyUXW608qlYkRqosgbbJyK.jpg', 'https://www.youtube.com/watch?v=5PSNL1qE6VY'),
(28, 'Avengers: Infinity War', 'Les Avengers tentent d’empêcher Thanos de réunir les pierres d’infinité.', 2018, 'Anthony Russo', 2050, 451, 'https://image.tmdb.org/t/p/w500/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg', 'https://www.youtube.com/watch?v=6ZfuNTqbHE8'),
(29, 'Iron Man', 'Un industriel devient le super-héros Iron Man.', 2008, 'Jon Favreau', 8533, 168, 'https://image.tmdb.org/t/p/w500/78lPtwv72eTNqFW9COBYI0dWDJa.jpg', 'https://www.youtube.com/watch?v=8ugaeA-nMTc'),
(30, 'Thor', 'Le dieu du tonnerre est exilé sur Terre et doit prouver sa valeur.', 2011, 'Kenneth Branagh', 5674, 1091, 'https://image.tmdb.org/t/p/w500/prSfAi1xGrhLQNxVSUFh61xQ4Qy.jpg', 'https://www.youtube.com/watch?v=JOddp-nlNvQ'),
(31, 'Captain America: The First Avenger', 'Un soldat devient Captain America pendant la Seconde Guerre mondiale.', 2011, 'Joe Johnston', 3015, 529, 'https://image.tmdb.org/t/p/w500/vSNxAJTlD0r02V9sPYpOjqDZXUK.jpg', 'https://www.youtube.com/watch?v=JerVrbLldXw'),
(32, 'Shrek', 'Un ogre part sauver une princesse dans une aventure drôle et décalée.', 2001, 'Andrew Adamson', 8214, 866, 'https://image.tmdb.org/t/p/w500/iB64vpL3dIObOtMZgX3RqdVdQDc.jpg', 'https://www.youtube.com/watch?v=CwXOrWvPBPk'),
(33, 'Toy Story', 'Des jouets prennent vie quand les humains ne sont pas là.', 1995, 'John Lasseter', 10924, 1337, 'https://image.tmdb.org/t/p/w500/uXDfjJbdP4ijW5hWSBrPrlKpxab.jpg', 'https://www.youtube.com/watch?v=KYz2wyBy3kc'),
(34, 'Finding Nemo', 'Un poisson clown traverse l’océan pour retrouver son fils.', 2003, 'Andrew Stanton', 5626, 994, 'https://image.tmdb.org/t/p/w500/eHuGQ10FUzK1mdOY69wF5pGgEf5.jpg', 'https://www.youtube.com/watch?v=wZdpNglLbt8'),
(35, 'Up', 'Un vieil homme s’envole vers l’aventure avec sa maison.', 2009, 'Pete Docter', 10574, 1650, 'https://image.tmdb.org/t/p/w500/vpbaStTMt8qqXaEgnOR2EE4DNJk.jpg', 'https://www.youtube.com/watch?v=pkqzFUhGPJg'),
(36, 'Coco', 'Un jeune garçon découvre ses racines dans le monde des morts.', 2017, 'Lee Unkrich', 2281, 397, 'https://image.tmdb.org/t/p/w500/gGEsBPAijhVUFoiNpgZXqRVWJt2.jpg', 'https://www.youtube.com/watch?v=Rvr68u6k5sI'),
(37, 'The Shawshank Redemption', 'Un homme est injustement emprisonné et garde espoir.', 1994, 'Frank Darabont', 10173, 1054, 'https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg', 'https://www.youtube.com/watch?v=NmzuHjWmXOc'),
(38, 'The Godfather', 'L’histoire d’une famille mafieuse influente.', 1972, 'Francis Ford Coppola', 4755, 486, 'https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg', 'https://www.youtube.com/watch?v=sY1S34973zA'),
(39, 'The Godfather Part II', 'La suite des conflits au sein de la famille Corleone.', 1974, 'Francis Ford Coppola', 10786, 1197, 'https://image.tmdb.org/t/p/w500/hek3koDUyRQk7FIhPXsa6mT2Zc3.jpg', 'https://www.youtube.com/watch?v=9O1Iy9od7-A'),
(40, 'The Social Network', 'La création de Facebook et ses conséquences.', 2010, 'David Fincher', 4134, 1188, 'https://m.media-amazon.com/images/S/pv-target-images/ea4f1c75ddd9fd937a77875d48f9ce8225ed954afcefabe7a2195311b1a97ddd.jpg', 'https://www.youtube.com/watch?v=lB95KLmpLR4'),
(41, 'Whiplash', 'Un jeune batteur subit un entraînement intense pour réussir.', 2014, 'Damien Chazelle', 3478, 904, 'https://image.tmdb.org/t/p/w500/oPxnRhyAIzJKGUEdSiwTJQBa3NM.jpg', 'https://www.youtube.com/watch?v=7d_jQycdQGo'),
(42, 'Django Unchained', 'Un esclave libéré part en quête de vengeance.', 2012, 'Quentin Tarantino', 10871, 2730, 'https://image.tmdb.org/t/p/w500/7oWY8VDWW7thTzWh3OKYRkWUlD5.jpg', 'https://www.youtube.com/watch?v=eUdM9vrCbow'),
(43, 'Kill Bill: Vol. 1', 'Une femme cherche vengeance contre ses anciens partenaires.', 2003, 'Quentin Tarantino', 7240, 237, 'https://image.tmdb.org/t/p/w500/v7TaX8kXMXs5yFFGR41guUDNcnB.jpg', 'https://www.youtube.com/watch?v=7kSuas6mRpk'),
(44, 'Inglourious Basterds', 'Des soldats infiltrent la France occupée pendant la guerre.', 2009, 'Quentin Tarantino', 11734, 1900, 'https://image.tmdb.org/t/p/w500/7sfbEnaARXDDhKm0CZ7D7uc2sbo.jpg', 'https://www.youtube.com/watch?v=KnrRy6kSFF0'),
(45, 'The Wolf of Wall Street', 'L’ascension et la chute d’un trader sans limites.', 2013, 'Martin Scorsese', 9779, 794, 'https://image.tmdb.org/t/p/w500/34m2tygAYBGqA9MXKhRDtzYd4MR.jpg', 'https://www.youtube.com/watch?v=iszwuX1AK6A'),
(46, 'Shutter Island', 'Un marshal enquête sur une île mystérieuse.', 2010, 'Martin Scorsese', 2201, 190, 'https://image.tmdb.org/t/p/w500/kve20tXwUZpu4GUX8l6X7Z4jmL6.jpg', 'https://www.youtube.com/watch?v=5iaYLCiq5RM'),
(47, 'Harry Potter and the Sorcerer\'s Stone', 'Un jeune sorcier découvre le monde magique.', 2001, 'Chris Columbus', 5806, 67, 'https://image.tmdb.org/t/p/w500/wuMc08IPKEatf9rnMNXvIDxqP4W.jpg', 'https://www.youtube.com/watch?v=VyHV0BRtdxo'),
(48, 'Harry Potter and the Chamber of Secrets', 'Harry découvre sa troisième année à Poudlard avec l’arrivée du mystérieux Sirius Black.', 2002, 'Chris Columbus', 2511, 105, 'https://image.tmdb.org/t/p/w500/sdEOH0992YZ0QSxgXNIGLq1ToUi.jpg', 'https://www.youtube.com/watch?v=1bq0qff4iF8'),
(49, 'Harry Potter and the Prisoner of Azkaban', 'Harry affronte de nouveaux dangers et secrets dans la Chambre des Secrets.', 2004, 'Alfonso Cuarón', 7451, 685, 'https://image.tmdb.org/t/p/w500/aWxwnYoe8p2d2fcxOqtvAtJ72Rw.jpg', 'https://www.youtube.com/watch?v=lAxgztbYDbs'),
(50, 'The Lord of the Rings: The Fellowship of the Ring', 'Frodon entame son voyage pour détruire l’Anneau unique accompagné de la Communauté.', 2001, 'Peter Jackson', 10962, 1849, 'https://image.tmdb.org/t/p/w500/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg', 'https://www.youtube.com/watch?v=V75dMMIW2B4'),
(51, 'The Lord of the Rings: The Two Towers', 'La Terre du Milieu est en guerre alors que la Communauté est séparée.', 2002, 'Peter Jackson', 3223, 894, 'https://image.tmdb.org/t/p/w500/5VTN0pR8gcqV3EPUHHfMGnJYN9L.jpg', 'https://www.youtube.com/watch?v=LbfMDwc4azU'),
(52, 'The Lord of the Rings: The Return of the King', 'La bataille finale pour la Terre du Milieu commence contre Sauron.', 2003, 'Peter Jackson', 4571, 701, 'https://image.tmdb.org/t/p/w500/rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg', 'https://www.youtube.com/watch?v=r5X-hFf6Bwo'),
(53, 'Mad Max: Fury Road', 'Dans un désert post-apocalyptique, Max aide Furiosa à fuir un tyran.', 2015, 'George Miller', 9843, 1147, 'https://image.tmdb.org/t/p/w500/8tZYtuWezp8JbcsvHYO0O46tFbo.jpg', 'https://www.youtube.com/watch?v=hEJnMQG9ev8'),
(54, 'John Wick', 'Un ancien tueur à gages reprend du service après un acte de violence personnel.', 2014, 'Chad Stahelski', 7886, 1840, 'https://m.media-amazon.com/images/M/MV5BMTU2NjA1ODgzMF5BMl5BanBnXkFtZTgwMTM2MTI4MjE@._V1_FMjpg_UX1000_.jpg', 'https://www.youtube.com/watch?v=2AUmvWm5ZDQ'),
(55, 'John Wick: Chapter 2', 'John Wick doit honorer un ancien contrat dans un monde de tueurs.', 2017, 'Chad Stahelski', 3236, 276, 'https://m.media-amazon.com/images/I/81dh-JRB37L._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/watch?v=XGk2EfbD_Ps'),
(56, 'Deadpool', 'Un anti-héros immortel se lance dans une mission pleine d’humour et de violence.', 2016, 'Tim Miller', 2520, 307, 'https://image.tmdb.org/t/p/w500/3E53WEZJqP6aM84D8CckXx4pIHw.jpg', 'https://www.youtube.com/watch?v=ONHBaC-pfsk'),
(57, 'Logan', 'Un mutant vieillissant protège une jeune fille aux pouvoirs similaires.', 2017, 'James Mangold', 10762, 522, 'https://image.tmdb.org/t/p/w500/gGBu0hKw9BGddG8RkRAMX7B6NDB.jpg', 'https://www.youtube.com/watch?v=Div0iP65aZo'),
(58, 'The Revenant', 'Un trappeur lutte pour survivre après avoir été laissé pour mort.', 2015, 'Alejandro González Iñárritu', 3795, 470, 'https://fr.web.img3.acsta.net/pictures/15/11/10/09/30/165611.jpg', 'https://www.youtube.com/watch?v=LoebZZ8K5N0'),
(59, '1917', 'Deux soldats doivent traverser le front pour sauver un bataillon.', 2019, 'Sam Mendes', 7238, 829, 'https://image.tmdb.org/t/p/w500/iZf0KyrE25z1sage4SYFLCCrMi9.jpg', 'https://www.youtube.com/watch?v=YqNYrYUiMfg'),
(60, 'Parasite', 'Une famille pauvre infiltre une famille riche avec des conséquences inattendues.', 2019, 'Bong Joon-ho', 5372, 872, 'https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg', 'https://www.youtube.com/watch?v=5xH0HfJHsaY'),
(61, 'Oldboy', 'Un homme est mystérieusement emprisonné pendant 15 ans sans explication.', 2003, 'Park Chan-wook', 8926, 2250, 'https://image.tmdb.org/t/p/w500/pWDtjs568ZfOTMbURQBYuT4Qxka.jpg', 'https://www.youtube.com/watch?v=2HkjrJ6IK5E'),
(62, 'The Conjuring', 'Des enquêteurs paranormaux affrontent une présence démoniaque.', 2013, 'James Wan', 3240, 96, 'https://image.tmdb.org/t/p/w500/wVYREutTvI2tmxr6ujrHT704wGF.jpg', 'https://www.youtube.com/watch?v=k10ETZ41q5o'),
(63, 'Insidious', 'Une famille est hantée par des esprits maléfiques liés à un autre monde.', 2010, 'James Wan', 3225, 305, 'https://m.media-amazon.com/images/I/512C7+nFfCL._AC_UF894,1000_QL80_.jpg', 'https://www.youtube.com/watch?v=zuZnRUcoWos'),
(64, 'It', 'Un clown maléfique terrorise des enfants dans une petite ville.', 2017, 'Andy Muschietti', 4110, 133, 'https://image.tmdb.org/t/p/w500/9E2y5Q7WlCVNEhP5GiVTjhEhx1o.jpg', 'https://www.youtube.com/watch?v=xKJmEC5ieOk'),
(65, 'A Quiet Place', 'Une famille doit vivre en silence pour survivre à des créatures.', 2018, 'John Krasinski', 11075, 709, 'https://image.tmdb.org/t/p/w500/nAU74GmpUk7t5iklEp3bufwDq4n.jpg', 'https://www.youtube.com/watch?v=WR7cc5t7tv8'),
(66, 'Get Out', 'Un jeune homme découvre un terrible secret chez sa belle-famille.', 2017, 'Jordan Peele', 5437, 128, 'https://m.media-amazon.com/images/I/81lp-z-Sj4L._AC_UF1000,1000_QL80_.jpg', 'https://www.youtube.com/watch?v=DzfpyUB60YY');

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
(251, 57, 1),
(252, 56, 1),
(255, 53, 1),
(256, 60, 4),
(257, 59, 4),
(259, 57, 4),
(260, 56, 5),
(262, 65, 7),
(263, 64, 7),
(265, 62, 7),
(266, 61, 7),
(269, 53, 7),
(270, 65, 8),
(271, 64, 8),
(273, 62, 8),
(274, 52, 9),
(275, 51, 9),
(276, 50, 9),
(277, 49, 9),
(278, 48, 9),
(280, 61, 13),
(281, 60, 13),
(282, 59, 14),
(316, 13, 3),
(317, 13, 4),
(318, 14, 1),
(319, 14, 7),
(320, 15, 13),
(321, 15, 4),
(322, 16, 7),
(323, 16, 4),
(324, 17, 4),
(325, 17, 6),
(326, 18, 3),
(327, 18, 1),
(328, 19, 1),
(329, 19, 14),
(330, 20, 6),
(331, 20, 4),
(334, 22, 1),
(335, 22, 3),
(336, 23, 1),
(337, 23, 3),
(338, 24, 10),
(339, 24, 4),
(340, 25, 10),
(341, 25, 5),
(342, 26, 4),
(343, 26, 13),
(344, 27, 3),
(345, 27, 9),
(346, 28, 1),
(347, 28, 3),
(348, 29, 1),
(349, 29, 3),
(350, 30, 1),
(351, 30, 9),
(352, 31, 1),
(353, 31, 14),
(354, 32, 10),
(355, 32, 5),
(356, 33, 10),
(357, 33, 5),
(358, 34, 10),
(359, 34, 4),
(360, 35, 10),
(361, 35, 4),
(362, 36, 10),
(363, 36, 4),
(364, 37, 4),
(365, 37, 13),
(366, 38, 13),
(367, 38, 4),
(368, 39, 13),
(369, 39, 4),
(372, 41, 4),
(373, 41, 15),
(374, 42, 1),
(375, 42, 4),
(376, 43, 1),
(377, 43, 7),
(378, 44, 1),
(379, 44, 14),
(380, 45, 4),
(381, 45, 13),
(382, 46, 7),
(383, 46, 4),
(384, 47, 9),
(385, 47, 1),
(386, 12, 3),
(387, 12, 7),
(388, 21, 3),
(389, 21, 9),
(390, 40, 4),
(391, 40, 15),
(392, 54, 1),
(393, 54, 7),
(394, 55, 1),
(395, 55, 7),
(396, 58, 4),
(397, 58, 14),
(398, 63, 7),
(399, 63, 8),
(400, 66, 7),
(401, 66, 13);

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
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT pour la table `movies`
--
ALTER TABLE `movies`
  MODIFY `id_movie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT pour la table `movies_categories`
--
ALTER TABLE `movies_categories`
  MODIFY `id_movies_categories` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=402;

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
