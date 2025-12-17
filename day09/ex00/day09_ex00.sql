create table IF NOT EXISTS person_audit(
	created timestamp with time zone not null default CURRENT_TIMESTAMP,
	type_event char(1) not null default 'I',
	row_id bigint not null,
	name varchar,
	age integer,
	gender varchar,
	address varchar,
	constraint ch_type_event check ( type_event in ('I','U','D') )
);

create OR REPLACE function fnc_trg_person_insert_audit()
	returns trigger as $$
begin
 insert into person_audit (created, type_event, row_id, name, age, gender, address)
 	values (current_timestamp, 'I',  NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
 return null;
end;
$$
LANGUAGE 'plpgsql';

create trigger trg_person_insert_audit
	after insert 
	on person
	FOR EACH ROW
	EXECUTE PROCEDURE fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) 
	VALUES (10,'Damir', 22, 'male', 'Irkutsk');
	
