CREATE TABLE IF NOT EXISTS teachers (
    id serial PRIMARY key,
    first_name varchar(64) NOT NULL CHECK (LENGTH(TRIM(first_name)) >= 2),
    last_name varchar(128) NOT NULL CHECK (LENGTH(TRIM(last_name)) >= 2),
    experience_years smallint NOT NULL CHECK (experience_years BETWEEN 0 AND 50) DEFAULT 0
);

DROP TABLE teachers;