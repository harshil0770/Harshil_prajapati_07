	-- WORKING WITH DATABASE USING SQL
  -- Building the contact management database for MarketCo.
Create schema assignment1;
-- ALL TABLES OF ASSIGNMENT1
-- TABLE1
create table company
(
companyid int primary key,
company_name varchar(45) not null unique,
street varchar(45) not null,
city  varchar(45) not null,
state varchar(2) not null,
zip varchar(10) not null
);
insert into company value(1,'Google','Gift city road','Gandhinagar','GJ',382718);
insert into company value(2,'Jio','Thane-Belapur Road','Navi Mumbai','MH',400701);   
insert into company value(3,'Adani Group','Shantigram, Near Sargasan Circle,','Gandhinagar','GJ',382421);
insert into company value(4,'Microsoft','One Microsoft Way','Redmond','WA',98052);
insert into company value(5,'Apple','1 Infinite Loop',' Cupertino','CA',95014);
select * from company;	

select * from company;
-- TABLE 2
-- 1) Statement to create the Contact table 
Create table contact
(
contact_id int primary key ,
companyid int not null ,
first_name varchar(45) not null,
last_name varchar(45) not null,
street varchar(45) not null,
city varchar(45) not null,
state varchar(2) not null,
zip varchar(45) not null,
ismain boolean,
email varchar(45) not null unique,
phone varchar(12) not null unique,
foreign key contact(companyid ) references company(companyid)
);
insert into contact value(1001, 1, 'Amit', 'Sharma', '123 MG Road', 'Mumbai', 'MH', '400001', TRUE, 'amit.sharma@example.com', '9876543210');
insert into contact value(1002, 2, 'Priya', 'Iyer', '56 Brigade Road', 'Bengaluru', 'KA', '560001', FALSE, 'priya.iyer@example.com', '9812345678');
insert into contact value(1003, 3, 'Rahul', 'Verma', '78 Nehru Street', 'Delhi', 'DL', '110001', TRUE, 'rahul.verma@example.com', '9998887776');
insert into contact value(1004, 4, 'Neha', 'Gupta', '23 Park Avenue', 'Kolkata', 'WB', '700001', FALSE, 'neha.gupta@example.com', '9876076543');
insert into contact value(1005, 5, 'Vikram', 'Reddy', '89 Jubilee Hills', 'Hyderabad', 'TS', '500033', TRUE, 'vikram.reddy@example.com', '9654321987');
select * from contact;

-- TABLE 3
-- Q3) Statement to create the ContactEmployee table 
create table contactemployee
(
contactemployeeid int not null unique,
contact_id int ,
employeeid int primary key ,
contactdate date,
description varchar(100),
foreign key contactemployee(contact_id) references contact(contact_id)
);
insert into contactemployee value(2001, 1001, 3001, '2024-01-15', 'Initial meeting with Google representative.');
insert into contactemployee value(2002, 1002, 3002, '2024-01-20', 'Follow-up discussion with Jio contact.');
insert into contactemployee value(2003, 1003, 3003, '2024-01-25', 'Business proposal presentation at Adani Group.');
insert into contactemployee value(2004, 1004, 3004, '2024-02-01', 'Contract negotiation with Microsoft.');
insert into contactemployee value(2005, 1005, 3005, '2024-02-10', 'Technical discussion with Apple’s team.');
select * from contactemployee;

-- TABLE 4
-- 2) Statement to create the Employee table 
create table employee
(
employeeid int ,
firstname varchar(45) not null,
lastname varchar(45) not null,
salary decimal (10,2),
hiredate date ,
jobtitle varchar(25) not null,
email varchar(45) not null unique,
phone varchar(12) not null unique,
foreign key employee(employeeid ) references contactemployee(employeeid)
);
insert into employee value(3001, 'Rajesh', 'Kumar', 75000.50, '2020-06-15', 'Software Engineer', 'rajesh.kumar@example.com', '9876543210');
insert into employee value(3002, 'Anjali', 'Sharma', 82000.75, '2019-09-20', 'Project Manager', 'anjali.sharma@example.com', '9812345678');
insert into employee value(3003, 'Vikas', 'Verma', 60000.00, '2021-01-10', 'Data Analyst', 'vikas.verma@example.com', '9998887776');
insert into employee value(3004, 'Pooja', 'Gupta', 92000.25, '2018-07-05', 'HR Manager', 'pooja.gupta@example.com', '9876076543');
insert into employee value(3005, 'Amit', 'Reddy', 68000.80, '2022-03-18', 'Network Engineer', 'amit.reddy@example.com', '9654321987');
select * from employee;
describe company;
describe contact;
describe contactemployee;
describe employee;

-- Q 4 In the Employee table, the statement that changes anjali sharma phone number to 215-555-8800 
update employee set phone = '215-555-8800' where employeeid=3002;
-- Q 5) In the Company table, the statement that changes the name of “Adani group.” to “Adani Enterprises Ltd.” 
update company set company_name= 'Adani Enterprises Ltd' where companyid=3;
/* Q 6) In ContactEmployee table, the statement that removes Dianne Connor’s contact
event with Jack Lee (one statement).
HINT: Use the primary key of the ContactEmployee table to specify the correct record to remove.
Q7) Write the SQL SELECT query that displays the names of the employees that
have contacted Toll Brothers (one statement). Run the SQL SELECT query in
MySQL Workbench. Copy the results below as well. 
THAT TOPIC DOESN'T START
*/
/* Q8) What is the significance of “%” and “_” operators in the LIKE statement? 
i) %(percent):- The percent sign represents zero, one, or multiple characters 
ii) _(underscore):- The underscore represent single character.
For example given below:-
*/
select * from contact where first_name like '%m%';
select * from contact where first_name like '%h_';
/* 9) Explain normalization in the context of databases. 
-   Normalization is the process of organizing the data and the attributes of a database.
-   It performed to reduce the data redundancy in a database & ensure that data is stored logical
-   Normalization is systematic approach of decomposing table to eliminate data redundancy and
    undesirable characteristics like insertion, update and delete.
 -  Normalization is multi-step pro data in tubular form & remove data duplicate from relation tables.
 #i)Insertion Anomaly:-
                     An insertion anomaly occur in relation database when some attributes or data item are
                     inserted into database  without existence of other attributes.
#iii)Updation Anomaly:-
					 Updation anomaly occurs when the same data items are repeated with the same values
                     are not linked to each other.
#iiii)Deletion Anomalies:- 
					 Deletion anomalies when deleting one part of the data deletes the other 
                     neccesary information from the data base. 
# Functional Dependancy:-
                    Its is the relationship that exist between & two set of attributes of a relational table .
                    Where one set of attributes can determine the value of other set of attributes 
                    denoted by x > y
                    x is determinated and y is dependent 
# Type of Normalization
i)1NF ii)2NF iii)3NF iv)BCNF
i)1NF(First Normal Form):- 
					  In 1NF relation each table cell should contain a single value. Each record looks like unique.
ii)2NF(Second Normal Form):-
                      In 2NF relation must be in 1NF. In the second normal form, all non-key attributes are 
                      fully functionally dependant on the primary key.
iii)3NF(Third Normal Form):-                      
                      The relation in 3NF if it is in 2NF and no transition dependancy exist. Non-Prime attribute
                      is dependant on the primary key.
                     - We convert table in 3NF by converting it into two parts and they don't have transitive dependancy
                     -some dependancies cause redundancy in database 
                     -Redundancy removed by BCNF.
iv)BNCF(Boyce-codd Normal Form):-
                        Boyce-codd Normal Form is next part of 3NF.
					   -Table must be in 3NF.
                       -Table in BCNF if every function dependancy x->y, x is the super of the table.
*/                      
/* Q 10) What does a join in MySQL mean?
A SQL Join statement is used to combine data or rows from two or more tables based on a common
field between them.
● Different types of Joins are:
1.INNER JOIN
2.LEFT JOIN
3.RIGHT JOIN
4.FULL JOIN 
*/
/* Q 11) What do you understand about DDL, DCL, and DML in MySQL? 

i)DDL :-Data Defination Lecture
- Create : Create a new table , view table or other object in data base.
- Alter : Modifies an exiting database object, such as a table.
- Drop : deletes an entire table , view of a table or other object in database.

ii)DCL :- Data Control Language 
- Grant : Gives a privilege to  user.
- Revoke : Takes back privileges granted from user.

iii)DML :- Data Manipulation Language      
- Insert :Creates a  record.
- Update : Modifies a records.
- Delete : Delete records. 

/*
12) What is the role of the MySQL JOIN clause in a query, and what are some
common types of joins?
A SQL Join statement is used to combine data or rows from two or more tables based on a common
field between them.
● Different types of Joins are:
1.INNER JOIN :- The most frequently used and important of the joins is the INNER JOIN. They are also referred to as an EQUIJOIN.

● The INNER JOIN creates a new result table by combining
column values of two tables (table1 and table2) based upon the
join-predicate.
● The query compares each row of table1 with each row of
table2 to find all pairs of rows which satisfy the join-predicate.
When the join-predicate is satisfied, column values for each
matched pair of rows of A and B are combined into a result row.
syntax :-
select Table1.column1,Table1.column2,Table2.column1...
from Table1 inner join orders
on Table1.column1=Table2.column1;

2.LEFT JOIN:- The SQL LEFT JOIN returns all rows from the left table, even if there are no matches in the right table.
This means that if the ON clause matches 0 (zero) records in right table, the join will still return a row
in the result, but with NULL in each column from right table.
● This means that a left join returns all the values from the left table, plus matched values from the
right table or NULL in case of no matching join predicate.
● SYNTAX:
○ SELECT table1.column1, table2.column2...
FROM table1 LEFT JOIN table2 ON table1.common_filed
= table2.common_field;

3.RIGHT JOIN:-The SQL RIGHT JOIN returns all rows from the right table, even if there are no matches in the left
table. This means that if the ON clause matches 0 (zero) records in left table, the join will still return a
row in the result, but with NULL in each column from left table.
● This means that a right join returns all the values from the right table, plus matched values from the
left table or NULL in case of no matching join predicate.
● SYNTAX:
○ SELECT table1.column1, table2.column2...
FROM table1 RIGHT JOIN table2 ON
table1.common_filed = table2.common_field; 

4.FULL JOIN :- The SQL FULL JOIN combines the results of both left and right outer joins.
● The joined table will contain all records from both tables, and fill in NULLs for missing matches on
either side.
● SYNTAX:
○ SELECT table1.column1, table2.column2...
FROM table1 FULL JOIN table2 ON table1.common_filed
= table2.common_field; 
*/
