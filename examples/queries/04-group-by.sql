-- Count customers by country

SELECT
    country,
    COUNT(*) AS total_customers
FROM customers
GROUP BY country;

-- Count products by category

SELECT
    category,
    COUNT(*) AS total_products
FROM products
GROUP BY category;