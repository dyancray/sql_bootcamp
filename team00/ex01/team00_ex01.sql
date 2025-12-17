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
	or total_cost = (SELECT MAX(total_cost) FROM final_tours)
ORDER BY total_cost, tour;