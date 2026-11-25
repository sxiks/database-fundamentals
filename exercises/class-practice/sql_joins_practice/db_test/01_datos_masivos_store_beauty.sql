-- Responsabilidad: poblar store_beauty_db con datos de prueba (hasta 1.000 filas por tabla) para practicar JOIN.
-- Requiere MySQL 8 (usa CTE recursivas). No borra ni modifica datos existentes: solo agrega filas con prefijo «prueba».
-- Los datos son ficticios; las contraseñas son un texto de relleno, nunca una clave real.
-- Se dejan filas «huérfanas» a propósito (categorías sin productos, clientes sin pedidos, etc.) para que LEFT/RIGHT/FULL JOIN tengan qué mostrar.
USE store_beauty_db;
SET SESSION cte_max_recursion_depth = 5000;

-- 20 roles
INSERT INTO roles (nombre, slug, descripcion)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 20)
SELECT CONCAT('Rol prueba ', LPAD(i,2,'0')), CONCAT('rol-prueba-', LPAD(i,2,'0')), 'Rol de prueba' FROM n;

-- 1.000 usuarios (reparte los 20 roles)
INSERT INTO usuarios (rol_id, nombre, email, password, telefono, activo)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 1000)
SELECT (SELECT r.id FROM roles r WHERE r.slug = CONCAT('rol-prueba-', LPAD(MOD(i,20)+1,2,'0'))),
       CONCAT('Usuario prueba ', i), CONCAT('usuario', LPAD(i,4,'0'), '@prueba.test'), '********',
       CONCAT('310', LPAD(i,7,'0')), IF(MOD(i,10)=0,0,1)
FROM n;

-- 1.000 categorías (las 100 últimas quedarán sin productos)
INSERT INTO categorias (nombre, slug, descripcion, orden)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 1000)
SELECT CONCAT('Categoría prueba ', LPAD(i,4,'0')), CONCAT('cat-prueba-', LPAD(i,4,'0')), 'Categoría de prueba', i FROM n;

-- 1.000 marcas (las 50 últimas quedarán sin productos)
INSERT INTO marcas (nombre, slug, descripcion)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 1000)
SELECT CONCAT('Marca prueba ', LPAD(i,4,'0')), CONCAT('marca-prueba-', LPAD(i,4,'0')), 'Marca de prueba' FROM n;

-- 1.000 productos (1 de cada 50 sin categoría; 1 de cada 40 sin marca; precios en COP)
INSERT INTO productos (categoria_id, marca_id, nombre, slug, sku, descripcion_corta, precio, stock, destacado, nuevo, activo)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 1000)
SELECT IF(MOD(i,50)=0, NULL, (SELECT c.id FROM categorias c WHERE c.slug = CONCAT('cat-prueba-', LPAD(MOD(i,900)+1,4,'0')))),
       IF(MOD(i,40)=0, NULL, (SELECT m.id FROM marcas m WHERE m.slug = CONCAT('marca-prueba-', LPAD(MOD(i,950)+1,4,'0')))),
       CONCAT('Producto prueba ', LPAD(i,4,'0')), CONCAT('prod-prueba-', LPAD(i,4,'0')), CONCAT('SKU-PRUEBA-', LPAD(i,4,'0')),
       'Producto de prueba', 5000 + MOD(i*137, 495000), MOD(i*7, 200), MOD(i,10)=0, MOD(i,15)=0, 1
FROM n;

-- 1.000 imágenes de producto (solo los primeros 800 productos tienen imagen)
INSERT INTO producto_imagenes (producto_id, imagen, principal, orden)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 1000)
SELECT (SELECT p.id FROM productos p WHERE p.sku = CONCAT('SKU-PRUEBA-', LPAD(MOD(i,800)+1,4,'0'))),
       CONCAT('prueba/img-', i, '.jpg'), IF(i <= 800, 1, 0), i FROM n;

-- 1.000 sliders y 1.000 banners
INSERT INTO sliders (titulo, descripcion, imagen, boton_texto, boton_enlace, orden)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 1000)
SELECT CONCAT('Slider prueba ', i), 'Slider de prueba', CONCAT('prueba/slider-', i, '.jpg'), 'Ver más', '/productos', i FROM n;

INSERT INTO banners (titulo, descripcion, imagen, enlace, posicion, orden)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 1000)
SELECT CONCAT('Banner prueba ', i), 'Banner de prueba', CONCAT('prueba/banner-', i, '.jpg'), '/ofertas',
       ELT(MOD(i,3)+1, 'home', 'lateral', 'footer'), i FROM n;

-- 1.000 clientes (los 200 últimos nunca harán pedidos)
INSERT INTO clientes (nombre, documento, telefono, whatsapp, email, direccion, barrio, ciudad, departamento)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 1000)
SELECT CONCAT('Cliente prueba ', LPAD(i,4,'0')), CONCAT('10', LPAD(i,8,'0')), CONCAT('300', LPAD(i,7,'0')), CONCAT('300', LPAD(i,7,'0')),
       CONCAT('cliente', LPAD(i,4,'0'), '@prueba.test'), CONCAT('Calle ', i, ' # 10-20'), CONCAT('Barrio ', MOD(i,30)+1),
       ELT(MOD(i,6)+1, 'Palmira', 'Cali', 'Bogotá', 'Medellín', 'Barranquilla', 'Cartagena'),
       ELT(MOD(i,6)+1, 'Valle del Cauca', 'Valle del Cauca', 'Cundinamarca', 'Antioquia', 'Atlántico', 'Bolívar')
FROM n;

-- 1.000 favoritos (cada pareja cliente-producto es única)
INSERT INTO productos_favoritos (cliente_id, producto_id)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 1000)
SELECT (SELECT c.id FROM clientes c WHERE c.email = CONCAT('cliente', LPAD(MOD(i,700)+1,4,'0'), '@prueba.test')),
       (SELECT p.id FROM productos p WHERE p.sku = CONCAT('SKU-PRUEBA-', LPAD(MOD(i*7,1000)+1,4,'0'))) FROM n;

-- 30 métodos de pago y 30 de envío
INSERT INTO metodos_pago (nombre, slug, descripcion, banco, titular, orden)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 30)
SELECT CONCAT('Método de pago prueba ', LPAD(i,2,'0')), CONCAT('pago-prueba-', LPAD(i,2,'0')), 'Pago de prueba', 'Banco de prueba', 'Titular de prueba', i FROM n;

INSERT INTO metodos_envio (nombre, slug, costo, descripcion, orden)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 30)
SELECT CONCAT('Envío prueba ', LPAD(i,2,'0')), CONCAT('envio-prueba-', LPAD(i,2,'0')), 3000 + i*500, 'Envío de prueba', i FROM n;

-- 1.000 pedidos (1 de cada 25 sin cliente; solo los primeros 800 clientes compran; 25 de los 30 métodos de pago)
INSERT INTO pedidos (numero_pedido, cliente_id, nombre, telefono, email, ciudad, metodo_pago_id, metodo_pago_nombre, metodo_entrega,
                     metodo_envio_nombre, costo_envio, estado, pagado, created_at)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 1000)
SELECT CONCAT('PED-PRUEBA-', LPAD(i,6,'0')),
       IF(MOD(i,25)=0, NULL, (SELECT c.id FROM clientes c WHERE c.email = CONCAT('cliente', LPAD(MOD(i,800)+1,4,'0'), '@prueba.test'))),
       CONCAT('Cliente prueba ', LPAD(MOD(i,800)+1,4,'0')), CONCAT('300', LPAD(MOD(i,800)+1,7,'0')),
       CONCAT('cliente', LPAD(MOD(i,800)+1,4,'0'), '@prueba.test'),
       ELT(MOD(i,6)+1, 'Palmira', 'Cali', 'Bogotá', 'Medellín', 'Barranquilla', 'Cartagena'),
       (SELECT mp.id FROM metodos_pago mp WHERE mp.slug = CONCAT('pago-prueba-', LPAD(MOD(i,25)+1,2,'0'))),
       CONCAT('Método de pago prueba ', LPAD(MOD(i,25)+1,2,'0')), 'domicilio', 'Envío prueba', 3000 + MOD(i,10)*500,
       ELT(MOD(i,6)+1, 'pendiente', 'confirmado', 'preparando', 'enviado', 'entregado', 'cancelado'),
       IF(MOD(i,6) IN (3,4), 1, 0), TIMESTAMP('2025-01-01') + INTERVAL i*8 HOUR
FROM n;

-- 1.800 detalles (solo los primeros 900 pedidos tienen detalle; los últimos 50 productos nunca se venden)
INSERT INTO pedido_detalles (pedido_id, producto_id, nombre_producto, sku, precio, cantidad, subtotal)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 1800)
SELECT p.id, pr.id, pr.nombre, pr.sku, pr.precio, 1 + MOD(n.i,3), pr.precio * (1 + MOD(n.i,3))
FROM n
JOIN pedidos   p  ON p.numero_pedido = CONCAT('PED-PRUEBA-', LPAD(MOD(n.i,900)+1,6,'0'))
JOIN productos pr ON pr.sku = CONCAT('SKU-PRUEBA-', LPAD(MOD(n.i*13,950)+1,4,'0'));

-- Totales de los pedidos de prueba coherentes con sus detalles
UPDATE pedidos p
JOIN (SELECT pedido_id, SUM(subtotal) AS st FROM pedido_detalles GROUP BY pedido_id) d ON d.pedido_id = p.id
SET p.subtotal = d.st, p.total = d.st + p.costo_envio
WHERE p.numero_pedido LIKE 'PED-PRUEBA-%';

-- 1.000 promociones y 1.000 productos en promoción
INSERT INTO promociones (nombre, slug, descripcion, porcentaje, fecha_inicio, fecha_fin)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 1000)
SELECT CONCAT('Promoción prueba ', LPAD(i,4,'0')), CONCAT('promo-prueba-', LPAD(i,4,'0')), 'Promoción de prueba',
       5 + MOD(i,40), '2025-01-01', '2026-12-31' FROM n;

INSERT INTO promocion_productos (promocion_id, producto_id)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 1000)
SELECT (SELECT pm.id FROM promociones pm WHERE pm.slug = CONCAT('promo-prueba-', LPAD(MOD(i,800)+1,4,'0'))),
       (SELECT p.id FROM productos p WHERE p.sku = CONCAT('SKU-PRUEBA-', LPAD(MOD(i*11,1000)+1,4,'0'))) FROM n;

-- 1.000 suscriptores, 1.000 mensajes de contacto y 1.000 claves de configuración
INSERT INTO newsletter (nombre, email)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 1000)
SELECT CONCAT('Suscriptor prueba ', i), CONCAT('suscriptor', LPAD(i,4,'0'), '@prueba.test') FROM n;

INSERT INTO contactos (nombre, email, telefono, mensaje, leido)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 1000)
SELECT CONCAT('Contacto prueba ', i), CONCAT('contacto', LPAD(i,4,'0'), '@prueba.test'), CONCAT('320', LPAD(i,7,'0')),
       'Mensaje de prueba', IF(MOD(i,3)=0,1,0) FROM n;

INSERT INTO configuracion (clave, valor)
WITH RECURSIVE n AS (SELECT 1 AS i UNION ALL SELECT i + 1 FROM n WHERE i < 1000)
SELECT CONCAT('prueba.clave_', LPAD(i,4,'0')), CONCAT('valor ', i) FROM n;

-- Conteo de control
SELECT 'roles' t, COUNT(*) n FROM roles UNION ALL SELECT 'usuarios', COUNT(*) FROM usuarios UNION ALL
SELECT 'categorias', COUNT(*) FROM categorias UNION ALL SELECT 'marcas', COUNT(*) FROM marcas UNION ALL
SELECT 'productos', COUNT(*) FROM productos UNION ALL SELECT 'clientes', COUNT(*) FROM clientes UNION ALL
SELECT 'pedidos', COUNT(*) FROM pedidos UNION ALL SELECT 'pedido_detalles', COUNT(*) FROM pedido_detalles;
