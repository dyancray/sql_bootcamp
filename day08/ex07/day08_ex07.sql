-- session #1
START TRANSACTION;
update pizzeria set rating = 0.3 where id = 1;
update pizzeria set rating = 0.5 where id = 2;
commit;
-- session #2
START TRANSACTION;
update pizzeria set rating = 0.4 where id = 2;
update pizzeria set rating = 0.6 where id = 1;
commit;