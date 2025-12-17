select name, count(person_id) as count_of_visits from person p
join person_visits pv on p.id = pv.person_id
group by name
having count(person_id) > 3;