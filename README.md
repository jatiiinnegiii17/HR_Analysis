# HR Analytics  — SQL & PYTHON


## Overview
Analyzed a 2M-row HR dataset from Kaggle to uncover attrition drivers, 
compensation trends, and hiring patterns, then built an interactive 
dashboard for stakeholder-ready insights.

## Tech Stack
MySQL

## Dataset
[Walmart dataset]
2,000,000 rows | Employee-level HR records (department, salary, 
performance, tenure, status, location)

## Data Cleaning
- Removed duplicate employee records
- Fixed inconsistent categorical values (e.g. 'sales' → 'Sales')
- Handled blank performance ratings (labeled as 'Not Rated')
- Removed invalid age/salary/experience outliers
- Dropped redundant column, added indexes for query performance
→ Final dataset: [1994246] after cleaning (from 2,000,000)

## Key Business Questions Answered
- What departments have the highest attrition rate?
- How does salary vary by job level and work mode?
- Is there a correlation between performance rating and salary?
- What are the hiring trends over time?

