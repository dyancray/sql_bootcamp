create index idx_person_name on person
	(upper(name));

set enable_seqscan = off;
EXPLAIN ANALYZE
select name as person_name from person where upper(name) = 'DENIS';