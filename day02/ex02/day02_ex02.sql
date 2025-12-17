select COALESCE(person.name, '-') as person_name, visit_date, COALESCE(p.name, '-') as pizzeria_name
from person
full join (select visit_date, person_id, pizzeria_id from person_visits where visit_date between '2022-01-01' and '2022-01-03')as v
			on person.id = v.person_id
full join (select name,id from pizzeria) p on v.pizzeria_id = p.id
order by person_name, visit_date, p.name;