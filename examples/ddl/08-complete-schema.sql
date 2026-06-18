CREATE DATABASE IF NOT EXISTS academic_db;
USE academic_db;

DROP TABLE IF EXISTS students;

CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    enrollment_date DATE NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO students (
    first_name,
    last_name,
    email,
    enrollment_date
)
VALUES
(
    'Jean',
    'Cardona',
    'jean.cardona@example.com',
    '2026-01-15'
),
(
    'Alan',
    'Turing',
    'alan.turing@example.com',
    '2026-02-01'
);