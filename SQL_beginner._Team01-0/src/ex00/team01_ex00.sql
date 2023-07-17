WITH currency_eur AS (
  SELECT *
  FROM currency
  WHERE name = 'EUR'
  ORDER BY updated DESC
  LIMIT 1
), currency_usd AS (
  SELECT *
  FROM currency
  WHERE name = 'USD'
  ORDER BY updated DESC
  LIMIT 1
), currency_jpy AS (
  SELECT *
  FROM currency
  WHERE name = 'JPY'
  ORDER BY updated DESC
  LIMIT 1
), current_course AS (
  SELECT *
  FROM currency_eur
  UNION
  SELECT *
  FROM currency_usd
  UNION
  SELECT *
  FROM currency_jpy
)
SELECT (
    CASE
      WHEN "user".name IS NULL THEN 'not defined'
      WHEN "user".name IS NOT NULL THEN "user".name
    END
  ) name,
  (
    CASE
      WHEN "user".lastname IS NULL THEN 'not defined'
      WHEN "user".lastname IS NOT NULL THEN "user".lastname
    END
  ) lastname,
  balance.type,
  SUM(balance.money) volume,
  (
    CASE
      WHEN current_course.name IS NULL THEN 'not defined'
      WHEN current_course.name IS NOT NULL THEN current_course.name
    END
  ) currency_name,
  (
    CASE
      WHEN current_course.rate_to_usd IS NULL THEN 1
      WHEN current_course.rate_to_usd IS NOT NULL THEN current_course.rate_to_usd
    END
  ) last_rate_to_usd,
  (
    CASE
      WHEN current_course.rate_to_usd IS NULL THEN 1 * SUM(balance.money)
      WHEN current_course.rate_to_usd IS NOT NULL THEN current_course.rate_to_usd * SUM(balance.money)
    END
  )::real total_volume_in_usd
FROM "user"
  FULL JOIN balance ON balance.user_id = public."user".id
  FULL JOIN current_course ON balance.currency_id = current_course.id
GROUP BY "user".name,
  "user".lastname,
  balance.type,
  currency_name,
  current_course.rate_to_usd
ORDER BY 1 DESC,
  2,
  3;