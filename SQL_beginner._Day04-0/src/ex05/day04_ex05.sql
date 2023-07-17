CREATE OR REPLACE VIEW v_price_with_discount AS
SELECT person.name,
  menu.pizza_name,
  menu.price,
  round(menu.price - menu.price * 0.1, 0) AS discount_price
FROM person_order
  JOIN menu ON menu.id = person_order.menu_id
  JOIN person ON person.id = person_order.person_id
ORDER BY 1,
  2;
SELECT *
FROM v_price_with_discount;