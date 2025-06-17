create view vw_employees_directory as
select concat(e.first_name,' ', e.last_name) as fullName, d.department_name 
from employees e
join Departments d
on e.department_id = d.department_id;

create view vw_employees_directory2 as
select e.first_name, e.last_name, d.department_name 
from employees e
join Departments d
on e.department_id = d.department_id;

create view vw_employees_directory3 as
select first_name, last_name, department_id
from employees;

create view vw_employees_directory4 as
select *
from employees;

select fullName from vw_employees_directory;

insert into vw_employees_directory 
values ('Asad Khan', 'IT');

insert into vw_employees_directory3
values ('Asad', 'Khan', 33);

insert into vw_employees_directory3
values ('Asad', 'Khan', 33);