/* Write an SQL expression that finds the app_id and app_date of all appointments where the
diagnosis has not yet been entered. */

SELECT app_id, app_date
FROM appointment
WHERE diagnosis IS NULL;