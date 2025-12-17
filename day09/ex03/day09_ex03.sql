DROP TRIGGER trg_person_delete_audit ON person;
DROP TRIGGER trg_person_insert_audit ON person;
DROP TRIGGER trg_person_update_audit ON person;
DROP FUNCTION fnc_trg_person_delete_audit;
DROP FUNCTION fnc_trg_person_update_audit;
DROP FUNCTION fnc_trg_person_insert_audit;

create or replace function fnc_trg_person_audit()
	returns trigger as $$
begin 
	IF (TG_OP = 'DELETE') THEN 
		INSERT INTO person_audit (created, type_event, row_id, 
			name, age, gender, address)
    	VALUES (CURRENT_TIMESTAMP, 'D', OLD.id, OLD.name, 
			OLD.age, OLD.gender, OLD.address);
	ELSIF (TG_OP = 'UPDATE') THEN 
		INSERT INTO person_audit (created, type_event, 
			row_id, name, age, gender, address)
    	VALUES (CURRENT_TIMESTAMP, 'U', OLD.id, OLD.name, 
			OLD.age, OLD.gender, OLD.address);
	ELSEIF (TG_OP = 'INSERT') THEN 
		insert into person_audit (created, type_event,
			row_id, name, age, gender, address)
 		values (current_timestamp, 'I',  NEW.id, NEW.name, 
		 	NEW.age, NEW.gender, NEW.address);
	END IF;
	RETURN NULL;
end;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER trg_person_audit
AFTER INSERT OR DELETE OR UPDATE ON person
FOR EACH ROW
EXECUTE PROCEDURE fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)  VALUES (10,'Damir', 22, 'male', 'Irkutsk');
UPDATE person SET name = 'Bulat' WHERE id = 10;
UPDATE person SET name = 'Damir' WHERE id = 10;
DELETE FROM person WHERE id = 10;