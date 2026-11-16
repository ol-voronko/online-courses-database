-- завдання 1. Відобразити імена та прізвища студентів і назви курсів, на які вони записувалися
SELECT
    s.id,
    s.first_name,
    s.last_name,
    c.title
FROM
    students AS s
    JOIN course_registration AS cr ON s.id = cr.student_id
    JOIN courses AS c ON cr.course_code = c.course_code
ORDER BY
    s.id;

--завдання 2. Створити представлення за запитом 1.
CREATE VIEW student_course AS (
    SELECT
        s.id,
        s.first_name,
        s.last_name,
        c.title
    FROM
        students AS s
        JOIN course_registration AS cr ON s.id = cr.student_id
        JOIN courses AS c ON cr.course_code = c.course_code
);

--студенти які не записані на жоден з курсів
SELECT
    s.id,
    s.first_name,
    s.last_name,
    s.birthday
FROM
    students AS s
    LEFT JOIN course_registration AS cr ON s.id = cre.student_id
WHERE
    cre.student_id IS NULL;
