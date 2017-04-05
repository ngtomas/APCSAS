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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`dept`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dept` (
  `dept_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `dept_code` VARCHAR(255) NOT NULL COMMENT '',
  `dept_description` VARCHAR(255) NOT NULL COMMENT '',
  `dept_assign` VARCHAR(255) NULL COMMENT '',
  `is_deleted` VARCHAR(255) NULL COMMENT '',
  `floor` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`dept_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`employee` (
  `emp_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `dept_id` INT NOT NULL COMMENT '',
  `emp_last_name` VARCHAR(255) NOT NULL COMMENT '',
  `emp_first_name` VARCHAR(255) NOT NULL COMMENT '',
  `employee_middle_name` VARCHAR(255) NOT NULL COMMENT '',
  `email` VARCHAR(255) NOT NULL COMMENT '',
  `emp_status` VARCHAR(255) NULL COMMENT '',
  `emp_group` VARCHAR(255) NULL COMMENT '',
  `address` VARCHAR(255) NOT NULL COMMENT '',
  `postal_code` VARCHAR(255) NOT NULL COMMENT '',
  `tel_num` VARCHAR(255) NOT NULL COMMENT '',
  `mobile_num` VARCHAR(255) NOT NULL COMMENT '',
  `hiring_date` DATE NULL COMMENT '',
  `resignation_date` VARCHAR(255) NULL COMMENT '',
  `gender` VARCHAR(255) NOT NULL COMMENT '',
  `civil_status` VARCHAR(255) NOT NULL COMMENT '',
  `birth_date` DATE NOT NULL COMMENT '',
  `birth_place` VARCHAR(255) NOT NULL COMMENT '',
  `religion` VARCHAR(255) NOT NULL COMMENT '',
  `is_deleted` VARCHAR(255) NULL COMMENT '',
  `atm_num` VARCHAR(255) NOT NULL COMMENT '',
  `bdo_atm_num` VARCHAR(255) NOT NULL COMMENT '',
  `sss_num` VARCHAR(255) NOT NULL COMMENT '',
  `philhealth_num` VARCHAR(255) NOT NULL COMMENT '',
  `tin_num` VARCHAR(255) NOT NULL COMMENT '',
  `pagibig_num` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`emp_id`)  COMMENT '',
  INDEX `fk_employee_dept1_idx` (`dept_id` ASC)  COMMENT '',
  CONSTRAINT `fk_employee_dept1`
    FOREIGN KEY (`dept_id`)
    REFERENCES `mydb`.`dept` (`dept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`course` (
  `course_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `course_code` VARCHAR(255) NOT NULL COMMENT '',
  `course_description` VARCHAR(255) NOT NULL COMMENT '',
  PRIMARY KEY (`course_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`scholarship`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`scholarship` (
  `scholarship_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `scholarship_code` VARCHAR(255) NOT NULL COMMENT '',
  `scholarship_description` VARCHAR(255) NOT NULL COMMENT '',
  `scholarship_group` VARCHAR(255) NOT NULL COMMENT '',
  `discount` DECIMAL NOT NULL COMMENT '',
  `waive_fee` VARCHAR(255) NULL COMMENT '',
  `scholarship_apply` VARCHAR(255) NULL COMMENT '',
  `required_cgpa` DECIMAL NOT NULL COMMENT '',
  `sa_hour` DECIMAL NOT NULL COMMENT '',
  `is_offered` VARCHAR(255) NULL COMMENT '',
  `program_apply` VARCHAR(255) NULL COMMENT '',
  PRIMARY KEY (`scholarship_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student` (
  `student_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `course_id` INT NOT NULL COMMENT '',
  `scholarship_id` INT NOT NULL COMMENT '',
  `student_last_name` VARCHAR(255) NOT NULL COMMENT '',
  `student_first_name` VARCHAR(255) NOT NULL COMMENT '',
  `student_middle_name` VARCHAR(255) NOT NULL COMMENT '',
  `birth_date` DATE NOT NULL COMMENT '',
  `birth_place` VARCHAR(255) NOT NULL COMMENT '',
  `admission_date` DATE NULL COMMENT '',
  `entry_level` VARCHAR(255) NOT NULL COMMENT '',
  `admission_credential` VARCHAR(255) NULL COMMENT '',
  `mail_grades_to` VARCHAR(255) NULL COMMENT '',
  `exit_level` VARCHAR(255) NULL COMMENT '',
  `nationality` VARCHAR(255) NOT NULL COMMENT '',
  `gender` VARCHAR(255) NOT NULL COMMENT '',
  `address` VARCHAR(255) NOT NULL COMMENT '',
  `postal_code` VARCHAR(255) NOT NULL COMMENT '',
  `tel_num` VARCHAR(255) NOT NULL COMMENT '',
  `mobile_num` VARCHAR(255) NOT NULL COMMENT '',
  `email` VARCHAR(255) NOT NULL COMMENT '',
  `religion` VARCHAR(255) NOT NULL COMMENT '',
  `civil_status` VARCHAR(255) NOT NULL COMMENT '',
  `box_num` VARCHAR(255) NULL COMMENT '',
  PRIMARY KEY (`student_id`)  COMMENT '',
  INDEX `fk_student_course1_idx` (`course_id` ASC)  COMMENT '',
  INDEX `fk_student_scholarship1_idx` (`scholarship_id` ASC)  COMMENT '',
  CONSTRAINT `fk_student_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`course` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_scholarship1`
    FOREIGN KEY (`scholarship_id`)
    REFERENCES `mydb`.`scholarship` (`scholarship_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`term`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`term` (
  `term_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `school_year` YEAR NOT NULL COMMENT '',
  `term_num` VARCHAR(255) NOT NULL COMMENT '',
  `term_start` DATE NOT NULL COMMENT '',
  `term_end` DATE NOT NULL COMMENT '',
  `reg_start` DATE NULL COMMENT '',
  `reg_end` DATE NULL COMMENT '',
  `install1` DATE NULL COMMENT '',
  `install2` DATE NULL COMMENT '',
  PRIMARY KEY (`term_id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`student_scholar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student_scholar` (
  `student_scholar_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `student_id` INT NOT NULL COMMENT '',
  `term_id` INT NOT NULL COMMENT '',
  `cgpa_status` VARCHAR(255) NOT NULL COMMENT '',
  `sa_hour` DECIMAL NOT NULL COMMENT '',
  `is_deleted` VARCHAR(255) NULL COMMENT '',
  PRIMARY KEY (`student_scholar_id`)  COMMENT '',
  INDEX `fk_student_scholar_student_idx` (`student_id` ASC)  COMMENT '',
  INDEX `fk_student_scholar_term1_idx` (`term_id` ASC)  COMMENT '',
  UNIQUE INDEX `student_id_UNIQUE` (`student_id` ASC)  COMMENT '',
  CONSTRAINT `fk_student_scholar_student`
    FOREIGN KEY (`student_id`)
    REFERENCES `mydb`.`student` (`student_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_student_scholar_term1`
    FOREIGN KEY (`term_id`)
    REFERENCES `mydb`.`term` (`term_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`job_post`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`job_post` (
  `job_post_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `dept_id` INT NOT NULL COMMENT '',
  `student_scholar_id` INT NOT NULL COMMENT '',
  `job_title` VARCHAR(255) NOT NULL COMMENT '',
  `job_created` TIMESTAMP NOT NULL COMMENT '',
  `reservation_date_start` DATE NOT NULL COMMENT '',
  `reservation_date_end` DATE NOT NULL COMMENT '',
  `reservation_time_in` TIME NOT NULL COMMENT '',
  `reservation_time_out` TIME NOT NULL COMMENT '',
  `no_of_sa` VARCHAR(255) NOT NULL COMMENT '',
  `scope_of_work` VARCHAR(255) NOT NULL COMMENT '',
  `status` VARCHAR(255) NULL COMMENT '',
  PRIMARY KEY (`job_post_id`)  COMMENT '',
  INDEX `fk_job_post_dept1_idx` (`dept_id` ASC)  COMMENT '',
  INDEX `fk_job_post_student_scholar1_idx` (`student_scholar_id` ASC)  COMMENT '',
  CONSTRAINT `fk_job_post_dept1`
    FOREIGN KEY (`dept_id`)
    REFERENCES `mydb`.`dept` (`dept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_job_post_student_scholar1`
    FOREIGN KEY (`student_scholar_id`)
    REFERENCES `mydb`.`student_scholar` (`student_scholar_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`request_job`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`request_job` (
  `request_job_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `dept_id` INT NOT NULL COMMENT '',
  `student_scholar_id` INT NOT NULL COMMENT '',
  `request_created` TIMESTAMP NOT NULL COMMENT '',
  `request_date_start` DATE NOT NULL COMMENT '',
  `request_date_end` DATE NOT NULL COMMENT '',
  `request_time_in` TIME NOT NULL COMMENT '',
  `request_time_out` TIME NOT NULL COMMENT '',
  `is_approved` VARCHAR(255) NULL COMMENT '',
  PRIMARY KEY (`request_job_id`)  COMMENT '',
  INDEX `fk_request_job_dept1_idx` (`dept_id` ASC)  COMMENT '',
  INDEX `fk_request_job_student_scholar1_idx` (`student_scholar_id` ASC)  COMMENT '',
  CONSTRAINT `fk_request_job_dept1`
    FOREIGN KEY (`dept_id`)
    REFERENCES `mydb`.`dept` (`dept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_request_job_student_scholar1`
    FOREIGN KEY (`student_scholar_id`)
    REFERENCES `mydb`.`student_scholar` (`student_scholar_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`record`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`record` (
  `record_id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `dept_id` INT NOT NULL COMMENT '',
  `job_post_id` INT NOT NULL COMMENT '',
  `request_job_id` INT NOT NULL COMMENT '',
  `student_scholar_id` INT NOT NULL COMMENT '',
  `record_date` TIMESTAMP NOT NULL COMMENT '',
  `record_time_in` TIME NOT NULL COMMENT '',
  `record_time_out` TIME NOT NULL COMMENT '',
  `hours_rendered` DECIMAL NOT NULL COMMENT '',
  `scope_of_work` VARCHAR(255) NOT NULL COMMENT '',
  `is_approved` VARCHAR(255) NULL COMMENT '',
  PRIMARY KEY (`record_id`)  COMMENT '',
  INDEX `fk_record_dept1_idx` (`dept_id` ASC)  COMMENT '',
  INDEX `fk_record_request_job1_idx` (`request_job_id` ASC)  COMMENT '',
  INDEX `fk_record_job_post1_idx` (`job_post_id` ASC)  COMMENT '',
  INDEX `fk_record_student_scholar1_idx` (`student_scholar_id` ASC)  COMMENT '',
  CONSTRAINT `fk_record_dept1`
    FOREIGN KEY (`dept_id`)
    REFERENCES `mydb`.`dept` (`dept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_record_request_job1`
    FOREIGN KEY (`request_job_id`)
    REFERENCES `mydb`.`request_job` (`request_job_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_record_job_post1`
    FOREIGN KEY (`job_post_id`)
    REFERENCES `mydb`.`job_post` (`job_post_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_record_student_scholar1`
    FOREIGN KEY (`student_scholar_id`)
    REFERENCES `mydb`.`student_scholar` (`student_scholar_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
