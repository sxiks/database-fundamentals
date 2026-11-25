--==========================
-- Consulta 01 - INNER JOIN
-- El equipo de catálogo necesita un listado de los 20 productos más caros que tengan categoría y marca.
-- Muestra el producto, su categoría, su marca y su precio.
-- Tablas: productos, categorias, marcas
--==========================





--==========================
-- Consulta 02 - INNER JOIN
-- Soporte quiere ver los pedidos ya entregados que pertenecen a un cliente registrado: número de pedido, nombre del cliente, ciudad y total.
-- Tablas: pedidos, clientes
--==========================




--==========================
-- Consulta 03 - INNER JOIN
-- Contabilidad necesita el detalle de lo vendido en pedidos pagados: número de pedido, producto, cantidad y subtotal.
-- Tablas: pedido_detalles, pedidos, productos
--==========================



--==========================
-- Consulta 04 - INNER JOIN
-- Marketing quiere saber qué productos tienen como favoritos los clientes de Cali. Muestra el cliente y el producto.
-- Tablas: productos_favoritos, clientes, productos
--==========================


--==========================
-- Consulta 05 - INNER JOIN
-- Lista las promociones de al menos 30 % de descuento con los productos que incluyen: promoción, porcentaje y producto.
-- Tablas: promociones, promocion_productos, productos
--==========================



--==========================
-- Consulta 06 - LEFT JOIN
-- El área de contenido quiere depurar el catálogo: ¿qué categorías no tienen ningún producto?
-- Tablas: categorias, productos
--==========================



--==========================
-- Consulta 07 - LEFT JOIN
-- Ventas quiere reactivar clientes: ¿qué clientes nunca han hecho un pedido? Muestra nombre, correo y ciudad (20 primeros).
-- Tablas: clientes, pedidos
--==========================


--==========================
-- Consulta 08 - LEFT JOIN
-- ¿Qué productos nunca se han vendido? Muestra SKU, nombre y el nombre de su categoría (si la tiene).
-- Tablas: productos, pedido_detalles, categorias
--==========================


--==========================
-- Consulta 09 - LEFT JOIN
-- Muestra todas las marcas con la cantidad de productos que tiene cada una, incluidas las que tienen 0.
-- Ordena de menor a mayor y muestra 20.
-- Tablas: marcas, productos
--==========================



--==========================
-- Consulta 10 - LEFT JOIN
-- Hay pedidos que quedaron sin ningún producto cargado. Encuéntralos: número de pedido, estado y fecha.
-- Tablas: pedidos, pedido_detalles
--==========================



--==========================
-- Consulta 11 - RIGHT JOIN
-- Resuelve con RIGHT JOIN (la tabla de pedidos a la izquierda): ¿qué clientes nunca han comprado?
-- Muestra 20.
-- Tablas: pedidos, clientes
--==========================



--==========================
-- Consulta 12 - RIGHT JOIN
-- Con RIGHT JOIN: ¿qué métodos de pago no ha usado ningún pedido?
-- Tablas: pedidos, metodos_pago
--==========================



--==========================
-- Consulta 13 - RIGHT JOIN
-- Con RIGHT JOIN: ¿qué marcas no tienen productos? Muestra 20.
-- Tablas: productos, marcas
--==========================




--==========================
-- Consulta 14 - RIGHT JOIN
-- Con RIGHT JOIN: ¿qué productos no tienen ninguna imagen cargada? Muestra SKU y nombre (20 primeros).
-- Tablas: producto_imagenes, productos
--==========================



--==========================
-- Consulta 15 - RIGHT JOIN
-- Con RIGHT JOIN: ¿qué promociones todavía no tienen productos asociados? Muestra 20.
-- Tablas: promocion_productos, promociones
--==========================




--==========================
-- Consulta 16 - CROSS JOIN
-- Para probar el checkout, genera todas las combinaciones posibles de método de pago × método de envío.
-- Muestra pago, envío y costo (primeras 20).
-- Tablas: metodos_pago, metodos_envio
--==========================





--==========================
-- Consulta 17 - CROSS JOIN
-- Genera una matriz de prueba con las 5 primeras categorías × las 4 primeras marcas (debe dar 20 filas).
-- Tablas: categorias, marcas
--==========================




--==========================
-- Consulta 18 - CROSS JOIN
-- Cruza cada rol con cada estado de pedido distinto que exista (para armar una matriz de permisos).
-- Muestra rol, estado y el total de filas del cruce en otra consulta.
-- Tablas: roles, pedidos (estados distintos)
--==========================



--==========================
-- Consulta 19 - CROSS JOIN
-- Para planear tarifas, cruza cada ciudad distinta de los clientes con los métodos de envío de costo menor o igual a 5.000.
-- Tablas: clientes (ciudades distintas), metodos_envio
--==========================


--==========================
-- Consulta 20 - CROSS JOIN
-- ¿Cuántas filas produciría un CROSS JOIN entre clientes y métodos de envío? Calcúlalo con COUNT(*) y compruébalo multiplicando los conteos de cada tabla.
-- Tablas: clientes, metodos_envio
--==========================



--==========================
-- Consulta 21 - FULL JOIN (emulado)
-- MySQL no tiene FULL JOIN: emúlalo con LEFT JOIN + UNION + RIGHT JOIN. Muestra las categorías sin productos Y los productos sin categoría (solo los casos sin pareja).
-- Tablas: categorias, productos
--==========================



--==========================
-- Consulta 22 - FULL JOIN (emulado)
-- Con el mismo método: clientes sin pedidos Y pedidos sin cliente (solo los casos sin pareja, 30 filas máximo).
-- Tablas: clientes, pedidos
--==========================


--==========================
-- Consulta 23 - FULL JOIN (emulado)
-- FULL JOIN completo de marcas y productos (todas las filas de los dos lados, con o sin pareja).
-- Muestra solo cuántas filas resultan.
-- Tablas: marcas, productos
--==========================


--==========================
-- Consulta 24 - FULL JOIN (emulado)
-- Promociones sin productos Y productos sin promoción: muestra el nombre de cada lado (solo los casos sin pareja, 30 filas máximo).
-- Tablas: promociones, promocion_productos, productos
--==========================



--==========================
-- Consulta 25 - FULL JOIN (emulado)
-- Productos sin imagen Y imágenes cuyo producto no existe (solo los casos sin pareja, 30 filas máximo).
-- Tablas: productos, producto_imagenes
--==========================



--==========================
-- Consulta 26 - Adicionales
-- Dirección quiere el top 10 de productos más vendidos (unidades) sin contar pedidos cancelados:
-- producto, unidades y ventas.
-- Tablas: pedido_detalles, pedidos, productos
--==========================



--==========================
-- Consulta 27 - Adicionales
-- Calcula las ventas (suma de total) y el número de pedidos por mes, excluyendo los cancelados.
-- Tablas: pedidos
--==========================



--==========================
-- Consulta 28 - Adicionales
-- ¿Qué clientes tienen más de 1 pedido? Muestra nombre, número de pedidos y total gastado (usa GROUP BY y HAVING).
-- Tablas: clientes, pedidos
--==========================




--==========================
-- Consulta 29 - Adicionales
-- Subconsulta correlacionada: ¿qué productos cuestan más que el promedio de su propia categoría?
-- Muestra producto, precio y el promedio de la categoría (20 primeros).
-- Tablas: productos
--==========================



--==========================
-- Consulta 30 - Adicionales
-- Clasifica el inventario con CASE: «agotado» (stock 0), «bajo» (stock menor o igual al mínimo) u «ok».
-- Cuenta cuántos productos hay de cada clase.
-- Tablas: productos
--==========================