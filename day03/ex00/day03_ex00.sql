select pizza.pizza_name, pizza.price, pizza.name as pizzeria_name, kate.visit_date
from (select * from menu join pizzeria on menu.pizzeria_id = pizzeria.id where price between '800' and '1000') as pizza
join (select * from person join person_visits on person.id = person_visits.person_id where name = 'Kate') as kate on pizza.pizzeria_id = kate.pizzeria_id
order by pizza_name, price, pizzeria_name;