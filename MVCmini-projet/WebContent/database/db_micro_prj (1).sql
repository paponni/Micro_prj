-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 11, 2021 at 04:37 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_micro_prj`
--

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `codeArticle` int(11) NOT NULL,
  `designation` varchar(30) NOT NULL,
  `prix` double NOT NULL,
  `stock` varchar(30) NOT NULL,
  `categorie` varchar(20) NOT NULL,
  `photo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`codeArticle`, `designation`, `prix`, `stock`, `categorie`, `photo`) VALUES
(1, 'article1', 200, '5', 'jazz', './images/jazz.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `refCat` varchar(20) NOT NULL,
  `cat` varchar(20) NOT NULL,
  `codeArticle` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categorie`
--

INSERT INTO `categorie` (`refCat`, `cat`, `codeArticle`) VALUES
('1', 'jazz', 1);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `adresse` varchar(30) NOT NULL,
  `codePostal` int(11) NOT NULL,
  `ville` varchar(30) NOT NULL,
  `tel` int(11) NOT NULL,
  `motDePasse` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `email`, `nom`, `prenom`, `adresse`, `codePostal`, `ville`, `tel`, `motDePasse`) VALUES
(3, 'abc@hotmail.fr', 'Mamoun', 'mohamed', 'cdcd', 33, 'cdvffb', 4, 'abcd'),
(5, 'ab@hotmail.fr', 'simo', 'xsd', 'cdc', 33, 'dc', 3, '1234'),
(7, 'aaab@hotmail.fr', 'simo', 'x', 'cdc', 33, 'dc', 634323232, 'alien'),
(8, 'mamoun@hotmail.com', 'zakaria', 'mamoun', 'mabrouka', 4000, 'marrakech', 634323232, 'zakaria');

-- --------------------------------------------------------

--
-- Table structure for table `commandes`
--

CREATE TABLE `commandes` (
  `numCommande` int(11) NOT NULL,
  `codeClient` varchar(30) DEFAULT NULL,
  `dateCommande` date DEFAULT NULL,
  `idClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `lignecommande`
--

CREATE TABLE `lignecommande` (
  `numCommande` int(11) NOT NULL,
  `codeArticle` int(11) NOT NULL,
  `qteCommande` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`codeArticle`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`refCat`),
  ADD KEY `codeArticle` (`codeArticle`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`numCommande`),
  ADD KEY `idClient` (`idClient`);

--
-- Indexes for table `lignecommande`
--
ALTER TABLE `lignecommande`
  ADD PRIMARY KEY (`numCommande`,`codeArticle`),
  ADD KEY `fk_article` (`codeArticle`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `categorie_ibfk_1` FOREIGN KEY (`codeArticle`) REFERENCES `articles` (`codeArticle`);

--
-- Constraints for table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`idClient`) REFERENCES `clients` (`id`);

--
-- Constraints for table `lignecommande`
--
ALTER TABLE `lignecommande`
  ADD CONSTRAINT `fk_article` FOREIGN KEY (`codeArticle`) REFERENCES `articles` (`codeArticle`),
  ADD CONSTRAINT `fk_comm` FOREIGN KEY (`numCommande`) REFERENCES `commandes` (`numCommande`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
