CREATE DATABASE lab7;

CREATE TABLE locations(
  location_id SERIAL PRIMARY KEY,
  street_address VARCHAR(25),
  postal_code VARCHAR(12),
  city VARCHAR(30),
  state_province VARCHAR(12)
);

CREATE TABLE departments(
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(50) UNIQUE,
  budget INTEGER,
  location_id INTEGER REFERENCES locations
);

CREATE TABLE employees(
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(20),
  salary INTEGER,
  manager_id INTEGER REFERENCES employees,
  department_id INTEGER REFERENCES departments
);


CREATE TABLE job_grades(
  grade CHAR(1),
  lowest_salary INTEGER,
  highest_salary INTEGER
);
--3
SELECT first_name, employees.department_id, locations.city, locations.state_province from employees
JOIN departments USING(department_id) JOIN locations USING (location_id) WHERE last_name like '%b%';

--4
SELECT departments.department_id, locations.city, locations.state_province from departments
JOIN departments USING(department_id) INNER JOIN locations using(location_id);

--5
SELECT emp1.first_name, emp2.first_name from employees as emp1 FULL OUTER JOIN employees as emp2 USING (manager_id);

--6
SELECT job_grades.grade, avg(salary) from employees INNER JOIN departments USING (department_id) INNER JOIN job_grades ON (grade);

--7
SELECT first_name, last_name from employees JOIN departments USING (department_id) JOIN locations USING (location_id) WHERE city = 'London';