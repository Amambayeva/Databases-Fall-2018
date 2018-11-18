CREATE DATABASE lab9;
--Functions declarations
--1
CREATE FUNCTION sum_of_two_numbers(m integer, n integer)
RETURNS integer AS $$
        BEGIN
                RETURN m + n;
        END;
$$ LANGUAGE plpgsql;
--2
CREATE FUNCTION FUN_TO_TEST () RETURNS double precision
AS $TEST$
BEGIN
   RETURN 4.295806896E-29;
END;
$TEST$  LANGUAGE PLPGSQL;
--3
CREATE FUNCTION FUN_TO_TEST ()
RETURNS double precision AS '
BEGIN
RETURN 4.295806896E-29;
END;
'
LANGUAGE PLPGSQL;
--4
CREATE FUNCTION TODAY_IS () RETURNS CHAR(22) AS  '
BEGIN
  RETURN ''Today''''is '' || CAST(CURRENT_DATE AS CHAR(10));
END;
'
LANGUAGE PLPGSQL;
--5
--ALIAS
--The ALIAS is used to assign a different name for variables with predetermined names,
-- such as NEW or OLD within a trigger procedure.
CREATE FUNCTION FUN_TO_TEST(dt DATE, ing INTEGER)
RETURNS DATE AS $test$
DECLARE ss     ALIAS FOR dt;
        ff     ALIAS FOR ing;
BEGIN
   RETURN ss + ff * INTERVAL '2 DAY';
END;
$test$
LANGUAGE PLPGSQL;
--6
--The above function returns the date passed as the number of days added to ing desired argument.
--In the following example you can use the $ and the positron of the variable passed in the argument
--  instead of the new variable name with an alias.
CREATE FUNCTION FUN_TO_TEST(dt DATE, ing INTEGER)
RETURNS DATE AS $test$
DECLARE ss     ALIAS FOR $1;
        ff     ALIAS FOR $2;
BEGIN
   RETURN ss + ff * INTERVAL '2 DAY';
END;
$test$
LANGUAGE PLPGSQL;
--7
--Variable Types
--%TYPE is used to get the data type of a variable or table column.
-- In the following example roll_no is a column in student table.
-- To declare a variable with the same data type as student.roll_no you should write:
CREATE FUNCTION get_employee(text) RETURNS text AS '
  DECLARE
     frst_name ALIAS FOR $1;
     lst_name employees.last_name%TYPE;
  BEGIN
     SELECT INTO lst_name last_name FROM employees
	 WHERE first_name = frst_name;
     return frst_name || '' '' || lst_name;
  END;
' LANGUAGE 'plpgsql';
--8
CREATE FUNCTION get_employee (integer) RETURNS text AS '
  DECLARE
    emp_id ALIAS FOR $1;
    found_employee employees%ROWTYPE;
  BEGIN
   SELECT INTO found_employee * FROM employees WHERE employee_id = emp_id;
    RETURN found_employee.first_name || '' '' || found_employee.last_name;
  END;
' LANGUAGE 'plpgsql';
--9
CREATE FUNCTION get_employee (integer) RETURNS text AS '
  DECLARE
    emp_id ALIAS FOR $1;
    found_employee RECORD;
  BEGIN
   SELECT INTO found_employee * FROM employees WHERE employee_id = emp_id;
    RETURN found_employee.first_name || '' '' || found_employee.last_name;
  END;
' LANGUAGE 'plpgsql';
--10
CREATE FUNCTION not_equal(maxa decimal, minb decimal)
RETURNS boolean AS $$
BEGIN
    RETURN maxa <> minb;
END;
$$ LANGUAGE plpgsql;
--11
CREATE FUNCTION not_equal(fstnm text, lstnm text)
RETURNS boolean AS $$
BEGIN
    RETURN fstnm <> lstnm;
END;
$$ LANGUAGE plpgsql;
--12
CREATE FUNCTION not_equal(fst_number integer, snd_number integer)
RETURNS boolean AS $$
DECLARE
    fstnum integer := fst_number;
    sndname integer:= snd_number;
BEGIN
    RETURN fstnum<> sndname;
END;
$$ LANGUAGE plpgsql;
--13
CREATE FUNCTION get_employee(fstnm text, lstnm text)
RETURNS boolean AS $$
BEGIN
    RETURN fstnm < lstnm COLLATE "C";
END;
$$ LANGUAGE plpgsql;

