alter table Levon.dbo.CallDetails --Task 1
	add foreign key(CallerId) references Customers(Id) on delete cascade

alter table Levon.dbo.Billing --Task 2
	add foreign key(CallerId) references Customers(Id) on delete cascade

alter table Levon.dbo.NetworkOutages --Task 3
	add CovergeId int not null
alter table Levon.dbo.NetworkOutages
	add foreign key(CoverageId) references NetworkCoverage(CovergeId) on delete cascade

alter table Levon.dbo.Subscribers --Task 4 
	add PlanId int not null
alter table Levon.dbo.Subscribers
	add foreign key(PlanId) references ServicePlans(PlanId)

alter table Levon.dbo.SMSMessages --Task 5
	add SubscriberId int not null
alter table Levon.dbo.SMSMessages
	add foreign key(SubscriberId) references Subscribers(SubscriberId)

alter table Levon.dbo.RoamingData --Task 6
	add foreign key(SubscriberId) references Subscribers(SubscriberId)

alter table Levon.dbo.CallDetails --Task 7
	add SubscriberId int not null
alter table Levon.dbo.CallDetails
	add foreign key(SubscriberId) references Subscribers(SubscriberId)