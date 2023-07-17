WITH
  tn AS (
    SELECT
      *
    FROM
      person_visits
    WHERE
      (
        person_id = 1
        OR person_id = 2
      )
      AND visit_date BETWEEN '2022-01-01' AND '2022-01-10'
  )
SELECT
  CAST(dates AS DATE) AS missing_date
FROM
  generate_series('2022-01-01', '2022-01-10', interval '1 day') dates
  LEFT JOIN tn ON dates = tn.visit_date
WHERE
  tn.visit_date IS NULL
ORDER BY
  missing_date;