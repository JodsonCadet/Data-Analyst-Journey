CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name TEXT,
    department TEXT,
    job_title TEXT,
    salary INTEGER,
    years_at_company INTEGER
);

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


SELECT * FROM employees;    