drop database EmployeeDB
create database EmployeeDB

use EmployeeDB

create table Employee(
EmpId int Primary Key identity(1,1),
EName varchar(20),
Gender char(1),
HireDay date,
DeptNo int,
Email varchar(20),
BirthDay date,
JobDiscription varchar(20),
ProfileImage varchar(20)
);

create table Salary(
SalaryId int Primary Key identity(1,1),
SalaryMonth varchar(20),
EmpSal money,
EmpId int,
 Foreign Key ( EmpId) References Employee (EmpId)
);

Create table Department(
DeptNo int Primary Key identity (1,1),
DeptName varchar(20)
);

insert into Department values('Hr');
insert into Department values('Sales');
insert into Department values('Finance');
insert into Department values('Engineer');
insert into Department values('Others');

create procedure [dbo].[spAddEmployee]
@EName varchar(20),
@Gender char(1),
@HireDay date,
@DeptNo int,
@Email varchar(20),
@BirthDay date,
@JobDiscription varchar(20),
@ProfileImage varchar(20)

as
begin
Insert into Employee values(@EName,@Gender,@HireDay,
@DeptNo,@Email,@BirthDay,@JobDiscription,
@ProfileImage)
SELECT SCOPE_IDENTITY()
End

create procedure [dbo].[spAddEmployeeSalary]
@SalaryMonth varchar(20),
@EmpSal money,
@EmpId int

as
begin
Insert into Salary values(@SalaryMonth,@EmpSal,@EmpId)
End

create or alter Procedure [dbo].[spD]
@EmpId int
as
begin
delete from Salary where EmpId=@EmpId
delete from Employee where EmpId=@EmpId
End 

create or alter procedure [dbo].[spU]
@EmpId int ,
@EName varchar(20),
@Gender char(1),
@HireDay date,
@DeptNo int,
@JobDiscription varchar(20),
@ProfileImage varchar(20),
@SalaryMonth varchar(20),
@EmpSal money
as
begin
BEGIN TRANSACTION
Update Employee
set Employee.EName=@EName,Employee.Gender=@Gender,Employee.HireDay=@HireDay,Employee.DeptNo=@DeptNo,Employee.JobDiscription=@JobDiscription,Employee.ProfileImage=@ProfileImage
from Employee employee Inner join Salary salary 
on salary.EmpId=employee.EmpId
and employee.EmpId=@EmpId

Update Salary
set Salary.EmpSal=@EmpSal,Salary.SalaryMonth=@SalaryMonth
from Salary salary inner join Employee employee
on salary.EmpId=employee.EmpId
and employee.EmpId=@EmpId
Commit
End

Create or alter procedure [dbo].[spGetEmployeeById]
@EmpId int
as
begin
select Employee.EmpId,Employee.ProfileImage,Employee.EName,Employee.Gender,Employee.JobDiscription,Department.DeptNo,Department.DeptName,Salary.EmpSal,Employee.HireDay
from Employee, Salary,Department
where Employee.EmpId=@EmpId and Salary.EmpId=@EmpId and Employee.DeptNo=Department.DeptNo
end

Create procedure [dbo].[spGetAllEmployees]
as
begin
Select e.EmpId,e.ProfileImage,e.EName,e.Gender,d.DeptName,s.EmpSal,e.HireDay
from Employee e, Salary s,Department d
where e.EmpId=s.EmpId and e.DeptNo=d.DeptNo
end