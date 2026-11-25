USE store_beauty_db;

--==========================
-- Ejercicio 01 - RIGHT JOIN
-- Listar marcas que no tengan ningun producto.
--==========================

SELECT m.id, m.nombre AS marca
FROM productos p
RIGHT JOIN marcas m ON m.id = p.marca_id
WHERE p.id IS NULL
LIMIT 5;