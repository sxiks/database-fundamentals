CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100),

    author_id INTEGER,

    FOREIGN KEY (author_id)
        REFERENCES authors(id)
        ON DELETE CASCADE
);