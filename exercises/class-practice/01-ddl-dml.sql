-- ============================================================
-- CLASS PRACTICE: Employee Table / CRUD Operations
-- Date: [add date]
-- Description: Practice with CREATE, ALTER, INSERT, UPDATE,
--              DELETE, SELECT, ORDER BY, GROUP BY, HAVING
-- ============================================================

--==========================
-- Creacion de la tabla "Empleados"
--==========================
CREATE TABLE empleados (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50),
	cargo VARCHAR(50),
	salario DECIMAL(10, 2)
);

--==========================
-- Uso de ALTER TABLE para agregar una nueva columna
--==========================
ALTER TABLE empleados ADD COLUMN
fecha_contratacion DATE;

SELECT * FROM empleados;

--==========================
-- Insertar datos a la tabla de empleados
--==========================
INSERT INTO empleados (nombre, cargo, salario)
VALUES ('Ana', 'Desarrolladora', 55000);

SELECT * FROM empleados;

INSERT INTO empleados (id, nombre, cargo,
salario, fecha_contratacion) VALUES (7, 'Juan',
'Analista', 45000, '12-03-2019');

INSERT INTO empleados (nombre, cargo, salario, fecha_contratacion) VALUES ('Carmen', 'Aanalista Senior', 890000, '05-12-2015')

--==========================
-- Vamos a actulizar la fecha de contratacion de ANA.
--==========================
UPDATE empleados SET fecha_contratacion =
'10-04-2020' WHERE nombre = 'Ana';

--==========================
-- Vamos a borrar un registro
--==========================
DELETE FROM empleados WHERE nombre =
'Ana';

DELETE FROM empleados WHERE id =
7;

--==========================
-- Vamos a emplear SELECT para mostrar determinados campos
--==========================
SELECT nombre, cargo FROM empleados
WHERE salario > 50000;

--==========================
-- Nuevas inserciones de datos
--==========================
INSERT INTO empleados (nombre, cargo, salario, fecha_contratacion)
VALUES ('Isabel', 'Analista Junior 1', 30000,'12-04-2025');

INSERT INTO empleados (nombre, cargo, salario, fecha_contratacion)
VALUES ('Carlos', 'Analista Junior 2', 30000,'15-03-2024');

SELECT * FROM empleados;

--==========================
-- Insercion de multiples registros utilizando un solo comando INSERT... VALUES
--==========================
INSERT INTO empleados (nombre, cargo, salario, fecha_contratacion)
VALUES
('Maria','Analista Senior 1', 55000, '05-02-2017'),
('Esteban', 'Desarrollador Junior 1', 35000,'10-07-2025'),
('Carmen', 'Desarrolladora Junio 2', 35000,'12-03-2026');

--==========================
-- Visualizacion de campos especificos
--==========================
SELECT nombre, fecha_contratacion FROM empleados;
SELECT nombre, fecha_contratacion FROM empleados ORDER BY
fecha_contratacion ASC;
SELECT nombre, fecha_contratacion FROM empleados ORDER BY
fecha_contratacion DESC;

SELECT * FROM empleados ORDER BY nombre ASC;
SELECT * FROM empleados ORDER BY nombre DESC;

--==========================
-- Actualizacion/asignacion masiva de datos/campos
--==========================
UPDATE empleados SET cargo = 'Analista' WHERE cargo LIKE 'Analista%';
UPDATE empleados SET cargo = 'Desarrollador' WHERE cargo LIKE
'Desarroll%';

SELECT * FROM empleados;

--==========================
-- Consulta con agrupacion
--==========================
SELECT cargo, SUM(salario) AS Total_Salarios FROM empleados GROUP
BY cargo;

--==========================
-- Conslta con agrupacion y filtros
--==========================
SELECT cargo, COUNT(*) AS cantidad_empleados FROM empleados
GROUP BY cargo HAVING COUNT(*)>2;

SELECT * FROM empleados;

--==========================
-- Practica, DESAFIO 1
--==========================
INSERT INTO empleados (id, nombre, cargo, salario, fecha_contratacion)
VALUES
(8,'Pedro','Diseñador', 42000, '2025-08-15');

SELECT * FROM empleados;

--==========================
-- Practica, DESAFIO 2
--==========================
INSERT INTO empleados (id, nombre, cargo, salario, fecha_contratacion)
VALUES
(9,'Laura','Analista', 47000, '2026-08-15'),
(10,'Pedro','Desarrollador', 39000, '2025-11-08'),
(11,'Pedro','Gerente', 72000, '2023-06-20');

SELECT * FROM empleados;