create database class01_f14


use class01_f14
create table customer (id int, name varchar(90), city varchar(90), grade int, salesman_id int)


insert into customer values (3002,'Nick Rimando','New York',100,5001),
                            (3007,'Brad Davis','New York',200,5001),
                            (3005,'Graham Zusi','California',200,5002),
                            (3008,'Julian Green','London',300,5002),
                            (3004,'Fabian Johnson','Paris',300,5006),
                            (3009,'Geoff Cameron','Berlin',100,5003),
                            (3003,'Jozy Altidor','Moscow',200,5007),
                            (3001,'Brad Guzan','London',200,5005);

select * from customer


select id,name,city,grade,salesman_id from customer


where grade > 100


select id,name,city,grade,salesman_id from customer


where (city = 'new york' and grade > 100)


select id,name,city,grade,salesman_id from customer


where (city = 'new york' or grade > 100)


select id,name,city,grade,salesman_id from customer


where (city = 'new york' or not grade > 100)

select id,name,city,grade,salesman_id from customer


where (city > 'new york' or not grade > 100)


-------------------------------------


create table orders6 (ord_no int, purch_amt decimal (6,2), ord_date varchar(90), customer_id int, salesman_id int)


insert into orders6 values (70001,150.5  ,'2012-10-05',3005,5002),
                           (70009,270.65 ,'2012-09-10',3001,5005),
                           (70002,65.26  ,'2012-10-05',3002,5001),
                           (70004,110.5  ,'2012-08-17',3009,5003),
                           (70007,948.5  ,'2012-09-10',3005,5002),
                           (70005,2400.6 ,'2012-07-27',3007,5001),
                           (70008,5760   ,'2012-09-10',3002,5001),
                           (70010,1983.43,'2012-10-10',3004,5006),
                           (70003,2480.4 ,'2012-10-10',3009,5003),
                           (70012,250.45 ,'2012-06-27',3008,5002),
                           (70011,75.29  ,'2012-08-17',3003,5007),
                           (70013,3045.6 ,'2012-04-25',3002,5001);


select * from orders6


select ord_no,purch_amt,ord_date,customer_id,salesman_id from orders6


where (ord_date = '2012-09-10') and (salesman_id > 5005 or purch_amt > 1000)


select ord_no,purch_amt,ord_date,customer_id,salesman_id from orders6


where (purch_amt < 200 or ord_date >= '2012-02-10') and (customer_id < 3009)


select ord_no,purch_amt,ord_date,customer_id,salesman_id from orders6


where (ord_date = '2012-08-17' or customer_id > 3005) and (purch_amt < 1000)


--------------------------------



create table salesman (id int, name varchar (90), city varchar (90), comission decimal (6,2))


insert into salesman values (5001,trim('James Hoog'),trim('New York'),0.15),
                            (5002,trim('Nail Knite'),trim('Paris   '),0.13),
                            (5005,trim('Pit Alex  '),trim('London  '),0.11),
                            (5006,trim('Mc Lyon   '),trim('Paris   '),0.14),
                            (5007,trim('Paul Adam '),trim('Rome    '),0.13),
                            (5003,trim('Lauson Hen'),trim('San Jose'),0.12);


select * from salesman


select id,name,city,comission from salesman


where comission between 0.10 and 0.12


-----------------------------------------------------------------


create table emp_details (emp_idno int, emp_fname varchar (90), emp_lname varchar (90), emp_dept int)


insert into emp_details values (127323,trim('Michale '),trim('Robbin   '),57),
                               (526689,trim('Carlos  '),trim('Snares   '),63),
                               (843795,trim('Enric   '),trim('Dosio    '),57),
                               (328717,trim('Jhon    '),trim('Snares   '),63),
                               (444527,trim('Joseph  '),trim('Dosni    '),47),
                               (659831,trim('Zanifer '),trim('Emily    '),47),
                               (847674,trim('Kuleswar'),trim('Sitaraman'),57),
                               (748681,trim('Henrey  '),trim('Gabriel  '),47),
                               (555935,trim('Alex    '),trim('Manuel   '),57),
                               (539569,trim('George  '),trim('Mardy    '),27),
                               (733843,trim('Mario   '),trim('Saule    '),63),
                               (631548,trim('Alan    '),trim('Snappy   '),27),
                               (839139,trim('Maria   '),trim('Foster   '),57);


select * from emp_details


select emp_idno,emp_fname,emp_lname,emp_dept from emp_details


where emp_lname = 'dosni' or emp_lname = 'mardy'


select emp_idno,emp_fname,emp_lname,emp_dept from emp_details


where emp_dept = 47 or emp_dept = 63









