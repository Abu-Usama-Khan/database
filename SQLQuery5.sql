--1
create table #tempTable (
employee_id INT,
first_name VARCHAR(100),
salary DECIMAL(10,2)
);

insert into #tempTable
select employee_id, first_name, salary
from employees
where salary>6000;

--2
select first_name
from #tempTable
where first_name like 's%';

--3
select first_name
from #tempTable
where first_name like '%s%';

--4
drop table #tempTable;

--5
create table #tempTable (
employee_id INT,
first_name VARCHAR(100),
department_name varchar(100)
);

insert into #tempTable
select employee_id, first_name, department_name
from employees e
inner join departments d
on e.department_id = d.department_id;

select * from #tempTable;