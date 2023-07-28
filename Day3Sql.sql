select Name --Task 1
from Levon.dbo.Customers
where Id in (select CallerId from Levon.dbo.CallDetails where Duration > 600)

select * from Levon.dbo.Customers --Task 2
where Id in (select CustomerId from Levon.dbo.Billing where PaymentStatus != 'Paid')

select distinct CountryVisited --Task 3
from Levon.dbo.RoamingData

select (select Name from Levon.dbo.Subscribers where Levon.dbo.CallDetails.SubscriberId = Levon.dbo.Subscribers.SubscriberId ),COUNT(CallerNumber)--Task 4
from Levon.dbo.CallDetails
group by SubscriberId

select AffectedAreas, (select EquipmentType from Levon.dbo.NetworkEquipment where Levon.dbo.NetworkOutages.AffectedAreas = Levon.dbo.NetworkEquipment.Location) --Task 5
from Levon.dbo.NetworkOutages

select StartTime, Duration, Name --Task 5
from Levon.dbo.CallDetails
join Levon.dbo.Customers on Customers.Id = CallDetails.CallerId

select Name,Amount,PlanId --Task 6
from Levon.dbo.Subscribers
join Levon.dbo.Billing on SubscriberId = Billing.CustomerId

select OutageId,AffectedAreas,SignalStrenght--Task 7
from Levon.dbo.NetworkOutages
join Levon.dbo.NetworkCoverage on NetworkCoverage.CovergeId = NetworkOutages.CoverageId

select Name,Address,MessageId --Task 8
from Levon.dbo.Subscribers
join Levon.dbo.SMSMessages on Subscribers.SubscriberId = SMSMessages.SubscriberId

select Name,PlanId --Task 9
from CallDetails
join Levon.dbo.Subscribers on Subscribers.SubscriberId = CallDetails.SubscriberId
where CallDetails.Duration > 6000

select Name --Task 10
from Levon.dbo.Customers
union
select Name
from Levon.dbo.Subscribers

select SenderNumber, ReciverNumber --Task 11
from Levon.dbo.SMSMessages
union
select CallerNumber, ReciverNumber
from Levon.dbo.CallDetails

select distinct EquipmentType--Task 12
from Levon.dbo.NetworkEquipment
where Location in (select AffectedAreas from Levon.dbo.NetworkOutages)
union
select distinct EquipmentType
from Levon.dbo.NetworkEquipment
where Location in (select AreaName from Levon.dbo.NetworkCoverage)

select Name--Task 13
from Levon.dbo.Subscribers
where SubscriberId in (select SubscriberId from CallDetails)
union 
select Name
from Levon.dbo.Subscribers
where SubscriberId in (select SubscriberId from Levon.dbo.SMSMessages)

select CustomerId --Task 14
from Levon.dbo.Subscribers
where SubscriberId in
(select SubscriberId
from Levon.dbo.Subscribers
except
select SubscriberId
from Levon.dbo.CallDetails)

select CustomerId --Task 15
from Levon.dbo.Subscribers
where SubscriberId in
(select SubscriberId
from Levon.dbo.Subscribers
except
select SubscriberId
from Levon.dbo.RoamingData)

select CustomerId --Task 16
from Levon.dbo.Subscribers
where SubscriberId in
(select SubscriberId
from Levon.dbo.SMSMessages
intersect
select SubscriberId
from Levon.dbo.CallDetails)

select SubscriberId --Task 17
from Levon.dbo.RoamingData
intersect
select SubscriberId
from Levon.dbo.CallDetails

select SubscriberId, PaymentStatus, CoverageType, PlanId --Task 18
from Levon.dbo.NetworkOutages
join Levon.dbo.Subscribers on Address IN (select AffectedAreas from Levon.dbo.NetworkOutages)
join Levon.dbo.Billing on Billing.CustomerId = Subscribers.CustomerId
join Levon.dbo.NetworkCoverage on NetworkCoverage.CovergeId = NetworkOutages.CoverageId

select SubscriberId, PaymentStatus --Task 19
from Levon.dbo.CallDetails
join Levon.dbo.Billing on Subscribers.CustomerId = Billing.CustomerId
where StartTime > (select RoamingStartDate from RoamingData) and StartTime < (select RoamingEndDate from RoamingData)