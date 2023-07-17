WITH male AS (
  SELECT pizzeria.name
  FROM pizzeria
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person.id = person_visits.person_id
  WHERE person.gender = 'male'
),
female AS (
  SELECT pizzeria.name
  FROM pizzeria
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person.id = person_visits.person_id
  WHERE person.gender = 'female'
),
only_male AS (
  SELECT name
  FROM male
  EXCEPT ALL
  SELECT name
  from female
),
only_female AS (
  SELECT name
  FROM female
  EXCEPT ALL
  SELECT name
  from male
)
SELECT name
FROM only_male
UNION ALL
SELECT name
FROM only_female
ORDER by name;