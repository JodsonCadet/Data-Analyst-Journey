CREATE TABLE support_tickets (
    ticket_id SERIAL PRIMARY KEY,
    customer_name TEXT,
    issue_type TEXT,
    priority TEXT,
    agent_name TEXT,
    status TEXT
);

INSERT INTO support_tickets (customer_name, issue_type, priority, agent_name, status)
VALUES
('Alice', 'Login Issue', 'High', 'Mia', 'Closed'),
('Bob', 'Payment Error', 'High', 'James', 'Open'),
('Charlie', 'Bug Report', 'Medium', 'Mia', 'Closed'),
('David', 'Account Access', 'High', 'Sophia', 'Closed'),
('Emma', 'Feature Request', 'Low', 'James', 'Open'),
('Frank', 'Login Issue', 'Medium', 'Sophia', 'Closed'),
('Grace', 'Payment Error', 'High', 'Mia', 'Closed'),
('Henry', 'Bug Report', 'Medium', 'James', 'Open'),
('Isabella', 'Account Access', 'High', 'Sophia', 'Closed'),
('Jack', 'Feature Request', 'Low', 'Mia', 'Closed');

SELECT * FROM support_tickets;

SELECT  issue_type, COUNT(*) AS ticket_count
FROM support_tickets
GROUP BY issue_type
ORDER BY ticket_count DESC;

SELECT agent_name, COUNT(*) AS tickets_closed
FROM support_tickets
WHERE status = 'Closed'
GROUP BY agent_name
ORDER BY tickets_closed DESC;

SELECT priority, COUNT(*) AS total_tickets
FROM support_tickets
GROUP BY priority
ORDER BY total_tickets DESC;

SELECT status, COUNT(*) AS total_tickets
FROM support_tickets
GROUP BY status;

SELECT 
    customer_name,
    issue_type,
    priority,
    agent_name,
    CASE 
        WHEN priority = 'High' THEN 'Urgent'
        Else 'Standard'
    END AS urgency_level
FROM support_tickets;