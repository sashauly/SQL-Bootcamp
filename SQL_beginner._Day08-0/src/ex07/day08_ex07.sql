-- Session #1
-- begin Session #1;
BEGIN TRANSACTION;
SHOW TRANSACTION ISOLATION LEVEL;
--update rating Session #2;
UPDATE pizzeria
SET rating = 3.1
WHERE id = 1;
--update rating Session #2;
UPDATE pizzeria
SET rating = 4.2
WHERE id = 2;
--commit changes Session #1;
COMMIT WORK;
--Session #2;
--begin Session #2
BEGIN TRANSACTION;
SHOW TRANSACTION ISOLATION LEVEL;
--update rating Session #2;
UPDATE pizzeria
SET rating = 2
WHERE id = 2;
--update rating Session #2;
UPDATE pizzeria
SET rating = 1
WHERE id = 1;
--commit changes Session #2;
COMMIT WORK;