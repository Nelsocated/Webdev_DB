/* Write an SQL expression that finds the names of all patients whose name begins with the letter
‘J’ */

SELECT name
FROM patient
WHERE name LIKE 'J%';