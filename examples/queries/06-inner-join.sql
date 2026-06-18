-- Orders with customer information

SELECT
    orders.id,
    customers.name,
    orders.order_date,
    orders.total_amount
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.id;

-- Show customer emails and order totals

SELECT
    customers.email,
    orders.total_amount
FROM customers
INNER JOIN orders
    ON customers.id = orders.customer_id;