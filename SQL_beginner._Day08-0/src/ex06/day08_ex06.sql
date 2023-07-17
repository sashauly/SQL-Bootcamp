-- Session #1
-- begin Session #1;
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;
--select statements Session #1;
SELECT SUM(rating)
FROM pizzeria;
--select statements Session #1;
SELECT SUM(rating)
FROM pizzeria;
--commit changes Session #1;
COMMIT WORK;
--check changes Session #1;
SELECT SUM(rating)
FROM pizzeria;
--Session #2;
--begin Session #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SHOW TRANSACTION ISOLATION LEVEL;
--update rating Session #2;
UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut';
--commit changes Session #2;
COMMIT WORK;
--check changes Session #2;
SELECT SUM(rating)
FROM pizzeria;