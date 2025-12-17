with check_persons (pizzeria_name, male_count, female_count) as (
	select p.name, sum(case when gender = 'male' then 1 else 0 end), 
		sum(case when gender = 'female' then 1 else 0 end) from person 
		join person_visits po on po.person_id = person.id
		join pizzeria p on po.pizzeria_id = p.id
		group by p.name
)

select pizzeria_name
from check_persons
where male_count < female_count or male_count > female_count
order by pizzeria_name;