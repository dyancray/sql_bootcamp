create or replace function func_minimum(VARIADIC arr numeric[])
returns numeric as $$
	SELECT min($1[i]) FROM generate_subscripts($1, 1) g(i);
$$ LANGUAGE SQL;

select func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);