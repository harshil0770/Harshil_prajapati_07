/*Open school database, then select student table and use following SQL statements.
TYPE THE STATEMENT, PRESS ENTER AND NOTE THE OUTPUT 
ASSESSMENT 2
*/
Create schema student;
Create table students
(
stdID int not null unique,
stdName varchar(25) not null,
sex varchar(10) not null,
percentage float not null,
class int not null,
section varchar(1) not null,
stream varchar(10) not null,
DOB date not null
);
describe students;
insert into students value(1001,'Surekha Joshi','Female',82,12,'A','Science','1998-8-3');
insert into students value(1002,'Maahi Agarwal','Female',56,11,'C','Commerce','2008-11-23');
insert into students value(1003,'Sanam Verma','Male',59,11,'C','Commerce','2006-6-29');
insert into students value(1004,'Ronit Kumar','Male',63,11,'C','Commerce','1997-5-11');
insert into students value(1005,'Dipesh Pulkit','Male',78,11,'B','Science','2003-9-14');
insert into students value(1006,'Jahanvi Puri','Female',60,11,'B','Commerce','2008-11-7');
insert into students value(1007,'Sanam Kumar','Male',23,12,'F','Commerce','1998-3-8');
insert into students value(1008,'Sahil Saras','Male',56,11,'C','Commerce','2008-7-11');
insert into students value(1009,'Akshra Agrarwal','Female',72,12,'B','Commerce','1996-1-10');
insert into students value(1010,'Stuti Mishra','Female',39,11,'F','Science','2008-11-23');
insert into students value(1011,'Harsh Agarwal','Male',42,11,'C','Science','1998-8-3');
insert into students value(1012,'Nikunj Agarwal','Male',49,12,'C','Commerce','1998-6-28');
insert into students value(1013,'Akriti Saxena','Female',89,12,'A','Science','2008-11-23');
insert into students value(1014,'Tani Rastogi ','Female',82,12,'A','Science','2008-11-23');

-- Q 1> To display all the records form STUDENT table.
select * from students;

-- Q 2> To display any name and date of birth from the table STUDENT. 
select DOB,stdName from students;

-- Q 3> To display all students record where percentage is greater of equal to 80 FROM student table. 
select * from students where percentage>=80;

-- Q 4> . To display student name, stream and percentage where percentage of student is more than 80.
select stdName,stream,percentage from students where percentage>80;

-- Q 5> To display all records of science students whose percentage is more than 75 form student table.
select * from students where percentage>75;