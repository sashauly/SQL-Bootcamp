-- Session #1
SHOW TRANSACTION ISOLATION LEVEL;
-- begin Session #1;
BEGIN TRANSACTION;
--select statements Session #1;
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
--update rating Session #1;
UPDATE pizzeria
SET rating = 4
WHERE name = 'Pizza Hut';
--commit changes Session #1;
COMMIT WORK;
--check changes Session #1;
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
--Session #2;
SHOW TRANSACTION ISOLATION LEVEL;
--begin Session #2
BEGIN TRANSACTION;
--select statements Session #2;
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
--update rating Session #2;
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';
--commit changes Session #2;
COMMIT WORK;
--check changes Session #2;
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';