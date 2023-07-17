WITH dmitriy_visits AS(
  SELECT pizzeria.id
  FROM pizzeria
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person.id = person_visits.person_id
  WHERE person.name = 'Dmitriy'
    AND visit_date = '2022-01-08'
),
cheap_pizza AS(
  SELECT pizzeria.id
  FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
  WHERE menu.price < 800
)
INSERT INTO person_visits
VALUES (
    (
      SELECT MAX(id) + 1
      FROM person_visits
    ),
    (
      SELECT id
      FROM person
      WHERE name = 'Dmitriy'
    ),
    (
      SELECT *
      FROM cheap_pizza
      EXCEPT (
          SELECT *
          FROM dmitriy_visits
        )
      LIMIT 1
    ), '2022-01-08'
  );
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
SELECT *
FROM mv_dmitriy_visits_and_eats;