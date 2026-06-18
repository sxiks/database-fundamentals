
-- Archivo: Creacion de tabla para almacenar informacion de libros
CREATE TABLE libros (
    id_libro INT AUTO_INCREMENT PRIMARY KEY,    -- Identificador unico para cada libro
    titulo VARCHAR(150) NOT NULL,               -- Titulo del libro, maximo 150 caracteres, OBLIGATORIO
    autor VARCHAR(100) NOT NULL,                -- Nombre del autor, OBLIGATORIO
    anio_publicacion INT,                       -- Año en que se publico el libro, OPCIONAL
    disponibilidad BOOLEAN DEFAULT TRUE         -- Indica si el libro esta disponible para prestamo, por defecto es TRUE
);
