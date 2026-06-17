# Data Dictionary

## Table: students
| Column Name  | Data Type    | Constraints                  | Description                          |
|--------------|--------------|------------------------------|--------------------------------------|
| id           | INT          | PK, AUTO_INCREMENT           | Unique identifier for the student.   |
| first_name   | VARCHAR(50)  | NOT NULL                     | Student's given name.                |
| last_name    | VARCHAR(50)  | NOT NULL                     | Student's family name.               |
| email        | VARCHAR(100) | NOT NULL, UNIQUE             | Institutional email address.         |
| created_at   | TIMESTAMP    | DEFAULT CURRENT_TIMESTAMP    | Record creation date.                |

## Table: courses
| Column Name  | Data Type    | Constraints                  | Description                          |
|--------------|--------------|------------------------------|--------------------------------------|
| id           | INT          | PK, AUTO_INCREMENT           | Unique identifier for the course.    |
| title        | VARCHAR(100) | NOT NULL                     | Full name of the course.             |
| credits      | INT          | NOT NULL                     | Academic credits value.              |