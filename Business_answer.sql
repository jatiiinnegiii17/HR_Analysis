-- Question 1: What is the total headcount by department?
SELECT department, COUNT(*) AS headcount
FROM hr_clean
GROUP BY department
ORDER BY headcount DESC;


-- Question 2: What is the age distribution of employees (grouped into bands: 20-30, 31-40, 41-50, etc.)?
SELECT CASE 
    WHEN age BETWEEN 20 AND 30 THEN '20-30'
    WHEN age BETWEEN 31 AND 40 THEN '31-40'
    WHEN age BETWEEN 41 AND 50 THEN '41-50'
    ELSE '51+'
END AS age_band,
COUNT(*) AS headcount
FROM hr_clean 
GROUP BY age_band;


-- Question 3: What is the headcount split by job_level (Junior/Mid/Senior/Executive)?
SELECT COUNT(employee_id) AS headcount, job_level
FROM hr_clean
GROUP BY job_level;


-- Question 4: What is the headcount by country and city?
SELECT country, city, COUNT(*) AS headcount
FROM hr_clean
GROUP BY country, city
ORDER BY country;


-- Question 5: What is the ratio of Active vs Resigned employees overall and by department?
SELECT status, COUNT(status) AS employee_count
FROM hr_clean
GROUP BY status;


-- Question 6: What is the average salary by department?
SELECT department, ROUND(AVG(salary), 2) AS avg_salary
FROM hr_clean
GROUP BY department;


-- Question 7: What is the average salary by job_level?
SELECT job_level, ROUND(AVG(salary), 2) AS avg_salary
FROM hr_clean
GROUP BY job_level;


-- Question 8: What is the average salary by job_title (top 10 highest-paid roles)?
SELECT job_title, ROUND(AVG(salary), 2) AS avg_salary
FROM hr_clean
GROUP BY job_title
ORDER BY avg_salary DESC
LIMIT 10;


-- Question 9: Is there a salary gap between work_mode types (Remote vs Hybrid vs On-site)?
SELECT work_mode, ROUND(AVG(salary), 2) AS avg_salary
FROM hr_clean
GROUP BY work_mode;


-- Question 10: What is the salary range (min/max/avg) by country?
SELECT country,
       MIN(salary) AS min_salary,
       MAX(salary) AS max_salary,
       ROUND(AVG(salary), 2) AS avg_salary
FROM hr_clean
GROUP BY country;


-- Question 11: How does salary correlate with experience_years?
SELECT CASE 
    WHEN experience_years BETWEEN 0 AND 5 THEN '0-5 yrs'
    WHEN experience_years BETWEEN 6 AND 10 THEN '6-10 yrs'
    WHEN experience_years BETWEEN 11 AND 15 THEN '11-15 yrs'
    WHEN experience_years BETWEEN 16 AND 20 THEN '16-20 yrs'
    WHEN experience_years BETWEEN 21 AND 25 THEN '21-25 yrs'
    ELSE '26+ yrs'
END AS experience_band,
ROUND(AVG(salary), 2) AS avg_salary
FROM hr_clean
GROUP BY experience_band
ORDER BY experience_band;


-- Question 12: What is the distribution of performance_rating across the company?
SELECT performance_rating,
       COUNT(performance_rating) AS rating_counts
FROM hr_clean
GROUP BY performance_rating;


-- Check blank performance_rating values
SELECT *
FROM hr_clean
WHERE performance_rating = ''
LIMIT 10;


-- Replace blank performance_rating with Not Rated
UPDATE hr_clean 
SET performance_rating = 'Not Rated' 
WHERE performance_rating = '';


-- Question 13: Which departments have the highest proportion of "Excellent" ratings?
SELECT department,
       COUNT(*) AS total_employees,
       SUM(CASE WHEN performance_rating = 'Excellent' THEN 1 ELSE 0 END) AS excellent_count,
       ROUND(
           SUM(CASE WHEN performance_rating = 'Excellent' THEN 1 ELSE 0 END) 
           / COUNT(*) * 100, 
           2
       ) AS excellent_pct
FROM hr_clean
GROUP BY department
ORDER BY excellent_pct DESC;


-- Question 14: Is there a relationship between performance_rating and salary?
SELECT performance_rating,
       ROUND(AVG(salary), 2) AS avg_salary
FROM hr_clean
GROUP BY performance_rating;

SELECT *
FROM hr_clean;


-- Question 15: Which job_levels have the most "Needs Improvement" ratings?
SELECT job_level,
       COUNT(*) AS need_improvement_counts
FROM hr_clean
WHERE performance_rating = 'Needs Improvement'
GROUP BY job_level
ORDER BY need_improvement_counts DESC;


-- Question 16: What is the attrition rate (% Resigned) by department?
SELECT department,
       SUM(CASE WHEN status = 'Resigned' THEN 1 ELSE 0 END) AS resigned_count,
       ROUND(
           SUM(CASE WHEN status = 'Resigned' THEN 1 ELSE 0 END) 
           / COUNT(*) * 100, 
           2
       ) AS resigned_pct
FROM hr_clean
GROUP BY department;


-- Question 17: What is the attrition rate by job_level?
SELECT job_level,
       SUM(CASE WHEN status = 'Resigned' THEN 1 ELSE 0 END) AS resigned_count,
       ROUND(
           SUM(CASE WHEN status = 'Resigned' THEN 1 ELSE 0 END) 
           / COUNT(*) * 100, 
           2
       ) AS resigned_pct
FROM hr_clean 
GROUP BY job_level
ORDER BY resigned_pct DESC;


-- Question 18: Does work_mode affect attrition rate?
SELECT work_mode,
       SUM(CASE WHEN status = 'Resigned' THEN 1 ELSE 0 END) AS resigned_count,
       ROUND(
           SUM(CASE WHEN status = 'Resigned' THEN 1 ELSE 0 END) 
           / COUNT(*) * 100, 
           2
       ) AS resigned_pct
FROM hr_clean
GROUP BY work_mode
ORDER BY resigned_pct DESC;


-- Question 19: What is the average experience_years of employees who resigned vs those still active?
SELECT status,
       ROUND(AVG(experience_years), 2) AS avg_experience
FROM hr_clean
GROUP BY status;


-- Question 20: Which country/city has the highest attrition rate?
SELECT country,
       city,
       SUM(CASE WHEN status = 'Resigned' THEN 1 ELSE 0 END) AS total_resigned,
       ROUND(
           SUM(CASE WHEN status = 'Resigned' THEN 1 ELSE 0 END) 
           / COUNT(*) * 100, 
           2
       ) AS total_avg_resigned
FROM hr_clean
GROUP BY country, city
ORDER BY total_avg_resigned DESC;


-- Question 21: What is the year-over-year headcount growth (hires per hire_year)?
SELECT hire_year,
       COUNT(hire_year) AS total_count
FROM hr_clean
GROUP BY hire_year
ORDER BY hire_year;


-- Question 22: Which department has hired the most people in the last 3 years?
SELECT department,
       COUNT(*) AS recent_hires
FROM hr_clean
WHERE hire_year >= (
    SELECT MAX(hire_year) - 2
    FROM hr_clean
)
GROUP BY department
ORDER BY recent_hires DESC;


-- Question 23: What is the average experience_years of new hires over time?
SELECT hire_year,
       ROUND(AVG(experience_years), 2) AS avg_experience
FROM hr_clean
GROUP BY hire_year
ORDER BY hire_year ASC;


-- Question 24: What is the average tenure/experience by job_title?
SELECT job_title,
       ROUND(AVG(experience_years), 2) AS avg_experience_year
FROM hr_clean
GROUP BY job_title
ORDER BY avg_experience_year;


-- Question 25: What is the distribution of work_mode across departments?
SELECT department,
       work_mode,
       COUNT(*) AS headcount
FROM hr_clean
GROUP BY department, work_mode
ORDER BY department, headcount DESC;
