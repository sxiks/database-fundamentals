-- Show all customers, even those without orders

SELECT
    customers.name,
    orders.id AS order_id,
    orders.total_amount
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id;

-- Identify customers without orders

SELECT
    customers.name
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
WHERE orders.id IS NULL;