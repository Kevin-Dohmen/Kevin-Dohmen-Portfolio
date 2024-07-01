-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolioDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfolioDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolioDB` DEFAULT CHARACTER SET utf8 ;
USE `portfolioDB` ;

-- -----------------------------------------------------
-- Table `portfolioDB`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`admin` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `eMail` VARCHAR(128) NOT NULL,
  `PW` VARCHAR(128) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Projects` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(512) NOT NULL,
  `ImgDir` VARCHAR(128) NULL,
  `Link` VARCHAR(256) NULL,
  `GHLink` VARCHAR(256) NULL,
  `Date` DATETIME NULL,
  `UpdateDate` DATETIME NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Tags` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(10) NULL DEFAULT '#0000ff',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Project_Tags`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Project_Tags` (
  `ProjectID` INT NOT NULL,
  `TagID` INT NOT NULL,
  INDEX `ProjectIDpt_idx` (`ProjectID` ASC) ,
  INDEX `TagIDpt_idx` (`TagID` ASC) ,
  CONSTRAINT `ProjectIDpt`
    FOREIGN KEY (`ProjectID`)
    REFERENCES `portfolioDB`.`Projects` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `TagIDpt`
    FOREIGN KEY (`TagID`)
    REFERENCES `portfolioDB`.`Tags` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`PLanguages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`PLanguages` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(10) NULL DEFAULT '#faf',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Project_PLanguages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Project_PLanguages` (
  `ProjectID` INT NOT NULL,
  `LangID` INT NOT NULL,
  INDEX `ProjectIDpl_idx` (`ProjectID` ASC) ,
  INDEX `PLanguageID_idx` (`LangID` ASC) ,
  CONSTRAINT `ProjectIDpl`
    FOREIGN KEY (`ProjectID`)
    REFERENCES `portfolioDB`.`Projects` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `PLanguageID`
    FOREIGN KEY (`LangID`)
    REFERENCES `portfolioDB`.`PLanguages` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Permissions` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Admin_Permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Admin_Permissions` (
  `adminID` INT NOT NULL,
  `PermissionID` INT NOT NULL,
  INDEX `AdminIDap_idx` (`adminID` ASC) ,
  INDEX `PermissionIDap_idx` (`PermissionID` ASC) ,
  CONSTRAINT `AdminIDap`
    FOREIGN KEY (`adminID`)
    REFERENCES `portfolioDB`.`admin` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `PermissionIDap`
    FOREIGN KEY (`PermissionID`)
    REFERENCES `portfolioDB`.`Permissions` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Work_Experience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Work_Experience` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(128) NULL,
  `StartDate` DATETIME NOT NULL,
  `EndDate` DATETIME NULL,
  `isTillNow` TINYINT(1) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Software_Skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Software_Skills` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Education` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(128) NULL,
  `StartDate` DATETIME NOT NULL,
  `EndDate` DATETIME NOT NULL,
  `isTillNow` TINYINT(1) NULL,
  `hasDegree` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Programming_Skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Programming_Skills` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Rating` INT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Logbook`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Logbook` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Subject` VARCHAR(128) NOT NULL,
  `Description` VARCHAR(2048) NOT NULL,
  `Date` DATETIME NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Photo_Showcase`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Photo_Showcase` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `ImgDir` VARCHAR(128) NOT NULL,
  `Description` VARCHAR(2048) NOT NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Photo_Category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Photo_Category` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(10) NOT NULL DEFAULT '#ffffff',
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Photo_Categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Photo_Categories` (
  `PhotoID` INT NOT NULL,
  `CatID` INT NOT NULL,
  INDEX `PhotoIDpc_idx` (`PhotoID` ASC) ,
  INDEX `CatIDpc_idx` (`CatID` ASC) ,
  CONSTRAINT `PhotoIDpc`
    FOREIGN KEY (`PhotoID`)
    REFERENCES `portfolioDB`.`Photo_Showcase` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `CatIDpc`
    FOREIGN KEY (`CatID`)
    REFERENCES `portfolioDB`.`Photo_Category` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Photo_Album`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Photo_Album` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Photo_Albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Photo_Albums` (
  `PhotoID` INT NOT NULL,
  `AlbumID` INT NOT NULL,
  INDEX `PhotoIDpa_idx` (`PhotoID` ASC) ,
  INDEX `AlbumIDpa_idx` (`AlbumID` ASC) ,
  CONSTRAINT `PhotoIDpa`
    FOREIGN KEY (`PhotoID`)
    REFERENCES `portfolioDB`.`Photo_Showcase` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `AlbumIDpa`
    FOREIGN KEY (`AlbumID`)
    REFERENCES `portfolioDB`.`Photo_Album` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Collaborators`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Collaborators` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Website` VARCHAR(128) NULL,
  `ImgDir` VARCHAR(128) NULL,
  `Color` VARCHAR(10) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolioDB`.`Project_Collaborators`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolioDB`.`Project_Collaborators` (
  `ProjectID` INT NOT NULL,
  `CollaboratorID` INT NOT NULL,
  INDEX `ProjectIDpc_idx` (`ProjectID` ASC) ,
  INDEX `CollaboratorIDpc_idx` (`CollaboratorID` ASC) ,
  CONSTRAINT `ProjectIDpc`
    FOREIGN KEY (`ProjectID`)
    REFERENCES `portfolioDB`.`Projects` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `CollaboratorIDpc`
    FOREIGN KEY (`CollaboratorID`)
    REFERENCES `portfolioDB`.`Collaborators` (`ID`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
