select p1.pizza_name, p1.name as pizzeria_name1, p2.name as pizzeria_name2, p1.price
from (select p.id, pizza_name, name, price from menu m join pizzeria p on m.pizzeria_id = p.id) as p1
join (select p.id, pizza_name, name, price from menu m join pizzeria p on m.pizzeria_id = p.id) as p2
on p1.price = p2.price and p1.pizza_name = p2.pizza_name and p1.id > p2.id
order by pizza_name;