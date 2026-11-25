USE store_beauty_db;

--==========================
-- Ejercicio 01 - LEFT JOIN
-- Cuantos pedidos tiene cada cliente
--==========================

SELECT c.nombre, COUNT(p.id) AS pedidos
FROM clientes c
LEFT JOIN pedidos p ON p.cliente_id = c.id
GROUP BY c.id, c.nombre
ORDER BY pedidos ASC, c.nombre
LIMIT 5;