CREATE OR REPLACE VIEW v_symmetric_union AS WITH visit_02 AS (
    SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-02'
  ),
  visit_06 AS (
    SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-06'
  ) (
    SELECT *
    FROM visit_02
    EXCEPT
    SELECT *
    FROM visit_06
  )
UNION
(
  SELECT *
  FROM visit_06
  EXCEPT
  SELECT *
  FROM visit_02
)
ORDER BY person_id;
SELECT *
FROM v_symmetric_union;