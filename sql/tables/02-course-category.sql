CREATE TABLE IF NOT EXISTS categories (
    id smallserial PRIMARY KEY,
    title varchar(64) NOT NULL CHECK (LENGTH(TRIM(title)) > 1 ) UNIQUE
);
DROP TABLE categories;
