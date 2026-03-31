# 📊 Day 05 — Support Ticket Analysis

## 📌 Project Overview
In this project, I analyzed customer support ticket data to understand issue volume, team workload, and ticket status distribution. The goal was to identify the most common support issues, evaluate agent performance, and understand which ticket priorities create the most operational workload.

---

## 🧰 Tools Used
- PostgreSQL
- SQL (GROUP BY, COUNT, WHERE, CASE WHEN, ORDER BY)
- Visual Studio Code
- GitHub

---

## 📂 Dataset
The dataset includes:
- ticket_id
- customer_name
- issue_type
- priority
- agent_name
- status

---

## 🎯 Business Questions
- Which issue types occur the most?
- Which support agents close the most tickets?
- Which priority level creates the most workload?
- How many tickets are open vs closed?
- How can tickets be classified by urgency?

---

✅ Answers
- Support ticket volume can be measured by grouping tickets by issue type.
- Agent performance can be evaluated by counting how many closed tickets each agent handled.
- Ticket workload can be analyzed by grouping tickets by priority level.
- Open vs closed ticket counts help measure team backlog.
- CASE WHEN can be used to simplify ticket categories into urgency levels.

--- 

📈 Key Insights
- Certain issue types appear more frequently and may point to recurring product or system problems.
- Agents with more closed tickets may be handling higher support volume or resolving issues faster.
- High-priority tickets are especially important because they affect urgent customer needs.
- Ticket status analysis helps leadership understand whether the support team is keeping up with demand.
- Ticket classification makes reporting easier and helps teams prioritize work.

## 🧠 SQL Queries Used

### Issue Type Volume
```sql
SELECT 
    issue_type,
    COUNT(*) AS total_tickets
FROM support_tickets
GROUP BY issue_type
ORDER BY total_tickets DESC;