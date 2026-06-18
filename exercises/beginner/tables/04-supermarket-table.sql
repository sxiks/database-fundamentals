CREATE DATABASE supermercado;

USE supermercado;

CREATE TABLE productos (
    id_producto INT PRIMARY KEY AUTO_INCREMENT,
    nombre_producto VARCHAR (30),
    descripcion_producto TEXT,
    categoria_producto VARCHAR (30),
    precio_producto DECIMAL (10,2),
    activo_producto BOOLEAN
);