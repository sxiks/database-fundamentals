CREATE DATABASE tienda;

USE tienda;

create TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    tipo_documento VARCHAR(20) NOT NULL,
    numero_documento VARCHAR(20) NOT NULL UNIQUE,
    nombre_cliente VARCHAR(100) NOT NULL,
    direccion_cliente TEXT(200),
    fecha_nacimiento DATE,
    email_cliente LONGTEXT NOT NULL UNIQUE,
    celular CHAR(15)
);

SELECT * FROM clientes;

