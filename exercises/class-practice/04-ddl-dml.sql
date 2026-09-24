-- ============================================================
-- CLASS PRACTICE: Consultas con dos tablas (Departamentos y Empleados)
-- DataBase: PostgresSQL
-- Date: [23/09/2026]
-- Description: Solución a las consultas 4, 5, 6 y 7 empleando INNER JOIN, 
--              funciones de agregación y formateo de datos.
-- ============================================================


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
-- Ordenado por ubicacion
--==========================
SELECT
    e.nombre,
    e.cargo,
    e.salario,
    d.ubicacion
FROM empleados e
INNER JOIN departamentos d
    ON e.id_departamento = d.id_departamento
	ORDER BY d.ubicacion ASC


--==========================
-- Consulta 3.
-- Salario promedio por departamento
--==========================
SELECT 
    d.nombre AS departamento, 
    TO_CHAR(AVG(e.salario), 'FM999G999G999G990D00') AS salario_promedio
FROM departamentos d
INNER JOIN empleados e 
    ON d.id_departamento = e.id_departamento
GROUP BY d.nombre;

--==========================
-- Consulta 4.
-- Departamento con mayor salario promedio
--==========================
SELECT -- ============================================================
-- CLASS PRACTICE: Consultas con dos tablas (Departamentos y Empleados)
-- DataBase: PostgresSQL
-- Date: [23/09/2026]
-- Description: Solución a las consultas 4, 5, 6 y 7 empleando INNER JOIN, 
--              funciones de agregación y formateo de datos.
-- ============================================================


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
-- Ordenado por ubicacion
--==========================
SELECT
    e.nombre,
    e.cargo,
    e.salario,
    d.ubicacion
FROM empleados e
INNER JOIN departamentos d
    ON e.id_departamento = d.id_departamento
	ORDER BY d.ubicacion ASC


--==========================
-- Consulta 3.
-- Salario promedio por departamento
--==========================
SELECT 
    d.nombre AS departamento, 
    TO_CHAR(AVG(e.salario), 'FM999G999G999G990D00') AS salario_promedio
FROM departamentos d
INNER JOIN empleados e 
    ON d.id_departamento = e.id_departamento
GROUP BY d.nombre;

--==========================
-- Consulta 4.
-- Departamento con mayor salario promedio
--==========================
SELECT 
    d.nombre AS departamento, 
    TO_CHAR(AVG(e.salario), 'FM999G999G999G990D00') AS salario_promedio
FROM departamentos d
INNER JOIN empleados e 
    ON d.id_departamento = e.id_departamento
GROUP BY d.nombre
ORDER BY salario_promedio DESC;


--==========================
-- Consulta 5.
-- Empleados por departamento contratados desde el 2024
--==========================
SELECT
    e.nombre,
    e.fecha_contratacion,
    d.nombre AS departamento
FROM empleados e
INNER JOIN departamentos d
    ON e.id_departamento = d.id_departamento
WHERE e.fecha_contratacion >= '2024-01-01';

--==========================
-- Consulta 6.
-- Presupuesto y suma de los salarios por departamento
--==========================
SELECT 
    d.nombre, 
    d.presupuesto, 
    TO_CHAR(SUM(e.salario), 'FM999G999G999G990D00') AS total_salarios
FROM departamentos d
INNER JOIN empleados e 
    ON d.id_departamento = e.id_departamento
GROUP BY d.nombre, d.presupuesto
ORDER BY total_salarios DESC;


--==========================
-- Consulta 7.
-- Presupuesto y suma de los salarios por departamento y % de ejecución presupuestal
--==========================

-- Query 1:
SELECT
    d.nombre,
    d.presupuesto,
    SUM(e.salario) AS total_salarios,
    ROUND((SUM(e.salario) / d.presupuesto) * 100, 2) AS porcentaje_ejecución_presupuestal
FROM departamentos d
INNER JOIN empleados e
    ON d.id_departamento = e.id_departamento
GROUP BY d.nombre, d.presupuesto
ORDER BY porcentaje_ejecución_presupuestal DESC;


-- Query 2:
SELECT 
    d.nombre, 
    d.presupuesto, 
    SUM(e.salario) AS total_salarios,
    ROUND((SUM(e.salario) / d.presupuesto), 2) AS porcentaje_ejecucion_presupuestal
FROM departamentos d
INNER JOIN empleados e 
    ON d.id_departamento = e.id_departamento
GROUP BY d.nombre, d.presupuesto
ORDER BY total_salarios DESC;

--==========================
-- Consulta 7 (Con formato).
-- Presupuesto y suma de los salarios por departamento y % de ejecución
-- presupuestal, ESTA VEZ CON FORMATO DE MONEDA, SEPARADORES DE MILES Y FORMATO PORCENTAJE
--==========================

-- Query 1:
SELECT 
    d.nombre AS departamento,
    TO_CHAR(d.presupuesto,'FM$999G999G999G999') AS presupuesto,
    TO_CHAR(SUM(e.salario), 'FM$999G999G999G999') AS total_salarios,
    TO_CHAR((SUM(e.salario)/d.presupuesto)*100,'FM990.00"%"') AS porcentaje_ejecucion_presupuestal
FROM departamentos d
INNER JOIN empleados e 
    ON d.id_departamento = e.id_departamento
GROUP BY d.presupuesto, d.nombre
ORDER BY total_salarios DESC;


-- Query 2:
SELECT 
    d.nombre AS departamento,
    TO_CHAR(d.presupuesto, 'FM$999G999G999G999') AS presupuesto,
    TO_CHAR(SUM(e.salario), 'FM$999G999G999G999') AS total_salarios,
    TO_CHAR((SUM(e.salario)/d.presupuesto)*100, 'FM990.00"%"') AS porcentaje_ejecucion_presupuestal
FROM departamentos d
INNER JOIN empleados e 
    ON d.id_departamento = e.id_departamento
GROUP BY d.presupuesto, d.nombre
ORDER BY total_salarios DESC;
    d.nombre AS departamento, 
    ROUND(AVG(e.salario), 2) AS salario_promedio
FROM departamentos d
INNER JOIN empleados e 
    ON d.id_departamento = e.id_departamento
GROUP BY d.nombre
ORDER BY salario_promedio DESC;


--==========================
-- Consulta 5.
-- Empleados por departamento contratados desde el 2024
--==========================
SELECT
    e.nombre,
    e.fecha_contratacion,
    d.nombre AS departamento
FROM empleados e
INNER JOIN departamentos d
    ON e.id_departamento = d.id_departamento
WHERE e.fecha_contratacion >= '2024-01-01';


--==========================
-- Consulta 6.
-- Presupuesto y suma de los salarios por departamento
--==========================
SELECT 
    d.nombre, 
    d.presupuesto, 
    SUM(e.salario) AS total_salarios
FROM departamentos d
INNER JOIN empleados e 
    ON d.id_departamento = e.id_departamento
GROUP BY d.nombre, d.presupuesto
ORDER BY total_salarios DESC;


--==========================
-- Consulta 7.
-- Presupuesto y suma de los salarios por departamento y % de ejecución presupuestal
--==========================

-- Query 1:
SELECT
    d.nombre,
    d.presupuesto,
    SUM(e.salario) AS total_salarios,
    ROUND((SUM(e.salario) / d.presupuesto) * 100, 2) AS porcentaje_ejecución_presupuestal
FROM departamentos d
INNER JOIN empleados e
    ON d.id_departamento = e.id_departamento
GROUP BY d.nombre, d.presupuesto
ORDER BY porcentaje_ejecución_presupuestal DESC;


-- Query 2:
SELECT 
    d.nombre, 
    d.presupuesto, 
    SUM(e.salario) AS total_salarios,
    ROUND((SUM(e.salario) / d.presupuesto), 2) AS porcentaje_ejecucion_presupuestal
FROM departamentos d
INNER JOIN empleados e 
    ON d.id_departamento = e.id_departamento
GROUP BY d.nombre, d.presupuesto
ORDER BY total_salarios DESC;

--==========================
-- Consulta 7 (Con formato).
-- Presupuesto y suma de los salarios por departamento y % de ejecución
-- presupuestal, ESTA VEZ CON FORMATO DE MONEDA, SEPARADORES DE MILES Y FORMATO PORCENTAJE
--==========================

-- Query 1:
SELECT 
    d.nombre AS departamento,
    TO_CHAR(d.presupuesto,'FM$999G999G999G999') AS presupuesto,
    TO_CHAR(SUM(e.salario), 'FM$999G999G999G999') AS total_salarios,
    TO_CHAR((SUM(e.salario)/d.presupuesto)*100,'FM990.00"%"') AS porcentaje_ejecucion_presupuestal
FROM departamentos d
INNER JOIN empleados e 
    ON d.id_departamento = e.id_departamento
GROUP BY d.presupuesto, d.nombre
ORDER BY total_salarios DESC;


-- Query 2:
SELECT 
    d.nombre AS departamento,
    TO_CHAR(d.presupuesto, 'FM$999G999G999G999') AS presupuesto,
    TO_CHAR(SUM(e.salario), 'FM$999G999G999G999') AS total_salarios,
    TO_CHAR((SUM(e.salario)/d.presupuesto)*100, 'FM990.00"%"') AS porcentaje_ejecucion_presupuestal
FROM departamentos d
INNER JOIN empleados e 
    ON d.id_departamento = e.id_departamento
GROUP BY d.presupuesto, d.nombre
ORDER BY total_salarios DESC;