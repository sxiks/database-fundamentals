SELECT
    COUNT(*) AS total_sales,
    SUM(amount) AS total_revenue,
    AVG(amount) AS average_sale
FROM sales;