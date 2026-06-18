-- Calculate average spending by customer

WITH customer_totals AS (
    SELECT
        customer_id,
        SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
)

SELECT
    customer_id,
    total_spent
FROM customer_totals
ORDER BY total_spent DESC;

-- Customers spending more than average

WITH customer_totals AS (
    SELECT
        customer_id,
        SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
)

SELECT *
FROM customer_totals
WHERE total_spent > (
    SELECT AVG(total_spent)
    FROM customer_totals
);