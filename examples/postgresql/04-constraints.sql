CREATE TABLE instructors (
    id SERIAL PRIMARY KEY,

    email VARCHAR(100) UNIQUE NOT NULL,

    salary NUMERIC(10,2)
        CHECK (salary > 0),

    is_active BOOLEAN DEFAULT TRUE
);