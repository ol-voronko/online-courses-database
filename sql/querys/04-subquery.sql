-- завдання 8.Відобразити курси, на які ще жодного разу ніхто не записувався.
SELECT
    c.course_code,
    c.title
FROM
    courses AS c
    LEFT JOIN course_registration AS cr ON c.course_code = cr.course_code
WHERE
    cr.course_code IS NULL;

-- завдання 9. Отримати список студентів, які народилися в тому ж місяці, що й Олена Коваленко (саму Олену в результат не включати).
SELECT
    id,
    first_name,
    last_name,
    birthday
FROM
    students
WHERE
    EXTRACT(
        month
        from
            birthday
    ) = (
        SELECT
            EXTRACT(
                month
                from
                    birthday
            )
        FROM
            students
        WHERE
            first_name = 'Олена'
            AND last_name = 'Коваленко'
    )
    AND NOT (
        first_name = 'Олена'
        AND last_name = 'Коваленко'
    );

-- завдання 10.Відобразити студентів, які мають середню оцінку вищу, ніж Олена Коваленко.
SELECT
    s.id,
    s.first_name,
    s.last_name,
    avg(cr.rate) AS avg_rate
FROM
    students AS s
    JOIN course_registration AS cr ON s.id = cr.student_id
GROUP BY
    s.id
HAVING
    avg(cr.rate) > (
        SELECT
            avg(cr.rate)
        FROM
            course_registration AS cr
            JOIN students AS s ON cr.student_id = s.id
        WHERE
            s.first_name = 'Олена'
            AND s.last_name = 'Коваленко'
    );

-- завдання 11. Отримати список курсів, вартість яких більша, ніж у курсу PY101.
SELECT
    course_code,
    title,
    price
FROM
    courses
WHERE
    price > (
        SELECT
            price
        FROM
            courses
        WHERE
            course_code = 'PY101'
    );

--завдання 11. Отримати список студент | курс | оцінка, де оцінка має бути більшою за будь-яку оцінку Олени Коваленко.
SELECT
    s.id,
    s.first_name,
    s.last_name,
    c.title,
    cr.rate
FROM
    students AS s
    JOIN course_registration AS cr ON s.id = cr.student_id
    JOIN courses AS c ON cr.course_code = c.course_code
WHERE
    cr.rate > All(
        SELECT
            cr.rate
        FROM
            course_registration AS cr
            JOIN students AS s ON cr.student_id = s.id
        WHERE
            s.first_name = 'Олена'
            AND s.last_name = 'Коваленко'
    )
    ORDER BY s.id;