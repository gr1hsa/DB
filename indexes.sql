--Создаём таблицу
CREATE TABLE employee_salary (
companyId VARCHAR(50),
jobType VARCHAR(50),
degree VARCHAR(50),
major VARCHAR(50),
industry VARCHAR(50),
yearsExperience int,
milesFromMetropolis int,
salary int
);

--Переносим данные из csv в нашу таблицу
COPY employee_salary(companyId, jobType, degree, major, industry,
yearsExperience, milesFromMetropolis, salary)
FROM 'C:\emp.csv'
DELIMITER ','
CSV HEADER;

--Посмотрим на данные
SELECT * from employee_salary
Limit 5;

---Сделаем запрос по полю salary и посмотрим время выполнения
EXPLAIN ANALYSE select * from employee_salary
where salary = 123; 

EXPLAIN ANALYSE select * from employee_salary
where salary > 100 and salary < 125;

--DROP INDEX salary_ind
--Создадим индекс по полю salary
CREATE INDEX salary_ind on employee_salary(salary);

EXPLAIN ANALYSE select * from employee_salary
where salary = 123; 

EXPLAIN ANALYSE select * from employee_salary
where salary > 100 and salary < 125;

--Пример, когда индекс не будет использован
EXPLAIN ANALYSE select count(*) from employee_salary
where milesfrommetropolis > 3;

--Создадим индекс
CREATE INDEX miles_ind ON employee_salary(milesfrommetropolis);

EXPLAIN ANALYSE select count(*) from test
where milesfrommetropolis > 3
--Индекс не используется, т.к. данное условие затрагивает почти все строки таблицы
--Создадим индекс по несольким полям
CREATE INDEX job_deg_ind ON employee_salary(jobtype, degree);

EXPLAIN ANALYSE select * from employee_salary
WHERE jobtype = 'MANAGER' and degree LIKE 'HIGH%';

EXPLAIN ANALYSE select * from employee_salary
WHERE jobtype = 'MANAGER';

EXPLAIN ANALYSE select * from employee_salary
WHERE degree = 'HIGH_SCHOOL';
--DROP INDEX job_deg_ind;

-- Создадим покрывающий индекс
CREATE INDEX years_inc_industry_ind ON employee_salary(yearsexperience) INCLUDE (industry);
EXPLAIN ANALYSE select industry from employee_salary
WHERE yearsexperience = 22;
--DROP INDEX years_inc_industry_ind




