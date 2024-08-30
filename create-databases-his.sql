-- Drop and Create Hospital Database
DROP DATABASE IF EXISTS `hospital_db`;
CREATE DATABASE `hospital_db`;
USE `hospital_db`;
-- Set Character Encoding
SET NAMES utf8;
SET character_set_client = utf8mb4;
-- Create Departments Table
CREATE TABLE `departments` (
`department_id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(50) NOT NULL,
PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `departments` (`name`) VALUES
('Cardiology'),
('Neurology'),
('Orthopedics'),
('Pediatrics'),
('Radiology'),
('Oncology'),
('Dermatology'),
('Gastroenterology'),
('Endocrinology'),
('Urology'),
('Nephrology'),
('Hematology');
-- Create Doctors Table
CREATE TABLE `doctors` (
`doctor_id` int(11) NOT NULL AUTO_INCREMENT,
`first_name` varchar(50) NOT NULL,
`last_name` varchar(50) NOT NULL,
`specialty` varchar(50) NOT NULL,
`department_id` int(11) NOT NULL,
PRIMARY KEY (`doctor_id`),
KEY `fk_doctors_departments_idx` (`department_id`),
CONSTRAINT `fk_doctors_departments` FOREIGN KEY (`department_id`)
REFERENCES `departments` (`department_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `doctors` (`first_name`, `last_name`, `specialty`,
`department_id`) VALUES
('John', 'Doe', 'Cardiologist', 1),
('Jane', 'Smith', 'Neurologist', 2),
('Jim', 'Brown', 'Orthopedic Surgeon', 3),
('Emily', 'Davis', 'Pediatrician', 4),
('Michael', 'Johnson', 'Radiologist', 5),
('Sarah', 'Wilson', 'Oncologist', 6),
('Robert', 'Lee', 'Dermatologist', 7),
('Laura', 'Garcia', 'Gastroenterologist', 8),
('David', 'Martinez', 'Endocrinologist', 9),
('Linda', 'Rodriguez', 'Urologist', 10),
('James', 'Lopez', 'Nephrologist', 11),
('Sophia', 'Anderson', 'Hematologist', 12);
-- Create Patients Table
CREATE TABLE `patients` (
`patient_id` int(11) NOT NULL AUTO_INCREMENT,
`first_name` varchar(50) NOT NULL,
`last_name` varchar(50) NOT NULL,
`date_of_birth` date NOT NULL,
`phone` varchar(50) DEFAULT NULL,
`address` varchar(100) NOT NULL,
`city` varchar(50) NOT NULL,
`state` char(2) NOT NULL,
PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `patients` (`first_name`, `last_name`, `date_of_birth`,
`phone`, `address`, `city`, `state`) VALUES
('Alice', 'Williams', '1990-05-12', '555-1234', '123 Maple Street',
'Springfield', 'IL'),
('Bob', 'Miller', '1985-08-23', '555-5678', '456 Oak Street', 'Columbus',
'OH'),
('Carol', 'Johnson', '1972-11-05', '555-8765', '789 Pine Street',
'Austin', 'TX'),
('Daniel', 'Lewis', '1965-04-10', '555-0987', '101 Cedar Street',
'Phoenix', 'AZ'),
('Eva', 'Clark', '1980-03-15', '555-2345', '202 Birch Street', 'Denver',
'CO'),
('Frank', 'Taylor', '1995-12-20', '555-3456', '303 Elm Street', 'Seattle',
'WA'),
('Grace', 'Lee', '1988-07-09', '555-4567', '404 Ash Street', 'Miami',
'FL'),
('Henry', 'Walker', '1977-02-25', '555-5678', '505 Oak Street', 'Boston',
'MA'),
('Isabella', 'Young', '1969-09-14', '555-6789', '606 Pine Street',
'Chicago', 'IL'),
('Jack', 'Harris', '1992-11-30', '555-7890', '707 Cedar Street',
'Houston', 'TX'),
('Karen', 'Hall', '1983-06-21', '555-8901', '808 Birch Street', 'Orlando',
'FL'),
('Leo', 'Scott', '1971-08-19', '555-9012', '909 Maple Street', 'San
Francisco', 'CA');
-- Create Appointments Table
CREATE TABLE `appointments` (
`appointment_id` int(11) NOT NULL AUTO_INCREMENT,
`patient_id` int(11) NOT NULL,
`doctor_id` int(11) NOT NULL,
`appointment_date` datetime NOT NULL,
`status` varchar(50) NOT NULL DEFAULT 'Scheduled',
PRIMARY KEY (`appointment_id`),
KEY `fk_appointments_patients_idx` (`patient_id`),
KEY `fk_appointments_doctors_idx` (`doctor_id`),
CONSTRAINT `fk_appointments_patients` FOREIGN KEY (`patient_id`)
REFERENCES `patients` (`patient_id`) ON UPDATE CASCADE,
CONSTRAINT `fk_appointments_doctors` FOREIGN KEY (`doctor_id`)
REFERENCES `doctors` (`doctor_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `appointments` (`patient_id`, `doctor_id`, `appointment_date`,
`status`) VALUES
(1, 1, '2024-08-15 10:00:00', 'Scheduled'),
(2, 2, '2024-08-16 11:30:00', 'Completed'),
(3, 3, '2024-08-17 14:00:00', 'Scheduled'),
(4, 4, '2024-08-18 09:00:00', 'Completed'),
(5, 5, '2024-08-19 15:00:00', 'Scheduled'),
(6, 6, '2024-08-20 08:00:00', 'Cancelled'),
(7, 7, '2024-08-21 10:30:00', 'Scheduled'),
(8, 8, '2024-08-22 13:00:00', 'Completed'),
(9, 9, '2024-08-23 12:00:00', 'Scheduled'),
(10, 10, '2024-08-24 14:30:00', 'Completed'),
(11, 11, '2024-08-25 16:00:00', 'Scheduled'),
(12, 12, '2024-08-26 11:00:00', 'Cancelled');
-- Create Treatments Table
CREATE TABLE `treatments` (
`treatment_id` int(11) NOT NULL AUTO_INCREMENT,
`patient_id` int(11) NOT NULL,
`doctor_id` int(11) NOT NULL,
`treatment_date` datetime NOT NULL,
`description` text NOT NULL,
PRIMARY KEY (`treatment_id`),
KEY `fk_treatments_patients_idx` (`patient_id`),
KEY `fk_treatments_doctors_idx` (`doctor_id`),
CONSTRAINT `fk_treatments_patients` FOREIGN KEY (`patient_id`)
REFERENCES `patients` (`patient_id`) ON UPDATE CASCADE,
CONSTRAINT `fk_treatments_doctors` FOREIGN KEY (`doctor_id`) REFERENCES
`doctors` (`doctor_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `treatments` (`patient_id`, `doctor_id`, `treatment_date`,
`description`) VALUES
(1, 1, '2024-08-15 10:30:00', 'Cardiac stress test performed.'),
(2, 2, '2024-08-16 12:00:00', 'MRI scan for neurological assessment.'),
(3, 3, '2024-08-17 14:30:00', 'Orthopedic surgery on left knee.'),
(4, 4, '2024-08-18 09:30:00', 'Vaccination for routine pediatric care.'),
(5, 5, '2024-08-19 15:30:00', 'X-ray for suspected fracture.'),
(6, 6, '2024-08-20 08:30:00', 'Chemotherapy session.'),
(7, 7, '2024-08-21 11:00:00', 'Skin biopsy for lesion examination.'),
(8, 8, '2024-08-22 13:30:00', 'Colonoscopy for gastrointestinal
evaluation.'),
(9, 9, '2024-08-23 12:30:00', 'Thyroid function test.'),
(10, 10, '2024-08-24 15:00:00', 'Kidney stone removal surgery.'),
(11, 11, '2024-08-25 16:30:00', 'Dialysis session.'),
(12, 12, '2024-08-26 11:30:00', 'Blood transfusion.');
-- Create Billing Table
CREATE TABLE `billing` (
`billing_id` int(11) NOT NULL AUTO_INCREMENT,
`patient_id` int(11) NOT NULL,
`appointment_id` int(11) NOT NULL,
`amount_due` decimal(9,2) NOT NULL,
`amount_paid` decimal(9,2) NOT NULL DEFAULT '0.00',
`billing_date` date NOT NULL,
PRIMARY KEY (`billing_id`),
KEY `fk_billing_patients_idx` (`patient_id`),
KEY `fk_billing_appointments_idx` (`appointment_id`),
CONSTRAINT `fk_billing_patients` FOREIGN KEY (`patient_id`) REFERENCES
`patients` (`patient_id`) ON UPDATE CASCADE,
CONSTRAINT `fk_billing_appointments` FOREIGN KEY (`appointment_id`)
REFERENCES `appointments` (`appointment_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `billing` (`patient_id`, `appointment_id`, `amount_due`,
`amount_paid`, `billing_date`) VALUES
(1, 1, 250.00, 0.00, '2024-08-15'),
(2, 2, 500.00, 250.00, '2024-08-16'),
(3, 3, 750.00, 0.00, '2024-08-17'),
(4, 4, 150.00, 150.00, '2024-08-18'),
(5, 5, 200.00, 0.00, '2024-08-19'),
(6, 6, 1000.00, 500.00, '2024-08-20'),
(7, 7, 300.00, 300.00, '2024-08-21'),
(8, 8, 450.00, 450.00, '2024-08-22'),
(9, 9, 600.00, 0.00, '2024-08-23'),
(10, 10, 700.00, 0.00, '2024-08-24'),
(11, 11, 800.00, 400.00, '2024-08-25'),
(12, 12, 900.00, 900.00, '2024-08-26');
-- Create Medications Table
CREATE TABLE `medications` (
`medication_id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(50) NOT NULL,
`description` text NOT NULL,
PRIMARY KEY (`medication_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4
COLLATE=utf8mb4_0900_ai_ci;
INSERT INTO `medications` (`name`, `description`) VALUES
('Aspirin', 'Pain reliever and anti-inflammatory medication.'),
('Metformin', 'Medication for treating type 2 diabetes.'),
('Amoxicillin', 'Antibiotic used to treat bacterial infections.'),
('Lisinopril', 'Medication for high blood pressure.'),
('Atorvastatin', 'Statin used to lower cholesterol.'),
('Omeprazole', 'Medication for acid reflux and heartburn.'),
('Levothyroxine', 'Hormone replacement for hypothyroidism.'),
('Simvastatin', 'Cholesterol-lowering medication.'),
('Albuterol', 'Bronchodilator for asthma relief.'),
('Gabapentin', 'Medication for nerve pain and seizures.'),
('Clopidogrel', 'Antiplatelet medication to prevent blood clots.'),
('Losartan', 'Medication for high blood pressure and kidney protection.');