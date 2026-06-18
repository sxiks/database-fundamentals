SELECT
    c.name,
    o.order_date
FROM customers c
INNER JOIN orders o
ON c.id = o.customer_id;