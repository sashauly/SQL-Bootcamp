SELECT
  person.name
FROM
  person_order
  JOIN menu ON menu.id = person_order.menu_id
  JOIN person ON person.id = person_order.person_id
WHERE
  (person.gender = 'male')
  AND (
    person.address = 'Moscow'
    OR person.address = 'Samara'
  )
  AND (
    menu.pizza_name = 'mushroom pizza'
    OR menu.pizza_name = 'pepperoni pizza'
  )
ORDER BY
  person.name DESC;