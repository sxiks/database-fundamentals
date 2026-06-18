-- Countries with more than 5 customers

SELECT
    country,
    COUNT(*) AS total_customers
FROM customers
GROUP BY country
HAVING COUNT(*) > 5;

-- Categories with more than 10 products

SELECT
    category,
    COUNT(*) AS total_products
FROM products
GROUP BY category
HAVING COUNT(*) > 10;