SELECT pizza_name,
  price,
  pizzeria.name AS pizzeria_name
FROM menu
  LEFT JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
WHERE menu.id NOT IN (
    SELECT menu_id
    FROM person_order
  )
ORDER BY pizza_name,
  price;