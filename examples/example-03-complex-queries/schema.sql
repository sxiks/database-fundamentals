USE academic_db;

-- Query 1: Get all active students with their enrolled courses
SELECT 
    s.first_name,
    s.last_name,
    c.title AS course_title,
    e.enrollment_status
FROM students s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.id
WHERE s.is_active = TRUE;

-- Query 2: Aggregate - Total credits per student
SELECT 
    s.id,
    s.first_name,
    s.last_name,
    SUM(c.credits) AS total_credits
FROM students s
JOIN enrollments e ON s.id = e.student_id
JOIN courses c ON e.course_id = c.id
GROUP BY s.id, s.first_name, s.last_name
HAVING total_credits > 3;