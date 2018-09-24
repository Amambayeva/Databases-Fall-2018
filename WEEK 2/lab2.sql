CREATE DATABASE lab2;

CREATE TABLE countries(
  country_id SERIAL PRIMARY KEY,
  country_name varchar(50),
  region_id int,
  population int
);

INSERT INTO countries VALUES
                             (1,'England', 44, 66573504);

INSERT INTO countries (country_name, country_id)
                       VALUES ('Israel', 2);
UPDATE countries SET region_id = NULL
WHERE country_id = 2;

INSERT INTO countries (country_id, country_name, region_id, population)
VALUES (4, 'Russia', 51, 144000000),
       (5, 'Japan', 23, 127000000),
       (6, 'Italy', 49, 60000000);

UPDATE countries SET country_name = 'Kazakhstan';

UPDATE countries SET country_name = DEFAULT WHERE country_id = 1;

INSERT INTO countries DEFAULT VALUES;

CREATE TABLE countries_new(
  LIKE countries
);

INSERT INTO countries_new (country_id, country_name, region_id, population)
SELECT country_id, country_name, region_id, population
FROM countries;

UPDATE countries_new SET region_id = 1
WHERE region_id is null;

UPDATE countries_new
SET population = population * 1.1
RETURNING country_name, population AS "New Population";

DELETE FROM countries
WHERE population < 1000000;

DELETE FROM countries_new
WHERE country_id = countries.id;

DELETE FROM countries_new
AS cnew USING countries AS co
WHERE cnew.country_id = co.country_id
RETURNING *;

DELETE FROM countries
RETURNING *;





