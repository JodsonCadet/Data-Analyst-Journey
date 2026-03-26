-- Create table
CREATE TABLE sales (
    id INTEGER PRIMARY KEY,
    product TEXT,
    price INTEGER,
    quantity INTEGER
);

-- Insert data
INSERT INTO sales (product, price, quantity) VALUES
('Laptop', 1000, 2),
('Phone', 500, 5),
('Tablet', 300, 3),
('Monitor', 400, 4);

-- View all data
SELECT * FROM sales;

-- Select specific columns
SELECT product, price FROM sales;

-- Filter data
SELECT * FROM sales WHERE price > 400;

-- Calculate revenue
SELECT product, price, quantity, price * quantity AS revenue FROM sales;

-- High revenue products
SELECT product, price * quantity AS revenue 
FROM sales 
WHERE price * quantity > 1000;
