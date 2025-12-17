create view v_price_with_discount (name, pizza_name, price, discount_price) as
	select name, pizza_name, price, cast(price - price * 0.1 as integer) as discount_price
	from person p join person_order po on p.id = po.person_id
	join menu m on m.id = po.menu_id
	order by name, pizza_name