insert into Levon.dbo.Customers --Task 1
values ('Levon','Saryan 31','096420424','levongabrielyan44@gmail.com');

insert into Levon.dbo.CallDetails --Task 2
values('096420414','096321012','60', '01/01/98 23:59:59.999','01/02/98 23:59:59.999','1','3');
insert into Levon.dbo.Subscribers
values('Levon','Saryan 31','01/01/98','1','1','1');
insert into Levon.dbo.ServicePlans
values('bee1500','1500dr, 500mb, 500 min','4','500','500')

insert into Levon.dbo.Billing --Task 3
values('1','01/01/98','5','waiting','7/26/2023')
update Levon.dbo.Billing
set PaymentStatus='Paid'

insert into Levon.dbo.NetworkOutages --Task 4
values('01/01/98 23:59:59.999','01/01/99 23:59:59.999','Kentron,Arabkir,Masiv','Ashxatakazmi sxal','1')
delete from Levon.dbo.NetworkOutages where OutageId = 1

select CallerNumber, COUNT(Duration) as CallsCount,SUM(Duration) as TotalDuration --Task 5
from Levon.dbo.CallDetails
group by CallerNumber;

select MONTH(BillingDate) as Mount,SUM(Amount) as TotalAmount --Task6
from Levon.dbo.Billing
group by MONTH(BillingDate)

select Avg(Latitude) --Task 7
from Levon.dbo.NetworkCoverage

select SenderNumber,count(SenderNumber),count(ReciverNumber)--Task 8
from Levon.dbo.SMSMessages
group by SenderNumber

select CountryVisited, sum(DataUsage) as DataUsage --Task 9
from Levon.dbo.RoamingData
group by CountryVisited

select ReasonForOutage, count(OutageId) --Task 10
from Levon.dbo.NetworkOutages
group by ReasonForOutage