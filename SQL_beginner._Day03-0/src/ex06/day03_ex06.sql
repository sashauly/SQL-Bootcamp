SELECT DISTINCT pizza_name_1,
  pizzeria_name_1,
  pizzeria_name_2,
  table_1.price
FROM (
    SELECT DISTINCT pizzeria.id AS id_1,
      menu.pizza_name as pizza_name_1,
      pizzeria.name AS pizzeria_name_1,
      menu.price AS price
    FROM menu
      JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
  ) AS table_1
  JOIN (
    SELECT DISTINCT pizzeria.id AS id_2,
      menu.pizza_name as pizza_name_2,
      pizzeria.name AS pizzeria_name_2,
      menu.price AS price
    FROM menu
      JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
  ) AS table_2 ON table_1.price = table_2.price
  AND table_1.pizza_name_1 = table_2.pizza_name_2
WHERE id_1 > id_2;