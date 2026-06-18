CREATE INDEX idx_products_name
ON products(name);

SELECT *
FROM products
WHERE name = 'Laptop';