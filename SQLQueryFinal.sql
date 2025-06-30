-- SECTION B		SHORT QUESTIONS

-- 4-
select departmentID as 'Department ID', count(employeeId) as 'Total Employees'
from employeeDepartmentHistory
group by departmentID;

-- 5-
select FirstName, LastName, d.Name as DepartmentName
from employeeDepartmentHistory edh
inner join employee e on edh.employeeId = e.employeeId
inner join department d on edh.departmentId = d.departmentId
inner join person p on e.personId = p.personId;

-- 6-
create view vw_SalesOrderHeader as
select SalesOrderID, CustomerID, TotalDue
from salesorderheader
where totalDue > 10000;

select * from vw_SalesOrderHeader

-- 7-
select * from employee
where vacationHours > (select avg(vacationHours) from employee);

-- 8-
create procedure sp_FetchEmployeesByJobTitle @jobTitle nvarchar(50)
as
begin
select concat(firstName,' ',lastName) as EmployeeName, e.* 
from employee e
inner join person p on e.personID = p.personID
where jobTitle = 'Developer'
end;

exec sp_FetchEmployeesByJobTitle 'Developer';

-- SECTION C		Case Study QUESTIONS

-- Part 1
-- 1-
select customerID, count(distinct(salesOrderID)) as TotalSales
from salesOrderHeader
group by customerID
having count(salesOrderID) > 3 order by TotalSales desc;

-- I used distinct(salesOrderID) to protect, if any customer has two similar salesOrderID (more effiecent result)

-- 2-
select customerID, count(distinct(salesOrderID)) as TotalSales
from salesOrderHeader
group by customerID
having count(salesOrderID) > 5;

-- 3-
create table  #TopSellingProducts (
ProductID int,
OrderQty int,
LineTotal decimal(10,2)
)

insert into #TopSellingProducts
select ProductID, OrderQty, LineTotal
from salesOrderDetail
where orderQty > 100;

select * from #TopSellingProducts

-- 4-
create view vw_EmployeeDepartments as
select edh.employeeID, concat(firstName,' ',lastName) as FullName, Name as DepartmentName, StartDate
from employeeDepartmentHistory edh
inner join employee e on edh.employeeId = e.employeeId
inner join department d on edh.departmentId = d.departmentId
inner join person p on e.personId = p.personId;

select * from vw_EmployeeDepartments;

-- 5-
select employeeID, departmentID
from employeeDepartmentHistory
where departmentID=1 and employeeID in (select employeeID from employee where jobTitle = 'Engineer');

-- 6-
create procedure usp_CustomerOrders @customerID int
as
begin
select * from salesOrderHeader
where customerID = @customerID
end;

exec usp_CustomerOrders 63;

-- Part 2
-- 7-
select * from employee where jobTitle ='Manager'
union
select * from employee where vacationHours > 100;

-- 8-
select Name, orderQty, linetotal
from salesOrderDetail sod
join product p on sod.productID = p.productID
order by lineTotal desc limit = 3;

-- limit=3 works on mysql not remembered for sql server

-- 9-
select customerID from salesorderheader
where totalDue > (select avg(totalDue) from salesorderheader);

-- 10-


-- shortage of time


select * from employee
select * from person
select * from department
select * from employeedepartmenthistory
select * from salesorderheader
select * from salesOrderDetail
select * from product;