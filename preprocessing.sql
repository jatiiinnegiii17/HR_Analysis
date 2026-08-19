-- Backup
CREATE TABLE hr_clean_backup AS SELECT * FROM hr_clean;

-- Row count
SELECT COUNT(*) AS total_rows FROM hr_clean;

-- Null check
SELECT 
  COUNT(*) - COUNT(employee_id) AS null_employee_id,
  COUNT(*) - COUNT(full_name) AS null_full_name,
  COUNT(*) - COUNT(department) AS null_department,
  COUNT(*) - COUNT(job_title) AS null_job_title,
  COUNT(*) - COUNT(hire_date) AS null_hire_date,
  COUNT(*) - COUNT(performance_rating) AS null_performance_rating,
  COUNT(*) - COUNT(experience_years) AS null_experience_years,
  COUNT(*) - COUNT(status) AS null_status,
  COUNT(*) - COUNT(work_mode) AS null_work_mode,
  COUNT(*) - COUNT(salary) AS null_salary,
  COUNT(*) - COUNT(country) AS null_country,
  COUNT(*) - COUNT(city) AS null_city,
  COUNT(*) - COUNT(age) AS null_age,
  COUNT(*) - COUNT(job_level) AS null_job_level
FROM hr_clean;

-- Distinct value check
SELECT DISTINCT department FROM hr_clean;
SELECT DISTINCT job_title FROM hr_clean;
SELECT DISTINCT performance_rating FROM hr_clean;
SELECT DISTINCT work_mode FROM hr_clean;
SELECT DISTINCT status FROM hr_clean;
SELECT DISTINCT country FROM hr_clean;
SELECT DISTINCT city FROM hr_clean;
SELECT DISTINCT job_level FROM hr_clean;

-- Duplicate check
SELECT employee_id, COUNT(*) AS occurrence_count
FROM hr_clean
GROUP BY employee_id
HAVING COUNT(*) > 1
ORDER BY occurrence_count DESC;

-- Outlier check
SELECT MIN(age), MAX(age), AVG(age) FROM hr_clean;
SELECT MIN(salary), MAX(salary), AVG(salary) FROM hr_clean;
SELECT MIN(experience_years), MAX(experience_years) FROM hr_clean;

-- Fix categorical inconsistency
UPDATE hr_clean 
SET department = 'Sales' 
WHERE department = 'sales';

-- Remove duplicates
DELETE t1 
FROM hr_clean t1
INNER JOIN hr_clean t2 
WHERE t1.employee_id = t2.employee_id 
AND t1.employee_id > t2.employee_id;

-- Remove invalid age rows
DELETE FROM hr_clean 
WHERE age < 18 OR age > 70;

-- Remove invalid salary rows
DELETE FROM hr_clean 
WHERE salary <= 0;

-- Remove invalid experience_years rows
DELETE FROM hr_clean 
WHERE experience_years < 0 OR experience_years > age;

-- Drop redundant column
ALTER TABLE hr_clean DROP COLUMN year;

-- Final row count
SELECT COUNT(*) AS final_row_count FROM hr_clean;

-- Add indexes
CREATE INDEX idx_department ON hr_clean(department);
CREATE INDEX idx_status ON hr_clean(status);
CREATE INDEX idx_hire_year ON hr_clean(hire_year);
CREATE INDEX idx_job_level ON hr_clean(job_level);

-- View final cleaned data
SELECT * FROM hr_clean;
