CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),

    category_id INTEGER NOT NULL,

    FOREIGN KEY (category_id)
        REFERENCES categories(id)
);