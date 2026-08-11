/* Write an SQL expression that finds the names of doctors who have prescribed ‘Lisinopril’ to a
patient who lives in ‘Seattle’ */

SELECT d.name
FROM doctor d, patient p, appointment a, prescription pr
WHERE p.city='Seattle'
    AND a.doc_id=d.doc_id
    AND a.pat_id=p.pat_id
    AND a.app_id=pr.app_id
    AND pr.medication='Lisinopril';