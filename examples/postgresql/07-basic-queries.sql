SELECT *
FROM students;

SELECT
    s.first_name,
    s.last_name,
    c.title
FROM students s
JOIN enrollments e
    ON s.id = e.student_id
JOIN courses c
    ON c.id = e.course_id;

SELECT
    c.title,
    COUNT(*) AS total_students
FROM enrollments e
JOIN courses c
    ON c.id = e.course_id
GROUP BY c.title;