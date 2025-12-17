create view v_generated_dates (generated_date) as
	select gs.days::date 
	from generate_series('2022-01-01'::date, '2022-01-31'::date, 
	'1 day'::interval) as gs(days)
	order by days;