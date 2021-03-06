-- MySQL Script generated by MySQL Workbench
-- Wed May 25 16:35:11 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `email` VARCHAR(60) NULL,
  `role` BINARY(1) NULL DEFAULT 0,
  `created_at` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`restaurants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`restaurants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `rating` INT(1) NULL,
  `description` VARCHAR(500) NULL,
  `icon` VARCHAR(250) NULL,
  `phone` VARCHAR(45) NULL,
  `location` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`comments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`comments` (
  `id` INT NOT NULL,
  `review` VARCHAR(45) NULL,
  `rating` VARCHAR(45) NULL,
  `users_id` INT NOT NULL,
  `restaurants_id` INT NOT NULL,
  `accepted` BINARY(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_comments_users_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_comments_restaurants1_idx` (`restaurants_id` ASC) VISIBLE,
  CONSTRAINT `fk_comments_users`
    FOREIGN KEY (`users_id`)
    REFERENCES `mydb`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_restaurants1`
    FOREIGN KEY (`restaurants_id`)
    REFERENCES `mydb`.`restaurants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cuisines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cuisines` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cuisine` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`restaurants_has_cuisines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`restaurants_has_cuisines` (
  `restaurants_id` INT NOT NULL,
  `cuisines_id` INT NOT NULL,
  PRIMARY KEY (`restaurants_id`, `cuisines_id`),
  INDEX `fk_restaurants_has_cuisines_cuisines1_idx` (`cuisines_id` ASC) VISIBLE,
  INDEX `fk_restaurants_has_cuisines_restaurants1_idx` (`restaurants_id` ASC) VISIBLE,
  CONSTRAINT `fk_restaurants_has_cuisines_restaurants1`
    FOREIGN KEY (`restaurants_id`)
    REFERENCES `mydb`.`restaurants` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurants_has_cuisines_cuisines1`
    FOREIGN KEY (`cuisines_id`)
    REFERENCES `mydb`.`cuisines` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
