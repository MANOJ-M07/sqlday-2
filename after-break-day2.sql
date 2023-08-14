--primary key , not null
create database Phase2Db
use Phase2Db
--unique : not duplicate, you can write null in unique column but once
--we can write multiple unique per table
create table Emps
(Id int primary key,
Fname nvarchar(50) not null,
Lname nvarchar(50) not null,
mobile varchar(10) unique,
email nvarchar(100) unique
)
insert into Emps values (1,'Sam','dicosta','9876543210','sam@yahoo.com')
insert into Emps values (2,'Aishu','divi','9866543210','Ad@yahoo.com')
insert into Emps values (3,'sneha','dicosta','9866543210','sl@yahoo.com')
--Violation of UNIQUE KEY constraint 'UQ_Emps_A32E2E1CAE59A6FA'. 
--Cannot insert duplicate key in object .The duplicate key value is null.

select * from Emps

insert into Emps(Id,Fname,Lname,mobile) VALUES (4,'nitin','kumar','3698527410')
insert into Emps(Id,Fname,Lname,email) VALUES (5,'nitin','kumar','mk@yahoo.com')

-----------------------------------------------------
drop table Emps

create table Emps
(Id int primary key,
Fname nvarchar(50) not null,
Lname nvarchar(50) not null,
mobile varchar(10) not null unique,
email nvarchar(100) not null unique
)
insert into Emps values (1,'Sam','dicosta','9876543210','sam@yahoo.com')

select * from Emps

insert into Emps(Id,Fname,Lname,email,mobile) VALUES (2,'ravi','kumar','rk@yahoo.com','3698527410')
insert into Emps(Id,Fname,Lname,email,mobile) VALUES (3,'nitin','kumar','mk@yahoo.com','3685291475')

select * from Emps

insert into Emps(Id,Fname,Lname,email,mobile) VALUES (4,'ravi','kumar','pk@yahoo.com','3698527410')
--Violation of UNIQUE KEY constraint 'UQ_Emps_A32E2E1C19B63CB8'. 
--Cannot insert duplicate key in object 'dbo.Emps'. The duplicate key value is (3698527410).

----------------------------------------------------------------------------
---check 
drop table Emps

create table Emps
(Id int primary key,
Fname nvarchar(50) not null,
Lname nvarchar(50) not null,
Salary float check (Salary>=10000)
)

insert into Emps values(1,'Sam' , 'dicosta', 60000)
insert into Emps values(2,'Sam' , 'dicosta', 70000)

insert into Emps values(3,'Sam' , 'dicosta', 6000)
--The INSERT statement conflicted with the CHECK constraint "CK_EmpsSalary_3F466844". 
--The conflict occurred in database "Phase2Db", table "dbo.Emps", column 'Salary'.

select * from Emps

--pattern check using check

create table Employee
(Id int primary key,
Fname nvarchar(50) not null,
Lname nvarchar(50) not null,
Mobile varchar(10) not null unique check (Mobile like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
)

insert into Employee values (1,'sam','dicosta','9876543210')
insert into Employee values (2,'Aishu','dicosta','96543210')

--The INSERT statement conflicted with the CHECK constraint "CK_EmployeeMobile_4316F928". 
--The conflict occurred in database "Phase2Db", table "dbo.Employee", column 'Mobile'.

-----------------------------------------------------------------------------------------------
--Default
drop table Employee
create table Employee
(Id int primary key,
Fname nvarchar(50) not null,
Lname nvarchar(50) not null,
Mobile varchar(10) not null unique check (Mobile like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
City nvarchar(50) default 'Delhi'
)
insert into Employee(Id,Fname,Lname,Mobile) VALUES (1,'nitin','kumar','3698527410')
insert into Employee(Id,Fname,Lname,Mobile,City) VALUES (2,'Akshay','kumar','3698527450','Noida')
select * from Employee

--identity
--numeric datatype
--identity(seed,increment)
--default seed=1, increment =1

create table Customer
(CId int identity(5,2), 
CName nvarchar(50) not null,
CCity nvarchar(50) not null)

insert into Customer values ('Raj', 'Delhi')
insert into Customer values ('Aishu', 'vellore')
insert into Customer values ('Divi', 'chennai')

select * from Customer

drop table Customer
--------------------------------------------
--create table Customer
--(CId int identity, 
--CName nvarchar(50) not null,
--CCity nvarchar(50) not null)
---------------------------------------------
create table Customer
(CId int identity(1000,1), 
CName nvarchar(50) not null,
CCity nvarchar(50) not null)

insert into Customer values ('Raj', 'Delhi')
insert into Customer values ('Aishu', 'vellore')
insert into Customer values ('Divi', 'chennai')

select * from Customer

--------------------------------------
--reference key
--------------------------------------
create table Student
(SId int primary key,
Sname nvarchar(50) not null,
SAge int)

insert into Student values (1,'Ravi',12)
insert into Student values (2,'Ravi',11)
insert into Student values (3,'Ravi',10)
select * from Student
-----------------------------
create table Exam
(ExamId INT PRIMARY KEY,
SId int foreign key references Student,
Marks int not null check(Marks<=500))

insert into Exam values (1,1,499)
insert into Exam values(2,4,499)
--The INSERT statement conflicted with the FOREIGN KEY constraint "FK_ExamSId_4F7CD00D". 
--The conflict occurred in database "Phase2Db", table "dbo.Student", column 'SId'.

create table Category
(CId int primary key,
CName nvarchar(50) unique)
insert into Category values (1,'Clothing')
insert into Category values (2,'Electronic')
insert into Category values (3,'Grooming')


create table Product
(PId int primary key identity,
PName nvarchar(50) not null,
Category int foreign key references Category)
insert into Product values('T-Shirt',1)
insert into Product values('jean',1)
insert into Product values('Laptop',2)
insert into Product values('Earphone',2)

insert into Product values ('Bag',5)
--The INSERT statement conflicted with the FOREIGN KEY constraint "FK_ProductCategor_5629CD9C". 
--The conflict occurred in database "Phase2Db", table "dbo.Category", column 'CId'.
select * from Category
select * from Product

select * from Product,Category where Category.CId= Product.Category

select Product.PId,Product.PName,Category.CId,Category.CName from Product,Category where Category.CId= Product.Category
--or
select P.PId,P.PName,c.CId,c.CName from Product as p,Category as c where c.CId= p.Category