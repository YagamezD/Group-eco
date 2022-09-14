-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ecomerce_algo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ecomerce_algo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ecomerce_algo` DEFAULT CHARACTER SET utf8mb3 ;
USE `ecomerce_algo` ;

-- -----------------------------------------------------
-- Table `ecomerce_algo`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecomerce_algo`.`admin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(125) NOT NULL,
  `lastName` VARCHAR(125) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `mobile` VARCHAR(25) NOT NULL,
  `address` TEXT NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `type` VARCHAR(20) NOT NULL,
  `confirmCode` VARCHAR(10) NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `ecomerce_algo`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecomerce_algo`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ofname` TEXT NOT NULL,
  `pid` INT NOT NULL,
  `quantity` INT NOT NULL,
  `oplace` TEXT NOT NULL,
  `mobile` VARCHAR(15) NOT NULL,
  `dstatus` VARCHAR(10) NOT NULL DEFAULT 'no',
  `odate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ddate` DATE NULL DEFAULT NULL,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uid` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `ecomerce_algo`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecomerce_algo`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `pName` VARCHAR(100) NOT NULL,
  `price` INT NOT NULL,
  `description` TEXT NOT NULL,
  `available` INT NOT NULL,
  `category` VARCHAR(100) NOT NULL,
  `item` VARCHAR(100) NOT NULL,
  `pCode` VARCHAR(20) NOT NULL,
  `picture` TEXT NOT NULL,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `ecomerce_algo`.`product_level`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecomerce_algo`.`product_level` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `v_shape` VARCHAR(10) NOT NULL DEFAULT 'no',
  `polo` VARCHAR(10) NOT NULL DEFAULT 'no',
  `clean_text` VARCHAR(10) NOT NULL DEFAULT 'no',
  `design` VARCHAR(10) NOT NULL DEFAULT 'no',
  `chain` VARCHAR(10) NOT NULL DEFAULT 'no',
  `leather` VARCHAR(10) NOT NULL DEFAULT 'no',
  `hook` VARCHAR(10) NOT NULL DEFAULT 'no',
  `color` VARCHAR(10) NOT NULL DEFAULT 'no',
  `formal` VARCHAR(10) NOT NULL DEFAULT 'no',
  `converse` VARCHAR(10) NOT NULL DEFAULT 'no',
  `loafer` VARCHAR(10) NOT NULL DEFAULT 'no',
  `product_id` INT NOT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_product_level_products1_idx` (`product_id` ASC) VISIBLE)
ENGINE = MyISAM
AUTO_INCREMENT = 22
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `ecomerce_algo`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecomerce_algo`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `username` VARCHAR(25) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `mobile` VARCHAR(20) NOT NULL,
  `reg_time` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `online` VARCHAR(1) NOT NULL DEFAULT '0',
  `activation` VARCHAR(3) NOT NULL DEFAULT 'yes',
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = MyISAM
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `ecomerce_algo`.`product_view`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ecomerce_algo`.`product_view` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `updated_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_product_view_products1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_product_view_users1_idx` (`user_id` ASC) VISIBLE)
ENGINE = MyISAM
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


ALTER TABLE `ecomerce_algo`.`products` 
ADD COLUMN `user_id` INT NULL AFTER `updated_at`;

ALTER TABLE `ecomerce_algo`.`orders` 
ADD COLUMN `id_pedido` TEXT NULL AFTER `uid`;

ALTER TABLE `ecomerce_algo`.`product_level` 
ADD COLUMN `psicologia` VARCHAR(10) NULL AFTER `updated_at`,
ADD COLUMN `tpareja` VARCHAR(10) NULL AFTER `psicologia`,
ADD COLUMN `tocupacional` VARCHAR(10) NULL AFTER `tpareja`,
CHANGE COLUMN `v_shape` `pedicure` VARCHAR(10) NOT NULL DEFAULT 'no' ,
CHANGE COLUMN `polo` `manicure` VARCHAR(10) NOT NULL DEFAULT 'no' ,
CHANGE COLUMN `clean_text` `maquillaje` VARCHAR(10) NOT NULL DEFAULT 'no' ,
CHANGE COLUMN `design` `corte` VARCHAR(10) NOT NULL DEFAULT 'no' ,
CHANGE COLUMN `chain` `plomeria` VARCHAR(10) NOT NULL DEFAULT 'no' ,
CHANGE COLUMN `leather` `cerrajeria` VARCHAR(10) NOT NULL DEFAULT 'no' ,
CHANGE COLUMN `hook` `electricidad` VARCHAR(10) NOT NULL DEFAULT 'no' ,
CHANGE COLUMN `color` `masajes` VARCHAR(10) NOT NULL DEFAULT 'no' ,
CHANGE COLUMN `formal` `meditacion` VARCHAR(10) NOT NULL DEFAULT 'no' ,
CHANGE COLUMN `converse` `aromaterapia` VARCHAR(10) NOT NULL DEFAULT 'no' ,
CHANGE COLUMN `loafer` `psiquiatria` VARCHAR(10) NOT NULL DEFAULT 'no' ;

ALTER TABLE `ecomerce_algo`.`product_level` 
CHANGE COLUMN `psicologia` `psicologia` VARCHAR(10) NULL DEFAULT 'no' ;
ALTER TABLE `ecomerce_algo`.`product_level` 
CHANGE COLUMN `tpareja` `tpareja` VARCHAR(10) NULL DEFAULT 'no' ,
CHANGE COLUMN `tocupacional` `tocupacional` VARCHAR(10) NULL DEFAULT 'no' ;

ALTER TABLE `ecomerce_algo`.`product_level` 
CHANGE COLUMN `yoga` `yoga` VARCHAR(45) NULL DEFAULT 'no' ;
