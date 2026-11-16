-- завдання 6.Відобразити середню оцінку та кількість записів на курси для кожного студента, у тому числі для студентів, які ще не записувалися на жоден курс.
SELECT
    s.id,
    avg(cr.rate),
    count(cr.*)
FROM
    students AS s
    LEFT JOIN course_registration AS cr ON s.id = cr.student_id
GROUP BY
    s.id
ORDER BY
    s.id;

-- завдання 7. Відобразити студентів, які мають середню оцінку вище 80.
SELECT
    s.id,
    s.first_name,
    s.last_name,
    avg(cr.rate)
FROM
    students AS s
    JOIN course_registration AS cr ON s.id = cr.student_id
GROUP BY
    s.id,
    s.first_name,
    s.last_name
HAVING
    avg(cr.rate) > 80
ORDER BY
    s.id;

