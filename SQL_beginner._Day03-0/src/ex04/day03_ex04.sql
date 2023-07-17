WITH male AS (
  SELECT pizzeria.name
  FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
  WHERE person.gender = 'male'
),
female AS (
  SELECT pizzeria.name
  FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
  WHERE person.gender = 'female'
),
only_male AS (
  SELECT name
  FROM male
  EXCEPT
  SELECT name
  from female
),
only_female AS (
  SELECT name
  FROM female
  EXCEPT
  SELECT name
  from male
)
SELECT name
FROM only_male
UNION
SELECT name
FROM only_female
ORDER by name;