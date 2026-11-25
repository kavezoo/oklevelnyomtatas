-- oklevelnyomtatas — MySQL / MariaDB séma és táblák
-- Futtatás: lásd Doc/uzemeltetoi/telepites-gyors-utmutato.md
-- Adatbázis neve: oklevelnyomtatas

CREATE DATABASE IF NOT EXISTS `oklevelnyomtatas`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE `oklevelnyomtatas`;
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2026. Nov 25. 14:33
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `oklevelnyomtatas`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `cake_migrations`
--

CREATE TABLE `cake_migrations` (
  `id` int(11) NOT NULL,
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) DEFAULT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `cake_migrations`
--

INSERT INTO `cake_migrations` (`id`, `version`, `migration_name`, `plugin`, `start_time`, `end_time`, `breakpoint`) VALUES
(1, 20261125100000, 'CreateSmokeTimerTables', NULL, '2026-11-25 09:47:35', '2026-11-25 09:47:35', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `clubs`
--

CREATE TABLE `clubs` (
  `id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `email1` varchar(255) DEFAULT NULL,
  `email2` varchar(255) DEFAULT NULL,
  `www` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `clubs`
--

INSERT INTO `clubs` (`id`, `access_id`, `name`, `country_id`, `email1`, `email2`, `www`, `created`, `modified`) VALUES
(1, 1, 'Pipe Club Nitra', 1, 'pipeclubnitra@gmail.com', NULL, 'www.pipeclub.sk', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(2, 2, 'PC Banská Bystrica', 1, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(3, 3, 'Valašský Fajfklub', 2, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(4, 4, 'ŠPC Prachatice', 2, 'dymka@seznam.cz', NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(5, 5, 'Aranyfüst Budapest', 3, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(6, 6, 'Bratislava Pipe Club', 1, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(7, 7, 'PC Dymka.net', 2, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(8, 10, 'Koniński Klub Fajki - Konin', 4, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(9, 11, 'PC Zlín', 2, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(10, 13, 'Pipe Club Moravia', 2, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(11, 14, 'Baumit SK', 1, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(12, 15, 'RYBA Pipe Club', 1, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(13, 18, 'Pipeclub of Cologne', 14, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(14, 19, 'South West Pipe Club', 23, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(15, 20, 'Pertlstein Vindobona', 5, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(16, 21, 'KFC Trafika Poznań', 4, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(17, 22, 'Roskilde Pibeklub', 12, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(18, 23, 'James Upshall Delft', 9, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(19, 24, 'Pipe club Brno', 2, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(20, 25, 'Calumet Pipa Club Cornuda', 15, 'calumet08@gmail.com', NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(21, 26, 'Lyngby Stop Clup', 12, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(22, 27, 'Schavotpiepke', 9, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(23, 28, 'John Hollingsworth pipe club Birmingham', 23, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(24, 29, 'Fajkový klub Pezinok', 1, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(25, 30, 'Dýmal klub Nový Malín', 2, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(26, 31, 'HDK Olomouc', 2, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(27, 32, 'Istanbul Pipe Club', 21, 'info@istanbulpipodernegi.org', NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(28, 33, 'Turkish Pipe Smokiers Club', 21, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(29, 35, '424 PC Dombóvár', 3, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(30, 36, 'Kisváros PC Szigetvár', 3, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(31, 37, 'Szentgotthárdi PC', 3, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(32, 38, 'PC Janeba Mariánské Lázně', 2, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(33, 39, 'Pipeclub Puba Arnsberg', 14, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(34, 40, 'PC Szczytna', 4, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(35, 41, 'Echipa Romaniei', 18, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(36, 42, 'Girona Pipa Club', 19, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(37, 43, 'Fenice Pipa Club', 15, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(38, 44, 'Pipe Collectors Club Poznań', 4, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(39, 45, 'Pipe Club Warszawa', 4, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(40, 46, 'Cachimbo Clube de Portugal', 24, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(41, 47, 'Rauchclub Haal von 1876', 14, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(42, 48, 'Lviv pipe club', 22, 'lvivpipeclub@gmail.com', NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(43, 49, 'PC5 Ruda nad Moravou', 2, 'pc5ruda@seznam.cz', NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(44, 50, 'Lienzna Pfeif´nracha', 5, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(45, 51, 'Okayama Pipe Club', 16, 'okayamapipeclub@live.jp', NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(46, 52, 'Japan Pipe-smokers Club, Tokyo', 16, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(47, 53, 'Pipe Club Uster', 20, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(48, 54, 'Dordtsch Pijprokers Gilde', 9, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(49, 55, 'Cerea Pipa Club Torino', 15, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(50, 56, 'St. Petersburg Pipe Club', 8, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(51, 57, 'Pipemakers Praha', 2, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(52, 58, 'Łódzki Klub Smakoszy Fajki - Łódź', 4, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(53, 59, 'Ashes 2 Ashes', 1, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(54, 60, 'Kaunas Pipe Club', 17, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(55, 61, 'United Pipe Clubs of America', 7, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(56, 62, 'Kyiv Pipe Club', 22, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(57, 63, 'Pécsi Füstölgők Asztaltársásga', 3, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(58, 64, 'Zagreb', 25, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(59, 65, 'Castello di Conegliano', 15, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(60, 66, 'Fajkový klub sv. Mikuláša - Brezno', 1, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(61, 67, 'Rauchklub Großschwarzenlohe', 14, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(62, 68, 'Csokonai PC', 3, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(63, 69, 'Panevezys pipe club', 17, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(64, 70, 'Pipe Club Wrocław', 4, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(65, 71, 'Pipa Club Barcelona', 19, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(66, 72, 'Pipe Club of Kiev', 22, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(67, 74, 'Pipe Club Morez', 13, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(68, 75, 'New York Pipe Club', 7, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(69, 76, 'PKF Przemyśl', 4, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(70, 77, 'Kalisko-Ostrowski Klub Fajki 2010', 4, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(71, 78, 'Spilberk PC Brno', 2, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(72, 79, 'Pipa Club Italia', 15, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(73, 80, 'Free Hands PC Ružomberok', 1, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(74, 81, 'Swedish Pipe Club', 28, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(75, 82, 'Vilnus', 17, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(76, 83, 'Yeditepe Pipe Club', 21, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(77, 84, 'Amphora Pipa Klub', 3, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(78, 91, 'PC Ostrava', 2, NULL, NULL, NULL, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(79, 94, 'Ibafai Pipaklub', 3, NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(80, 98, 'Fehér Sólyom Pipa Club Győr', 3, NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(81, 102, 'Pipe Club Nitra', 1, NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(82, 104, 'Bohém Pipaklub', 3, NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(83, 105, 'Aranyfüst BPK', 3, NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(84, 106, 'Alba Pipaklub', 3, NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(85, 107, '424 PC Dombóvár', 3, NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(86, 108, 'Navahók Pipaklub', 3, NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(87, 109, 'Szentgotthárdi Pipaklub', 3, NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(88, 110, 'Egyéni', 3, NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(89, 111, 'MPE', 3, NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(90, 112, 'ÖPC', 5, NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `competitions`
--

CREATE TABLE `competitions` (
  `id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `subtitle` varchar(255) DEFAULT NULL,
  `place` varchar(255) DEFAULT NULL,
  `organizer` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `competition_start` datetime DEFAULT NULL,
  `competition_end` datetime DEFAULT NULL,
  `filling_start` datetime DEFAULT NULL,
  `pipe` varchar(255) DEFAULT NULL,
  `tobacco` varchar(255) DEFAULT NULL,
  `chief_referee` varchar(255) DEFAULT NULL,
  `competition_director` varchar(255) DEFAULT NULL,
  `person3` varchar(255) DEFAULT NULL,
  `last_master_pc` varchar(255) DEFAULT NULL,
  `diploma_name1` varchar(255) DEFAULT NULL,
  `diploma_name2` varchar(255) DEFAULT NULL,
  `diploma_name3` varchar(255) DEFAULT NULL,
  `diploma_name4` varchar(255) DEFAULT NULL,
  `diploma_role1` varchar(255) DEFAULT NULL,
  `diploma_role2` varchar(255) DEFAULT NULL,
  `diploma_role3` varchar(255) DEFAULT NULL,
  `diploma_role4` varchar(255) DEFAULT NULL,
  `diploma_text1` varchar(255) DEFAULT NULL,
  `diploma_text2` varchar(255) DEFAULT NULL,
  `teams_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `payment_tracking` tinyint(1) NOT NULL DEFAULT 0,
  `tables_tracking` tinyint(1) NOT NULL DEFAULT 0,
  `competition_active` tinyint(1) NOT NULL DEFAULT 0,
  `competition_finished` tinyint(1) NOT NULL DEFAULT 0,
  `registration_closed` tinyint(1) NOT NULL DEFAULT 0,
  `auto_register` tinyint(1) NOT NULL DEFAULT 0,
  `filling_active` tinyint(1) NOT NULL DEFAULT 0,
  `filling_finished` tinyint(1) NOT NULL DEFAULT 0,
  `preprinted_cards` tinyint(1) NOT NULL DEFAULT 0,
  `world_class` tinyint(1) NOT NULL DEFAULT 0,
  `max_registration_number` int(11) DEFAULT NULL,
  `max_competition_number` int(11) DEFAULT NULL,
  `team_num_min` int(11) DEFAULT NULL,
  `team_num_max` int(11) DEFAULT NULL,
  `team_num_eval` int(11) DEFAULT NULL,
  `competitor_card_type` int(11) DEFAULT NULL,
  `fee_currency` varchar(255) DEFAULT NULL,
  `vl_individuals_id` int(11) DEFAULT NULL,
  `vl_teams_id` int(11) DEFAULT NULL,
  `vl_women_id` int(11) DEFAULT NULL,
  `published_competition_id` int(11) DEFAULT NULL,
  `logo_competition` blob DEFAULT NULL,
  `logo_club` blob DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `competitions`
--

INSERT INTO `competitions` (`id`, `access_id`, `name`, `subtitle`, `place`, `organizer`, `status`, `event_date`, `competition_start`, `competition_end`, `filling_start`, `pipe`, `tobacco`, `chief_referee`, `competition_director`, `person3`, `last_master_pc`, `diploma_name1`, `diploma_name2`, `diploma_name3`, `diploma_name4`, `diploma_role1`, `diploma_role2`, `diploma_role3`, `diploma_role4`, `diploma_text1`, `diploma_text2`, `teams_enabled`, `payment_tracking`, `tables_tracking`, `competition_active`, `competition_finished`, `registration_closed`, `auto_register`, `filling_active`, `filling_finished`, `preprinted_cards`, `world_class`, `max_registration_number`, `max_competition_number`, `team_num_min`, `team_num_max`, `team_num_eval`, `competitor_card_type`, `fee_currency`, `vl_individuals_id`, `vl_teams_id`, `vl_women_id`, `published_competition_id`, `logo_competition`, `logo_club`, `created`, `modified`) VALUES
(1, 1, 'Test', 'contest for testing purpose', 'Irish Pub Nitra', 'Pipe Club Nitra', 'Založená', '2018-01-01 00:00:00', NULL, NULL, NULL, 'Pipe Name, model No', 'Tobacco Name', 'Name Surname 2', 'Name Surname 1', 'Name Surname 3', NULL, 'Name Surname 1', 'Name Surname 2', 'Name Surname 3', NULL, 'Director', 'Chief Referee', 'Timekeeper', NULL, NULL, NULL, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 5, 3, 1, NULL, NULL, NULL, NULL, NULL, 0x736d6f6b6574696d65722e706e67, 0x50434c6f676f2e706e67, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(2, 4, 'Budapest - 2025. május 10.', '2025 Magyar Lassúsági Pipaszívó Bajnokság', 'Budapest - Bohém', 'Bohém Pipaklub', 'Založená', '2025-05-10 00:00:00', '1899-12-30 14:44:18', '1899-12-30 17:18:53', NULL, 'GL Pipes 2025-ös versenypipa', 'Orlik Golden Sliced', NULL, 'Béres Péter', 'Kovács Attila', NULL, 'Tű György', NULL, 'Kovács Zsolt', NULL, 'Bohém Pipaklub', 'Budapest', 'Magya Pipaklub Egyesület', '2025. május 10.', NULL, NULL, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 3, 5, 3, 1, NULL, NULL, NULL, NULL, NULL, 0x6c6f676f4e6167792e6a7067, 0x4d50455f6c6f676f5f4646202831292e6a7067, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(3, 6, 'Győr - 2025. szeptember 27.', '2025 Magyar Lassúsági Pipaszívó Bajnokság', 'Győr - Fehér Sólyom', 'Fehér Sólyom Pipaklub', 'Založená', '2025-09-27 00:00:00', '1899-12-30 14:35:30', '1899-12-30 16:25:58', NULL, 'GL Pipes 2025-ös versenypipa', 'Orlik Golden Sliced', NULL, 'Ország Zsolt', 'Kovács Attila', NULL, 'Ország Zsolt', NULL, 'Kovács Zsolt', NULL, 'Fehér Sólyom Pipaklub', 'Budapest', 'Magya Pipaklub Egyesület', '2025. szeptember 27.', NULL, NULL, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 3, 5, 3, 2, NULL, NULL, NULL, NULL, NULL, 0x466568e97253f36c796f6d4c6f676f5f6b6963736946462e6a70673b6c6f676f4e6167792e6a7067, 0x4d50455f6c6f676f5f4646202831292e6a7067, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(4, 7, 'Aranyfüst BPK - 2025. november 15.', '2025 Magyar Lassúsági Pipaszívó Bajnokság', 'Aranyfüst BPK - Budapest - Záróverseny', 'Aranyfüst Budapesti Pipázók Klubja', 'Založená', '2025-11-15 00:00:00', '1899-12-30 14:47:01', '1899-12-30 17:06:30', NULL, 'GL Pipes 2025-ös versenypipa', 'Orlik Golden Sliced', NULL, 'Verhás Tamás', 'Kovács Attila', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 3, 5, 3, 2, NULL, NULL, NULL, NULL, NULL, 0x4d50455f6c6f676f5f4646202831292e6a7067, 0x4146323032355858584949495f4c6f676f2e6a7067, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(5, 8, '2026-os Ibafai forduló', '2026-os Magyar Bajnokság 1. forduló', '2026-os Magyar Bajnokság', 'Ibafai Pipaklub', 'Založená', '2026-04-11 00:00:00', '1899-12-30 14:35:52', '1899-12-30 16:59:57', NULL, 'Szabó - MPE25', 'MacBaren Irish Dew', NULL, 'Borbély Csaba', 'Kovács Attila', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 3, 5, 3, 2, NULL, NULL, NULL, NULL, NULL, 0x6c6f676f5f616e6e6f5f363030305f696e762e6a70673b4d50455f323032355f6c6f676fc2b45f737a69c2b46e65735f4f4b2e6a7067, 0x4d50455f323032355f6c6f676fc2b45f737a69c2b46e65735f4f4b2e6a7067, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(6, 9, '2026-os Győri forduló', '2026-os Magyar Bajnokság 2. forduló', '2026-os Magyar Bajnokság', 'Fehér Sólyom Pipa Club Győr', 'Založená', '2026-05-30 00:00:00', '1899-12-30 14:33:24', '1899-12-30 16:54:26', NULL, 'Szabó - MPE25', 'MacBaren (Planta) Cellini Classico', 'Halász Ferenc', 'Ország Zsolt', 'Kovács Attila', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 3, 5, 3, 1, NULL, NULL, NULL, NULL, NULL, 0x4d657373656e6765725f6372656174696f6e5f34454631343239422d433031412d343839452d414431452d3436453544443938423145302e6a706567, 0x4d50455f323032355f6c6f676fc2b45f737a69c2b46e65735f4f4b2e6a7067, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(7, 2, 'Ibafa - 2025. április 12.', '2025 Magyar Lassúsági Pipaszívó Bajnokság', 'Ibafa', 'Ibafai Pipaklub', 'Založená', '2025-04-12 00:00:00', '1899-12-30 14:17:09', '1899-12-30 16:06:23', NULL, 'GL Pipes 2025-ös versenypipa', 'Orlik Golden Sliced', NULL, 'Borbély Csaba', 'Kovács Attila', NULL, 'Borbély Csaba', NULL, 'Kovács Zsolt', NULL, 'Ibafai Pipaklub', 'Ibafa', 'Magya Pipaklub Egyesület', '2025. április 12.', NULL, NULL, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 3, 5, 3, 1, NULL, NULL, NULL, NULL, NULL, 0x6c6f676f5f616e6e6f5f363030305f696e762e6a7067, 0x4d50455f6c6f676f5f4646202831292e6a7067, '2026-11-25 10:19:30', '2026-11-25 10:19:30');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `competition_locks`
--

CREATE TABLE `competition_locks` (
  `id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `competition_id` int(11) DEFAULT NULL,
  `max_team_number` int(11) DEFAULT NULL,
  `max_table_number` int(11) DEFAULT NULL,
  `max_registration_number` int(11) DEFAULT NULL,
  `max_competition_number` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `short_name_en` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `countries`
--

INSERT INTO `countries` (`id`, `access_id`, `code`, `short_name_en`, `created`, `modified`) VALUES
(1, 1, 'SK', 'Slovakia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(2, 2, 'CZ', 'Czech Republic', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(3, 3, 'HU', 'Hungary', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(4, 4, 'PL', 'Poland', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(5, 5, 'AT', 'Austria', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(6, 7, 'MA', 'Morocco', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(7, 8, 'US', 'United States', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(8, 10, 'RU', 'Russia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(9, 11, 'NL', 'Netherlands', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(10, 12, 'FI', 'Finland', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(11, 13, 'BG', 'Bulgaria', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(12, 14, 'DK', 'Denmark', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(13, 15, 'FR', 'France', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(14, 16, 'DE', 'Germany', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(15, 17, 'IT', 'Italy', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(16, 18, 'JP', 'Japan', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(17, 19, 'LT', 'Lithuania', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(18, 20, 'RO', 'Romania', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(19, 21, 'ES', 'Spain', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(20, 22, 'CH', 'Switzerland', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(21, 23, 'TR', 'Türkiye', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(22, 24, 'UA', 'Ukraine', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(23, 25, 'GB', 'United Kingdom', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(24, 26, 'PT', 'Portugal', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(25, 27, 'HR', 'Croatia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(26, 28, 'BA', 'Bosnia and Herzegovina', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(27, 29, 'MX', 'Mexico', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(28, 30, 'SE', 'Sweden', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(29, 31, 'NO', 'Norway', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(30, 32, 'AF', 'Afghanistan', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(31, 33, 'AX', 'Aland Islands', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(32, 34, 'AL', 'Albania', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(33, 35, 'DZ', 'Algeria', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(34, 36, 'AS', 'American Samoa', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(35, 37, 'AD', 'Andorra', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(36, 38, 'AO', 'Angola', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(37, 39, 'AI', 'Anguilla', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(38, 40, 'AQ', 'Antarctica', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(39, 41, 'AG', 'Antigua and Barbuda', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(40, 42, 'AR', 'Argentina', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(41, 43, 'AM', 'Armenia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(42, 44, 'AW', 'Aruba', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(43, 45, 'AU', 'Australia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(44, 46, 'AZ', 'Azerbaijan', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(45, 47, 'BS', 'Bahamas', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(46, 48, 'BH', 'Bahrain', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(47, 49, 'BD', 'Bangladesh', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(48, 50, 'BB', 'Barbados', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(49, 51, 'BY', 'Belarus', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(50, 52, 'BE', 'Belgium', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(51, 53, 'BZ', 'Belize', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(52, 54, 'BJ', 'Benin', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(53, 55, 'BM', 'Bermuda', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(54, 56, 'BT', 'Bhutan', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(55, 57, 'BO', 'Bolivia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(56, 58, 'BQ', 'Bonaire, Sint Eustatius and Saba', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(57, 59, 'BW', 'Botswana', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(58, 60, 'BV', 'Bouvet Island', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(59, 61, 'BR', 'Brazil', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(60, 62, 'IO', 'British Indian Ocean Territory', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(61, 63, 'BN', 'Brunei Darussalam', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(62, 64, 'BF', 'Burkina Faso', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(63, 65, 'BI', 'Burundi', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(64, 66, 'CV', 'Cabo Verde', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(65, 67, 'KH', 'Cambodia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(66, 68, 'CM', 'Cameroon', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(67, 69, 'CA', 'Canada', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(68, 70, 'KY', 'Cayman Islands', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(69, 71, 'CF', 'Central African Republic', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(70, 72, 'TD', 'Chad', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(71, 73, 'CL', 'Chile', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(72, 74, 'CN', 'China', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(73, 75, 'CX', 'Christmas Island', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(74, 76, 'CC', 'Cocos (Keeling) Islands', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(75, 77, 'CO', 'Colombia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(76, 78, 'KM', 'Comoros', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(77, 79, 'CG', 'Congo', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(78, 80, 'CD', 'Congo (Democratic Republic of the)', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(79, 81, 'CK', 'Cook Islands', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(80, 82, 'CR', 'Costa Rica', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(81, 83, 'CI', 'Cote d\'Ivoire', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(82, 84, 'CU', 'Cuba', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(83, 85, 'CW', 'Curacao', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(84, 86, 'CY', 'Cyprus', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(85, 87, 'DJ', 'Djibouti', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(86, 88, 'DM', 'Dominica', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(87, 89, 'DO', 'Dominican Republic', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(88, 90, 'EC', 'Ecuador', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(89, 91, 'EG', 'Egypt', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(90, 92, 'SV', 'El Salvador', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(91, 93, 'GQ', 'Equatorial Guinea', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(92, 94, 'ER', 'Eritrea', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(93, 95, 'EE', 'Estonia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(94, 96, 'ET', 'Ethiopia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(95, 97, 'FK', 'Falkland Islands (Malvinas)', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(96, 98, 'FO', 'Faroe Islands', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(97, 99, 'FJ', 'Fiji', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(98, 100, 'GF', 'French Guiana', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(99, 101, 'PF', 'French Polynesia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(100, 102, 'TF', 'French Southern Territories', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(101, 103, 'GA', 'Gabon', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(102, 104, 'GM', 'Gambia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(103, 105, 'GE', 'Georgia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(104, 106, 'GH', 'Ghana', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(105, 107, 'GI', 'Gibraltar', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(106, 108, 'GR', 'Greece', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(107, 109, 'GL', 'Greenland', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(108, 110, 'GD', 'Grenada', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(109, 111, 'GP', 'Guadeloupe', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(110, 112, 'GU', 'Guam', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(111, 113, 'GT', 'Guatemala', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(112, 114, 'GG', 'Guernsey', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(113, 115, 'GN', 'Guinea', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(114, 116, 'GW', 'Guinea-Bissau', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(115, 117, 'GY', 'Guyana', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(116, 118, 'HT', 'Haiti', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(117, 119, 'HM', 'Heard Island and McDonald Islands', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(118, 120, 'VA', 'Holy See', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(119, 121, 'HN', 'Honduras', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(120, 122, 'HK', 'Hong Kong', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(121, 123, 'IS', 'Iceland', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(122, 124, 'IN', 'India', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(123, 125, 'ID', 'Indonesia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(124, 126, 'IR', 'Iran (Islamic Republic of)', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(125, 127, 'IQ', 'Iraq', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(126, 128, 'IE', 'Ireland', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(127, 129, 'IM', 'Isle of Man', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(128, 130, 'IL', 'Israel', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(129, 131, 'JM', 'Jamaica', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(130, 132, 'JE', 'Jersey', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(131, 133, 'JO', 'Jordan', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(132, 134, 'KZ', 'Kazakhstan', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(133, 135, 'KE', 'Kenya', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(134, 136, 'KI', 'Kiribati', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(135, 137, 'KP', 'Korea (North)', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(136, 138, 'KR', 'Korea (South)', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(137, 139, 'KW', 'Kuwait', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(138, 140, 'KG', 'Kyrgyzstan', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(139, 141, 'LA', 'Lao People\'s Democratic Republic', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(140, 142, 'LV', 'Latvia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(141, 143, 'LB', 'Lebanon', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(142, 144, 'LS', 'Lesotho', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(143, 145, 'LR', 'Liberia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(144, 146, 'LY', 'Libya', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(145, 147, 'LI', 'Liechtenstein', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(146, 148, 'LU', 'Luxembourg', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(147, 149, 'MO', 'Macao', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(148, 150, 'MK', 'Macedonia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(149, 151, 'MG', 'Madagascar', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(150, 152, 'MW', 'Malawi', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(151, 153, 'MY', 'Malaysia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(152, 154, 'MV', 'Maldives', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(153, 155, 'ML', 'Mali', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(154, 156, 'MT', 'Malta', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(155, 157, 'MH', 'Marshall Islands', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(156, 158, 'MQ', 'Martinique', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(157, 159, 'MR', 'Mauritania', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(158, 160, 'MU', 'Mauritius', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(159, 161, 'YT', 'Mayotte', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(160, 162, 'FM', 'Micronesia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(161, 163, 'MD', 'Moldova', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(162, 164, 'MC', 'Monaco', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(163, 165, 'MN', 'Mongolia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(164, 166, 'ME', 'Montenegro', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(165, 167, 'MS', 'Montserrat', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(166, 168, 'MZ', 'Mozambique', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(167, 169, 'MM', 'Myanmar', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(168, 170, 'NA', 'Namibia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(169, 171, 'NR', 'Nauru', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(170, 172, 'NP', 'Nepal', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(171, 173, 'NC', 'New Caledonia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(172, 174, 'NZ', 'New Zealand', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(173, 175, 'NI', 'Nicaragua', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(174, 176, 'NE', 'Niger', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(175, 177, 'NG', 'Nigeria', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(176, 178, 'NU', 'Niue', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(177, 179, 'NF', 'Norfolk Island', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(178, 180, 'MP', 'Northern Mariana Islands', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(179, 181, 'OM', 'Oman', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(180, 182, 'PK', 'Pakistan', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(181, 183, 'PW', 'Palau', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(182, 184, 'PS', 'Palestine, State of', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(183, 185, 'PA', 'Panama', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(184, 186, 'PG', 'Papua New Guinea', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(185, 187, 'PY', 'Paraguay', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(186, 188, 'PE', 'Peru', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(187, 189, 'PH', 'Philippines', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(188, 190, 'PN', 'Pitcairn', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(189, 191, 'PR', 'Puerto Rico', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(190, 192, 'QA', 'Qatar', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(191, 193, 'RE', 'Reunion', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(192, 194, 'RW', 'Rwanda', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(193, 195, 'BL', 'Saint Barthelemy !Saint Barthélemy', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(194, 196, 'SH', 'Saint Helena, Ascension and Tristan da Cunha', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(195, 197, 'KN', 'Saint Kitts and Nevis', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(196, 198, 'LC', 'Saint Lucia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(197, 199, 'MF', 'Saint Martin (French part)', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(198, 200, 'PM', 'Saint Pierre and Miquelon', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(199, 201, 'VC', 'Saint Vincent and the Grenadines', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(200, 202, 'WS', 'Samoa', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(201, 203, 'SM', 'San Marino', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(202, 204, 'ST', 'Sao Tome and Principe', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(203, 205, 'SA', 'Saudi Arabia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(204, 206, 'SN', 'Senegal', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(205, 207, 'RS', 'Serbia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(206, 208, 'SC', 'Seychelles', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(207, 209, 'SL', 'Sierra Leone', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(208, 210, 'SG', 'Singapore', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(209, 211, 'SX', 'Sint Maarten (Dutch part)', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(210, 212, 'SI', 'Slovenia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(211, 213, 'SB', 'Solomon Islands', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(212, 214, 'SO', 'Somalia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(213, 215, 'ZA', 'South Africa', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(214, 216, 'GS', 'South Georgia and the South Sandwich Islands', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(215, 217, 'SS', 'South Sudan', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(216, 218, 'LK', 'Sri Lanka', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(217, 219, 'SD', 'Sudan', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(218, 220, 'SR', 'Suriname', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(219, 221, 'SJ', 'Svalbard and Jan Mayen', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(220, 222, 'SZ', 'Swaziland', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(221, 223, 'SY', 'Syrian Arab Republic', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(222, 224, 'TW', 'Taiwan', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(223, 225, 'TJ', 'Tajikistan', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(224, 226, 'TZ', 'Tanzania', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(225, 227, 'TH', 'Thailand', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(226, 228, 'TL', 'Timor-Leste', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(227, 229, 'TG', 'Togo', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(228, 230, 'TK', 'Tokelau', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(229, 231, 'TO', 'Tonga', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(230, 232, 'TT', 'Trinidad and Tobago', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(231, 233, 'TN', 'Tunisia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(232, 234, 'TM', 'Turkmenistan', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(233, 235, 'TC', 'Turks and Caicos Islands', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(234, 236, 'TV', 'Tuvalu', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(235, 237, 'UG', 'Uganda', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(236, 238, 'AE', 'United Arab Emirates', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(237, 239, 'UM', 'US Minor Outlying Islands', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(238, 240, 'UY', 'Uruguay', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(239, 241, 'UZ', 'Uzbekistan', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(240, 242, 'VU', 'Vanuatu', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(241, 243, 'VE', 'Venezuela', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(242, 244, 'VN', 'Viet Nam', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(243, 245, 'VG', 'Virgin Islands (British)', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(244, 246, 'VI', 'Virgin Islands (U.S.)', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(245, 247, 'WF', 'Wallis and Futuna', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(246, 248, 'EH', 'Western Sahara', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(247, 249, 'YE', 'Yemen', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(248, 250, 'ZM', 'Zambia', '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(249, 251, 'ZW', 'Zimbabwe', '2026-11-25 09:47:41', '2026-11-25 09:47:41');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `people`
--

CREATE TABLE `people` (
  `id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email1` varchar(255) DEFAULT NULL,
  `email2` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `people`
--

INSERT INTO `people` (`id`, `access_id`, `first_name`, `last_name`, `club_id`, `country_id`, `gender_id`, `phone`, `email1`, `email2`, `active`, `created`, `modified`) VALUES
(1, 1, 'Igor', 'ESCHER', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(2, 2, 'Maroš', 'STRAŽANEC', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(3, 3, 'Juraj', 'BANÁS', 1, 1, 1, NULL, 'juraj.banas@zoznam.sk', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(4, 4, 'Andrej', 'BANÁS', 1, 1, 1, NULL, 'fredy.banas@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(5, 5, 'Alena', 'BANÁSOVÁ', 1, 1, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(6, 6, 'Michal', 'KOŽA', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(7, 7, 'Viliam', 'BÁREK', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(8, 8, 'Mustafa', 'BELGHARBI', 1, 6, 1, NULL, 'mustafabelgharbi@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(9, 9, 'Peter', 'MELO', 1, 1, 1, NULL, 'peter.melo@immoservicegroup.sk', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(10, 10, 'Peter', 'MÁČIK', 1, 1, 1, NULL, 'peter@macik.sk', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(11, 11, 'Zoltán', 'GERHÁT', 1, 1, 1, NULL, 'zolino.g@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(12, 12, 'Gabriel', 'KOLLER', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(13, 13, 'Štefan', 'RUZSIK', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(14, 14, 'Juraj', 'ĎURAČKA', 1, 1, 1, NULL, 'juraj.pinus@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(15, 15, 'Marián', 'MAŇÚR', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(16, 16, 'Miloš', 'GODÁR', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(17, 17, 'Gregory', 'WILSON', 1, 7, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(18, 18, 'Ľudevít', 'MACHO', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(19, 19, 'Drahoš', 'DALOŠ', 1, 1, 1, NULL, 'drahosdalos@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(20, 20, 'Jozef', 'KLENKA', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(21, 21, 'Peter', 'OMELINA', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(22, 22, 'Juraj', 'PAVLÍK', 1, 1, 1, NULL, 'pama@pama.sk', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(23, 23, 'Patrik', 'SLAŽANSKÝ', 1, 1, 1, NULL, 'pslazansky@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(24, 24, 'Karol', 'VARGA', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(25, 25, 'Andrej', 'KOSTIVIAR', 2, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(26, 26, 'Juraj', 'LACKOVIČ', 2, 1, 1, NULL, 'jolana.lackovicova@orangemail.sk', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(27, 27, 'Juraj', 'RAMŽA', 2, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(28, 28, 'Marek', 'NETOLIČKA', 3, 2, 1, NULL, 'czechhockeyphoto@seznam.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(29, 29, 'Vladimír', 'BENDL', 4, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(30, 30, 'Jan', 'HANŽL', 4, 2, 1, NULL, 'dymka@seznam.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(31, 31, 'Miloslav', 'PLOCEK', 4, 2, 1, NULL, 'Miloslav.Plocek@seznam.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(32, 32, 'Jan', 'POLÁK', 4, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(33, 33, 'Vladimír', 'SOUKUP', 4, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(34, 34, 'Luboš', 'ŠIMON', 4, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(35, 35, 'Antonín', 'VOTAVA', 4, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(36, 36, 'Péter', 'BÁLINT', 5, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(37, 37, 'Gyula', 'NAGY', 5, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(38, 38, 'István', 'THOMKA', 5, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(39, 39, 'László', 'TÓTH', 5, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(40, 40, 'Tamás', 'VERHÁS', 5, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(41, 41, 'Gábor', 'PAP', 5, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(42, 42, 'Péter', 'KURUCZ', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(43, 44, 'Martin', 'PALJESEK', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(44, 45, 'Rastislav', 'ANDRIS', 6, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(45, 46, 'Josef', 'KULA', 6, 1, 1, NULL, 'kulajosef@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(46, 47, 'Juraj', 'VANČÍK', 6, 1, 1, NULL, 'vancikju@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(47, 48, 'Marcel', 'MUDRÁK', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(48, 49, 'Ladislav', 'TONKA', 1, 1, 1, NULL, 'tonkaladislav@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(49, 50, 'Ivan', 'TURTEV', 7, 1, 1, NULL, 'ivanturtev@post.sk', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(50, 51, 'Peter', 'VANYA', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(51, 52, 'Igor', 'SABO', 7, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(52, 53, 'Margaréta', 'NOVÁKOVÁ', 1, 1, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(53, 54, 'Alex', 'WILSON', 1, 8, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(54, 55, 'Štefan', 'GERMAN', 7, 1, 1, NULL, 'pista.german@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(55, 56, 'Róbert', 'PAVLEN', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(56, 57, 'Péter', 'LANTOS', 5, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(57, 59, 'Peter', 'RUZSIK', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(58, 60, 'Matej', 'RANTO', NULL, 1, 1, NULL, 'matoranto@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(59, 61, 'Štefan', 'NOVÁK', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(60, 62, 'Cornelius C.N.', 'CRANS', NULL, 9, 1, NULL, 'ccrans@planet.nl', 'president@pijprokers.nl', 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(61, 63, 'Emil', 'PÍŠŤANSKÝ', 2, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(62, 64, 'Peter', 'MACEK', 2, 1, 1, NULL, 'zakkk@azet.sk', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(63, 65, 'Michal', 'NOVÁK', 51, 2, 1, NULL, 'info@novakpipes.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(64, 66, 'Mário', 'MARUŠINEC', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(65, 67, 'Julian', 'DRABENT', 8, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(66, 68, 'Krysztof', 'KOZLOWSKI', 8, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(67, 69, 'Dalibor', 'KRAMPL', 3, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(68, 70, 'Pavol', 'FÁBRY', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(69, 71, 'Tibor', 'LUKEŠ', 9, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(70, 72, 'Josef', 'LAŠČÁK', 9, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(71, 73, 'Filip', 'SLEZÁK', 9, 2, 1, NULL, 'slezakfilip@seznam.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(72, 74, 'Miroslav', 'BLIZŇÁK', 9, 2, 1, NULL, 'caksi@seznam.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(73, 75, 'Martin', 'HALUŠKA', NULL, 1, 1, NULL, 'haluska.pipes@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(74, 76, 'Vladimír', 'MAKOVICKÝ', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(75, 78, 'Robert', 'SZÁRAZ', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(76, 79, 'Peter', 'BRAČO', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(77, 80, 'Balázs', 'VARBAI', 5, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(78, 81, 'Vilmos', 'KEZSMARKI', 5, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(79, 82, 'Petra', 'VRÁBELOVÁ', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(80, 83, 'Daniela', 'KROŠLÁKOVÁ', NULL, 1, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(81, 84, 'Lubomír', 'LUŽINA', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(82, 85, 'Milan', 'FRIŠO', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(83, 86, 'Milan', 'FRIŠO ST.', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(84, 92, 'Branislav', 'BORSUK', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(85, 93, 'Vladimír Otovič', 'ZÁBORSKÝ', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(86, 94, 'Luboš', 'BORSUK', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(87, 95, 'Luboš', 'FRIŠO', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(88, 98, 'Roland', 'BORBÉLY', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(89, 99, 'Josef', 'STANISLAV', 10, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(90, 100, 'Peter', 'TOMASCH', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(91, 101, 'Jerguš', 'GÁLIK', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(92, 102, 'Štefan', 'VADKERTI', 12, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(93, 103, 'Marián', 'VARGA', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(94, 104, 'Jakub', 'ROLČÍK', 7, 2, 1, NULL, 'jakubrolcik16@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(95, 105, 'Michal', 'HUBACZ', 7, 2, 1, NULL, 'michal@huba.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(96, 106, 'Jakub', 'ANTOŠ', 7, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(97, 109, 'Kurt', 'EGGEMAN', 13, 14, 1, NULL, 'kurteggemann@t-online.de', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(98, 110, 'Wolfgang', 'DIEZ', 13, 14, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(99, 111, 'Steffen', 'HELBING', 13, 14, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(100, 112, 'Enrique', 'BERNAD', NULL, 19, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(101, 113, 'Mark', 'DYER', 14, 23, 1, NULL, 'mdyer@rtp-uk.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(102, 115, 'Roland', 'HOHENAUER', 15, 5, 1, NULL, 'r.hohenauer@bdl.at', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(103, 116, 'Damian', 'MUCHA', 16, 4, 1, NULL, 'dammuch@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(104, 118, 'Wahl', 'KARSTEN', 17, 12, 1, NULL, 'karstenwahl33@hotmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(105, 119, 'Jean', 'LEUNISSEN', 18, 9, 1, NULL, 'lssn@xs4all.nl', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(106, 120, 'Jo', 'REHAHN', 18, 9, 1, NULL, 'lssn@xs4all.nl', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(107, 121, 'Hans Halling', 'NIELSEN', 17, 12, 1, NULL, 'hanshallingnielsen@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(108, 122, 'Thomas E', 'OLSEN', 17, 12, 1, NULL, 'thoeo@live.dk', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(109, 123, 'Břetislav snr.', 'KOTULÁN', 19, 2, 1, NULL, 'b.kotulan@seznam.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(110, 124, 'Břetislav jnr.', 'KOTULÁN', 19, 2, 1, NULL, 'bretislav.kotulan@post.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(111, 125, 'Viktor', 'SINAJSKÝ', 19, 2, 1, NULL, 'viktor.sinajsky@designatak.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(112, 126, 'Jan', 'MACHANČÍK', 19, 2, 1, NULL, 'machancik@seznam.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(113, 127, 'Jan', 'R?SSEL', 17, 12, 1, NULL, 'jr@dkpr.dk', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(114, 128, 'Dagmar', 'ŠIMONOVÁ', 4, 2, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(115, 132, 'Joergen', 'RYGAARD', 17, 12, 1, NULL, 'sjrygaard@mail.dk', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(116, 133, 'Fiorenzo', 'CERIALI', 20, 15, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(117, 134, 'Annalisa', 'LOPIN', 20, 15, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(118, 135, 'Allan', 'ANDERSEN', 21, 12, 1, NULL, 'alguan@msn.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(119, 136, 'Milan', 'KOZÁK', 4, 2, 1, NULL, 'kozak.bosch@volny.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(120, 137, 'Kaj Overgaard', 'JENSEN', 17, 12, 1, NULL, 'kajoj@oncable.dk', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(121, 138, 'Pavel', 'KŘIŽAN', 9, 2, 1, NULL, 'pavel.krizan@seznam.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(122, 139, 'Ivan', 'KAPSIAR', 2, 1, 1, NULL, 'ivankapsiar@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(123, 140, 'Peter', 'HAAS', 2, 1, 1, NULL, 'haas@hermannarmin.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(124, 141, 'Anton', 'VÍGLASKÝ', 2, 1, 1, NULL, 'viglasky@safegroup.sk', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(125, 142, 'Geert', 'LANDLUST', 22, 9, 1, NULL, 'g.landlust@eskagraphicboard.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(126, 143, 'Ebel', 'HUIZINGA', 22, 9, 1, NULL, 'huizie1959@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(127, 145, 'Ian', 'WALKER', 23, 23, 1, NULL, 'info@northernbriars.co.uk', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(128, 146, 'András', 'FORGÓ', 24, 1, 1, NULL, 'andras.forgo@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(129, 147, 'Pavel', 'NOVÁK', 1, 1, 1, NULL, 'erika.novakova@bramac.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(130, 148, 'Peter', 'RAPTA', 24, 1, 1, NULL, 'peter.rapta@stuba.sk', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(131, 149, 'Zdeněk', 'KLÁSEK', 7, 2, 1, NULL, 'klasik51@seznam.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(132, 150, 'Petr', 'ODORČÁK', 7, 2, 1, NULL, 'p.odorcak@atlas.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(133, 151, 'Martin', 'PEDAIN', 7, 2, 1, NULL, 'pedain@seznam.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(134, 152, 'Vladimír', 'DANO', 7, 1, 1, NULL, 'poplan@seznam.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(135, 153, 'Radek', 'KROČA', 25, 2, 1, NULL, 'krocaradek@seznam.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(136, 154, 'Miroslav', 'LITAVSKÝ', 7, 1, 1, NULL, 'miroslav.litavsky@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(137, 155, 'Jan', 'SPÁČIL', 3, 2, 1, NULL, 'val.mez@centrum.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(138, 156, 'Jan', 'CETKOVSKÝ', 26, 2, 1, NULL, 'jan.cet@seznam.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(139, 157, 'Turgay', 'OCAK', 27, 21, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(140, 158, 'Teoman', 'ALSIRT', 27, 21, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(141, 159, 'Kemal', 'OZKAN', 27, 21, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(142, 160, 'Canmurat', 'OZDEMIR', 27, 21, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(143, 161, 'Ozgur', 'PARMAKSIZ', 27, 21, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(144, 162, 'Valit', 'NACAR', 27, 21, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(145, 163, 'Levent', 'OGUZ', 27, 21, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(146, 164, 'Koray', 'BERKIN', 27, 21, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(147, 166, 'Kenan', 'AHMET', 27, 21, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(148, 167, 'Atilla', 'ISTEK', 28, 21, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(149, 168, 'Birol', 'SALMAN', 28, 21, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(150, 169, 'Burhan', 'BORAN', 28, 21, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(151, 170, 'Ali', 'KURTULMUS', 28, 21, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(152, 172, 'Cem', 'CANSIZ', 28, 21, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(153, 173, 'Burak', 'SENDOGDU', 28, 21, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(154, 174, 'Márton', 'THOMKA', 5, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(155, 175, 'Péter', 'NYÍRÁDI', 29, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(156, 176, 'Zsuzsa', 'NYÍRÁDI', 29, 3, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(157, 177, 'József', 'JUNÁCSKI', 30, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(158, 178, 'László', 'KRIVÁN', 30, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(159, 179, 'János', 'MATÁNCSI', 30, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(160, 180, 'János', 'SZIBER', 30, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(161, 181, 'Zsuzsanna', 'SZIBER', 30, 3, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(162, 182, 'József', 'SZIBER', 30, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(163, 183, 'Erzsébet', 'SZIBER', 30, 3, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(164, 184, 'Levente', 'KISS', 31, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(165, 185, 'Zsolt', 'KISS', 31, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(166, 186, 'Lajos', 'SZARKA', 31, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(167, 187, 'Béla', 'FODOR', 31, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(168, 188, 'István', 'GALAMBOS', 31, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(169, 189, 'Isván', 'IFJ. GALAMBOS', 31, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(170, 190, 'Miklós', 'SZALAI', 31, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(171, 191, 'Sándor', 'GAZSI', 31, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(172, 192, 'Jiří', 'CHVAL', 32, 2, 1, NULL, 'jirik.lw@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(173, 193, 'Jiří', 'ČAPEK', 32, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(174, 194, 'Bohuslav', 'TURNER', 32, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(175, 195, 'Daniel', 'MIKEŠ', 32, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(176, 196, 'Josef', 'JADLOVSKÝ', 32, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(177, 197, 'Vladimír', 'KŘIVANEC', 32, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(178, 198, 'Jan', 'VAŠEK', NULL, 2, 1, NULL, 'sowis@seznam.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(179, 199, 'Ulrich', 'HAMPEL', 33, 14, 1, NULL, 'ulrichhampel@web.de', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(180, 200, 'Rita', 'HAMPEL', 33, 14, 2, NULL, '0711r@arcor.de', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(181, 201, 'Ulrich', 'SCHÄFER', 33, 14, 1, NULL, 'fu.schaefer@online.de', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(182, 202, 'Wilfried', 'KÖHLER', 33, 14, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(183, 203, 'Erik', 'NISZLER', 24, 1, 1, NULL, 'eniszler@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(184, 204, 'Alois', 'CHUMCHAL', 3, 2, 1, NULL, 'chumchal@seznam.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(185, 205, 'Zbyněk', 'FOJTÍČEK', 3, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(186, 206, 'Radim', 'PŘIKRYL', 3, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(187, 207, 'Karel', 'KUBŮ', 32, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(188, 208, 'Václav', 'SOUKUP', 32, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(189, 209, 'Lenka', 'ROSOLOVÁ', 7, 2, 2, NULL, 'rosolova50@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(190, 210, 'Wiesław', 'RATAJEK', 34, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(191, 211, 'Grzegorz', 'FRALA', 34, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(192, 212, 'Łukasz', 'FRALA', 34, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(193, 213, 'Piotr', 'NOWAK', 34, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(194, 214, 'Anna', 'NOWAK', 34, 4, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(195, 215, 'Teo', 'BINDAS', 2, 1, 1, NULL, 'teo.bindas@atlas.sk', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(196, 216, 'Alois', 'POSP͊IL', 25, 2, 1, NULL, 'pospa13@centrum.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(197, 217, 'Aleš', 'RIMANOVSKÝ', 3, 2, 1, NULL, 'a.rimanovsky@seznam.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(198, 218, 'Mihai - Andrei', 'PETRISOR', 35, 18, 1, NULL, 'mihai.petrisor@yahoo.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(199, 219, 'Ahmet O?uz', 'KÖKLER', 28, 21, 1, NULL, 'ahmetkokler@hotmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(200, 220, 'Jiří', 'JANKŮ', 3, 2, 1, NULL, 'jirak@email.cz', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(201, 221, 'Juraj', 'ŠUHAJDA', 2, 1, 1, NULL, 'ypsen62@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(202, 222, 'Juan', 'XIFREU SERI?Á', 36, 19, 1, NULL, 'jxifreu@estanc.cat', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(203, 223, 'Arturo', 'GUILLEN', 36, 19, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(204, 224, 'Mircea', 'PARAU', 35, 18, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(205, 225, 'Mauro', 'COSMO', 37, 15, 1, NULL, 'damacos@libero.it', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(206, 226, 'Henryk', 'ROGALSKI', 38, 4, 1, NULL, 'h.rogalski@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(207, 227, 'Zbigniew', 'LIEBERT', 38, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(208, 228, 'Pawel', 'NOWAKOWSKI', 38, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(209, 229, 'Oskar', 'ARMBRUSTER', NULL, 5, 1, NULL, 'oskar@ar8.at', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(210, 230, 'Zbigniew', 'FILIPEK', 39, 4, 1, NULL, 'filipekzbigniew70@gmail.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(211, 231, 'José António', 'MIRANDA', 40, 24, 1, NULL, 'a.ferreira@amferreira.com', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(212, 232, 'Wolfgang', 'PELTZER', 41, 14, 1, NULL, 'wolfpel@t-online.de', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(213, 233, 'Helga', 'MOCHA', 41, 14, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(214, 234, 'Silvia', 'KROTT', 41, 14, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(215, 235, 'Hans-Peter', 'KLAR', 41, 14, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(216, 236, 'Willi', 'KNUBBEN', 41, 14, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(217, 237, 'Franz', 'VERHOEVEN', 41, 14, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(218, 238, 'Marek', 'OSZUP', 39, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(219, 239, 'Oleksandr', 'ANTONENKO', 42, 22, 1, NULL, 'anton_pipe@mail.ua', NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(220, 240, 'Serhii', 'TRUKHIMOVYCH', 42, 22, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:41', '2026-11-25 09:47:41'),
(221, 241, 'Ihor', 'VOVK', 42, 22, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(222, 242, 'Ivo', 'FIŠER', 43, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(223, 243, 'Oldřich', 'TANERT', 43, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(224, 244, 'Tomáš', 'TYMEL', 43, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(225, 245, 'Milan', 'HORKÝ', 43, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(226, 246, 'Werner', 'DOBNIG', 44, 5, 1, NULL, 'werner.dobnig@gmx.at', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(227, 247, 'Elisabeth', 'DOBNIG', 44, 5, 2, NULL, 'werner.dobnig@gmx.at', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(228, 248, 'Peter', 'WEISSENBACHER', 44, 5, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(229, 249, 'Masayoshi', 'KOYAMA', 45, 16, 1, NULL, 'okayamapipeclub@live.jp', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(230, 250, 'Megumi', 'SEKKUDEN', 46, 16, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(231, 251, 'Ken’ichiro', 'HIRANO', 45, 16, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(232, 252, 'Radu', 'CUCUTA', 35, 18, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(233, 253, 'Milan', 'GATIAL', NULL, 1, 1, NULL, 'filabrasileiro@post.sk', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(234, 254, 'Thomas', 'FLÜCKIGER', 47, 20, 1, NULL, 'thomas.flueckiger@pcuster.ch', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(235, 255, 'Rolf', 'MAAG', 47, 20, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(236, 256, 'Hanspeter', 'BOSSHARD', 47, 20, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(237, 257, 'Sandra', 'BOSSHARD', 47, 20, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(238, 258, 'Marco', 'VESTI', 47, 20, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(239, 259, 'Iris', 'FISCHER', 47, 20, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(240, 260, 'Kurt', 'FISCHER', 47, 20, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(241, 261, 'Fredy', 'BLANC', 47, 20, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(242, 262, 'Jan', 'BOTH', 48, 9, 1, NULL, 'j.j.troost@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(243, 263, 'Gianfranco', 'RUSCALLA', 49, 15, 1, NULL, 'ruscalla@libero.it', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(244, 264, 'Vincenzo', 'CONIA', 49, 15, 1, NULL, 'enzoconia@yahoo.it', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(245, 265, 'Giancarlo', 'MARGUTTI', 49, 15, 1, NULL, 'giancarlo.margutti@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(246, 266, 'Paolo', 'MOCCIA', 49, 15, 1, NULL, 'paolo.moccia@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(247, 267, 'Walter', 'TCHEON', 49, 15, 1, NULL, 'gengistion@libero.it', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(248, 268, 'István', 'FORGÓ', 24, 1, 1, NULL, 'andras.forgo@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(249, 269, 'Alexey', 'SHEKHOVTSOV', 50, 8, 1, NULL, 'ash@pipeclub.spb.ru', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(250, 270, 'Lev', 'VASILYEV', 50, 8, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(251, 271, 'Alexey', 'MAYDANOV', 50, 8, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(252, 272, 'Jerzy', 'WILCZKOWIAK', 8, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(253, 273, 'Tomasz', 'STEFANIAK', 52, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(254, 274, 'Jakub', 'WIEJACKI', 52, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(255, 275, 'Michal', 'GALÍK', 3, 1, 1, NULL, 'michal.galik@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(256, 276, 'Marek', 'OPATERNÝ', 53, 1, 1, NULL, 'flom@flom.org', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(257, 277, 'Juraj', 'TRIZNA', 53, 1, 1, NULL, 'trizna@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(258, 278, 'Stanislav', 'PAVLÍK', 26, 2, 1, NULL, 'stan.pavl@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(259, 279, 'Róbert', 'PÁLFI', NULL, 3, 1, NULL, 'roberto.dipaulo@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(260, 280, 'Csaba', 'BÖDŐK', NULL, 3, 1, NULL, 'biogenesz@yahoo.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(261, 281, 'Raimundas', 'VAINIKONIS', 54, 17, 1, NULL, 'raimundas.vainikonis@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(262, 282, 'Mike', 'GARR', 55, 7, 1, NULL, 'michael.garr@wilkes.edu', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(263, 283, 'Kyrylo', 'GOROKHOVSKYI', 56, 22, 1, NULL, 'keeka@bigmir.net', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(264, 284, 'Dmytro', 'LIEDOVSKYI', 56, 22, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(265, 285, 'Serhiy', 'SAKIRKIN', 56, 22, 1, NULL, 'sergey.sakirkin@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(266, 286, 'Serhiy', 'PALAMARCHUK', 56, 22, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(267, 287, 'Matúš', 'MRÁZ', 53, 1, 1, NULL, 'semstym@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(268, 288, 'Vernon', 'VIG', 55, 7, 1, NULL, 'vevig@aol.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(269, 289, 'Laczó', 'BÁLINT', 57, 3, 1, NULL, 'laczobalint@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(270, 290, 'Erika', 'NOVÁKOVÁ', 1, 1, 2, NULL, 'erika.novakova@bramac.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(271, 291, 'Milan', 'KARAMARKOVIĆ', 58, 25, 1, NULL, 'karamarkovicmilan1@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(272, 292, 'Armin', 'ŠKRBO', 58, 26, 1, NULL, 'armin.skrbo@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(273, 293, 'Krešimir', 'GAVEZ', 58, 25, 1, NULL, 'kresimir.gavez@inet.hr', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(274, 294, 'Riccardino', 'BOSCOLO', 59, 15, 1, NULL, 'boscoloricmarchi@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(275, 295, 'Peter', 'ŠULEK', 60, 1, 1, NULL, 'sulekp@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(276, 296, 'Rainer', 'NOWAK', 61, 14, 1, NULL, 'nowi-one@t-online.de', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(277, 297, 'Oleksandr', 'ROZHOK', 42, 22, 1, NULL, 'nemo15.alex@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(278, 298, 'Yaroslav', 'NAKONECHNYY', 42, 22, 1, NULL, 'uatgalitsia@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(279, 299, 'Mykola', 'HRYHORYAN', 42, 22, 1, NULL, 'hryhoryan@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(280, 300, 'Géza', 'BAJUSZ', 62, 3, 1, NULL, 'geza.bajusz@ronadohany.hu', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(281, 301, 'Anna', 'VINKLER', 62, 3, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(282, 302, 'Mária', 'PÓCSI', 62, 3, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(283, 303, 'Beáta', 'PÓCSI', 62, 3, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(284, 304, 'Szilvia', 'PÓCSI', 62, 3, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(285, 305, 'Valéria', 'BAKÓ', 62, 3, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(286, 306, 'Viktória', 'BAKÓ', 62, 3, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(287, 307, 'Sára', 'SÜMEGI', 62, 3, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(288, 308, 'Zoltán', 'SZEGVÁRI', 62, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(289, 309, 'Imre', 'PÓCSI', 62, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(290, 310, 'Ferenc', 'SZABÓ', 62, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(291, 311, 'Balázs', 'PÓSÁN', 62, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(292, 312, 'Zoltán', 'PALOTAI', 62, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(293, 313, 'Skirmantas', 'ŠAPOKA', 63, 17, 1, NULL, 'skirmantas.sapoka@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(294, 314, 'Gintaras', 'RACYLA', 63, 17, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(295, 315, 'Petr', 'FÁBER', 9, 2, 1, NULL, 'faber@kouzelne.info', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(296, 316, 'Květoslav', 'POSP͊IL', 26, 2, 1, NULL, 'kvetopos@seznam.cz', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(297, 317, 'Jiří', 'TEXL', 26, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(298, 318, 'Jarek', 'RADIMĚŘSKÝ', 26, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(299, 319, 'Radovan', 'WELNITZ', 1, 1, 1, NULL, 'welnitzr@wmx.sk', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(300, 320, 'Mariusz', 'JAKUBOWSKI', 64, 4, 1, NULL, 'qboland@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(301, 321, 'Toni', 'PASCUAL', 65, 19, 1, NULL, 'tonipascualaw@hotmail.es', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(302, 322, 'Anna', 'BATLLE', 65, 19, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(303, 323, 'Joan', 'BATLLE', 65, 19, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(304, 324, 'Yirii', 'MADORSKYI', 66, 22, 1, NULL, 'Advokat@madorsky.kiev.ua', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(305, 325, 'Olena', 'SAVON', 66, 22, 2, NULL, 'Lena-mal@ukr.net', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(306, 326, 'Anton', 'MADORSKYI', 66, 22, 1, NULL, 'Madorsky.kiev@mail.ru', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(307, 327, 'Erik', 'PÁV', 2, 1, 1, NULL, 'eqesto@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(308, 328, 'Radoslav', 'MASARYK', 1, 1, 1, NULL, 'masarykrado@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(309, 329, 'Tomasz', 'POLICHNOWSKI', 16, 4, 1, NULL, 'tomasz.polichnowski@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(310, 330, 'Branislav', 'DIĎÁK', 1, 1, 1, NULL, 'badi2791@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(311, 331, 'Daniel', 'BERTOLINI', 67, 13, 1, NULL, 'naduranton@free.fr', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(312, 332, 'Christophe', 'GUERINEAU', 67, 13, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(313, 333, 'Stephane', 'PYANET', 67, 13, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(314, 334, 'Nathalie', 'PYANET', 67, 13, 2, NULL, 'naduranton@free.fr', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(315, 335, 'Milan', 'POLEK', 24, 1, 1, NULL, 'polek.milan@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(316, 336, 'Péter', 'VARGA', 5, 3, 1, NULL, 'flomar83@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(317, 337, 'Hank', 'SAATCHI', 68, 7, 1, NULL, 'airliner1001@hotmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(318, 338, 'Donald', 'DE GROOT', 18, 9, 1, NULL, 'dcpjdegroot@hetnet.nl', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(319, 339, 'Pieter Bas', 'VAN LUIPEN', 18, 9, 1, NULL, 'vanluipen@hotmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(320, 340, 'Fem', 'VIJGEN', 18, 9, 2, NULL, 'femenluc@online.nl', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(321, 341, 'Luc', 'VIJGEN', 18, 9, 1, NULL, 'femenluc@online.nl', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(322, 342, 'Marek', 'KRÁTKY', 6, 1, 1, NULL, 'markosbk@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(323, 343, 'Ľudovít', 'ZUPKO', 6, 1, 1, NULL, 'ludo.zupko@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(324, 344, 'Tomasz', 'CHOŁUJ', 64, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(325, 345, 'Adam', 'GAŁĄZKA', 64, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(326, 346, 'Andrzej', 'KRIESE', 64, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(327, 347, 'Peter', 'KOVÁČIK', 60, 1, 1, NULL, 'bastislaw@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(328, 348, 'Matej', 'GOTTHARD', 53, 1, 1, NULL, 'matej.gotthard@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(329, 349, 'Artur', 'MAZUR', 69, 4, 1, NULL, 'artmazur@op.pl', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(330, 350, 'Tivadar', 'TRUBACS', 29, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(331, 351, 'János', 'BRANAUER', 29, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(332, 352, 'István', 'FREI', 29, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(333, 353, 'Erik', 'KIMLE', 1, 1, 1, NULL, 'erik.kimle@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(334, 354, 'Zbigniew', 'BEDNARCZYK', 69, 4, 1, NULL, 'mrbrog@mrbrog.com.pl', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(335, 355, 'Alberto', 'BASCIANO', 59, 15, 1, NULL, 'albasciano@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(336, 356, 'Pietro', 'MAZZILLI', 59, 15, 1, NULL, 'pietrom_m@libero.it', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(337, 357, 'Christian', 'DAL BO\'', 59, 15, 1, NULL, 'christian.dalbo@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(338, 358, 'Toni', 'WEISSENBACHER', 44, 5, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(339, 359, 'Anni', 'WEISSENBACHER', 44, 5, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(340, 360, 'Heinrich', 'BERSCHNEIDER', 61, 14, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(341, 361, 'Egon', 'QUILDIES', 61, 14, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(342, 362, 'Vlasta', 'PEJCHAL', 34, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(343, 363, 'Roman', 'KALINOWSKI', 70, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(344, 364, 'Samuel', 'SAVARA', 6, 1, 1, NULL, 'samuel.savara@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(345, 365, 'Luca', 'MARCHIONI', 59, 15, 1, NULL, 'michele.marchioni@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(346, 366, 'Giuseppe', 'FASAN', 20, 15, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(347, 367, 'Luciana', 'PINCIN', 20, 15, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(348, 368, 'Frantisek', 'BROZ', 71, 2, 1, NULL, 'fbroz@seznam.cz', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(349, 369, 'Ivo', 'BITTNER', 71, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(350, 370, 'Arturo', 'DURIGON', 72, 15, 1, NULL, 'adurigon@alice.it', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(351, 371, 'Alain', 'LETULIER', NULL, 13, 1, NULL, 'aletulier@orange.fr', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(352, 372, 'Branislav', 'MATLOŇ', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(353, 373, 'Luboš', 'NEMČEK', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(354, 375, 'Marco', 'VAN MAARSCHALKERWAARD', 18, 9, 1, NULL, 'marcobvm@planet.nl', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(355, 376, 'Ján', 'TOMKO', 24, 1, 1, NULL, 'jan.tomko20@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(356, 377, 'Pierre', 'PAMS', 65, 27, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(357, 378, 'Rosa', 'ESPINOSA', 65, 27, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(358, 379, 'Henk', 'MESKER', 18, 9, 1, NULL, 'boanerges.hun@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(359, 380, 'Béla Z.', 'JUHÁSZ', 5, 3, 1, NULL, 'boanerges.hun@gmail.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(360, 381, 'Vít', 'MACKOVÍK', 3, 2, 1, NULL, 'vmackovik@volny.cz', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(361, 382, 'Mikael', 'PETERSSON', 74, 28, 1, NULL, 'petersson@hps-gmbh.com', NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(362, 383, 'Juazas', 'POCIUS', 63, 17, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(363, 384, 'Kazys', 'MACKEVICIUS', 63, 17, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(364, 385, 'Vladimirs', 'SMIRNOVS', 75, 17, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(365, 386, 'Tomas', 'CALLHEIM', 74, 28, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(366, 388, 'Özkan', 'TURAŞL?', 28, 21, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(367, 390, 'Kamil', 'KLEČKA', 10, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(368, 391, 'Erich', 'JANOVIČ', 6, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(369, 392, 'Jindřich', 'ZOUHAR', 19, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(370, 393, 'Marián', 'PRAŽENKA', 6, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(371, 394, 'Jaroslav', 'SPODNIAK', 6, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(372, 395, 'István', 'LANGÓ', 5, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(373, 396, 'Jaroslav', 'AGH', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(374, 398, 'Elod', 'BODOR', NULL, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(375, 399, 'János', 'FÁBIÁN', 5, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(376, 400, 'Gabriel', 'MICHLIAN', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(377, 401, 'Eleonóra', 'LANTOS', 5, 3, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(378, 402, 'František', 'MEDRÍK', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(379, 403, 'Zoltán', 'TAKÁČ', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(380, 405, 'Peter', 'VÉGH', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(381, 406, 'Kateřina', 'HUBACZOVÁ', 7, 2, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(382, 407, 'Ladislav', 'BACIGÁL', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(383, 408, 'Mário', 'ŠIŠKA', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(384, 410, 'Miroslava', 'SZIKOROVÁ', NULL, 1, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(385, 411, 'František', 'LOVIČ', 2, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(386, 412, 'Grzegorz', 'CHYTRY', 34, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(387, 413, 'Jirzy', 'MICHALAK', 34, 4, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(388, 414, 'Jozef', 'VAKULA', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(389, 416, 'Miroslava', 'BALÁŽOVÁ', 1, 1, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(390, 417, 'Jaroslav', 'REMŽA', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(391, 418, 'Štefan', 'KRÁSNY', 24, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(392, 419, 'Milan', 'ČERTÍK', 24, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(393, 420, 'Matúš', 'ZUBO', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(394, 421, 'Alexander', 'NEJEDLÝ', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(395, 422, 'Eduard', 'ULIČNÝ', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(396, 423, 'Robert', 'MARIKOVIČ', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(397, 424, 'Viliam', 'KONUS', 6, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(398, 425, 'Bronislav', 'TOMKA', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(399, 426, 'Ivan', 'TOMÁŠEK', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(400, 427, 'Stanislav', 'FARANA', 78, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(401, 428, 'Peter', 'POHLÚDKA', 78, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(402, 429, 'Jiři', 'MOTYČKA', 78, 2, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(403, 430, 'Peter', 'ĎURČAN', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(404, 431, 'Patrícia', 'TKÁČOVÁ', NULL, 1, 2, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(405, 435, 'Róbert', 'ŠMOTLÁK', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(406, 436, 'Tibor', 'DEMJÉN', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(407, 437, 'Tomáš', 'DRENKO', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(408, 438, 'Peter', 'RANTO', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(409, 439, 'Anton', 'SZABÓ', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(410, 440, 'Michal', 'MIKO', NULL, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(411, 441, 'Tibor', 'BÁNESZ', 1, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(412, 442, 'Ottó', 'HORTOBÁGYI', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(413, 443, 'László', 'MADARÁSZ', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(414, 444, 'Márk Richárd', 'KÁTAI', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(415, 445, 'László', 'BENES', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(416, 446, 'Róbert', 'NICHTER', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(417, 447, 'Zsolt', 'VARGA', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(418, 448, 'Máté', 'FELNAGY', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(419, 449, 'Attila', 'FÜLÖP', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(420, 450, 'János', 'HORNUNG', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(421, 451, 'György', 'TŰ', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(422, 452, 'Zoltán', 'SOMBOR', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(423, 453, 'Lajos', 'KALMÁR', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(424, 454, 'Márton', 'GERBER', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(425, 455, 'Péter Tamás', 'BÉRES', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(426, 456, 'Attila', 'GOMBAI', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(427, 457, 'Levente', 'KISS', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(428, 458, 'Zoltán', 'VAS', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(429, 459, 'András', 'MÁRKOVICS', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(430, 460, 'Csaba', 'SZÉKELY', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(431, 461, 'Tamás', 'VÁRADI', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(432, 462, 'Attila', 'MARTON', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(433, 463, 'Balázs', 'DOSZPOD', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(434, 464, 'Richard László', 'BALOGH', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(435, 465, 'Attila', 'KOVÁCS', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(436, 466, 'István', 'GÁBOR', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30');
INSERT INTO `people` (`id`, `access_id`, `first_name`, `last_name`, `club_id`, `country_id`, `gender_id`, `phone`, `email1`, `email2`, `active`, `created`, `modified`) VALUES
(437, 467, 'Csaba', 'RÁCZ', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(438, 468, 'Milán', 'GAUDI', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(439, 469, 'János', 'NAGY', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(440, 470, 'Gábor', 'PAZÁR', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(441, 471, 'Zsolt', 'ORSZÁG', 80, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(442, 472, 'Róbert', 'MÁCSODI', 80, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(443, 473, 'Béla Zoltán', 'JUHÁSZ', 80, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(444, 474, 'Zsolt', 'KISS', 84, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(445, 475, 'Zsolt', 'KOVÁCS', 89, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(446, 476, 'Ferenc', 'VERZÁR', 84, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(447, 477, 'Michal', 'KOŽA', 81, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(448, 478, 'Maroš', 'STRAŽANEC', 81, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(449, 479, 'Juraj', 'BANÁS', 81, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(450, 480, 'Juraj', 'MIKUŠ', 81, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(451, 481, 'Juraj', 'MIKUŠ', 81, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(452, 482, 'Gábor', 'KOLLER', 81, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(453, 483, 'Peter', 'MELO', 81, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(454, 484, 'Csaba', 'BORBÉLY', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(455, 485, 'Tivadar', 'TRUBACS', 85, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(456, 486, 'Ferenc', 'VARGA', 85, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(457, 487, 'Szilárd', 'HEGYHÁTI', 85, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(458, 488, 'Ádám', 'GERGELY', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(459, 489, 'Dávid', 'MARIÁN', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(460, 490, 'Viktor', 'KATHI', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(461, 491, 'Emese', 'HORVÁTH', 82, 3, 2, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(462, 492, 'Dénes', 'BACSU', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(463, 493, 'László', 'GYOVAI', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(464, 494, 'Csaba', 'RÉTI', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(465, 495, 'László', 'TÓTH', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(466, 496, 'Tamás', 'VERHÁS', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(467, 497, 'Sándor', 'SIPOS', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(468, 498, 'Kristóf', 'ZAGYVA', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(469, 499, 'Ferenc', 'HALÁSZ', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(470, 500, 'Gergely', 'VASS', 86, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(471, 501, 'Gergő', 'VASS', 86, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(472, 502, 'Béla', 'FODOR', 87, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(473, 503, 'István', 'GALAMBOS', 87, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(474, 504, 'István', 'IFJ. GALAMBOS', 87, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(475, 505, 'Levente', 'KISS', 87, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(476, 506, 'Ferenc', 'MERKLIN', 87, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(477, 507, 'Zsolt', 'OSKÓ', 87, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(478, 508, 'Kende', 'KISS', 84, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(479, 509, 'Péter', 'LANTOS', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(480, 511, 'Rita', 'ORSZÁG', 80, 3, 2, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(481, 512, 'Zsolt', 'LESKÓ', 80, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(482, 513, 'Bence', 'LANGER', 87, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(483, 514, 'Zoltán', 'GIMESI', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(484, 515, 'Miklós', 'GALGÓCZY', 83, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(485, 516, 'Gergő Ferenc', 'NAGY', 89, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(486, 517, 'Willi', 'ERTL', 90, 5, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(487, 518, 'Bernhard', 'KNIELY', 90, 5, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(488, 519, 'Roland', 'HOHENAUER', 90, 5, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(489, 520, 'László', 'FARAGÓ', 90, 5, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(490, 521, 'Tibor', 'DEMJÉN', 88, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(491, 522, 'Zsolt', 'BUKATTA', 88, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(492, 523, 'Péter', 'BASZAR', 88, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(493, 524, 'Géza', 'REGULA', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(494, 525, 'Bence', 'BÖRZSEI', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(495, 526, 'László', 'DR. KÁKAI', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(496, 527, 'István', 'DR. KOSZTIS', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(497, 528, 'Attila', 'HORVÁTH', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(498, 529, 'Kristóf', 'BICZÓ', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(499, 530, 'Zsolt', 'BÍRÓ', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(500, 531, 'József', 'TÓTH', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(501, 532, 'Antal', 'BARÁTH', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(502, 533, 'Szabolcs', 'TÖRÖK', 84, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(503, 534, 'Dániel', 'FEHÉRVÁRI', 84, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(504, 535, 'Csaba', 'MÁTÉH', 89, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(505, 536, 'Miklós', 'DR. SIPTÁR', 79, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(506, 537, 'Zoltán', 'NÉMETH', 87, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(507, 538, 'Zsolt', 'WÉBER', 84, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(508, 539, 'Barna', 'KUN', 84, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(509, 540, 'Attila', 'BODNÁR', 82, 3, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(510, 541, 'Zoltan', 'TAKÁČ', 81, 1, 1, NULL, NULL, NULL, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `registrations`
--

CREATE TABLE `registrations` (
  `id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `competition_id` int(11) DEFAULT NULL,
  `person_id` int(11) DEFAULT NULL,
  `club_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `registration_number` int(11) DEFAULT NULL,
  `competition_number` int(11) DEFAULT NULL,
  `table_number` int(11) DEFAULT NULL,
  `final_rank` int(11) DEFAULT NULL,
  `final_rank_women` int(11) DEFAULT NULL,
  `result_time` datetime DEFAULT NULL,
  `fee_amount` decimal(12,2) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `disqualification_reason` varchar(255) DEFAULT NULL,
  `note1` text DEFAULT NULL,
  `note2` text DEFAULT NULL,
  `access_last_modified` datetime DEFAULT NULL,
  `disqualified` tinyint(1) NOT NULL DEFAULT 0,
  `team_scored` tinyint(1) NOT NULL DEFAULT 0,
  `team_qualified` tinyint(1) NOT NULL DEFAULT 0,
  `team_top3` tinyint(1) NOT NULL DEFAULT 0,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `expo` tinyint(1) NOT NULL DEFAULT 0,
  `gala` tinyint(1) NOT NULL DEFAULT 0,
  `payment_ok` tinyint(1) NOT NULL DEFAULT 0,
  `presidents_dinner` tinyint(1) NOT NULL DEFAULT 0,
  `present` tinyint(1) NOT NULL DEFAULT 0,
  `finished` tinyint(1) NOT NULL DEFAULT 0,
  `competing` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `registrations`
--

INSERT INTO `registrations` (`id`, `access_id`, `competition_id`, `person_id`, `club_id`, `country_id`, `team_id`, `registration_number`, `competition_number`, `table_number`, `final_rank`, `final_rank_women`, `result_time`, `fee_amount`, `email`, `disqualification_reason`, `note1`, `note2`, `access_last_modified`, `disqualified`, `team_scored`, `team_qualified`, `team_top3`, `email_sent`, `expo`, `gala`, `payment_ok`, `presidents_dinner`, `present`, `finished`, `competing`, `created`, `modified`) VALUES
(1, 1, 1, 6, 1, 1, 1, 1001, 1, 1, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-07-24 10:51:08', 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(2, 2, 1, 2, 1, 1, 2, 1002, 2, 2, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-07-24 10:51:53', 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(3, 3, 1, 1, 1, 1, 1, 1003, 3, 2, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-07-24 10:51:46', 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(4, 4, 1, 7, 1, 1, 2, 1004, 4, 1, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-07-24 10:52:32', 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(5, 5, 1, 17, 1, 7, 1, 1005, 5, 1, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-07-24 10:53:41', 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(6, 6, 1, 3, 1, 1, 2, 1006, 6, 2, NULL, NULL, NULL, 0.00, 'juraj.banas@zoznam.sk', NULL, NULL, NULL, '2026-07-24 10:54:01', 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(7, 7, 1, 4, 1, 1, 3, 1007, 7, 1, NULL, NULL, NULL, 0.00, 'fredy.banas@gmail.com', NULL, NULL, NULL, '2026-07-24 10:54:49', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(8, 8, 1, 12, 1, 1, 3, 1008, 8, 2, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-07-24 10:55:15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(9, 288, 5, 434, 82, 3, 54, 1019, 19, NULL, 21, NULL, '1899-12-30 00:49:15', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:26:10', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(10, 289, 5, 433, 82, 3, 54, 1020, 20, NULL, 13, NULL, '1899-12-30 00:59:52', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:36:55', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(11, 290, 5, 427, 82, 3, 54, 1021, 21, NULL, 42, 1, '1899-12-30 00:31:07', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:09:04', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(12, 291, 5, 430, 82, 3, NULL, 1022, 22, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-04-11 13:33:58', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(13, 292, 5, 501, 82, 3, NULL, 1023, 23, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-04-11 13:33:30', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(14, 293, 5, 494, 82, 3, 55, 1024, 24, NULL, 7, NULL, '1899-12-30 01:24:51', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 16:01:54', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(15, 294, 5, 424, 82, 3, NULL, 1025, 25, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-04-11 13:33:43', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(16, 295, 5, 423, 82, 3, 55, 1026, 26, NULL, 37, 1, '1899-12-30 00:35:28', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:12:56', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(17, 296, 5, 428, 82, 3, 55, 1027, 27, NULL, 24, NULL, '1899-12-30 00:46:33', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:24:08', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(18, 297, 5, 472, 87, 3, 56, 1028, 28, NULL, 35, 1, '1899-12-30 00:37:15', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:14:17', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(19, 298, 5, 473, 87, 3, 56, 1029, 29, NULL, 15, NULL, '1899-12-30 00:57:10', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:34:15', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(20, 299, 5, 474, 87, 3, 56, 1030, 30, NULL, 22, NULL, '1899-12-30 00:47:55', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:24:57', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(21, 300, 5, 475, 87, 3, 56, 1031, 31, NULL, 18, NULL, '1899-12-30 00:52:00', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:28:42', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(22, 301, 5, 477, 87, 3, 56, 1032, 32, NULL, 39, 1, '1899-12-30 00:34:55', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:11:50', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(23, 302, 5, 502, 84, 3, 57, 1033, 33, NULL, 36, 1, '1899-12-30 00:35:43', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:12:23', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(24, 303, 5, 503, 84, 3, 57, 1034, 34, NULL, 11, NULL, '1899-12-30 01:06:02', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:42:43', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(25, 304, 5, 478, 84, 3, 57, 1035, 35, NULL, 12, NULL, '1899-12-30 01:03:10', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:40:16', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(26, 306, 5, 444, 84, 3, 57, 1036, 36, NULL, 9, NULL, '1899-12-30 01:16:55', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:53:45', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(27, 307, 5, 441, 80, 3, 58, 1037, 37, NULL, 29, NULL, '1899-12-30 00:41:38', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:18:07', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(28, 308, 5, 480, 80, 3, 58, 1038, 38, NULL, 31, 1, '1899-12-30 00:38:55', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:15:31', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(29, 309, 5, 443, 80, 3, 58, 1039, 39, NULL, 16, NULL, '1899-12-30 00:56:49', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:33:56', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(30, 312, 5, 485, 89, 3, 59, 1040, 40, NULL, 23, NULL, '1899-12-30 00:47:02', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:23:47', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(31, 313, 5, 504, 89, 3, 59, 1041, 41, NULL, 33, 1, '1899-12-30 00:37:41', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:14:47', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(32, 314, 5, 445, 89, 3, 59, 1042, 42, NULL, 14, NULL, '1899-12-30 00:58:08', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:34:51', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(33, 315, 5, 466, 83, 3, 60, 1043, 43, NULL, 2, NULL, '1899-12-30 02:03:54', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 16:40:48', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(34, 316, 5, 435, 83, 3, 60, 1044, 44, NULL, 5, NULL, '1899-12-30 01:27:20', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 16:04:27', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(35, 317, 5, 464, 83, 3, 60, 1045, 45, NULL, 10, NULL, '1899-12-30 01:08:04', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:45:21', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(36, 318, 5, 465, 83, 3, 60, 1046, 46, NULL, 20, NULL, '1899-12-30 00:50:21', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:26:57', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(37, 319, 5, 436, 83, 3, 60, 1047, 47, NULL, 45, 1, '1899-12-30 00:07:17', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 14:43:57', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(38, 320, 5, 440, 83, 3, 61, 1048, 48, NULL, 47, 1, '1899-12-30 00:02:48', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 14:39:58', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(39, 321, 5, 437, 83, 3, 61, 1049, 49, NULL, 32, 1, '1899-12-30 00:38:05', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:15:16', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(40, 322, 5, 439, 83, 3, 61, 1050, 50, NULL, 25, NULL, '1899-12-30 00:45:46', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:22:20', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(41, 323, 5, 438, 83, 3, 61, 1051, 51, NULL, 19, NULL, '1899-12-30 00:51:38', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:28:27', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(42, 324, 5, 462, 83, 3, 61, 1052, 52, NULL, 8, NULL, '1899-12-30 01:19:03', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:56:07', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(43, 326, 6, 454, 79, 3, 62, 1001, 1, NULL, 40, 2, '1899-12-30 00:32:31', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:06:42', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(44, 327, 6, 412, 79, 3, 62, 1002, 2, NULL, 29, NULL, '1899-12-30 00:42:36', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:16:59', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(45, 328, 6, 418, 79, 3, 62, 1003, 3, NULL, 13, NULL, '1899-12-30 00:56:16', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:30:22', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(46, 329, 6, 417, 79, 3, 62, 1004, 4, NULL, 4, NULL, '1899-12-30 01:42:15', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 16:17:49', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(47, 330, 6, 419, 79, 3, 63, 1005, 5, NULL, 20, NULL, '1899-12-30 00:49:33', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:23:38', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(48, 331, 6, 420, 79, 3, 63, 1006, 6, NULL, 42, 2, '1899-12-30 00:02:40', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 14:36:46', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(49, 332, 6, 497, 79, 3, 63, 1007, 7, NULL, 31, NULL, '1899-12-30 00:41:00', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:15:36', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(50, 333, 6, 496, 79, 3, 63, 1008, 8, NULL, 27, NULL, '1899-12-30 00:44:20', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:19:14', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(51, 334, 6, 505, 79, 3, NULL, 1009, 9, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-05-30 12:49:15', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(52, 335, 6, 455, 85, 3, 64, 1010, 10, NULL, 26, NULL, '1899-12-30 00:45:00', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:19:22', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(53, 336, 6, 456, 85, 3, 64, 1011, 11, NULL, 5, NULL, '1899-12-30 01:39:29', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 16:14:08', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(54, 337, 6, 457, 85, 3, 64, 1012, 12, NULL, 41, 2, '1899-12-30 00:24:29', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 14:58:54', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(55, 338, 6, 434, 82, 3, 65, 1013, 13, NULL, 30, NULL, '1899-12-30 00:41:52', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:17:19', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(56, 339, 6, 501, 82, 3, NULL, 1014, 14, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-05-30 12:48:38', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(57, 340, 6, 433, 82, 3, 65, 1015, 15, NULL, 23, NULL, '1899-12-30 00:47:40', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:21:56', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(58, 10, 7, 417, 79, 3, 2, 1006, 6, NULL, 17, NULL, '1899-12-30 00:46:27', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(59, 11, 7, 418, 79, 3, 3, 1007, 7, NULL, 16, NULL, '1899-12-30 00:47:44', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(60, 12, 7, 419, 79, 3, 3, 1008, 8, NULL, 34, NULL, '1899-12-30 00:25:08', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(61, 13, 7, 420, 79, 3, 3, 1009, 9, NULL, 41, NULL, '1899-12-30 00:04:53', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(62, 14, 7, 421, 82, 3, 4, 1010, 10, NULL, 10, NULL, '1899-12-30 00:58:11', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(63, 15, 7, 422, 82, 3, 4, 1011, 11, NULL, 38, NULL, '1899-12-30 00:21:16', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(64, 16, 7, 423, 82, 3, 4, 1012, 12, NULL, 21, NULL, '1899-12-30 00:39:16', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(65, 17, 7, 424, 82, 3, 4, 1013, 13, NULL, 20, NULL, '1899-12-30 00:42:27', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(66, 18, 7, 425, 82, 3, 5, 1014, 14, NULL, 33, NULL, '1899-12-30 00:26:14', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(67, 19, 7, 426, 82, 3, 5, 1015, 15, NULL, 27, NULL, '1899-12-30 00:35:41', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(68, 20, 7, 427, 82, 3, 5, 1016, 16, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(69, 21, 7, 428, 82, 3, 5, 1017, 17, NULL, 15, NULL, '1899-12-30 00:48:41', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(70, 22, 7, 429, 82, 3, 6, 1018, 18, NULL, 8, NULL, '1899-12-30 01:06:17', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(71, 23, 7, 430, 82, 3, 6, 1019, 19, NULL, 18, NULL, '1899-12-30 00:44:22', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(72, 24, 7, 431, 82, 3, 6, 1020, 20, NULL, 25, NULL, '1899-12-30 00:36:53', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(73, 25, 7, 432, 82, 3, 7, 1021, 21, NULL, 42, NULL, '1899-12-30 00:03:30', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(74, 26, 7, 433, 82, 3, 7, 1022, 22, NULL, 39, NULL, '1899-12-30 00:20:19', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(75, 27, 7, 434, 82, 3, 7, 1023, 23, NULL, 35, NULL, '1899-12-30 00:24:29', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(76, 28, 7, 435, 83, 3, 8, 1024, 24, NULL, 5, NULL, '1899-12-30 01:15:22', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(77, 29, 7, 436, 83, 3, 8, 1025, 25, NULL, 3, NULL, '1899-12-30 01:25:16', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(78, 30, 7, 437, 83, 3, 8, 1026, 26, NULL, 28, NULL, '1899-12-30 00:35:13', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(79, 31, 7, 438, 83, 3, 9, 1027, 27, NULL, 43, NULL, '1899-12-30 00:01:30', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(80, 32, 7, 439, 83, 3, 9, 1028, 28, NULL, 26, NULL, '1899-12-30 00:36:43', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(81, 33, 7, 440, 83, 3, 9, 1029, 29, NULL, 11, NULL, '1899-12-30 00:57:27', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(82, 34, 7, 441, 80, 3, 10, 1030, 30, NULL, 24, NULL, '1899-12-30 00:36:57', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(83, 35, 7, 442, 80, 3, 10, 1031, 31, NULL, 31, NULL, '1899-12-30 00:30:15', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(84, 36, 7, 443, 80, 3, 10, 1032, 32, NULL, 6, NULL, '1899-12-30 01:13:40', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(85, 37, 7, 444, 84, 3, 11, 1033, 33, NULL, 13, NULL, '1899-12-30 00:54:58', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(86, 38, 7, 445, 84, 3, 11, 1034, 34, NULL, 22, NULL, '1899-12-30 00:38:11', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(87, 41, 7, 446, 84, 3, 11, 1035, 35, NULL, 40, NULL, '1899-12-30 00:10:08', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(88, 42, 7, 447, 81, 1, 12, 1036, 36, NULL, 9, NULL, '1899-12-30 01:05:34', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(89, 43, 7, 448, 81, 1, 12, 1037, 37, NULL, 12, NULL, '1899-12-30 00:56:03', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(90, 46, 7, 449, 81, 1, 12, 1038, 38, NULL, 14, NULL, '1899-12-30 00:49:20', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(91, 48, 7, 451, 81, 1, 12, 1039, 39, NULL, 37, NULL, '1899-12-30 00:21:47', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(92, 49, 7, 452, 81, 1, 12, 1040, 40, NULL, 7, NULL, '1899-12-30 01:09:25', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(93, 50, 7, 453, 81, 1, 13, 1041, 41, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(94, 53, 7, 454, 79, 3, 3, 1042, 42, NULL, 19, NULL, '1899-12-30 00:43:56', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(95, 56, 7, 455, 85, 3, 14, 1043, 43, NULL, 1, NULL, '1899-12-30 01:46:00', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(96, 57, 7, 456, 85, 3, 14, 1044, 44, NULL, 4, NULL, '1899-12-30 01:18:41', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(97, 58, 7, 457, 85, 3, 14, 1045, 45, NULL, 2, NULL, '1899-12-30 01:34:40', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(98, 100, 2, 432, 82, 3, NULL, 1001, 1, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(99, 101, 2, 458, 82, 3, 15, 1002, 2, NULL, 9, NULL, '1899-12-30 01:04:25', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(100, 102, 2, 426, 82, 3, 15, 1003, 3, NULL, 31, NULL, '1899-12-30 00:32:35', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(101, 103, 2, 427, 82, 3, 15, 1004, 4, NULL, 37, NULL, '1899-12-30 00:29:28', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(102, 104, 2, 434, 82, 3, 16, 1005, 5, NULL, 24, NULL, '1899-12-30 00:43:34', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(103, 105, 2, 430, 82, 3, 16, 1006, 6, NULL, 42, NULL, '1899-12-30 00:01:00', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(104, 106, 2, 431, 82, 3, NULL, 1007, 7, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(105, 107, 2, 421, 82, 3, 16, 1008, 8, NULL, 12, NULL, '1899-12-30 01:02:49', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(106, 108, 2, 459, 82, 3, 16, 1009, 9, NULL, 27, NULL, '1899-12-30 00:40:48', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(107, 109, 2, 422, 82, 3, 16, 1010, 10, NULL, 30, NULL, '1899-12-30 00:34:48', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(108, 110, 2, 425, 82, 3, 17, 1011, 11, NULL, 13, NULL, '1899-12-30 01:00:49', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(109, 111, 2, 460, 82, 3, NULL, 1012, 12, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(110, 112, 2, 428, 82, 3, 17, 1013, 13, NULL, 32, NULL, '1899-12-30 00:32:25', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(111, 113, 2, 461, 82, 3, 17, 1014, 14, NULL, 41, 1, '1899-12-30 00:01:18', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(112, 114, 2, 462, 83, 3, 18, 1015, 15, NULL, 18, NULL, '1899-12-30 00:52:39', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(113, 115, 2, 463, 83, 3, NULL, 1016, 16, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(114, 116, 2, 464, 83, 3, 18, 1017, 17, NULL, 3, NULL, '1899-12-30 01:23:08', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(115, 117, 2, 465, 83, 3, 18, 1018, 18, NULL, 4, NULL, '1899-12-30 01:15:58', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(116, 118, 2, 466, 83, 3, 18, 1019, 19, NULL, 1, NULL, '1899-12-30 02:34:03', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(117, 119, 2, 436, 83, 3, 19, 1020, 20, NULL, 39, NULL, '1899-12-30 00:24:58', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(118, 120, 2, 435, 83, 3, 19, 1021, 21, NULL, 2, NULL, '1899-12-30 01:36:16', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(119, 121, 2, 467, 83, 3, 19, 1022, 22, NULL, 7, NULL, '1899-12-30 01:11:19', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(120, 122, 2, 468, 83, 3, 19, 1023, 23, NULL, 25, NULL, '1899-12-30 00:43:23', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(121, 123, 2, 437, 83, 3, 20, 1024, 24, NULL, 22, NULL, '1899-12-30 00:47:19', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(122, 124, 2, 438, 83, 3, 20, 1025, 25, NULL, 35, NULL, '1899-12-30 00:31:52', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(123, 125, 2, 439, 83, 3, 20, 1026, 26, NULL, 23, NULL, '1899-12-30 00:44:06', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(124, 126, 2, 469, 83, 3, NULL, 1027, 27, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(125, 129, 2, 442, 80, 3, 21, 1028, 28, NULL, 14, NULL, '1899-12-30 00:59:36', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(126, 130, 2, 443, 80, 3, 21, 1029, 29, NULL, 21, NULL, '1899-12-30 00:48:54', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(127, 131, 2, 441, 80, 3, 21, 1030, 30, NULL, 38, NULL, '1899-12-30 00:25:49', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(128, 132, 2, 419, 79, 3, 22, 1031, 31, NULL, 17, NULL, '1899-12-30 00:54:12', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(129, 133, 2, 418, 79, 3, 22, 1032, 32, NULL, 26, NULL, '1899-12-30 00:42:47', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(130, 134, 2, 417, 79, 3, 24, 1033, 33, NULL, 15, NULL, '1899-12-30 00:56:47', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(131, 135, 2, 416, 79, 3, 22, 1034, 34, NULL, 11, NULL, '1899-12-30 01:03:57', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(132, 136, 2, 454, 79, 3, 22, 1035, 35, NULL, 16, NULL, '1899-12-30 00:55:02', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(133, 137, 2, 445, 86, 3, 23, 1036, 36, NULL, 6, NULL, '1899-12-30 01:14:00', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(134, 138, 2, 470, 86, 3, 23, 1037, 37, NULL, 29, NULL, '1899-12-30 00:39:37', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(135, 139, 2, 471, 86, 3, 23, 1038, 38, NULL, 10, NULL, '1899-12-30 01:04:06', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(136, 140, 2, 455, 85, 3, 24, 1039, 39, NULL, 33, NULL, '1899-12-30 00:32:02', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(137, 141, 2, 457, 85, 3, 24, 1040, 40, NULL, 36, NULL, '1899-12-30 00:30:29', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(138, 144, 2, 472, 87, 3, 25, 1041, 41, NULL, 40, NULL, '1899-12-30 00:20:00', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(139, 145, 2, 473, 87, 3, 25, 1042, 42, NULL, 5, NULL, '1899-12-30 01:15:40', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(140, 146, 2, 474, 87, 3, 25, 1043, 43, NULL, 20, NULL, '1899-12-30 00:50:35', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(141, 149, 2, 475, 87, 3, 26, 1044, 44, NULL, 8, NULL, '1899-12-30 01:06:13', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(142, 150, 2, 476, 87, 3, 26, 1045, 45, NULL, 34, NULL, '1899-12-30 00:32:01', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(143, 151, 2, 477, 87, 3, 26, 1046, 46, NULL, 28, NULL, '1899-12-30 00:39:40', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(144, 154, 2, 423, 82, 3, 17, 1047, 47, NULL, 19, NULL, '1899-12-30 00:51:42', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(145, 157, 3, 478, 84, 3, 27, 1001, 1, NULL, 27, NULL, '1899-12-30 00:40:02', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(146, 158, 3, 444, 84, 3, 27, 1002, 2, NULL, 10, NULL, '1899-12-30 00:58:13', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(147, 159, 3, 445, 86, 3, 27, 1003, 3, NULL, 28, NULL, '1899-12-30 00:39:34', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(148, 160, 3, 470, 86, 3, 27, 1004, 4, NULL, 13, NULL, '1899-12-30 00:53:17', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(149, 161, 3, 473, 87, 3, 29, 1005, 5, NULL, 32, NULL, '1899-12-30 00:31:12', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(150, 162, 3, 475, 87, 3, 29, 1006, 6, NULL, 30, NULL, '1899-12-30 00:36:01', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(151, 163, 3, 476, 87, 3, 29, 1007, 7, NULL, 15, NULL, '1899-12-30 00:52:29', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(152, 165, 3, 466, 83, 3, 28, 1008, 8, NULL, 2, NULL, '1899-12-30 01:39:26', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(153, 166, 3, 435, 83, 3, 28, 1009, 9, NULL, 5, NULL, '1899-12-30 01:16:40', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(154, 167, 3, 467, 83, 3, 28, 1010, 10, NULL, 12, NULL, '1899-12-30 00:54:17', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(155, 168, 3, 436, 83, 3, 28, 1011, 11, NULL, 36, NULL, '1899-12-30 00:16:43', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(156, 169, 3, 465, 83, 3, 28, 1012, 12, NULL, 6, NULL, '1899-12-30 01:11:32', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(157, 170, 3, 462, 83, 3, 30, 1013, 13, NULL, 3, NULL, '1899-12-30 01:32:05', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(158, 171, 3, 440, 83, 3, 30, 1014, 14, NULL, 37, NULL, '1899-12-30 00:01:42', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(159, 172, 3, 439, 83, 3, 30, 1015, 15, NULL, 18, NULL, '1899-12-30 00:47:55', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(160, 173, 3, 443, 80, 3, 35, 1016, 16, NULL, 33, NULL, '1899-12-30 00:30:41', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(161, 174, 3, 479, 83, 3, 30, 1017, 17, NULL, 22, NULL, '1899-12-30 00:41:28', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(162, 175, 3, 417, 79, 3, 32, 1018, 18, NULL, 21, NULL, '1899-12-30 00:42:05', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(163, 176, 3, 416, 79, 3, 32, 1019, 19, NULL, 7, NULL, '1899-12-30 01:05:43', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(164, 177, 3, 418, 79, 3, 32, 1020, 20, NULL, 26, NULL, '1899-12-30 00:40:04', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(165, 178, 3, 454, 79, 3, 32, 1021, 21, NULL, 1, NULL, '1899-12-30 01:49:50', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(166, 180, 3, 461, 82, 3, 31, 1022, 22, NULL, 23, 1, '1899-12-30 00:41:01', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(167, 181, 3, 427, 82, 3, 31, 1023, 23, NULL, 34, NULL, '1899-12-30 00:29:28', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(168, 182, 3, 428, 82, 3, 31, 1024, 24, NULL, 9, NULL, '1899-12-30 00:59:10', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(169, 183, 3, 421, 82, 3, 31, 1025, 25, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(170, 184, 3, 431, 82, 3, 33, 1026, 26, NULL, 20, NULL, '1899-12-30 00:44:30', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(171, 185, 3, 434, 82, 3, 33, 1027, 27, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(172, 186, 3, 430, 82, 3, 33, 1028, 28, NULL, 16, NULL, '1899-12-30 00:52:10', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(173, 187, 3, 423, 82, 3, 33, 1029, 29, NULL, 19, NULL, '1899-12-30 00:45:16', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(174, 188, 3, 425, 82, 3, 31, 1030, 30, NULL, 31, NULL, '1899-12-30 00:35:40', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(175, 190, 3, 438, 83, 3, 34, 1031, 31, NULL, 8, NULL, '1899-12-30 01:03:19', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(176, 191, 3, 455, 85, 3, 34, 1032, 32, NULL, 17, NULL, '1899-12-30 00:48:11', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(177, 192, 3, 456, 85, 3, 34, 1033, 33, NULL, 24, NULL, '1899-12-30 00:40:40', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(178, 193, 3, 420, 79, 3, 32, 1034, 34, NULL, 14, NULL, '1899-12-30 00:52:55', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(179, 195, 3, 441, 80, 3, 35, 1035, 35, NULL, 29, NULL, '1899-12-30 00:39:09', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(180, 196, 3, 480, 80, 3, 35, 1036, 36, NULL, 35, 2, '1899-12-30 00:18:02', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(181, 198, 3, 464, 83, 3, 30, 1037, 37, NULL, 4, NULL, '1899-12-30 01:25:29', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(182, 200, 3, 481, 80, 3, 35, 1038, 38, NULL, 25, NULL, '1899-12-30 00:40:18', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(183, 201, 3, 482, 87, 3, 29, 1039, 39, NULL, 11, NULL, '1899-12-30 00:57:15', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(184, 204, 4, 466, 83, 3, 36, 1001, 1, NULL, 55, NULL, '1899-12-30 00:07:37', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(185, 205, 4, 467, 83, 3, 37, 1002, 2, NULL, 6, NULL, '1899-12-30 01:38:51', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(186, 206, 4, 435, 83, 3, 38, 1003, 3, NULL, 50, NULL, '1899-12-30 00:27:35', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(187, 208, 4, 462, 83, 3, 37, 1004, 4, NULL, 37, NULL, '1899-12-30 00:45:56', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(188, 209, 4, 465, 83, 3, 36, 1005, 5, NULL, 12, NULL, '1899-12-30 01:21:45', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(189, 210, 4, 436, 83, 3, 36, 1006, 6, NULL, 51, NULL, '1899-12-30 00:23:40', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(190, 211, 4, 468, 83, 3, 37, 1007, 7, NULL, 21, NULL, '1899-12-30 01:07:08', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(191, 212, 4, 483, 83, 3, 38, 1008, 8, NULL, 28, NULL, '1899-12-30 00:57:08', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(192, 213, 4, 464, 83, 3, 36, 1009, 9, NULL, 9, NULL, '1899-12-30 01:26:33', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(193, 214, 4, 479, 83, 3, 38, 1010, 10, NULL, 34, NULL, '1899-12-30 00:47:33', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(194, 215, 4, 440, 83, 3, 37, 1011, 11, NULL, 7, NULL, '1899-12-30 01:29:58', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(195, 216, 4, 437, 83, 3, 37, 1012, 12, NULL, 38, NULL, '1899-12-30 00:45:18', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(196, 217, 4, 439, 83, 3, 38, 1013, 13, NULL, 41, NULL, '1899-12-30 00:42:03', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(197, 218, 4, 484, 86, 3, 39, 1014, 14, NULL, 23, NULL, '1899-12-30 01:04:09', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(198, 219, 4, 445, 86, 3, 39, 1015, 15, NULL, 43, NULL, '1899-12-30 00:39:06', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(199, 220, 4, 470, 86, 3, 39, 1016, 16, NULL, 32, NULL, '1899-12-30 00:51:31', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(200, 221, 4, 471, 86, 3, 39, 1017, 17, NULL, 25, NULL, '1899-12-30 00:58:32', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(201, 222, 4, 481, 80, 3, 40, 1018, 18, NULL, 47, NULL, '1899-12-30 00:34:00', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(202, 225, 4, 441, 80, 3, 40, 1019, 19, NULL, 54, NULL, '1899-12-30 00:08:02', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(203, 226, 4, 438, 83, 3, 40, 1020, 20, NULL, 19, NULL, '1899-12-30 01:08:17', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(204, 227, 4, 478, 84, 3, 41, 1021, 21, NULL, 36, NULL, '1899-12-30 00:45:58', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(205, 228, 4, 444, 84, 3, 41, 1022, 22, NULL, 20, NULL, '1899-12-30 01:08:03', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(206, 229, 4, 485, 89, 3, 41, 1023, 23, NULL, 39, NULL, '1899-12-30 00:45:10', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(207, 230, 4, 417, 79, 3, 42, 1024, 24, NULL, 27, NULL, '1899-12-30 00:57:18', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(208, 231, 4, 416, 79, 3, 42, 1025, 25, NULL, 22, NULL, '1899-12-30 01:07:02', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(209, 232, 4, 454, 79, 3, 42, 1026, 26, NULL, 4, NULL, '1899-12-30 01:47:12', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(210, 233, 4, 418, 79, 3, 43, 1027, 27, NULL, 31, NULL, '1899-12-30 00:53:28', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(211, 234, 4, 419, 79, 3, 43, 1028, 28, NULL, 49, NULL, '1899-12-30 00:28:43', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(212, 235, 4, 420, 79, 3, NULL, 1029, 29, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(213, 236, 4, 412, 79, 3, 42, 1030, 30, NULL, 42, NULL, '1899-12-30 00:39:53', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(214, 237, 4, 414, 79, 3, NULL, 1031, 31, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(215, 238, 4, 413, 79, 3, 43, 1032, 32, NULL, 24, NULL, '1899-12-30 00:59:18', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(216, 239, 4, 473, 87, 3, 44, 1033, 33, NULL, 13, NULL, '1899-12-30 01:21:06', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(217, 240, 4, 474, 87, 3, 44, 1034, 34, NULL, 11, NULL, '1899-12-30 01:22:28', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(218, 241, 4, 475, 87, 3, 44, 1035, 35, NULL, 52, NULL, '1899-12-30 00:15:00', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(219, 242, 4, 477, 87, 3, 44, 1036, 36, NULL, 26, NULL, '1899-12-30 00:58:10', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(220, 244, 4, 486, 90, 5, 45, 1037, 37, NULL, 16, NULL, '1899-12-30 01:13:50', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(221, 245, 4, 487, 90, 5, 45, 1038, 38, NULL, 10, NULL, '1899-12-30 01:23:10', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(222, 246, 4, 488, 90, 5, 45, 1039, 39, NULL, 18, NULL, '1899-12-30 01:11:24', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(223, 247, 4, 489, 90, 5, NULL, 1040, 40, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(224, 248, 4, 447, 81, 1, 47, 1041, 41, NULL, 5, NULL, '1899-12-30 01:41:06', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(225, 249, 4, 452, 81, 1, 47, 1042, 42, NULL, 46, NULL, '1899-12-30 00:37:37', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(226, 250, 4, 451, 81, 1, 47, 1043, 43, NULL, 35, NULL, '1899-12-30 00:46:06', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(227, 251, 4, 490, 88, 1, 47, 1044, 44, NULL, 29, NULL, '1899-12-30 00:55:40', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(228, 252, 4, 491, 88, 1, 47, 1045, 45, NULL, 40, NULL, '1899-12-30 00:44:58', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(229, 253, 4, 492, 88, 1, NULL, 1046, 46, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(230, 254, 4, 455, 85, 3, 46, 1047, 47, NULL, 1, NULL, '1899-12-30 02:15:55', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(231, 255, 4, 456, 85, 3, 46, 1048, 48, NULL, 3, NULL, '1899-12-30 01:50:30', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(232, 256, 4, 457, 85, 3, 46, 1049, 49, NULL, 2, NULL, '1899-12-30 02:13:10', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(233, 257, 4, 428, 82, 3, 48, 1050, 50, NULL, 14, NULL, '1899-12-30 01:20:29', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(234, 258, 4, 493, 82, 3, 48, 1051, 51, NULL, 33, NULL, '1899-12-30 00:50:20', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(235, 259, 4, 494, 82, 3, 48, 1052, 52, NULL, 15, NULL, '1899-12-30 01:15:57', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(236, 260, 4, 430, 82, 3, 48, 1053, 53, NULL, 30, NULL, '1899-12-30 00:54:23', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(237, 261, 4, 421, 82, 3, 48, 1054, 54, NULL, 17, NULL, '1899-12-30 01:11:50', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(238, 262, 4, 423, 82, 3, 49, 1055, 55, NULL, 8, NULL, '1899-12-30 01:28:32', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(239, 263, 4, 427, 82, 3, 49, 1056, 56, NULL, 48, NULL, '1899-12-30 00:29:47', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(240, 264, 4, 434, 82, 3, 49, 1057, 57, NULL, 53, NULL, '1899-12-30 00:14:15', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(241, 265, 4, 431, 82, 3, 49, 1058, 58, NULL, 45, NULL, '1899-12-30 00:37:42', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(242, 266, 4, 425, 82, 3, NULL, 1059, 59, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(243, 268, 4, 463, 83, 3, 36, 1060, 60, NULL, 44, NULL, '1899-12-30 00:38:32', 0.00, NULL, NULL, NULL, NULL, NULL, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(244, 270, 5, 415, 79, 3, 50, 1001, 1, NULL, 28, NULL, '1899-12-30 00:41:50', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:20:26', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(245, 271, 5, 454, 79, 3, 50, 1002, 2, NULL, 4, NULL, '1899-12-30 01:53:18', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 16:29:56', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(246, 272, 5, 418, 79, 3, 50, 1003, 3, NULL, 26, NULL, '1899-12-30 00:44:39', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:21:26', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(247, 273, 5, 419, 79, 3, 50, 1004, 4, NULL, 43, 1, '1899-12-30 00:27:40', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:05:00', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(248, 274, 5, 417, 79, 3, 50, 1005, 5, NULL, 30, NULL, '1899-12-30 00:40:40', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:17:22', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(249, 275, 5, 495, 79, 3, 51, 1006, 6, NULL, 40, 1, '1899-12-30 00:34:14', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:11:10', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(250, 276, 5, 496, 79, 3, NULL, 1007, 7, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-04-11 13:36:24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30');
INSERT INTO `registrations` (`id`, `access_id`, `competition_id`, `person_id`, `club_id`, `country_id`, `team_id`, `registration_number`, `competition_number`, `table_number`, `final_rank`, `final_rank_women`, `result_time`, `fee_amount`, `email`, `disqualification_reason`, `note1`, `note2`, `access_last_modified`, `disqualified`, `team_scored`, `team_qualified`, `team_top3`, `email_sent`, `expo`, `gala`, `payment_ok`, `presidents_dinner`, `present`, `finished`, `competing`, `created`, `modified`) VALUES
(251, 277, 5, 412, 79, 3, 51, 1008, 8, NULL, 17, NULL, '1899-12-30 00:54:48', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:31:46', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(252, 278, 5, 497, 79, 3, 51, 1009, 9, NULL, 27, NULL, '1899-12-30 00:42:16', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:20:14', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(253, 279, 5, 414, 79, 3, 51, 1010, 10, NULL, 38, 1, '1899-12-30 00:35:26', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:12:37', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(254, 280, 5, 498, 79, 3, 52, 1011, 11, NULL, 34, 1, '1899-12-30 00:37:18', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:14:28', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(255, 281, 5, 499, 79, 3, 52, 1012, 12, NULL, 44, 1, '1899-12-30 00:26:44', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:04:45', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(256, 282, 5, 420, 79, 3, 52, 1013, 13, NULL, 46, 1, '1899-12-30 00:03:29', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 14:40:25', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(257, 283, 5, 413, 79, 3, 52, 1014, 14, NULL, 41, 1, '1899-12-30 00:31:47', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 15:08:41', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(258, 284, 5, 500, 79, 3, NULL, 1015, 15, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-04-11 13:34:52', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(259, 285, 5, 455, 85, 3, 53, 1016, 16, NULL, 3, NULL, '1899-12-30 02:02:47', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 16:39:38', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(260, 286, 5, 456, 85, 3, 53, 1017, 17, NULL, 6, NULL, '1899-12-30 01:25:57', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 16:02:49', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(261, 287, 5, 457, 85, 3, 53, 1018, 18, NULL, 1, NULL, '1899-12-30 02:23:10', 0.00, NULL, NULL, NULL, NULL, '2026-04-11 16:59:57', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(262, 341, 6, 427, 82, 3, 65, 1016, 16, NULL, 34, 1, '1899-12-30 00:39:55', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:15:05', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(263, 342, 6, 425, 82, 3, 66, 1017, 17, NULL, 39, 2, '1899-12-30 00:32:48', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:07:07', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(264, 343, 6, 461, 82, 3, 66, 1018, 18, NULL, 32, 1, '1899-12-30 00:40:40', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:15:24', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(265, 344, 6, 493, 82, 3, 66, 1019, 19, NULL, 21, NULL, '1899-12-30 00:49:02', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:24:09', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(266, 345, 6, 430, 82, 3, NULL, 1020, 20, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-05-30 12:59:05', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(267, 346, 6, 494, 82, 3, 67, 1021, 21, NULL, 3, NULL, '1899-12-30 01:44:06', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 16:18:58', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(268, 347, 6, 423, 82, 3, NULL, 1022, 22, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-05-25 19:06:06', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(269, 348, 6, 421, 82, 3, 67, 1023, 23, NULL, 22, NULL, '1899-12-30 00:48:30', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:23:56', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(270, 349, 6, 428, 82, 3, 67, 1024, 24, NULL, 28, NULL, '1899-12-30 00:42:54', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:17:29', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(271, 350, 6, 472, 87, 3, NULL, 1025, 25, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-05-30 11:54:09', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(272, 351, 6, 473, 87, 3, 68, 1026, 26, NULL, 12, NULL, '1899-12-30 00:59:27', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:33:52', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(273, 352, 6, 474, 87, 3, 68, 1027, 27, NULL, 9, NULL, '1899-12-30 01:03:26', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:37:54', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(274, 353, 6, 506, 87, 3, 68, 1028, 28, NULL, 8, NULL, '1899-12-30 01:11:58', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:47:02', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(275, 354, 6, 477, 87, 3, NULL, 1029, 29, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-05-30 11:54:25', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(276, 355, 6, 507, 84, 3, 69, 1030, 30, NULL, 36, 2, '1899-12-30 00:37:52', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:12:05', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(277, 356, 6, 508, 84, 3, 69, 1031, 31, NULL, 43, 2, '1899-12-30 00:01:19', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 14:35:48', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(278, 357, 6, 478, 84, 3, 69, 1032, 32, NULL, 17, NULL, '1899-12-30 00:51:51', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:25:56', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(279, 358, 6, 444, 84, 3, 69, 1033, 33, NULL, 15, NULL, '1899-12-30 00:53:46', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:27:59', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(280, 359, 6, 441, 80, 3, 70, 1034, 34, NULL, 38, 2, '1899-12-30 00:36:20', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:10:45', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(281, 360, 6, 480, 80, 3, 70, 1035, 35, NULL, 35, 2, '1899-12-30 00:39:17', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:13:46', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(282, 361, 6, 443, 80, 3, 70, 1036, 36, NULL, 7, NULL, '1899-12-30 01:15:55', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:50:03', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(283, 363, 6, 470, 86, 3, 73, 1037, 37, NULL, 24, NULL, '1899-12-30 00:47:29', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:21:47', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(284, 365, 6, 504, 89, 3, 73, 1038, 38, NULL, 19, NULL, '1899-12-30 00:50:20', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:24:46', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(285, 366, 6, 445, 89, 3, 73, 1039, 39, NULL, 14, NULL, '1899-12-30 00:55:47', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:30:13', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(286, 367, 6, 466, 83, 3, 71, 1040, 40, NULL, 1, NULL, '1899-12-30 02:20:09', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 16:54:26', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(287, 368, 6, 435, 83, 3, 71, 1041, 41, NULL, 6, NULL, '1899-12-30 01:17:52', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:52:12', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(288, 369, 6, 462, 83, 3, 71, 1042, 42, NULL, 25, NULL, '1899-12-30 00:46:34', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:20:42', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(289, 370, 6, 465, 83, 3, 71, 1043, 43, NULL, 10, NULL, '1899-12-30 01:02:57', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:37:10', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(290, 371, 6, 436, 83, 3, 71, 1044, 44, NULL, 2, NULL, '1899-12-30 01:56:09', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 16:30:57', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(291, 372, 6, 440, 83, 3, 72, 1045, 45, NULL, 37, 2, '1899-12-30 00:36:21', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:10:55', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(292, 373, 6, 437, 83, 3, NULL, 1046, 46, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-05-30 11:40:46', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(293, 374, 6, 438, 83, 3, 72, 1047, 47, NULL, 18, NULL, '1899-12-30 00:51:00', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:25:26', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(294, 375, 6, 439, 83, 3, 72, 1048, 48, NULL, 11, NULL, '1899-12-30 01:01:56', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:36:22', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(295, 376, 6, 467, 83, 3, 72, 1049, 49, NULL, 16, NULL, '1899-12-30 00:52:40', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:26:44', 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(296, 378, 6, 509, 82, 3, NULL, 1050, 50, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, '2026-05-30 12:59:20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(297, 379, 6, 510, 81, 1, 74, 1051, 51, NULL, 33, 1, '1899-12-30 00:40:22', 0.00, NULL, NULL, NULL, NULL, '2026-05-30 15:14:52', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, '2026-11-25 10:19:30', '2026-11-25 10:19:30');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `seating_tables`
--

CREATE TABLE `seating_tables` (
  `id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `competition_id` int(11) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `seat_count` int(11) DEFAULT NULL,
  `referee_fixed` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `seating_tables`
--

INSERT INTO `seating_tables` (`id`, `access_id`, `competition_id`, `number`, `seat_count`, `referee_fixed`, `created`, `modified`) VALUES
(1, 1, 1, 1, 8, 'John Doe', '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(2, 2, 1, 2, 8, 'Jane Doe', '2026-11-25 09:47:42', '2026-11-25 09:47:42');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `smoke_timer_settings`
--

CREATE TABLE `smoke_timer_settings` (
  `id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `database_id` varchar(255) DEFAULT NULL,
  `db_version` varchar(255) DEFAULT NULL,
  `last_competition_access_id` int(11) DEFAULT NULL,
  `lock_registrations` tinyint(1) NOT NULL DEFAULT 0,
  `use_translation` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `smoke_timer_settings`
--

INSERT INTO `smoke_timer_settings` (`id`, `access_id`, `database_id`, `db_version`, `last_competition_access_id`, `lock_registrations`, `use_translation`, `created`, `modified`) VALUES
(1, 1, '1795520336', '13', 1, 0, 0, '2026-11-25 09:47:42', '2026-11-25 09:47:42');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL,
  `competition_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `order_number` int(11) DEFAULT NULL,
  `is_qualified` tinyint(1) NOT NULL DEFAULT 0,
  `final_rank` int(11) DEFAULT NULL,
  `result_time` datetime DEFAULT NULL,
  `contestant_c1` int(11) DEFAULT NULL,
  `contestant_c2` int(11) DEFAULT NULL,
  `contestant_c3` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `teams`
--

INSERT INTO `teams` (`id`, `access_id`, `competition_id`, `name`, `order_number`, `is_qualified`, `final_rank`, `result_time`, `contestant_c1`, `contestant_c2`, `contestant_c3`, `created`, `modified`) VALUES
(1, 1, 1, 'Nitra Blue', 1, 1, 0, '1899-12-30 00:00:00', NULL, NULL, NULL, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(2, 2, 1, 'Nitra Green', 2, 1, 0, '1899-12-30 00:00:00', NULL, NULL, NULL, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(3, 3, 1, 'Nitra Grey', 3, 0, NULL, NULL, NULL, NULL, NULL, '2026-11-25 09:47:42', '2026-11-25 09:47:42'),
(4, 4, 7, 'Bohém Pipaklub A', 4, 1, 6, '1899-12-30 02:19:54', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(5, 5, 7, 'Bohém Pipaklub B', 5, 1, 8, '1899-12-30 01:50:36', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(6, 6, 7, 'Bohém Pipaklub C', 6, 1, 4, '1899-12-30 02:27:32', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(7, 7, 7, 'Bohém Pipaklub D', 7, 1, 13, '1899-12-30 00:48:18', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(8, 8, 7, 'Aranyfüst Pipaklub A', 8, 1, 2, '1899-12-30 03:15:51', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(9, 9, 7, 'Aranyfüst Pipaklub B', 9, 1, 12, '1899-12-30 01:35:40', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(10, 10, 7, 'Fehér Sólyom Pipaklub', 10, 1, 5, '1899-12-30 02:20:52', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(11, 11, 7, 'Alba Pipaklub', 11, 1, 10, '1899-12-30 01:43:17', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(12, 12, 7, 'Nitra A (White)', 12, 1, 3, '1899-12-30 03:11:02', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(13, 13, 7, 'Nitra B (Blue)', 13, 0, NULL, NULL, NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(14, 14, 7, '424 PC Dombóvár', 14, 1, 1, '1899-12-30 04:39:21', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(15, 29, 2, 'Bohém Pipaklub A', 1, 1, 10, '1899-12-30 02:06:28', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(16, 30, 2, 'Bohém Pipaklub B', 2, 1, 5, '1899-12-30 02:27:11', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(17, 31, 2, 'Bohém Pipaklub C', 3, 1, 7, '1899-12-30 02:24:56', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(18, 33, 2, 'Aranyfüst Pipaklub A', 5, 1, 1, '1899-12-30 05:13:09', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(19, 34, 2, 'Aranyfüst Pipaklub B', 6, 1, 2, '1899-12-30 03:30:58', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(20, 35, 2, 'Aranyfüst Pipaklub C', 7, 1, 11, '1899-12-30 02:03:17', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(21, 36, 2, 'Fehér Sólyom Pipaklub', 8, 1, 9, '1899-12-30 02:14:19', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(22, 37, 2, 'Ibafai Pipaklub', 9, 1, 4, '1899-12-30 02:53:11', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(23, 38, 2, 'Navahók Pipaklub', 10, 1, 3, '1899-12-30 02:57:43', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(24, 39, 2, '424 PC Dombóvár', 11, 1, 12, '1899-12-30 01:59:18', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(25, 40, 2, 'Szentgotthárdi Pipaklub A', 12, 1, 6, '1899-12-30 02:26:15', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(26, 41, 2, 'Szentgotthárdi Pipaklub B', 13, 1, 8, '1899-12-30 02:17:54', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(27, 42, 3, 'Navahók Pipaklub', 1, 1, 5, '1899-12-30 02:31:32', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(28, 43, 3, 'Aranyfüst BPK - A', 2, 1, 1, '1899-12-30 04:07:38', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(29, 44, 3, 'Szentgotthárdi Pipaklub', 3, 1, 6, '1899-12-30 02:25:45', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(30, 45, 3, 'Aranyfüst BPK - B', 4, 1, 3, '1899-12-30 03:45:29', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(31, 46, 3, 'Bohém Pipaklub - A', 5, 1, 8, '1899-12-30 02:15:51', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(32, 47, 3, 'Ibafai Pipaklub', 6, 1, 2, '1899-12-30 03:48:28', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(33, 48, 3, 'Bohém Pipaklub - B', 7, 1, 7, '1899-12-30 02:21:56', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(34, 49, 3, '424 PC Dombóvár', 8, 1, 4, '1899-12-30 02:32:10', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(35, 50, 3, 'Fehér Sólyom Pipaklub', 9, 1, 9, '1899-12-30 01:50:08', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(36, 51, 4, 'Aranyfüst BPK - A', 1, 1, 7, '1899-12-30 03:26:50', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(37, 52, 4, 'Aranyfüst BPK - B', 2, 1, 2, '1899-12-30 04:15:57', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(38, 53, 4, 'Aranyfüst BPK - C', 3, 1, 12, '1899-12-30 02:26:44', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(39, 54, 4, 'Navahók PC', 4, 1, 9, '1899-12-30 02:54:12', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(40, 56, 4, 'Fehér Sólyom', 6, 1, 14, '1899-12-30 01:50:19', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(41, 57, 4, 'Alba Pipaklub', 7, 1, 10, '1899-12-30 02:39:11', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(42, 58, 4, 'Ibafa Pipaklub - A', 8, 1, 3, '1899-12-30 03:51:32', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(43, 59, 4, 'Ibafa Pipaklub - B', 9, 1, 13, '1899-12-30 02:21:29', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(44, 61, 4, 'Szentgotthárdi PC', 11, 1, 6, '1899-12-30 03:41:44', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(45, 62, 4, 'ÖPC', 12, 1, 4, '1899-12-30 03:48:24', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(46, 63, 4, '424 PC', 13, 1, 1, '1899-12-30 06:19:35', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(47, 64, 4, 'Pipe Club Nitra', 14, 1, 8, '1899-12-30 03:22:52', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(48, 66, 4, 'Bohém Pipaklub - A', 16, 1, 5, '1899-12-30 03:48:16', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(49, 67, 4, 'Bohém Pipaklub - B', 17, 1, 11, '1899-12-30 02:36:01', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(50, 68, 5, 'Ibafai Pipaklub 1. csapat', 1, 1, 4, '1899-12-30 03:19:47', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(51, 69, 5, 'Ibafai Pipaklub 2. csapat', 2, 1, 11, '1899-12-30 02:12:30', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(52, 70, 5, 'Ibafai Pipaklub 3. csapat', 3, 1, 12, '1899-12-30 01:35:49', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(53, 71, 5, '424 PC Dombóvár', 4, 1, 1, '1899-12-30 05:51:54', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(54, 72, 5, 'Bohém Pipaklub A', 5, 1, 9, '1899-12-30 02:20:14', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(55, 73, 5, 'Bohém Pipaklub B', 6, 1, 6, '1899-12-30 02:46:52', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(56, 74, 5, 'Szentgotthárdi Pipaklub', 7, 1, 7, '1899-12-30 02:37:05', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(57, 75, 5, 'Alba Pipaklub', 8, 1, 3, '1899-12-30 03:26:07', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(58, 76, 5, 'Fehér Sólyom Pipa Club', 9, 1, 10, '1899-12-30 02:17:22', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(59, 77, 5, 'MPE', 10, 1, 8, '1899-12-30 02:22:51', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(60, 78, 5, 'Aranyfüst BPK - A', 11, 1, 2, '1899-12-30 04:39:18', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(61, 79, 5, 'Aranyfüst BPK - B', 12, 1, 5, '1899-12-30 02:56:27', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(62, 80, 6, 'Ibafai Pipaklub – 1. csapat', 1, 1, 2, '1899-12-30 03:21:07', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(63, 81, 6, 'Ibafai Pipaklub – 2. csapat', 2, 1, 10, '1899-12-30 02:14:53', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(64, 82, 6, '424 Pc. Dombóvár', 3, 1, 5, '1899-12-30 02:48:58', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(65, 83, 6, 'Bohém Pipások Pipaklub A', 4, 1, 11, '1899-12-30 02:09:27', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(66, 84, 6, 'Bohém Pipások Pipaklub B', 5, 1, 12, '1899-12-30 02:02:30', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(67, 85, 6, 'Bohém Pipások Pipaklub C', 6, 1, 3, '1899-12-30 03:15:30', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(68, 86, 6, 'Szentgothárdi Pipaklub', 7, 1, 4, '1899-12-30 03:14:51', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(69, 87, 6, 'Alba Pipaklub', 8, 1, 9, '1899-12-30 02:23:29', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(70, 88, 6, 'Fehér Sólyom Pipa Club', 9, 1, 8, '1899-12-30 02:31:32', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(71, 89, 6, 'ARANYFÜST BPK - A', 10, 1, 1, '1899-12-30 05:34:10', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(72, 90, 6, 'ARANYFÜST BPK - B', 11, 1, 6, '1899-12-30 02:45:36', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(73, 91, 6, 'MPE', 12, 1, 7, '1899-12-30 02:33:36', NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30'),
(74, 92, 6, 'Egyéni', 13, 0, NULL, NULL, NULL, NULL, NULL, '2026-11-25 10:19:30', '2026-11-25 10:19:30');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `cake_migrations`
--
ALTER TABLE `cake_migrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `version_plugin_unique` (`version`,`plugin`);

--
-- A tábla indexei `clubs`
--
ALTER TABLE `clubs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `access_id` (`access_id`),
  ADD KEY `country_id` (`country_id`);

--
-- A tábla indexei `competitions`
--
ALTER TABLE `competitions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `access_id` (`access_id`);

--
-- A tábla indexei `competition_locks`
--
ALTER TABLE `competition_locks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `access_id` (`access_id`),
  ADD KEY `competition_id` (`competition_id`);

--
-- A tábla indexei `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `access_id` (`access_id`);

--
-- A tábla indexei `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `access_id` (`access_id`),
  ADD KEY `club_id` (`club_id`),
  ADD KEY `country_id` (`country_id`);

--
-- A tábla indexei `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `access_id` (`access_id`),
  ADD KEY `competition_id` (`competition_id`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `club_id` (`club_id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `team_id` (`team_id`);

--
-- A tábla indexei `seating_tables`
--
ALTER TABLE `seating_tables`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `access_id` (`access_id`),
  ADD KEY `competition_id` (`competition_id`);

--
-- A tábla indexei `smoke_timer_settings`
--
ALTER TABLE `smoke_timer_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `access_id` (`access_id`);

--
-- A tábla indexei `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `access_id` (`access_id`),
  ADD KEY `competition_id` (`competition_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `cake_migrations`
--
ALTER TABLE `cake_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `clubs`
--
ALTER TABLE `clubs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT a táblához `competitions`
--
ALTER TABLE `competitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `competition_locks`
--
ALTER TABLE `competition_locks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT a táblához `people`
--
ALTER TABLE `people`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=511;

--
-- AUTO_INCREMENT a táblához `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=298;

--
-- AUTO_INCREMENT a táblához `seating_tables`
--
ALTER TABLE `seating_tables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT a táblához `smoke_timer_settings`
--
ALTER TABLE `smoke_timer_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `clubs`
--
ALTER TABLE `clubs`
  ADD CONSTRAINT `clubs_country_id` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Megkötések a táblához `competition_locks`
--
ALTER TABLE `competition_locks`
  ADD CONSTRAINT `competition_locks_competition_id` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Megkötések a táblához `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_club_id` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `people_country_id` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Megkötések a táblához `registrations`
--
ALTER TABLE `registrations`
  ADD CONSTRAINT `registrations_club_id` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `registrations_competition_id` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `registrations_country_id` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `registrations_person_id` FOREIGN KEY (`person_id`) REFERENCES `people` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `registrations_team_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Megkötések a táblához `seating_tables`
--
ALTER TABLE `seating_tables`
  ADD CONSTRAINT `seating_tables_competition_id` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Megkötések a táblához `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_competition_id` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

