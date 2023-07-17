WITH
  tn AS (
    SELECT
      person.name,
      menu.pizza_name
    FROM
      person_order
      JOIN menu ON menu.id = person_order.menu_id
      JOIN person ON person.id = person_order.person_id
    WHERE
      person.gender = 'female'
  )
SELECT
  name
FROM
  tn
WHERE
  pizza_name = 'cheese pizza'
  AND name IN (
    SELECT
      name
    FROM
      tn
    WHERE
      pizza_name = 'pepperoni pizza'
  )
ORDER BY
  name;