SELECT 
    COUNT(*)
FROM student

SELECT
    COUNT(student_id),
    login
FROM student

SELECT 
    MIN(year_result), 
    MAX(birth_date)
FROM student
WHERE year_result > 12