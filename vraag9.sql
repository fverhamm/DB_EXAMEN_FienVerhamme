-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`mutatie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mutatie` (
  `mutationid` INT UNSIGNED NOT NULL,
  `chromosomenr` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`mutationid`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient` (
  `patient_id` INT UNSIGNED NOT NULL,
  `patient_name` VARCHAR(45) NULL,
  `sex` VARCHAR(45) NULL,
  `age_diagnosis` INT UNSIGNED NULL,
  `mutationid` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`patient_id`),
  INDEX `mutation_idx` (`mutationid` ASC),
  CONSTRAINT `mutation`
    FOREIGN KEY (`mutationid`)
    REFERENCES `mydb`.`mutatie` (`mutationid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`gene` (
  `gene_id` INT UNSIGNED NOT NULL,
  `gene_name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `chromosomenr` INT UNSIGNED NOT NULL,
  `start` INT UNSIGNED NULL,
  `stop` INT UNSIGNED NULL,
  PRIMARY KEY (`gene_id`),
  INDEX `chromosome_idx` (`chromosomenr` ASC),
  CONSTRAINT `chromosome`
    FOREIGN KEY (`chromosomenr`)
    REFERENCES `mydb`.`mutatie` (`mutationid`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patient_gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patient_gene` (
  `idpatient_gene` INT UNSIGNED NOT NULL,
  `patient_id` INT UNSIGNED NOT NULL,
  `gene_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idpatient_gene`),
  INDEX `patient_id_idx` (`patient_id` ASC),
  INDEX `gene_id_idx` (`gene_id` ASC),
  CONSTRAINT `patient_id`
    FOREIGN KEY (`patient_id`)
    REFERENCES `mydb`.`patient` (`patient_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `gene_id`
    FOREIGN KEY (`gene_id`)
    REFERENCES `mydb`.`gene` (`gene_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
