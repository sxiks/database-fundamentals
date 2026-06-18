SELECT
    category,
    COUNT(*) AS products,
    AVG(price) AS average_price
FROM products
GROUP BY category
HAVING COUNT(*) > 1;