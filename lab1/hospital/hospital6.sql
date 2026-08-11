/* Write an SQL expression that retrieves the names of all patients who have been admitted to the
‘Intensive Care Unit’ but have not yet been discharged. */

SELECT p.name
FROM patient p, admission a, ward w
WHERE p.pat_id=a.pat_id 
    AND a.ward_id=w.ward_id
    and w.ward_name='Intensive Care Unit'
    and a.discharge_date IS NULL;