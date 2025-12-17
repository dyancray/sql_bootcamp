select person.name as person_name, pizza_name, pizzeria.name as pizzeria_name
from person inner join person_order on person.id = person_order.person_id
inner join menu on menu.id = person_order.menu_id
inner join pizzeria on pizzeria.id = menu.pizzeria_id
order by person_name, pizza_name, pizzeria_name;
