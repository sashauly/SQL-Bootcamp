-- Session #1
-- begin Session #1;
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;
--select statements Session #1;
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
--select statements Session #1;
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
--commit changes Session #1;
COMMIT WORK;
--check changes Session #1;
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
--Session #2;
--begin Session #2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
SHOW TRANSACTION ISOLATION LEVEL;
--update rating Session #2;
UPDATE pizzeria
SET rating = 3.0
WHERE name = 'Pizza Hut';
--commit changes Session #2;
COMMIT WORK;
--check changes Session #2;
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';