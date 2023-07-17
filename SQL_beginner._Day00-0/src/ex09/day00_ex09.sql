SELECT
  (
    SELECT
      name
    FROM
      person
    WHERE
      person.id = person_id
  ) AS person_name,
  (
    SELECT
      name
    FROM
      pizzeria
    WHERE
      pizzeria.id = pizzeria_id
  ) AS pizzeria_name
FROM
  (
    SELECT
      person_id,
      pizzeria_id
    FROM
      person_visits
    WHERE
      visit_date BETWEEN '2022-1-7' AND '2022-1-9'
  ) AS pv
ORDER BY
  person_name ASC,
  pizzeria_name DESC;