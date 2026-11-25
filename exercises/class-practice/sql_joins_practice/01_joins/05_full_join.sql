USE store_beauty_db;

--==========================
-- Ejercicio 01 - FULL JOIN
-- Mostrar casos sin pareja.
--==========================

SELECT c.nombre AS categoria, p.nombre AS producto
FROM categorias c
LEFT JOIN productos p ON p.categoria_id = c.id
WHERE p.id IS NULL
UNION
SELECT c.nombre, p.nombre
FROM categorias c
RIGHT JOIN productos p ON p.categoria_id = c.id
WHERE c.id IS NULL
LIMIT 5;