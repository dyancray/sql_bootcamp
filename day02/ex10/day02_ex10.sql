select first.name as person_name1, second.name as person_name2, first.address as common_address
from (select * from person) as first
join (select * from person) as second on first.address = second.address
where first.id > second.id
order by person_name1, person_name2, common_address;