USE store_beauty_db;

--==========================
-- Ejercicio 01 - INNER JOIN
-- Listar cada producto con el nombre y categoria
--==========================

SELECT p.id, p.nombre AS producto, c.nombre AS categoria
FROM productos p 
INNER JOIN categorias c ON c.id = p.categoria_id
ORDER BY p.id
LIMIT 2O;

--==========================
-- Ejercicio 02 - INNER JOIN
-- Mostrar numero de pedido, nombre y cliente
--==========================

SELECT p.numero_pedido, c.nombre AS cliente, c.ciudad, p.estado, p.total
FROM pedidos p
INNER JOIN clientes c ON c.id = p.cliente_id
ORDER BY p.created_at DESC
LIMIT 5;