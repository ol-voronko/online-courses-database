CREATE TABLE IF NOT EXISTS students (
    id serial PRIMARY KEY,
    first_name varchar(24) NOT NULL CHECK (LENGTH(TRIM(first_name)) >= 2),
    last_name varchar(64) NOT NULL CHECK (LENGTH(TRIM(last_name)) >= 2),
    birthday date NOT NULL CHECK (
        EXTRACT(
            year
            from
                age (birthday)
        ) BETWEEN 12 AND 100
    ),
    email varchar(64) NOT NULL CHECK (
        email LIKE '%@%.%'
        AND TRIM(email) != ''
    ) UNIQUE
);

-- ALTER TABLE students
-- DROP COLUMN course_id;
DROP TABLE students;