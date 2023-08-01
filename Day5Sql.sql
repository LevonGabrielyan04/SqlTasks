create table Levon.dbo.SapmleData(
  SampleDataId int identity primary key,
  Seconds int not null default 0,
  Minutes int not null default 0
  )
create table Levon.dbo.Products(
  ProductId int identity primary key,
  Name nvarchar(20) not null,
  Description nvarchar(50) not null,
  Discount int not null default 0,
  Price int not null)


declare @i int --Task 1
set @i = 0
while @i<100
begin
  insert into Levon.dbo.SapmleData values(cast(Rand() * 100 as int),cast(Rand() * 100 as int))
  set @i = @i + 1
end

declare @i int --Task 2
set @i = 0
while @i <= (SELECT MAX(ProductId) FROM Levon.dbo.Products)
begin
  update Levon.dbo.Products
  set Discount = 10
  where ProductId = @i and Price > 1000

  set @i = @i + 1
end

create table Levon.dbo.LogData( --Task 3
	LogDataId int identity primary key,
	Data nvarchar(50) not null,
	Date datetime not null
)
declare @date datetime
set @date = '2023-01-01'
delete from Levon.dbo.LogData
where DATEDIFF(day,@date,Date) < 0

declare @Cursor cursor --Task 5
declare @Field int
set @Cursor = cursor for 
select SubscriberId from Levon.dbo.Subscribers
open @Cursor
fetch Next from @Cursor
into @Field
while @@FETCH_STATUS = 0
begin
	select Name from Levon.dbo.Subscribers where SubscriberId = @Field
	fetch Next from @Cursor
	into @Field
end


SELECT --Task 6
	Name,
    CASE
        WHEN Price >= 3000 THEN 'High'
        WHEN Price BETWEEN 1001 AND 2999 THEN 'Medium'
        ELSE 'Low'
    END
FROM Levon.dbo.Products

create table Levon.dbo.Students(--Task 7
 StudentId int primary key identity,
 Name int not null,
)
create table Levon.dbo.Grades(
	GradeId int primary key identity,
	Grade tinyint not null,
	StudentId int not null,
	foreign key (StudentId) references Levon.dbo.Students(StudentId)
)
select StudentId, case 
					when avg(grade) > 80 then 'Gerazanc'
					when avg(grade) between 40 and 79 then 'Bavarar'
					when avg(grade) <40 then 'Anbavarar'
				   end
from Levon.dbo.Grades
group by StudentId

alter table Levon.dbo.CallDetails --Task 8
add AreaCode nvarchar(3) not null default 'ARM'
select CallDetailsId,case AreaCode 
					 when 'ARM' then 'local'
					 else 'roaming' 
					 end as CallLoacation
from Levon.dbo.CallDetails

update Levon.dbo.Billing --Task 9
set Amount = case 
				when Amount < 1000 then Amount * 0.9
				when Amount > 1000 then Amount * 0.7
			 end

select Name,case --Task 10
				when datediff(year,BirthDate,GETDATE()) < 25 then 'Young'
				when datediff(year,BirthDate,GETDATE()) between 26 and 59 then 'Adult'
				when datediff(year,BirthDate,GETDATE()) >= 60 then 'Senior'
			end as AgeCategory
from Levon.dbo.Customers

update Levon.dbo.Billing --Task 11
set Amount = case 
				when ISNULL(Amount,0) = 0 then 0
			 end

update Levon.dbo.Products --Task 12
set Description = coalesce(Description,'not defined')

create table Levon.dbo.Sales(--Task 13
	Id int identity primary key,
	DefaultPrice int not null,
	SaleAmount int 
)
select Coalesce(SaleAmount,DefaultPrice) as SaleAmount
from Levon.dbo.Sales

begin try --Task 14
	select Seconds/Minutes
	from Levon.dbo.SapmleData
end try
begin catch
	print 'Bad data in database'
end catch

begin try --Task 15
	insert into Levon.dbo.Subscribers values('Levon','Saryan 31','2004-01-15',0,0,1,96420414,1,0)
end try
begin catch
	print ERROR_MESSAGE()
end catch