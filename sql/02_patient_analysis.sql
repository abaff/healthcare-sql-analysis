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


-- Question 4:
-- Which patients have had multiple appointments,
-- and how many appointments has each of those patients had?


-- Question 5:
-- Which patients have never had an appointment?


-- Question 6:
-- Which patients have generated the highest total billed amounts?


-- Question 7:
-- For patients with multiple appointments,
-- which patients have the highest average treatment cost?


-- Question 8:
-- Which insurance providers are associated with the highest
-- average billed amount per patient?
