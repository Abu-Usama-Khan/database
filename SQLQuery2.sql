select * from Projects;
select * from Employees;
select * from Departments;

select CONCAT(e.first_name, ' ',  e.last_name), p.project_name 
from Employees e
right join Projects p
on e.employee_id=p.employee_id
where p.employee_id is null;

select CONCAT(e.first_name, ' ',  e.last_name), p.project_name, d.department_name
from Employees e
full join Projects p
on e.employee_id=p.employee_id
full join Departments d
on e.employee_id=d.manager_id;

select count(select salary
from employees
where salary>(select avg(salary) from employees)))
from employees;

--1
select CONCAT(first_name, ' ',  last_name) as 'Full Name', salary
from employees
where salary>(select avg(salary) from employees) order by salary desc;

--2a
select distinct e.department_id, d.department_name
from Employees e
left join Departments d 
on e.department_id=d.department_id
where (select count(department_id) from employees where department_id=e.department_id)>5;

--2b
select department_id, department_name
from Departments
where department_id in (select department_id from employees group by department_id having count(department_id)>5);

--4
select CONCAT(first_name, ' ',  last_name) as 'Full Name', salary
from employees
where salary=(select max(salary) from employees);

--5
select CONCAT(first_name, ' ',  last_name) as 'Full Name', salary, department_id
from employees
where salary > (select avg(salary) from employees group by department_id);

--6
select CONCAT(first_name, ' ',  last_name) as 'Full Name', department_id
from employees
where department_id = (select department_id from employees where first_name='john');
