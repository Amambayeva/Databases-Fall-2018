CREATE DATABASE lab_10;


CREATE TABLE Sells(
  shop text,
  producct text,
  price int
);

BEGIN TRANSACTION;
INSERT INTO Sells VALUES ('Joe"s shop', 'Coke', 2.50);
INSERT INTO Sells VALUES ('Joe"s shop', 'Pepsi', 3.00);
COMMIT;

BEGIN TRANSACTION;
SELECT MAX(price) FROM Sells WHERE shop = 'Joe"s shop';
SELECT MIN(price) FROM Sells WHERE shop = 'Joe"s shop';
commit;

BEGIN TRANSACTION;
DELETE FROM Sells WHERE shop = 'Joe"s shop';
INSERT INTO Sells VALUES('Joe"s shop', 'Fanta', 3.50);
COMMIT;



