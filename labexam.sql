create database nehaaaaa;
use nehaaaaa;
create table customer(phoe int,customer_id varchar(20) primary key,cname varchar(20),delivery_address varchar(20));
create table orders(rest_id varchar(20),order_id varchar(20) primary key,order_address varchar(20),customer_id varchar(20),food_id varchar(20),quantity int);
create table order_status(order_id varchar(20), status varchar(20), time varchar(20), foreign key (order_id) references orders(order_id) ON DELETE CASCADE);
create table delivery_personnel(name varchar(20),phone int, order_id varchar(20),dp_id varchar(20) primary key, foreign key (order_id) references orders(order_id) ON DELETE CASCADE);
create table assigned_to(dp_id varchar(20),order_id varchar(20), foreign key (dp_id) references delivery_personnel(dp_id), foreign key (order_id) references orders(order_id) ON DELETE CASCADE);

insert into orders values("asd123","1234abc","dvg road 25","adc123","908765","19");
insert into orders values("ghb567","567yui","kr road","ghi890","5477","1");
insert into orders values("ghb567","abcd111","kr road","ghi890","5477","1");

insert into order_status values("1234abc","ordered","8:00pm");
insert into order_status values("1234abc","prepared","8:30pm");
insert into order_status values("1234abc","dispatched","9:00pm");
insert into order_status values("1234abc","delivered","10:00pm");

insert into order_status values("567yui","ordered","8:00pm");
insert into order_status values("567yui","prepared","8:30pm");
insert into order_status values("567yui","cancelled","8:30pm");

insert into order_status values("abcd111","ordered","8:00pm");

insert into delivery_personnel values("ROHAN","998273644","1234abc","1234");
insert into delivery_personnel values("mohan","998275044","567yui","5678");
insert into delivery_personnel values("mohit","345563644",NULL,"0987");

insert into assigned_to values("1234","1234abc");
insert into assigned_to values("5678","567yui");


select * from orders;
select * from order_status;
select * from delivery_personnel;
select * from assigned_to;


select order_id,status,time
from order_status
where order_id="1234abc";

insert into assigned_to values("0987","abcd111");


set SQL_SAFE_UPDATES=0;
delete from orders
where order_id in (select order_id from order_status where status="cancelled");
set SQL_SAFE_UPDATES=1;

insert into order_status values("abcd111","dispatched","8:30pm");

select * from orders;



