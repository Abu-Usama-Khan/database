CREATE TABLE AbuUsama (
abuusama_id INT PRIMARY KEY,
abuusama_name VARCHAR(50)
);

CREATE TABLE Salaar (
emp_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
salary DECIMAL(10,2),
abuusama_id INT,
FOREIGN KEY (abuusama_id) REFERENCES AbuUsama(abuusama_id)
);

insert into employees values (099, 'Usama','khan',null,null,null,null,'AD_PRES',null,null,null,null);

select * from employees;
select * from departments;

select department_id from employees union
select department_id from departments;

select department_id from employees intersect
select department_id from departments;

select department_id from departments except
select department_id from employees;

select count((select department_id from departments except
select department_id from employees)) as 'Not applied departs';


CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    budget DECIMAL(12,2),
    employee_id INT,  -- FK to Employees table
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);


INSERT INTO Projects (project_id, project_name, start_date, end_date,
budget, employee_id) VALUES
(1, 'Inventory Revamp', '2023-01-01', '2023-06-30', 50000.00, 101),
(2, 'CRM Upgrade', '2023-02-15', '2023-09-15', 75000.00, 102),
(3, 'E-Commerce Expansion', '2023-03-01', '2023-10-01', 90000.00, 103),
(4, 'Mobile App Redesign', '2023-04-10', '2023-12-20', 65000.00, 104),
(5, 'Network Security Audit', '2023-05-05', '2023-08-31', 30000.00, 105),
(6, 'Customer Survey Analysis', '2023-06-01', '2023-10-01', 20000.00, 106),
(7, 'Website SEO Optimization', '2023-06-15', '2023-09-15', 15000.00, 107),
(8, 'Payroll Automation', '2023-07-01', '2023-11-30', 48000.00, 108),
(9, 'Cloud Migration', '2023-07-15', '2024-01-15', 120000.00, 109),
(10, 'Data Center Upgrade', '2023-08-01', '2024-02-28', 95000.00, 110);
INSERT INTO Projects (project_id, project_name, start_date, end_date,
budget, employee_id)
VALUES (11, 'Unassigned Project Alpha', '2023-09-01', NULL, 40000.00, NULL);

select * from projects;
select * from Employees;
select * from Departments;

insert into employees (employee_id, first_name, last_name, email, hire_date, job_id, salary, manager_id, department_id)
values (099, 'Usama', 'Khan', 'usama@gmail.com', '2016-11-18','IT_PROG', 50000, 112, 110);

insert into Departments (department_id, department_name, location_id, manager_id)
values (280, 'Data Science', 1700, 115);

insert into Departments (department_id, department_name, location_id, manager_id)
values (290, 'Geo Infomatics', 1700, 125);

insert into Departments
values (300, 'Artificial Intelligence', 120, 1700);

update employees set salary = salary*1.1;

-- INNER JOIN:
SELECT e.first_name, d.department_name
FROM Employees e
INNER JOIN Departments d ON e.department_id = d.department_id;

SELECT e.first_name, d.department_name
FROM Employees e
INNER JOIN Departments d ON e.department_id = d.department_id
where d.department_name='finance';

-- LEFT JOIN:
SELECT e.first_name, d.department_name
FROM Employees e
LEFT JOIN Departments d ON e.department_id = d.department_id;

-- RIGHT JOIN:
SELECT e.first_name, d.department_name
FROM Employees e
RIGHT JOIN Departments d ON e.department_id = d.department_id;

-- FULL JOIN:
SELECT e.first_name, d.department_name
FROM Employees e
FULL JOIN Departments d ON e.department_id = d.department_id
where e.department_id = null or  d.department_id = null;

SELECT CONCAT(e.first_name, ' ',  e.last_name) as 'Full Name',  d.department_name
FROM Employees e
INNER JOIN Departments d ON e.department_id = d.department_id;

SELECT CONCAT(e.first_name, ' ',  e.last_name) as 'Full Name',  d.department_name
FROM Employees e
right JOIN Departments d ON e.department_id = d.department_id;