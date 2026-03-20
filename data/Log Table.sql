----------------------------------------------------------------------------------------------------------------

--------------------***************** CREATING LOG TABLE***************----------------------------------------

--------------------------------------------------------------------------------------------------------------------

create table Emp.Main_Log(
CreatedBy varchar(40),
Create_Datetime datetime,
Primary key(CreatedBy))

insert into Emp.Main_Log(CreatedBy,Create_Datetime)
values('Ankita Kashyap','3-4-2023 11:00:04')


insert into Emp.Main_Log(CreatedBy,Create_Datetime)
values('Karan Singh','3-4-2023 12:10:04')


insert into Emp.Main_Log(CreatedBy,Create_Datetime)
values('Tarun Ahuja','3-4-2023 2:53:12')


insert into Emp.Main_Log(CreatedBy,Create_Datetime)
values('Ravi Dubey','3-4-2023 11:10:00')


select * from Emp.Main_Log

--------------------***********************************************************************************----------------