SELECT * 
FROM employee_attrition
--
--Checking for any null value in any column
SELECT * 
FROM employee_attrition
WHERE attrition IS NULL

-- Total number of employees in every department
SELECT
SUM(employeecount)AS total_employee,
department
FROM employee_attrition 
GROUP BY department

/*SELECT
department,
SUM(employeecount) OVER(PARTITION BY department ORDER BY employeecount)
FROM employee_attrition */

--What percentage of the employees have left the company
SELECT
CONCAT((s.Total_Employee_yes * 100/ t.Total_Employee),'','%' ) AS employee_attrition_percentage
FROM    (SELECT 
		attrition,
		SUM (employeecount) AS Total_Employee_Yes
		FROM employee_attrition
		WHERE attrition = 'Yes'
		GROUP BY attrition)s
CROSS JOIN (SELECT COUNT(employeecount) AS Total_Employee FROM employee_attrition) t

--Attrition by Deparment
SELECT
department,
SUM (employeecount) "Total_Employee"
FROM employee_attrition
WHERE attrition = 'Yes'
GROUP BY department


/*Salary Comparison
What are the average salaries of employees who left versus those who stayed? */
SELECT 
	attrition,
	ROUND (AVG(monthlyincome),2) --this is average monthly salary
FROM employee_attrition
GROUP BY attrition
--
/*SELECT AVG(monthlyincome) AS AvgSalaryLeaving
FROM employee_attrition
WHERE employeenumber IN (SELECT employeenumber FROM employee_attrition WHERE attrition = 'Yes'); */


/* Tenure Analysis
Is there a relationship between the number of years an employee has been with the company 
and their likelihood of leaving? */

SELECT 
yearsatcompany,
attrition,
RANK() OVER(PARTITION BY attrition ORDER BY yearsatcompany ASC)
FROM employee_attrition;
--
SELECT 
yearsatcompany,
attrition,
SUM(yearsatcompany) AS total_years
FROM employee_attrition
GROUP BY yearsatcompany,
		attrition
ORDER BY yearsatcompany DESC,attrition ASC;
--Splitting into groups
WITH Tenure_group AS
(SELECT
attrition,
COUNT(employeecount) AS Total_Employee,

	(CASE 
		WHEN yearsatcompany < 2 THEN '0-1 Years' 
		WHEN yearsatcompany BETWEEN 2 AND 5 THEN '2-5 Years'
		WHEN yearsatcompany BETWEEN 6 AND 10 THEN '6-10 Year'
	    ELSE '+10 Years'
	END)Years_at_company
FROM employee_attrition
GROUP BY attrition,
			Years_at_company)
SELECT
attrition,
SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) "Total",
Years_at_company
FROM Tenure_group
GROUP BY attrition,Years_at_company

--
/* Tenure buckets and attrition rate */

SELECT
    CASE
        WHEN yearsatcompany < 2 THEN '0–1 years'
        WHEN yearsatcompany BETWEEN 2 AND 5 THEN '2–5 years'
        WHEN yearsatcompany BETWEEN 6 AND 10 THEN '6–10 years'
        ELSE '10+ years'
    END AS tenure_group,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS employees_left,
    ROUND(
        SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employee_attrition
GROUP BY tenure_group
ORDER BY tenure_group;
/*Age Impact
How does age influence attrition rates? */
	
SELECT 
	(CASE 
		WHEN age < 20 THEN 'Teen'
		WHEN age BETWEEN 20 AND  30 THEN 'Twenties'
		WHEN age BETWEEN 30 AND  40 THEN 'Thirties'
		WHEN age BETWEEN 40 AND  50 THEN 'Fourties'
		WHEN age BETWEEN 50 AND  60 THEN 'Fifties'
		ELSE 'Oldies'
	END) age_group,
COUNT(employeecount) AS Total_Employee,
SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) Employee_left,
ROUND (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END),2) AS attrition_rate
FROM employee_attrition
GROUP BY age_group

/* Job Satisfaction Correlation
What is the relationship between job satisfaction scores and attrition? */
SELECT 
attrition,
jobsatisfaction,
RANK() OVER(PARTITION BY attrition ORDER BY jobsatisfaction desc)
FROM employee_attrition

/*Overtime Work Impact
How do attrition rates compare between employees who work overtime and those who don't?*/
SELECT 
overtime,
ROUND (AVG(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END ),2)  "Avg_attrition_Yes"
FROM employee_attrition
GROUP BY overtime
/*Performance Ratings
What is the effect of performance ratings on the likelihood of attrition?*/
SELECT 
attrition,
ROUND (AVG (performancerating),2) AS avg_rating,
(CASE 
	WHEN performancerating BETWEEN 3 AND 4 THEN 'Satisfied'
	WHEN Performancerating BETWEEN 2 AND 1 THEN 'Not Satisfied'
	ELSE 'N/A'
END)satisfaction
FROM employee_attrition
GROUP BY satisfaction,attrition
--attrition and yearsincelastpromotion
SELECT
attrition,
(CASE 
	WHEN yearssincelastpromotion = 0 THEN 'No promotion'
	WHEN yearssincelastpromotion >= 1 THEN 'Promotion'
END)Promotion_category,
COUNT(yearssincelastpromotion) AS promotion_count
FROM employee_attrition
GROUP BY promotion_category,attrition

--
SELECT
    attrition,
    CASE
        WHEN yearssincelastpromotion = 0 THEN 'Promoted this year'
        WHEN yearssincelastpromotion BETWEEN 1 AND 3 THEN '1–3 years since promotion'
        WHEN yearssincelastpromotion BETWEEN 4 AND 7 THEN '4–7 years since promotion'
        ELSE '8+ years since promotion'
    END AS promotion_category,
    COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY
    attrition,
    promotion_category
ORDER BY
    promotion_category,
    attrition;

/* CREATING VIEW,ONE WITH THE EMPLOYESS WHO ARE STILL IN THE
COMPANY AND ONE WITH THE EMPLOYEES WHO HAVE LEFT THE COMPANY*/
CREATE VIEW Attrtition_Yes AS
	(SELECT *
	FROM employee_attrition
	WHERE attrition = 'Yes');

SELECT *
FROM Attrtition_Yes;
--I want to change the name of the view
CREATE OR REPLACE VIEW Attritition_Yes AS
	(SELECT *
	FROM employee_attrition
	WHERE attrition = 'Yes');

--Deleting one view
DROP VIEW attrtition_yes
