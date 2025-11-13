create database if not exists supplierdatabase;
use supplier;
create table supplier(sid int primary key , sname varchar(20), city varchar(20));
create table parts(pid int primary key, pname varchar(20),color varchar(20));
CREATE TABLE CATALOG(SID INT ,PID INT,COST INT, FOREIGN KEY(SID) REFERENCES SUPPLIER(SID), FOREIGN KEY(PID) REFERENCES PARTS(PID));

INSERT INTO SUPPLIER VALUES(10001,'ACME WIDGET','BANGALORE'),(10002,'JOHNS','KOLKATA'),(10003,'VIMAL','MUMBAI'),(10004,'RELIANCE','DELHI');

INSERT INTO PARTS VALUES(20001,'BOOK','RED'),(20002,'PEN','RED'),(20003,'PENCIL','GREEN'),(20004,'MOBILE','GREEN'),(20005,'CHARGER','BLACK');

INSERT INTO CATALOG VALUES(10001,20001,10),(10001,20002,10),(10001,20003,30),(10001,20004,10),(10001,20005,10),(10002,20001,10),(10002,20002,20),(10003,20003,30),(10004,20003,40);

SELECT DISTINCT(P.PNAME) FROM 
PARTS P, CATALOG C
WHERE P.PID=C.PID;

SELECT S.SNAME FROM
SUPPLIER S, CATALOG C
GROUP BY s.sid, s.sname
HAVING COUNT(DISTINCT c.pid) = (SELECT COUNT(*) FROM Parts);

SELECT s.sname
FROM Supplier s
WHERE s.sid IN (
    SELECT c.sid
    FROM Catalog c, Parts p
    WHERE c.pid=p.pid
      AND p.color='red'
    GROUP BY c.sid
    HAVING COUNT(DISTINCT p.pid)=(
        SELECT COUNT(*) FROM Parts WHERE color = 'red'));
        
SELECT P.PName from parts p , catalog c
where p.pid=c.pid
and c.sid=10001
and p.pid not in (select c2.pid from catalog c2 where c2.sid <> 10001);

select distinct c.sid
from catalog c
where c.cost>( select avg(c2.cost) from catalog c2 where c2.pid=c.pid);

SELECT p.pname, s.sname
FROM Supplier s, Parts p, Catalog c
WHERE s.sid = c.sid
  AND p.pid = c.pid
  AND c.cost = (SELECT MAX(c2.cost) FROM Catalog c2 WHERE c2.pid = c.pid);

