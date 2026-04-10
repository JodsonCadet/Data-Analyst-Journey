-- UberEats Customer Behavior & Marketing Analysis
-- Author: Jodson Cadet
-- Date: April 2026

-- Query 1: Total Revenue by Food Category
SELECT
    food_category,
    SUM(order_value) AS total_revenue,
    COUNT(*) AS total_orders,
    ROUND(AVG(order_value), 2) AS avg_order_value
FROM orders
WHERE order_status = 'Completed'
GROUP BY food_category
ORDER BY total_revenue DESC;

-- Query 2: Total Orders and Revenue by City
SELECT
    city,
    COUNT(*) AS total_orders,
    SUM(order_value) AS total_revenue,
    ROUND(AVG(rating), 2) AS avg_rating
FROM orders
WHERE order_status = 'Completed'
GROUP BY city
ORDER BY total_revenue DESC;

-- Query 3: Orders by Time of Day
SELECT
    time_of_day,
    COUNT(*) AS total_orders,
    ROUND(AVG(order_value), 2) AS avg_order_value,
    SUM(order_value) AS total_revenue
FROM orders
WHERE order_status = 'Completed'
GROUP BY time_of_day
ORDER BY total_orders DESC;

-- Query 4: Revenue Category Breakdown
SELECT
    revenue_category,
    COUNT(*) AS total_orders,
    SUM(order_value) AS total_revenue,
    ROUND(AVG(rating), 2) AS avg_rating
FROM orders
WHERE order_status = 'Completed'
GROUP BY revenue_category
ORDER BY total_revenue DESC;

-- Query 5: Order Status Breakdown
SELECT
    order_status,
    COUNT(*) AS total_orders,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- Query 6: Top 10 Customers by Spending
SELECT
    customer_id,
    COUNT(*) AS total_orders,
    SUM(order_value) AS total_spent,
    ROUND(AVG(rating), 2) AS avg_rating
FROM orders
WHERE order_status = 'Completed'
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- Query 7: Monthly Revenue Trend
SELECT
    DATE_TRUNC('month', order_date) AS month,
    COUNT(*) AS total_orders,
    SUM(order_value) AS total_revenue
FROM orders
WHERE order_status = 'Completed'
GROUP BY month
ORDER BY month ASC;