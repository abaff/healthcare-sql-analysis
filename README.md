# healthcare-sql-analysis
SQL portfolio project analyzing patient demographics, appointments, treatments, billing, and healthcare operations using MySQL.

## Patient & Insurance Analysis

### Question 1: Insurance Provider Patient Volume

**Business Question:**  
Among patients with documented insurance coverage, how many patients are covered by each insurance provider? Only include providers covering more than 10 patients and rank them from highest to lowest patient volume.

**SQL Query:**

```sql
SELECT COUNT(insurance_provider) AS insurance_provider_count,
       insurance_provider
FROM patients
WHERE insurance_provider IS NOT NULL
GROUP BY insurance_provider
HAVING COUNT(insurance_provider) > 10
ORDER BY insurance_provider_count DESC;
```
**Finding:**  
WellnessCorp had the highest patient volume with 38 covered patients. Five other insurance providers also met the threshold of more than 10 patients: PulseSecure, CarePlus, MedCare Plus, HealthFirst, and MediShield.


**Query Results:**

![Question 1 Insurance Provider Analysis](screenshots/question_1_insurance_provider_analysis.png)


### Question 2: Missing Insurance & Contact Information

**Business Question:**  
Identify patients without a documented insurance provider and review their contact information to determine whether additional contact data is missing.

**SQL Query:**

```sql
SELECT patient_id, first_name, last_name, email, contact_number
FROM patients
WHERE insurance_provider IS NULL;
```

**Finding:**  
Among patients without a documented insurance provider, only patient P143 was also missing an email address. All patients in this group had a contact number documented.

**Query Results:**

![Question 2 Missing Insurance Analysis](screenshots/question_2_missing_insurance_analysis.png)                                 
### Question 3: Patient Registrations by Year

**Business Question:**  
How many patients registered each year, and which year had the highest number of new patient registrations?

**SQL Query:**

```sql
SELECT COUNT(registration_date) AS count_of_registrations,
       YEAR(registration_date) AS Year_registered
FROM patients
GROUP BY YEAR(registration_date)
ORDER BY count_of_registrations DESC;
```

**Finding:**  
2022 had the highest number of new patient registrations, with 42 patients registered.

**Query Results:**

![Question 3 Patient Registrations by Year](screenshots/question_3_patient_registrations_by_year.png)
