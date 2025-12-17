select p.name as pizzeria_name from pizzeria p
	  join (select person_id, pizzeria_id from person_visits pv 
	  join person p on p.id = pv.person_id where p.name = 'Andrey') as visited
	  on p.id = visited.pizzeria_id
except
	   select p.name from pizzeria p
	   join (select pizzeria_id, m.id from menu m
	   join person_order po on po.menu_id = m.id
	   join person p on p.id = po.person_id where p.name = 'Andrey') as ordered
	   on p.id = ordered.pizzeria_id