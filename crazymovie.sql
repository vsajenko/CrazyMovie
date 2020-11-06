-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 06 nov. 2020 à 23:20
-- Version du serveur :  10.4.14-MariaDB
-- Version de PHP : 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `crazymovie`
--

-- --------------------------------------------------------

--
-- Structure de la table `actors`
--

CREATE TABLE `actors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `actors`
--

INSERT INTO `actors` (`id`, `name`, `gender`, `nationality`, `status`, `picture`) VALUES
(1, 'Jim Carrey', 'Male', 'Canada', 'Still a life', 'jimCarrey.jpg'),
(2, 'Cameron Diaz', 'Female', 'USA', 'Still a life', 'cameronDiaz.jpg'),
(3, 'Peter Greene', 'Male', 'USA', 'Still a life', 'peterGreene.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `actor_movie_director`
--

CREATE TABLE `actor_movie_director` (
  `actor_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Animation');

-- --------------------------------------------------------

--
-- Structure de la table `directors`
--

CREATE TABLE `directors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `directors`
--

INSERT INTO `directors` (`id`, `name`, `nationality`, `status`, `description`, `picture`) VALUES
(1, 'Quentin Tarantino', 'USA', 'Still a life', 'Director\r\nwriter\r\nproducer\r\nactor', 'tarantino.jpg'),
(2, 'Hayao Miyazaki', 'Japanese', 'Still a life', 'Animator, filmmaker, screen writer, author manga, artist', 'hayaoMiyazaki.jpg'),
(3, 'Chuck Russell', 'USA', 'Still a life', 'Film director, producer, screenwriter, actor', 'chuckRussell.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `views` int(11) NOT NULL,
  `director_id` int(11) NOT NULL,
  `release_date` date NOT NULL,
  `budget` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `imdb_link` varchar(255) NOT NULL,
  `trailer_link` varchar(255) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `category` int(11) NOT NULL,
  `pegi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `movies`
--

INSERT INTO `movies` (`id`, `title`, `views`, `director_id`, `release_date`, `budget`, `description`, `imdb_link`, `trailer_link`, `poster`, `category`, `pegi`) VALUES
(1, 'Kill Bill: Volume 1', 23164654, 1, '0000-00-00', 30000000, 'After awakening from a four-year coma, a former assassin wreaks vengeance on the team of assassins who betrayed her.', 'https://www.imdb.com/title/tt0266697/?ref_=fn_al_tt_1', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/7kSuas6mRpk\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'killbillVolume1.jpg', 1, 18),
(2, 'Kill Bill: Volume 2', 651616161, 1, '0000-00-00', 30000000, 'The Bride continues her quest of vengeance against her former boss and lover Bill, the reclusive bouncer Budd, and the treacherous, one-eyed Elle.', 'https://www.imdb.com/title/tt0378194/?ref_=nv_sr_srsg_0', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/WTt8cCIvGYI\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'killBillVolume2.jpg', 1, 18),
(3, 'Pulp Fiction', 654984, 1, '0000-00-00', 8000000, 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 'https://www.imdb.com/title/tt0110912/?ref_=fn_al_tt_1', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/s7EdQ4FqbhY\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'pulpFiction.jpg', 1, 18),
(4, 'Spirited Away', 1564213, 2, '0000-00-00', 2000000, 'During her family\'s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.', 'https://www.imdb.com/title/tt0245429/?ref_=fn_al_tt_1', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ByXuk9QqQkk\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'spiriteAaway.jpg', 1, 3),
(5, 'The Mask', 1651654, 3, '0000-00-00', 23000000, 'Bank clerk Stanley Ipkiss is transformed into a manic superhero when he wears a mysterious mask.', 'https://www.imdb.com/title/tt0110475/?ref_=fn_al_tt_1', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/LZl69yk5lEY\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'theMask.jpg', 1, 12);

-- --------------------------------------------------------

--
-- Structure de la table `movie_in_playlist`
--

CREATE TABLE `movie_in_playlist` (
  `playlist_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `playlist`
--

CREATE TABLE `playlist` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `age` date NOT NULL,
  `password` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `actor_movie_director`
--
ALTER TABLE `actor_movie_director`
  ADD KEY `director_id` (`actor_id`,`movie_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Index pour la table `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `director_id` (`director_id`),
  ADD KEY `category` (`category`);

--
-- Index pour la table `movie_in_playlist`
--
ALTER TABLE `movie_in_playlist`
  ADD KEY `playlist_id` (`playlist_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Index pour la table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `actors`
--
ALTER TABLE `actors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `directors`
--
ALTER TABLE `directors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `actor_movie_director`
--
ALTER TABLE `actor_movie_director`
  ADD CONSTRAINT `actor_movie_director_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `actor_movie_director_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `movie_in_playlist`
--
ALTER TABLE `movie_in_playlist`
  ADD CONSTRAINT `movie_in_playlist_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie_in_playlist_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
