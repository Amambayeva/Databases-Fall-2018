CREATE DATABASE lab5;

CREATE TABLE customers(
customer_id integer,
cust_name varchar(255),
city varchar(255),
grade integer,
salesman_id integer);

INSERT INTO customers VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', DEFAULT, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Goeff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

SELECT * FROM customers WHERE grade > 100;

SELECT * FROM customers WHERE grade > 100 AND city = 'New York';

SELECT * FROM customers WHERE grade > 100 OR city = 'New York';

SELECT * FROM customers WHERE city = 'Rome' OR city = 'Paris';

SELECT * FROM customers WHERE cust_name LIKE 'B%';

CREATE TABLE orders(
 	order_id serial PRIMARY KEY,
	customer_id integer,
	description text,
	purch_amt integer
 );

INSERT INTO orders VALUES
(DEFAULT, 3002, 'Paper', 100),
(DEFAULT, 3007, 'Rock', 5),
(DEFAULT, 3008, 'Book', 20);

 SELECT * FROM orders WHERE customer_id IN (SELECT customer_id FROM customers WHERE city = 'New York');

 SELECT * FROM customers WHERE customer_id IN (SELECT customer_id FROM orders
 											  WHERE purch_amt > 10);

 SELECT sum(purch_amt) FROM orders;

 SELECT avg(purch_amt) FROM orders;

SELECT * FROM customers WHERE cust_name IS NOT NULL;

SELECT max(purch_amt) FROM orders;