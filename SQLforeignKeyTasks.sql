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
