-- Create table
CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name TEXT,
    department TEXT,
    job_title TEXT,
    salary INTEGER,
    years_at_company INTEGER
);

-- Insert data
INSERT INTO employees (employee_name, department, job_title, salary, years_at_company)
VALUES
('Alice Johnson', 'HR', 'HR Manager', 60000, 3),
('Bob Smith', 'Sales', 'Sales Executive', 75000, 5),
('Carol Davis', 'IT', 'IT Specialist', 90000, 4),
('David Lee', 'HR', 'HR Assistant', 65000, 2),
('Emma Brown', 'Sales', 'Sales Rep', 80000, 6),
('Frank Wilson', 'IT', 'IT Manager', 95000, 7),
('Grace Taylor', 'Marketing', 'Marketing Specialist', 70000, 3),
('Henry Moore', 'Marketing', 'Marketing Lead', 72000, 4);

-- View data
SELECT * FROM employees;

-- Filter + sort
SELECT employee_name, department, salary
FROM employees
WHERE salary > 70000
ORDER BY salary DESC;

-- Count employees per department
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- Total salary per department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC;

-- Average salary per department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

SELECT 
    employee_name,
    department,
    salary,
    CASE 
        WHEN salary > 80000 THEN 'High Salary'
        ELSE 'Standard Salary'
    END AS salary_level
FROM employees;