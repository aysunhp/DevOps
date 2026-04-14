-- cədvəli countries-dən country_new-ə rename etmək
RENAME TABLE countries TO country_new;

-- locations cədvəlinə region_id sütunu əlavə etmək
ALTER TABLE locations
ADD region_id INT;

-- locations cədvəlinə ID sütununu ilk sütun kimi əlavə etmək
ALTER TABLE locations
ADD ID INT FIRST;

-- state_province-dən sonra region_id sütunu əlavə etmək
ALTER TABLE locations
ADD region_id INT AFTER state_province;

-- country_id sütununun data tipini INTEGER-ə dəyişmək
ALTER TABLE locations
MODIFY country_id INT;

-- locations cədvəlindən city sütununu silmək
ALTER TABLE locations
DROP COLUMN city;

-- state_province sütununun adını state etmək
ALTER TABLE locations
CHANGE state_province state VARCHAR(50);

-- location_id üçün primary key əlavə etmək
ALTER TABLE locations
ADD PRIMARY KEY (location_id);

-- location_id və country_id üçün composite primary key əlavə etmək
ALTER TABLE locations
ADD PRIMARY KEY (location_id, country_id);

-- composite primary key-i silmək
ALTER TABLE locations
DROP PRIMARY KEY;

-- job_history cədvəlində job_id üçün foreign key əlavə etmək
ALTER TABLE job_history
ADD FOREIGN KEY (job_id)
REFERENCES jobs(job_id);

-- fk_job_id adlı foreign key constraint əlavə etmək
ALTER TABLE job_history
ADD CONSTRAINT fk_job_id
FOREIGN KEY (job_id)
REFERENCES jobs(job_id);

-- fk_job_id foreign key-ni silmək
ALTER TABLE job_history
DROP FOREIGN KEY fk_job_id;

-- job_id üçün index yaratmaq
CREATE INDEX indx_job_id
ON job_history(job_id);

-- indx_job_id index-ni silmək
DROP INDEX indx_job_id
ON job_history;