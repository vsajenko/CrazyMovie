-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2020 at 04:32 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `crazymovie`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `actor_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`actor_id`, `name`, `gender`, `nationality`, `status`, `picture`) VALUES
(1, 'Jim Carrey', 'Male', 'Canada', 'Still a life', 'jimCarrey.jpg'),
(2, 'Cameron Diaz', 'Female', 'USA', 'Still a life', 'cameronDiaz.jpg'),
(3, 'Peter Greene', 'Male', 'USA', 'Still a life', 'peterGreene.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `actor_movie_director`
--

CREATE TABLE `actor_movie_director` (
  `actor_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(1, 'Action'),
(2, 'Comedy'),
(3, 'Animation');

-- --------------------------------------------------------

--
-- Table structure for table `directors`
--

CREATE TABLE `directors` (
  `director_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `directors`
--

INSERT INTO `directors` (`director_id`, `name`, `nationality`, `status`, `description`, `picture`) VALUES
(1, 'Quentin Tarantino', 'USA', 'Still a life', 'Director\r\nwriter\r\nproducer\r\nactor', 'tarantino.jpg'),
(2, 'Hayao Miyazaki', 'Japanese', 'Still a life', 'Animator, filmmaker, screen writer, author manga, artist', 'hayaoMiyazaki.jpg'),
(3, 'Chuck Russell', 'USA', 'Still a life', 'Film director, producer, screenwriter, actor', 'chuckRussell.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `views` int(11) NOT NULL,
  `director_id` int(11) NOT NULL,
  `release_date` varchar(255) NOT NULL,
  `budget` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `imdb_link` varchar(255) NOT NULL,
  `trailer_link` varchar(255) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `category` int(11) NOT NULL,
  `pegi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `views`, `director_id`, `release_date`, `budget`, `description`, `imdb_link`, `trailer_link`, `poster`, `category`, `pegi`) VALUES
(1, 'Kill Bill: Volume 1', 23164654, 1, 'October 10, 2003', 30000000, 'After awakening from a four-year coma, a former assassin wreaks vengeance on the team of assassins who betrayed her.', 'https://www.imdb.com/title/tt0266697/?ref_=fn_al_tt_1', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/7kSuas6mRpk\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'killbillVolume1.jpg', 1, 18),
(2, 'Kill Bill: Volume 2', 651616161, 1, 'April 16, 2004', 30000000, 'The Bride continues her quest of vengeance against her former boss and lover Bill, the reclusive bouncer Budd, and the treacherous, one-eyed Elle.', 'https://www.imdb.com/title/tt0378194/?ref_=nv_sr_srsg_0', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/WTt8cCIvGYI\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'killBillVolume2.jpg', 1, 18),
(3, 'Pulp Fiction', 654984, 1, 'October 14, 1994', 8000000, 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 'https://www.imdb.com/title/tt0110912/?ref_=fn_al_tt_1', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/s7EdQ4FqbhY\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'pulpFiction.jpg', 1, 18),
(4, 'Spirited Away', 1564213, 2, 'July 20, 2001', 2000000, 'During her family\'s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.', 'https://www.imdb.com/title/tt0245429/?ref_=fn_al_tt_1', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ByXuk9QqQkk\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'spiriteAaway.jpg', 1, 3),
(5, 'The Mask', 1651654, 3, 'July 29, 1994', 23000000, 'Bank clerk Stanley Ipkiss is transformed into a manic superhero when he wears a mysterious mask.', 'https://www.imdb.com/title/tt0110475/?ref_=fn_al_tt_1', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/LZl69yk5lEY\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'theMask.jpg', 1, 12);

-- --------------------------------------------------------

--
-- Table structure for table `movie_in_playlist`
--

CREATE TABLE `movie_in_playlist` (
  `playlist_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `age` int(2) NOT NULL,
  `password` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`actor_id`);

--
-- Indexes for table `actor_movie_director`
--
ALTER TABLE `actor_movie_director`
  ADD KEY `director_id` (`actor_id`,`movie_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `directors`
--
ALTER TABLE `directors`
  ADD PRIMARY KEY (`director_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `director_id` (`director_id`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `movie_in_playlist`
--
ALTER TABLE `movie_in_playlist`
  ADD KEY `playlist_id` (`playlist_id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actor_movie_director`
--
ALTER TABLE `actor_movie_director`
  ADD CONSTRAINT `actor_movie_director_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`actor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `actor_movie_director_ibfk_3` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `directors` (`director_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`category`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie_in_playlist`
--
ALTER TABLE `movie_in_playlist`
  ADD CONSTRAINT `movie_in_playlist_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movie_in_playlist_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
