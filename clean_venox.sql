-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 01. Jun 2019 um 15:38
-- Server-Version: 10.1.38-MariaDB
-- PHP-Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `test`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `achievementlist`
--

CREATE TABLE `achievementlist` (
  `ID` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `gainXP` int(11) NOT NULL,
  `gainMoney` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `achievementlist`
--

INSERT INTO `achievementlist` (`ID`, `type`, `Name`, `description`, `image`, `gainXP`, `gainMoney`) VALUES
(1, 1, 'Willkommen auf Venox!', 'Registriere dich auf Venox Reallife!', 'login_first_time.png', 100, 100),
(2, 1, 'Willkommen zurueck', 'Logge dich ein.', 'login_first_time.png', 100, 4500),
(3, 1, 'Schon tot ?', 'Sterbe einmal.', 'rip.png', 100, 100),
(4, 1, 'SDM Lohnt sich nicht', 'Toete einen Spieler.', 'ichsehedich.png', 0, 0),
(5, 1, 'Schneller als die DB', 'Kaufe ein Fahrzeug.', 'schnelleralsdb.png', 100, 1000),
(6, 2, 'Neues Team', 'Tritt einer Fraktion bei.', 'faction.png', 100, 100),
(7, 2, 'Erster Erfolg!', 'Werde Leader/Co-Leader in einer Fraktion.', 'faction.png', 1000, 1000),
(8, 1, 'Willkommen im Team.', 'Werd ein Teil des Teams.', 'team.png', 0, 0),
(9, 1, 'Du weisst was gut ist!', 'Erwerbe Premium.', 'team.png', 2000, 14000),
(10, 3, 'Der Projektleiter', 'Klicke auf Solid_Snake.', 'solid_snake.png', 100, 100),
(11, 2, '$ Millionnen Cash $', 'Besitze eine Millionnen $', '1mio.png', 1000, 10000),
(12, 2, 'Bill Gates', 'Besitze 10 Millionen $', 'moneymouth.png', 5000, 50000),
(13, 1, 'Snoop Dog', 'Rauche einmal Gras.', 'weed.png', 100, 100),
(14, 1, 'Venox ist Zu Geil O_o', 'Spiel mehr als 3 Stunden auf VenoX', 'suechtig.png', 500, 2500),
(15, 1, 'Fast & The Furious', 'Kauf ein Tuning Teil fuer dein Auto.', 'tuning.png', 400, 10000),
(16, 1, 'Custom Paintjob', 'Kauf deinen Ersten Custom Paintjob', 'paintjob.png', 300, 4000),
(17, 1, 'Dennis Skrr Pa Pa', 'Folg Layesd_TV Auf Twitch :)', 'layesd.png', 300, 12300),
(18, 1, 'Fortnite Dance', 'Tanze Fortnite Moves', 'fortnitemoves.png', 400, 25000),
(19, 1, 'Durch San Andreas', 'Fahr mit Dennis GTA SA Durch', 'map.png', 100, 44750),
(20, 1, 'Sei ein Pedo', 'Geh in den Wald wie Lorenzo', 'pedo.png', 100, 75604);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `achievements`
--

CREATE TABLE `achievements` (
  `ID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `achievmentID` int(11) NOT NULL,
  `data` varchar(111) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `actions`
--

CREATE TABLE `actions` (
  `ID` int(11) NOT NULL,
  `UID` int(11) DEFAULT NULL,
  `FactionId` int(11) DEFAULT NULL,
  `ActionId` int(11) DEFAULT NULL,
  `Timestamp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `actions`
--

INSERT INTO `actions` (`ID`, `UID`, `FactionId`, `ActionId`, `Timestamp`) VALUES
(134, 1, 2, 1, 1551225680),
(135, 1, 2, 1, 1551302976),
(136, 18, 3, 1, 1551352739),
(137, 1, 2, 1, 1551356991),
(138, 18, 3, 1, 1551357391),
(139, 20, 3, 1, 1551358316),
(140, 1, 2, 1, 1551358785),
(141, 1, 2, 1, 1551367642),
(142, 18, 3, 1, 1551367876),
(143, 1, 2, 1, 1551368430),
(144, 1, 2, 1, 1551370744),
(145, 18, 3, 1, 1551380526),
(146, 42, 9, 1, 1551395346),
(147, 18, 3, 1, 1551395378),
(148, 42, 9, 1, 1551395437);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ban`
--

CREATE TABLE `ban` (
  `UID` int(4) NOT NULL,
  `AdminUID` int(4) NOT NULL,
  `Grund` varchar(50) NOT NULL,
  `Datum` varchar(50) NOT NULL,
  `IP` varchar(50) NOT NULL DEFAULT '0',
  `Serial` varchar(50) NOT NULL,
  `Eintragsdatum` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STime` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `ban`
--

INSERT INTO `ban` (`UID`, `AdminUID`, `Grund`, `Datum`, `IP`, `Serial`, `Eintragsdatum`, `STime`) VALUES
(159, 26, 'Server werbunng + Werben der Teammitglieder', '2.2.2017, 20:13', '0.0.0.0', '7CBBA41A3C655EA35710E0748CC14EA3', '2017-02-02 19:13:52', 121542433),
(74, 2, 'QualitÃ¤tssicherung', '1.3.2019, 21:3', '0.0.0.0', '5C321FE47BEF1C10081A5359729551E4', '2019-03-01 20:03:21', 0),
(446, 77, 'Serverwerbung', '7.5.2017, 22:2', '88.78.29.214', 'B695A49079FA2A7C9B34C4516D3C9B42', '2017-05-07 20:02:46', 0),
(427, 295, 'Mehrfache Serverbeleidigung + Serverwerbung + User', '13.5.2017, 18:27', '95.90.204.128', '8B298DF98090551F2C2C1FC5E79B1F43', '2017-05-13 16:27:17', 0),
(510, 26, 'Serverwerbung', '2.6.2017, 15:24', '37.201.193.117', 'DEF3F3180E9CF8F43C0CC4E742C43593', '2017-06-02 13:24:53', 0),
(393, 26, 'Serverwerbung.', '14.5.2017, 21:24', '0.0.0.0', 'AA646DEBABDB41E26441896F9D8906B2', '2017-05-14 19:24:09', 61724004),
(827, 26, 'Rechte_Abuse', '3.12.2017, 13:54', '91.16.93.13', 'D37D2E867A110B58FF6576224A59E0F3', '2017-12-03 12:54:33', 0),
(64, 2, 'Beleidigung_Server_User_Zorro', '2.3.2019, 13:1', '0.0.0.0', 'C880BA0905F36F1CC07C9EB64BB0A384', '2019-03-02 12:01:38', 0),
(221, 2, 'VerstoÃŸ gegen Â§ 1.2.3 & Â§ 1.2.4', '16.3.2019, 13:21', '0.0.0.0', '66786260795ECF7107C6912E6FDDA553', '2019-03-16 12:21:28', 0),
(25, 2, 'Serverwerbung', '8.3.2019, 17:6', '0.0.0.0', 'CDF832C9A82955F166FB8D3D7773B783', '2019-03-08 16:06:01', 0),
(230, 3, 'Serverwerbung', '10.3.2019, 5:14', '92.206.106.195', '31158C5C52C59ABF9B90D72934F56EE4', '2019-03-10 04:14:19', 0),
(140, 2, 'Serverwerbung', '16.3.2019, 11:17', '0.0.0.0', 'A9C03E03A64A973A9C8B67CCAD0A4E62', '2019-03-16 10:17:45', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `biz`
--

CREATE TABLE `biz` (
  `ID` int(2) NOT NULL,
  `Biz` varchar(50) NOT NULL,
  `UID` int(4) NOT NULL,
  `Kasse` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Preis` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `biz`
--

INSERT INTO `biz` (`ID`, `Biz`, `UID`, `Kasse`, `Name`, `Preis`) VALUES
(1, 'PaynSprayWangcars', 18, 0, 'Pay n Spray WC', 350000),
(2, 'PaynSprayJuniper', 0, 500, 'Pay n Spray', 350000),
(3, 'Sprunk', 0, 540, 'Sprunk Fabrik', 475000),
(4, 'WellStackedPizza', 0, 0, 'Well Stacked Pizza Co.', 12000000),
(5, 'MistysBar', 0, 150, 'Mistys Bar', 350000),
(6, 'Visage', 0, 0, 'Visage Hotel', 10000000),
(7, 'VankHoff', 0, 0, 'Vank Hoff Hotel', 3000000),
(8, 'TankstelleNord', 0, 36, 'Tankstelle North', 200000),
(9, 'TankstelleSued', 28, 8307, 'Tankstelle South', 750000),
(10, 'TankstellePine', 0, 5737, 'Tankstelle Pine', 650000),
(11, 'PaynSprayLV', 0, 100, 'Pay n Spray LV', 500000),
(12, 'PaynSprayLS', 0, 750, 'Pay n Spray LS', 500000),
(13, 'OttoscarsSF', 0, 2686050, 'Otto\'s Cars', 20000000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `blacklist`
--

CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL,
  `UID` int(4) NOT NULL,
  `EintraegerUID` int(4) NOT NULL,
  `Fraktion` int(2) NOT NULL,
  `Grund` text NOT NULL,
  `Eintragungsdatum` int(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `blocks`
--

CREATE TABLE `blocks` (
  `UID` int(4) NOT NULL,
  `Punkte` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bonustable`
--

CREATE TABLE `bonustable` (
  `UID` int(4) NOT NULL,
  `Lungenvolumen` varchar(50) NOT NULL,
  `Muskeln` varchar(50) NOT NULL,
  `Kondition` varchar(50) NOT NULL,
  `Boxen` varchar(50) NOT NULL,
  `KungFu` varchar(50) NOT NULL,
  `Streetfighting` varchar(50) NOT NULL,
  `CurStyle` varchar(50) NOT NULL,
  `PistolenSkill` varchar(50) NOT NULL,
  `DeagleSkill` varchar(50) NOT NULL,
  `ShotgunSkill` varchar(50) NOT NULL,
  `AssaultSkill` varchar(50) NOT NULL,
  `Vortex` varchar(50) NOT NULL DEFAULT 'none',
  `MP5Skills` varchar(50) NOT NULL DEFAULT 'none',
  `Quad` varchar(50) NOT NULL DEFAULT 'none',
  `CarslotUpgrades` varchar(50) NOT NULL DEFAULT 'none',
  `PremiumUntilDay` int(50) NOT NULL DEFAULT '0',
  `PremiumUntilYear` varchar(50) NOT NULL DEFAULT '0',
  `BonusSkin1` varchar(50) NOT NULL DEFAULT 'none',
  `CarslotUpdate2` int(11) NOT NULL DEFAULT '0',
  `CarslotUpdate3` int(11) NOT NULL DEFAULT '0',
  `CarslotUpdate4` int(11) NOT NULL DEFAULT '0',
  `CarslotUpdate5` int(11) NOT NULL DEFAULT '0',
  `Skimmer` int(1) NOT NULL DEFAULT '0',
  `Leichenwagen` int(1) NOT NULL DEFAULT '0',
  `Schach` varchar(1) NOT NULL DEFAULT '0',
  `Caddy` varchar(1) NOT NULL DEFAULT '0',
  `fglass` varchar(3) NOT NULL DEFAULT '0',
  `uzi` varchar(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `bonustable`
--

INSERT INTO `bonustable` (`UID`, `Lungenvolumen`, `Muskeln`, `Kondition`, `Boxen`, `KungFu`, `Streetfighting`, `CurStyle`, `PistolenSkill`, `DeagleSkill`, `ShotgunSkill`, `AssaultSkill`, `Vortex`, `MP5Skills`, `Quad`, `CarslotUpgrades`, `PremiumUntilDay`, `PremiumUntilYear`, `BonusSkin1`, `CarslotUpdate2`, `CarslotUpdate3`, `CarslotUpdate4`, `CarslotUpdate5`, `Skimmer`, `Leichenwagen`, `Schach`, `Caddy`, `fglass`, `uzi`) VALUES
(45, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(44, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(43, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(42, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(41, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(40, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(39, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(38, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(37, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(36, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(35, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(34, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(33, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(32, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(31, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(30, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(29, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(28, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(27, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(26, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(25, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(24, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(23, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(22, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(21, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(20, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(19, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(18, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(17, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(16, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(15, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(14, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(13, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(12, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(11, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(10, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(9, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(8, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(7, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(6, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(5, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(4, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(3, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(1, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(2, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(46, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(47, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(48, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(49, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(50, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(51, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(52, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(53, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(54, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(55, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(56, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(57, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(58, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(59, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(60, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(61, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(62, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(63, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(64, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(65, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(66, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(67, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(68, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(69, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(70, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(71, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(72, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(73, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(74, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(75, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(76, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(77, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(78, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(79, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(80, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(81, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(82, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(83, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(84, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(85, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(86, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(87, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(88, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(89, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(90, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(91, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(92, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(93, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(94, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(95, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(96, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(97, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(98, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(99, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(100, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(101, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(102, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(103, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(104, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(105, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(106, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(107, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(108, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(109, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(110, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(111, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(112, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(113, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(114, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(115, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(116, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(117, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(118, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(119, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(120, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(121, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(122, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(123, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(124, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(125, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(126, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(127, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(128, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(129, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(130, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(131, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(132, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(133, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(134, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(135, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(136, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(137, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(138, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(139, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(140, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(141, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(142, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(143, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(144, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(145, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(146, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(147, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(148, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(149, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(150, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(151, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(152, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(153, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(154, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(155, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(156, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(157, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(158, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(159, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(160, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(161, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(162, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(163, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(164, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(165, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(166, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(167, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(168, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(169, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(170, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(171, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(172, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(173, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(174, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(175, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(176, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(177, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(178, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(179, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(180, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(181, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(182, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(183, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(184, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(185, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(186, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(187, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(188, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(189, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(190, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(191, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(192, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(193, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(194, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(195, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(196, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(197, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(198, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(199, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(200, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(201, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(202, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(203, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(204, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(205, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(206, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(207, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(208, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(209, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(210, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(211, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(212, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(213, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(214, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(215, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(216, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(217, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(218, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(219, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(220, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(221, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(222, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(223, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(224, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(225, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(226, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(227, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(228, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(229, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(230, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(231, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(232, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(233, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(234, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(235, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(236, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(237, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(238, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(239, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(240, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(241, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(242, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(243, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(244, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(245, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(246, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(247, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(248, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(249, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(250, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(251, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(252, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(253, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(254, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(255, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(256, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(257, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(258, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(259, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(260, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(261, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(262, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(263, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(264, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(265, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(266, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(267, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(268, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(269, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(270, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(271, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(272, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(273, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(274, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(275, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(276, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(277, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(278, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(279, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(280, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(281, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(282, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0');
INSERT INTO `bonustable` (`UID`, `Lungenvolumen`, `Muskeln`, `Kondition`, `Boxen`, `KungFu`, `Streetfighting`, `CurStyle`, `PistolenSkill`, `DeagleSkill`, `ShotgunSkill`, `AssaultSkill`, `Vortex`, `MP5Skills`, `Quad`, `CarslotUpgrades`, `PremiumUntilDay`, `PremiumUntilYear`, `BonusSkin1`, `CarslotUpdate2`, `CarslotUpdate3`, `CarslotUpdate4`, `CarslotUpdate5`, `Skimmer`, `Leichenwagen`, `Schach`, `Caddy`, `fglass`, `uzi`) VALUES
(283, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(284, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(285, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(286, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(287, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(288, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(289, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(290, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(291, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(292, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(293, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(294, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(295, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(296, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(297, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(298, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(299, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(300, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(301, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(302, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(303, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(304, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(305, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(306, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(307, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(308, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(309, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(310, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(311, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0'),
(312, 'none', 'none', 'none', 'none', 'none', 'none', '4', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 'none', 0, '0', 'none', 0, 0, 0, 0, 0, 0, '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `booster`
--

CREATE TABLE `booster` (
  `ID` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `date` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `buyit`
--

CREATE TABLE `buyit` (
  `ID` int(50) NOT NULL,
  `Typ` varchar(50) NOT NULL,
  `AnbieterUID` int(4) NOT NULL,
  `HoechstbietenderUID` int(4) NOT NULL,
  `Hoechstgebot` int(50) NOT NULL,
  `LaeuftBis` int(50) NOT NULL,
  `Beschreibung` varchar(200) NOT NULL DEFAULT '',
  `OptischesDatum` varchar(50) NOT NULL,
  `Anzahl` varchar(50) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `carhouses_icons`
--

CREATE TABLE `carhouses_icons` (
  `Name` varchar(50) NOT NULL,
  `ID` int(3) NOT NULL,
  `X` double NOT NULL,
  `Y` double NOT NULL,
  `Z` double NOT NULL,
  `SpawnX` float NOT NULL,
  `SpawnY` float NOT NULL,
  `SpawnZ` float NOT NULL,
  `SpawnRX` float NOT NULL,
  `SpawnRY` float NOT NULL,
  `SpawnRZ` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `carhouses_icons`
--

INSERT INTO `carhouses_icons` (`Name`, `ID`, `X`, `Y`, `Z`, `SpawnX`, `SpawnY`, `SpawnZ`, `SpawnRX`, `SpawnRY`, `SpawnRZ`) VALUES
('San Fierro\nAirport', 1, -1544.4420166016, -440.82772827148, 6, -1224.29, -7.50679, 15.0342, 0, 0, 0),
('Wang Cars', 2, -1966.1179199219, 293.97113037109, 35.46875, -1932.04, 268.793, 41.1455, 0, 0, 180),
('Otto\'s Autos', 3, -1649.9169921875, 1209.8126220703, 7.25, -1637.07, 1208.94, 7.07969, 0, 0, 224),
('Bayside Boats', 4, -2185.0559082031, 2413.1411132813, 5.15625, -2215.62, 2438.35, 0, 0, 0, 314),
('Las Venturas\nAirport', 5, 1714.8116455078, 1616.1896972656, 10.09, 1346.85, 1341.25, 12.3362, 0, 0, 268),
('$HODY USED\nAUTOS', 6, 1689.0015869141, 1850.7039794922, 11.219537734985, 1692.42, 1865.62, 10.7203, 0, 0, 270),
('Auto Bahn', 7, 2200.86, 1394.32, 10.9, 2200.93, 1386.6, 10.55, 0, 0, 90),
('Bonusfahrzeuge\n( See )', 8, -911.11560058594, 2686.1909179688, 42.817291259766, -962.246, 2671.21, 40.3628, 0, 0, 135),
('Bonusfahrzeuge\n( Land )', 9, -902.84930419922, 2681.6420898438, 42.734336853027, -898.47, 2715.61, 45.9974, 0, 0, 97),
('Auto Bahn', 10, 1948.6752929688, 2068.84, 11.466958999634, 1940.2, 2068.54, 10.8203, 0, 0, 0),
('Kleinstadt-\\nhaendler', 11, -2088.97, -2262.41, 30.32, -2088.42, -2267.6, 30.5, 0, 0, 45);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `carhouses_vehicles`
--

CREATE TABLE `carhouses_vehicles` (
  `AutohausID` int(50) NOT NULL,
  `X` double NOT NULL,
  `Y` double NOT NULL,
  `Z` double NOT NULL,
  `RX` double NOT NULL,
  `RY` double NOT NULL,
  `RZ` double NOT NULL,
  `Preis` int(11) NOT NULL,
  `Typ` int(50) NOT NULL,
  `Info` varchar(50) NOT NULL,
  `Comment` varchar(999) NOT NULL DEFAULT '',
  `ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `carhouses_vehicles`
--

INSERT INTO `carhouses_vehicles` (`AutohausID`, `X`, `Y`, `Z`, `RX`, `RY`, `RZ`, `Preis`, `Typ`, `Info`, `Comment`, `ID`) VALUES
(1, -1188.5283203125, 32.646484375, 15.034187316895, 0, 0, 0, 129000, 568, 'Helikoper mit\n2 Sitzplaetzen', 'Raindance', 1),
(1, -1187.7210693359, 15.780174255371, 14.24843788147, 0, 0, 16, 31900, 469, 'Helikoper mit\n2 Sitzplaetzen', 'Sparrow', 2),
(1, -1175.3992919922, 29.118057250977, 14.413437843323, 0, 0, 50, 74900, 487, 'Helikoper mit\n4 Sitzplaetzen', 'Maverick', 3),
(2, -1949.3812255859, 263.57504272461, 40.867080688477, 0, 0, 68, 12900, 507, 'Viertuerer', 'Elegant', 4),
(2, -1948.7930908203, 272.47186279297, 41.003414154053, 0, 0, 106, 3150, 467, 'GutesFahrzeugFuerDenAnfang', 'Oceanic', 5),
(2, -1956.0469970703, 291.77319335938, 40.877082824707, 0, 0, 130, 11500, 474, 'OldschoolAuto', 'Hermes#KeepItOldSchool', 6),
(2, -1959.2907714844, 258.83361816406, 35.168510437012, 0, 0, 18, 1800, 581, 'Motorrad', 'BF-400', 7),
(2, -1949.6003417969, 261.25247192383, 35.330226898193, 0, 0, 26, 1000, 550, 'BilligFahrzeug fuer den Anfang', 'Sunrise', 8),
(2, -1948.7517089844, 270.49761962891, 35.423927307129, 0, 0, 112, 14500, 412, 'Viertuerer', 'Vodoo', 9),
(2, -1956.056640625, 296.3076171875, 35.567386627197, 0, 0, 132, 85000, 475, 'Muscle car', 'ZR-350', 10),
(3, -1660.5234375, 1213.8901367188, 6.9103775024414, 0, 0, 326, 275000, 411, 'Sportwagen', 'Infernus', 11),
(3, -1654.2049560547, 1213.8233642578, 13.371874809265, 0, 0, 14, 47900, 541, 'Sportwagen', 'Bullet', 12),
(3, -1660.8762207031, 1216.0104980469, 13.463988304138, 0, 0, 332, 350000, 451, 'Schnelles Auto', 'Turismo\r\n', 13),
(3, -1673.5727539063, 1206.7923583984, 21.005771636963, 0, 0, 248, 48900, 415, 'Sportwagen', 'Cheetah', 14),
(3, -1657, 1211, 7.04, 0, 0, 318, 84900, 522, 'Motorrad', 'NRG-500', 15),
(3, -1650.2810058594, 1208.2152099609, 20.898662567139, 0, 0, 10.25, 54900, 559, 'Sportcabrio', 'Jester', 16),
(3, -1663.4768066406, 1219.8461914063, 20.966249465942, 0, 0, 250, 39500, 587, 'Sportwagen', 'Euros', 17),
(4, -2213.1484375, 2411.6689453125, 0, 0, 0, 42, 179900, 484, 'Segelyacht\n( Mit Koje )', 'Marquis', 18),
(4, -2223.1516113281, 2400.8994140625, 0, 0, 0, 46, 129900, 454, 'Motoryacht\n( Mit Koje )', 'Tropic', 19),
(4, -2231.357421875, 2390.7587890625, 0, 0, 0, 44, 27900, 446, 'Speedboot', 'Squalo', 20),
(4, -2258.015691406, 2419.2734375, 0, 0, 0, 224, 19900, 452, 'Speedboot', 'Speeder', 21),
(4, -2249.8605957031, 2423.9106445313, 0, 0, 0, 224, 7900, 473, 'Schlauchboot', 'Dinghy', 22),
(4, -2239.6242675781, 2440.6728515625, 0, 0, 0, 226, 42500, 493, 'Speedboot', 'Jetmax', 23),
(5, 1296.4821777344, 1324.9904785156, 11.370494842529, 0, 0, 270, 32500, 593, 'Propeller-\nmaschiene\n(2 Sitzplaetze)', 'Dodo', 24),
(5, 1295.6755371094, 1361.3303222656, 12.271298408508, 12, 0, 270, 54900, 553, 'Alte Propeller-\nmaschiene', 'Nevada', 25),
(5, 1291.8493652344, 1389.7900390625, 11.820384979248, 0, 0, 270, 149900, 519, 'Privatjet', 'Shamal', 26),
(5, 1296.9296875, 1340.884765625, 11.605069160461, 0, 0, 270, 34900, 513, 'Stuntflugzeug', 'Stuntplane', 27),
(5, 1350.5347900391, 1281.189453125, 12.336210250854, 0, 0, 0, 24900, 511, 'Propellerflug-\nzeug ( 2 Sitze )', 'Beagle', 28),
(6, 1728.9261474609, 2019.6724853516, 10.690312385559, 0, 0, 90, 17950, 467, 'Viertuerer', 'Oceanic', 29),
(6, 1728.9013671875, 2009.2183837891, 10.82, 0, 0, 90, 74950, 603, 'Muscle-Car', 'Phoenix', 30),
(6, 1728.9013671875, 2003, 10.72, 0, 0, 90, 21000, 475, 'Muscle-Car', 'Sabre', 31),
(6, 1728.2746582031, 1991.4293212891, 10.96, 0, 0, 90, 84000, 434, 'Hotrod', 'Hotknife', 32),
(6, 1729, 1985.2177734375, 10.75, 0, 0, 90, 49000, 419, 'Lowrider', 'Esperanto', 33),
(6, 1729.08, 1979.41, 10.667, 0, 0, 90, 26000, 424, 'Strandbuggy', 'BF Injection', 34),
(6, 1742.11, 2019.2, 10.49, 0, 0, 0, 490, 462, 'Roller', 'Faggio', 35),
(6, 1744.46, 2013.42, 10.77, 0, 0, 90, 15000, 412, 'Lowrider', 'Voodoo', 36),
(6, 1744, 2006.88, 10.57, 0, 0, 90, 35000, 559, 'Sportcabrio', 'Jester', 37),
(6, 1745.725, 1993.88, 10.6, 0, 0, 90, 54500, 555, 'Cabrio', 'Windsor', 38),
(6, 1746.39, 1985.35, 11.18, 0, 0, 90, 28750, 489, 'Jeep', 'Rancher', 39),
(7, 2148.72, 1397.41, 10.75, 0, 0, 0, 47800, 402, 'Sportwagen', 'Buffalo', 40),
(6, 1745.65, 1972.61, 10.51, 0, 0, 90, 34500, 565, 'Zweituerer', 'Flash', 41),
(7, 2142.47, 1395.71, 10.75, 0, 0, 0, 89500, 409, 'Limousine', 'Stretch', 42),
(7, 2139.501953125, 1396.9553222656, 10.76, 0, 0, 0, 19500, 545, 'Muscle-Car', 'Hustler', 43),
(7, 2132.72, 1396.93, 10.79, 0, 0, 0, 24500, 568, 'Buggy', 'Bandito', 44),
(7, 2126.37, 1397.1, 10.73, 0, 0, 0, 45000, 561, 'SUV', 'Stratum', 45),
(7, 2120.1, 1397.43, 10.61, 0, 0, 0, 43000, 560, 'Viertuerer', 'Sultan', 46),
(7, 2123.05, 1397.17, 10.65, 0, 0, 0, 24950, 535, 'Lowrider', 'Slamvan', 47),
(7, 2113.57, 1397.91, 10.58, 0, 0, 0, 17800, 468, 'Cross\nMotorad', 'Sanchez', 48),
(7, 2148.62, 1409.58, 10.74, 0, 0, 180, 27850, 550, 'Vierteurer', 'Sunrise', 49),
(7, 2139.1, 1410.19, 10.53, 0, 0, 180, 19500, 589, 'Zweituerer', 'Club', 50),
(7, 2132.6291503906, 1409.98, 10.67, 0, 0, 180, 29800, 536, 'Lowrider-\nCabrio', 'Blade', 51),
(7, 2129.5183105, 1411.01, 10.72, 0, 0, 180, 12500, 479, 'SUV', 'Regina', 52),
(8, -942.18560791016, 2648.8591308594, 42.386817932129, 0, 0, 135, 74500, 460, 'Wasserflug-\nzeug', 'Skimmer', 53),
(8, -912.12268066406, 2695.1982421875, 42.017189025879, 0, 0, 135, 45000, 539, 'Hovercraft', 'Vortex', 54),
(9, -887.50402832031, 2697.2333984375, 41.945262908936, 0, 0, 315, 24500, 471, 'Quad', 'Quadbike', 55),
(9, -893.67626953125, 2700.0336914063, 42.320129394531, 0, 0, 315, 39500, 442, 'Leichen-\nwagen', 'Romero', 56),
(9, -902.78149414063, 2699.6669921875, 42.096534729004, 0, 0, 0, 23500, 457, 'Golf-\nwagen', 'Caddy', 57),
(10, 1994.6566162109, 2059.0798339844, 10.62031269, 0, 0, 0, 37500, 533, 'Cabrio', 'Feltzer', 58),
(10, 1991.0211181641, 2058.85, 10.57, 0, 0, 0, 64780, 562, 'Sportwagen', 'Elegy', 59),
(10, 1987.41, 2058.85, 10.72, 0, 0, 0, 24000, 491, 'Zweituerer', 'Virgo', 60),
(10, 1983.7, 2058.7, 10.79, 0, 0, 0, 32700, 567, 'Lowrider', 'Savanna', 61),
(10, 1979.65, 2058.69, 10.52, 0, 0, 0, 80000, 541, 'Sportwagen', 'Bullet', 62),
(10, 1994.71, 2035.77, 10.8, 0, 0, 180, 34500, 445, 'Viertuerer', 'Admiral', 63),
(10, 1990.63, 2035.77, 10.94, 0, 0, 180, 47500, 400, 'Jeep', 'Landstalker', 64),
(10, 1986.39, 2036.29, 10.68, 0, 0, 180, 24000, 401, 'Zweituerer', 'Bravura', 65),
(10, 1982.29, 2035.91, 10.51, 0, 0, 180, 65000, 558, 'Sportwagen', 'Uranus', 66),
(11, -2089.78, -2242.6, 30.82, 359, 359, 45, 11950, 543, 'Pickup', 'Sadler', 67),
(11, -2098.32, -2255, 30.7, 0, 0, 0, 9500, 478, 'Pickup', 'Walton', 68),
(11, -2112.39, -2241.16, 30.4, 0, 0, 0, 19500, 518, 'Zweitruerer', 'Buccaneer', 69),
(11, -2099.4, -2225.87, 30.46, 0, 0, 45, 2900, 542, 'Zweitruerer', 'Clover', 70);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cars_ai`
--

CREATE TABLE `cars_ai` (
  `ID` int(11) NOT NULL,
  `Model` int(11) NOT NULL,
  `Preis` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `cars_ai`
--

INSERT INTO `cars_ai` (`ID`, `Model`, `Preis`, `Name`) VALUES
(1, 496, 28000, 'Blista Compact'),
(2, 580, 175000, 'Stafford'),
(3, 534, 54500, 'Remington'),
(4, 480, 95000, 'Comet'),
(5, 451, 349500, 'Turismo'),
(6, 558, 124500, 'Uranus'),
(7, 477, 200000, 'ZR-350'),
(8, 521, 79500, 'FCR-900'),
(9, 507, 50000, 'Elegant'),
(10, 531, 149500, 'Tractor'),
(11, 483, 175000, 'Camper');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cars_peds_ai`
--

CREATE TABLE `cars_peds_ai` (
  `ID` int(11) NOT NULL,
  `VehX` float NOT NULL,
  `VehY` float NOT NULL,
  `VehZ` float NOT NULL,
  `VehRX` float NOT NULL,
  `VehRY` float NOT NULL,
  `VehRZ` float NOT NULL,
  `PedX` float NOT NULL,
  `PedY` float NOT NULL,
  `PedZ` float NOT NULL,
  `PedR` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `cars_peds_ai`
--

INSERT INTO `cars_peds_ai` (`ID`, `VehX`, `VehY`, `VehZ`, `VehRX`, `VehRY`, `VehRZ`, `PedX`, `PedY`, `PedZ`, `PedR`) VALUES
(1, -2099.44, -9.94, 35.32, 0, 0, 260, -2099.93, -11.63, 34.32, 190),
(2, -2693.58, 1228.74, 55.56, 0, 0, 0, -2691.69, 1227.19, 54.56, 220),
(3, -2804.4, -252.72, 7.17, 0, 0, 0, -2805.06, -249.59, 6.03, 0),
(4, -1446.24, 920.05, 7.18, 0, 0, 0, -1444.79, 919.6, 6.18, 270),
(5, -1959.31, 1227.51, 31.64, 0, 0, 18, -1958.05, 1227.93, 30.64, 285),
(6, -2706.82, 1304.78, 7.04, 0, 0, 190, -2705.09, 1304.53, 6.05, 240);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `coins`
--

CREATE TABLE `coins` (
  `Name` varchar(255) NOT NULL,
  `Coins` int(15) NOT NULL,
  `txn` text NOT NULL,
  `psc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `email`
--

CREATE TABLE `email` (
  `EmpfaengerUID` int(4) NOT NULL,
  `Text` varchar(500) NOT NULL,
  `Yearday` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `fraktionen`
--

CREATE TABLE `fraktionen` (
  `Name` varchar(50) NOT NULL,
  `ID` int(2) NOT NULL,
  `FKasse` varchar(50) NOT NULL,
  `DepotGeld` varchar(50) NOT NULL DEFAULT '0',
  `DepotDrogen` varchar(50) NOT NULL DEFAULT '0',
  `DepotMaterials` varchar(50) NOT NULL DEFAULT '0',
  `DepotKoks` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `fraktionen`
--

INSERT INTO `fraktionen` (`Name`, `ID`, `FKasse`, `DepotGeld`, `DepotDrogen`, `DepotMaterials`, `DepotKoks`) VALUES
('SFPD', 1, '0', '13727', '3066', '632', '938'),
('Mafia', 2, '0', '151050', '131', '17', '49'),
('Triaden', 3, '0', '0', '0', '21711', '0'),
('Terroristen', 4, '0', '0', '0', '0', '0'),
('Reporter', 5, '0', '50', '0', '0', '0'),
('FBI', 6, '0', '10000', '100', '2000', '100'),
('Aztecas', 7, '0', '4780', '4635', '19040', '100'),
('Biker', 9, '0', '30266', '0', '40', '0'),
('MechMedic', 10, '0', '0', '0', '0', '0'),
('Ballas', 12, '0', '474', '300', '12190', '0'),
('Grove', 13, '0', '264235', '2615', '34440', '0'),
('IMafia', 14, '0', '97862', '1672', '46982', '0');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gangs`
--

CREATE TABLE `gangs` (
  `ID` int(2) NOT NULL,
  `X1` varchar(50) NOT NULL,
  `Y1` varchar(50) NOT NULL,
  `X2` varchar(50) NOT NULL,
  `Y2` varchar(50) NOT NULL,
  `X3` varchar(50) NOT NULL,
  `Y3` varchar(50) NOT NULL,
  `Z3` varchar(50) NOT NULL,
  `BesitzerFraktion` int(2) NOT NULL,
  `Einnahmen` int(5) NOT NULL COMMENT 'Geld',
  `Name` text NOT NULL,
  `Aktiviert` int(1) NOT NULL DEFAULT '1' COMMENT 'Ob es Ingame aktiviert oder deaktiviert ist'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `gangs`
--

INSERT INTO `gangs` (`ID`, `X1`, `Y1`, `X2`, `Y2`, `X3`, `Y3`, `Z3`, `BesitzerFraktion`, `Einnahmen`, `Name`, `Aktiviert`) VALUES
(1, '-2758.99', '1310.52', '-2573.75', '1528.54', '-2631.68', '1357.41', '6.75', 13, 10, 'Jizzys', 0),
(2, '743.70001220703', '-1684.5', '862.59997558594', '-1574.4000244141', '786.09997558594', '-1632.4000244141', '13.39999961853', 3, 8, 'Burgershot LS', 1),
(3, '-2201.72', '-280.57', '-2096.76', '-80.93', '-2136.24', '-181.63', '34.96', 3, 1, 'Drogenlabor', 1),
(4, '-2215.40', '-950.06', '-2025', '-700', '-2115.4033203125', '-893.06', '31.67', 13, 70, 'SF Uni', 1),
(5, '-2811.12', '-413.97', '-2634.36', '-261.18', '-2719.86', '-317.43', '7.5', 7, 8, 'Tennisplatz', 1),
(6, '-2293.56', '2226.63', '-2237.42', '2473.87', '-2261.91', '2317.41', '4.46', 7, 4, 'Bayside', 1),
(7, '-87.404563903809', '2420.3674316406', '458.44122314453', '2575.6437988281', '317.39999389648', '2437.6999511719', '16.5', 14, 7, 'Flugzeugfriedhof', 1),
(8, '2558.8000488281', '2242.6999511719', '2677.3000488281', '2474.5', '2606', '2302.8999023438', '10.800000190735', 9, 10, 'Rock Hotel', 1),
(9, '2777.1000976563', '833.29998779297', '2895.1000976563', '1023.299987793', '2862.1999511719', '919.09997558594', '10.800000190735', 9, 9, 'Linden Side', 1),
(10, '111.78970', '1336.29541', '287.11746', '1484.41968', '191.09195', '1434.08276', '10.58594', 9, 4, 'Raffinerie', 1),
(11, '974.55304', '948.50726', '1177.29517', '1166.17798', '1087.21240', '1074.30579', '10.83816', 14, 6, 'LV Uni', 1),
(12, '1577.68152', '943.66669', '1756.69226', '1122.69128', '1667.1455078125', '1013.2158203125', '10.8203125', 13, 5, 'Depot', 1),
(13, '1300.3671875', '2102.9736328125', '1397.1962890625', '2198.951171875', '1358.8984375', '2160.513671875', '11.015625', 14, 4, 'Baseballstadion', 1),
(14, '-624.1655273438', '-564.07165527344', '-467.08432006836', '-467.08432006836', '-485.64794921875', '-505.75033569336', '25.517845153809', 13, 4, 'SF Lagerhalle', 1),
(15, '2437.3999023438', '1083.1999511719', '2597.3999023438', '1183.3000488281', '2527.3999023438', '1137.0999755859', '10.699999809265', 7, 9, 'Streets', 0),
(16, '-593.20001220703', '-200.19999694824', '-422.29998779297', '-31.700000762939', '-511.39999389648', '-85.300003051758', '62.200000762939', 14, 10, 'Holzfaeller', 1),
(17, '1860.7937011719', '-1452.2199707031', '1979.2247314453', '-1350.2930908203', '1918.2982177734', '-1400.6328125', '13.5703125', 7, 5, 'Skaterpark', 1),
(18, '807.40002441406', '-1130.0999755859', '952.59997558594', '-1055.5999755859', '862.70001220703', '-1101.9000244141', '24.299999237061', 14, 10, 'Friedhof', 1),
(19, '2371.8000488281', '1783.1999511719', '2497.3999023438', '1963.1999511719', '2420.3000488281', '1925.6999511719', '6', 14, 6, 'Baustelle', 1),
(20, '2497.1999511719', '2617.1000976563', '2749.1999511719', '2857.6000976563', '2554.8999023438', '2753.3000488281', '10.800000190735', 13, 7, 'Pissgebiet', 1),
(21, '2127.1000976563', '-2345', '2267.8000488281', '-2218.8999023438', '2167.1000976563', '-2274.3999023438', '13.39999961853', 9, 60, 'LS Lagerhalle', 1),
(22, '-2361.49', '-183.31', '-2269.87', '-80.65', '-2308.15', '-123.21', '34.96', 13, 2, 'Burgershot SF', 0),
(23, '-2201.72', '-280.57', '-2096.76', '-80.93', '-2136.24', '-181.63', '34.96', 14, 3, 'Fabrik SF', 0),
(24, '1858.28', '1473.03', '2010.69', '1691', '1908.77', '1518.43', '13.62', 7, 50, 'Piratenschiff', 1),
(25, '-1340.56787', '2464.59717', '-1261.05640', '2564.95508', '-1302.33545', '2512.67139', '87.04205', 13, 5, 'Ruine', 0),
(26, '1046.3127441406', '-1704.1940917969', '1142.6439208984', '-1578.559623828', '1071.7454833984', '-1619.3309326172', '20.458673477173', 3, 4, 'Verona Center', 0),
(27, '-462.16015625', '2169.0122070313', '-339.23330688477', '2290.5751953125', '-404.68014526367', '2233.251953125', '42.4296875', 3, 10, 'Ghosttown', 0),
(28, '1277', '903.09997558594', '1497.4000244141', '1183.5999755859', '1398.4000244141', '1097.1999511719', '10.800000190735', 7, 50, 'LV Lagerhalle', 1),
(29, '1358.9000244141', '-2368.8000488281', '1833.9000244141', '-2204.5', '1682.8000488281', '-2285.1000976563', '13.5', 9, 6, 'LS Airport', 1),
(30, '1856.9000244141', '-1255.8000488281', '2061.8000488281', '-1141', '1969.5999755859', '-1187.5999755859', '25.8', 13, 7, 'Glen Park', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gang_basic`
--

CREATE TABLE `gang_basic` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL DEFAULT 'Gang',
  `LeaderMSG` varchar(50) NOT NULL DEFAULT '',
  `Waffe` int(2) NOT NULL DEFAULT '0',
  `Skin` int(3) NOT NULL DEFAULT '7',
  `HausID` int(4) NOT NULL DEFAULT '0',
  `Rang1` varchar(50) NOT NULL DEFAULT 'Anfaenger',
  `Rang2` varchar(50) NOT NULL DEFAULT 'Mitglied',
  `Rang3` varchar(50) NOT NULL DEFAULT 'Anfuehrer',
  `MaxMembers` int(4) NOT NULL DEFAULT '8',
  `Drugs` int(10) NOT NULL DEFAULT '0',
  `Mats` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gang_members`
--

CREATE TABLE `gang_members` (
  `UID` int(4) NOT NULL,
  `Gang` int(4) NOT NULL DEFAULT '0',
  `Rang` int(2) NOT NULL DEFAULT '1',
  `Founder` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `gang_vehicles`
--

CREATE TABLE `gang_vehicles` (
  `ID` int(11) NOT NULL,
  `GangID` int(4) NOT NULL,
  `Typ` int(3) NOT NULL DEFAULT '500',
  `Tuning` varchar(50) NOT NULL DEFAULT '|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|',
  `Spawnpos_X` double NOT NULL DEFAULT '0',
  `Spawnpos_Y` double NOT NULL DEFAULT '0',
  `Spawnpos_Z` double NOT NULL DEFAULT '0',
  `Spawnrot_X` double NOT NULL DEFAULT '0',
  `Spawnrot_Y` double NOT NULL DEFAULT '0',
  `Spawnrot_Z` double NOT NULL DEFAULT '0',
  `Farbe` varchar(50) NOT NULL DEFAULT '|0|0|0|0|',
  `Paintjob` int(4) NOT NULL DEFAULT '3',
  `Lights` varchar(13) NOT NULL DEFAULT '|255|255|255|'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `houses`
--

CREATE TABLE `houses` (
  `ID` int(11) NOT NULL,
  `SymbolX` double NOT NULL,
  `SymbolY` double NOT NULL,
  `SymbolZ` double NOT NULL,
  `UID` int(4) NOT NULL,
  `Preis` int(11) NOT NULL,
  `CurrentInterior` int(11) NOT NULL,
  `Kasse` int(11) NOT NULL,
  `Miete` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `houses`
--

INSERT INTO `houses` (`ID`, `SymbolX`, `SymbolY`, `SymbolZ`, `UID`, `Preis`, `CurrentInterior`, `Kasse`, `Miete`) VALUES
(479, -2118.884277, -5.635938, 35.715626, 185, 47500, 31, 0, 0),
(478, -2120.573975, -30.657618, 35.934376, 221, 47500, 31, 0, 1000),
(477, -1427.047852, -944.501953, 201.09375, 3, 20000, 31, 0, 0),
(476, -2641.089844, 935.720703, 71.953125, 198, 75000, 9, 0, 0),
(475, -2064.569336, 242.541016, 35.188751, 1, 50000, 3, 500, 500),
(474, 189.637695, -1308.211914, 70.249336, 9, 150000, 13, 0, 500),
(473, -2203.235352, 1043.432617, 80.013062, 44, 50000, 5, 0, 0),
(472, -2027.808594, -40.605469, 38.804688, 34, 50000, 6, 0, 0),
(471, -2573.008789, 1154.602539, 55.733822, 0, 150000, 15, 0, 0),
(470, -2563.102539, 1149.106445, 55.726562, 0, 50000, 6, 0, 0),
(469, -2549.047852, 1145.725586, 55.726562, 0, 50000, 11, 0, 0),
(468, -2534.321289, 1143.746094, 55.726562, 0, 50000, 8, 0, 0),
(467, -2523.875977, 1142.691406, 55.726562, 0, 150000, 14, 0, 0),
(466, -2516.913086, 1142.400391, 55.726562, 0, 150000, 15, 0, 0),
(465, -2506.49707, 1142.136719, 55.726562, 25, 50000, 7, 500, 0),
(464, -2493.305664, 1141.967773, 55.726562, 0, 75000, 9, 0, 0),
(463, -2478.854492, 1141.848633, 55.726562, 0, 50000, 7, 0, 0),
(462, -2468.569336, 1141.914062, 55.733269, 0, 150000, 15, 0, 0),
(461, -2461.550781, 1141.896484, 55.726562, 0, 150000, 14, 0, 0),
(460, -2451.104492, 1141.762695, 55.733276, 0, 150000, 10, 0, 0),
(459, -2438.28125, 1141.013672, 55.726562, 0, 75000, 9, 0, 0),
(458, -2423.802734, 1139.404297, 55.726562, 0, 50000, 7, 0, 0),
(457, 1259.637695, -785.40918, 92.03125, 5, 150000, 15, 0, 0),
(456, -2413.657227, 1137.53418, 55.726562, 0, 75000, 9, 0, 0),
(455, -2406.835938, 1135.830078, 55.726562, 0, 50000, 5, 0, 0),
(454, -2369.564453, 1122.383789, 55.733276, 0, 75000, 6, 0, 0),
(453, -2396.535156, 1132.703125, 55.733276, 0, 75000, 11, 0, 0),
(452, -2383.787109, 1128.141602, 55.726562, 0, 75000, 9, 0, 0),
(451, -2358.885742, 1118.072266, 55.726562, 0, 50000, 4, 0, 0),
(450, -2140.029297, 1190.381836, 55.726562, 0, 75000, 8, 0, 0),
(449, -1813.214844, -135.349609, 6.123383, 0, 50000, 3, 0, 0),
(448, -2047.930664, 242.740234, 35.188751, 0, 150000, 14, 0, 0),
(447, -2033.469727, 240.397461, 35.188751, 249, 150000, 15, 0, 0),
(446, -2033.447266, 231.860352, 35.188751, 0, 150000, 10, 0, 0),
(445, -2033.463867, 218.151367, 35.188751, 0, 150000, 13, 0, 0),
(444, -2019.885742, 266.03125, 35.188751, 23, 150000, 15, 0, 0),
(443, -2033.543945, 209.524414, 35.188751, 40, 150000, 15, 30000, 1000),
(442, -2050.756836, 267.961914, 35.188751, 226, 75000, 11, 500, 0),
(441, -2050.652344, 217.983398, 35.188751, 0, 150000, 14, 0, 0),
(440, -2050.760742, 276.517578, 35.188751, 0, 75000, 11, 0, 0),
(439, -2050.558594, 209.374023, 35.188751, 41, 150000, 10, 100, 100),
(438, -2036.271484, 265.525391, 35.188751, 210, 150000, 10, 0, 49),
(437, -2033.449219, 289.859375, 35.186749, 156, 75000, 9, 0, 0),
(436, -2033.443359, 298.435547, 35.186749, 140, 75000, 9, 0, 0),
(435, -2050.746094, 289.822266, 35.186749, 0, 75000, 8, 0, 0),
(434, -2050.760742, 298.206055, 35.186749, 168, 50000, 6, 0, 0),
(433, -2083.544922, 289.601562, 35.186749, 252, 50000, 1, 0, 0),
(432, -2083.545898, 298.519531, 35.186749, 201, 50000, 3, 0, 0),
(431, -2100.365234, 298.483398, 35.186749, 118, 50000, 1, 0, 0),
(430, -2100.861328, 289.817383, 35.186749, 0, 50000, 3, 0, 0),
(429, -2100.861328, 276.413086, 35.188751, 0, 50000, 1, 0, 0),
(428, -2100.861328, 267.919922, 35.188751, 35, 50000, 3, 0, 0),
(427, -2069.826172, 266.03125, 35.188751, 211, 75000, 6, 0, 100),
(426, -2086.37207, 265.513672, 35.188751, 47, 75000, 6, 0, 0),
(425, -2083.541016, 240.452148, 35.188751, 143, 50000, 1, 0, 0),
(424, -2100.860352, 240.532227, 35.188751, 216, 50000, 1, 0, 0),
(423, -2083.543945, 231.860352, 35.188751, 0, 50000, 3, 0, 0),
(422, -2100.861328, 231.844727, 35.188751, 37, 50000, 1, 0, 0),
(421, -2083.540039, 218.037109, 35.188751, 0, 50000, 3, 0, 0),
(420, -2083.541016, 209.405273, 35.188751, 81, 50000, 1, 0, 0),
(419, -2100.859375, 218.050781, 35.318317, 0, 50000, 1, 0, 0),
(418, -2100.805664, 209.424805, 35.290657, 94, 50000, 3, 3000, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `idcounter`
--

CREATE TABLE `idcounter` (
  `id` int(50) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `idcounter`
--

INSERT INTO `idcounter` (`id`) VALUES
(313);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `inventar`
--

CREATE TABLE `inventar` (
  `UID` int(4) NOT NULL,
  `Wuerfel` tinyint(1) NOT NULL DEFAULT '0',
  `Blumensamen` int(11) NOT NULL DEFAULT '0',
  `Lottoschein` varchar(50) NOT NULL DEFAULT '0|0|0|0|0|0',
  `Essensslot1` int(2) NOT NULL DEFAULT '0',
  `Essensslot2` int(2) NOT NULL DEFAULT '0',
  `Essensslot3` int(2) NOT NULL DEFAULT '0',
  `Waffenslot1` varchar(50) NOT NULL DEFAULT '0|0',
  `Waffenslot2` varchar(50) NOT NULL DEFAULT '0|0',
  `Waffenslot3` varchar(50) NOT NULL DEFAULT '0|0',
  `Zigaretten` int(5) NOT NULL DEFAULT '0',
  `Materials` int(10) NOT NULL DEFAULT '0',
  `Benzinkanister` int(10) NOT NULL DEFAULT '0',
  `FruitNotebook` tinyint(1) NOT NULL DEFAULT '1',
  `Gameboy` int(1) NOT NULL DEFAULT '0',
  `Objekt` int(10) NOT NULL DEFAULT '0',
  `Chips` int(50) NOT NULL DEFAULT '0',
  `Geschenke` int(50) NOT NULL DEFAULT '0',
  `fishing` varchar(39) NOT NULL DEFAULT '0|0|0|0;0|0;0|0;0',
  `fglass` tinyint(1) NOT NULL DEFAULT '0',
  `Medikit` int(10) NOT NULL DEFAULT '0',
  `Spezial` text NOT NULL,
  `Repairkit` int(10) DEFAULT '0',
  `Koks` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `kleidungsteile`
--

CREATE TABLE `kleidungsteile` (
  `UID` int(4) NOT NULL,
  `Benutzt` varchar(100) NOT NULL DEFAULT '-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|-|',
  `Type0` varchar(70) NOT NULL DEFAULT '00000000000000000000000000000000000000000000000000000000000000000000',
  `Type1` varchar(40) NOT NULL DEFAULT '000000000000000000000000000000000',
  `Type2` varchar(50) NOT NULL DEFAULT '000000000000000000000000000000000000000000000',
  `Type3` varchar(40) NOT NULL DEFAULT '00000000000000000000000000000000000000',
  `Type4` varchar(5) NOT NULL DEFAULT '000',
  `Type5` varchar(5) NOT NULL DEFAULT '0000',
  `Type6` varchar(5) NOT NULL DEFAULT '0000',
  `Type7` varchar(5) NOT NULL DEFAULT '0000',
  `Type8` varchar(10) NOT NULL DEFAULT '0000000',
  `Type9` varchar(10) NOT NULL DEFAULT '000000',
  `Type10` varchar(10) NOT NULL DEFAULT '0000000',
  `Type11` varchar(10) NOT NULL DEFAULT '0000000',
  `Type12` varchar(10) NOT NULL DEFAULT '000000',
  `Type13` varchar(15) NOT NULL DEFAULT '000000000000',
  `Type14` varchar(15) NOT NULL DEFAULT '000000000000',
  `Type15` varchar(20) NOT NULL DEFAULT '00000000000000000',
  `Type16` varchar(60) NOT NULL DEFAULT '000000000000000000000000000000000000000000000000000000000',
  `Type17` varchar(10) NOT NULL DEFAULT '000000000'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `levelsystem`
--

CREATE TABLE `levelsystem` (
  `UID` int(11) NOT NULL,
  `MainLevel` int(11) NOT NULL DEFAULT '1',
  `MainXP` int(11) NOT NULL DEFAULT '0',
  `GWLevel` int(11) NOT NULL DEFAULT '0',
  `GWXP` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `loggedin`
--

CREATE TABLE `loggedin` (
  `UID` int(4) NOT NULL,
  `Serial` varchar(32) NOT NULL DEFAULT 'ABCD1234ABCD1234',
  `IP` varchar(50) NOT NULL DEFAULT '0.0.0.0',
  `Loggedin` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `logout`
--

CREATE TABLE `logout` (
  `UID` int(4) NOT NULL,
  `Position` varchar(50) NOT NULL,
  `Waffen` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `logout`
--

INSERT INTO `logout` (`UID`, `Position`, `Waffen`) VALUES
(236, 'false', '|6,1|43,39996|'),
(28, 'false', '|24,49|29,180|31,450|'),
(18, 'false', '|24,7|29,332|31,1299|'),
(135, 'false', '|29,296|41,7583|'),
(140, 'false', '|24,27|29,1703|31,336|'),
(3, 'false', '|24,13099|29,19998|31,29997|34,1256|46,1|'),
(201, 'false', '|29,540|30,100|'),
(2, 'false', '|24,41|25,60|29,180|31,220|'),
(137, 'false', '|7,1|43,33|44,1|'),
(72, 'false', '|24,39|29,175|31,220|'),
(66, '|-1969.73|137.92|27.68|0|0|', ''),
(156, 'false', '|24,74|29,542|31,509|'),
(175, 'false', '|29,134|31,519|'),
(11, 'false', '|30,413|'),
(225, 'false', '|5,1|24,41|29,360|31,300|33,77|'),
(174, 'false', '|24,36|29,548|'),
(49, 'false', '|24,126|'),
(183, 'false', '|30,81|'),
(62, 'false', '|30,200|'),
(222, 'false', '|24,40|'),
(36, 'false', '|29,360|'),
(143, 'false', '|41,1000|'),
(44, 'false', '|30,240|'),
(286, 'false', '|25,100|'),
(1, 'false', '|29,1|'),
(93, 'false', '|22,170|'),
(103, 'false', '|24,57|29,315|30,123|'),
(230, 'false', '|5,1|24,49|29,270|31,350|'),
(65, 'false', '|30,100|'),
(19, 'false', '|24,49|29,180|31,539|'),
(235, 'false', '|43,39996|'),
(231, 'false', '|22,25|29,309|31,89|'),
(254, 'false', '|24,53|29,479|31,450|33,45|'),
(108, 'false', '|24,238|25,582|29,4124|31,5096|'),
(215, 'false', '|3,1|22,41|'),
(59, 'false', '|24,48|29,180|31,650|33,102|'),
(216, 'false', '|43,29997|'),
(48, 'false', '|24,40|29,150|31,220|'),
(12, 'false', '|24,6|29,114|31,292|'),
(164, 'false', '|24,21|30,100|'),
(228, 'false', '|29,89|'),
(81, 'false', '|24,17|29,256|'),
(185, 'false', '|41,4000|'),
(82, '|-1506.83|910.7|7.19|0|0|', ''),
(102, 'false', '|24,98|29,360|31,900|33,102|'),
(246, 'false', '|43,29997|'),
(7, 'false', '|30,99|'),
(204, 'false', '|25,1|28,447|31,542|'),
(176, 'false', '|29,90|'),
(60, 'false', '|24,44|25,370|31,154|'),
(154, 'false', '|30,70|'),
(47, 'false', '|41,6996|'),
(117, 'false', '|30,150|'),
(51, '|-2438.97|494.85|32.77|0|0|', '|24,24|25,46|29,104|31,135|'),
(219, 'false', '|30,200|'),
(90, '|-1970.14|96.07|27.34|0|0|', ''),
(307, 'false', '|30,300|'),
(126, 'false', '|30,136|'),
(70, 'false', '|29,180|31,220|'),
(146, 'false', '|24,28|29,148|31,250|43,29997|'),
(208, 'false', '|24,4|29,165|31,177|'),
(39, 'false', '|30,100|'),
(29, 'false', '|8,1|24,98|29,200|31,1050|'),
(55, 'false', '|22,779|'),
(6, 'false', '|29,90|'),
(100, 'false', '|24,133|29,993|31,1176|33,51|'),
(149, 'false', '|24,49|29,143|31,1124|'),
(249, 'false', '|5,1|24,140|29,3030|30,2988|'),
(14, 'false', '|24,22|29,696|31,269|33,56|'),
(42, 'false', '|24,239|29,1324|31,430|33,94|18,12|'),
(152, 'false', '|3,1|24,42|29,180|31,220|'),
(43, 'false', '|24,92|29,467|31,300|'),
(40, 'false', '|24,120|29,317|31,641|'),
(5, 'false', '|30,299|'),
(8, '|-228.71|1408.2|28.41|18|111|', ''),
(63, 'false', '|29,90|'),
(21, 'false', '|24,12|29,168|31,669|'),
(24, 'false', '|24,28|31,296|33,4|'),
(160, 'false', '|29,22|'),
(9, 'false', '|24,42|25,50|29,101|31,160|34,7|17,4|'),
(107, 'false', '|24,141|29,350|31,546|'),
(56, 'false', '|29,60|'),
(113, 'false', '|24,79|29,379|31,800|33,116|'),
(147, 'false', '|5,1|'),
(31, 'false', '|30,280|'),
(94, 'false', '|24,80|29,322|31,440|'),
(155, 'false', '|26,38|'),
(4, 'false', '|24,48|29,178|31,744|'),
(123, 'false', '|24,31|29,160|31,63|'),
(205, 'false', '|26,44|29,90|'),
(50, 'false', '|24,89|29,360|31,1347|33,112|'),
(61, 'false', '|30,100|'),
(206, 'false', '|30,130|33,20|'),
(138, 'false', '|32,808|'),
(58, 'false', '|41,1000|'),
(15, 'false', '|5,1|24,179|31,42|');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `logs`
--

CREATE TABLE `logs` (
  `ID` int(11) NOT NULL,
  `Typ` int(2) NOT NULL,
  `Text` varchar(255) NOT NULL,
  `Timestamp` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `logs`
--

INSERT INTO `logs` (`ID`, `Typ`, `Text`, `Timestamp`) VALUES
(1, 5, '[27-11-2016 11:46:01]: LargePeach schreit: Army SA, bleiben Sie sofort stehen und /handsup oder wir eroeffnen das Feuer!!!!', 1480243560);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `lotto`
--

CREATE TABLE `lotto` (
  `id` int(10) NOT NULL,
  `UID` int(4) NOT NULL,
  `z1` int(2) NOT NULL DEFAULT '0',
  `z2` int(2) NOT NULL DEFAULT '0',
  `z3` int(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `lotto`
--

INSERT INTO `lotto` (`id`, `UID`, `z1`, `z2`, `z3`) VALUES
(1, 994, 12, 8, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `marktplatz`
--

CREATE TABLE `marktplatz` (
  `ID` int(10) NOT NULL,
  `seller` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` int(15) NOT NULL,
  `buyer` varchar(50) NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `objecttyp` varchar(25) NOT NULL,
  `objectID` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `object`
--

CREATE TABLE `object` (
  `UID` int(4) NOT NULL,
  `id` int(10) NOT NULL,
  `model` int(6) NOT NULL,
  `x` float NOT NULL,
  `y` float NOT NULL,
  `z` float NOT NULL,
  `rx` float NOT NULL,
  `taken` tinyint(1) NOT NULL DEFAULT '0',
  `placer` varchar(50) NOT NULL,
  `deleteTime` int(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `packages`
--

CREATE TABLE `packages` (
  `UID` int(4) NOT NULL,
  `Paket1` int(11) NOT NULL,
  `Paket2` int(11) NOT NULL,
  `Paket3` int(11) NOT NULL,
  `Paket4` int(11) NOT NULL,
  `Paket5` int(11) NOT NULL,
  `Paket6` int(11) NOT NULL,
  `Paket7` int(11) NOT NULL,
  `Paket8` int(11) NOT NULL,
  `Paket9` int(11) NOT NULL,
  `Paket10` int(11) NOT NULL,
  `Paket11` int(11) NOT NULL,
  `Paket12` int(11) NOT NULL,
  `Paket13` int(11) NOT NULL,
  `Paket14` int(11) NOT NULL,
  `Paket15` int(11) NOT NULL,
  `Paket16` int(11) NOT NULL,
  `Paket17` int(11) NOT NULL,
  `Paket18` int(11) NOT NULL,
  `Paket19` int(11) NOT NULL,
  `Paket20` int(11) NOT NULL,
  `Paket21` int(11) NOT NULL,
  `Paket22` int(11) NOT NULL,
  `Paket23` int(11) NOT NULL,
  `Paket24` int(11) NOT NULL,
  `Paket25` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `packages`
--

INSERT INTO `packages` (`UID`, `Paket1`, `Paket2`, `Paket3`, `Paket4`, `Paket5`, `Paket6`, `Paket7`, `Paket8`, `Paket9`, `Paket10`, `Paket11`, `Paket12`, `Paket13`, `Paket14`, `Paket15`, `Paket16`, `Paket17`, `Paket18`, `Paket19`, `Paket20`, `Paket21`, `Paket22`, `Paket23`, `Paket24`, `Paket25`) VALUES
(312, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(311, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(310, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(309, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(308, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(307, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(306, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(305, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(303, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(302, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(301, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(300, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(299, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(298, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(297, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(296, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(295, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(294, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(293, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(292, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(291, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(290, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(289, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(288, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(287, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(286, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(285, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(284, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(283, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(282, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(281, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(280, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(279, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(278, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(277, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(275, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(274, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(273, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(272, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(271, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(270, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(269, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(268, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(267, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(266, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(265, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(264, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(263, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(262, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(261, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(260, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(259, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(258, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(257, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(256, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(255, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(254, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(253, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(251, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(250, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(249, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(248, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(247, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(246, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(245, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(244, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(243, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(242, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(241, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(240, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(239, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(238, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(237, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(236, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(235, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(234, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(233, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(232, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(231, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(230, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(229, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(228, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(227, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(226, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(225, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(224, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(223, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(222, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(221, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(220, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(218, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(217, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(216, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(215, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(214, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(213, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(212, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(211, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(210, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(209, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(207, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(206, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(205, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(204, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(203, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(202, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(201, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(199, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(198, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(197, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(196, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(195, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(194, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(193, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(191, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(190, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(189, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(188, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(187, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(186, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(185, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(184, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(183, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(182, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(181, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(179, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(178, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(177, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(176, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(175, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(174, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(173, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(172, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(171, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(170, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(169, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(168, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(167, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(166, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(165, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(164, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(163, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(162, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(161, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(160, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(159, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(158, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(157, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(156, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(155, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(154, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(153, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(151, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(150, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(149, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(148, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(147, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(146, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(145, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(143, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(142, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(141, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(140, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(139, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(138, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(137, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(135, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(134, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(133, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(132, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(131, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(130, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(129, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(127, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(126, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(125, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(123, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(122, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(121, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(120, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(119, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(118, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(117, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(115, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(114, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(113, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(111, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(110, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(109, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(108, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(107, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(106, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(105, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(104, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(103, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(102, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(101, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(99, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(98, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(97, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(96, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(95, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(94, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(93, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(92, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(91, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(90, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(89, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(87, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(86, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(85, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(84, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(83, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(82, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(81, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(80, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(79, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(78, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(77, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(76, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(75, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(73, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(72, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(71, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(70, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(69, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(68, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(67, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(66, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(65, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(63, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(62, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(61, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(60, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(59, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(58, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(57, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(56, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(55, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(54, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(53, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(52, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(51, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(50, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(49, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(48, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(47, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(46, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(45, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(44, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(43, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(42, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(41, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(40, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(39, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(38, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(37, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(36, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(35, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(34, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(33, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(32, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(31, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(30, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(29, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(28, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(27, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(26, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(24, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(23, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(22, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(21, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
(2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `players`
--

CREATE TABLE `players` (
  `UID` int(4) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Serial` varchar(50) NOT NULL,
  `IP` varchar(50) NOT NULL,
  `Last_login` varchar(50) NOT NULL,
  `Geburtsdatum_Tag` int(11) NOT NULL,
  `Geburtsdatum_Monat` int(11) NOT NULL,
  `Geburtsdatum_Jahr` int(4) NOT NULL,
  `Passwort` text NOT NULL,
  `Geschlecht` int(50) NOT NULL,
  `RegisterDatum` varchar(50) NOT NULL,
  `LastLogin` int(50) NOT NULL DEFAULT '1',
  `Erlaubnis` varchar(1) NOT NULL DEFAULT '0' COMMENT 'fuer das Spielen mit mehreren Accs an einem PC',
  `ts3uid` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `playingtime`
--

CREATE TABLE `playingtime` (
  `UID` int(4) NOT NULL,
  `Time` int(4) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `prestige`
--

CREATE TABLE `prestige` (
  `ID` int(10) NOT NULL,
  `X` float NOT NULL,
  `Y` float NOT NULL,
  `Z` float NOT NULL,
  `Besitzer` varchar(50) NOT NULL,
  `UID` int(11) NOT NULL,
  `Preis` int(7) NOT NULL,
  `Beschreibung` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `racing`
--

CREATE TABLE `racing` (
  `UID` int(4) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `MilliSekunden` int(1) NOT NULL,
  `Sekunden` int(2) NOT NULL,
  `Minuten` int(5) NOT NULL,
  `Platz` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `racing`
--

INSERT INTO `racing` (`UID`, `Name`, `MilliSekunden`, `Sekunden`, `Minuten`, `Platz`) VALUES
(0, '', 0, 0, 3, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `skills`
--

CREATE TABLE `skills` (
  `UID` int(4) NOT NULL,
  `fishing` int(5) NOT NULL DEFAULT '0',
  `repair` int(5) NOT NULL DEFAULT '0',
  `gamble` int(10) NOT NULL DEFAULT '0',
  `cook` int(5) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `state_files`
--

CREATE TABLE `state_files` (
  `UID` int(4) NOT NULL,
  `text` varchar(1000) NOT NULL,
  `editor` varchar(50) NOT NULL,
  `faction` int(2) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `statistics`
--

CREATE TABLE `statistics` (
  `UID` int(4) NOT NULL,
  `AnzahlEingeknastet` int(11) NOT NULL DEFAULT '0',
  `AnzahlImKnast` int(11) NOT NULL DEFAULT '0',
  `AnzahlGangwars` int(11) NOT NULL DEFAULT '0',
  `AnzahlGangwarsGewonnen` int(11) NOT NULL DEFAULT '0',
  `AnzahlGangwarsVerloren` int(11) NOT NULL DEFAULT '0',
  `Kills` int(11) NOT NULL DEFAULT '0',
  `Tode` int(11) NOT NULL DEFAULT '0',
  `GangwarKills` int(11) NOT NULL DEFAULT '0',
  `GangwarTode` int(11) NOT NULL DEFAULT '0',
  `HaeuserGekauft` int(11) NOT NULL DEFAULT '0',
  `FahrzeugeGekauft` int(11) NOT NULL DEFAULT '0',
  `FahrzeugeVerkauft` int(11) NOT NULL DEFAULT '0',
  `DamageGemacht` int(11) NOT NULL DEFAULT '0',
  `DamageBekommen` int(11) NOT NULL DEFAULT '0',
  `GangwarDamageGemacht` int(11) NOT NULL DEFAULT '0',
  `GangwarDamageBekommen` int(11) NOT NULL DEFAULT '0',
  `FraktionenBetreten` int(11) NOT NULL DEFAULT '0',
  `FraktionenVerlassen` int(11) NOT NULL DEFAULT '0',
  `Eingeloggt` int(11) NOT NULL DEFAULT '0',
  `MontagSpielzeit` int(11) NOT NULL DEFAULT '0',
  `DienstagSpielzeit` int(11) NOT NULL DEFAULT '0',
  `MittwochSpielzeit` int(11) NOT NULL DEFAULT '0',
  `DonnerstagSpielzeit` int(11) NOT NULL DEFAULT '0',
  `FreitagSpielzeit` int(11) NOT NULL DEFAULT '0',
  `SamstagSpielzeit` int(11) NOT NULL DEFAULT '0',
  `SonntagSpielzeit` int(11) NOT NULL DEFAULT '0',
  `LetzteWocheSpielzeit` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `support`
--

CREATE TABLE `support` (
  `ID` int(11) NOT NULL,
  `player` text NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `state` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ticketsystem`
--

CREATE TABLE `ticketsystem` (
  `id` int(11) NOT NULL,
  `UID` int(4) NOT NULL,
  `reason` text NOT NULL,
  `text` text NOT NULL,
  `date` text NOT NULL,
  `category` text NOT NULL,
  `state` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ticket_answeres`
--

CREATE TABLE `ticket_answeres` (
  `id` int(11) NOT NULL,
  `UID` int(4) NOT NULL,
  `adminUID` int(4) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `userdata`
--

CREATE TABLE `userdata` (
  `UID` int(4) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Geld` double NOT NULL DEFAULT '750',
  `ID` int(11) NOT NULL,
  `Spawnpos_X` varchar(50) NOT NULL DEFAULT '-2458.288085',
  `Spawnpos_Y` varchar(50) NOT NULL DEFAULT '774.354492',
  `Spawnpos_Z` varchar(50) NOT NULL DEFAULT '35.171875',
  `Spawnrot_X` varchar(50) NOT NULL DEFAULT '52.94',
  `SpawnInterior` double NOT NULL DEFAULT '0',
  `SpawnDimension` double NOT NULL DEFAULT '0',
  `Fraktion` double NOT NULL DEFAULT '0',
  `FraktionsRang` double NOT NULL DEFAULT '0',
  `Adminlevel` int(10) NOT NULL DEFAULT '0',
  `Spielzeit` double NOT NULL DEFAULT '0',
  `Hitglocke` int(1) NOT NULL DEFAULT '0',
  `CurrentCars` double NOT NULL DEFAULT '0',
  `MaximumCars` double NOT NULL DEFAULT '5',
  `Knastzeit` double NOT NULL DEFAULT '0',
  `Prison` double NOT NULL DEFAULT '0',
  `Kaution` int(4) NOT NULL DEFAULT '0',
  `Himmelszeit` double NOT NULL DEFAULT '0',
  `Hausschluessel` int(50) NOT NULL DEFAULT '0',
  `Bizschluessel` int(50) NOT NULL DEFAULT '0',
  `Bankgeld` double NOT NULL DEFAULT '5000',
  `Drogen` double NOT NULL DEFAULT '0',
  `Skinid` int(3) NOT NULL DEFAULT '0',
  `Autofuehrerschein` int(1) NOT NULL DEFAULT '0',
  `Motorradtfuehrerschein` int(1) NOT NULL DEFAULT '0',
  `LKWfuehrerschein` int(1) NOT NULL DEFAULT '0',
  `Helikopterfuehrerschein` int(1) NOT NULL DEFAULT '0',
  `FlugscheinKlasseA` int(1) NOT NULL DEFAULT '0',
  `FlugscheinKlasseB` int(1) NOT NULL DEFAULT '0',
  `Motorbootschein` int(1) NOT NULL DEFAULT '0',
  `Segelschein` int(1) NOT NULL DEFAULT '0',
  `Angelschein` int(1) NOT NULL DEFAULT '0',
  `Wanteds` int(1) NOT NULL DEFAULT '0',
  `StvoPunkte` int(2) NOT NULL DEFAULT '0',
  `Waffenschein` int(1) NOT NULL DEFAULT '0',
  `Perso` int(1) NOT NULL DEFAULT '0',
  `Boni` double NOT NULL DEFAULT '0',
  `PdayIncome` double NOT NULL DEFAULT '0',
  `Telefonnr` int(6) NOT NULL DEFAULT '0',
  `Warns` int(50) NOT NULL DEFAULT '0',
  `Gunbox1` varchar(50) NOT NULL DEFAULT '0|0',
  `Gunbox2` varchar(50) NOT NULL DEFAULT '0|0',
  `Gunbox3` varchar(50) NOT NULL DEFAULT '0|0',
  `Job` varchar(50) NOT NULL DEFAULT 'none',
  `Jobtime` double NOT NULL DEFAULT '0',
  `Club` varchar(50) NOT NULL DEFAULT 'none',
  `FavRadio` varchar(50) NOT NULL DEFAULT '0',
  `Bonuspunkte` int(11) NOT NULL DEFAULT '0',
  `Truckerskill` varchar(50) NOT NULL DEFAULT 'none',
  `AirportLevel` varchar(1000) NOT NULL DEFAULT '1',
  `farmerLVL` int(10) NOT NULL DEFAULT '0',
  `bauarbeiterLVL` int(10) NOT NULL DEFAULT '0',
  `Contract` int(7) NOT NULL DEFAULT '0',
  `ArmyPermissions` varchar(50) NOT NULL DEFAULT '|0|0|0|0|0|0|0|0|0|',
  `SocialState` varchar(50) NOT NULL DEFAULT 'VenoX',
  `fversicherung` int(11) NOT NULL DEFAULT '0',
  `LastFactionChange` varchar(50) NOT NULL DEFAULT '-',
  `StreetCleanPoints` int(11) NOT NULL DEFAULT '0',
  `Handy` varchar(50) NOT NULL DEFAULT '|1|0|',
  `Rausch` varchar(50) NOT NULL DEFAULT '0|0|0|',
  `Sucht` varchar(50) NOT NULL DEFAULT '0|0|0|',
  `pred` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Ob das Promt-Fenster gelesen wurde',
  `Buslevel` int(11) NOT NULL DEFAULT '0',
  `Coins` int(11) NOT NULL DEFAULT '0',
  `geschenk` bigint(50) NOT NULL DEFAULT '0',
  `PremiumPaket` int(255) DEFAULT NULL,
  `premium` varchar(255) NOT NULL DEFAULT 'false',
  `PremiumData` int(255) NOT NULL DEFAULT '0',
  `hud` int(11) NOT NULL DEFAULT '1',
  `burger` int(11) NOT NULL,
  `promocode` int(255) NOT NULL,
  `crosshair` int(255) NOT NULL DEFAULT '0',
  `promocode2` int(255) NOT NULL DEFAULT '0',
  `promocode3` int(255) NOT NULL DEFAULT '0',
  `promocode4` int(255) NOT NULL DEFAULT '0',
  `promocode5` int(255) NOT NULL DEFAULT '0',
  `promocode6` int(255) NOT NULL DEFAULT '0',
  `gwkills` int(255) NOT NULL DEFAULT '0',
  `gwtode` int(255) NOT NULL DEFAULT '0',
  `gwdamage` int(255) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `vehicles`
--

CREATE TABLE `vehicles` (
  `UID` int(4) NOT NULL,
  `id` int(11) NOT NULL,
  `Kofferraum` varchar(50) NOT NULL DEFAULT '0|0|0|0|',
  `Typ` int(11) NOT NULL,
  `Tuning` varchar(255) NOT NULL,
  `Spawnpos_X` varchar(50) NOT NULL,
  `Spawnpos_Y` varchar(50) NOT NULL,
  `Spawnpos_Z` varchar(50) NOT NULL,
  `Spawnrot_X` varchar(50) NOT NULL,
  `Spawnrot_Y` varchar(50) NOT NULL,
  `Spawnrot_Z` varchar(50) NOT NULL,
  `Farbe` varchar(50) NOT NULL,
  `Paintjob` varchar(50) NOT NULL DEFAULT '3',
  `Benzin` varchar(50) NOT NULL DEFAULT '100',
  `Slot` float NOT NULL,
  `Special` int(11) NOT NULL DEFAULT '0',
  `Lights` varchar(50) NOT NULL DEFAULT '|255|255|255|',
  `Distance` double NOT NULL DEFAULT '0',
  `STuning` varchar(50) NOT NULL DEFAULT '0|0|0|0|0|0|',
  `AuktionsID` int(10) NOT NULL DEFAULT '0',
  `GangVehicle` tinyint(1) NOT NULL DEFAULT '0',
  `rc` int(1) NOT NULL DEFAULT '0',
  `spezcolor` varchar(50) NOT NULL DEFAULT '|0|0|0|0|0|0|',
  `Sportmotor` int(1) NOT NULL DEFAULT '0',
  `Bremse` varchar(1) NOT NULL DEFAULT '0',
  `Antrieb` varchar(10) NOT NULL,
  `plate` text NOT NULL,
  `neon` varchar(100) DEFAULT '',
  `v1p` tinyint(1) NOT NULL DEFAULT '0',
  `abgeschleppt` int(11) NOT NULL,
  `cpaintjob` varchar(255) NOT NULL,
  `schluessel1` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `vehicles`
--

INSERT INTO `vehicles` (`UID`, `id`, `Kofferraum`, `Typ`, `Tuning`, `Spawnpos_X`, `Spawnpos_Y`, `Spawnpos_Z`, `Spawnrot_X`, `Spawnrot_Y`, `Spawnrot_Z`, `Farbe`, `Paintjob`, `Benzin`, `Slot`, `Special`, `Lights`, `Distance`, `STuning`, `AuktionsID`, `GangVehicle`, `rc`, `spezcolor`, `Sportmotor`, `Bremse`, `Antrieb`, `plate`, `neon`, `v1p`, `abgeschleppt`, `cpaintjob`, `schluessel1`) VALUES
(1, 1033, '0|0|0|0|', 572, '|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|', '-2063.073242', '249.524414', '34.768585', '0.867920', '359.994507', '47.537842', '|0|0|0|0|', '3', '99.136667', 2, 0, '|255|255|255|', 5.977829, '1|0|0|1|0|0|', 0, 0, 0, '|0|0|0|0|0|0|', 0, '0', 'rwd', '', '', 0, 0, '', 'Cyb3rClown'),
(1, 1030, '0|0|0|0|', 541, '|0|0|0|0|0|0|0|0|1010|1087|1086|0|1083|0|0|0|0|', '-2073.953125', '248.204102', '34.770424', '359.994507', '0', '310.259399', '|86|3|0|0|', '3', '89.900000', 1, 0, '|0|255|0|', 2810.0642, '1|0|0|1|0|0|', 0, 0, 0, '|0|255|0|255|8|8|', 2, '0', 'rwd', '', 'red', 0, 1, '', 'Maqic.exe'),
(4, 1032, '0|0|0|0|', 572, '|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|', '-2319.370117', '-117.290039', '34.879868', '0.895386', '0.109863', '359.533081', '|0|0|0|0|', '3', '64.353333', 1, 0, '|255|255|255|', 335.19193, '1|0|0|1|0|0|', 0, 0, 0, '|255|255|255|183|0|33|', 0, '0', 'rwd', '', 'red', 0, 0, 'paintjob6.png', ''),
(7, 1058, '0|0|0|0|', 480, '|0|0|0|0|0|0|0|0|1010|0|1086|0|1025|0|0|0|0|', '-1973.533203', '105.208984', '27.461121', '359.741821', '0', '178.961792', '|25|34|0|0|', '3', '97.913333', 1, 0, '|255|255|255|', 163.94322, '1|0|0|1|0|0|', 0, 0, 0, '|72|74|74|95|97|99|', 0, '0', 'awd', '', '', 0, 0, 'paintjob1.png', '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `wantedstvokatalog`
--

CREATE TABLE `wantedstvokatalog` (
  `ID` int(11) NOT NULL,
  `TYP` varchar(50) NOT NULL,
  `Anzahl` tinyint(2) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `wantedstvokatalog`
--

INSERT INTO `wantedstvokatalog` (`ID`, `TYP`, `Anzahl`, `Name`) VALUES
(1, 'wanted', 1, 'Koerperverletzung'),
(10, 'wanted', 1, 'Beamtenbehinderung'),
(11, 'wanted', 1, 'Beamtenbelaestigung'),
(12, 'wanted', 1, 'Beleidigung'),
(13, 'wanted', 1, 'Befehlsverweigerung'),
(14, 'wanted', 2, 'Flucht vor/aus Kontrolle'),
(15, 'wanted', 1, 'Drogenbesitz 10-49'),
(16, 'wanted', 1, 'Materialbesitz 10-49'),
(17, 'wanted', 1, 'Diebstahl & versuchter Diebstahl'),
(18, 'wanted', 1, 'Sachbeschaedigung'),
(19, 'wanted', 1, 'illegale Werbung per /ad'),
(20, 'wanted', 1, 'Drohung'),
(21, 'wanted', 1, 'Erpessung'),
(22, 'wanted', 1, 'Illegales Strassenrennen'),
(23, 'wanted', 1, 'Vortaeuschen falscher Tatsachen'),
(24, 'wanted', 1, 'Fahren ohne Fahrerlaubnis'),
(25, 'wanted', 2, 'Verweigerung zur Durchsuchung'),
(26, 'wanted', 2, 'Waffennutzung (Schusswaffen)'),
(27, 'wanted', 2, 'Koerperverletzung durch Schusswaffen'),
(28, 'wanted', 2, 'Drogenanbau bzw. -abbau'),
(29, 'wanted', 2, 'Drogenkonsum'),
(30, 'wanted', 2, 'Raubueberfall'),
(31, 'wanted', 2, 'Drogenbesitz 50-149'),
(32, 'wanted', 2, 'Materialbesitz 50 - 149'),
(33, 'wanted', 2, 'Bestechungsversuch'),
(34, 'wanted', 2, 'Waffenverkauf'),
(35, 'wanted', 2, 'Carrob | Alle Fahrzeuginsassen\r\n'),
(36, 'wanted', 3, 'Mord'),
(37, 'wanted', 3, 'Waffentruck & Matsvan '),
(38, 'wanted', 3, 'Betreten des Bundeswehrgebiets (auf und innerhalb des Feldweges) ³'),
(39, 'wanted', 3, 'Betreten des SFPD Parkplatzes (Hinterhof)'),
(40, 'wanted', 3, 'Beihilfe zur Freiheitsberaubung'),
(41, 'wanted', 3, 'Drogenbesitz ueber und einschliesslich 150'),
(42, 'wanted', 3, 'Materialbesitz ueber und einschließlich 150'),
(43, 'wanted', 4, 'Bankraub'),
(44, 'wanted', 4, 'Geiselnahme'),
(45, 'wanted', 4, 'Betreten der Polizeiwache ohne Genehmigung'),
(46, 'wanted', 4, 'Beschuss mit einem Raketenwerfer\r\n'),
(47, 'wanted', 6, 'Einbruch in die Bundeswehrbasis'),
(48, 'wanted', 6, 'Einbruch in die Basis des F.B.I\'s'),
(49, 'wanted', 6, 'Einbruch in die Bundeswehrbasis beim Flugzeugtraeger'),
(50, 'wanted', 6, 'Einbruch in die Garagen des San Andreas Police Departments'),
(51, 'wanted', 6, 'Terroranschlag'),
(52, 'wanted', 6, 'Terrorist mit scharfer Selbstmordbombe'),
(53, 'stvo', 1, 'Burnout(Reifen Durch drehen lassen)'),
(54, 'stvo', 1, 'Halten und/oder Parken auf der Strasse'),
(55, 'stvo', 1, 'Gefaehrlicher Eingriff in den Strassenverkehr'),
(56, 'stvo', 1, 'Falschparken'),
(57, 'stvo', 2, 'Sachbeschaedigung von Objekten des Strassenverkehrs'),
(58, 'stvo', 2, 'Missachtung der Vorfahrtsregeln '),
(59, 'stvo', 3, 'Mit einem Fluggeraet auf der Strasse landen'),
(60, 'stvo', 3, 'Missachtung von Fahrverboten'),
(61, 'stvo', 3, 'Verwendung von Nebelwand '),
(62, 'stvo', 4, 'Verursachen eines Unfalls'),
(63, 'stvo', 4, 'Alkohol am Steuer'),
(64, 'stvo', 4, 'Abseitsfahren der Strasse'),
(65, 'stvo', 4, 'Verwendung von Nitro'),
(66, 'stvo', 6, 'An- und Ueberfahren von Passanten'),
(67, 'stvo', 6, 'Geisterfahren'),
(68, 'stvo', 6, 'Verwendung von Nebelwand'),
(69, 'wanted', 1, 'Koksbesitz 10-49 G'),
(70, 'wanted', 2, 'Koksbesitz 50-200'),
(71, 'wanted', 4, 'Koksbesitz 200-350 G'),
(72, 'wanted', 1, 'Beihilfe zur flucht');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `warns`
--

CREATE TABLE `warns` (
  `UID` int(4) NOT NULL,
  `id` int(11) NOT NULL,
  `adminUID` int(4) NOT NULL,
  `reason` text NOT NULL,
  `extends` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `extends_o` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `weed`
--

CREATE TABLE `weed` (
  `id` int(11) NOT NULL,
  `x` int(20) NOT NULL,
  `y` int(20) NOT NULL,
  `z` int(20) NOT NULL,
  `time` int(50) NOT NULL,
  `UID` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `whitelist`
--

CREATE TABLE `whitelist` (
  `ID` int(11) NOT NULL,
  `Username` text,
  `Serial` text,
  `UID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `whitelist`
--

INSERT INTO `whitelist` (`ID`, `Username`, `Serial`, `UID`) VALUES
(3, 'Solid_Snake', 'F6D1E7F27BE78BBBA3138011460F3143', NULL),
(4, '0xE9', 'F0BAC1AB17B41765749F8AE8C2AE2BB2', NULL);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `xmas`
--

CREATE TABLE `xmas` (
  `Name` text NOT NULL,
  `d1` int(1) NOT NULL DEFAULT '0',
  `d2` int(11) NOT NULL DEFAULT '0',
  `d3` int(11) NOT NULL DEFAULT '0',
  `d4` int(11) NOT NULL DEFAULT '0',
  `d5` int(11) NOT NULL DEFAULT '0',
  `d6` int(11) NOT NULL DEFAULT '0',
  `d7` int(11) NOT NULL DEFAULT '0',
  `d8` int(11) NOT NULL DEFAULT '0',
  `d9` int(11) NOT NULL DEFAULT '0',
  `d10` int(11) NOT NULL DEFAULT '0',
  `d11` int(11) NOT NULL DEFAULT '0',
  `d12` int(11) NOT NULL DEFAULT '0',
  `d13` int(11) NOT NULL DEFAULT '0',
  `d14` int(11) NOT NULL DEFAULT '0',
  `d15` int(11) NOT NULL DEFAULT '0',
  `d16` int(11) NOT NULL DEFAULT '0',
  `d17` int(11) NOT NULL DEFAULT '0',
  `d18` int(11) NOT NULL DEFAULT '0',
  `d19` int(11) NOT NULL DEFAULT '0',
  `d20` int(11) NOT NULL DEFAULT '0',
  `d21` int(11) NOT NULL DEFAULT '0',
  `d22` int(11) NOT NULL DEFAULT '0',
  `d23` int(11) NOT NULL DEFAULT '0',
  `d24` int(11) NOT NULL DEFAULT '0',
  `kalender` int(11) NOT NULL DEFAULT '0',
  `schokolade` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `achievementlist`
--
ALTER TABLE `achievementlist`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `achievements`
--
ALTER TABLE `achievements`
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indizes für die Tabelle `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `ban`
--
ALTER TABLE `ban`
  ADD PRIMARY KEY (`UID`),
  ADD KEY `IP` (`IP`),
  ADD KEY `Serial` (`Serial`),
  ADD KEY `STime` (`STime`);

--
-- Indizes für die Tabelle `biz`
--
ALTER TABLE `biz`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `blacklist`
--
ALTER TABLE `blacklist`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`UID`);

--
-- Indizes für die Tabelle `bonustable`
--
ALTER TABLE `bonustable`
  ADD PRIMARY KEY (`UID`);

--
-- Indizes für die Tabelle `booster`
--
ALTER TABLE `booster`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Indizes für die Tabelle `buyit`
--
ALTER TABLE `buyit`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `carhouses_icons`
--
ALTER TABLE `carhouses_icons`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `carhouses_vehicles`
--
ALTER TABLE `carhouses_vehicles`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `cars_ai`
--
ALTER TABLE `cars_ai`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `cars_peds_ai`
--
ALTER TABLE `cars_peds_ai`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `coins`
--
ALTER TABLE `coins`
  ADD PRIMARY KEY (`Name`);

--
-- Indizes für die Tabelle `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `fraktionen`
--
ALTER TABLE `fraktionen`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `gangs`
--
ALTER TABLE `gangs`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `gang_basic`
--
ALTER TABLE `gang_basic`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `gang_members`
--
ALTER TABLE `gang_members`
  ADD PRIMARY KEY (`UID`);

--
-- Indizes für die Tabelle `gang_vehicles`
--
ALTER TABLE `gang_vehicles`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `houses`
--
ALTER TABLE `houses`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `idcounter`
--
ALTER TABLE `idcounter`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `inventar`
--
ALTER TABLE `inventar`
  ADD PRIMARY KEY (`UID`);

--
-- Indizes für die Tabelle `kleidungsteile`
--
ALTER TABLE `kleidungsteile`
  ADD PRIMARY KEY (`UID`);

--
-- Indizes für die Tabelle `levelsystem`
--
ALTER TABLE `levelsystem`
  ADD UNIQUE KEY `UID` (`UID`);

--
-- Indizes für die Tabelle `loggedin`
--
ALTER TABLE `loggedin`
  ADD PRIMARY KEY (`UID`);

--
-- Indizes für die Tabelle `logout`
--
ALTER TABLE `logout`
  ADD PRIMARY KEY (`UID`);

--
-- Indizes für die Tabelle `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `lotto`
--
ALTER TABLE `lotto`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `marktplatz`
--
ALTER TABLE `marktplatz`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `object`
--
ALTER TABLE `object`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`UID`);

--
-- Indizes für die Tabelle `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`UID`);

--
-- Indizes für die Tabelle `playingtime`
--
ALTER TABLE `playingtime`
  ADD PRIMARY KEY (`UID`);

--
-- Indizes für die Tabelle `prestige`
--
ALTER TABLE `prestige`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `racing`
--
ALTER TABLE `racing`
  ADD PRIMARY KEY (`UID`);

--
-- Indizes für die Tabelle `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`UID`);

--
-- Indizes für die Tabelle `state_files`
--
ALTER TABLE `state_files`
  ADD PRIMARY KEY (`UID`);

--
-- Indizes für die Tabelle `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`UID`);

--
-- Indizes für die Tabelle `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `ticketsystem`
--
ALTER TABLE `ticketsystem`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `ticket_answeres`
--
ALTER TABLE `ticket_answeres`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`UID`);

--
-- Indizes für die Tabelle `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `wantedstvokatalog`
--
ALTER TABLE `wantedstvokatalog`
  ADD PRIMARY KEY (`ID`);

--
-- Indizes für die Tabelle `warns`
--
ALTER TABLE `warns`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `weed`
--
ALTER TABLE `weed`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `achievementlist`
--
ALTER TABLE `achievementlist`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT für Tabelle `achievements`
--
ALTER TABLE `achievements`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1507;

--
-- AUTO_INCREMENT für Tabelle `actions`
--
ALTER TABLE `actions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT für Tabelle `booster`
--
ALTER TABLE `booster`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `carhouses_icons`
--
ALTER TABLE `carhouses_icons`
  MODIFY `ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `carhouses_vehicles`
--
ALTER TABLE `carhouses_vehicles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT für Tabelle `cars_ai`
--
ALTER TABLE `cars_ai`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `cars_peds_ai`
--
ALTER TABLE `cars_peds_ai`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `email`
--
ALTER TABLE `email`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `gangs`
--
ALTER TABLE `gangs`
  MODIFY `ID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT für Tabelle `gang_basic`
--
ALTER TABLE `gang_basic`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `gang_vehicles`
--
ALTER TABLE `gang_vehicles`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `houses`
--
ALTER TABLE `houses`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=480;

--
-- AUTO_INCREMENT für Tabelle `logs`
--
ALTER TABLE `logs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `lotto`
--
ALTER TABLE `lotto`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `marktplatz`
--
ALTER TABLE `marktplatz`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `object`
--
ALTER TABLE `object`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `prestige`
--
ALTER TABLE `prestige`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT für Tabelle `support`
--
ALTER TABLE `support`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT für Tabelle `ticketsystem`
--
ALTER TABLE `ticketsystem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `ticket_answeres`
--
ALTER TABLE `ticket_answeres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1370;

--
-- AUTO_INCREMENT für Tabelle `wantedstvokatalog`
--
ALTER TABLE `wantedstvokatalog`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT für Tabelle `warns`
--
ALTER TABLE `warns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT für Tabelle `weed`
--
ALTER TABLE `weed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `whitelist`
--
ALTER TABLE `whitelist`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
