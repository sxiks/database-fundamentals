-- Customers from Colombia

SELECT *
FROM customers
WHERE country = 'Colombia';

-- Products more expensive than 100

SELECT *
FROM products
WHERE price > 100;

-- Orders above 500

SELECT *
FROM orders
WHERE total_amount > 500;