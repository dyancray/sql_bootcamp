with women_orders as
	(select * from person p join person_order as po on p.id = po.person_id
			join menu m on po.menu_id = m.id
				where gender like 'female')
select pepperoni.name from (select * from women_orders where pizza_name like '%pepperoni%') as pepperoni
	join (select * from women_orders where pizza_name like '%cheese%') as cheese on pepperoni.name = cheese.name
order by pepperoni.name;