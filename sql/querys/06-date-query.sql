-- завдання 16. Відобразити студентів, які проходять курс зараз (дата завершення ще не настала), з назвою курсу, датою завершення та кількістю днів, що залишилися до неї.
SELECT s.id,s.first_name,s.last_name,c.title,(cr.start_date+c.duration_weeks*7) AS completion_date,(cr.start_date+c.duration_weeks*7-current_date) AS day_remaining
FROM students AS s 
JOIN course_registration AS cr ON s.id=cr.student_id
JOIN courses AS c ON cr.course_code=c.course_code
WHERE current_date<cr.start_date+c.duration_weeks*7;