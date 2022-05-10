-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2022 at 10:30 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taste1`
--

-- --------------------------------------------------------

--
-- Table structure for table `bestelling`
--

CREATE TABLE `bestelling` (
  `bestelling_id` int(50) NOT NULL,
  `tafel_nr` int(50) NOT NULL DEFAULT 1,
  `Eten` varchar(200) NOT NULL DEFAULT 'Hamburger',
  `drinken` varchar(200) NOT NULL DEFAULT 'Cola',
  `bestel_tijd` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medewerkers`
--

CREATE TABLE `medewerkers` (
  `medewerker_id` int(11) NOT NULL,
  `medewerker_user` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `medewerker_pwd` varchar(255) NOT NULL,
  `user_type` varchar(50) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medewerkers`
--

INSERT INTO `medewerkers` (`medewerker_id`, `medewerker_user`, `email`, `medewerker_pwd`, `user_type`) VALUES
(1, 'KKymo', '1234@hotmail.com', '$2y$10$gcxXGAu9NbnvwjC2MDke0uJthjJZd8xOnjozZj.7/Q3nr91x2kf.m', 'user'),
(0, 'Moreno', 'morenomartins70@gmail.com', '$2y$10$myWHekVHFZsy8DZ2pzoJLOmXMy04bLF7KNTeDq8FppcNr6s28CBD6', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `reserveren`
--

CREATE TABLE `reserveren` (
  `reserver_id` int(50) NOT NULL,
  `dag` date NOT NULL,
  `klantnaam` varchar(200) NOT NULL,
  `klantemail` varchar(200) NOT NULL,
  `telefoon` varchar(255) NOT NULL,
  `aantal_personen` int(50) NOT NULL,
  `reserver_tijd` time NOT NULL,
  `jarige` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
