USE store_beauty_db;

--==========================
-- Ejercicio 01 - CROSS JOIN
-- Combinar metodo de pago con metodo de envio.
--==========================

SELECT mp.nombre AS pago, me.nombre AS envio, me.costo
FROM metodos_pago mp
CROSS JOIN metodos_envio me
ORDER BY mp.id, me.id
LIMIT 5;