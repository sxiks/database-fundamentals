CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO products (name, price)
VALUES
('Keyboard', 50.00),
('Mouse', 25.00),
('Monitor', 300.00);