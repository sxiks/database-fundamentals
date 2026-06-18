
/*
 -- =================================================================
-- TRABAJO DE CLASE: CREACIÓN DE LA TABLA DE USUARIOS
-- OBJETIVO: Crear un contenedor seguro para guardar datos personales.
-- =================================================================

-- Paso 1: Le decimos al sistema qué base de datos vamos a abrir.
USE `prueba-database`;

-- Paso 2: Orden para crear la tabla de forma segura.
-- Ponemos "IF NOT EXISTS" para evitar errores si la tabla ya está creada.
CREATE TABLE IF NOT EXISTS usuarios (
    
    -- Columna 1: El código de identificación. Es un número que se suma solo (1,2,3...).
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Columna 2: Espacio para el nombre completo. No se puede dejar vacío.
    nombre VARCHAR(100) NOT NULL,
    
    -- Columna 3: El correo electrónico. La regla UNIQUE evita que dos personas usen el mismo.
    email VARCHAR(250) UNIQUE NOT NULL,
    
    -- Columna 4: Guarda el día y la hora del registro en el sistema de forma automática.
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP

) 
-- Paso 3: Configuración del idioma y la seguridad de la tabla.
-- Usamos "utf8mb4" para que la tabla acepte tildes, eñes y emojis sin romperse.
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
 */

-- 1. Limpiamos cualquier intento fallido anterior
DROP TABLE IF EXISTS usuarios;

-- 2. Nos paramos en tu base de datos
USE `prueba-database`;

-- 3. Creamos la tabla limpia con sus 3 columnas principales
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(250) UNIQUE NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;