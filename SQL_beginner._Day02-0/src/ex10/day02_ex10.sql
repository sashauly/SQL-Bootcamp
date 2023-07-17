SELECT
  table1.name as person_name1,
  table2.name as person_name2,
  table1.address as common_address
FROM
  person AS table1
  INNER JOIN person AS table2 ON table1.address = table2.address
WHERE
  table1.id > table2.id
ORDER BY
  1,
  2,
  3;