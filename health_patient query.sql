--Adding a Primary Key with an AutoIncrement
ALTER TABLE healthcare_data
ADD PatientID INT IDENTITY(1,1) PRIMARY KEY;


-- Verify the table structure
SELECT COLUMN_NAME, DATA_TYPE, IS_NULLABLE, COLUMN_DEFAULT
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'healthcare_data';

-- Retrieve all records from the healthcare_data table
SELECT * FROM healthcare_data;

-- Retrieve a specific patient's record
SELECT * FROM Healthcare_Data
WHERE Proper_Name = 'Jasmine Luna';

-- Retrieve patients above a certain age
SELECT * FROM Healthcare_Data
WHERE Age > 60;

-- Retrieve patients admitted in a specific year
SELECT * FROM Healthcare_Data
WHERE YEAR(Date_of_Admission) = 2023;

-- Retrieve patients sorted by billing amount in descending order
SELECT * FROM Healthcare_Data
ORDER BY Billing_Amount DESC;

-- Retrieve the count of patients by gender
SELECT Gender, COUNT(*) as Count
FROM Healthcare_Data
GROUP BY Gender;

-- Retrieve the number of patients by admission type
SELECT Admission_Type, COUNT(*) as Count
FROM Healthcare_Data
GROUP BY Admission_Type;

-- Retrieve patients with abnormal test results
SELECT Proper_Name, Medical_Condition, Test_Results
FROM Healthcare_Data
WHERE Test_Results = 'Abnormal';

-- Retrieve the duration of hospital stay for each patient
SELECT Proper_Name, Date_of_Admission, Discharge_Date, 
DATEDIFF(day, Date_of_Admission, Discharge_Date) as Duration_Days
FROM healthcare_data;

-- Retrieve patients who were prescribed a specific medication
SELECT Proper_Name, Medication
FROM healthcare_data
WHERE Medication = 'Aspirin';

-- Retrieve the list of doctors with the patients they treated
SELECT Doctor, Proper_Name as Patient
FROM Healthcare_Data;

--Retrieve patients as per insurance provider
SELECT Insurance_Provider, COUNT(*) as Patient_Count
FROM healthcare_data
GROUP BY Insurance_Provider;

--Retrieve  average billing amount for each medical condition.
SELECT Medical_Condition, ROUND(AVG(Billing_Amount),2) as Average_Billing
FROM healthcare_data
GROUP BY Medical_Condition;

--Retrive top 10 most expensive admissions
-- Retrieve the top 5 most expensive admissions
SELECT TOP 10 *
FROM Healthcare_Data
ORDER BY Billing_Amount DESC;

-- Retrieve female patients with diabetes
SELECT * FROM Healthcare_Data
WHERE Gender = 'Female' AND Medical_Condition = 'Diabetes';

-- Retrieve patients admitted in the last 6 months
SELECT * 
FROM Healthcare_Data
WHERE Date_of_Admission >= DATEADD(MONTH, -6, GETDATE())
ORDER BY Date_of_Admission DESC;

-- Average billing amount by insurance provider
SELECT Insurance_Provider, AVG(Billing_Amount) as Average_Billing
FROM healthcare_data
GROUP BY Insurance_Provider;

-- Detailed list of patients by insurance provider
SELECT Insurance_Provider, Proper_Name, Age, Gender, Medical_Condition, Date_of_Admission, Discharge_Date
FROM healthcare_data
ORDER BY Insurance_Provider, Proper_Name

--List of patients by their blood type
SELECT Proper_Name , Blood_Type
FROM healthcare_data
ORDER BY Blood_Type

--Count the number of patients grouped by their blood type
SELECT Blood_Type, COUNT(*) AS Patient_Count
FROM Healthcare_Data
GROUP BY Blood_Type;













