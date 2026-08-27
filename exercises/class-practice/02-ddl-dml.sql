-- ============================================================
-- CLASS PRACTICE: Tabla Departamentos / CRUD Operations / Consultas entre tablas
-- Date: [26/08/2026]
-- Description: Practice with CREATE, ALTER, INSERT, UPDATE,
--              DELETE, SELECT, ORDER BY, GROUP BY, HAVING
-- ============================================================

--==========================
-- Creación de la tabla "Departamentos"
--==========================

CREATE TABLE departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ubicacion VARCHAR(50) NOT NULL,
    presupuesto DECIMAL(12,2) NOT NULL
);

--==========================
-- Establecer vínculos entre tablas
-- La cual deberá crear la llave foránea en la tabla "Empleados"
--==========================
-- PASO 1:
ALTER TABLE empleados
ADD COLUMN id_departamento INTEGER;

-- PASO 2:
ALTER TABLE empleados
ADD CONSTRAINT fk_empleado_departamento
FOREIGN KEY (id_departamento)
REFERENCES departamentos(id_departamento);


--==========================
-- Insertar datos a la tabla de Departamentos
--==========================
INSERT INTO departamentos (nombre, ubicacion, presupuesto)
VALUES ('Desarrollador de Software', 'Cali', 85000000);
VALUES ('Análisis y Diseño', 'Palmira', 60000000);
VALUES ('Pruebas de Software', 'Cali', 45000000);
VALUES ('Base de Datos', 'Bogotá', 55000000);
VALUES ('Soporte Técnico', 'Palmira', 35000000);

SELECT * FROM departamentos;

-- Ya se tiene el vinculo estructural entre tablas

--==========================
-- Asignación de datos que consolida el vinculo mediante datos
--==========================
-- 1. Que en el departamento 1 queden asociados los empleados 1,2 y 3.
UPDATE empleados
SET id_departamento = 1 WHERE id IN (1, 2, 3);

-- 2. Que en el departamento 2 queden trabajando los empleados 4 y 5.
UPDATE empleados
SET id_departamento = 2 WHERE id IN (4, 5);

-- 3. Que en el departamento 3 queden trabajando los empleados 6 y 7.
UPDATE empleados
SET id_departamento = 3 WHERE id IN (6, 7);

-- 4. Que en el departamento 4 queden trabajando los empleados 8 y 9.
UPDATE empleados
SET id_departamento = 4 WHERE id IN (8, 9);

-- 5. Finalmente, que en el departamento 5 queden trabajando los empleados 10 y 11.
UPDATE empleados
SET id_departamento = 5 WHERE id IN (10, 11);

-- Veficacion de datos en la otra tabla
SELECT * FROM empleados;


--==========================
-- Consultas entre las 2 tablas
--==========================
--==========================
-- Consulta 1.
-- Mostrar empleados y su departamento
--==========================
SELECT
    e.nombre,
    e.cargo,
    d.nombre AS departamento 
    -- Se le agrega el 'AS' para evitar la ambigüedad de el campo 'nombre' entre tablas
FROM empleados e
INNER JOIN departamentos d
    ON e.id_departamento = d.id_departamento;


--==========================
-- Consulta 2.
-- Mostrar nombre, cargo, salario y ubicación del empelado
--==========================
SELECT
    e.nombre,
    e.cargo,
    e.salario,
    d.nombre AS departamento,
    d.ubicacion
FROM empleados e
INNER JOIN departamentos d
    ON e.id_departamento = d.id_departamento;

--==========================
-- Consulta 3.
-- Salario promedio por departamento
--==========================
SELECT d.nombre,
    AVG (e.salario) AS promedio_salario
FROM empleados e
INNER JOIN departamentos d
    ON d.id_departamento = e.id_departamento
group by departamento;