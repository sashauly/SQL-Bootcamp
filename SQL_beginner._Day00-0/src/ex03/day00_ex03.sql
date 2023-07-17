SELECT
  DISTINCT person_id
FROM
  person_visits
WHERE
  pizzeria_id = 2
  OR visit_date BETWEEN '2022-1-6' AND '2022-1-9'
ORDER BY
  person_id DESC;