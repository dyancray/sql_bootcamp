create or replace function fnc_person_visits_and_eats_on_date
	(pperson varchar DEFAULT 'Dmitriy', pprice numeric DEFAULT 500,
		pdate date default '2022-01-08') 
returns table (pizzeria_name varchar) as $$
BEGIN
	return query select pi.name from person p
	join person_visits pv on pv.person_id = p.id
	join pizzeria pi on pi.id = pv.pizzeria_id
	join menu m on m.pizzeria_id = pi.id
	where p.name = pperson and visit_date = pdate and pprice > price;
END; $$
language 'plpgsql';

-- select *
-- from fnc_person_visits_and_eats_on_date(pprice := 800);

-- select *
-- from fnc_person_visits_and_eats_on_date
-- (pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
