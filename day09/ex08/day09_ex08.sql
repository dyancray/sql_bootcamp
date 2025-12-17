create or replace function fnc_fibonacci(pstop integer default 10)
returns table(num bigint) as $$
	with recursive fib(a,b) as(
		select 0 as a, 1 as b
		union
		select b, a+b from fib where b < pstop
	)
	select a from fib;
$$ LANGUAGE SQL;

-- select * from fnc_fibonacci(100);
-- select * from fnc_fibonacci();
