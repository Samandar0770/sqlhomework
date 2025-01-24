create table salesman (id int, name varchar (30), city varchar (30), comission decimal (10,2))


insert into salesman values (5001,trim('James Hoog'),trim('New York'),0.15),
                            (5002,trim('Nail Knite'),trim('Paris   '),0.13),
                            (5005,trim('Pit Alex  '),trim('London  '),0.11),
                            (5006,trim('Mc Lyon   '),trim('Paris   '),0.14),
                            (5003,trim('Lauson Hen'),trim('San Jose'),0.12),
                            (5007,trim('Paul Adam '),trim('Rome    '),0.13);


select * from salesman



create table orders (ord_no int, purch_amt decimal (10,2), ord_date date, customer_id int, salesman_id int)


insert into orders values (70001,'150.5','2012-10-05',3005,5002),
                          (70009,'270.65','2012-09-10',3001,5005),
                          (70002,'65.26','2012-10-05',3002,5001),
                          (70004,'110.5','2012-08-17',3009,5003),
                          (70007,'948.5','2012-09-10',3005,5002),
                          (70005,'2400.6','2012-07-27',3007,5001),
                          (70008,'5760','2012-09-10',3002,5001),
                          (70010,'1983.43','2012-10-10',3004,5006),
                          (70003,'2480.4','2012-10-10',3009,5003),
                          (70012,'250.45','2012-06-27',3008,5002),
                          (70011,'75.29','2012-08-17',3003,5007),
                          (70013,'3045.6','2012-04-25',3002,5001);


select * from orders


create table customer (customer_id int, cust_name varchar (30), city varchar (30), grade int, salesman_id int)


insert into customer values (3002,trim('Nick Rimando'),trim('New York  '),100,5001),
                            (3005,trim('Graham Zusi '),trim('California'),200,5002),
                            (3001,trim('Brad Guzan  '),trim('London    '),100,5005),
                            (3004,trim('Fabian Johns'),trim('Paris     '),300,5006),
                            (3007,trim('Brad Davis  '),trim('New York  '),200,5001),
                            (3009,trim('Geoff Camero'),trim('Berlin    '),100,5003),
                            (3008,trim('Julian Green'),trim('London    '),300,5002),
                            (3003,trim('Jozy Altidor'),trim('Moncow    '),200,5007);


select * from customer 


1.select * from orders
where salesman_id = (select id from salesman where name = 'Paul Adam')


2.select * from orders 
where salesman_id in (select id from salesman where city = 'london')


3.select * from salesman
where id in (select salesman_id from orders where customer_id = 3007) 


4.select * from orders
where purch_amt > (select avg(purch_amt) from orders where ord_date = '2012-10-10')


5.select * from orders 
where salesman_id in (select id from salesman where city = 'new york')


6.select city, comission from salesman
where city = 'paris'


7.select * from customer 
where customer_id in (select id - 2001 from salesman where name = 'mc lyon')


8.select grade, count(customer_id) as shv from customer 
group by grade 
having grade > (select avg(grade) from customer where city = 'new york')


9.select * from orders
where salesman_id in (select id from salesman where comission = (select max(comission) from salesman))


10.select * from customer 
where salesman_id in (select salesman_id from orders where ord_date = '2012-08-17')


11.select id, name from salesman
where id in (select salesman_id from customer where 1 < (select count(*) from customer where salesman.id = customer.salesman_id))


select id, name from salesman
where 1 < (select count(*) from customer where salesman.id = customer.salesman_id)


12.select * from customer
where salesman_id in (select salesman_id from orders where purch_amt >= (select avg(purch_amt) from orders))


14.select ord_date, sum(purch_amt) from orders
group by ord_date having sum(purch_amt) > 1000.00


15.select * from customer 
where exists (select * from customer where city = 'london')


select * from customer
where 1 <= (select count(*) from customer where city = 'london')


16.select * from salesman
where id in (select distinct salesman_id from customer as H
where exists (select * from customer as F where H.salesman_id = F.salesman_id and H.name <> F.name))


17.select * from salesman
where id in (select salesman_id from customer H
where not exists (select * from customer as F where H.salesman_id = F.salesman_id and H.name <> F.name))


18.select * from salesman as G
where exists (select * from customer as H where G.id = H.salesman_id and
1 < (select count(*) from orders as F where G.id = F.salesman_id))


19.select * from salesman 
where city = any (select city from customer)


20.select * from salesman
where city in (select city from customer)


21.select * from salesman as H
where exists (select * from customer as F where H.name < F.name)


22.select * from customer
where grade > any (select grade from customer where city < 'new york')


23.select * from orders 
where purch_amt > any (select purch_amt from orders where ord_date = '2012-09-10')


24.select * from orders
where purch_amt < any (select purch_amt from orders as H, customer as F where H.customer_id = F.id and F.city = 'london')


25.select * from orders 
where purch_amt < (select max(purch_amt) from orders as H, customer as F where H.customer_id = F.id and F.city = 'london')


26.select * from customer 
where grade > all (select grade from customer where city = 'new york')


27.select * from salesman 
where 


28.select * from customer 
where grade <> all (select grade from customer where city = 'london' and grade is null)


29.select * from customer
where grade not in (select grade from customer where city = 'paris')


30.select * from customer
where not grade = any (select grade from customer where city = 'dallas')


create table company_mast0 (com_id int, com_name varchar (60))


insert into company_mast0 values (11,'Samsung'),
                                 (12,'iBall'),
                                 (13,'Epsion'),
                                 (14,'Zebronics'),
                                 (15,'Asus'),
                                 (16,'Frontech');


select * from company_mast0


create table item_mast00 (pro_id int, pro_name varchar (60), pro_price decimal (10,2), pro_com int)


insert into item_mast00 values (101,trim('Mother Board    '),3200.00,15),
                                (102,trim('Key Board       '),450.00,16),
                                (103,trim('ZIP drive       '),250.00,14),
                                (104,trim('Speaker         '),550.00,16),
                                (105,trim('Monitor         '),5000.00,11),
                                (106,trim('DVD drive       '),900.00,12),
                                (107,trim('CD drive        '),800.00,12),
                                (108,trim('Printer         '),2600.00,13),
                                (109,trim('Refill cartridge'),350.00,13),
                                (110,trim('Mouse           '),250.00,12);


select * from item_mast00

create table emp_details0 (emp_idno int, emp_fname varchar (60), emp_lname varchar (60), emp_dept int)

																		   
insert into emp_details0 values (127323,trim('Michale '),trim('Robbin   '),57),
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


select * from emp_details0


31.select avg(pro_price), company_mast0.com_name from item_mast00, company_mast0
where company_mast0.com_id = item_mast00.pro_com
group by company_mast0.com_name


32.select avg(pro_price), company_mast0.com_name from item_mast00, company_mast0
where company_mast0.com_id = item_mast00.pro_com 
group by company_mast0.com_name having avg(pro_price) >= 350


33.select pro_name, pro_price, com_name, max(pro_price) from item_mast00, company_mast0 
where company_mast0.com_id = item_mast00.pro_com
group by pro_name, pro_price, com_name
order by max(pro_price) desc


select pro_name, pro_price, com_name from item_mast00 as H, company_mast0 as F
where F.com_id = H.pro_com and H.pro_price = (select max(pro_price) from item_mast00 as W where F.com_id = W.pro_com)


34.select * from emp_details0
where emp_idno in (select emp_idno from emp_details0 where emp_lname in ('dosio','gabriel'))


select * from emp_details0 
where emp_lname in ('dosio', 'gabriel')


35.select * from emp_details0
where emp_dept in (89,63)


create table emp_department (dpt_code int, dpt_name varchar (60), dpt_allotment decimal (10,2))


insert into emp_department values (57,trim('IT     '),65000),
                                  (63,trim('Finance'),15000),
                                  (47,trim('HR     '),240000),
                                  (27,trim('RD     '),55000),
                                  (89,trim('QC     '),75000);


select * from emp_department


36.select * from emp_department
where dpt_allotment > 50000.00


37.select * from emp_department
where dpt_allotment > (select avg(dpt_allotment) from emp_department)


38.select dpt_name from emp_department
where dpt_code in (select emp_dept from emp_details0 group by emp_dept having count(*) > 2)


39.select emp_fname, emp_lname from emp_details0
where emp_dept in (select dpt_code from emp_department where dpt_allotment = (select min(dpt_allotment) from emp_department
where dpt_allotment > (select min(dpt_allotment) from emp_department)))








