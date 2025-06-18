create view vw_Employee as
Select last_name, first_name, employee_ID, email from employees;

select * from vw_employee;

create view vw_department as
select * from departments;

select * from vw_department;

insert into vw_department values(280, 'Design and Development', null, 1700);

update vw_department
set manager_id = 100
where department_id = 280;

create view vw_HR_DepartmentSummary as
select d.department_id, d.department_name, count(e.employee_id) as employee_count
from departments d
left join employees e on d.department_id = e.department_id
group by d.department_id, d.department_name;

select * from vw_HR_DepartmentSummary;

insert into vw_HR_DepartmentSummary values(290, 'falana', 50);

update vw_HR_DepartmentSummary
set employee_count = 50
where department_id = 10;

create view vw_ActiveEmployees as
select employee_id, first_name, last_name, department_name
from employees e
join departments d on e.department_id = d.department_id;

select * from vw_ActiveEmployees;

create view vw_DepartmentSummary as
select d.department_name, count(e.department_id) as TotalEmployees
from departments d
left join employees e on d.department_id = e.department_id
group by d.department_name;

select * from vw_DepartmentSummary;
select * from employees;

create index idx_department_id_loc on departments(department_id, location_id); 

exec sp_helpindex 'departments';

select * from departments where department_id = 250 and location_id = 1700;

exec sp_rename 'departments.idx_department_id_loc', 'idx_department_id_location', 'index';



