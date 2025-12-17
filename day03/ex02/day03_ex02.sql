select pizza.pizza_name, price, pizza.name as pizzeria_name 
from (select * from menu join pizzeria on menu.pizzeria_id = pizzeria.id) as pizza
except
select pizza_name, price, name as pizzeria_name from (select * from menu join pizzeria on menu.pizzeria_id = pizzeria.id join person_order on menu.id = person_order.menu_id)
order by pizza_name, price;