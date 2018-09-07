CREATE DATABASE lab1;

CREATE TABLE users(
  id SERIAL,
  firstname varchar(50),
  lastname varchar(50)
);

ALTER TABLE users
    ADD COLUMN isadmin varchar;

ALTER TABLE users
    ALTER COLUMN isadmin SET DATA TYPE BOOLEAN USING isadmin::boolean;

ALTER TABLE users
    ALTER COLUMN isadmin set default false;

ALTER TABLE users
    ADD PRIMARY KEY (id);

CREATE TABLE tasks(
  id SERIAL,
  name varchar(50),
  user_id int
);

DROP TABLE tasks;

UPDATE pg_database SET datallowconn = 'false' WHERE datname = 'lab1';
SELECT pg_terminate_backend(pg_stat_activity.pid)
FROM lab1.pg_catalog.pg_stat_activity
WHERE pg_stat_activity.datname = 'lab1' AND pid <> pg_backend_pid();

DROP DATABASE lab1;





