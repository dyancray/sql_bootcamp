set enable_seqscan = off;
EXPLAIN ANALYZE
select pizza_name, name as pizzeria_name from menu m 
join pizzeria p on p.id = m.pizzeria_id;