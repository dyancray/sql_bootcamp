drop function if exists fnc_persons_female();
drop function if exists fnc_persons_male();

create or replace function fnc_persons(pgender varchar DEFAULT 'female')
returns table(id bigint, name varchar, 
		age int, gender varchar, address varchar) as $$
	select * from person where gender = pgender;
$$ LANGUAGE SQL;

select * from fnc_persons('male');
select * from fnc_persons();