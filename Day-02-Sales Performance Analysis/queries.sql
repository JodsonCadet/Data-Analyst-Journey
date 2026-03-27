CREATE TABLE sales_performance (
    sale_id SERIAL PRIMARY KEY,
    product TEXT,
    category TEXT,
    region TEXT,
    sale_date DATE,
    revenue INTEGER
);

INSERT INTO sales_performance (product, category, region, sale_date, revenue)
VALUES
('Laptop', 'Electronics', 'North', '2024-01-10', 1200),
('Phone', 'Electronics', 'South', '2024-01-15', 800),
('Tablet', 'Electronics', 'East', '2024-02-01', 600),
('Headphones', 'Accessories', 'West', '2024-02-10', 200),
('Monitor', 'Electronics', 'North', '2024-03-05', 400),
('Keyboard', 'Accessories', 'South', '2024-03-12', 150),
('Mouse', 'Accessories', 'East', '2024-03-18', 100),
('Laptop', 'Electronics', 'West', '2024-04-02', 1300),
('Phone', 'Electronics', 'North', '2024-04-10', 900),
('Tablet', 'Electronics', 'South', '2024-04-15', 700);

SELECT * FROM sales_performance;

SELECT product, SUM(revenue) AS total_revenue
FROM sales_performance
GROUP BY product
ORDER BY total_revenue DESC;

SELECT region, SUM(revenue) AS total_revenue
FROM sales_performance
GROUP BY region
ORDER BY total_revenue DESC;

SELECT category, SUM(revenue) AS total_revenue
FROM sales_performance
GROUP BY category
ORDER BY total_revenue DESC;

SELECT DATE_TRUNC('month', sale_date) AS month, SUM(revenue) AS total_revenue
FROM sales_performance
GROUP BY month
ORDER BY month;