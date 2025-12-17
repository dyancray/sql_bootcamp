with visits_count as (
    select name, count(*) as visit_count, 'visit' as action_type
    from pizzeria p join person_visits pv on p.id = pv.pizzeria_id 
    group by name
),
orders_count as (
    select name, count(*) as order_count, 'order' as action_type
    from pizzeria p join  menu m on p.id = m.pizzeria_id
	join person_order po on m.id = po.menu_id
    group by name
)

(select name, visit_count as count, action_type
from visits_count
order by count desc
limit 3)

union all

(select name, order_count as count, action_type
from orders_count
order by count desc
limit 3)

order by action_type asc, count desc;
