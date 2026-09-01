create database hr_dataset;
use hr_dataset;

CREATE TABLE hr_data (
    `employee_id` INT PRIMARY KEY,
    `full_name` VARCHAR(100),
     `department` VARCHAR(100),
     `job_title` VARCHAR(100),
     `hire_date` DATE,
     `performance_rating` DECIMAL(3,2),
     `experience_years` DECIMAL(4,1),
     `status` VARCHAR(20),
     `work_mode` VARCHAR(20),
    `salary` DECIMAL(12,2),
    `year` INT,
     `country` VARCHAR(100),
    `city` VARCHAR(100),
     `age` INT,
    `job_level` VARCHAR(50),
     `hire_year` INT
 );

ALTER TABLE hr_data 
  MODIFY employee_id VARCHAR(15) NOT NULL,
  MODIFY performance_rating VARCHAR(20);



LOAD DATA LOCAL INFILE 'D:/Data Analyst/Hr_analysis/hr_clean.csv'
INTO TABLE hr_data
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
  employee_id, full_name, department, job_title, hire_date,
  performance_rating, experience_years, status, work_mode,
  salary, year, country, city, age, job_level, hire_year
);



