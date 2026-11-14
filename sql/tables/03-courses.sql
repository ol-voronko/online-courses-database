DROP TABLE courses;

CREATE TABLE IF NOT EXISTS courses (
    course_code varchar(10) PRIMARY KEY,
    title varchar(128) NOT NULL CHECK (LENGTH(TRIM(title)) > 2),
    price int NOT NULL CHECK (price >= 0),
    category_id smallint NOT NULL REFERENCES categories (id),
    duration_weeks smallint NOT NULL CHECK (duration_weeks BETWEEN 1 AND 52),
    teacher_id int NOT NULL REFERENCES teachers (id)
);