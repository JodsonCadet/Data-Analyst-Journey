CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name TEXT
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    product TEXT,
    price INTEGER,
    quantity INTEGER
);

INSERT INTO customers (customer_name)
VALUES
('Alice'),
('Bob'),
('Charlie'),
('David');

INSERT INTO orders (customer_id, product, price, quantity)
VALUES
(1, 'Laptop', 1000, 1),
(1, 'Mouse', 50, 2),
(2, 'Phone', 500, 1),
(3, 'Tablet', 300, 3),
(4, 'Monitor', 400, 1),
(2, 'Keyboard', 80, 2);

SELECT customers.customer_name, orders.product
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id;

SELECT 
    customers.customer_name,
    orders.product,
    orders.price * orders.quantity AS revenue
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id;

SELECT 
    customers.customer_name,
    SUM(orders.price * orders.quantity) AS total_revenue
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_name
ORDER BY total_revenue DESC;

SELECT 
    product,
    SUM(price * quantity) AS total_revenue
FROM orders
GROUP BY product
ORDER BY total_revenue DESC;