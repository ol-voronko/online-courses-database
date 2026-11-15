CREATE OR REPLACE FUNCTION check_course_completion_before_rating () RETURNS TRIGGER AS $$
DECLARE period smallint;
BEGIN
 SELECT duration_weeks INTO period
 FROM courses
 WHERE course_code=NEW.course_code;
 
 IF NEW.rate IS NOT NULL THEN
        IF current_date>=NEW.start_date+period*7
             THEN NULL;
        ELSE RAISE EXCEPTION 'Курс не завершено-оцінку виставити не можна';
        END IF;    
  END IF;     
RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_set_course_rate
BEFORE INSERT OR UPDATE of rate ON course_registration FOR EACH ROW
EXECUTE FUNCTION check_course_completion_before_rating ();
