/* Write an SQL expression that retrieves the doctor’s name and the patient’s name for every
appointment, renaming the output columns to Doctor_Name and Patient_Name . */

SELECT d.name AS "Doctor_Name", p.name AS "Patient_Name"
FROM doctor d, patient p, appointment a 
WHERE a.doc_id=d.doc_id AND a.pat_id=p.pat_id;