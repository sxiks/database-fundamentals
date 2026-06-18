CREATE TABLE departments (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    department_id INTEGER,

    FOREIGN KEY (department_id)
        REFERENCES departments(id)
        ON UPDATE CASCADE
);