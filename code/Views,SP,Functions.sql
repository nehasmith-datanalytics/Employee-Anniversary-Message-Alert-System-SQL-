----*************************  CREATING VIEWS  ***********************------------


--------  VIEW 1 ----------


create view vew_GetEmployeeid as
select * from Emp.Employees
where EmpID in (select EmpID from Emp.Pro_emp
                where Proj_No in (select Proj_No from Emp.Project
				where Proj_Name = 'ERP' ))


select * from vew_GetEmployeeid

---drop view vew_GetEmployeeid


-----------  VIEW 2 ----------------------

create view vew_Getproject as
select  p.Proj_No,p.Proj_Name,p.Proj_type,q.Duration__Hrs,q.start_date from Emp.Pro_emp as q
join Emp.Project as p
on p.Proj_No = q.Proj_No
and Duration__Hrs > 100


select * from vew_Getproject


--------------   VIEW 3  ----------------

create view vew_GetEmployee as
select e.EmployeeName,p.Proj_No from Emp.Employees as e 
join Emp.Pro_emp as p
on e.EmpID = p.EmpID
where Proj_No<301
and Duration__Hrs< 300

select * from vew_GetEmployee


-------*************** STORED PROCEDURE ************** -----------


---------- STORED PROCEDURE 1  -------------------


create procedure proc_AllEmployee
@city varchar(50)

as

select * from Emp.Employees
where city = @city
go

exec proc_AllEmployee  @city= 'Delhi'


---------- STORED PROCEDURE 2  -------------------

create procedure proc_Hiredate
@EmpID int

as

select EmployeeName,DeptID,City, Hire_Date from Emp.Employees
where EmpID=@EmpID
go


exec proc_Hiredate @EmpID=3



----------********* USER DEFINED FUNCTIONS******----------------

-----------  1. Function to get employee by id----------------


create function getemployee(@id int)
   returns varchar(50)

as
begin
 return(select EmployeeName from Emp.Employees
            where EmpID=@id)

end

print dbo.getemployee(5)



-----------  2. Function to get Emp.Department id by employee id----------------

create function GetdeptID(@empid  int)
returns int

as
begin

declare @Deptid int 
select @Deptid=e.DeptID
from Emp.Employees as e
where e.EmpID=@empid

return @Deptid
END

print dbo.GetdeptID(11)


------------------------------   CREATING TRIGGERS ---------------------------------------------


create table Emp.Delete_log
(EmpID int, 
EmployeeName varchar(50), 
DOB date, 
City varchar(30),
Hire_Date date,
Salary float, 
Commission float, 
Gender char(4),
CreatedBy varchar(40),
DeptID int,
Deletion_Date date)


drop table Emp.Delete_log


select * from Emp.Employees


CREATE TRIGGER Insert_Deletelog
ON Emp.Employees
AFTER DELETE
AS
BEGIN
   Insert into Emp.Delete_log(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID,deletion_date)

   select EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID,getdate() from deleted
   
END

drop trigger Insert_Deletelog

delete from Emp.Employees
where EmpID=21


select * from Emp.Delete_log


---------------------------------------------------------------------------------------------

---------------------***********  CREATING CURSOR FOR EMPLOYEE DETAILS ********* -------------------------------

DECLARE @emp_id int ,@emp_name varchar(20),
    @message varchar(max)


DECLARE emp_cursor CURSOR FOR
SELECT EmpID, EmployeeName
FROM Emp.Employees
order by EmpID

OPEN emp_cursor

FETCH NEXT FROM emp_cursor
INTO @emp_id,@emp_name

print 'Employee_ID  Employee_Name'

WHILE @@FETCH_STATUS = 0
BEGIN
    print '   ' + CAST(@emp_id as varchar(10)) +'           '+
        cast(@emp_name as varchar(20))


    FETCH NEXT FROM emp_cursor
INTO @emp_id,@emp_name

END
CLOSE emp_cursor;
DEALLOCATE emp_cursor