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
where salary = 123; --Время выполнения 156 ms

EXPLAIN ANALYSE select * from employee_salary
where salary > 100 and salary < 125;

select * from test
limit 1	
EXPLAIN ANALYSE select * from test
where milesfrommetropolis > 22 and milesfrommetropolis < 33;
create index aboba2 on test(milesfrommetropolis)
drop index aboba2
EXPLAIN ANALYSE select count(*) from test
where milesfrommetropolis > 3

select * from test
limit 10;