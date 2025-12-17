create materialized view mv_dmitriy_visits_and_eats (pizzeria_name) as 
	select p.name as pizzeria_name 
	from pizzeria p
	join (select * from menu where price < '800') 
		as m on m.pizzeria_id = p.id
	join (select * from person_visits where visit_date = '2022-01-08') 
		as pv on p.id = pv.pizzeria_id
	join (select * from person where name like 'Dmitriy') 
		as per on pv.person_id = per.id

	