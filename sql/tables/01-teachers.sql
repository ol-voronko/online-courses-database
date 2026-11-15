DROP TABLE IF EXISTS teachers;

CREATE TABLE IF NOT EXISTS teachers (
    id serial PRIMARY key,
    first_name varchar(64) NOT NULL CHECK (LENGTH(TRIM(first_name)) >= 2),
    last_name varchar(128) NOT NULL CHECK (LENGTH(TRIM(last_name)) >= 2),
    experience_years smallint NOT NULL CHECK (experience_years BETWEEN 0 AND 50) DEFAULT 0
);

INSERT INTO
    teachers (first_name, last_name, experience_years)
VALUES
    ('Іван', 'Грінкін', 10),
    ('Олена', 'Здановська', 14),
    ('Володимир', 'Перетятько', 7),
    ('Марія', 'Суханова', 6),
    ('Ірина', 'Оборіна', 6),
    ('Антон', 'Романов', 2),
    ('Аліса', 'Зайцева', 8),
    ('Томас', 'Айвазян', 4);
    SELECT* FROM teachers;