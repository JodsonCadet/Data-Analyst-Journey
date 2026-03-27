# 📊 Sales Performance & Revenue Insights Analysis

## 📌 Project Overview
In this project, I looked at sales data to figure out what products and regions make the most money.

The goal is to simulate a real-world business scenario where a data analyst provides insights to support decision-making.

---

## 🧠 Business Scenario
You are a data analyst at a retail company.

Your manager wants to understand:

- Which products generate the most revenue
- Which region performs best
- Which category drives the most sales
- How sales change over time

---

## 🛠 Tools Used
- PostgreSQL
- SQL (GROUP BY, SUM, ORDER BY, DATE_TRUNC)
- VS Code
- GitHub

---

## 📂 Dataset
The dataset contains sales transactions with the following columns:

- product → name of the product sold  
- category → product category (Electronics, Accessories)  
- region → sales location (North, South, East, West)  
- sale_date → date of the sale  
- revenue → revenue generated  

---

## 🎯 Business Questions
- Which products generate the most revenue? The Laptop is the top-performing product by total revenue.
- Which region performs best? Electronics is the highest-performing category, significantly outperforming Accessories
- Which category drives the most sales? The top-performing region generates the most revenue compared to others.
- How do sales change over time? Sales peaked in April and were lowest in March, showing fluctuations in performance over time.
 
---

## 📈 Key Insights

- I noticed that electronics generate most of the revenue, which makes sense since those products are higher in price.

- The IT category and certain regions bring in more revenue than others, which could mean those areas have stronger demand.

- Sales were highest in April and lowest in March, so revenue is not consistent month to month.

- From this, I can see that the company could focus more on high-performing products and regions to increase overall sales.

## 🧾 SQL Queries Used

### Total Revenue by Product
```sql
SELECT product, SUM(revenue) AS total_revenue
FROM sales_performance
GROUP BY product
ORDER BY total_revenue DESC;