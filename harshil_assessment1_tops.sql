/* DA - SQL - Introduction and Getting started with sql 
ASSESSMENT 1
*/

create table workers
(
labour_id int not null unique,
first_name varchar(20) not null,
last_name varchar(20) not null,
salary int not null,
joining_date datetime not null,
department varchar(20) not null
);
describe workers;
insert into workers value(1,'Monika','Arora',100000,'2014-2-20 9:00','HR');
insert into workers value(2,'Niharika','Verma',80000,'2014-6-11 9:00','Admin');
insert into workers value(3,'Vishal','Singhal',300000,'2014-2-20 9:00','HR');
insert into workers value(4,'Amitabh','singh',500000,'2014-2-20 9:00','Admin');
insert into workers value(5,'Vivek','Bhati',500000,'2014-6-11 9:00','Admin');
insert into workers value(6,'Vipul','Diwan',200000,'2014-6-11 9:00','Account');
insert into workers value(7,'Satish','Kumar',75000,'2014-1-20 9:00','Account');
insert into workers value(8,'Geetika','Chauhan',90000,'2014-4-11 9:00','Admin');
select * from workers;
/* Q 1> Write an SQL query to print all Worker details from the Worker table
order by FIRST_NAME Ascending 
*/
select * from workers order by first_name asc;
/* two que together in q1 so 
Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME
Ascending and DEPARTMENT Descending
*/
select * from workers order by department desc;
/* Q 2> Write an SQL query to print details for Workers with the first names “Vipul” and “Satish”
from the Worker table. 
*/
SELECT * FROM workers WHERE first_name IN ('Vipul', 'Satish');
/* Q 3>  Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and
contains six alphabets.
*/
select * from workers where first_name like '%_____h';
/*Q 4> Write an SQL query to print details of the Workers whose SALARY lies between 200000 to 400000
*/
select * from workers where salary > 200000 and salary <=400000;
-- Q 5> Write an SQL query to fetch duplicate records having matching data in some fields of a table. 
SELECT *
FROM workers
WHERE (labour_id,first_name,last_name,salary,joining_date,department) IN (
    SELECT labour_id,first_name,last_name,salary,joining_date,department
    FROM workers
    GROUP BY labour_id,first_name,last_name,salary,joining_date,department
    HAVING COUNT(*) 
);

-- Q 6> Write an SQL query to show the top 6 records of a table
 SELECT * FROM workers LIMIT 6;


-- Q 7> Write an SQL query to fetch the departments that have less than five people in them. 

 select department from workers group by department having count(labour_id)< 5;
 
 -- Q 8> Write an SQL query to show all departments along with the number of people in there. 
 
select department,count(*) as number_people from workers group by department;

/* Q 9> Write an SQL query to print the name of employees having the highest salary in each
department. 
*/
SELECT first_name, salary, department
FROM workers e1
WHERE salary = (
    SELECT MAX(salary)
    FROM workers e2
    WHERE e1.department = e2.department
)
ORDER BY department;
