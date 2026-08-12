# Data Dictionary

This project uses a relational hospital database with five core tables: patients, doctors, appointments, treatments, and billing.

## patients

Stores patient demographic, registration, insurance, and contact information.

| Column | Description |
|---|---|
| patient_id | Unique patient identifier |
| first_name | Patient first name |
| last_name | Patient last name |
| gender | Patient gender |
| date_of_birth | Patient date of birth |
| contact_number | Patient phone number |
| address | Patient address |
| registration_date | Date patient registered |
| insurance_provider | Patient insurance provider |
| insurance_number | Patient insurance identifier |
| email | Patient email address |

## doctors

Stores physician details.

| Column | Description |
|---|---|
| doctor_id | Unique doctor identifier |
| first_name | Doctor first name |
| last_name | Doctor last name |
| specialization | Medical specialty |
| phone_number | Doctor phone number |
| years_experience | Years of professional experience |
| hospital_branch | Hospital or clinic location |
| email | Doctor email address |

## appointments

Stores patient appointments and links patients to doctors.

| Column | Description |
|---|---|
| appointment_id | Unique appointment identifier |
| patient_id | Patient associated with appointment |
| doctor_id | Doctor associated with appointment |
| appointment_date | Appointment date |
| appointment_time | Appointment time |
| reason_for_visit | Reason for appointment |
| status | Appointment status |

## treatments

Stores treatments associated with appointments.

| Column | Description |
|---|---|
| treatment_id | Unique treatment identifier |
| appointment_id | Appointment associated with treatment |
| treatment_type | Type of treatment performed |
| description | Treatment description |
| cost | Treatment cost |
| treatment_date | Date treatment was performed |

## billing

Stores patient billing and payment information.

| Column | Description |
|---|---|
| bill_id | Unique billing identifier |
| patient_id | Patient associated with bill |
| treatment_id | Treatment associated with bill |
| bill_date | Billing date |
| amount | Amount billed |
| payment_method | Method of payment |
| payment_status | Payment status |

## Table Relationships

- `patients.patient_id` → `appointments.patient_id`
- `doctors.doctor_id` → `appointments.doctor_id`
- `appointments.appointment_id` → `treatments.appointment_id`
- `patients.patient_id` → `billing.patient_id`
- `treatments.treatment_id` → `billing.treatment_id`

