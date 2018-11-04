CREATE database lab8;
CREATE TABLE salesman(
  salesman_id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  city VARCHAR(255),
  commision DOUBLE PRECISION
);
CREATE TABLE customers(
  customer_id INTEGER PRIMARY KEY,
  cust_name VARCHAR(255),
  city VARCHAR(255),
  grade INTEGER,
  salesman_id INTEGER REFERENCES salesman(salesman_id)
);
CREATE TABLE orders(
  ord_no INTEGER PRIMARY KEY,
  pursh_amt DOUBLE PRECISION,
  ord_date date,
  customer_id INTEGER REFERENCES customers(customer_id),
  salesman_id INTEGER REFERENCES salesman(salesman_id)
);
INSERT INTO customers VALUES(2001,'HI','London',100,5001);
INSERT INTO customers VALUES(3001,'d','f',134,5002);
INSERT INTO salesman VALUES(5001,'James Hong','New York',0.15),
                           (5002,'Nail Knite','Paris',0.13);
INSERT INTO orders VALUES (1,120,'2012-10-10',2001,5001);
--3
CREATE ROLE junior_dev LOGIN;
--4
CREATE VIEW avg_total_ord as SELECT s.name, AVG(o.purch_amt), SUM(o.purch_amt)  FROM salesman s JOIN orders o using(salesman_id) GROUP BY s.name;
--5 
CREATE VIEW num_in_city AS SELECT  customers.city, count(orders.ord_no) FROM customers JOIN orders USING(customer_id) GROUP BY(city);
GRANT ALL PRIVILEGES ON view_one TO junior_dev;
--6
CREATE VIEW view_two AS SELECT*FROM customers WHERE grade=(SELECT grade FROM customers  ORDER BY grade  ASC LIMIT 1 OFFSET 0);
GRANT SELECT on view_two TO junior_dev;
--7
CREATE VIEW customer_grade AS SELECT count(*), grade FROM customers GROUP BY grade;
--8
CREATE VIEW view_four AS SELECT salesman_id FROM customers GROUP BY salesman_id having COUNT(ord_no)>1
--9
CREATE ROLE intern;
REASSIGN OWNED BY junior_dev TO intern;
