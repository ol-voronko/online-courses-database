DROP TABLE IF EXISTS courses;

CREATE TABLE IF NOT EXISTS courses (
    course_code varchar(10) PRIMARY KEY,
    title varchar(128) NOT NULL CHECK (LENGTH(TRIM(title)) > 2),
    price int NOT NULL CHECK (price >= 0),
    category_id smallint NOT NULL REFERENCES categories (id),
    duration_weeks smallint NOT NULL CHECK (duration_weeks BETWEEN 1 AND 52),
    teacher_id int NOT NULL REFERENCES teachers (id)
);

INSERT INTO courses VALUES
('AI101','Основи штучного інтелекту',5500,6,4,6),
('PR101','Мистецтво створення промптів',7800,6,3,6),
('IMG101','Генерація зображень за допомогою ШІ',7500,6,5,3),
('VID101','Створення відео за допомогою ШІ',8500,6,6,3),
('AGT201','Створення AI-агентів',11000,6,8,3),
('PY101','Python з нуля до першого вебдодатку',24000,1,16,1),
('SQL101','Основи SQL та проєктування баз даних',8500,1,6,2),
('FE101','Frontend-розробка',21000,1,14,1),
('UIUX101','UI/UX дизайн мобільних застосунків',17500,2,12,4),
('GD201','Графічний дизайн та айдентика бренду',14000,2,10,4),
('SMM101','Таргетована реклама в Instagram та Facebook',6500,3,5,5),
('COPY101','Комплексний контент-маркетинг та копірайтинг',7200,3,6,5),
('SEO201','SEO-просування сайтів у пошукових системах',10500,3,8,5),
('XLS101','Excel та Google Таблиці для фінансового аналізу',4800,4,4,2),
('PBI201','Бізнес-аналітика та візуалізація даних у Power BI',11500,4,8,2),
('ENG101','Англійська для IT-спеціалістів (рівень B1–B2)',12000,5,12,7),
('ENG102','Ділова англійська для переговорів та листування',8400,5,8,7);


UPDATE courses
SET price=17000
WHERE course_code='PY101';