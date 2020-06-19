/* 1. Спроектировать базу данных «Страны и города мира»
с помощью MySQL Workbench. Творческая работа, проектировать
на собственное усмотрение. Схема будет такой:
страна ➝ область ➝ район (если есть) ➝ город (поселок, деревня).
Сдаем в формате .zip: упаковываем готовый скрипт,
который сгенерировал Workbench, и схему Workbench.
*/

-- MySQL Script generated by MySQL Workbench
-- Fri Jun 19 14:24:26 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema homework1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema homework1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `homework1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `homework1` ;

-- -----------------------------------------------------
-- Table `homework1`.`areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `homework1`.`areas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name_of_area` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `homework1`.`countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `homework1`.`countries` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name_of_country` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `homework1`.`regions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `homework1`.`regions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name_of_region` VARCHAR(55) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `homework1`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `homework1`.`cities` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(55) NOT NULL,
  `countries_id` INT NOT NULL,
  `regions_id` INT NOT NULL,
  `areas_id` INT NOT NULL,
  PRIMARY KEY (`id`, `countries_id`, `regions_id`),
  INDEX `fk_cities_countries_idx` (`countries_id` ASC) VISIBLE,
  INDEX `fk_cities_regions1_idx` (`regions_id` ASC) VISIBLE,
  INDEX `fk_cities_areas1_idx` (`areas_id` ASC) VISIBLE,
  CONSTRAINT `fk_cities_areas1`
    FOREIGN KEY (`areas_id`)
    REFERENCES `homework1`.`areas` (`id`),
  CONSTRAINT `fk_cities_countries`
    FOREIGN KEY (`countries_id`)
    REFERENCES `homework1`.`countries` (`id`),
  CONSTRAINT `fk_cities_regions1`
    FOREIGN KEY (`regions_id`)
    REFERENCES `homework1`.`regions` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
