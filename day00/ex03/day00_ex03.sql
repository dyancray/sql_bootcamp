select distinct person.id from person 
join person_visits on person.id = person_visits.person_id
where (visit_date >= '2022-01-06' and visit_date <= '2022-01-09') or pizzeria_id = 2
order by person.id DESC;