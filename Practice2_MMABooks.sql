USE MMABooks

SELECT *FROM Products;
SELECT *FROM Customers;
SELECT *FROM States;
--Answer 1
SELECT Productcode, Description, UnitPrice
FROM Products
WHERE UnitPrice >= 50;

--Answer 2
SELECT Productcode, Description , OnHandQuantity
FROM Products
WHERE OnHandQuantity BETWEEN 2000 AND 3000;

--Answer 3
SELECT Address , State
FROM Customers 
WHERE State IN('NY','CA','Al');


SELECT Customers.Address , StateName
FROM Customers JOIN States ON
Customers.State = States.StateCode
WHERE Customers.State IN('NY','CA','Al');