INSERT INTO currency
VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
INSERT INTO currency
VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');
--- Все возможные комбинации курсов валют для обмена человеком, даты курсов которых были раньше даты обмена
WITH min_currency AS (
	SELECT user_id,
		"user".name,
		"user".lastname,
		currency_id,
		balance.updated AS bupdated,
		currency.updated AS cupdated
	FROM balance
		FULL JOIN currency ON currency.id = balance.currency_id
		AND currency.updated <= balance.updated
		FULL JOIN "user" ON "user".id = balance.user_id
	WHERE balance.currency_id IN (100, 200, 300)
),
--- Все возможные комбинации курсов валют для обмена человеком, даты курсов которых были позже даты обмена
max_currency AS (
	SELECT user_id,
		"user".name,
		"user".lastname,
		currency_id,
		balance.updated AS bupdated,
		currency.updated AS cupdated
	FROM balance
		FULL JOIN currency ON currency.id = balance.currency_id
		AND currency.updated > balance.updated
		FULL JOIN "user" ON "user".id = balance.user_id
	WHERE balance.currency_id IN (100, 200, 300)
),
--- Все покупки валют, у которых в прошлом не было курса
buy_in_the_future AS (
	SELECT user_id,
		name,
		lastname,
		currency_id,
		bupdated,
		MIN(cupdated)
	FROM(
			SELECT *
			FROM max_currency
			WHERE (user_id, currency_id, bupdated) IN (
					SELECT user_id,
						currency_id,
						bupdated
					FROM min_currency
					WHERE cupdated IS NULL
				)
		) AS future_curse
	GROUP BY user_id,
		name,
		lastname,
		currency_id,
		bupdated
),
--- Все покупки валют, у которых был прошлый курс
buy_in_the_past AS (
	SELECT user_id,
		name,
		lastname,
		currency_id,
		bupdated,
		MAX(cupdated)
	FROM(
			SELECT *
			FROM min_currency
			WHERE (user_id, currency_id, bupdated) NOT IN (
					SELECT user_id,
						currency_id,
						bupdated
					FROM buy_in_the_future
				)
		) AS past_curse
	GROUP BY user_id,
		name,
		lastname,
		currency_id,
		bupdated
),
--- Результирующая таблица со всеми данными
result_table AS (
	SELECT CASE
			WHEN all_changes.name IS NULL THEN 'not define'
			ELSE all_changes.name
		END AS name,
		CASE
			WHEN all_changes.lastname IS NULL THEN 'not define'
			ELSE all_changes.lastname
		END AS lastname,
		c.name AS currency_name,
		(b.money * c.rate_to_usd)::real AS currency_in_usd
	FROM (
			SELECT *
			FROM buy_in_the_past
			UNION
			SELECT *
			FROM buy_in_the_future
		) AS all_changes
		INNER JOIN balance as b ON b.updated = all_changes.bupdated
		AND b.user_id = all_changes.user_id
		AND b.currency_id = all_changes.currency_id
		INNER JOIN currency AS c ON c.id = all_changes.currency_id
		AND c.updated = all_changes.max
)
SELECT *
FROM result_table
ORDER BY name DESC,
	lastname,
	currency_name