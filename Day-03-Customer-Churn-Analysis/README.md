
---

# 📂 🔹 PROJECT 3 — CHURN ANALYSIS (UPDATED README)

```md
# 📊 Day 03 — Customer Churn & Retention Analysis

## 📌 Project Overview
In this project, I analyzed customer subscription data to identify churn behavior, revenue distribution, and high-value customer segments. The goal was to understand customer retention and revenue drivers.

---

## 🧰 Tools Used
- PostgreSQL
- SQL (CASE WHEN, GROUP BY, SUM)
- Visual Studio Code
- GitHub

---

## 📂 Dataset
The dataset includes:
- customer_name
- signup_date
- last_active_date
- subscription_type
- monthly_fee

---

## 🎯 Business Questions
- How many customers are active vs churned?
- What is the churn rate?
- Which subscription type generates the most revenue?
- Who are the highest-value customers?

✅ Answers
Customers were classified as Active or Churned based on activity.
Churn rate was calculated as a percentage of inactive users.
Premium subscriptions generated the highest revenue.
High-value customers are those on higher-tier subscription plans.

---

📈 Key Insights
- Premium customers drive the majority of revenue.
- Churn analysis helps identify at-risk users.
- Subscription tier strongly impacts revenue contribution.

## 🧠 SQL Queries Used

### Customer Classification
```sql
SELECT 
    customer_name,
    CASE 
        WHEN last_active_date >= '2024-01-01' THEN 'Active'
        ELSE 'Churned'
    END AS customer_status
FROM customers;