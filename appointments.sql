-- Write a SQL command to retrieve all patients in the hospital_db database.
SELECT * FROM hospital_db.patients;

-- How would you filter the results to get only the patient with patient_id = 1?
SELECT * FROM hospital_db.patients WHERE patient_id = 1;

-- Write a query to sort the patients by their first name.
SELECT * FROM hospital_db.patients ORDER BY first_name;

-- Write a SQL command to get only the first_name and last_name columns from the patients table.
SELECT first_name, last_name FROM hospital_db.patients;


SELECT * FROM hospital_db.patients WHERE state='IL';


SELECT first_name, last_name, specialty FROM hospital_db.doctors WHERE department_id>2;

-- match last name that begin with 'wil'
select * from hospital_db.patients where last_name like 'wil%';
select * from hospital_db.patients where last_name like '%s';

select distinct specialty from hospital_db.doctors;


SELECT first_name, last_name, date_of_birth FROM hospital_db.patients WHERE city = 'Seattle' AND state = 'WA' ORDER BY date_of_birth, last_name;

SELECT amount_due, amount_due * 0.9 AS AD FROM hospital_db.billing;

SELECT * FROM hospital_db.billing;
