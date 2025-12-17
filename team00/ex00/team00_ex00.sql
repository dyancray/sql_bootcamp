CREATE TABLE nodes
(	id serial primary key,
	point1 varchar not null,
	point2 varchar not null,
	cost numeric not null default 0
);

alter table nodes add constraint ch_point1 check ( point1 in ('a','b','c','d') );
alter table nodes add constraint ch_point2 check ( point2 in ('a','b','c','d') );

insert into nodes (point1, point2, cost) values 
('a', 'b', 10), ('b', 'a', 10),
('a', 'c', 15), ('c', 'a', 15),
('a', 'd', 20), ('d', 'a', 20),
('b', 'd', 25), ('d', 'b', 25),
('b', 'c', 35), ('c', 'b', 35),
('c', 'd', 30), ('d', 'c', 30);

WITH RECURSIVE traffic AS (
    SELECT point1, point2, ARRAY[point1, point2] AS path, cost AS total_cost
    FROM nodes
    WHERE point1 = 'a' 
    
    UNION
    
    SELECT n.point1, n.point2, array_append(path,n.point2), total_cost + n.cost
    FROM nodes n
    JOIN traffic t ON t.point2 = n.point1 
    WHERE NOT n.point2 = ANY(path)
),
final_tours AS (
    SELECT 
        (total_cost + (SELECT cost FROM nodes WHERE point2 = 'a' AND point1 = path[array_length(path, 1)])) AS total_cost,
        array_append(path, 'a') AS tour
    FROM traffic
    WHERE array_length(path, 1) = 4
)
SELECT *
FROM final_tours
WHERE total_cost = (SELECT MIN(total_cost) FROM final_tours)
ORDER BY total_cost, tour;
	
	
	