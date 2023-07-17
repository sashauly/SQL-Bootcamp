SELECT DISTINCT name
FROM person
WHERE person.id IN (
    SELECT id
    FROM person_order
  )
ORDER BY 1;