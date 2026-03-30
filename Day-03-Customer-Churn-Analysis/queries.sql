CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name TEXT,
    signup_date DATE, 
    last_active_date DATE,
    subscription_type TEXT,
    monthly_fee INTEGER     
);

INSERT INTO customers (customer_name, signup_date, last_active_date, subscription_type, monthly_fee)
VALUES
('Alice', '2023-01-01', '2024-01-01', 'Premium', 50),
('Bob', '2023-03-15', '2023-10-01', 'Basic', 20),
('Charlie', '2022-06-10', '2024-02-15', 'Premium', 50),
('David', '2023-07-20', '2023-08-15', 'Basic', 20);
('Emma', '2022-09-05', '2024-03-01', 'Standard', 35),
('Frank', '2023-11-11', '2024-03-01', 'Premium', 50),
('Grace', '2022-12-25', '2023-12-01', 'Standard', 35),
('Henry', '2023-05-10', '2024-01-20', 'Basic', 20);


SELECT customers
FROM customers; 

SELECT 
    customer_name,
    last_active_date,
    CASE
        WHEN last_active_date >= '2024-01-01' THEN 'Active'
        ELSE 'CHURNED'
    END AS customer_status
FROM customers;


SELECT
     CASE 
         WHEN last_active_date >= '2024-01-01' THEN 'Active'
         ELSE 'CHURNED' 
     END AS customer_status,
     COUNT(*) AS total_customers
FROM customers
GROUP BY customer_status;

SELECT 
    COUNT(CASE WHEN last_active_date < '2024-01-01' THEN 1 END) * 100.0 / COUNT(*) AS churn_rate
FROM customers;
     

SELECT 
    subscription_type,
    SUM(monthly_fee) AS total_revenue
FROM customers
GROUP BY subscription_type
ORDER BY total_revenue DESC;
        
SELECT
    customer_name,
    subscription_type,
    monthly_fee
FROM customers
ORDER BY monthly_fee DESC;