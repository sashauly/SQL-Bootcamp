WITH andrey_visits AS (
  SELECT pizzeria.name AS pizzeria_name
  FROM person_visits
    JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    JOIN person ON person.id = person_visits.person_id
  WHERE person.name = 'Andrey'
),
andrey_order AS (
  SELECT pizzeria.name AS pizzeria_name
  FROM person_order
    JOIN menu ON menu.id = person_order.menu_id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    JOIN person ON person.id = person_order.person_id
  WHERE person.name = 'Andrey'
)
SELECT pizzeria_name
FROM andrey_visits
EXCEPT
SELECT pizzeria_name
FROM andrey_order
ORDER BY pizzeria_name;