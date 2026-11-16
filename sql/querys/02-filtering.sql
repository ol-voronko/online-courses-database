--завдання 3.Відобразити оцінку студентки Олени Коваленко для курсу PY101.

SELECT sc.first_name,sc.last_name,cr.course_code,cr.rate
FROM student_course AS sc
JOIN course_registration AS cr ON sc.id=cr.student_id
WHERE sc.first_name='Олена' AND sc.last_name='Коваленко' AND cr.course_code='PY101';

-- завдання 4.Відобразити студентів, які поставили хоча б одну оцінку нижче 60.

SELECT DISTINCT sc.first_name,sc.last_name
FROM student_course AS sc
JOIN course_registration AS cr ON sc.id=cr.student_id
WHERE cr.rate<60;

-- завдання 5.Відобразити студентів, які записувалися на курс PY101 та вже залишили оцінку.

SELECT  sc.first_name,sc.last_name,cr.course_code,cr.rate
FROM student_course AS sc
JOIN course_registration AS cr ON sc.id=cr.student_id
WHERE cr.course_code='PY101' AND cr.rate IS NOT NULL ;