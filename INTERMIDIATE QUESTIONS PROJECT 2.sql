-- Find out people affected with major depressive disorder according to gender;
select diagnosis.disease, patient_details.gender, 
count(patient_details.gender) as count from patient_details 
join diagnosis on patient_details.Patient_ID = diagnosis.Patient_ID 
where diagnosis.disease = 'major depressive disorder'
group by diagnosis.disease, patient_details.gender;

-- FIND THE AVERAGE SCORE OF ALL TESTS IN LEVEL MONITORING 
-- IN MALE AND FEMALE PATIENTS
SELECT patient_details.GENDER,
AVG(LEVEL_MONITORING.STRESS_LEVEL_SCORE) AS Average_Stress_Level,
AVG(LEVEL_MONITORING.symptom_severity_score) AS Average_severity,
AVG(LEVEL_MONITORING.mood_score) AS BEHAVIOR_LEVELS,
AVG(LEVEL_MONITORING.sleep_quality_score) AS SLEEP_LEVELS,
AVG(LEVEL_MONITORING.physical_test_score) AS PHYSICAL_TEST_RECORD
FROM LEVEL_MONITORING
JOIN patient_details 
ON LEVEL_MONITORING.PATIENT_ID = patient_details.PATIENT_ID
GROUP BY patient_details.GENDER;

-- Find the count of male and female patients prescribed antidepressants 
-- and their average stress level
SELECT patient_details.GENDER, 
COUNT(patient_details.Patient_ID) AS Patient_Count, 
diagnosis.MEDICATION, 
AVG(level_monitoring.stress_level_score) AS Avg_Stress_Level
FROM patient_details JOIN diagnosis 
ON patient_details.Patient_ID = diagnosis.Patient_ID
JOIN level_monitoring 
ON level_monitoring.patient_id = diagnosis.Patient_ID
WHERE diagnosis.MEDICATION = 'ANTIDEPRESSANTS'
GROUP BY patient_details.GENDER,diagnosis.MEDICATION;

-- FIND THE NUMBER OF PATIENTS WITH IMPROVED STATE IN FIRST 3 MONTHS OF 2024
SELECT MONTHNAME(Treatment_Start_Date) AS Treatment_Month, 
COUNT(*) AS Improved_Patients FROM treatments
WHERE Outcome = 'Improved'
GROUP BY MONTHNAME(Treatment_Start_Date), 
MONTH(Treatment_Start_Date)
ORDER BY Improved_Patients DESC
LIMIT 3;



















