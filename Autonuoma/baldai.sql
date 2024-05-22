-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2024 at 10:08 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `baldai`
--

-- --------------------------------------------------------

--
-- Table structure for table `administratorius`
--

CREATE TABLE `administratorius` (
  `vardas` varchar(255) NOT NULL,
  `pavarde` varchar(255) NOT NULL,
  `el_pastas` varchar(255) NOT NULL,
  `tel_nr` varchar(255) NOT NULL,
  `asm_k` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `administratorius`
--

INSERT INTO `administratorius` (`vardas`, `pavarde`, `el_pastas`, `tel_nr`, `asm_k`) VALUES
('Tucker', 'Geockle', 'tgeockle0@163.com', '120 562 5042', 1),
('Gilligan', 'Parkhouse', 'gparkhouse1@wired.com', '936 561 5839', 2),
('Noelle', 'Waddell', 'nwaddell2@paginegialle.it', '359 245 4642', 3),
('Nanine', 'Lemmon', 'nlemmon3@discuz.net', '653 521 9316', 4),
('Binky', 'Bumpus', 'bbumpus4@apache.org', '266 541 5089', 5),
('Arvy', 'Challinor', 'achallinor5@tuttocitta.it', '152 681 7764', 6),
('Holmes', 'Arnoult', 'harnoult6@earthlink.net', '103 672 5471', 7),
('Mariejeanne', 'Germaine', 'mgermaine7@howstuffworks.com', '894 915 6857', 8),
('Franny', 'Batterbee', 'fbatterbee8@netlog.com', '104 169 1516', 9),
('Padraic', 'Coveney', 'pcoveney9@nyu.edu', '299 491 6512', 10),
('Joyce', 'Bean', 'jbeana@cdbaby.com', '114 653 3708', 11),
('Bettine', 'Connah', 'bconnahb@foxnews.com', '251 126 1195', 12),
('Emlynn', 'Matuszewski', 'ematuszewskic@github.com', '393 974 6475', 13),
('Marve', 'Lagadu', 'mlagadud@china.com.cn', '298 339 5839', 14),
('Alvis', 'Banat', 'abanate@aboutads.info', '679 171 5200', 15),
('Chloette', 'Selkirk', 'cselkirkf@independent.co.uk', '160 101 8079', 16),
('Melody', 'Dowdeswell', 'mdowdeswellg@yale.edu', '597 684 1220', 17),
('Kean', 'Boundy', 'kboundyh@w3.org', '732 275 2460', 18),
('Kristofer', 'Rogerson', 'krogersoni@fema.gov', '422 561 2260', 19),
('Beverie', 'Blaber', 'bblaberj@hp.com', '398 876 0091', 20);

-- --------------------------------------------------------

--
-- Table structure for table `adresas`
--

CREATE TABLE `adresas` (
  `miestas` varchar(255) NOT NULL,
  `gatve` varchar(255) NOT NULL,
  `namas` int(11) NOT NULL,
  `pasto_kodas` int(11) NOT NULL,
  `id_Adresas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `adresas`
--

INSERT INTO `adresas` (`miestas`, `gatve`, `namas`, `pasto_kodas`, `id_Adresas`) VALUES
('Matsumoto', 'Comanche', 47, 90051, 1),
('Gaohong', '6th', 85, 54789, 2),
('Tanjung Timur', 'Corscot', 766, 56987, 3),
('Jianshan', 'Cordelia', 2, 25874, 4),
('Pengwan', 'Dakota', 970, 39715, 5),
('Agua Blanca', 'Towne', 25173, 22004, 6),
('Yeri', 'International', 670, 95717, 7),
('Carhué', 'Graceland', 2019, 69433, 8),
('Kelburn', 'Hudson', 808, 61690, 9),
('La Unión', 'Trailsway', 65, 52129, 10),
('Quinipot', 'Gale', 8, 25075, 11),
('Shuidun', 'Lyons', 41414, 37195, 12),
('Kabul', 'Carey', 515, 82547, 13),
('Lianghe', 'Hanover', 2, 84625, 14),
('Nyeri', 'Jackson', 22428, 27946, 15),
('Qiying', 'Ryan', 2, 43178, 16),
('Novi Slankamen', 'Jana', 7, 71717, 17),
('Gudja', 'Cody', 5706, 36366, 18),
('Tumbagaan', 'Cottonwood', 49, 11514, 19),
('Mislak', 'Clyde Gallagher', 49577, 12122, 20);

-- --------------------------------------------------------

--
-- Table structure for table `baldo_rusis`
--

CREATE TABLE `baldo_rusis` (
  `pavadinimas` varchar(255) NOT NULL,
  `dydis` float NOT NULL,
  `kaina` float NOT NULL,
  `spalva` int(11) NOT NULL,
  `medziaga` int(11) NOT NULL,
  `id_Baldo_rusis` int(11) NOT NULL,
  `fk_Tipasid_Tipas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `baldo_rusis`
--

INSERT INTO `baldo_rusis` (`pavadinimas`, `dydis`, `kaina`, `spalva`, `medziaga`, `id_Baldo_rusis`, `fk_Tipasid_Tipas`) VALUES
('Bed', 0, 63.42, 8, 1, 1, 1),
('Bed', 0, 461.93, 1, 2, 2, 2),
('Couch', 0, 343.03, 2, 1, 3, 3),
('Table', 0, 131.88, 1, 2, 4, 4),
('Bookshelf', 0, 444.25, 4, 2, 5, 5),
('Table', 0, 262.3, 1, 2, 6, 6),
('Bed', 0, 300.43, 1, 2, 7, 7),
('Bookshelf', 0, 89.69, 2, 1, 8, 8),
('Nightstand', 0, 232.2, 8, 2, 9, 9),
('Bed', 0, 272.69, 8, 1, 10, 10),
('Couch', 0, 83.96, 2, 1, 11, 11),
('Couch', 0, 300.64, 1, 1, 12, 12),
('Wardrobe', 0, 325.28, 5, 1, 13, 13),
('Nightstand', 0, 128.06, 4, 1, 14, 14),
('Chair', 0, 234.23, 3, 1, 15, 15),
('Dresser', 0, 209.32, 8, 2, 16, 16),
('Desk', 0, 242.08, 2, 2, 17, 17),
('Bookshelf', 0, 214.84, 7, 1, 18, 18),
('Table', 0, 256, 8, 2, 19, 19),
('Bed', 0, 89.78, 7, 2, 20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `klientas`
--

CREATE TABLE `klientas` (
  `vardas` varchar(255) NOT NULL,
  `pavarde` varchar(255) NOT NULL,
  `asm_k` int(11) NOT NULL,
  `tel_nr` varchar(255) NOT NULL,
  `el_pastas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `klientas`
--

INSERT INTO `klientas` (`vardas`, `pavarde`, `asm_k`, `tel_nr`, `el_pastas`) VALUES
('Andrej', 'Shorton', 1, '207 500 5486', 'ashorton0@google.fr'),
('Decca', 'Vakhrushev', 2, '287 434 0969', 'dvakhrushev1@odnoklassniki.ru'),
('Robin', 'Calcutt', 3, '310 563 1897', 'rcalcutt2@fastcompany.com'),
('Franz', 'Adcock', 4, '335 657 5474', 'fadcock3@bloglines.com'),
('Bjorn', 'Gillhespy', 5, '687 882 7268', 'bgillhespy4@columbia.edu'),
('Gregor', 'D\'Avaux', 6, '308 229 9929', 'gdavaux5@canalblog.com'),
('Grata', 'Gluyas', 7, '979 640 3388', 'ggluyas6@taobao.com'),
('Royal', 'Sexty', 8, '387 147 9827', 'rsexty7@elpais.com'),
('Kendal', 'Fathers', 9, '769 888 5905', 'kfathers8@gmpg.org'),
('Tyrus', 'Gylle', 10, '673 365 6985', 'tgylle9@latimes.com'),
('Amalle', 'Denyer', 11, '587 969 9128', 'adenyera@ft.com'),
('Wald', 'Murrill', 12, '247 604 4617', 'wmurrillb@nhs.uk'),
('Almeria', 'Rose', 13, '794 485 9036', 'arosec@printfriendly.com'),
('Valentine', 'Cuppleditch', 14, '271 907 3239', 'vcuppleditchd@shop-pro.jp'),
('Auberon', 'Freeman', 15, '642 432 8674', 'afreemane@cnn.com'),
('Dwight', 'Kondratovich', 16, '707 864 0157', 'dkondratovichf@nps.gov'),
('Marlene', 'Stretton', 17, '348 864 3557', 'mstrettong@ox.ac.uk'),
('Sigfrid', 'Dedrick', 18, '275 181 6594', 'sdedrickh@house.gov'),
('Patton', 'Wyld', 19, '646 571 6695', 'pwyldi@nature.com'),
('Debora', 'Pauletti', 20, '901 789 5767', 'dpaulettij@posterous.com');

-- --------------------------------------------------------

--
-- Table structure for table `medziaga`
--

CREATE TABLE `medziaga` (
  `id_Medziaga` int(11) NOT NULL,
  `name` char(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `medziaga`
--

INSERT INTO `medziaga` (`id_Medziaga`, `name`) VALUES
(1, 'Oda'),
(2, 'Audinys');

-- --------------------------------------------------------

--
-- Table structure for table `mokejimas`
--

CREATE TABLE `mokejimas` (
  `data` date NOT NULL,
  `suma` float NOT NULL,
  `busena` int(11) NOT NULL,
  `id_Mokejimas` int(11) NOT NULL,
  `fk_Klientasasm_k` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `mokejimas`
--

INSERT INTO `mokejimas` (`data`, `suma`, `busena`, `id_Mokejimas`, `fk_Klientasasm_k`) VALUES
('2023-11-17', 70.17, 2, 1, 1),
('2023-04-16', 76.35, 1, 2, 2),
('2023-10-04', 96.5, 2, 3, 3),
('2023-12-01', 446, 2, 4, 4),
('2023-11-23', 95.69, 2, 5, 5),
('2023-11-09', 66.91, 2, 6, 6),
('2023-12-02', 83.15, 2, 7, 7),
('2023-11-25', 36.38, 1, 8, 8),
('2023-04-10', 25.88, 2, 9, 9),
('2023-10-04', 51.41, 2, 12, 12),
('2023-07-28', 79.18, 2, 13, 13),
('2023-11-01', 14.02, 1, 14, 14),
('2023-03-30', 46.59, 1, 15, 15),
('2023-04-26', 68, 1, 16, 16),
('2024-01-19', 15.6, 2, 17, 17),
('2023-08-01', 69.98, 2, 18, 18),
('2024-01-05', 36.92, 2, 19, 19),
('2024-04-01', 500, 2, 20, 6),
('2024-04-01', 500, 2, 21, 6),
('2024-05-06', 45, 2, 23, 4),
('2024-05-06', 16, 2, 24, 4),
('2024-05-06', 1023, 2, 25, 5),
('2024-05-06', 13, 2, 26, 3),
('2024-05-06', 6464, 2, 27, 2),
('2024-05-06', 6464, 1, 28, 1),
('2024-05-06', 6464, 1, 29, 3),
('2024-05-06', 6464, 1, 31, 6),
('2024-05-06', 6464, 1, 32, 5),
('2024-05-02', 6464, 1, 33, 7);

-- --------------------------------------------------------

--
-- Table structure for table `mokejimo_statusas`
--

CREATE TABLE `mokejimo_statusas` (
  `id_Mokejimo_statusas` int(11) NOT NULL,
  `name` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `mokejimo_statusas`
--

INSERT INTO `mokejimo_statusas` (`id_Mokejimo_statusas`, `name`) VALUES
(1, 'apmoketa'),
(2, 'neapmoketa');

-- --------------------------------------------------------

--
-- Table structure for table `nurodo`
--

CREATE TABLE `nurodo` (
  `fk_Adresasid_Adresas` int(11) NOT NULL,
  `fk_Klientasasm_k` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `nurodo`
--

INSERT INTO `nurodo` (`fk_Adresasid_Adresas`, `fk_Klientasasm_k`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `paslauga`
--

CREATE TABLE `paslauga` (
  `aprasymas` varchar(255) NOT NULL,
  `pavadinimas` varchar(255) NOT NULL,
  `kaina` float NOT NULL,
  `id_Paslauga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `paslauga`
--

INSERT INTO `paslauga` (`aprasymas`, `pavadinimas`, `kaina`, `id_Paslauga`) VALUES
('Carpet and upholstery cleaning', 'Carpet Cleaning', 92.89, 1),
('Carpet and upholstery cleaning', 'Carpet Cleaning', 90.39, 2),
('Commercial office cleaning services', 'Upholstery Cleaning', 33.64, 3),
('Commercial office cleaning services', 'Deep Cleaning', 72.48, 4),
('Deep cleaning for residential properties', 'Carpet Cleaning', 84.17, 5),
('Deep cleaning for residential properties', 'Deep Cleaning', 77.11, 6),
('Commercial office cleaning services', 'Carpet Cleaning', 69.02, 7),
('Deep cleaning for residential properties', 'Deep Cleaning', 83.77, 8),
('Carpet and upholstery cleaning', 'Upholstery Cleaning', 42.31, 9),
('Deep cleaning for residential properties', 'Deep Cleaning', 60.29, 10),
('Carpet and upholstery cleaning', 'Carpet Cleaning', 87.54, 11),
('Carpet and upholstery cleaning', 'Deep Cleaning', 29.63, 12),
('Carpet and upholstery cleaning', 'Upholstery Cleaning', 85.35, 13),
('Carpet and upholstery cleaning', 'Deep Cleaning', 20.9, 14),
('Commercial office cleaning services', 'Deep Cleaning', 31.97, 15),
('Deep cleaning for residential properties', 'Carpet Cleaning', 70.56, 16),
('Carpet and upholstery cleaning', 'Upholstery Cleaning', 44.81, 17),
('Deep cleaning for residential properties', 'Carpet Cleaning', 64.78, 18),
('Commercial office cleaning services', 'Carpet Cleaning', 43.58, 19),
('Deep cleaning for residential properties', 'Deep Cleaning', 49.38, 20);

-- --------------------------------------------------------

--
-- Table structure for table `spalva`
--

CREATE TABLE `spalva` (
  `id_Spalva` int(11) NOT NULL,
  `name` char(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `spalva`
--

INSERT INTO `spalva` (`id_Spalva`, `name`) VALUES
(1, 'balta'),
(2, 'juoda'),
(3, 'geltona'),
(4, 'raudona'),
(5, 'odos'),
(6, 'ruda'),
(7, 'pilka'),
(8, 'melyna'),
(9, 'violetine');

-- --------------------------------------------------------

--
-- Table structure for table `spec_pasiulymas`
--

CREATE TABLE `spec_pasiulymas` (
  `galioja_nuo` date NOT NULL,
  `galioja_iki` date NOT NULL,
  `pavadinimas` varchar(255) NOT NULL,
  `kaina` float NOT NULL,
  `id_Spec_pasiulymas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `spec_pasiulymas`
--

INSERT INTO `spec_pasiulymas` (`galioja_nuo`, `galioja_iki`, `pavadinimas`, `kaina`, `id_Spec_pasiulymas`) VALUES
('2023-05-16', '2024-02-01', 'Limited Time Offer', 81.13, 1),
('2023-07-25', '2024-02-29', 'Clearance Sale', 77.94, 2),
('2023-05-28', '2024-01-18', 'Flash Deal', 67.41, 3),
('2024-02-15', '2023-05-21', 'Holiday Special', 98.26, 4),
('2023-07-08', '2024-01-07', 'Clearance Sale', 98.18, 5),
('2024-03-05', '2023-05-12', 'Limited Time Offer', 25.31, 6),
('2023-08-31', '2023-09-15', 'Summer Sale', 37.33, 7),
('2023-10-08', '2023-04-30', 'Clearance Sale', 61.86, 8),
('2023-04-25', '2023-08-11', 'Flash Deal', 11.95, 9),
('2023-12-05', '2023-03-13', 'Super Savings', 70.38, 10),
('2023-03-17', '2023-06-06', 'Super Savings', 76.04, 11),
('2023-08-21', '2023-03-30', 'Clearance Sale', 18.86, 12),
('2024-02-17', '2024-02-07', 'Limited Time Offer', 78.74, 13),
('2023-12-01', '2023-05-13', 'Exclusive Discount', 27.74, 14),
('2023-06-14', '2023-11-24', 'Flash Deal', 30.56, 15),
('2023-12-02', '2023-11-06', 'Holiday Special', 47.08, 16),
('2024-02-06', '2023-11-09', 'Exclusive Discount', 16.37, 17),
('2024-02-29', '2023-05-27', 'Flash Deal', 75.8, 18),
('2023-08-20', '2023-05-05', 'Holiday Special', 13.77, 19),
('2024-03-03', '2023-11-03', 'Summer Sale', 49.48, 20);

-- --------------------------------------------------------

--
-- Table structure for table `teikiamas_uz`
--

CREATE TABLE `teikiamas_uz` (
  `fk_Mokejimasid_Mokejimas` int(11) NOT NULL,
  `fk_Uzsakymasid_Uzsakymas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `teikiamas_uz`
--

INSERT INTO `teikiamas_uz` (`fk_Mokejimasid_Mokejimas`, `fk_Uzsakymasid_Uzsakymas`) VALUES
(0, 19),
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(4, 14),
(4, 15),
(4, 18),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(17, 17),
(18, 18),
(19, 19),
(27, 1),
(32, 1),
(32, 9),
(33, 14),
(33, 18);

-- --------------------------------------------------------

--
-- Table structure for table `tipas`
--

CREATE TABLE `tipas` (
  `pavadinimas` varchar(255) NOT NULL,
  `id_Tipas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `tipas`
--

INSERT INTO `tipas` (`pavadinimas`, `id_Tipas`) VALUES
('bathroom', 1),
('bathroom', 2),
('kitchen', 3),
('bedroom', 4),
('study', 5),
('study', 6),
('dining room', 7),
('bedroom', 8),
('dining room', 9),
('bedroom', 10),
('kitchen', 11),
('kitchen', 12),
('bedroom', 13),
('kitchen', 14),
('bedroom', 15),
('living room', 16),
('bathroom', 17),
('bedroom', 18),
('study', 19),
('bedroom', 20);

-- --------------------------------------------------------

--
-- Table structure for table `turi2`
--

CREATE TABLE `turi2` (
  `fk_Valymo_ikainisid_Valymo_ikainis` int(11) NOT NULL,
  `fk_Spec_pasiulymasid_Spec_pasiulymas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `turi2`
--

INSERT INTO `turi2` (`fk_Valymo_ikainisid_Valymo_ikainis`, `fk_Spec_pasiulymasid_Spec_pasiulymas`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `turi3`
--

CREATE TABLE `turi3` (
  `fk_Valymo_ikainisid_Valymo_ikainis` int(11) NOT NULL,
  `fk_Adresasid_Adresas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `turi3`
--

INSERT INTO `turi3` (`fk_Valymo_ikainisid_Valymo_ikainis`, `fk_Adresasid_Adresas`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `turi4`
--

CREATE TABLE `turi4` (
  `fk_Valymo_ikainisid_Valymo_ikainis` int(11) NOT NULL,
  `fk_Paslaugaid_Paslauga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `turi4`
--

INSERT INTO `turi4` (`fk_Valymo_ikainisid_Valymo_ikainis`, `fk_Paslaugaid_Paslauga`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `uzsakymas`
--

CREATE TABLE `uzsakymas` (
  `kaina` float NOT NULL,
  `uzsakymo_nr` varchar(255) DEFAULT NULL,
  `data` date NOT NULL,
  `id_Uzsakymas` int(11) NOT NULL,
  `fk_Klientasasm_k` int(11) NOT NULL,
  `fk_Administratoriusasm_k` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `uzsakymas`
--

INSERT INTO `uzsakymas` (`kaina`, `uzsakymo_nr`, `data`, `id_Uzsakymas`, `fk_Klientasasm_k`, `fk_Administratoriusasm_k`) VALUES
(88.11, '4124', '2023-07-03', 1, 1, 1),
(39.3, '7478', '2024-01-29', 2, 2, 2),
(99.27, '9967', '2023-08-25', 3, 3, 3),
(67.75, '2250', '2023-07-08', 4, 4, 4),
(71.96, '6742', '2023-04-23', 5, 5, 5),
(91.81, '6413', '2023-06-17', 6, 6, 6),
(20.57, '7789', '2023-10-31', 7, 7, 7),
(44.43, '6552', '2023-12-26', 8, 8, 8),
(94.29, '8218', '2023-05-10', 9, 9, 9),
(35.54, '5953', '2023-05-24', 10, 10, 10),
(18.2, '3142', '2024-02-04', 11, 11, 11),
(48.36, '7458', '2024-01-11', 12, 12, 12),
(56.2, '2745', '2024-01-30', 13, 13, 13),
(80.77, '2774', '2023-04-11', 14, 14, 14),
(18.95, '1365', '2023-06-05', 15, 15, 15),
(62.07, '6269', '2023-03-10', 16, 16, 16),
(46.87, '8485', '2023-10-18', 17, 17, 17),
(66.04, '1815', '2023-06-22', 18, 18, 18),
(70.06, '7774', '2024-02-21', 19, 19, 19),
(44.3, '4354', '2023-05-18', 20, 20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `valymo_ikainis`
--

CREATE TABLE `valymo_ikainis` (
  `kiekis` int(11) NOT NULL,
  `atstumo_mokestis` float NOT NULL,
  `id_Valymo_ikainis` int(11) NOT NULL,
  `fk_Uzsakymasid_Uzsakymas` int(11) NOT NULL,
  `fk_Baldo_rusisid_Baldo_rusis` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `valymo_ikainis`
--

INSERT INTO `valymo_ikainis` (`kiekis`, `atstumo_mokestis`, `id_Valymo_ikainis`, `fk_Uzsakymasid_Uzsakymas`, `fk_Baldo_rusisid_Baldo_rusis`) VALUES
(2, 2.36, 1, 1, 1),
(5, 4.03, 2, 2, 2),
(5, 2.24, 3, 3, 3),
(7, 4.52, 4, 4, 4),
(7, 3.51, 5, 5, 5),
(5, 2.08, 6, 6, 6),
(9, 4.85, 7, 7, 7),
(5, 3.8, 8, 8, 8),
(9, 3.29, 9, 9, 9),
(7, 2.07, 10, 10, 10),
(1, 2.4, 11, 11, 11),
(8, 2.92, 12, 12, 12),
(1, 4.19, 13, 13, 13),
(9, 3.88, 14, 14, 14),
(6, 4.84, 15, 15, 15),
(6, 4.31, 16, 16, 16),
(10, 2.87, 17, 17, 17),
(9, 2.08, 18, 18, 18),
(3, 3.45, 19, 19, 19),
(3, 4.11, 20, 20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `valytojas`
--

CREATE TABLE `valytojas` (
  `vardas` varchar(255) NOT NULL,
  `pavarde` varchar(255) NOT NULL,
  `el_pastas` varchar(255) NOT NULL,
  `tel_nr` varchar(255) NOT NULL,
  `asm_k` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `valytojas`
--

INSERT INTO `valytojas` (`vardas`, `pavarde`, `el_pastas`, `tel_nr`, `asm_k`) VALUES
('Judd', 'Raffin', 'jraffin0@marriott.com', '317 570 6481', 1),
('Anna-maria', 'Leddie', 'aleddie1@feedburner.com', '476 967 7072', 2),
('Angela', 'Leipoldt', 'aleipoldt2@tumblr.com', '866 791 5182', 3),
('Hart', 'Yurikov', 'hyurikov3@unblog.fr', '775 950 8518', 4),
('Klaus', 'Antwis', 'kantwis4@ow.ly', '690 412 0577', 5),
('Alli', 'Traise', 'atraise5@epa.gov', '418 282 2657', 6),
('Bertine', 'Jump', 'bjump6@thetimes.co.uk', '571 412 5404', 7),
('Dulci', 'Sautter', 'dsautter7@tumblr.com', '922 131 4832', 8),
('Stanislaw', 'Penburton', 'spenburton8@salon.com', '300 400 8695', 9),
('Daisi', 'Eminson', 'deminson9@wikimedia.org', '659 470 2963', 10),
('Fairleigh', 'Duiguid', 'fduiguida@statcounter.com', '197 728 0428', 11),
('Emmeline', 'Sherbourne', 'esherbourneb@behance.net', '707 782 1385', 12),
('Abey', 'Kimbley', 'akimbleyc@gravatar.com', '851 673 3837', 13),
('Mufi', 'Soal', 'msoald@so-net.ne.jp', '316 428 1583', 14),
('Gideon', 'Murkus', 'gmurkuse@gnu.org', '681 245 0447', 15),
('Nataline', 'De Gogay', 'ndegogayf@answers.com', '700 985 9720', 16),
('Sauncho', 'Trewhella', 'strewhellag@examiner.com', '910 684 3750', 17),
('Walden', 'Pesak', 'wpesakh@dailymail.co.uk', '407 362 3486', 18),
('Kailey', 'Diviney', 'kdivineyi@oracle.com', '883 267 7461', 19),
('Elizabet', 'Buss', 'ebussj@unicef.org', '962 546 8275', 20);

-- --------------------------------------------------------

--
-- Table structure for table `vykdo`
--

CREATE TABLE `vykdo` (
  `fk_Uzsakymasid_Uzsakymas` int(11) NOT NULL,
  `fk_Valytojasasm_k` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_lithuanian_ci;

--
-- Dumping data for table `vykdo`
--

INSERT INTO `vykdo` (`fk_Uzsakymasid_Uzsakymas`, `fk_Valytojasasm_k`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administratorius`
--
ALTER TABLE `administratorius`
  ADD PRIMARY KEY (`asm_k`);

--
-- Indexes for table `adresas`
--
ALTER TABLE `adresas`
  ADD PRIMARY KEY (`id_Adresas`);

--
-- Indexes for table `baldo_rusis`
--
ALTER TABLE `baldo_rusis`
  ADD PRIMARY KEY (`id_Baldo_rusis`),
  ADD KEY `spalva` (`spalva`),
  ADD KEY `medziaga` (`medziaga`),
  ADD KEY `turi1` (`fk_Tipasid_Tipas`);

--
-- Indexes for table `klientas`
--
ALTER TABLE `klientas`
  ADD PRIMARY KEY (`asm_k`);

--
-- Indexes for table `medziaga`
--
ALTER TABLE `medziaga`
  ADD PRIMARY KEY (`id_Medziaga`);

--
-- Indexes for table `mokejimas`
--
ALTER TABLE `mokejimas`
  ADD PRIMARY KEY (`id_Mokejimas`),
  ADD KEY `busena` (`busena`),
  ADD KEY `apmoka` (`fk_Klientasasm_k`);

--
-- Indexes for table `mokejimo_statusas`
--
ALTER TABLE `mokejimo_statusas`
  ADD PRIMARY KEY (`id_Mokejimo_statusas`);

--
-- Indexes for table `nurodo`
--
ALTER TABLE `nurodo`
  ADD PRIMARY KEY (`fk_Adresasid_Adresas`,`fk_Klientasasm_k`);

--
-- Indexes for table `paslauga`
--
ALTER TABLE `paslauga`
  ADD PRIMARY KEY (`id_Paslauga`);

--
-- Indexes for table `spalva`
--
ALTER TABLE `spalva`
  ADD PRIMARY KEY (`id_Spalva`);

--
-- Indexes for table `spec_pasiulymas`
--
ALTER TABLE `spec_pasiulymas`
  ADD PRIMARY KEY (`id_Spec_pasiulymas`);

--
-- Indexes for table `teikiamas_uz`
--
ALTER TABLE `teikiamas_uz`
  ADD PRIMARY KEY (`fk_Mokejimasid_Mokejimas`,`fk_Uzsakymasid_Uzsakymas`),
  ADD KEY `teikiamasuz1` (`fk_Uzsakymasid_Uzsakymas`);

--
-- Indexes for table `tipas`
--
ALTER TABLE `tipas`
  ADD PRIMARY KEY (`id_Tipas`);

--
-- Indexes for table `turi2`
--
ALTER TABLE `turi2`
  ADD PRIMARY KEY (`fk_Valymo_ikainisid_Valymo_ikainis`,`fk_Spec_pasiulymasid_Spec_pasiulymas`);

--
-- Indexes for table `turi3`
--
ALTER TABLE `turi3`
  ADD PRIMARY KEY (`fk_Valymo_ikainisid_Valymo_ikainis`,`fk_Adresasid_Adresas`);

--
-- Indexes for table `turi4`
--
ALTER TABLE `turi4`
  ADD PRIMARY KEY (`fk_Valymo_ikainisid_Valymo_ikainis`,`fk_Paslaugaid_Paslauga`);

--
-- Indexes for table `uzsakymas`
--
ALTER TABLE `uzsakymas`
  ADD PRIMARY KEY (`id_Uzsakymas`),
  ADD KEY `daro` (`fk_Klientasasm_k`),
  ADD KEY `priiima` (`fk_Administratoriusasm_k`);

--
-- Indexes for table `valymo_ikainis`
--
ALTER TABLE `valymo_ikainis`
  ADD PRIMARY KEY (`id_Valymo_ikainis`),
  ADD KEY `nurodomas` (`fk_Uzsakymasid_Uzsakymas`),
  ADD KEY `itrauktasi1` (`fk_Baldo_rusisid_Baldo_rusis`);

--
-- Indexes for table `valytojas`
--
ALTER TABLE `valytojas`
  ADD PRIMARY KEY (`asm_k`);

--
-- Indexes for table `vykdo`
--
ALTER TABLE `vykdo`
  ADD PRIMARY KEY (`fk_Uzsakymasid_Uzsakymas`,`fk_Valytojasasm_k`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `uzsakymas`
--
ALTER TABLE `uzsakymas`
  MODIFY `id_Uzsakymas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `baldo_rusis`
--
ALTER TABLE `baldo_rusis`
  ADD CONSTRAINT `baldo_rusis_ibfk_1` FOREIGN KEY (`spalva`) REFERENCES `spalva` (`id_Spalva`),
  ADD CONSTRAINT `baldo_rusis_ibfk_2` FOREIGN KEY (`medziaga`) REFERENCES `medziaga` (`id_Medziaga`),
  ADD CONSTRAINT `turi1` FOREIGN KEY (`fk_Tipasid_Tipas`) REFERENCES `tipas` (`id_Tipas`);

--
-- Constraints for table `mokejimas`
--
ALTER TABLE `mokejimas`
  ADD CONSTRAINT `apmoka` FOREIGN KEY (`fk_Klientasasm_k`) REFERENCES `klientas` (`asm_k`),
  ADD CONSTRAINT `mokejimas_ibfk_1` FOREIGN KEY (`busena`) REFERENCES `mokejimo_statusas` (`id_Mokejimo_statusas`);

--
-- Constraints for table `nurodo`
--
ALTER TABLE `nurodo`
  ADD CONSTRAINT `nurodo` FOREIGN KEY (`fk_Adresasid_Adresas`) REFERENCES `adresas` (`id_Adresas`);

--
-- Constraints for table `teikiamas_uz`
--
ALTER TABLE `teikiamas_uz`
  ADD CONSTRAINT `teikiamasuz` FOREIGN KEY (`fk_Uzsakymasid_Uzsakymas`) REFERENCES `uzsakymas` (`id_Uzsakymas`);

--
-- Constraints for table `turi2`
--
ALTER TABLE `turi2`
  ADD CONSTRAINT `turi2` FOREIGN KEY (`fk_Valymo_ikainisid_Valymo_ikainis`) REFERENCES `valymo_ikainis` (`id_Valymo_ikainis`);

--
-- Constraints for table `turi3`
--
ALTER TABLE `turi3`
  ADD CONSTRAINT `turi3` FOREIGN KEY (`fk_Valymo_ikainisid_Valymo_ikainis`) REFERENCES `valymo_ikainis` (`id_Valymo_ikainis`);

--
-- Constraints for table `turi4`
--
ALTER TABLE `turi4`
  ADD CONSTRAINT `turi4` FOREIGN KEY (`fk_Valymo_ikainisid_Valymo_ikainis`) REFERENCES `valymo_ikainis` (`id_Valymo_ikainis`);

--
-- Constraints for table `uzsakymas`
--
ALTER TABLE `uzsakymas`
  ADD CONSTRAINT `daro` FOREIGN KEY (`fk_Klientasasm_k`) REFERENCES `klientas` (`asm_k`),
  ADD CONSTRAINT `priiima` FOREIGN KEY (`fk_Administratoriusasm_k`) REFERENCES `administratorius` (`asm_k`);

--
-- Constraints for table `valymo_ikainis`
--
ALTER TABLE `valymo_ikainis`
  ADD CONSTRAINT `itrauktasi1` FOREIGN KEY (`fk_Baldo_rusisid_Baldo_rusis`) REFERENCES `baldo_rusis` (`id_Baldo_rusis`),
  ADD CONSTRAINT `nurodomas` FOREIGN KEY (`fk_Uzsakymasid_Uzsakymas`) REFERENCES `uzsakymas` (`id_Uzsakymas`);

--
-- Constraints for table `vykdo`
--
ALTER TABLE `vykdo`
  ADD CONSTRAINT `vykdo` FOREIGN KEY (`fk_Uzsakymasid_Uzsakymas`) REFERENCES `uzsakymas` (`id_Uzsakymas`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
