
---

# 📂 🔹 PROJECT 2 — WORKFORCE ANALYSIS (UPDATED README)

```md
# 📊 Day 01 — Workforce Analysis

## 📌 Project Overview
In this project, I analyzed employee workforce data to evaluate department distribution, salary allocation, and workforce segmentation. The goal was to understand how resources are distributed across departments and identify cost-heavy teams.

---

## 🧰 Tools Used
- PostgreSQL
- SQL (GROUP BY, COUNT, SUM, AVG, CASE WHEN)
- Visual Studio Code
- GitHub

---

## 📂 Dataset
The dataset includes:
- employee_name
- department
- job_title
- salary
- years_at_company

---

## 🎯 Business Questions
- How many employees are in each department?
- Which department has the highest total salary?
- Which department has the highest average salary?
- How can employees be segmented based on salary?

✅ Answers
Each department contains an equal number of employees.
The IT department has the highest total salary, making it the most expensive department.
Average salary is highest in IT, followed by Sales and Marketing.
Employees can be segmented into high and standard salary groups for analysis.
---

📈 Key Insights
- IT is the highest-cost department due to higher salaries.
- Salary distribution varies significantly across departments.
- Workforce segmentation helps identify compensation trends and budget allocation.

## 🧠 SQL Queries Used

### Employee Count by Department
```sql
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;