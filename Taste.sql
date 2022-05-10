-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2021 at 10:26 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `taste`
--

-- --------------------------------------------------------

--
-- Table structure for table `bestelling_drank`
--

CREATE TABLE `bestelling_drank` (
  `bestellingsnummer_drank` int(11) NOT NULL,
  `hoort_bij_tafel_nr` int(50) NOT NULL,
  `drank1` varchar(200) NOT NULL,
  `drank2` varchar(200) NOT NULL,
  `drank3` varchar(200) NOT NULL,
  `drank4` varchar(200) NOT NULL,
  `drank5` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bestelling_drank`
--

INSERT INTO `bestelling_drank` (`bestellingsnummer_drank`, `hoort_bij_tafel_nr`, `drank1`, `drank2`, `drank3`, `drank4`, `drank5`) VALUES
(5, 12, 'cola', 'pepsi', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `bestelling_eten`
--

CREATE TABLE `bestelling` (
  `bestelling_id` int(50) NOT NULL,
  `tafel_nr` int(50) NOT NULL DEFAULT '1',
  `Eten` varchar(200) NOT NULL DEFAULT 'Hamburger',
  `drinken` varchar(200) NOT DEFAULT 'Cola',
  `bestel_tijd` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bestelling_eten`
--

INSERT INTO `bestelling_eten` (`bestellingsnummer_eten`, `tafel_nr`, `gerecht1`, `gerecht2`, `gerecht3`, `gerecht4`, `gerecht5`, `opmerkingen`, `afhaal_of_restaurant`, `gewenst_ophaal_tijd`, `created_at`) VALUES
(13, 2, '0', '0', '0', '0', '0', 'patat saus = mayonaise', 'AFHAAL', '00:00:00', '14:29:00'),
(14, 14, 'S-schtoel+shashlick', 'P-saus', '0', '0', '0', '', 'RESTAURANT', '00:00:00', '09:07:00');

-- --------------------------------------------------------

--
-- Table structure for table `personeel`
--

CREATE TABLE `medewerkers` (
  `medewerker_id` int(11) NOT NULL,
  `medewerker_user` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `medewerker_pwd` varchar(255) NOT NULL,
  `user_type` varchar(50) NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `personeel`
--

INSERT INTO `personeel` (`personeelscode`, `voornaam`, `achternaam`, `username`, `password`, `straatnaam`, `huisnummer`, `postcode`, `stad`, `usertype_id`, `created_at`) VALUES
(65, 'L', 'Laarhoven', 'CeoL', '$2y$10$eft55R1us7nbo0kDT4srVOTRArO4ukYajauJXm7pArp6/2hLhrfx6', 'straatvanshag', '123', '1', 'ALMERE', 0, '2021-11-10 13:35:17');

-- --------------------------------------------------------

--
-- Table structure for table `reservaties`
--

CREATE TABLE `reserveren` (
  `reserver_id` int(50) NOT NULL,
  `dag` date NOT NULL,
  `klantnaam` varchar(200) NOT NULL,
  `klantemail` varchar(200) NOT NULL,
  `telefoon` varchar(255) NOT NULL,
  `aantal_personen` int(50) NOT NULL,
  `reserver_tijd` time NOT NULL,
  `jarige`varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservaties`
--

INSERT INTO `reservaties` (`reservatienummer`, `reservatie_naam`, `aantal_personen`, `opmerkingen`, `reservatie_tijd`) VALUES
(1, 'Jeff', 5, '0', '18:30:00'),
(3, 'Lucas', 2, '0', '22:00:00'),
(11, '', 0, '0', '00:00:00'),
(12, '', 0, 'geen', '00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `id` int(11) NOT NULL,
  `type` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`id`, `type`) VALUES
(1, 'Eigenaar'),
(2, 'Filiaalmanager'),
(3, 'Personeel'),
(4, 'Klant');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bestelling_drank`
--
ALTER TABLE `bestelling_drank`
  ADD PRIMARY KEY (`bestellingsnummer_drank`);

--
-- Indexes for table `bestelling_eten`
--
ALTER TABLE `bestelling_eten`
  ADD PRIMARY KEY (`bestellingsnummer_eten`);

--
-- Indexes for table `personeel`
--
ALTER TABLE `personeel`
  ADD PRIMARY KEY (`personeelscode`),
  ADD KEY `usertype_id` (`usertype_id`);

--
-- Indexes for table `reservaties`
--
ALTER TABLE `reservaties`
  ADD PRIMARY KEY (`reservatienummer`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bestelling_drank`
--
ALTER TABLE `bestelling_drank`
  MODIFY `bestellingsnummer_drank` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bestelling_eten`
--
ALTER TABLE `bestelling_eten`
  MODIFY `bestellingsnummer_eten` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personeel`
--
ALTER TABLE `personeel`
  MODIFY `personeelscode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `reservaties`
--
ALTER TABLE `reservaties`
  MODIFY `reservatienummer` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
