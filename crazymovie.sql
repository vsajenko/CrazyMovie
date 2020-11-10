-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2020 at 02:46 PM
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
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actors`
--

INSERT INTO `actors` (`id`, `name`, `gender`, `nationality`, `status`, `picture`) VALUES
(1, 'Jim Carrey', 'Male', 'Canada', 'Still a life', 'jimCarrey.jpg'),
(2, 'Cameron Diaz', 'Female', 'USA', 'Still a life', 'cameronDiaz.jpg'),
(3, 'Peter Greene', 'Male', 'USA', 'Still a life', 'peterGreene.jpg'),
(4, 'John Travolta', 'male', 'USA', 'In activity', 'travolta.png'),
(5, 'Uma Thurman', 'Female', 'USA', 'In activity', 'umaTruman.png'),
(7, 'Samuel Lee Jackson', 'Male', 'USA', 'In activity', 'samuelLeeJackson.png'),
(8, 'Bruce Willis', 'Male', 'USA', 'Alive in Activity', 'bruceWillis.png');

-- --------------------------------------------------------

--
-- Table structure for table `actor_movie_director`
--

CREATE TABLE `actor_movie_director` (
  `actor_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `actor_movie_director`
--

INSERT INTO `actor_movie_director` (`actor_id`, `movie_id`) VALUES
(1, 5),
(4, 3),
(5, 1),
(5, 2),
(5, 3),
(5, 3),
(7, 3);

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
(3, 'Animation'),
(4, 'Fantasy'),
(5, 'Horror'),
(6, 'Romance'),
(7, 'Thriller'),
(8, 'Drama');

-- --------------------------------------------------------

--
-- Table structure for table `directors`
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
-- Dumping data for table `directors`
--

INSERT INTO `directors` (`id`, `name`, `nationality`, `status`, `description`, `picture`) VALUES
(1, 'Quentin Tarantino', 'USA', 'Still a life', 'Director\r\nwriter\r\nproducer\r\nactor', 'tarantino.jpg'),
(2, 'Hayao Miyazaki', 'Japanese', 'Still a life', 'Animator, filmmaker, screen writer, author manga, artist', 'hayaoMiyazaki.jpg'),
(3, 'Chuck Russell', 'USA', 'Still a life', 'Film director, producer, screenwriter, actor', 'chuckRussell.jpg'),
(4, 'George Lucas', 'USA', 'Still a life', 'George Walton Lucas Jr. is an American film director, producer, screenwriter, and entrepreneur. Lucas is best known for creating the Star Wars and Indiana Jones franchises and founding Lucasfilm, LucasArts, and Industrial Light & Magic', 'georgelucas.jp');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `views` varchar(255) NOT NULL,
  `director_id` int(11) NOT NULL,
  `release_date` date NOT NULL,
  `budget` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `imdb_link` varchar(255) NOT NULL,
  `trailer_link` varchar(255) NOT NULL,
  `poster` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `pegi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `views`, `director_id`, `release_date`, `budget`, `description`, `imdb_link`, `trailer_link`, `poster`, `category_id`, `pegi`) VALUES
(1, 'Kill Bill: Volume 1', '23164654', 1, '0000-00-00', 30000000, 'After awakening from a four-year coma, a former assassin wreaks vengeance on the team of assassins who betrayed her.', 'https://www.imdb.com/title/tt0266697/?ref_=fn_al_tt_1', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/7kSuas6mRpk\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'killbillVolume1.jpg', 1, 18),
(2, 'Kill Bill: Volume 2', '651616161', 1, '0000-00-00', 30000000, 'The Bride continues her quest of vengeance against her former boss and lover Bill, the reclusive bouncer Budd, and the treacherous, one-eyed Elle.', 'https://www.imdb.com/title/tt0378194/?ref_=nv_sr_srsg_0', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/WTt8cCIvGYI\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'killBillVolume2.jpg', 1, 18),
(3, 'Pulp Fiction', '654984', 1, '0000-00-00', 8000000, 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 'https://www.imdb.com/title/tt0110912/?ref_=fn_al_tt_1', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/s7EdQ4FqbhY\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'pulpFiction.jpg', 1, 18),
(4, 'Spirited Away', '1564213', 2, '0000-00-00', 2000000, 'During her family\'s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts.', 'https://www.imdb.com/title/tt0245429/?ref_=fn_al_tt_1', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/ByXuk9QqQkk\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'spiriteAaway.jpg', 3, 3),
(5, 'The Mask', '1651654', 3, '0000-00-00', 23000000, 'Bank clerk Stanley Ipkiss is transformed into a manic superhero when he wears a mysterious mask.', 'https://www.imdb.com/title/tt0110475/?ref_=fn_al_tt_1', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/LZl69yk5lEY\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'theMask.jpg', 2, 12),
(6, 'Star Wars: The Phantom Menace', '1145', 4, '0000-00-00', 115000000, 'Two Jedi escape a hostile blockade to find allies and come across a young boy who may bring balance to the Force, but the long dormant Sith resurface to claim their original glory.', 'https://www.imdb.com/title/tt0120915/?ref_=kw_li_tt', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/bD7bpG-zDJQ\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'starWarsEpisodeIThePhantom.jpg', 4, 7),
(7, 'Star Wars: Episode IV - A New Hope', '773733', 4, '0000-00-00', 275000000, 'Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire\'s world-destroying battle station, while also attempting to rescue Princess Leia from the mysterious Darth Vader.', 'https://www.imdb.com/title/tt0076759/?ref_=nm_flmg_wr_155', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vZ734NWnAHA\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'starWarsEpisodeIVANewHope.jpg', 4, 7),
(8, 'Star Wars: Episode V - The Empire Strikes Back', '757575', 4, '0000-00-00', 550000000, 'After the Rebels are brutally overpowered by the Empire on the ice planet Hoth, Luke Skywalker begins Jedi training with Yoda, while his friends are pursued by Darth Vader and a bounty hunter named Boba Fett all over the galaxy.', 'https://www.imdb.com/title/tt0080684/?ref_=nm_flmg_wr_151', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/JNwNXF9Y6kY\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'starWarsEpisodeVTheEmpireStrikesBack.jpg', 4, 7),
(9, 'Star Wars: Episode VI - Return of the Jedi', '537753', 4, '0000-00-00', 475000000, 'After a daring mission to rescue Han Solo from Jabba the Hutt, the Rebels dispatch to Endor to destroy the second Death Star. Meanwhile, Luke struggles to help Darth Vader back from the dark side without falling into the Emperor\'s trap.', 'https://www.imdb.com/title/tt0086190/?ref_=nm_flmg_wr_147', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/7L8p7_SLzvU\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture\" allowfullscreen></iframe>', 'starWarsEpisodeVIReturnoftheJedi.jpg', 4, 7);

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
  `userName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `age` date NOT NULL,
  `password` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userName`, `email`, `age`, `password`) VALUES
(3, 'user3', 'user3@gmail.com', '1999-09-30', '$2y$10$I/PUx2CWzJTzq6ti7ciy0.Vd.sKgq8OJ3U7pq8Ol.6tBO.vgEir4m');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `director_id` (`director_id`),
  ADD KEY `category` (`category_id`);

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `directors`
--
ALTER TABLE `directors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actor_movie_director`
--
ALTER TABLE `actor_movie_director`
  ADD CONSTRAINT `actor_movie_director_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `actor_movie_director_ibfk_2` FOREIGN KEY (`actor_id`) REFERENCES `actors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movies`
--
ALTER TABLE `movies`
  ADD CONSTRAINT `movies_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `directors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movies_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
