-- Classify the patient according to age group i.e (elderly & adult) and gender 
SELECT 
    age_group, 
    gender,
    COUNT(Patient_ID) AS patient_count
FROM (SELECT Patient_ID,gender,
CASE 
WHEN age < 60 THEN 'adult'
WHEN age >= 60 THEN 'elderly'
END AS age_group
FROM patient_details)
AS categorized_patients
GROUP BY age_group, gender;

-- Find number of patients on the basis of Emotional State detected by AI 
-- and gender
SELECT TREATMENTS.AI_Detected_Emotional_State AS Behavior,
patient_details.GENDER,
COUNT(patient_details.PATIENT_ID) AS Patient_Count
FROM LEVEL_MONITORING JOIN patient_details 
ON LEVEL_MONITORING.PATIENT_ID = patient_details.PATIENT_ID
JOIN TREATMENTS
ON LEVEL_MONITORING.TREATMENT_ID = TREATMENTS.TREATMENT_ID
GROUP BY TREATMENTS.AI_Detected_Emotional_State, patient_details.GENDER
ORDER BY TREATMENTS.AI_Detected_Emotional_State ASC, 
patient_details.GENDER ASC;


