USE `telecom`;

-- DQ1. Bills that differ from the plan's monthly fee by more than 15
SELECT b.bill_id, pl.plan_name, pl.monthly_fee, b.total_amount
FROM bill b
JOIN subscription s ON b.subscription_id = s.subscription_id
JOIN plan pl        ON s.plan_id = pl.plan_id
WHERE ABS(b.total_amount - pl.monthly_fee) > 15;

-- DQ2. Subscription activated before its phone number was registered
SELECT s.subscription_id, p.date_registered, s.activation_date
FROM subscription s
JOIN phone_number p ON s.phone_id = p.phone_id
WHERE p.date_registered > s.activation_date;

-- DQ3. Active subscription on a suspended or ported number
SELECT s.subscription_id, p.number, p.status AS number_status
FROM subscription s
JOIN phone_number p ON s.phone_id = p.phone_id
WHERE s.status = 'active' AND p.status <> 'active';

-- DQ4. Data sessions that end before they start
SELECT * FROM data_usage WHERE session_end <= session_start;
