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
