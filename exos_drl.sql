-- 2.2.1
SELECT 
    login,
    year_result
FROM student
WHERE year_result > 16

-- 2.2.2
SELECT
    last_name,
    section_id
FROM student
WHERE first_name = 'Georges'

-- 2.2.3
SELECT
    last_name,
    year_result
FROM student
WHERE year_result BETWEEN 12 AND 16

-- 2.2.4
SELECT
    last_name,
    section_id,
    year_result
FROM student
WHERE section_id NOT IN (1010, 1020, 1110)

-- 2.2.5
SELECT
    last_name,
    section_id
FROM student
WHERE last_name LIKE '%r'

-- 2.2.6
SELECT
    last_name,
    year_result
FROM student
WHERE last_name LIKE '__n%' 
    AND year_result > 10

-- 2.2.7
SELECT
    last_name,
    year_result
FROM student
WHERE year_result <= 3
ORDER BY year_result DESC

-- 2.2.8
SELECT
    last_name + ' ' + first_name AS 'Nom complet',
    year_result
FROM student
WHERE section_id = '1010'
ORDER BY last_name ASC

-- 2.2.9
SELECT
    last_name,
    section_id,
    year_result
FROM student
WHERE section_id in ('1010', '1020') 
    AND year_result NOT BETWEEN 12 AND 18
ORDER BY section_id ASC

-- 2.2.10
SELECT
    last_name,
    section_id,
    year_result * 5 AS 'Résultat sur 100'
FROM student
WHERE section_id LIKE '13%' 
    AND year_result * 5 <= 60
ORDER BY year_result DESC

-----------------------------------------------------------------------

-- 2.3.12
SELECT
    login,
    YEAR(birth_date) AS 'Année de naissance'
FROM student
WHERE YEAR(birth_date) > 1970

-- 2.3.13
SELECT
    login,
    last_name
FROM student
WHERE LEN(last_name) >= 8

-- 2.3.15
SELECT
    first_name,
    last_name,
    login,
    LOWER(CONCAT(LEFT(first_name, 2), LEFT(last_name, 4))) AS 'Nouveau login'
    -- LOWER(CONCAT(SUBSTRING(first_name, 1, 2), SUBSTRING(last_name, 1, 4))) AS 'Nouveau login'
FROM student
WHERE year_result BETWEEN 6 AND 10

-- 2.3.16
SELECT
    first_name,
    last_name,
    login,
    CONCAT(RIGHT(first_name, 3), YEAR(GETDATE()) - YEAR(birth_date)) AS 'Nouveau login'
    -- CONCAT(SUBSTRING(first_name, LEN(first_name)-2, 3), YEAR(GETDATE()) - YEAR(birth_date)) AS 'Nouveau login'
FROM student
WHERE year_result IN (10, 12, 14)

-- 2.3.17
SELECT
    last_name,
    login,
    year_result
FROM student
WHERE LEFT(last_name, 1) IN ('d', 'm', 's') 
ORDER BY birth_date

-- 2.3.19
SELECT
    COUNT(last_name) AS 'Nbre de noms de plus de 7 lettres'
FROM student
WHERE LEN(last_name) >= 7

-- 2.3.21
SELECT
    last_name,
    year_result,
    CASE 
        WHEN year_result < 10 THEN 'inferieur'
        WHEN year_result = 10 THEN 'neutre'
        ELSE 'superieur'
    END AS 'Catégorie'
FROM student
WHERE YEAR(birth_date) BETWEEN 1955 AND 1965

-- 2.3.22
SELECT
    last_name,
    year_result,
    -- CONCAT_WS(' ', DAY(birth_date),
    -- CASE MONTH(birth_date)
    --     WHEN 1 THEN 'janvier'
    --     WHEN 2 THEN 'fevrier'
    --     WHEN 3 THEN 'mars'
    --     WHEN 4 THEN 'avril'
    --     WHEN 5 THEN 'mai'
    --     WHEN 6 THEN 'juin'
    --     WHEN 7 THEN 'juillet'
    --     WHEN 8 THEN 'aout'
    --     WHEN 9 THEN 'septembre'
    --     WHEN 10 THEN 'octobre'
    --     WHEN 11 THEN 'novembre'
    --     WHEN 12 THEN 'decembre'
    -- END, 
    -- YEAR(birth_date)) AS 'Literal_date'
    FORMAT(birth_date, 'dd MMMM yyyy', 'fr-FR') AS 'Literal_date'
FROM student
WHERE YEAR(birth_date) BETWEEN 1975 AND 1985

-------------------------------------------------------------

-- 2.3.14
SELECT
    UPPER(last_name) AS 'Nom de famille',
    first_name,
    year_result
FROM student
WHERE year_result >= 16
ORDER BY year_result DESC

-- 2.3.18
SELECT
    last_name,
    login,
    year_result
FROM student
WHERE year_result % 2 = 1 AND year_result > 10
ORDER BY year_result DESC

-- 2.3.20
SELECT
    last_name,
    year_result,
    CASE 
        WHEN year_result >= 12 THEN 'OK'
        ELSE 'KO'
    END AS 'Statut'
FROM student
WHERE YEAR(birth_date) < 1955

-- 2.3.23
SELECT
    last_name,
    MONTH(birth_date) AS 'Mois de naissance',
    year_result,
    NULLIF(year_result, 4)
FROM student
WHERE year_result < 7 AND MONTH(birth_date) NOT IN (12, 1, 2, 3)

-------------------------------------------------------------------------------

-- 2.4.6
SELECT
    section_id,
    COUNT(last_name)
FROM student
GROUP BY section_id

SELECT 
    section_id,
    AVG(year_result)
FROM student
GROUP BY section_id
HAVING AVG(year_result) > 10

SELECT
    section_id,
    AVG(year_result)
FROM student
WHERE year_result > 10
GROUP BY section_id

-- 2.4.7
SELECT
    section_id,
    MAX(year_result) AS 'Résultat maximum'
FROM student
GROUP BY section_id

-- 2.4.8
SELECT
    section_id,
    AVG(CAST(year_result AS FLOAT)) AS 'Moyenne'
FROM student
WHERE section_id LIKE '10%'
GROUP BY section_id

-- 2.4.9
SELECT
    MONTH(birth_date) AS 'Mois de naissance',
    AVG(year_result) AS 'Moyenne'
FROM student
WHERE YEAR(birth_date) BETWEEN 1970 AND 1985
GROUP BY MONTH(birth_date)

-- 2.4.10
SELECT
    section_id,
    AVG(CAST(year_result AS FLOAT)) AS 'Moyenne'
FROM student
GROUP BY section_id
HAVING COUNT(section_id) > 3

-- 2.4.11
SELECT
    section_id,
    AVG(year_result) AS 'Moyenne',
    MAX(year_result) AS 'Résultat maximum'
FROM student
GROUP BY section_id
HAVING AVG(year_result) > 8

--------------------------------------------------------------------------

-- 2.6.1
SELECT
    c.course_name,
    s.section_name,
    p.professor_name
FROM course c
JOIN professor p ON p.professor_id = c.professor_id
JOIN section s ON s.section_id = p.section_id

-- 2.6.2
SELECT
    se.section_id, --section, student
    se.section_name, --section
    st.last_name --student
FROM student st
JOIN section se ON st.student_id = se.delegate_id
ORDER BY section_id DESC

-- 2.6.3
SELECT
    s.section_id, --section, professor
    section_name, -- section
    professor_name -- professor
FROM professor p
RIGHT JOIN section s ON s.section_id = p.section_id
ORDER BY section_id DESC

-- 2.6.4
SELECT
    s.section_id, 
    section_name, 
    professor_name
FROM professor p
JOIN section s ON s.section_id = p.section_id
ORDER BY section_id DESC

-- 2.6.5
SELECT
    last_name, 
    year_result, 
    grade 
FROM student
JOIN grade ON year_result BETWEEN lower_bound AND upper_bound
WHERE year_result >= 12
ORDER BY grade

-- 2.6.6
SELECT
    professor_name, 
    section_name, 
    course_name, 
    course_ects 
FROM course c
RIGHT JOIN professor p ON p.professor_id = c.professor_id
JOIN section s ON s.section_id = p.section_id
ORDER BY course_ects DESC

-- 2.6.7
SELECT
    p.professor_id,
    SUM(course_ects) AS [ECTS_TOT]
FROM course c
RIGHT JOIN professor p ON p.professor_id = c.professor_id
GROUP BY p.professor_id
ORDER BY ECTS_TOT DESC

-- 2.6.8
SELECT
    first_name,
    last_name,
    'S' CATEGORIE
FROM student
WHERE LEN(last_name) > 8
UNION
SELECT 
    professor_name,
    professor_surname,
    'P'
FROM professor
WHERE LEN(professor_name) > 8

-- 2.6.9
SELECT
    s.section_id
FROM section s
LEFT JOIN professor p ON s.section_id = p.section_id
WHERE p.professor_name IS NULL

-- AUTRE MOYEN 2.6.9
SELECT
    section_id
FROM section
EXCEPT
SELECT
    section_id
FROM professor