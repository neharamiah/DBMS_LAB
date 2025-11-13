create database employee;
use employee;
create table dept(deptno int primary key, dname varchar(30), dloc varchar(30));
create table employee(empno int primary key, ename varchar(30),mgrno int, hiredate date,sal decimal(10,2), deptno int, foreign key (deptno) references dept(deptno));
create table project(pno int primary key, pname varchar(30), ploc varchar(30));
create table assigned_to(empno int, pno int, jobrole varchar(30),foreign key (empno) references employee(empno), foreign key (pno) references project(pno));
create table incentives(empno int, incentivedate date, incentiveamt decimal(10,2), foreign key(empno) references employee(empno));

insert into dept values(10,'hr','bengaluru'),(20,'pr','hyderabad'),(30,'dev','kochi'),(40,'testing','mysuru'),(50,'marketing','bengaluru');
insert into employee values(101,'NEHA',1001,'2025-01-01',10000,10),(102,'SIA',1002,'2025-11-01',20000,20),(103,'RIYA',1003,'2025-11-11',30000,30),(104,'NIA',1004,'2024-03-04',40000,40),(105,'TIA',1005,'2024-01-01',50000,50);
INSERT INTO PROJECT VALUES(1,'ERP SYSTEM','bengaluru'),(2,'mobile app','hyderabad'),(3,'bank app','mysuru'),(4,'web app','bengaluru'),(5,'tracker','kochi');
insert into assigned_to values(101,1,'manager'),(102,2,'hr'),(103,3,'developer'),(104,4,'tester'),(105,5,'outreach');
insert into incentives values(101,'2025-04-01',10000),(105,'2025-08-09',20000),(103,'2025-02-03',300000);

select distinct empno from
assigned_to a join project p on a.pno=p.pno
where p.ploc in ('bengaluru','hyderabad','mysuru');

select e.ename, e.empno, d.dname, a.jobrole, d.dloc, p.ploc
from employee e join dept d on e.deptno=d.deptno
join assigned_to a on e.empno = a.empno
join project p on a.pno= p.pno
where d.dloc=p.ploc;

