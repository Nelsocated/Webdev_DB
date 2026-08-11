/* Write an SQL expression that lists the names of all patients who had an appointment with a
doctor specializing in ‘Cardiology’ or ‘Neurology’, along with the date of the appointment and the
name of the ward they were eventually admitted to. Rename the columns to Patient ,
Appointment_Date , and Ward_Name . */

SELECT p.name AS "Patient", a.app_date AS "Appointment_Date", w.ward_name AS "Ward_Name"
FROM patient p, appointment a, ward w, admission ad, doctor d
WHERE p.pat_id=a.pat_id
    AND d.doc_id=a.doc_id
    AND d.specialty='Cardiology' OR d.specialty='Neurology'
    AND p.pat_id=ad.pat_id
    AND w.ward_id=ad.ward_id;
