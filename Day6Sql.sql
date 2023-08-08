--create view HighBillsView as --Task 1
--select CustomerId,(select Name from Levon.dbo.Customers where Id = CustomerId) as Name,BillingDate,Amount
--from Levon.dbo.Billing
--where Amount > 500

--create view MounthlyCallDetailsView as --Task 2
--select CallDetailsId, CallerNumber, ReciverNumber, Duration
--from Levon.dbo.CallDetails
--where month(StartTime) = month(getdate()) and year(StartTime) = year(getdate())

--create view ActiveSubscribersView as --Task 3
--select SubscriberId, Name, Status
--from Levon.dbo.Subscribers
--where Status = 0

--create function CalculateDiscount(@amount int) --Task 4
--returns int as 
--begin
--	return @amount * 0.9
--end

--create function GetCustomerDetails(@customerId int) --Task 5
--returns table as
--	return select * from Levon.dbo.Customers where Id = @customerId

--create function GetEmailDomain(@email nvarchar(20)) --Task 6
--returns table as
--	return select SUBSTRING(@email,PATINDEX('@',@email),Len(@email) - PATINDEX('@',@email)) as Domain

--use Levon--Task 7
--go
--create procedure IsertBillingRecord 
--	@customerId int,
--	@date datetime,
--	@amount money
--as
--insert into Levon.dbo.Billing values(@customerId,@date,@amount,1,GETDATE())

--use Levon --Task 8
--go
--create procedure UpdatePrice
--	@productId int,
--	@price int
--as
--update Levon.dbo.Products 
--set Price = @price
--where ProductId = @productId

--use Levon --Task 9
--go
--create procedure CalculateTotalSales
--	@month int
--as
--select sum(SaleAmount) * avg(DefaultPrice) from Levon.dbo.Sales where month(Date) = @month group by month(Date)

--CREATE TRIGGER AfterInsertOrderTrigger --Task 10
--ON Levon.dbo.Customers
--AFTER INSERT
--AS
--BEGIN
--	update Levon.dbo.Customers
--	set OrderCount = OrderCount + 1
--	where Id = (select Id from inserted)
--END


--use Levon--Task 12
--go
--create trigger BeforeDeleteSubscriberTrigger 
--on Levon.dbo.Subscribers
--instead of delete as
--begin
--	declare @Cursor cursor
--	declare @Field int
--	set @Cursor = cursor for 
--	SELECT CustomerId
--	FROM deleted
--	WHERE CustomerId NOT IN
--	(select CustomerId from Levon.dbo.Billing
--	where Billing.PaymentStatus = 'Not paid')
--	open @Cursor
--	fetch Next from @Cursor
--	into @Field
--	while @@FETCH_STATUS = 0
--	begin
--		delete from Levon.dbo.Subscribers
--		where CustomerId = @Field
--		fetch Next from @Cursor
--		into @Field
--	end
--end

--use Levon--Task 12
--go
--create trigger BeforeDeleteSubscriberTrigger 
--on Levon.dbo.Subscribers
--instead of delete as
--begin
--	delete from Levon.dbo.Subscribers
--	where CustomerId in (SELECT CustomerId
--	FROM deleted
--	WHERE CustomerId NOT IN
--	(select CustomerId from Levon.dbo.Billing
--	where Billing.PaymentStatus = 'Not paid'))
--end



