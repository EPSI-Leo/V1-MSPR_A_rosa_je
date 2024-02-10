-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 10, 2024 at 08:20 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arosaje`
--

-- --------------------------------------------------------

--
-- Table structure for table `advices`
--

DROP TABLE IF EXISTS `advices`;
CREATE TABLE IF NOT EXISTS `advices` (
  `id` varchar(191) DEFAULT NULL,
  `id_user` varchar(191) DEFAULT NULL,
  `id_plant` varchar(191) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `advice` text,
  KEY `id_user` (`id_user`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `advices`
--

INSERT INTO `advices` (`id`, `id_user`, `id_plant`, `name`, `advice`) VALUES
('254f3e7f-2784-4968-bb22-1263172c2666', 'admin', NULL, 'Rose', 'Ne pas enlever les épines'),
('cb83522e-6424-4f0d-a8bf-9a3e48aa1c25', 'admin', NULL, 'Tournesol', 'On peut manger les graines, ou en faire de l\'huile'),
('57a55890-c755-4b6e-9928-f6bf41377bb4', 'admin', NULL, 'Muguet', 'C\'est toxic');

-- --------------------------------------------------------

--
-- Table structure for table `plants`
--

DROP TABLE IF EXISTS `plants`;
CREATE TABLE IF NOT EXISTS `plants` (
  `id` varchar(191) DEFAULT NULL,
  `id_user` varchar(191) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `beginAt` date DEFAULT NULL,
  `endAt` date DEFAULT NULL,
  `description` text,
  `picture` longblob,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plants`
--

INSERT INTO `plants` (`id`, `id_user`, `name`, `beginAt`, `endAt`, `description`, `picture`, `latitude`, `longitude`) VALUES
('bd2c4491-a99d-41e5-8017-b52d353ddb69', 'admin', 'Tournesol', '2024-02-09', '2024-02-09', 'Soleil', '', 45.54705, 5.97151),
('55e568a2-ae6c-40da-8e37-5eae59ff6455', 'admin', 'Orchidée', '2024-02-09', '2024-02-09', 'Arroser', '', 45.54725, 5.97131),
('3f667638-1e3b-49e4-883c-bc470dee5d38', 'admin', 'Rose', '2024-02-09', '2024-02-09', 'Tailler', '', 45.547041, 5.97152),
('89bab69b-5c00-4c26-80d3-d3d3bc564519', 'admin', 'Salon', '2024-02-10', '2024-02-17', 'test de mon salon', NULL, 37.4219983, -122.084),
('e833bbd9-ee3e-4846-96b3-263ed9671279', 'admin', 'Salon', '2024-02-10', '2024-02-17', 'test de mon salon', NULL, 37.4219991, -122.0840011),
('c68b342f-a6fb-42c7-86cb-81d7c8895ded', 'admin', 'Salon', '2024-02-10', '2024-02-17', 'test de mon salon', NULL, 37.4219983, -122.084),
('d5d3d941-5879-4525-a4e1-8f504fd9f9b1', 'admin', 'test', '2025-02-10', '2024-02-07', 'test', NULL, 37.4219991, -122.0840011),
('1315518f-680b-4d9f-9ac9-ee85627c5b6e', 'admin', 'test', '2022-02-10', '2024-02-15', 'test', NULL, 37.4219991, -122.0840011);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` varchar(191) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`) VALUES
('admin', 'alexis');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
