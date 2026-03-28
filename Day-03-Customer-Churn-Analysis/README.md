# 📊 Day 03 — Customer Churn & Retention Analysis

## 📌 Project Overview
In this project, I analyzed customer subscription data to understand customer churn, retention, and revenue distribution. The goal was to identify high-value customers, determine which subscription types generate the most revenue, and classify customers based on activity.

---

## 🧰 Tools Used
- PostgreSQL
- SQL (CASE WHEN, GROUP BY, ORDER BY)
- Visual Studio Code
- GitHub

---

## 📂 Dataset
The dataset includes customer subscription information with the following columns:

- customer_id
- customer_name
- signup_date
- last_active_date
- subscription_type
- monthly_fee

---

## 🎯 Business Questions
- How many customers are active vs churned? 
- Which subscription type generates the most revenue?
- Who are the highest-value customers?
- How is revenue distributed across subscription types?

Answers to Business Questions
- Premium subscriptions generate the highest total revenue ($150), followed by   Standard ($70) and Basic ($60).
- High-value customers are those subscribed to Premium plans, as they contribute the most revenue.
- Customers were classified as Active or Churned based on their last activity date.
- Revenue distribution shows that higher-tier subscription plans significantly outperform lower-tier plans.

---

📈 Key Insights
Premium customers are the most valuable segment, contributing the majority of revenue.
Lower-tier subscription plans generate less revenue, indicating potential opportunities for upselling.
Identifying churned customers allows the business to implement retention strategies.
Customer segmentation using SQL enables better decision-making and targeted marketing efforts.

## 🧠 SQL Queries Used

###. 
```sql

### 1. Classify Customers (Active vs Churned)
 
 SELECT 
    customer_name,
    last_active_date,
    CASE 
        WHEN last_active_date >= '2024-01-01' THEN 'Active'
        ELSE 'Churned'
    END AS customer_status
FROM customers;

### 2. Count Active vs Churned Customers

SELECT 
    CASE 
        WHEN last_active_date >= '2024-01-01' THEN 'Active'
        ELSE 'Churned'
    END AS customer_status,
    COUNT(*) AS total_customers
FROM customers
GROUP BY customer_status;

### 3. Revenue by Subscription Type

SELECT 
    subscription_type,
    SUM(monthly_fee) AS total_revenue
FROM customers
GROUP BY subscription_type
ORDER BY total_revenue DESC;

### 4. Highest Value Customers

SELECT 
    customer_name,
    subscription_type,
    monthly_fee
FROM customers
ORDER BY monthly_fee DESC;