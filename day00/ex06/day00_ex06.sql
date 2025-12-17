SELECT
    (SELECT name FROM person P WHERE P.id = PO.person_id) AS name,
    (CASE
        WHEN
            (SELECT name FROM person P WHERE P.id = PO.person_id) like 'Denis'
        THEN
            true
        ELSE
            false
        END) AS check_name
FROM person_order PO
    WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18 ) AND order_date ='2022-01-07'