DROP TABLE IF EXISTS students;

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

INSERT INTO students (first_name,last_name,birthday,email)
VALUES('Олена','Коваленко','2008-12-05','olkoval@gmail.com'),
('Андрій', 'Мельник', '1995-03-14', 'andmel@gmail.com'),
('Марія', 'Шевченко', '2001-07-22', 'marshev@gmail.com'),
('Дмитро', 'Бондаренко', '1988-11-09', 'dmbon@gmail.com'),
('Катерина', 'Ткаченко', '2004-02-18', 'kattk@gmail.com'),
('Максим', 'Кравченко', '1999-06-30', 'maxkrav@gmail.com'),
('Софія', 'Мороз', '2007-09-12', 'sof.moroz@gmail.com'),
('Віктор', 'Лисенко', '1979-04-25', 'vlysenko@gmail.com'),
('Наталія', 'Петренко', '1992-12-03', 'natpet@gmail.com'),
('Богдан', 'Романюк', '2005-05-17', 'bogrom@gmail.com'),
('Ірина', 'Мельничук', '1985-08-21', 'ir.mel@gmail.com'),
('Олександр', 'Савченко', '1968-01-11', 'olsav@gmail.com'),
('Анастасія', 'Клименко', '2002-10-06', 'anast.kl@gmail.com'),
('Юлія', 'Шевчук', '1998-04-12', 'yuliya.shevchuk@gmail.com'),
('Сергій', 'Кравець', '1983-09-25', 'serhii.kravets@gmail.com'),
('Дарина', 'Поліщук', '2003-01-17', 'daryna.pol@gmail.com'),
('Михайло', 'Бойко', '1996-06-08', 'mykhailo.boyko@gmail.com'),
('Валерія', 'Гончаренко', '2005-11-21', 'valeria.gonchar@gmail.com'),
('Павло', 'Шевченко', '1975-02-14', 'pavlo.shevchenko@gmail.com'),
('Вікторія', 'Ковальчук', '2000-08-19', 'viktoria.kovalchuk@gmail.com'),
('Роман', 'Олійник', '1990-12-07', 'roman.oliinyk@gmail.com'),
('Єлизавета', 'Мазур', '2006-03-29', 'elyzaveta.mazur@gmail.com'),
('Тарас', 'Козак', '1987-07-16', 'taras.kozak@gmail.com'),
('Оксана', 'Гриценко', '1972-10-04', 'oksana.hrytsenko@gmail.com'),
('Артем', 'Сидоренко', '2001-05-23', 'artem.sydorenko@gmail.com'),
('Поліна', 'Левченко', '2008-06-11', 'polina.levchenko@gmail.com'),
('Вадим', 'Тимошенко', '1993-03-05', 'vadym.tymoshenko@gmail.com'),
('Злата', 'Мельник', '2004-12-18', 'zlata.melnyk@gmail.com'),
('Євген', 'Данилюк', '1981-01-30', 'yevhen.danyliuk@gmail.com'),
('Алла', 'Кириленко', '1997-09-13', 'alla.kyrylenko@gmail.com'),
('Назар', 'Федоренко', '2002-04-26', 'nazar.fedorenko@gmail.com'),
('Лілія', 'Остапенко', '1965-08-02', 'liliia.ostapenko@gmail.com'),
('Кирило', 'Захарченко', '1999-11-15', 'kyrylo.zakharchenko@gmail.com'),
('Марта', 'Кучеренко', '2007-02-09', 'marta.kucherenko@gmail.com'),
('Денис', 'Яценко', '1989-05-20', 'denys.yatsenko@gmail.com'),
('Соломія', 'Білик', '2000-10-28', 'solomiia.bilyk@gmail.com'),
('Ігор', 'Черненко', '1978-06-14', 'ihor.chernenko@gmail.com'),
('Вероніка', 'Дорошенко', '2005-07-03', 'veronika.doroshenko@gmail.com'),
('Аліна', 'Айвазян', '2006-02-14', 'alina.ayvazyan@gmail.com'),
('Данило', 'Лі', '2005-08-23', 'danylo.li@gmail.com'),
('Вікторія', 'Зайцева', '2004-11-06', 'viktoria.zaitseva@gmail.com'),
('Матвій', 'Мовчан', '2007-04-19', 'matvii.movchan@gmail.com'),
('Анастасія', 'Кириченко', '2003-07-12', 'anastasiia.kyrychenko@gmail.com'),
('Максим', 'Вишневський', '2006-09-28', 'maksym.vyshnevskyi@gmail.com'),
('Софія', 'Кравець', '2005-01-31', 'sofiia.kravets@gmail.com'),
('Артем', 'Голуб', '2004-05-17', 'artem.holub@gmail.com'),
('Єва', 'Семенова', '2007-12-09', 'yeva.semenova@gmail.com'),
('Богдан', 'Руденко', '2002-03-25', 'bohdan.rudenko@gmail.com'),
('Дарина', 'Кучма', '2006-06-03', 'daryna.kuchma@gmail.com'),
('Назар', 'Онищенко', '2003-10-21', 'nazar.onyshchenko@gmail.com'),
('Поліна', 'Бабенко', '2005-04-08', 'polina.babenko@gmail.com'),
('Кирило', 'Шульга', '2004-08-15', 'kyrylo.shulha@gmail.com'),
('Марія', 'Горобець', '2007-01-26', 'mariia.horobets@gmail.com'),
('Олексій', 'Абрамов', '2001-12-04', 'oleksii.abramov@gmail.com'),
('Ілля', 'Кім', '2000-06-18', 'illia.kim@gmail.com'),
('Катерина', 'Черниш', '1998-09-11', 'kateryna.chernysh@gmail.com'),
('Михайло', 'Багіров', '1995-02-27', 'mykhailo.bahirov@gmail.com'),
('Олена', 'Скорик', '1989-11-13', 'olena.skoryk@gmail.com'),
('Марк', 'Арутюнян', '2005-03-18', 'mark.arutyunyan@gmail.com'),
('Емілія', 'Кравченко', '2006-07-24', 'emilia.kravchenko@gmail.com'),
('Тимур', 'Бондар', '2004-01-09', 'tymur.bondar@gmail.com'),
('Аміна', 'Хан', '2007-05-16', 'amina.khan@gmail.com'),
('Давид', 'Мартиросян', '2003-09-27', 'david.martirosyan@gmail.com'),
('Мілана', 'Рибак', '2006-12-11', 'milana.rybak@gmail.com'),
('Ярослав', 'Сорока', '2005-04-02', 'yaroslav.soroka@gmail.com'),
('Ніка', 'Баранова', '2007-08-19', 'nika.baranova@gmail.com'),
('Тимофій', 'Коваленко', '2004-06-13', 'tymofii.kovalenko@gmail.com'),
('Еліна', 'Сафарова', '2005-10-30', 'elina.safarova@gmail.com'),
('Ростислав', 'Гаврилюк', '2002-02-21', 'rostyslav.havryliuk@gmail.com'),
('Меланія', 'Демченко', '2006-11-05', 'melaniia.demchenko@gmail.com'),
('Арсен', 'Пак', '2003-07-14', 'arsen.park@gmail.com'),
('Леся', 'Волошина', '2005-01-28', 'lesia.voloshyna@gmail.com'),
('Гліб', 'Назаренко', '2004-09-06', 'hlib.nazarenko@gmail.com'),
('Едуард', 'Мурадян', '2001-12-17', 'eduard.muradian@gmail.com'),
('Віра', 'Дяченко', '1999-05-22', 'vira.diachenko@gmail.com'),
('Станіслав', 'Бойчук', '1996-08-10', 'stanislav.boichuk@gmail.com'),
('Людмила', 'Романова', '1987-03-04', 'liudmyla.romanova@gmail.com'),
('Руслан', 'Мельниченко', '1992-11-26', 'ruslan.melnychenko@gmail.com');

SELECT* FROM students;

