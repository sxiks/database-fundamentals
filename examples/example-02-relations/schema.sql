USE academic_db;

-- Drop existing tables if needed (reverse order of dependencies)
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;

-- Create courses table
CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    credits INT NOT NULL CHECK (credits > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create junction table for M:N relationship
CREATE TABLE enrollments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_status VARCHAR(20) DEFAULT 'ACTIVE',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(id) ON DELETE CASCADE,
    UNIQUE(student_id, course_id) -- Prevent duplicate enrollments
);

-- Insert courses
INSERT INTO courses (title, credits) VALUES 
('Database Systems', 4),
('Python Fundamentals', 3);

-- Insert relations
INSERT INTO enrollments (student_id, course_id) VALUES 
(1, 1),
(1, 2),
(2, 1);