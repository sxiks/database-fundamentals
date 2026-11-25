-- ============================================================
-- CLASS PRACTICE: DESAFIOS de practica
-- DataBase: PostgresSQL
-- Date: [23/09/2026]
-- Description: Practice with CREATE, ALTER, INSERT, UPDATE,
--              DELETE, SELECT, ORDER BY, GROUP BY, HAVING
-- ============================================================

--==========================
-- Practica, DESAFIO 1:
-- Inserte un nuevo empleado con la siguiente
-- información:
-- •id: 8
-- •nombre: Pedro
-- •cargo: Diseñador
-- •salario: 42000
-- •fecha de contratación: 2025-08-15
-- Valide posteriormente que sí ha quedado
-- correctamente registrado
--==========================

INSERT INTO empleados (id, nombre, cargo, salario, fecha_contratacion)
VALUES
(9,'Pedro','Diseñador', 42000, '2025-08-15');

-- Validacion:
SELECT * FROM empleados;


--==========================
-- Practica, DESAFIO 2:
-- Inserte en una sola sentencia SQL los siguientes empleados:
-- 10, Laura, Analista, 47000, 2026-01-15
-- 11, Andrés, Desarrollador, 39000, 2025-11-08
-- 12, Natalia, Gerente, 72000, 2023-06-20
--==========================
INSERT INTO empleados (id, nombre, cargo, salario, fecha_contratacion)
VALUES
(10, 'Laura', 'Analista', 47000, '2026-01-15'),
(11, 'Andrés', 'Desarrollador', 39000, '2025-11-08'),
(12, 'Natalia', 'Gerente', 72000, '2023-06-20');

-- Validacion:
SELECT * FROM empleados;


--==========================
-- Practica, DESAFIO 3:
-- Actualice el salario de Juan a 52000.
--==========================
-- Ejecutar la actualización
UPDATE empleados 
SET salario = 52000 
WHERE nombre = 'Juan';

-- Validacion:
SELECT * FROM empleados 
WHERE nombre = 'Juan';


--==========================
-- Practica, DESAFIO 4:
-- Implemente una actualización para que todos los
-- empleados cuyo cargo sea Desarrollador queden con un salario de 40000.
--==========================
-- 1. Ejecutar la actualización
UPDATE empleados 
SET salario = 40000 
WHERE cargo = 'Desarrollador';

-- 2. Validación (Comprobar en la tabla el cambio)
SELECT * FROM empleados 
WHERE cargo = 'Desarrollador';


--==========================
-- Practica, DESAFIO 5:
-- Implemente una consulta para mostrar todos los empleados.
--==========================
-- Implementación
SELECT * FROM empleados;

-- Validación visual: Revisar en la consola que aparezcan todas las filas y columnas, sin filtros aplicados.


--==========================
-- Practica, DESAFIO 6:
-- Implemente una consulta para mostrar únicamente los nombres de los empleados
--==========================
-- Implementación
SELECT nombre FROM empleados;

-- Validación visual: El resultado arrojado debe ser una única columna llamada "nombre".


--==========================
-- Practica, DESAFIO 7:
-- Implemente una consulta para mostrar únicamente los empleados cuyo cargo sea Analista.
--==========================
-- Implementación
SELECT * FROM empleados WHERE cargo = 'Analista';

-- Validación visual: Revisa la columna "cargo", no debe haber ningún registro diferente a 'Analista'.


--==========================
-- Practica, DESAFIO 8:
-- Implemente una consulta para mostrar únicamente los
-- empleados cuyo salario sea mayor que 40000.
--==========================
-- Implementación
SELECT * FROM empleados WHERE salario > 40000;

-- Validación visual: Ningún registro en los resultados debe tener un salario de 40000 o menor.


--==========================
-- Practica, DESAFIO 9:
-- Implemente una consulta para mostrar únicamente los
-- empleados contratados después del 1 de enero de 2025.
--==========================
-- Implementación
SELECT * FROM empleados WHERE fecha_contratacion > '2025-01-01';

-- Validación visual: Verificar la columna de fechas; todas deben ser del 2 de enero de 2025 en adelante.


--==========================
-- Practica, DESAFIO 10:
-- Implemente una consulta para mostrar únicamente:
-- nombre y fecha_contratacion de los empleados cuyo cargo sea Desarrollador.
--==========================
-- Implementación
SELECT nombre, fecha_contratacion 
FROM empleados 
WHERE cargo = 'Desarrollador';

-- Validación visual: El resultado debe tener exactamente dos columnas, mostrando solo a los desarrolladores.


--==========================
-- Practica, DESAFIO 11:
-- Implemente una consulta para mostrar los empleados ordenados por nombre de la A a la Z
--==========================
-- Implementación
SELECT * FROM empleados ORDER BY nombre ASC;

-- Validación visual: Lee la columna "nombre" de arriba hacia abajo para confirmar el estricto orden alfabético.


--==========================
-- Practica, DESAFIO 12:
-- Implemente una consulta para mostrar los empleados ordenados por salario de menor a mayor
--==========================
-- Implementación
SELECT * FROM empleados ORDER BY salario ASC;

-- Validación visual: Verifica que el primer registro tenga el salario más bajo y los siguientes vayan incrementando.


--==========================
-- Practica, DESAFIO 13:
-- Implemente una consulta para mostrar solo el “total de empleados” existentes en la tabla
--==========================
-- Implementación
SELECT COUNT(*) AS total_empleados FROM empleados;

-- Validación visual: El resultado debe ser una sola fila y una sola columna mostrando un único número.


--==========================
-- Practica, DESAFIO 14:
-- Implemente una consulta para mostrar el “salario promedio” de los empleados existentes en la tabla
--==========================
-- Implementación
SELECT AVG(salario) AS salario_promedio FROM empleados;

-- Validación visual: Debe devolver un único valor matemático con el promedio global.


--==========================
-- Practica, DESAFIO 15:
-- Implemente una consulta para mostrar la cantidad de empleados que existen en cada cargo
--==========================
-- Implementación
SELECT cargo, COUNT(*) AS cantidad_empleados 
FROM empleados GROUP BY cargo;

-- Validación visual: Debes ver una lista de todos los cargos únicos y al lado cuántas personas existen en cada uno.


--==========================
-- Practica, DESAFIO 16:
-- Implemente una consulta para mostrar el salario promedio por cargo
--==========================
-- Implementación
SELECT cargo, AVG(salario) AS salario_promedio 
FROM empleados GROUP BY cargo;

-- Validación visual: Por cada cargo único listado, debe mostrarse su cálculo salarial respectivo.


--==========================
-- Practica, DESAFIO 17:
-- Implemente una consulta que muestre los empleados cuyo salario se encuentra entre 35000 y 50000
--==========================
-- Implementación
SELECT * FROM empleados WHERE salario BETWEEN 35000 AND 50000;

-- Validación visual: No debe aparecer nadie que gane 34999 o menos, ni 50001 o más.


--==========================
-- Practica, DESAFIO 18:
-- Implemente una consulta que muestre los empleados que fueron contratados en el año 2025
--==========================
-- Implementación
SELECT * FROM empleados WHERE EXTRACT(YEAR FROM fecha_contratacion) = 2025;

-- Validación visual: Absolutamente todas las fechas arrojadas deben pertenecer al año 2025.


--==========================
-- Practica, DESAFIO 19:
-- Implemente una consulta que muestre los empleados cuyo cargo es “Analista” o “Gerente”
--==========================
-- Implementación
SELECT * FROM empleados WHERE cargo IN ('Analista', 'Gerente');

-- Validación visual: En la columna cargo de tu resultado solo pueden existir esos dos textos.


--==========================
-- Practica, DESAFIO 20:
-- Implemente una consulta que muestre los empleados cuyo salario es: 30000 o 45000 o 55000
--==========================
-- Implementación
SELECT * FROM empleados WHERE salario IN (30000, 45000, 55000);

-- Validación visual: Verifica que todos los registros devueltos encajen exactamente en una de esas tres cifras cerradas.