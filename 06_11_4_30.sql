-- Creating and deleting databses

create database flipkart;
show databases;
select database();
use flipkart;
select database();
create database google;
create database facebook;
use facebook;
use google;
drop database facebook;
select database();
drop database google;

-- creating and deleting tables

select database();
create database school;
use school;

create table students(
roll_no int,
name varchar(255),
marks int,
class int);

describe students;

create table teachers(emp_code int,
t_name varchar(255),
sub char(6));

describe teachers;

show tables;
drop table students;
drop table teachers;
drop database school;

show databases;
select database();

select database();
create database hr;
use hr;
create table employee(
emp_id int,
e_name varchar(255));

show tables;

describe employee;
alter table employee add column salary int;
alter table employee add department varchar(50);
alter table employee drop salary;
alter table employee add age varchar(255);
alter table employee modify column age int;
alter table employee rename column e_name to first_name;
alter table employee rename manager;
describe manager;

create database facebook;
select database();
use facebook;

create table subscriber(
sub_id int not null unique primary key,
f_name varchar(255) default "not given",
l_name varchar(255),
d_o_b date not null,
contact_number int,
age int check(age>=18),
is_adult boolean);

show tables;
describe subscriber;


create table customer(
cus_id int,
city varchar(255),
depart char(5),
country varchar(50),
foreign key(cus_id) references subscriber(sub_id));

show tables;

describe customer;

drop table subscriber;

create table sales(
id int primary key auto_increment,
name varchar(255) default "not available",
country char(5));

describe sales;


create database school;

use school;

create table students(
id int not null unique primary key,
name varchar(255) default "Unnamed",
age int not null,
class int not null);

describe students;




-- method 1
insert into students (id, name, age, class)
values
(1, 'mohit', 18, 12),
(2, 'rohit', 17, 11);

select * from students;


-- method 2 

insert into students
values
(3, 'jatin', 14, 8),
(4, 'shweta', 19,12),
(5, 'prateek', 14, 8),
(6, 'vishnu', 12, 7),
(7, 'mahesh', 17, 10),
(8, 'aparna', 16, 11),
(9, 'jatin', 17, 11),
(10, 'rohit', 13, 8);

select * from students;
select database();
use school;
show tables;
select * from students;

-- truncate - it deletes all the records by keeding sturutcure intake

select * from students;

truncate students;
drop table students;

-- Select Statemenet
select * from students;
select * from students;
select name, class from students;
select class, id, age, name from students;
select age from students;

-- distinct

select name from students;
select distinct name from students;
select distinct * from students;
select distinct name, class from students;

-- Limit, offset, orderby

select * from students limit 6;
select * from students limit 2 offset 7;
select * from students order by class asc;
select * from students order by class desc;
select * from students order by class , age asc;

-- where clause

select * from students where class >=11;
select * from students where id = 5;
select * from students where name = "jatin";
select * from students where age >16;


-- Logical Operator and , or, not, between, in, like

select * from students where class >=11 and name = "rohit"; 
select * from students where class >=10 or name = "rohit"; 
select * from students where not name = "jatin";
select * from students where age between 13 and 17;
select * from students where name = "prateek" or name = "rohit" or name = "aparna";
select * from students where name in ("prateek", "rohit", "aparna");

-- like -pattern matching

-- wildcards - 
-- % - n number of characters
-- _ - 1 characters 

select * from students where name like "r%";
select * from students where name like "%t";
select * from students where name like "%ti%";
select * from students where name like "_a%";
select * from students where name like "%h__";


-- Aggregate Functions
-- alias - nick name

select count(*) as total from students;
select sum(age) as total_age from students;
select min(age) minimum_age from students;
select max(age) maximum_age from students;
select avg(age) average_age from students;


-- DML
-- Update, Delete

-- TCL - Transaction control Lang
-- Commit
-- Savepoint
-- Roll back

use school;
select * from students;
update students set class = 10 where id = 1;
update students set name = "pooja" where id = 2;
delete from students where id = 3;
set sql_safe_updates = 0;
update students set age = 10;
select * from students;
update students set name = "sajal";
delete from students where id = 5;
delete from students;

-- TCL 

select * from students;
start transaction;
select * from students;
update students set age = 20, class = 12 where id = 3;
select * from students;
update students set class = 9;
select * from students;
delete from students;
select * from students;
rollback;
select * from students;


begin;
select * from students;
update students set name = "raja" where id = 2;
delete from students where id = 4;
update students set age = 10;
delete from students;
select * from students;
rollback;

select * from students;

begin;
select * from students;
savepoint point1;
update students set name = "Sam" where id = 1;
select * from students;
savepoint point2;
delete from students where id = 2;
select * from students;
savepoint point3;
update students set name = "jam";
select * from students;
savepoint point4;
delete from students;
select * from students;
rollback to point3;
select * from students;
commit;
select * from students;

-- difference between drop, truncate and delete

-- drop table students;
-- truncate students;
-- delete


-- group by
select * from students;

-- we never  fecth * when using group by
select * from students group by class;


-- group by - always use Aggregate Functions 
select class, count(*) from students group by class;

-- group by - never use where clause 
select class, count(*) from students group by class where count(*)>2;

select class, count(*) total_students from students group by class having count(*)>2;
select class, count(*) total_students from students group by class having total_students>2;


-- DCL 











