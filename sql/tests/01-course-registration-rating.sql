BEGIN;

INSERT INTO
    course_registration (
        course_code,
        student_id,
        start_date,
        rate,
        created_at
    )
VALUES
    ('GD201', 22, '2026-11-01', NULL, '2026-10-10');

SELECT
    id,
    rate
FROM
    course_registration
ORDER BY
    id DESC
limit
    10;

ROLLBACK;

BEGIN;
UPDATE course_registration
SET
    rate = 65
WHERE
    id = 77;

ROLLBACK;

BEGIN;

INSERT INTO
    course_registration (
        course_code,
        student_id,
        start_date,
        rate,
        created_at
    )
VALUES
    ('GD201', 22, '2026-11-01', 95, '2026-10-10');

ROLLBACK;

BEGIN;
INSERT INTO
    course_registration (
        course_code,
        student_id,
        start_date,
        rate,
        created_at
    )
VALUES
    ('GD201', 22, '2026-06-01', NULL, '2026-05-10');
ROLLBACK;
--перевірка правильності  виставлення оцінки при заповненні таблиці регістрацій курсів 
SELECT
    cr.course_code,
    cr.start_date,
    cr.rate,
    (
        current_date >= cr.start_date + c.duration_weeks * 7
    ) AS complete
FROM
    course_registration AS cr
    JOIN courses AS c ON cr.course_code = c.course_code
WHERE
    rate IS NOT NULL
    AND (
        current_date >= cr.start_date + c.duration_weeks * 7
    ) = false;