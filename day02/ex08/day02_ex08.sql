select distinct men.name as name
from (select * from person where gender like 'male' and (address like 
				'Moscow' or address like 'Samara')) as men
join (select * from menu join (select * from person_order) as person_order on
				menu.id = person_order.menu_id 
				where pizza_name like 'pepperoni pizza' or pizza_name like 'mushroom pizza') as men_order
	on men.id = men_order.person_id
order by name desc;