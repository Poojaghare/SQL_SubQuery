create table EmployeesData1
(
EmployeeId int primary key not null,
EmployeeName varchar(50),
EmployeeDesignation varchar(50),
EmployeeSalary decimal,
EmployeeCity varchar(50)
);

select*from EmployeesData1

insert into EmployeesData1 values(1,'Suraj','Developer',24000,'Pune');
insert into EmployeesData1 values(2,'Kishor','Developer',23000,'Mumbai');
insert into EmployeesData1 values(3,'Sujit','Tester',25000,'Nashik');
insert into EmployeesData1 values(4,'Pooja','Developer',24000,'Nagpur');
insert into EmployeesData1 values(5,'Jiten','Tester',26000,'Solapur');

select count(*) from EmployeesData1
select count(distinct EmployeeCity) from EmployeesData1
select count(EmployeeId) from EmployeesData1

-- as is used to alias to column name
select sum(EmployeeSalary) as SumSalary from EmployeesData1
select avg(EmployeeSalary) as AvgSalary from EmployeesData1

select max(EmployeeSalary)as maxsalary from EmployeesData1
select min(EmployeeSalary) as minsalary from EmployeesData1


---------------GROUP BY-----------------------

select EmployeeCity, COUNT(EmployeeId) as TotalEmp
from EmployeesData1
group by EmployeeCity

--pune
--mumbai
--nagpur

select EmployeeDesignation, COUNT(EmployeeId) as TotalEmp
from EmployeesData1
group by EmployeeDesignation

--Combination of two group
select EmployeeCity,EmployeeDesignation, COUNT(EmployeeId) 
from EmployeesData1
group by EmployeeCity,EmployeeDesignation

update EmployeesData1 set EmployeeCity='Mumbai' where EmployeeId in (1,6)


----------------HAVING CLAUSE------------------

select * from EmployeesData1

select EmployeeCity,COUNT(EmployeeId) as TotalCount from EmployeesData1
group by EmployeeCity
having COUNT(EmployeeId)>1;

select EmployeeCity,COUNT(EmployeeId) as TotalCount from EmployeesData1
group by EmployeeCity
having EmployeeCity in ('Mumbai','Pune');

select EmployeeCity,COUNT(EmployeeSalary) as TotalCount from EmployeesData1
group by EmployeeCity
having max(EmployeeSalary)>22000;


-------------------SUBQUERIES-------------------

--write a query for max salary in emp table, display name of the emp

select EmployeeName from EmployeesData1 where EmployeeSalary=
(select max(EmployeeSalary) from EmployeesData1)

--to find second higest salary

select max(EmployeeSalary) from EmployeesData1 where EmployeeSalary<>
(select max(EmployeeSalary) from EmployeesData1)

--Name of Employee who is taking second highest salary

select EmployeeName from EmployeesData1 where EmployeeSalary=(
select max(EmployeeSalary) from EmployeesData1 where EmployeeSalary<>
(select max(EmployeeSalary) from EmployeesData1)
)


select top 3 EmployeeName,EmployeeSalary from EmployeesData1
order by EmployeeSalary desc
(select EmployeeName,EmployeeDesignation,EmployeeSalary from EmployeesData1 where EmployeeSalary=(select max(EmployeeSalary) from EmployeesData1)
);
