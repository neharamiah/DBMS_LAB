show databases;
use insurance;
show tables;
select * from person;
select * from accident;
select * from participated;
select * from car;
select * from car order by year asc;
select count(*) as no_of_accidents from participated, car
where car.model='indica' and car.reg_no=participated.reg_no;
select count(distinct drive_id) from 
participated p, accident b
where p.report_num=b.report_num
and accident_date like "%2025";
select * from participated order by damage_amt desc;
select avg(damage_amt) from participated;

select distinct name from person where drive_id in (select drive_id from participated where damage_amt>(select avg(damage_amt) from participated));
select max(damage_amt) from participated;
select * from accident;
update participated set damage_amt='2800'
where report_num='34567' and reg_no='KA231243';
insert into accident values('123456','2020-08-02',"KR NAgar");


