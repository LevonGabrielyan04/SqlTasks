--DECLARE @name NVARCHAR(20), @count INT,@i INT; --Task 1,11
--SET @name='Levob';
--SET @count = 0;

--select *
--from Levon.dbo.Customers
--where
--	while @i < Len(@name)
--	begin
--		if Contains(Name,'a')
--			set @count = @count + 1;
--	end

--select distinct SUBSTRING(Email, CHARINDEX('@',Email) + 1,len(Email)-CHARINDEX('@',Email) + 1)--Task 2
--from Levon.dbo.Customers

--UPDATE Levon.dbo.Customers--Task 4
--SET FirstName = SUBSTRING(Name, 1, CHARINDEX(' ', Name) - 1),
--    LastName = SUBSTRING(Name, CHARINDEX(' ', Name) + 1, LEN(Name) - CHARINDEX(' ', Name));

--select SUBSTRING(Name,1,1),COUNT(SUBSTRING(Name,1,1))--Task 5
--from Levon.dbo.Customers
--group by SUBSTRING(Name,1,1)

--declare @timeperiod int,@rate float; --Task 6
--set @timeperiod = 2;
--set @rate = 10.5;
--select Balance * (@rate / 100 + 1) ^ @timeperiod 
--from Levon.dbo.Subscribers

--declare @range int,@lowerLimit int;--Task 7
--set @range = 10;
--set @lowerLimit = 10
--update Levon.dbo.ServicePlans
--set Price = Cast(RAND() * @range as int) + @lowerLimit

--select CustomerId,SUM(Amount)--Task 8
--from Levon.dbo.Billing
--group by CustomerId
--order by SUM(Amount) desc

--declare @rate int; --Task 9
--set @rate = 10 --for minute
--select Cast(Duration / 60.0 * @rate as int)
--from Levon.dbo.CallDetails

--select PlanId, COUNT(PlanId) as Count --Task 10
--from Levon.dbo.Subscribers
--group by PlanId

select Name, BirthDate --Task 12
from Levon.dbo.Customers
where DATEDIFF(day,BirthDate,'2005-01-20') < 7