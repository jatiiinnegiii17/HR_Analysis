# HR Analytics — SQL & Python

## Overview
Analyzed a 2M-row HR dataset from Kaggle to uncover attrition drivers, 
compensation trends, and hiring patterns using SQL for data cleaning and 
business analysis, and Python for visualization.

## Tech Stack
MySQL, Python (Pandas, NumPy, Matplotlib), Jupyter Notebook

## Dataset
[HR Dataset – Clean and Raw (2M Rows)](https://www.kaggle.com/datasets/rashadalaa/hr-dataset-clean-and-raw-2m-rows)
2,000,000 rows | Employee-level HR records (department, salary, 
performance, tenure, status, location)
Downloaded via [download_dataset.py](download_dataset.py)

## Files
- [download_dataset.py](download_dataset.py) — downloads the raw dataset from Kaggle
- [tables.sql](tables.sql) — table schema/creation
- [preprocessing.sql](preprocessing.sql) — data cleaning (duplicates, nulls, outliers, formatting fixes)
- [Business_answer.sql](Business_answer.sql) — 25 business questions (headcount, compensation, performance, attrition, hiring trends)
- [matplotlib_analysis.ipynb](matplotlib_analysis.ipynb) — Python visualizations on the cleaned dataset

## Data Cleaning
- Removed duplicate employee records
- Fixed inconsistent categorical values (e.g. 'sales' → 'Sales')
- Handled blank performance ratings (labeled as 'Not Rated')
- Removed invalid age/salary/experience outliers
- Fixed hidden formatting issues (trailing characters in job_level)
- Dropped redundant column, added indexes for query performance
→ Final dataset: 1,994,246 rows after cleaning (from 2,000,000)
→ See [preprocessing.sql](preprocessing.sql)

## Key Business Questions Answered
25 business questions covering headcount, compensation, performance, 
attrition, and hiring trends. Full list in 
[Business_answer.sql](Business_answer.sql). Highlights:
- What departments/job levels have the highest attrition rate?
- How does salary vary by department, job level, and job title?
- What are the hiring trends over time?

## Exploratory Analysis (Python)
Visualizations built on the full cleaned dataset — see 
[matplotlib_analysis.ipynb](matplotlib_analysis.ipynb) for all charts.

## Key Insights
- Junior-level employees have the highest attrition rate (13.10%) — over 4x 
  higher than Senior level (2.90%), and also earn the least on average (₹50,758)
- HR is both the lowest-paid department (₹74,584 avg) and has the highest 
  attrition rate (9.30%) — a possible retention risk area
- IT leads company-wide compensation (₹96,542 avg); all top 5 highest-paid 
  job titles are IT roles
- Work mode (Remote/Hybrid/On-site) has minimal impact on attrition (<0.25% spread)
- Hiring grew ~14x from 2009 to 2025, with Sales leading recent hiring activity

## How to Reproduce
1. Run download_dataset.py to fetch the raw dataset
2. Run tables.sql to create the table schema
3. Run preprocessing.sql to clean the data
4. Run Business_answer.sql for the full business analysis
5. Open matplotlib_analysis.ipynb in Jupyter for visuals
6. 

## Author
Jatin Negi
[GitHub](https://github.com/jatiiinnegiii17) | [LinkedIn](https://www.linkedin.com/in/jatin-negi-30a542250/)
