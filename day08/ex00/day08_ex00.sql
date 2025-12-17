-- session #1
START TRANSACTION;
UPDATE pizzeria set rating = 5 where name = 'Pizza Hut';
select name, rating from pizzeria where name = 'Pizza Hut';
COMMIT;

-- session #2
select name, rating from pizzeria where name = 'Pizza Hut';
select name, rating from pizzeria where name = 'Pizza Hut';