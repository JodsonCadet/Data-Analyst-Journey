-- Trading Performance Analysis
-- Author: Jodson Cadet
-- Date: April 2026

-- Query 1: Total Profit/Loss by Symbol
SELECT 
    symbol,
    SUM(amount) AS total_pnl,
    COUNT(*) AS total_trades
FROM trades
GROUP BY symbol
ORDER BY total_pnl DESC;

-- Query 2: Win vs Loss Count
SELECT
    action,
    COUNT(*) AS total_trades,
    SUM(amount) AS total_pnl
FROM trades
GROUP BY action
ORDER BY total_pnl DESC;

-- Query 3: Best Single Trade
SELECT
    trade_date,
    symbol,
    action,
    amount
FROM trades
ORDER BY amount DESC
LIMIT 1;

-- Query 4: Worst Single Trade
SELECT
    trade_date,
    symbol,
    action,
    amount
FROM trades
ORDER BY amount ASC
LIMIT 1;

-- Query 5: Total PnL by Month
SELECT
    DATE_TRUNC('month', trade_date) AS month,
    SUM(amount) AS monthly_pnl,
    COUNT(*) AS total_trades
FROM trades
GROUP BY month
ORDER BY month ASC;

-- Query 6: Most Traded Symbol
SELECT
    symbol,
    COUNT(*) AS total_trades
FROM trades
GROUP BY symbol
ORDER BY total_trades DESC;