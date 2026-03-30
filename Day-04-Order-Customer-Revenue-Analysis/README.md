# 📊 Day 04 — Order & Customer Revenue Analysis

## 📌 Project Overview
In this project, I analyzed customer order data to understand revenue generation, customer value, and product performance. The goal was to connect customer data with order data and identify key business drivers.

---

## 🧰 Tools Used
- PostgreSQL
- SQL (JOIN, GROUP BY, SUM, ORDER BY)
- Visual Studio Code
- GitHub

---

## 📂 Dataset
The dataset includes:

Customers Table:
- customer_id
- customer_name

Orders Table:
- order_id
- customer_id
- product
- price
- quantity

---

## 🎯 Business Questions
- Which customers generate the most revenue?
- Which products generate the most revenue?
- How are customers connected to their purchases?
- Who are the highest-value customers?

---

✅ Answers
- Customer revenue can be calculated by connecting customer records to order data and summing purchase values.
- The highest-value customers are those with the largest total purchase amounts.
- Product revenue varies based on both price and quantity sold.
- Joining customer and order tables makes it possible to analyze purchasing behavior at the customer level.

--- 

📈 Key Insights
A small number of customers contribute the largest share of revenue.
High-value customers are important to track for retention and repeat business.
Product performance varies significantly, which can help guide product strategy and sales focus.
Joining tables is essential for solving real business questions that cannot be answered from one table alone.

## 🧠 SQL Queries Used

### Customer Purchases
```sql
SELECT customers.customer_name, orders.product
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id;