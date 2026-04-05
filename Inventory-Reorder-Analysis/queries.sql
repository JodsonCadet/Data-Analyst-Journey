CREATE DATABASE inventory_analysis;

CREATE TABLE inventory (
    product_id SERIAL PRIMARY KEY,
    product_name TEXT,
    category TEXT,
    stock_quantity INTEGER,
    reorder_level INTEGER,
    supplier_name TEXT
);

INSERT INTO inventory (product_name, category, stock_quantity, reorder_level, supplier_name)
VALUES
('Laptop', 'Electronics', 12, 10, 'TechSupply Co'),
('Mouse', 'Electronics', 50, 20, 'TechSupply Co'),
('Keyboard', 'Electronics', 18, 15, 'InputWorld'),
('Office Chair', 'Furniture', 6, 8, 'Workspace Depot'),
('Desk', 'Furniture', 14, 5, 'Workspace Depot'),
('Notebook', 'Office Supplies', 100, 30, 'PaperGoods Inc'),
('Printer Ink', 'Office Supplies', 9, 12, 'PrintPlus'),
('Monitor', 'Electronics', 7, 10, 'ScreenHub'),
('Cabinet', 'Furniture', 3, 6, 'StorageMart'),
('Pens', 'Office Supplies', 200, 50, 'PaperGoods Inc');

-- Products that need to be reordered

SELECT
    product_name,
    stock_quantity,
    reorder_level
FROM inventory
WHERE stock_quantity < reorder_level;

-- Category with the highest total stock quantity

SELECT
    category,
    SUM(stock_quantity) AS total_stock
FROM inventory
GROUP BY category
ORDER BY total_stock DESC;

-- Supplier with the highest total stock supplied

SELECT
    supplier_name,
    SUM(stock_quantity) AS total_stock_supplied
FROM inventory
GROUP BY supplier_name
ORDER BY total_stock_supplied DESC;

-- Inventory status for each product

SELECT
    product_name,
    stock_quantity,
    reorder_level,
    CASE
        WHEN stock_quantity < reorder_level THEN 'Reorder Now'
        WHEN stock_quantity <= reorder_level + 5 THEN 'Low Stock Warning'
        ELSE 'Sufficient Stock'
    END AS inventory_status
FROM inventory;

-- Products with the largest gap between stock quantity and reorder level are overstocked and may require a sales promotion to reduce inventory 

SELECT
    product_name,
    stock_quantity,
    reorder_level,
    stock_quantity - reorder_level AS stock_gap
FROM inventory
ORDER BY stock_gap DESC;