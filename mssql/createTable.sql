--countries cədvəlini yaratmaq
CREATE TABLE countries (
    country_id INT,
    country_name VARCHAR(50),
    region_id INT
);

--Əgər cədvəl artıq mövcuddursa (error verməsin)
CREATE TABLE IF NOT EXISTS countries (
    country_id INT,
    country_name VARCHAR(50),
    region_id INT
);

--countries strukturuna uyğun dup_countries yaratmaq
CREATE TABLE dup_countries LIKE countries;

--countries cədvəlinin tam kopyasını yaratmaq
CREATE TABLE dup_countries AS
SELECT * FROM countries;

--NOT NULL constraint ilə countries cədvəli
CREATE TABLE countries (
    country_id INT NOT NULL,
    country_name VARCHAR(50) NOT NULL,
    region_id INT NOT NULL
);

--jobs cədvəli (max_salary ≤ 25000 olmalıdır)
CREATE TABLE jobs (
    job_id INT,
    job_title VARCHAR(50),
    min_salary DECIMAL(10,2),
    max_salary DECIMAL(10,2),
    CHECK (max_salary <= 25000)
);

--countries cedveli(yalnız Italy, India, China qəbul edilsin)
CREATE TABLE countries (
    country_id INT,
    country_name VARCHAR(50),
    region_id INT,
    CHECK (country_name IN ('Italy', 'India', 'China'))
);

--job_history (end_date xüsusi formatda olsun)
CREATE TABLE job_history (
    employee_id INT,
    start_date DATE,
    end_date DATE,
    job_id INT,
    department_id INT,
    CHECK (end_date LIKE '__/__/____')
);

--countries (country_id təkrarlana bilməz)
CREATE TABLE countries (
    country_id INT UNIQUE,
    country_name VARCHAR(50),
    region_id INT
);

--jobs cedveli(default dəyərlərlə)
CREATE TABLE jobs (
    job_id INT,
    job_title VARCHAR(50) DEFAULT '',
    min_salary DECIMAL(10,2) DEFAULT 8000,
    max_salary DECIMAL(10,2) DEFAULT NULL
);

--country_id primary key olsun (təkrar olmasın)
CREATE TABLE countries (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(50),
    region_id INT
);

--country_id UNIQUE + AUTO_INCREMENT olsun
CREATE TABLE countries (
    country_id INT UNIQUE AUTO_INCREMENT,
    country_name VARCHAR(50),
    region_id INT
);

--country_id və region_id birlikdə UNIQUE olsun
CREATE TABLE countries (
    country_id INT,
    country_name VARCHAR(50),
    region_id INT,
    UNIQUE (country_id, region_id)
);

--job-history cedveli,employee_id tekrarlanmasin, jobs cedveli ile elaqe
CREATE TABLE job_history (
    employee_id INT PRIMARY KEY,
    start_date DATE,
    end_date DATE,
    job_id VARCHAR(10),
    department_id INT,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

--employee_id təkrarlanmasin, (department_id, manager_id departments cədvəli ile elaqe
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE,
    job_id VARCHAR(10),
    salary DECIMAL(10,2),
    commission DECIMAL(10,2),
    manager_id DECIMAL(6,0),
    department_id DECIMAL(4,0),
    
    FOREIGN KEY (department_id, manager_id)
        REFERENCES departments(department_id, manager_id)
);

--employee_id təkrarlanmasın , departments,jobs cədvəli ile elaqe
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE,
    job_id VARCHAR(10),
    salary DECIMAL(10,2),
    commission DECIMAL(10,2),
    manager_id INT,
    department_id DECIMAL(4,0),

    FOREIGN KEY (department_id) 
        REFERENCES departments(department_id),

    FOREIGN KEY (job_id) 
        REFERENCES jobs(job_id)
) ENGINE=InnoDB;

--ON UPDATE CASCADE + ON DELETE RESTRICT
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_id INT,
    salary DECIMAL(10,2),

    FOREIGN KEY (job_id)
        REFERENCES jobs(job_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE=InnoDB;

--ON DELETE CASCADE + ON UPDATE RESTRICT
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_id INT,
    salary DECIMAL(10,2),

    FOREIGN KEY (job_id)
        REFERENCES jobs(job_id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT
) ENGINE=InnoDB;

--ON DELETE SET NULL + ON UPDATE SET NULL
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_id INT NULL,
    salary DECIMAL(10,2),

    FOREIGN KEY (job_id)
        REFERENCES jobs(job_id)
        ON DELETE SET NULL
        ON UPDATE SET NULL
) ENGINE=InnoDB;

--ON DELETE NO ACTION + ON UPDATE NO ACTION
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    job_id INT,
    salary DECIMAL(10,2),

    FOREIGN KEY (job_id)
        REFERENCES jobs(job_id)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
) ENGINE=InnoDB;