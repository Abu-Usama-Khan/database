select concat(first_name, ' ',last_name) as 'Full Name', d.department_name
from Departments d
left join employees e
on e.department_id = d.department_id
join locations l
on l.location_id = d.location_id;

select d.department_name, e.employee_id
from Departments d
left join employees e
on d.department_id = e.department_id
where e.department_id is null;

select e.*, d.department_name
from employees e 
left join departments d
on e.department_id = d.department_id;

select concat(first_name, ' ',last_name) as 'Full Name', d.department_name
from employees e 
join departments d
on e.department_id = d.department_id
join locations l
on l.location_id = d.location_id
where l.city = 'london';

select concat(first_name, ' ',last_name) as 'Full Name', d.department_name
from employees e 
join departments d
on e.department_id = d.department_id
where d.location_id in (select location_id from locations where city = 'london');

select concat(first_name, ' ',last_name) as 'Full  Name'
from employees
where department_id in (select department_id from Departments where location_id in (select location_id from locations where city = 'london'));



select * from employees order by first_name;
select * from Departments;

select * from Locations;



