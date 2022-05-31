-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2022 at 10:21 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zomato`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `review` varchar(256) DEFAULT NULL,
  `rating` smallint(6) DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `restaurants_id` int(11) NOT NULL,
  `accepted` tinyint(1) DEFAULT 0,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `review`, `rating`, `users_id`, `restaurants_id`, `accepted`, `date`) VALUES
(5, 'Works', 3, 7, 1, -1, '2022-05-29 18:25:55'),
(6, 'dfasfd asdf asd as', 3, 3, 3, 1, '2022-05-29 18:26:30'),
(8, 'asdasfasdf asd asw d as', 1, 7, 2, 1, '2022-05-29 18:27:29'),
(17, 'fixed', 3, 3, 2, -1, '2022-05-29 19:17:14'),
(18, 'Works', 3, 7, 3, 1, '2022-05-29 19:46:59');

-- --------------------------------------------------------

--
-- Table structure for table `cuisines`
--

CREATE TABLE `cuisines` (
  `id` int(11) NOT NULL,
  `cuisine` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cuisines`
--

INSERT INTO `cuisines` (`id`, `cuisine`) VALUES
(1, 'Lebanese'),
(2, 'Italian'),
(3, 'Chinese');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `rating` smallint(6) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `rating`, `description`, `icon`, `phone`, `location`) VALUES
(1, 'b2b', 0, 'test resto', NULL, '76069710', 'not availble'),
(2, 'KFC', 0, 'test kfc description', 'backend\\database\\images\\restaurants\\kfc.jpg', '76069710', 'test location kfc'),
(3, 'MiniB', 3, 'description of minib', '', '76069710', 'Dekweneh'),
(29, NULL, NULL, NULL, NULL, NULL, NULL),
(30, NULL, NULL, NULL, NULL, NULL, NULL),
(31, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'somethign', NULL, NULL, NULL, NULL, NULL),
(33, 'somethign2', NULL, 'tet', 'tebe', '3553', 'frgth'),
(34, 'asdasdasd', NULL, 'asdsaddas', NULL, 'asdasdasd', 'Beirut'),
(35, 'asdasdasdlklk', NULL, 'asdsaddas', 'images/restaurants/dice2.png', 'asdasdasd', 'Beirut'),
(36, 'asdasdasdkklkllkl', NULL, 'asdasdasd', 'images/restaurants/dice3.png', 'asdasdasdasd', 'Beirut');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_has_cuisines`
--

CREATE TABLE `restaurant_has_cuisines` (
  `id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `cuisine_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `restaurant_has_cuisines`
--

INSERT INTO `restaurant_has_cuisines` (`id`, `restaurant_id`, `cuisine_id`) VALUES
(8, 33, 1),
(9, 33, 3),
(10, 34, 1),
(11, 35, 1),
(12, 36, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role`, `user_id`) VALUES
(1, 1, 3),
(2, 0, 7);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(254) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(254) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `password`, `email`, `created_at`) VALUES
(3, 'elie', 'maj', 'elie00001', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'elie.maj@hotmail.com', '2022-05-27'),
(7, 'elie', 'maj', 'elie00002', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 'elie.maj2@hotmail.com', '2022-05-27'),
(23, '', '', 'testjs', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '12@12', '2022-05-30'),
(25, '', '', 'user12', '489cd5dbc708c7e541de4d7cd91ce6d0f1613573b7fc5b40d3942ccb9555cf35', '12345@12', '2022-05-30'),
(26, '', '', 'user124', '489cd5dbc708c7e541de4d7cd91ce6d0f1613573b7fc5b40d3942ccb9555cf35', '123455@12', '2022-05-30'),
(27, '', '', 'user124414', '489cd5dbc708c7e541de4d7cd91ce6d0f1613573b7fc5b40d3942ccb9555cf35', '12345122135@12', '2022-05-30'),
(28, '', '', 'asdas', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'a23@gmail.com', '2022-05-30'),
(29, '', '', 'xzcsacaca', 'f6f2ea8f45d8a057c9566a33f99474da2e5c6a6604d736121650e2730c6fb0a3', 'elie.majqweqweqw@hotmail.com', '2022-05-30'),
(30, '', '', 'xzcsacaca1', 'f6f2ea8f45d8a057c9566a33f99474da2e5c6a6604d736121650e2730c6fb0a3', 'elie.majqasdasweqweqw@hotmail.com', '2022-05-30'),
(31, '', '', 'elieuaca', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', '12123s@12', '2022-05-30'),
(32, '', '', '123 sda ', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6', 'elie.m123123aj@hotmail.com', '2022-05-30'),
(33, '', '', '1edas dq', 'c38777d1619a83b0ee9e6e23868bb47b29f81875090a0b5d4e607263df35fec1', '12321@gmail.com', '2022-05-30'),
(34, '', '', 'user1', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'william.hanna.52@hotmail.com', '2022-05-30'),
(35, '', '', '123 s232da', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 'test1313312312@gmail.com', '2022-05-30'),
(36, '', '', 'testcascade', 'jhh', 'jhjh', '2022-05-30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id` (`users_id`),
  ADD KEY `restaurants_id` (`restaurants_id`);

--
-- Indexes for table `cuisines`
--
ALTER TABLE `cuisines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_has_cuisines`
--
ALTER TABLE `restaurant_has_cuisines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_has_cuisines_ibfk_1` (`restaurant_id`),
  ADD KEY `restaurant_has_cuisines_ibfk_2` (`cuisine_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_ibfk_1` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `cuisines`
--
ALTER TABLE `cuisines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `restaurant_has_cuisines`
--
ALTER TABLE `restaurant_has_cuisines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`restaurants_id`) REFERENCES `restaurants` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `restaurant_has_cuisines`
--
ALTER TABLE `restaurant_has_cuisines`
  ADD CONSTRAINT `restaurant_has_cuisines_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `restaurant_has_cuisines_ibfk_2` FOREIGN KEY (`cuisine_id`) REFERENCES `cuisines` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
