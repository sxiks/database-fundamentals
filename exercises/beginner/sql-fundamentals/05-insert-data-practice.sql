CREATE database supermarket;

USE supermarket;

CREATE TABLE productos(
	id_producto INT PRIMARY KEY AUTO_INCREMENT,
	nombre_producto VARCHAR(30),
	descripcion_producto VARCHAR(30),
	precio_producto DECIMAL (10),
	producto_acivo BOOLEAN DEFAULT TRUE,
	fecha_producto DATETIME DEFAULT CURRENT_TIMESTAMP()
);

ALTER TABLE productos
ADD cantidad_prodcto INT AFTER fecha_producto;

SELECT * FROM productos;

ALTER TABLE supermarket.productos 
CHANGE fecha_producto fecha_caducidad datetime DEFAULT CURRENT_TIMESTAMP  NULL;

SELECT * FROM productos;

INSERT INTO productos (nombre_producto, descripcion_producto, precio_producto, cantidad_prodcto)
VALUES
("Colgate","Crema dental",4500,5),
("Jabon","Jabon de loza",2500,10),
("Bombon","Caramelos",1800,20);
