comment on table person_discounts is 'discounts for persons';
comment on column person_discounts.id is 'primary key id';
comment on column person_discounts.person_id is 'foreign key person id';
comment on column person_discounts.pizzeria_id is 'foreign key pizzeria id';
comment on column person_discounts.discount is 'discount person-pizzeria';