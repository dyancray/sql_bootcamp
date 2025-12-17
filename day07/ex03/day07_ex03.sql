with visits_count as (
    select name, count(*) as visit_count
    from pizzeria p join person_visits pv on p.id = pv.pizzeria_id 
    group by name
),
orders_count as (
    select name, count(*) as order_count
    from pizzeria p join  menu m on p.id = m.pizzeria_id
	join person_order po on m.id = po.menu_id
    group by name
)

select vc.name, (coalesce(visit_count,0) + coalesce(order_count,0)) as total_count 
from visits_count vc
full join orders_count oc on oc.name = vc.name
order by total_count desc, name asc;