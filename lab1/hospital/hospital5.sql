/* Write an SQL expression that finds the doc_id of all doctors who have never had an
appointment scheduled. */

SELECT doc_id FROM doctor
EXCEPT
SELECT doc_id from appointment;