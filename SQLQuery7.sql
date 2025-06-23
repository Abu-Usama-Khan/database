create procedure insertDepartmentFields @depId int, @dep varchar(50), @mgrId int, @locId int
as
begin
insert into departments
values (@depId, @dep, @mgrId, @locId)
end

exec insertDepartmentFields 300, "Support and Services", 201, 1800;


select * from Departments

