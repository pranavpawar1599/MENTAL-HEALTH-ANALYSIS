-- calculate number of patients allocated to different medications 
select medication, count(Patient_ID) as number_of_patients_using_medication 
from Diagnosis group by medication;

-- SORT THE PATIENTS ACCORDING TO THE OUTCOME OF TREATMENT
SELECT COUNT(TREATMENT_ID),OUTCOME FROM TREATMENTS 
GROUP BY OUTCOME;

-- Find the number of treatments that started in each month
SELECT MONTH(treatment_start_date),COUNT(TREATMENT_ID) FROM TREATMENTS 
GROUP BY MONTH(treatment_start_date);

-- FIND THE AVERAGE ADHERENCE TO TREATMENT AND 
-- AVERAGE TREATMENT PROGRESS LEVEL;
SELECT AVG(Treatment_Progress) AS TREATMENTLEVELS ,
AVG(Adherence_to_Treatment) FROM TREATMENTS;








