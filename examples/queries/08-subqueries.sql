-- Products above the average price

SELECT *
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);

-- Customers with orders above average

SELECT *
FROM customers
WHERE id IN (
    SELECT customer_id
    FROM orders
    WHERE total_amount > (
        SELECT AVG(total_amount)
        FROM orders
    )
);