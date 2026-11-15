DROP TABLE IF EXISTS categories;

CREATE TABLE IF NOT EXISTS categories (
    id smallserial PRIMARY KEY,
    title varchar(64) NOT NULL CHECK (LENGTH(TRIM(title)) > 1) UNIQUE
);

INSERT INTO
    categories (title)
VALUES
    ('Програмування'),
    ('Дизайн та графіка'),
    ('Маркетинг та SMM'),
    ('Аналітика даних'),
    ('Іноземні мови'),
    ('AI');

SELECT * FROM categories;
