-- HR Employee Attrition Analysis
-- Author: Jodson Cadet
-- Date: April 2026

-- Query 1: Attrition Rate by Department
SELECT
    department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate,
    SUM(attrition_cost) AS total_cost
FROM employees
GROUP BY department
ORDER BY attrition_rate DESC;

-- Query 2: Attrition Rate by Age Group
SELECT
    CASE
        WHEN age < 25 THEN 'Under 25'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY age_group
ORDER BY attrition_rate DESC;

-- Query 3: Attrition Rate by Job Level
SELECT
    job_level,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate,
    ROUND(AVG(monthly_income), 2) AS avg_monthly_income
FROM employees
GROUP BY job_level
ORDER BY attrition_rate DESC;

-- Query 4: Attrition Rate by Work Life Balance
SELECT
    work_life_balance,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY work_life_balance
ORDER BY work_life_balance ASC;

-- Query 5: Attrition Rate by Overtime
SELECT
    overtime,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate,
    SUM(attrition_cost) AS total_cost
FROM employees
GROUP BY overtime
ORDER BY attrition_rate DESC;

-- Query 6: Top 5 Job Roles with Highest Attrition
SELECT
    job_role,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate,
    SUM(attrition_cost) AS total_cost
FROM employees
GROUP BY job_role
ORDER BY attrition_rate DESC
LIMIT 5;

-- Query 7: Total Attrition Cost by Department
SELECT
    department,
    SUM(attrition_cost) AS total_attrition_cost,
    COUNT(CASE WHEN attrition = 'Yes' THEN 1 END) AS employees_lost
FROM employees
GROUP BY department
ORDER BY total_attrition_cost DESC;

-- Query 8: Attrition by Years at Company
SELECT
    CASE
        WHEN years_at_company < 2 THEN '0-1 Years'
        WHEN years_at_company BETWEEN 2 AND 5 THEN '2-5 Years'
        WHEN years_at_company BETWEEN 6 AND 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS tenure_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS attrition_count,
    ROUND(SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees
GROUP BY tenure_group
ORDER BY attrition_rate DESC;