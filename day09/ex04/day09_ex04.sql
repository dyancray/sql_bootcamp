create or replace function fnc_persons_female() 
	returns table(id bigint, name varchar, 
		age int, gender varchar, address varchar) as $$
	select * from person where gender = 'female';
$$ LANGUAGE SQL;

create or replace function fnc_persons_male() returns table
	(id bigint, name varchar, 
			age int, gender varchar, address varchar) as $$
	select * from person where gender = 'male';
$$ LANGUAGE SQL;

-- SELECT *
-- FROM fnc_persons_male();

-- SELECT *
-- FROM fnc_persons_female();