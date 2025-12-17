select address, p.name, count(*) from person_order po
join person per on per.id = po.person_id
join menu m on m.id = po.menu_id 
join pizzeria p on p.id = m.pizzeria_id
group by address, p.name
order by address, p.name;