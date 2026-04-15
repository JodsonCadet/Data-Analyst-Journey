-- Hospital Readmission Risk Analysis
-- Author: Jodson Cadet
-- Date: April 2026

-- Query 1: Readmission Rate by Age Group
SELECT
    age,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN readmitted = 'yes' THEN 1 ELSE 0 END) AS readmitted_count,
    ROUND(SUM(CASE WHEN readmitted = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate
FROM readmissions
GROUP BY age
ORDER BY readmission_rate DESC;

-- Query 2: Readmission Rate by Medical Specialty
SELECT
    medical_specialty,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN readmitted = 'yes' THEN 1 ELSE 0 END) AS readmitted_count,
    ROUND(SUM(CASE WHEN readmitted = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate
FROM readmissions
WHERE medical_specialty != 'Missing'
GROUP BY medical_specialty
ORDER BY readmission_rate DESC
LIMIT 10;

-- Query 3: Average Length of Stay by Readmission Status
SELECT
    readmitted,
    ROUND(AVG(time_in_hospital), 2) AS avg_days,
    ROUND(AVG(estimated_cost), 2) AS avg_cost,
    COUNT(*) AS total_patients
FROM readmissions
GROUP BY readmitted
ORDER BY avg_days DESC;

-- Query 4: Risk Level Distribution
SELECT
    risk_level,
    COUNT(*) AS total_patients,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage,
    ROUND(AVG(estimated_cost), 2) AS avg_cost
FROM readmissions
GROUP BY risk_level
ORDER BY total_patients DESC;

-- Query 5: Top 10 Primary Diagnoses with Highest Readmission Rate
SELECT
    diag_1,
    COUNT(*) AS total_patients,
    SUM(CASE WHEN readmitted = 'yes' THEN 1 ELSE 0 END) AS readmitted_count,
    ROUND(SUM(CASE WHEN readmitted = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS readmission_rate,
    ROUND(AVG(estimated_cost), 2) AS avg_cost
FROM readmissions
GROUP BY diag_1
ORDER BY readmission_rate DESC
LIMIT 10;

-- Query 6: Total Cost of Readmitted vs Non-Readmitted Patients
SELECT
    readmitted,
    COUNT(*) AS total_patients,
    SUM(estimated_cost) AS total_cost,
    ROUND(AVG(estimated_cost), 2) AS avg_cost
FROM readmissions
GROUP BY readmitted
ORDER BY total_cost DESC;

-- Query 7: Patients on Diabetes Medication by Readmission Status
SELECT
    diabetes_med,
    readmitted,
    COUNT(*) AS total_patients,
    ROUND(AVG(estimated_cost), 2) AS avg_cost
FROM readmissions
GROUP BY diabetes_med, readmitted
ORDER BY total_patients DESC;

