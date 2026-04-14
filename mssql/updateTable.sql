-- employees cədvəlində bütün işçilərin email sütununu "not available" etmək
UPDATE employees
SET EMAIL = 'not available';

-- bütün işçilərin email və commission_pct dəyərlərini dəyişmək
UPDATE employees
SET EMAIL = 'not available',
    COMMISSION_PCT = 0.10;

-- yalnız department_id = 110 olan işçiləri update etmək
UPDATE employees
SET EMAIL = 'not available',
    COMMISSION_PCT = 0.10
WHERE DEPARTMENT_ID = 110;

-- department_id 80 və commission_pct 0.20-dən az olan işçiləri update etmək
UPDATE employees
SET EMAIL = 'not available'
WHERE DEPARTMENT_ID = 80
  AND COMMISSION_PCT < 0.20;

-- Accounting department-ə aid işçilərin email dəyərini dəyişmək
UPDATE employees
SET email='not available'
WHERE department_id = (
    SELECT department_id
    FROM departments
    WHERE department_name = 'Accounting'
);

-- ID-si 105 olan işçinin maaşı 5000-dən azdırsa 8000 etmək
UPDATE employees
SET SALARY = 8000
WHERE EMPLOYEE_ID = 105
  AND SALARY < 5000;

-- ID 118 olan işçinin department 30 və job_id SH ilə başlamırsa update etmək
UPDATE employees
SET JOB_ID = 'SH_CLERK'
WHERE EMPLOYEE_ID = 118
  AND DEPARTMENT_ID = 30
  AND JOB_ID NOT LIKE 'SH%';

-- müxtəlif department-lərə görə salary faizlə artırmaq
UPDATE employees
SET SALARY = CASE
    WHEN DEPARTMENT_ID = 40 THEN SALARY * 1.25
    WHEN DEPARTMENT_ID = 90 THEN SALARY * 1.15
    WHEN DEPARTMENT_ID = 110 THEN SALARY * 1.10
    ELSE SALARY
END;

-- PU_CLERK işçilərinin salary və commission artırılması
UPDATE jobs, employees
SET jobs.min_salary = jobs.min_salary + 2000,
    jobs.max_salary = jobs.max_salary + 2000,
    employees.salary = employees.salary + (employees.salary * 0.20),
    employees.commission_pct = employees.commission_pct + 0.10
WHERE jobs.job_id = 'PU_CLERK'
  AND employees.job_id = 'PU_CLERK';