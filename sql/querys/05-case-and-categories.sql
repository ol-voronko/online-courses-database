-- завдання 13.Вивести студент | курс | оцінка, щоб оцінка виводилася у вигляді тексту: 90–100 — «відмінно», 75–89 — «добре», 60–74 — «задовільно», 1–59 — «незадовільно», NULL — «ще не оцінено».
SELECT
    s.id,
    s.first_name,
    s.last_name,
    c.title,
    (
        CASE
            WHEN cr.rate BETWEEN 90 AND 100  THEN 'відмінно'
            WHEN cr.rate BETWEEN 75 AND 89  THEN 'добре'
            WHEN cr.rate BETWEEN 60 AND 74  THEN 'задовільно'
            WHEN cr.rate BETWEEN 1 AND 59  THEN 'незадовільно'
            ELSE 'ще не оцінено'
        END
    ) AS rate_text
FROM
    students AS s
    JOIN course_registration AS cr ON s.id = cr.student_id
    JOIN courses AS c ON cr.course_code = c.course_code;

-- завдання 14. Для кожної категорії вивести кількість курсів, загальну кількість записів на курси цієї категорії та середню оцінку.
SELECT
    cat.title,
    count(DISTINCT c.course_code),
    count(cr.id),
    avg(cr.rate)
FROM
    categories AS cat
    JOIN courses AS c ON cat.id = c.category_id
    LEFT JOIN course_registration AS cr ON c.course_code = cr.course_code
GROUP BY
    cat.title;

-- завдання 15. Відобразити викладачів, середня оцінка курсів яких вища за середню оцінку всіх курсів платформи.

WITH
    course_avg AS (
        SELECT
            c.teacher_id,
            c.course_code,
            avg(cr.rate) AS avg_rate
        FROM
            courses AS c
            JOIN course_registration AS cr ON c.course_code = cr.course_code
        GROUP BY
            c.teacher_id,
            c.course_code
    )
SELECT
    t.id,
    t.first_name,
    t.last_name,
    avg(course_avg.avg_rate) AS teacher_avg_rate
FROM
    teachers AS t
    JOIN course_avg ON t.id  = course_avg.teacher_id
GROUP BY
    t.id
HAVING
    avg(course_avg.avg_rate) > (
        SELECT
            avg(ca.avg_rate)
        FROM
            course_avg AS ca
    );
