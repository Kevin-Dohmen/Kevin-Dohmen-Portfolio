-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 06 jul 2024 om 15:31
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfoliodb`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `admin`
--

CREATE TABLE `admin` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `eMail` varchar(128) NOT NULL,
  `PW` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `admin`
--

INSERT INTO `admin` (`ID`, `Name`, `eMail`, `PW`) VALUES
(1, 'Kevin', 'kevindohmen06@gmail.com', '$2y$10$pe.DokkmdmNqyYUDS93hBOrjq/tywA90orrQu4jKh/hCSTRNcTSau');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `ID` int(11) NOT NULL,
  `adminID` int(11) NOT NULL,
  `PermissionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `collaborators`
--

CREATE TABLE `collaborators` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Website` varchar(128) DEFAULT NULL,
  `ImgDir` varchar(128) DEFAULT NULL,
  `Color` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `education`
--

CREATE TABLE `education` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(128) DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime NOT NULL,
  `isTillNow` tinyint(1) DEFAULT NULL,
  `hasDegree` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `logbook`
--

CREATE TABLE `logbook` (
  `ID` int(11) NOT NULL,
  `Subject` varchar(128) NOT NULL,
  `Description` varchar(2048) NOT NULL,
  `Date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `permissions`
--

CREATE TABLE `permissions` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `photo_album`
--

CREATE TABLE `photo_album` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `photo_albums`
--

CREATE TABLE `photo_albums` (
  `ID` int(11) NOT NULL,
  `PhotoID` int(11) NOT NULL,
  `AlbumID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `photo_categories`
--

CREATE TABLE `photo_categories` (
  `ID` int(11) NOT NULL,
  `PhotoID` int(11) NOT NULL,
  `CatID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `photo_category`
--

CREATE TABLE `photo_category` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Color` varchar(10) NOT NULL DEFAULT '#ffffff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `photo_showcase`
--

CREATE TABLE `photo_showcase` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `ImgDir` varchar(128) NOT NULL,
  `Description` varchar(2048) NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `planguages`
--

CREATE TABLE `planguages` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Color` varchar(10) DEFAULT '#faf'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `planguages`
--

INSERT INTO `planguages` (`ID`, `Name`, `Color`) VALUES
(1, 'Python', '#faf'),
(2, 'HTML', '#faf'),
(3, 'PHP', '#faf'),
(4, 'C++', '#faf'),
(5, 'C#', '#faf');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `programming_skills`
--

CREATE TABLE `programming_skills` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Rating` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `projects`
--

CREATE TABLE `projects` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(512) NOT NULL,
  `ImgDir` varchar(128) DEFAULT NULL,
  `Link` varchar(256) DEFAULT NULL,
  `GHLink` varchar(256) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `UpdateDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `projects`
--

INSERT INTO `projects` (`ID`, `Name`, `Description`, `ImgDir`, `Link`, `GHLink`, `Date`, `UpdateDate`) VALUES
(1, 'AI Crypto-Bot', 'Een bot die op basis van een aantal indicatoren een voorspelling maakt over de koers van een cryptocurrency.<br>Heeft een tijdje stil gelegen maar ik ben weer druk bezig!', 'cryptoBot.webp', 'http://crypto-bot.kevin-dohmen.nl/', 'https://github.com/Kevin-Dohmen/Crypto-Bot', '2022-01-01 00:00:00', '2022-01-01 00:00:00'),
(2, 'TechnoWire', 'Een website met tijdlijnen over belangrijke gebeurtenissen in de ICT wereld', 'TechnoWire_logo.webp', 'http://589181.klas4s23.mid-ica.nl/TechnoWire/', NULL, '2023-09-01 00:00:00', '2023-09-01 00:00:00'),
(3, 'Portfolio', 'Mijn persoonlijke portfolio (deze site)', 'user.webp', 'https://www.kevin-dohmen.nl/', 'https://github.com/Kevin-Dohmen/Kevin-Dohmen-Portfolio', '2023-09-01 00:00:00', '2023-09-01 00:00:00'),
(4, 'ASCII Renderer', 'Gebruikt een soor shader om voor elke pixel in de afbeelding een brightness te berekenen en daarmee in ascii characters een scherm te renderen.\\nDe manier waarop de shaders werken is afgeleid van OpenGL en maakt gebruik van uv\'s.', 'ascii_renderer.webp', NULL, 'https://github.com/Kevin-Dohmen/ascii-renderer', '2023-10-01 00:00:00', '2023-10-01 00:00:00'),
(5, 'GameCraft', 'Website met 2 games', 'gameCraft.webp', 'http://589181.klas4s23.mid-ica.nl/Gamecraft/', 'https://github.com/roc-ica/l2-pro-3-gamecraft-scriptsavants', '2023-12-01 00:00:00', '2023-12-01 00:00:00'),
(6, 'ErgoWijzer', 'Een informatieve website met informatie en filmpjes over RSI', 'NexusCodeErgowijzer.webp', 'http://589181.klas4s23.mid-ica.nl/ergowijzer/', 'https://github.com/roc-ica/l3-pro-3-ergowijzer-nexuscode', '2024-01-01 00:00:00', '2024-01-01 00:00:00'),
(7, 'GuestBook', 'Een website waar je 1 keer per dag een bericht achter kan laten.', 'NexusCodeErgowijzer.webp', 'http://589181.klas4s23.mid-ica.nl/guestbook/', 'https://github.com/Kevin-Dohmen/ROC-GuestBook', '2024-01-01 00:00:00', '2024-01-01 00:00:00'),
(8, 'Scrum assistant Discord Bot', 'Een Discord bot die je helpt met het bijhouden van je Scrum sprints en punten.', 'scrumBot.png', NULL, NULL, '2024-05-01 00:00:00', '2024-05-01 00:00:00');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `project_collaborators`
--

CREATE TABLE `project_collaborators` (
  `ID` int(11) NOT NULL,
  `ProjectID` int(11) NOT NULL,
  `CollaboratorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `project_planguages`
--

CREATE TABLE `project_planguages` (
  `ID` int(11) NOT NULL,
  `ProjectID` int(11) NOT NULL,
  `LangID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `project_planguages`
--

INSERT INTO `project_planguages` (`ID`, `ProjectID`, `LangID`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 2),
(6, 6, 3),
(7, 7, 3),
(8, 8, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `project_tags`
--

CREATE TABLE `project_tags` (
  `ID` int(11) NOT NULL,
  `ProjectID` int(11) NOT NULL,
  `TagID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `project_tags`
--

INSERT INTO `project_tags` (`ID`, `ProjectID`, `TagID`) VALUES
(1, 1, 1),
(2, 1, 4),
(3, 2, 2),
(4, 3, 1),
(5, 3, 3),
(6, 4, 1),
(7, 5, 2),
(8, 6, 2),
(9, 7, 2),
(10, 8, 1);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `sessions`
--

CREATE TABLE `sessions` (
  `ID` int(11) NOT NULL,
  `Session` varchar(128) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `sessions`
--

INSERT INTO `sessions` (`ID`, `Session`, `UserID`, `Date`) VALUES
(1, '0g1l54t9k98ghbeldi010mb6nm', 1, '2024-07-03 00:00:00');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `software_skills`
--

CREATE TABLE `software_skills` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `tags`
--

CREATE TABLE `tags` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Color` varchar(10) DEFAULT '#0000ff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Gegevens worden geëxporteerd voor tabel `tags`
--

INSERT INTO `tags` (`ID`, `Name`, `Color`) VALUES
(1, 'Privé', '#88dd88'),
(2, 'School', '#00afdd'),
(3, 'In Progress', '#dd0000'),
(4, 'On Halt', '#dd00dd');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `work_experience`
--

CREATE TABLE `work_experience` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Description` varchar(128) DEFAULT NULL,
  `StartDate` datetime NOT NULL,
  `EndDate` datetime DEFAULT NULL,
  `isTillNow` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Indexen voor tabel `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`),
  ADD KEY `AdminIDap_idx` (`adminID`),
  ADD KEY `PermissionIDap_idx` (`PermissionID`);

--
-- Indexen voor tabel `collaborators`
--
ALTER TABLE `collaborators`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Indexen voor tabel `education`
--
ALTER TABLE `education`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Indexen voor tabel `logbook`
--
ALTER TABLE `logbook`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Indexen voor tabel `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Indexen voor tabel `photo_album`
--
ALTER TABLE `photo_album`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Indexen voor tabel `photo_albums`
--
ALTER TABLE `photo_albums`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`),
  ADD KEY `PhotoIDpa_idx` (`PhotoID`),
  ADD KEY `AlbumIDpa_idx` (`AlbumID`);

--
-- Indexen voor tabel `photo_categories`
--
ALTER TABLE `photo_categories`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`),
  ADD KEY `PhotoIDpc_idx` (`PhotoID`),
  ADD KEY `CatIDpc_idx` (`CatID`);

--
-- Indexen voor tabel `photo_category`
--
ALTER TABLE `photo_category`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Indexen voor tabel `photo_showcase`
--
ALTER TABLE `photo_showcase`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Indexen voor tabel `planguages`
--
ALTER TABLE `planguages`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Indexen voor tabel `programming_skills`
--
ALTER TABLE `programming_skills`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Indexen voor tabel `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Indexen voor tabel `project_collaborators`
--
ALTER TABLE `project_collaborators`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`),
  ADD KEY `ProjectIDpc_idx` (`ProjectID`),
  ADD KEY `CollaboratorIDpc_idx` (`CollaboratorID`);

--
-- Indexen voor tabel `project_planguages`
--
ALTER TABLE `project_planguages`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`),
  ADD KEY `ProjectIDpl_idx` (`ProjectID`),
  ADD KEY `PLanguageID_idx` (`LangID`);

--
-- Indexen voor tabel `project_tags`
--
ALTER TABLE `project_tags`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`),
  ADD KEY `ProjectIDpt_idx` (`ProjectID`),
  ADD KEY `TagIDpt_idx` (`TagID`);

--
-- Indexen voor tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`),
  ADD KEY `UserIDss_idx` (`UserID`);

--
-- Indexen voor tabel `software_skills`
--
ALTER TABLE `software_skills`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Indexen voor tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- Indexen voor tabel `work_experience`
--
ALTER TABLE `work_experience`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID_UNIQUE` (`ID`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `collaborators`
--
ALTER TABLE `collaborators`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `education`
--
ALTER TABLE `education`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `logbook`
--
ALTER TABLE `logbook`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `permissions`
--
ALTER TABLE `permissions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `photo_album`
--
ALTER TABLE `photo_album`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `photo_albums`
--
ALTER TABLE `photo_albums`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `photo_categories`
--
ALTER TABLE `photo_categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `photo_category`
--
ALTER TABLE `photo_category`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `photo_showcase`
--
ALTER TABLE `photo_showcase`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `planguages`
--
ALTER TABLE `planguages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `programming_skills`
--
ALTER TABLE `programming_skills`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `projects`
--
ALTER TABLE `projects`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT voor een tabel `project_collaborators`
--
ALTER TABLE `project_collaborators`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `project_planguages`
--
ALTER TABLE `project_planguages`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT voor een tabel `project_tags`
--
ALTER TABLE `project_tags`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT voor een tabel `sessions`
--
ALTER TABLE `sessions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT voor een tabel `software_skills`
--
ALTER TABLE `software_skills`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `tags`
--
ALTER TABLE `tags`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `work_experience`
--
ALTER TABLE `work_experience`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD CONSTRAINT `AdminIDap` FOREIGN KEY (`adminID`) REFERENCES `admin` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `PermissionIDap` FOREIGN KEY (`PermissionID`) REFERENCES `permissions` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `photo_albums`
--
ALTER TABLE `photo_albums`
  ADD CONSTRAINT `AlbumIDpa` FOREIGN KEY (`AlbumID`) REFERENCES `photo_album` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `PhotoIDpa` FOREIGN KEY (`PhotoID`) REFERENCES `photo_showcase` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `photo_categories`
--
ALTER TABLE `photo_categories`
  ADD CONSTRAINT `CatIDpc` FOREIGN KEY (`CatID`) REFERENCES `photo_category` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `PhotoIDpc` FOREIGN KEY (`PhotoID`) REFERENCES `photo_showcase` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `project_collaborators`
--
ALTER TABLE `project_collaborators`
  ADD CONSTRAINT `CollaboratorIDpc` FOREIGN KEY (`CollaboratorID`) REFERENCES `collaborators` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `ProjectIDpc` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `project_planguages`
--
ALTER TABLE `project_planguages`
  ADD CONSTRAINT `PLanguageID` FOREIGN KEY (`LangID`) REFERENCES `planguages` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `ProjectIDpl` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `project_tags`
--
ALTER TABLE `project_tags`
  ADD CONSTRAINT `ProjectIDpt` FOREIGN KEY (`ProjectID`) REFERENCES `projects` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `TagIDpt` FOREIGN KEY (`TagID`) REFERENCES `tags` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `UserIDss` FOREIGN KEY (`UserID`) REFERENCES `admin` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
