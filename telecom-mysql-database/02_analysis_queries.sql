USE `telecom`;

-- Q1. Top 3 plans by number of subscriptions
SELECT p.plan_name, COUNT(s.subscription_id) AS total_subscriptions
FROM subscription s
JOIN plan p ON s.plan_id = p.plan_id
GROUP BY p.plan_name
ORDER BY total_subscriptions DESC
LIMIT 3;

-- Q2. Total billed revenue (all bills are for June 2025)
SELECT billing_month, SUM(total_amount) AS total_billed
FROM bill
GROUP BY billing_month;

-- Q3. Billed vs collected: revenue by bill status
SELECT status,
       COUNT(*)                                                   AS bills,
       SUM(total_amount)                                          AS amount,
       ROUND(100 * SUM(total_amount) / SUM(SUM(total_amount)) OVER (), 1) AS pct_of_billed
FROM bill
GROUP BY status
ORDER BY amount DESC;

-- Q4. Number of active customers (distinct customers, not subscriptions)
SELECT COUNT(DISTINCT p.customer_id) AS active_customers
FROM phone_number p
JOIN subscription s ON s.phone_id = p.phone_id
WHERE s.status = 'active';

-- Q5. Inactive customers: no active subscription on ANY of their numbers
SELECT c.customer_id, c.full_name, c.email
FROM customer c
WHERE NOT EXISTS (
    SELECT 1
    FROM phone_number p
    JOIN subscription s ON s.phone_id = p.phone_id
    WHERE p.customer_id = c.customer_id
      AND s.status = 'active'
);

-- Q6. Revenue by plan type
SELECT p.plan_type, SUM(b.total_amount) AS total_revenue
FROM bill b
JOIN subscription s ON b.subscription_id = s.subscription_id
JOIN plan p ON s.plan_id = p.plan_id
GROUP BY p.plan_type
ORDER BY total_revenue DESC;

-- Q7. Support tickets by issue type and status
SELECT issue_type,
       COUNT(*)                     AS tickets,
       SUM(status <> 'resolved')    AS unresolved
FROM support_ticket
GROUP BY issue_type
ORDER BY unresolved DESC, tickets DESC;

-- Q8. Customers with more than one phone number
SELECT c.customer_id, c.full_name, COUNT(p.phone_id) AS numbers
FROM customer c
JOIN phone_number p ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.full_name
HAVING COUNT(p.phone_id) > 1;

-- Q9. Data usage by plan (total and per session)
SELECT p.plan_name,
       SUM(d.mb_used)           AS total_mb,
       ROUND(AVG(d.mb_used), 1) AS avg_mb_per_session
FROM plan p
JOIN subscription s ON p.plan_id = s.plan_id
JOIN data_usage d   ON s.subscription_id = d.subscription_id
GROUP BY p.plan_name
ORDER BY total_mb DESC;

-- Q10. Postpaid subscribers with overdue bills
SELECT c.full_name, c.email, p.number AS phone_number, pl.plan_name,
       b.billing_month, b.total_amount
FROM customer c
JOIN phone_number p ON c.customer_id = p.customer_id
JOIN subscription s ON p.phone_id = s.phone_id
JOIN plan pl        ON s.plan_id = pl.plan_id
JOIN bill b         ON s.subscription_id = b.subscription_id
WHERE pl.plan_type = 'postpaid'
  AND b.status = 'overdue'
ORDER BY b.total_amount DESC;

-- Q11. Subscriptions with no outgoing calls
SELECT c.full_name, s.subscription_id
FROM customer c
JOIN phone_number p     ON c.customer_id = p.customer_id
JOIN subscription s     ON p.phone_id = s.phone_id
LEFT JOIN call_record cr ON s.subscription_id = cr.subscription_id
                        AND cr.call_type = 'outgoing'
WHERE cr.call_id IS NULL;

-- Stored procedure: customers with no outgoing calls in a given month ('YYYY-MM')
DROP PROCEDURE IF EXISTS get_inactive_call_customers;
DELIMITER $$
CREATE PROCEDURE get_inactive_call_customers(IN month_input CHAR(7))
BEGIN
    SELECT DISTINCT c.customer_id, c.full_name, c.email
    FROM customer c
    JOIN phone_number p ON c.customer_id = p.customer_id
    JOIN subscription s ON p.phone_id = s.phone_id
    WHERE NOT EXISTS (
        SELECT 1
        FROM call_record cr
        WHERE cr.subscription_id = s.subscription_id
          AND cr.call_type = 'outgoing'
          AND DATE_FORMAT(cr.call_start, '%Y-%m') = month_input
    );
END$$
DELIMITER ;

-- CALL get_inactive_call_customers('2025-06');
