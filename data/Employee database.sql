---create database Emp



create table Emp.Employees
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
Primary key (EmpID))

alter table Emp.Employees add foreign key (DeptID) references Emp.Department(DeptID)

alter table Emp.Employees add foreign key (Gender) references Emp.Gender(Gender)

alter table Emp.Employees add foreign key (CreatedBy) references Emp.Main_Log(CreatedBy)




insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(1,'A P Roy', '3-2-1996','Pune','6-11-2018',2990.00, 00.00,'M','Tarun Ahuja',6001 )

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(2,'Arun Singh', '12-6-1998','Jamshedpur','11-4-2015',1234.00,234.00,'M','Ankita Kashyap', 2001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(3,'S P Kohli', '10-6-1988','Gurgaon','4-8-2015',1234.00,110.00,'M', 'Tarun Ahuja',3001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(4,'Sushil K Jain', '10-11-1999','Lucknow','1-2-2016',3451.00,0.00 ,'M','Ankita Kashyap', 1001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(5,'Arpita R Kumar', '2-4-1989','Bangalore','7-11-2017',2315.00,114.95,'F','Karan Singh', 4001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(6,'Dev P Bajpayee', '4-5-1985','Delhi','9-3-2014',1567.00, 0.00,'M','Tarun Ahuja', 3001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(7,'Karan Singh', '7-3-1992','Chandigarh','5-3-2018',1227.00,0.00,'M','Ankita Kashyap', 1001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(8,'Ankita Kashyap', '2-10-1988','Jaipur','6-2-2015',1526.00,134.00,'F','Karan Singh', 2001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(9,'Tarun Ahuja', '12-7-1990','Delhi','9-10-2014',1456,90.00,'M','Ravi Dubey', 5001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(10,'Ram m Roy', '3-11-1984','Chennai','10-12-2014',2673.00,234.00,'M','Karan Singh', 4001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(11,'Ketaki Swami', '3-2-1987','Karnataka','6-4-2015',3449,0.00, 'F','Ravi Dubey',3001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(12,'S P Dutta', '2-9-1989','Bangalore','7-11-2018',2344.00,0.00, 'M','Ankita Kashyap',3001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(13,'Zareen Sheikh', '1-12-1999','Gurgaon','1-4-2016',1889.00,0.00 ,'F','Karan Singh',1001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(14,'Ravi Dubey', '10-6-1988','Jamshedpur','6-7-2016',1879.00,0.00,'M','Ankita Kashyap', 2001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(15,'Divankar Das', '12-9-1995','Hyderabad','4-9-2017',2090.00,0.00,'M','Ravi Dubey', 6001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(16,'Vinod K Taneja', '3-4-1998','Delhi','3-11-2018',45633.00,234,'M','Karan Singh',5001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(17,'Divya Kumar', '2-12-1995','Chandigarh','4-2-2016',3456,0.00,'F', 'Ankita Kashyap',4001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(18,'Sonia Sood', '1-10-1992','Chandigarh','5-8-2019',1234,0.00,'F','Ravi Dubey',1001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(19,'mudit Khurana', '4-2-1984','Jaipur','6-9-2014',3512.00,0.00,'M','Ankita Kashyap', 1001)

insert into Emp.Employees(EmpID,EmployeeName ,DOB,City,Hire_Date,Salary,Commission, Gender,CreatedBy, DeptID)
values(20,'Saba Saeed', '3-11-1994','Lucknow','5-5-2015',2453.00,0.00,'F','Ravi Dubey', 2001)


select * from Emp.Employees


---------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------********  CREATING DEPARTMENT TABLE *****************---------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------


create table Emp.Department
      (DeptID    int,
       DeptName  VARCHAR(36),
	   Location varchar(30),
	   Primary key(DeptID))

	   insert into Emp.Department(DeptID,DeptName,Location)
	   values( 1001,'Finance','Delhi')

	   
	   insert into Emp.Department(DeptID,DeptName,Location)
	   values( 2001,'HR','Delhi')

	   
	   insert into Emp.Department(DeptID,DeptName,Location)
	   values( 3001,'Technology','Bengaluru')

	   
	   insert into Emp.Department(DeptID,DeptName,Location)
	   values( 4001,'Production','Gurgaon')

	   
	   insert into Emp.Department(DeptID,DeptName,Location)
	   values( 5001,'Audit','Bengaluru')

	   
	   insert into Emp.Department(DeptID,DeptName,Location)
	   values( 6001,'Marketing','Mumbai')


	   select * from Emp.Department
	   
----------------------------------------------------------------------------------------------------------------

----------------------------------------------CREATING Project TABLE----------------------------------


-------------******************************************************************-----------------------------

create table Emp.Project (Proj_No int,
Proj_Name varchar(30),
Proj_type varchar(20),
primary key(Proj_No))

insert into Emp.Project(Proj_No,Proj_Name,Proj_type)
values (101,'ERP','Management')
insert into Emp.Project (Proj_No,Proj_Name,Proj_type)
values (201,'SAP','Sales')
insert into Emp.Project (Proj_No,Proj_Name,Proj_type)
values (301,'TTT','Manufacturing')
insert into Emp.Project (Proj_No,Proj_Name,Proj_type)
values (401,'WAP','Application')
insert into Emp.Project (Proj_No,Proj_Name,Proj_type)
values (501,'HTI','Management')

select * from Emp.Project 






----------------------------------------------------------------------------------------------------------------

----------------------------------------------CREATING Project EMPLOYEE TABLE----------------------------------


-------------******************************************************************-----------------------------

create table Emp.Pro_emp(Proj_No int,
EmpID int,
start_date date,
Duration__Hrs int)

alter table Emp.Pro_emp add foreign key (Proj_No) references Emp.Project(Proj_No)

alter table Emp.Pro_emp add foreign key (EmpID) references Emp.Employees(EmpID)

insert into Emp.Pro_emp (Proj_No,EmpID,start_date,Duration__Hrs)
values (101,11,'2020-09-10',20)
insert into Emp.Pro_emp (Proj_No,EmpID,start_date,Duration__Hrs)
values (201,12,'2000-10-12',700)
insert into Emp.Pro_emp (Proj_No,EmpID,start_date,Duration__Hrs)
values (301,13,'2010-06-06',400)
insert into Emp.Pro_emp (Proj_No,EmpID,start_date,Duration__Hrs)
values (401,14,'2000-10-16',350)
insert into Emp.Pro_emp (Proj_No,EmpID,start_date,Duration__Hrs)
values (501,15,'1999-01-20',250)
insert into Emp.Pro_emp (Proj_No,EmpID,start_date,Duration__Hrs)
values (101,16,'2000-10-12',25)
insert into Emp.Pro_emp (Proj_No,EmpID,start_date,Duration__Hrs)
values (201,12,'2000-10-12',800)
insert into Emp.Pro_emp (Proj_No,EmpID,start_date,Duration__Hrs)
values (301,13,'2010-06-06',320)


select * from Emp.Pro_emp



----------------------------------------------------------------------------------------------------------------

------------------------*************** CREATING GENDER TABLE****************-----------------------------------------

-----------------------------------------------------------------------------------------------------------------------

create table Emp.Gender(Gender char(4),
GenderName varchar(10)
Primary key(Gender))

insert into Emp.Gender(Gender,GenderName)
values('M','Male')

insert into Emp.Gender(Gender,GenderName)
values('F','Female')

select * from Emp.Gender