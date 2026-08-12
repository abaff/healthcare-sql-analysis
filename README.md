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
