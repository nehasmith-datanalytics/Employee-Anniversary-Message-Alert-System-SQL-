----------------------------------------------  QUERIES  ----------------------------------


-------------******************************************************************-----------------------------

 ---  Q1.Retrieve all distinct Salary values

select distinct Salary from Emp.Employees


--- Q.2. Retrieve the birthdate and city of the employees whose Salary >3000
select DOB,city, Salary from Emp.Employees
where Salary>3000


-----Q.3. Retrieve the firstname of every employee.
select *,
substring(EmployeeName,0,
patindex('% %',EmployeeName)) as FirstName from Emp.Employees



-----Q.4. Retrieve the firstname and lastname of every employee.

select *, 
substring(EmployeeName,0,
patindex('% %',EmployeeName)) as FirstName,

substring(EmployeeName, patindex('% %',EmployeeName)+1,
len(EmployeeName)-patindex('% %',EmployeeName)) as LastName from Emp.Employees


-------AGGREGATE FUNCTIONS--------------------

----Q.5. Find the sum of the salaries of all employees, the maximum Salary, the minimum Salary, and the average Salary. 

select sum(Salary) as sum_sal,max(Salary)as max_sal,
min(Salary)as min_sal,avg(Salary) as avg_sal
from Emp.Employees


-----Q.6. For each Emp.Project, retrieve the Emp.Project number, the Emp.Project name,and the employees who work on that Emp.Project
select Proj_No,Proj_Name,count(*) as proj_count
from Emp.Project
group by Proj_No,Proj_Name

----Q.7. For each Emp.Department, retrieve the Emp.Department number, the number of employees in the Emp.Department, and their average Salary

select DeptID,count(*) as emp_count,avg(Salary) as avg_sal
from Emp.Employees
group by DeptID


----Q.8. Retrieve all employees who were born during the 1980

select EmployeeName,DeptID,City,DOB from Emp.Employees 
where DOB between '01-01-80' and '12-31-89'


----Q.9.Retrieve all employees in Emp.Department 1001,2001,4001 whose Salary is between 2000 and 4000 (inclusive)

select * from Emp.Employees 
where DeptID in (1001,2001,4001) 
and Salary >=2000 and Salary<=4000


-----Q.10. Change the location and controlling Emp.Department number for all Emp.Projects having more than 5 employees to Bhopal and 6 

update Emp.Employees
set City='Bhopal'
where EmpID=14

update Emp.Employees
set City='Jamshedpur'
where EmpID=14


----Q.11. : For each Emp.Department having more than 1 employee, retrieve the Emp.Department no, no of employees drawing more than 40,000 as Salary

 select DeptID from Emp.Employees
 where Commission>90
 group by DeptID
having count(*)>1


------Q.12. Insert a record in Emp.Project table a new Emp.Project and Emp.Department.

insert into Emp.Project (Proj_No,Proj_Name,Proj_type)
values (701,'R&D','Research and Development')
 
insert into Emp.Department(DeptID,DeptName,Location)
  values( 7001,'Research and Development','Bhopal')

  insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
         values(21,'Anish Jain','2-3-1998','Pune','11-9-2018',2230.00,0,'M','Tarun Ahuja',2001)

  select* from Emp.Employees





 ---------*********************  JOINS  ****************-------------------------------------


----Q.13. Retrieve all combinations of Employee Name and Emp.Department Name

select e.EmployeeName,e.DeptID,d.DeptName
from Emp.Employees e
join Emp.Department as d
on e.DeptID=d.DeptID


------Q.14. Increase the Salary of all employees working on Proj_No 101 and 401 Emp.Project by 15% .

select EmployeeName,Salary,1.1*Salary as increased_sal
from Emp.Employees as e
join Emp.Pro_emp as p
on e.EmpID=p.EmpID

join Emp.Project as q
on p.Proj_No=q.Proj_No
where q.Proj_No in (101,401) 

----Q.15. Retrieve a list of employees and the Emp.Project name each works in,ordered by the employee Emp.Department, and within each Emp.Department 
----            ordered alphabetically by employee name

select DeptName, EmployeeName,Proj_Name
from Emp.Employees as e
join Emp.Department as d
on e.DeptID= d.DeptID

join Emp.Pro_emp as p
on e.EmpID=p.EmpID
join Emp.Project as q
on p.Proj_No=q.Proj_No
where e.DeptID=d.DeptID and q.Proj_No=p.Proj_No
order by EmployeeName


------Q.16. List all the information of employees with city and Salary of all the employees working at the dept those are 
----          are not starting with char set ‘S’ and not ending with ‘R’ and joined in the year 2018 
---                but not in the month of Mar or Sep and sal not end with ‘00’ in the asc order of grades.

Select * from Emp.Employees as e 
join Emp.Department as d
on e.DeptID=d.DeptID
where Salary between 2000 and 4000 or DeptName not like 'S%' and DeptName not like '%R' and (Hire_Date like '%18' 
and Hire_Date not like '%3%' and Hire_Date not like '%9%') and Commission != 0 and e.DeptID=d.DeptID


------Q.17. Select the names of employees whose Salary does not match with Salary of any employee in Emp.Department 4001

select EmployeeName,Salary,DeptID
from Emp.Employees
where Salary > all(select Salary from Emp.Employees where DeptID=4001)


-----Q.18. Retrieve the employee numbers of all employees who work on Emp.Project located in Bellaire, Houston, or Stafford.


select EmployeeName, city
from Emp.Employees
where City= 'Delhi'
 (select DeptID
 from Emp.Employees
 where EmpID=5)


----  Q.19. List the emps who are senior to VINOD.

 select * from Emp.Employees 
 where Hire_Date < (select Hire_Date from Emp.Employees 
                      where EmployeeName like '%Vinod%')



-------    List the employees whose Salary are same as Tarun or Salary is more than Divya.

 Select * from Emp.Employees 
 where Salary = (select Salary from Emp.Employees where EmployeeName like '%Tarun%') 
 or Salary < (select Salary from Emp.Employees where EmployeeName='%Divya%') 



 -----Q.20. Group the salaries as Low, Medium, High in a seperate column.

 select Salary from Emp.Employees
 select 
 case
 when Salary<=1000 then 'LOW'
 when Salary<=2000 then 'MEDIUM'
else 'HIGH'
end
as Income from Emp.Employees

