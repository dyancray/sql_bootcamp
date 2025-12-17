select address, round((max(age) - (min(age) / cast(max(age) as numeric))), 2) as formula, 
	round(avg(age),2) as average, round((max(age) - (min(age) / cast(max(age) as numeric))),2) > round(avg(age),2) as comparison
from person p
group by address
order by address;
	