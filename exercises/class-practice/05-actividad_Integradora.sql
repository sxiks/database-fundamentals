-- ============================================================
-- Actividad Integradora ADSO
-- DataBase: PostgresSQL
-- Descripcion: Implementación adaptada usando los 
--              conceptos vistos en clase (CREATE, ALTER, 
--              INSERT, UPDATE, DELETE, SELECT, JOINS simples).
-- ============================================================

-- ============================================================
-- 1. CREACIÓN DE TABLAS
-- ============================================================

CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(200)
);

CREATE TABLE equipos (
    id_equipos SERIAL PRIMARY KEY,
    id_categoria INTEGER,
    nombre VARCHAR(100),
    marca VARCHAR(50),
    modelo VARCHAR(50),
    estado VARCHAR(50)
);

CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    direccion VARCHAR(150),
    email VARCHAR(100)
);

CREATE TABLE empleado (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    cargo VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE alquiler (
    id_alquiler SERIAL PRIMARY KEY,
    id_empleado INTEGER,
    id_cliente INTEGER,
    fecha_alquiler DATE,
    fecha_fin DATE,
    estado VARCHAR(50)
);

CREATE TABLE alquileres_equipos (
    id_alquiler INTEGER,
    id_equipos INTEGER,
    PRIMARY KEY (id_alquiler, id_equipos) -- Llave primaria compuesta para evitar duplicados
);

CREATE TABLE pago (
    id_pago SERIAL PRIMARY KEY,
    id_alquiler INTEGER,
    monto DECIMAL(12,2),
    fecha_pago DATE,
    metodo_pago VARCHAR(50)
);

CREATE TABLE telefonos_clientes (
    id_telefonos SERIAL PRIMARY KEY,
    id_cliente INTEGER,
    num_telefono VARCHAR(20)
);

CREATE TABLE telefonos_empleados (
    id_telefonos SERIAL PRIMARY KEY,
    id_empleado INTEGER,
    num_telefono VARCHAR(20)
);

-- ============================================================
-- 2. USO DE ALTER TABLE (4 Como minimo)
-- ============================================================

-- 1. Agregar nueva columna
ALTER TABLE cliente ADD COLUMN fecha_registro DATE;

-- 2. Agregar llave foránea a equipos
ALTER TABLE equipos ADD CONSTRAINT fk_categoria 
FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria);

-- 3. Agregar llave foránea a alquiler
ALTER TABLE alquiler ADD CONSTRAINT fk_empleado 
FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado);

-- 4. Agregar otra llave foránea a alquiler
ALTER TABLE alquiler ADD CONSTRAINT fk_cliente 
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);

-- Agregar llaves foráneas a la tabla pago
ALTER TABLE pago ADD CONSTRAINT fk_pago_alquiler 
FOREIGN KEY (id_alquiler) REFERENCES alquiler(id_alquiler);

-- Agregar llaves foráneas a la tabla intermedia alquileres_equipos
ALTER TABLE alquileres_equipos ADD CONSTRAINT fk_intermedia_alquiler 
FOREIGN KEY (id_alquiler) REFERENCES alquiler(id_alquiler);

ALTER TABLE alquileres_equipos ADD CONSTRAINT fk_intermedia_equipos 
FOREIGN KEY (id_equipos) REFERENCES equipos(id_equipos);

-- Agregar llaves foráneas a las tablas de teléfonos
ALTER TABLE telefonos_clientes ADD CONSTRAINT fk_tel_cliente 
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente);

ALTER TABLE telefonos_empleados ADD CONSTRAINT fk_tel_empleado 
FOREIGN KEY (id_empleado) REFERENCES empleado(id_empleado);

-- ============================================================
-- 3. INSERCIÓN DE DATOS
-- ============================================================

-- 8 Clientes
INSERT INTO cliente (nombre, direccion, email, fecha_registro) VALUES 
('Juan Pérez', 'Calle 10 Cali', 'juan@mail.com', '2025-01-10'),
('María Gómez', 'Carrera 15 Palmira', 'maria@mail.com', '2025-02-15'),
('Luis Rojas', 'Avenida 5 Bogotá', 'luis@mail.com', '2025-03-20'),
('Ana Torres', 'Calle 8 Buga', 'ana@mail.com', '2025-04-12'),
('Pedro Ruiz', 'Carrera 4 Yumbo', 'pedro@mail.com', '2025-05-05'),
('Sofia Luna', 'Calle 12 Tuluá', 'sofia@mail.com', '2025-06-30'),
('Carlos Vera', 'Carrera 9 Cartago', 'carlos@mail.com', '2025-07-22'),
('Laura Paz', 'Calle 3 Jamundí', 'laura@mail.com', '2025-08-11');

-- 5 Empleados (Ahora con el campo 'email')
INSERT INTO empleado (nombre, cargo, email) VALUES 
('Andrés', 'Analista', 'andres@empresa.com'),
('Carmen', 'Gerente', 'carmen@empresa.com'),
('Esteban', 'Desarrollador', 'esteban@empresa.com'),
('Natalia', 'Analista', 'natalia@empresa.com'),
('Isabel', 'Soporte Técnico', 'isabel@empresa.com');

-- 5 Categorías
INSERT INTO categorias (nombre, descripcion) VALUES 
('Computación', 'Laptops y PCs'),
('Proyección', 'Proyectores y pantallas'),
('Audio', 'Sonido y micrófonos'),
('Redes', 'Routers y switches'),
('Accesorios', 'Cables y periféricos');

-- 20 Equipos (Ahora con el campo 'modelo')
INSERT INTO equipos (id_categoria, nombre, marca, modelo, estado) VALUES 
(1, 'Laptop Core i7', 'Dell', 'XPS 15', 'Disponible'),
(1, 'Laptop Ryzen 7', 'Lenovo', 'ThinkPad T14', 'Disponible'),
(1, 'MacBook Pro', 'Apple', 'M2 2023', 'Alquilado'),
(1, 'PC Escritorio', 'HP', 'ProDesk 400', 'Disponible'),
(1, 'Laptop Gamer', 'Asus', 'ROG Strix', 'Disponible'),
(2, 'Proyector 4K', 'Epson', 'Cinema 5050', 'Disponible'),
(2, 'Proyector HD', 'BenQ', 'TH585', 'Alquilado'),
(2, 'Pantalla 120', 'Elite', 'Screens Manual', 'Disponible'),
(2, 'Proyector Mini', 'Anker', 'Nebula Capsule', 'En Mantenimiento'),
(3, 'Parlante 1000W', 'JBL', 'PartyBox 310', 'Disponible'),
(3, 'Micrófono', 'Shure', 'SM58', 'Alquilado'),
(3, 'Mezcladora', 'Yamaha', 'MG10XU', 'Disponible'),
(3, 'Sonido Portátil', 'Bose', 'S1 Pro', 'Disponible'),
(4, 'Router Wi-Fi', 'TP-Link', 'Archer AX50', 'Disponible'),
(4, 'Switch 24', 'Cisco', 'Catalyst 2960', 'Alquilado'),
(4, 'Access Point', 'Ubiquiti', 'UniFi 6 Lite', 'Disponible'),
(5, 'Mouse', 'Logitech', 'MX Master 3', 'Disponible'),
(5, 'Teclado', 'Keychron', 'K2', 'Alquilado'),
(5, 'Cable HDMI', 'Generico', '2.1 4K', 'Disponible'),
(5, 'Adaptador', 'Satechi', 'Multiport V2', 'Disponible');

-- 15 Alquileres
INSERT INTO alquiler (id_empleado, id_cliente, fecha_alquiler, fecha_fin, estado) VALUES 
(1, 1, '2026-09-01', '2026-09-05', 'Finalizado'),
(2, 2, '2026-09-02', '2026-09-06', 'Pendiente'),
(3, 3, '2026-09-03', '2026-09-07', 'Finalizado'),
(4, 4, '2026-09-04', '2026-09-08', 'Pendiente'),
(5, 5, '2026-09-05', '2026-09-09', 'Finalizado'),
(1, 6, '2026-09-06', '2026-09-10', 'Pendiente'),
(2, 7, '2026-09-07', '2026-09-11', 'Finalizado'),
(3, 8, '2026-09-08', '2026-09-12', 'Pendiente'),
(4, 1, '2026-09-09', '2026-09-13', 'Finalizado'),
(5, 2, '2026-09-10', '2026-09-14', 'Pendiente'),
(1, 3, '2026-09-11', '2026-09-15', 'Finalizado'),
(2, 4, '2026-09-12', '2026-09-16', 'Pendiente'),
(3, 5, '2026-09-13', '2026-09-17', 'Finalizado'),
(4, 6, '2026-09-14', '2026-09-18', 'Pendiente'),
(5, 7, '2026-09-15', '2026-09-19', 'Finalizado');

-- Relación Alquileres y Equipos
INSERT INTO alquileres_equipos (id_alquiler, id_equipos) VALUES 
(1, 1), (1, 2), (2, 3), (2, 6), (3, 4), (3, 10), (4, 5), (4, 11),
(5, 7), (5, 14), (6, 8), (6, 15), (7, 12), (7, 17), (8, 13), (8, 18),
(9, 2), (9, 20), (10, 1), (10, 19), (11, 4), (11, 7), (12, 10), (12, 11),
(13, 14), (13, 16), (14, 3), (14, 5), (15, 6), (15, 8);

-- 30 Pagos (2 pagos por alquiler: Anticipo y Saldo)
INSERT INTO pago (id_alquiler, monto, fecha_pago, metodo_pago) VALUES 
(1, 50000, '2026-09-01', 'Efectivo'), (1, 50000, '2026-09-05', 'Tarjeta'),
(2, 60000, '2026-09-02', 'Transferencia'), (2, 60000, '2026-09-06', 'Efectivo'),
(3, 40000, '2026-09-03', 'Efectivo'), (3, 40000, '2026-09-07', 'Tarjeta'),
(4, 70000, '2026-09-04', 'Tarjeta'), (4, 70000, '2026-09-08', 'Transferencia'),
(5, 55000, '2026-09-05', 'Efectivo'), (5, 55000, '2026-09-09', 'Efectivo'),
(6, 45000, '2026-09-06', 'Tarjeta'), (6, 45000, '2026-09-10', 'Tarjeta'),
(7, 80000, '2026-09-07', 'Transferencia'), (7, 80000, '2026-09-11', 'Efectivo'),
(8, 30000, '2026-09-08', 'Efectivo'), (8, 30000, '2026-09-12', 'Transferencia'),
(9, 90000, '2026-09-09', 'Tarjeta'), (9, 90000, '2026-09-13', 'Tarjeta'),
(10, 35000, '2026-09-10', 'Efectivo'), (10, 35000, '2026-09-14', 'Efectivo'),
(11, 65000, '2026-09-11', 'Transferencia'), (11, 65000, '2026-09-15', 'Tarjeta'),
(12, 50000, '2026-09-12', 'Efectivo'), (12, 50000, '2026-09-16', 'Transferencia'),
(13, 75000, '2026-09-13', 'Tarjeta'), (13, 75000, '2026-09-17', 'Efectivo'),
(14, 40000, '2026-09-14', 'Efectivo'), (14, 40000, '2026-09-18', 'Tarjeta'),
(15, 85000, '2026-09-15', 'Transferencia'), (15, 85000, '2026-09-19', 'Efectivo');

-- Teléfonos de clientes (Algunos clientes tienen 2 números)
INSERT INTO telefonos_clientes (id_cliente, num_telefono) VALUES 
(1, '3101234567'), (1, '3159876543'), 
(2, '3204567890'), 
(3, '3001112233'),
(4, '3114445566'), (4, '3129998877'),
(5, '3187776655');

-- Teléfonos de empleados
INSERT INTO telefonos_empleados (id_empleado, num_telefono) VALUES 
(1, '3145556677'),
(2, '3109990011'), (2, '3213334455'),
(3, '3162223344'),
(4, '3008889900'),
(5, '3174445566');

-- ============================================================
-- 4. ACTUALIZACIONES (8) y ELIMINACIONES (2)
-- ============================================================

-- 8 Updates
UPDATE empleado SET cargo = 'Gerente General' WHERE id_empleado = 2;
UPDATE equipos SET estado = 'En Mantenimiento' WHERE id_equipos = 1;
UPDATE equipos SET estado = 'Disponible' WHERE nombre = 'MacBook Pro';
UPDATE cliente SET direccion = 'Calle Nueva Cali' WHERE id_cliente = 1;
UPDATE categorias SET descripcion = 'Audio e Instrumentos' WHERE nombre = 'Audio';
UPDATE pago SET metodo_pago = 'Transferencia' WHERE metodo_pago = 'Tarjeta' AND monto < 40000;
UPDATE alquiler SET estado = 'Cancelado' WHERE id_alquiler = 14;
UPDATE cliente SET email = 'nuevo@mail.com' WHERE nombre = 'Carlos Vera';

-- 2 Deletes
-- Se inserta un cliente y un equipo de prueba solo para borrarlos sin dañar datos usados
INSERT INTO cliente (nombre, direccion, email) VALUES ('Cliente Falso', 'Dir', 'falso@mail.com');
INSERT INTO equipos (id_categoria, nombre, marca, estado) VALUES (1, 'Equipo Falso', 'Falsa', 'Disponible');

DELETE FROM cliente WHERE nombre = 'Cliente Falso';
DELETE FROM equipos WHERE nombre = 'Equipo Falso';


-- ============================================================
-- 5. CONSULTAS REQUERIDAS (Uniendo más de 4 tablas)
-- ============================================================

-- 1. Listado de alquileres mostrando cliente, empleado, equipo y categoría
SELECT 
    c.nombre AS cliente, 
    e.nombre AS empleado, 
    eq.nombre AS equipo, 
    cat.nombre AS categoria
FROM alquiler a
INNER JOIN cliente c ON a.id_cliente = c.id_cliente
INNER JOIN empleado e ON a.id_empleado = e.id_empleado
INNER JOIN alquileres_equipos ae ON a.id_alquiler = ae.id_alquiler
INNER JOIN equipos eq ON ae.id_equipos = eq.id_equipos
INNER JOIN categorias cat ON eq.id_categoria = cat.id_categoria;

-- 2. Valor total pagado por cliente
SELECT 
    c.nombre AS cliente, 
    COUNT(a.id_alquiler) AS cantidad_alquileres,
    TO_CHAR(SUM(p.monto), 'FM$999G999G999') AS total_pagado
FROM cliente c
INNER JOIN alquiler a ON c.id_cliente = a.id_cliente
INNER JOIN pago p ON a.id_alquiler = p.id_alquiler
INNER JOIN empleado e ON a.id_empleado = e.id_empleado
GROUP BY c.nombre
ORDER BY total_pagado DESC;

-- 3. Equipos alquilados por categoría
SELECT 
    cat.nombre AS categoria, 
    COUNT(ae.id_equipos) AS total_veces_alquilados
FROM categorias cat
INNER JOIN equipos eq ON cat.id_categoria = eq.id_categoria
INNER JOIN alquileres_equipos ae ON eq.id_equipos = ae.id_equipos
INNER JOIN alquiler a ON ae.id_alquiler = a.id_alquiler
GROUP BY cat.nombre
ORDER BY total_veces_alquilados DESC;

-- 4. Clientes con alquileres pendientes (Desglosado por equipo)
SELECT 
    c.nombre AS cliente, 
    a.fecha_fin, 
    eq.nombre AS equipo_pendiente, 
    a.estado
FROM cliente c
INNER JOIN alquiler a ON c.id_cliente = a.id_cliente
INNER JOIN alquileres_equipos ae ON a.id_alquiler = ae.id_alquiler
INNER JOIN equipos eq ON ae.id_equipos = eq.id_equipos
WHERE a.estado = 'Pendiente'
ORDER BY a.fecha_fin ASC;

-- 5. Ingresos generados por empleado
SELECT 
    e.nombre AS empleado, 
    e.cargo, 
    TO_CHAR(SUM(p.monto), 'FM$999G999G999') AS ingresos_generados
FROM empleado e
INNER JOIN alquiler a ON e.id_empleado = a.id_empleado
INNER JOIN pago p ON a.id_alquiler = p.id_alquiler
INNER JOIN cliente c ON a.id_cliente = c.id_cliente
GROUP BY e.nombre, e.cargo
ORDER BY ingresos_generados DESC;