


-- Question 1: What is the total headcount by department?
-- select department,count(*) as headcount from hr_raw_data group by department order by headcount desc;

-- Question 2: What is the age distribution of employees (grouped into bands: 20-30, 31-40, 41-50, etc.)?
-- select case 
-- when age between 20 and 30 then '20-30'
-- when age between 31 and 40 then '31-40'
-- when age between 41 and 50 then '41-50'
-- else '51+'
-- end as age_band,
-- count(*) as headcount
-- from hr_raw_data 
-- group by age_band;

-- Question 3: What is the headcount split by job_level (Junior/Mid/Senior/Executive)?
-- select count(employee_id) as headcount,job_level from hr_raw_data group by job_level;

-- Question 4: What is the headcount by country and city?
-- select country,city,count(*) as headcount from hr_raw_data group by country, city order by country;

-- Question 5: What is the ratio of Active vs Resigned employees overall and by department?
-- select status,count(status) as employee_count from hr_raw_data group by status;

-- Question 6: What is the average salary by department?
-- select department,round(avg(salary),2) as avg_salary from hr_raw_data group by department;

-- Question 7: What is the average salary by job_level?
-- select job_level,round(avg(salary),2) as avg_salary from hr_raw_data group by job_level;

-- Question 8: What is the average salary by job_title (top 10 highest-paid roles)?
-- select job_title,round(avg(salary),2) as avg_salary from hr_raw_data group by job_title order by avg_salary desc limit 10;

-- Question 9: Is there a salary gap between work_mode types (Remote vs Hybrid vs On-site)?
-- select work_mode,round(avg(salary),2) as avg_salary from hr_raw_data group by work_mode;

-- Question 10: What is the salary range (min/max/avg) by country?
-- select country,min(salary) as min_salary,max(salary) as max_salary,round(avg(salary),2) as avg_salary from hr_raw_data group by country; 

-- Question 11: How does salary correlate with experience_years?
-- select case 
-- when experience_years between 0 and 5 then '0-5 yrs'
-- when experience_years between 6 and 10 then '6-10 yrs'
-- when experience_years between 11 and 15 then '11-15 yrs'
-- when experience_years between 16 and 20 then '16-20 yrs'
-- when experience_years between 21 and 25 then '21-25 yrs'
-- else '26+ yrs'
-- end as experience_band,
-- round(avg(salary),2) as avg_salary
-- from hr_raw_data
-- group by experience_band
-- order by experience_band;

-- Question 12: What is the distribution of performance_rating across the company?
-- select performance_rating,count(performance_rating)as rating_counts from hr_raw_data group by performance_rating; 

-- I realised that data have some blank value so i checked it with below command
-- SELECT * FROM hr_raw_data WHERE performance_rating = '' LIMIT 10;

-- so i replaced the blank space with not rated by the below querie
-- UPDATE hr_raw_data 
-- SET performance_rating = 'Not Rated' 
-- WHERE performance_rating = '';

-- Question 13: Which departments have the highest proportion of "Excellent" ratings?
-- SELECT department,
--   COUNT(*) AS total_employees,
--   SUM(CASE WHEN performance_rating = 'Excellent' THEN 1 ELSE 0 END) AS excellent_count,
--   ROUND(SUM(CASE WHEN performance_rating = 'Excellent' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS excellent_pct
-- FROM hr_raw_data
-- GROUP BY department
-- ORDER BY excellent_pct DESC;

-- Question 14: Is there a relationship between performance_rating and salary (do top performers earn more)?
-- select performance_rating ,round(avg(salary),2) as avg_salary from hr_raw_data group by performance_rating;
-- select * from hr_raw_data;

-- Question 15: Which job_levels have the most "Needs Improvement" ratings?
-- select job_level,count(*) as need_improvement_counts from hr_raw_data where performance_rating ='Needs Improvement' group by job_level order by need_improvement_counts desc;

-- Question 16: What is the attrition rate (% Resigned) by department?

-- select department,
--    SUM(CASE WHEN status = 'Resigned' THEN 1 ELSE 0 END) AS resigned_count,
--   ROUND(SUM(CASE WHEN status = 'Resigned' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS resigned_pct
--   from hr_raw_data group by department;

-- Question 17: What is the attrition rate by job_level?
-- SELECT job_level,
--   SUM(CASE WHEN status = 'Resigned' THEN 1 ELSE 0 END) AS resigned_count,
--   ROUND(SUM(CASE WHEN status = 'Resigned' THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS resigned_pct
-- FROM hr_raw_data 
-- GROUP BY job_level
-- ORDER BY resigned_pct DESC;

-- Question 18: Does work_mode affect attrition rate (are remote employees more likely to resign)?


















