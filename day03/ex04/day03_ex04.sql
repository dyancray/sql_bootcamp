	(SELECT male.pizzeria_name from 
	(select pizzeria.name as pizzeria_name from pizzeria
	join menu m on m.pizzeria_id = pizzeria.id
	join person_order po on m.id = po.menu_id
	join person p on p.id = po.person_id
	where gender = 'male')  as male
except 
	SELECT female.pizzeria_name from 
	(select pizzeria.name as pizzeria_name from pizzeria
	join menu m on m.pizzeria_id = pizzeria.id
	join person_order po on m.id = po.menu_id
	join person p on p.id = po.person_id
	where gender = 'female') as female)
union 
	(SELECT female.pizzeria_name from 
	(select pizzeria.name as pizzeria_name from pizzeria
	join menu m on m.pizzeria_id = pizzeria.id
	join person_order po on m.id = po.menu_id
	join person p on p.id = po.person_id
	where gender = 'female') as female
except 
	SELECT male.pizzeria_name from (select pizzeria.name as pizzeria_name from pizzeria
	join menu m on m.pizzeria_id = pizzeria.id
	join person_order po on m.id = po.menu_id
	join person p on p.id = po.person_id
	where gender = 'male') as male)
order by pizzeria_name;