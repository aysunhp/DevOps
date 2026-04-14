-- countries cədvəlinə yeni qeyd əlavə etmək
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('C01', 'Azerbaijan', 1001);

-- yalnız COUNTRY_ID və COUNTRY_NAME sütunlarına dəyər əlavə etmək
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME)
VALUES ('C02', 'Turkey');

-- countries cədvəlini bütün data və struktur ilə country_new kimi kopyalamaq
CREATE TABLE country_new AS
SELECT * FROM countries;

-- region_id sütununa NULL dəyər daxil etmək
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('C03', 'Germany', NULL);

-- bir sorğu ilə 3 yeni sətir əlavə etmək
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES 
('C04', 'France', 1002),
('C05', 'Italy', 1003),
('C06', 'Spain', 1004);

-- country_new cədvəlindən countries cədvəlinə data köçürmək
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
SELECT COUNTRY_ID, COUNTRY_NAME, REGION_ID
FROM country_new;

-- job_id təkrarlanmaması üçün yeni qeyd əlavə etmək
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
VALUES ('IT_PROG2', 'Programmer', 4000, 10000);

-- job_id varsa əlavə etmə, yoxdursa əlavə et
INSERT INTO jobs (job_id, job_title, min_salary, max_salary)
SELECT 'IT_PROG3', 'Developer', 5000, 12000
WHERE NOT EXISTS (
    SELECT 1 FROM jobs WHERE job_id = 'IT_PROG3'
);

-- country_id və region_id kombinasiyası təkrarlanmadan insert etmək
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('C07', 'Azerbaijan', 1001);

-- country_id avtomatik artan (AUTO_INCREMENT olmalıdır)
INSERT INTO countries (COUNTRY_NAME, REGION_ID)
VALUES ('Portugal', 1005);