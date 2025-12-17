select
	p.name as name,m.pizza_name as pizza_name,price, 
	(m.price - (m.price * pd.discount/100))::numeric(5,2) as discount_price, 
	pi.name as pizzeria_name
from person p join person_order po on p.id = po.person_id
	join menu m on po.menu_id = m.id
	join pizzeria pi on pi.id = m.pizzeria_id
	join person_discounts pd on pd.person_id = p.id 
		and pd.pizzeria_id = pi.id
order by name, pizza_name;
