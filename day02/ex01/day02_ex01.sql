SELECT gs.days::date as missing_date from generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) as gs(days)
left join (select person_id, visit_date from person_visits
			where (person_id = 1 or person_id = 2) and 
			(visit_date between '2022-01-01' and '2022-01-10')) as p
	on days = p.visit_date
where p.person_id is null
order by days;