select coalesce(u.name, 'not defined'),
	coalesce(u.lastname, 'not defined'),
	b.type,
	b.volume,
	coalesce(c.currency_name, 'not defined') as currency_name,
	coalesce(
		(
			select rate_to_usd
			from currency c1
			where c1.id = c.id
				and c1.updated = c.last_updated
		),
		1
	) as last_rate_to_usd,
	volume * coalesce(
		(
			select rate_to_usd
			from currency c1
			where c1.id = c.id
				and c1.updated = c.last_updated
		),
		1
	) as total_volume_in_usd
from (
		select user_id,
			sum(money) as volume,
			type,
			currency_id
		from balance
		group by user_id,
			type,
			currency_id
	) as b
	full join "user" u on u.id = b.user_id
	full join (
		select id,
			name as currency_name,
			max(updated) as last_updated
		from currency c
		group by id,
			name
	) as c on c.id = b.currency_id
order by 1 desc,
	2,
	3;