-- Basic selects
SELECT * FROM customers;
SELECT account_id, account_type, balance FROM accounts;

-- Filters
SELECT * FROM accounts WHERE status = 'ACTIVE';
SELECT * FROM accounts WHERE balance > 50000;
SELECT * FROM customers WHERE email LIKE '%gmail%';

-- Ordering + Top
SELECT TOP 1 account_id, balance FROM accounts ORDER BY balance ASC;
SELECT TOP 2 account_id, balance FROM accounts ORDER BY balance DESC;

-- Aggregations
SELECT account_type, SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type;

SELECT status, COUNT(*) AS account_count
FROM accounts
GROUP BY status
HAVING COUNT(*) > 1;

-- Joins
SELECT c.full_name, a.account_id, a.account_type, a.balance
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
WHERE a.status = 'ACTIVE';

-- Customers without accounts (anti join)
SELECT c.full_name
FROM customers c
LEFT JOIN accounts a ON c.customer_id = a.customer_id
WHERE a.account_id IS NULL;

-- Accounts without transactions
SELECT a.account_id
FROM accounts a
LEFT JOIN transactions t ON a.account_id = t.account_id
WHERE t.txn_id IS NULL;

-- UNION vs UNION ALL
SELECT country FROM customers
UNION
SELECT country FROM customers;

SELECT country FROM customers
UNION ALL
SELECT country FROM customers;

-- String functions
SELECT
  full_name,
  UPPER(full_name) AS name_upper,
  LOWER(full_name) AS name_lower,
  RIGHT(full_name, 2) AS last2,
  REPLACE(full_name, ' ', '_') AS name_snake,
  CONCAT(full_name, ' - ', email) AS name_email,
  TRIM(full_name) AS name_trimmed
FROM customers;

