create view v_persons_female as 
	select id, name, age, gender, address
	from person
	where gender = 'female';

create view v_persons_male as 
	select id, name, age, gender, address
	from person
	where gender = 'male';