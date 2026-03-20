-------****************---------------------------


-----  Find all employees whose birthdays were in last 3 months and fetch all of their details.


select datepart(month,dateadd(month,-3,getdate())) as 'Last_3_Month',
datepart(month, getdate())as 'CurrentMonth',
datepart(month,dateadd(month,3,getdate())) as 'Next_3_Month' from Emp.Employees


-----  Employees who have their birthdays in upcoming 3 months

select * from Emp.Employees
where month(DOB)=datepart(month,dateadd(month,1,getdate()))
or month(DOB)=datepart(month,dateadd(month,2,getdate()))
or month(DOB)=datepart(month,dateadd(month,3,getdate()))


----  Employees with their birthdays from last 3 months

select * from Emp.Employees
where month(DOB)=datepart(month,dateadd(month,-1,getdate()))
or month(DOB)=datepart(month,dateadd(month,-2,getdate()))
or month(DOB)=datepart(month,dateadd(month,-3,getdate()))





-----  Creating function to retrieve a table with birthday greetings for all employees on their birthdays



CREATE FUNCTION fn_getgreeting()

RETURNS @ResultTable TABLE
( 
EmployeeName VARCHAR(50), DOB date, DeptId int,Message varchar(1000)
) AS BEGIN
        INSERT INTO @ResultTable
            SELECT EmployeeName,DOB,DeptId,NULL
                FROM Emp.Employees
                       
UPDATE @ResultTable
            SET Message = 
            CASE WHEN month(DOB)=datepart(month,dateadd(month,-3,getdate())) THEN 'Happy Birthday to you'
		WHEN month(DOB)=datepart(month,dateadd(month,-2,getdate())) THEN 'Warmest greetings on your birthday'
            ELSE 'Happy Birthday,Congrats!'
            END
        
RETURN
END



select * from fn_getgreeting()



====================********************************************===================================================




CREATE FUNCTION fn_getgreeting(@month,@nextorprevious)

@nextorprevious='previous'
@month=month*-1

RETURNS @ResultTable 
( 
EmployeeName VARCHAR(50), DOB date, DeptId int,Message varchar(1000)
) AS BEGIN
     
            SELECT EmployeeName,DOB,DeptId
                FROM Emp.Employees
            where  month(DOB)=datepart(month,dateadd(month,@month,getdate()))

declare @ResultTable
            SET = 
            CASE WHEN month(DOB)=datepart(month,dateadd(month,@month,getdate())) THEN 'Happy Birthday to you'
		WHEN month(DOB)=datepart(month,dateadd(month,@month,getdate())) THEN 'Warmest greetings on your birthday'
            ELSE 'Happy Birthday,Congrats!'
            END
        
RETURN
END



select * from fn_getgreeting()





---------------    CREATING A FUNCTION TO GET EMPLOYEES BIRTHDAY WITHIN A GIVEN RANGE WITH PERSONALISED BDAY MSG


Create Function fn_getgreeting2(@Month int, @nextorprevious varchar(20))
Returns @ResultTable TABLE
(
    EmployeeName varchar(50),
    DOB Date,
    DeptId int,
    Weekday varchar(50),
    Message varchar(1000)
)
AS 
BEGIN
    Declare @StartMonth int
    Declare @EndMonth int

    SET @StartMonth = Month(GETDATE())
    SET @EndMonth = Month(GETDATE())

    IF @nextorprevious = 'previous'
    BEGIN
        SET @StartMonth = Month(DATEADD(Month, -@Month, GETDATE()));
    END
    ELSE IF @nextorprevious = 'next'
    BEGIN
        SET @EndMonth = Month(DATEADD(Month, @Month, GETDATE()));
    END

    Insert into @ResultTable
    Select EmployeeName,
           DOB,
           DeptId,
           DATENAME(WEEKDAY, DATEFROMPARTS(YEAR(GETDATE()), @Month, DAY(DOB))) AS Weekday,
           'Warmest Birthday Wishes, ' + EmployeeName + '! ' +
           'You are now ' + CONVERT(NVARCHAR(10), DATEDIFF(YEAR, DOB, GETDATE())) + ' years old. ' +
           'Enjoy your special day.' AS Message
    from Emp.Employees
    where MONTH(DOB) BETWEEN @StartMonth AND @EndMonth;

    Return
END


select * from fn_getgreeting2(3,'next')





-------********************* Create a function to show personalised birthday msg sent to employees from another table  *********----------



Create Function [dbo].[fn_getgreeting3](@Month int, @nextorprevious varchar(20))

Returns @ResultTable TABLE

(

    EmployeeName varchar(50),

    DOB Date,

    DeptId int,

    Weekday varchar(50),

    Message varchar(1000)

)

AS

BEGIN

    Declare @StartMonth int

    Declare @EndMonth int

 

    SET @StartMonth = Month(GETDATE())

    SET @EndMonth = Month(GETDATE())

 

    IF @nextorprevious = 'previous'

    BEGIN

        SET @StartMonth = Month(DATEADD(Month, -@Month, GETDATE()));

    END

    ELSE IF @nextorprevious = 'next'

    BEGIN

        SET @EndMonth = Month(DATEADD(Month, @Month, GETDATE()));

    END

    Insert into @ResultTable

    Select EmployeeName,

           DOB,

           DeptId,

           DATENAME(WEEKDAY, DATEFROMPARTS(YEAR(GETDATE()), @Month, DAY(DOB))) AS Weekday,

                 Message

                 from Emp.Employees as a

                 join Emp.Greeting as b

                 on DATENAME(WEEKDAY, DATEFROMPARTS(YEAR(GETDATE()), @Month, DAY(DOB)))=b.Weekday

 

                 where Month(DOB) BETWEEN @StartMonth and @EndMonth

      

    Return

END
 

select * from fn_getgreeting3(4,'Next')

select * from fn_getgreeting3(4,'previous')