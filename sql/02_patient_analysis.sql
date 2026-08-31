-- ============================================================
-- HEALTHCARE SQL PORTFOLIO
-- Objective 1: Patient & Insurance Analysis
-- Database: hospital_portfolio
-- SQL Dialect: MySQL
-- ============================================================


-- Question 1:
-- Among patients with documented insurance coverage, determine how many patients
-- are covered by each insurance provider. Only include insurance providers that
-- cover more than 10 patients, and display the providers from highest to lowest
-- patient volume.

-- Query:
SELECT COUNT(insurance_provider) AS insurance_provider_count,
 insurance_provider
FROM patients 
WHERE insurance_provider IS NOT NULL
GROUP BY insurance_provider
 HAVING COUNT(insurance_provider) > 10
ORDER BY insurance_provider_count DESC;
-- Finding:
-- WellnessCorp had the highest patient volume with 38 covered patients.
-- Five other insurance providers also met the threshold of more than 10 patients:
-- PulseSecure, CarePlus, MedCare Plus, HealthFirst, and MediShield.

-- Question 2:
-- Which patients have missing insurance information,
-- and what other contact information is also missing for those patients?
-- Query:
SELECT patient_id, first_name, last_name, email, contact_number
FROM patients
WHERE insurance_provider IS NULL;

-- Finding:
-- Among patients without a documented insurance provider, only patient P143
-- was also missing an email address. All patients in this group had a
-- contact number documented.

-- Question 3:
-- How many patients registered each year,
-- and which year had the highest number of new patient registrations?
-- Query:
SELECT COUNT(registration_date) AS count_of_registrations,
       YEAR(registration_date) AS Year_registered
FROM patients
GROUP BY YEAR(registration_date)
ORDER BY count_of_registrations DESC;

-- Finding:
-- 2022 had the highest number of new patient registrations,
-- with 42 patients registered.


-- Question 4:
-- Which patients have had multiple appointments,
-- and how many appointments has each of those patients had?
-- Query:
SELECT COUNT(appointment_id) AS Num_of_appointments,
       patient_id
FROM appointments
GROUP BY patient_id
HAVING COUNT(appointment_id) > 1;

-- Finding:
-- Patients with more than one appointment were identified by grouping
-- appointments by patient_id and filtering for appointment counts greater than 1.

-- Question 5:
-- Which patients have never had an appointment?
-- Query:
-- Question 5:
-- Which patients have never had an appointment?

-- Query:
SELECT p.first_name, p.last_name, a.appointment_id, patient_id
FROM patients AS p
LEFT JOIN appointments AS a
USING (patient_id)
WHERE a.appointment_id IS NULL;

-- Finding:
-- Patients with no matching appointment record were identified using a LEFT JOIN
-- between the patients and appointments tables and filtering for NULL appointment IDs.

-- Question 6:
-- Which patients have generated the highest total billed amounts?


-- Question 7:
-- For patients with multiple appointments,
-- which patients have the highest average treatment cost?


-- Question 8:
-- Which insurance providers are associated with the highest
-- average billed amount per patient?
