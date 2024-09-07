SELECT d.first_name, d.last_name, d.specialty
FROM doctors d
JOIN departments dept ON d.department_id = dept.department_id
WHERE dept.name IN ('Cardiology', 'Oncology');

SELECT p.first_name, p.last_name, ap.appointment_date
FROM appointments ap
JOIN Patients p ON ap.patient_id = p.patient_id
WHERE p.city = "Seattle" AND ap.appointment_date > '2024-08-01';

SELECT dept.name
FROM departments dept
JOIN doctors doc ON dept.department_id = doc.department_id
WHERE doc.specialty = 'Cardiology'
AND dept.department_id IN (
SELECT d.department_id
FROM doctors d
WHERE d.specialty = 'Neurology'
);

SELECT DISTINCT p.city
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
WHERE a.status = 'Scheduled';


SELECT DISTINCT d.doctor_id
FROM doctors d, patients p,
appointments a
WHERE d.doctor_id = a.doctor_id
OR p.patient_id = a.patient_id;