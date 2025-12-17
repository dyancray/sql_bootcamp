select p.name, count(person_id) as count_of_visits from person_visits pv
join person p on p.id = pv.person_id
group by p.name
order by count_of_visits desc, p.name
limit 4;