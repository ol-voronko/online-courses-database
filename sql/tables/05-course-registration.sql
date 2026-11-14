CREATE TABLE IF NOT EXISTS course_registration (
    id serial PRIMARY KEY,
    course_code varchar(10) NOT NULL REFERENCES courses (course_code),
    student_id int NOT NULL REFERENCES students (id),
    start_date date NOT NULL CHECK (start_date >= current_date),
    rate int CHECK (rate BETWEEN 1 AND 100) DEFAULT NULL,
    created_at timestamp NOT NULL DEFAULT current_timestamp,
    UNIQUE (course_code, student_id, start_date)
);

DROP TABLE IF EXISTS course_registration;