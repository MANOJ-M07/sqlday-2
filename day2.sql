create database joinExDb
use joinExDb
create table Depts
(DId int primary key,
DName nvarchar(50) not null unique)
insert into Depts values (1,'App-Development'),
(2,'Web-Development')
,(3,'HR')
,(4,'Account')
,(5,'Agile-Scrum')
select * from Depts order by DId

create table Emps
(Id int primary key,
Fname nvarchar(50) not null,
Lname nvarchar(50) not null,
Designation nvarchar(50),
Salary float,
DId int)

insert into Emps values (1,'Ajay','kumar', 'developer',87000.90,2)
insert into Emps values (2,'vijay','kiran','developer',89000.50,1)
insert into Emps values (3,'Aishu','divi','developer',87000.90,1)
insert into Emps values (9,'kruna','garg','developer',87000.90,2)

insert into Emps(Id,Fname,Lname,Salary)values (5,'Raj','kiran',88000.50)
insert into Emps values (12,'Deep','goyal','developer',86000.30,2)
insert into Emps(Id,Fname,Lname,Designation,Salary)values (13,'Naina','viz','Manager',67000.90)
insert into Emps values(15,'Arsh','K.','HR',76000.90,3)

select * from Emps order by Id
select  * from Depts ORDER BY DId


-----join
----inner join
---outer join : left outer, right outer ,full outer
--self join
--cross join



---inner join

----select tableName1.ColumnName, table2.ColumnName..... from Table1 join Table2 on Table1.CommonColumn= Table2.CommonColumn

select * from Emps join Depts on Emps.DId = Depts.DId

select * from Emps e join Depts d on e.DId = d.DId

select e.Fname,d.Dname from Emps e join Depts d on e.DId = d.DId

select e.Id,e.Fname + ' ' + e.Lname 'Full Name',d.DName 'Department',d.DId,e.Salary,e.Designation
from Emps e join Depts d on e.DId= D.DId