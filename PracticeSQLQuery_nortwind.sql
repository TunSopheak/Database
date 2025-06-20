USE Northwind
--1. Display all data in Employees table.
SELECT * FROM dbo.Employees
GO

--2. Show all firstName and lastname of employees​​ in Employees table.
SELECT FirstName, LastName FROM dbo.Employees
GO

--3. Combination all both the last and firstname of employees in one column but No column name.
SELECT FirstName+', '+LastName 
FROM dbo.Employees
GO

--4. Combination both last and firstname by naming it to 'FullName' using AS keyword.
SELECT FirstName+', '+LastName AS FullName 
FROM dbo.Employees
GO

--5. Combine both the last name and first name, naming the result Full Name. Include a space within the alias and surround the alias with square brackets: [Full Name].
SELECT FirstName+', '+LastName AS [Full Name]
FROM dbo.Employees
GO

--6. Combine both the last name and first name, naming a column (FullName) just by using the name separated from the column list by a space.
SELECT FirstName+', '+LastName FullName
FROM dbo.Employees
GO

--7. Combine both the first name and last name, using an equal sign to define a column alias named FullName.
SELECT FullName = FirstName+', '+LastName
FROM dbo.Employees
GO

--8. Show all titles in the Employees table.
SELECT Title FROM dbo.Employees
GO

--9. Show all distinct (unique) titles from the Employees table (if two titles have the same name, it show only one).
SELECT DISTINCT Title FROM dbo.Employees
GO

--10. Using the WHERE clause to retrieve only customers from Paris by showing CompanyName and City .
SELECT CompanyName, City
FROM dbo.Customers
WHERE City = 'Paris'
GO

--11. Selecting companies whose names start with 'S' and have 1 or more character of no character follow after 'S'. 
SELECT CompanyName
FROM dbo.Customers
WHERE CompanyName LIKE 'S%'
GO

--12. Display companies whose names end with 's'.
SELECT CompanyName
FROM dbo.Customers
WHERE CompanyName LIKE '%S'
GO

--13. Display companies who have an 'S' anywhere in their names.
SELECT CompanyName
FROM dbo.Customers
WHERE CompanyName LIKE '%S%'
GO

--14. Using single-character pattern matching: show CustomerID that has 5 characters by starting with 'B' and end with 'P', and only 3 characters between 'B' and 'P'.
SELECT CustomerID
FROM dbo.Customers
WHERE CustomerID LIKE 'B___P'
GO

--15. Return any CustomerID values that begin with “FRAN” and end with either “R” or “K”.
SELECT CustomerID
FROM dbo.Customers
WHERE CustomerID LIKE 'FRAN[RK]'
GO

--16. Using square brackets to specify a consecutive range of characters to match: Show CustomerID values that begin with “FRAN” and end with only one character (from A to S).
SELECT CustomerID
FROM dbo.Customers
WHERE CustomerID LIKE 'FRAN[A-S]'
GO

--17. Return CustomerID values that begin with “FRAN” and end with any character except 'R'.
SELECT CustomerID
FROM dbo.Customers
WHERE CustomerID LIKE 'FRAN[^R]'
GO

--18. Using the BETWEEN operator to filter PostalCode of employees: mean show only PostalCode >=98103 AND <=98999.
SELECT LastName, FirstName, PostalCode
FROM dbo.Employees
WHERE PostalCode BETWEEN '98103' AND '98999'
GO

--19. Using IS NULL to return employees with a null region: employees who miss to fill the region = Region IS NULL.
SELECT LastName, FirstName, Region
FROM dbo.Employees
WHERE Region IS NULL
GO

--20. Display all employees who live in Seattle and whose ZIP code starts with '9'.
SELECT LastName, City, PostalCode
FROM dbo.Employees
WHERE City = 'Seattle' AND PostalCode LIKE '9%'
GO

--21. Shows all of the employees in Seattle in addition to all employees who have a ZIP code starting with '9'.
SELECT LastName, City, PostalCode
FROM dbo.Employees
WHERE City = 'Seattle' OR PostalCode LIKE '9%'
GO

--22. Shows the result set of all employees who doesn’t live in Seattle by using NOT LIKE.
SELECT LastName, City, PostalCode
FROM dbo.Employees
WHERE City NOT LIKE 'Seattle'
GO

--23. Show employees whose last names contain 'S', excluding those from Seattle.
SELECT LastName, FirstName, City
FROM dbo.Employees
WHERE LastName LIKE '%S%'
AND City NOT LIKE 'Seattle'
GO

--24. Show all customers from France or Spain.
SELECT CustomerID, Country
FROM dbo.Customers
WHERE Country = 'France'
OR Country = 'Spain'
GO

--25. Show all customers from France or Spain using the IN operator: Country = 'France' OR Country = 'Spain'.
SELECT CustomerID, Country
FROM dbo.Customers
WHERE Country IN ('France', 'Spain')
GO

--26. Show customers who have not placed any orders using the IN operator.
SELECT CustomerID
FROM dbo.Customers
WHERE CustomerID NOT IN(SELECT CustomerID 
						FROM dbo.Orders)
GO

--27. Display employees sorted by city name in ascending order.
SELECT LastName, City
FROM dbo.Employees
ORDER BY City
GO

--28. Display employees sorted by city name in descending alphabetical order.
SELECT LastName, City
FROM dbo.Employees
ORDER BY City DESC
GO

--29. Display employees' lastname sorted by city name in descending order, and for employees in the same city, sort them by last name in ascending order.
SELECT LastName, City
FROM dbo.Employees
ORDER BY City DESC, LastName ASC
GO

--30. Sort employees by the length of their last names using the LEN function.
SELECT LastName
FROM dbo.Employees
ORDER BY LEN(LastName)
GO

--31. COUNT the number of rows in the Employees table using the asterisk (*).
SELECT COUNT(*)
FROM dbo.Employees
GO

--32. Shows a discrepancy between the number of employees and the number of regions.
SELECT COUNT(*) AS NumEmployees, 
	COUNT(Region) AS NumRegion
FROM dbo.Employees
GO

--33. Show the number of employees located in Seattle.
SELECT COUNT(*) AS NumEmployeeSeattle
FROM dbo.Employees
WHERE City = 'Seattle'
GO

--34. This query causes an error because City is not included in a GROUP BY clause while using COUNT(*).
--To count employees per city, City must be included in GROUP BY.
--Error: Msg 8120, Level 16, State 1, Line 191
--		Column 'dbo.Employees.City' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.
SELECT City, COUNT(*) AS NumEmployees
FROM dbo.Employees
GO

--35. Show each city and the number of employees living there.
SELECT City, COUNT(*) AS NumEmployees
FROM dbo.Employees
GROUP BY City
GO

--36. Shows the cities with the most employees first and puts all cities with the same number of employees in alphabetical order
SELECT City, COUNT(*) AS NumEmployees
FROM dbo.Employees
GROUP BY City
ORDER BY COUNT(*) DESC, City
GO

--37. Show cities with more than one employee, ordered by number of employees descending and city name ascending.
SELECT City, COUNT(*) AS NumEmployees
FROM dbo.Employees
GROUP BY City
HAVING COUNT(*) > 1
ORDER BY NumEmployees DESC, City
GO

--38. Select the top 3 cities with the highest number of employees.
SELECT TOP 3
	City, COUNT(*) AS NumEmployees
FROM dbo.Employees
GROUP BY City
ORDER BY COUNT(*) DESC
GO

--39. Show the top 3 cities with the most employees, including ties.
SELECT TOP 3 WITH TIES
	City, COUNT(*) AS NumEmployees
FROM dbo.Employees
GROUP BY City
ORDER BY COUNT(*) DESC
GO

--40. Show the top 25% of cities by number of employees, including ties
SELECT TOP 25 PERCENT WITH TIES
    City, COUNT(*) AS NumEmployees
FROM dbo.Employees
GROUP BY City
ORDER BY COUNT(*) DESC
GO

--41. Return a Cartesian product: all combinations of products and categories.
SELECT ProductName, CategoryName
FROM dbo.Products, dbo.Categories
GO

--42. Join Products and Categories on CategoryID to match related records.
SELECT ProductName, CategoryName
FROM dbo.Products, dbo.Categories
WHERE Products.CategoryID = Categories.CategoryID
GO

--43. Join Products and Categories using the JOIN syntax on CategoryID.
SELECT dbo.Products.ProductName, dbo.Categories.CategoryName
FROM dbo.Products JOIN dbo.Categories
ON dbo.Products.CategoryID = dbo.Categories.CategoryID
GO

--44. Join Products and Categories using table aliases for cleaner syntax.
SELECT P.ProductName, C.CategoryName
FROM dbo.Products AS P JOIN dbo.Categories AS C
ON P.CategoryID = C.CategoryID
GO

--45. Join Products and Categories using INNER JOIN on CategoryID.
SELECT Products.ProductName, Categories.CategoryName
FROM dbo.Products INNER JOIN dbo.Categories
ON Products.CategoryID = Categories.CategoryID
GO

--46. List products priced over $50 with their categories, sorted alphabetically by product name.
SELECT dbo.Products.ProductName,
dbo.Categories.CategoryName,
dbo.Products.UnitPrice
FROM dbo.Products INNER JOIN dbo.Categories
	ON dbo.Products.CategoryID = dbo.Categories.CategoryID
WHERE UnitPrice > 50
ORDER BY ProductName
GO

--47. Display order details including order ID, formatted order date, company name, and employee last name for orders between 9/1/1996 and 9/10/1996.
SELECT OrderID, CONVERT(varchar(10), OrderDate, 101) AS Date, CompanyName, LastName
FROM dbo.Orders 
INNER JOIN dbo.Customers ON Orders.CustomerID = Customers.CustomerID
INNER JOIN dbo.Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE OrderDate BETWEEN '9/1/1996' AND '9/10/1996'
ORDER BY OrderDate
GO

--48. Show total sales per customer for orders between 9/1/1996 and 9/10/1996.
SELECT CompanyName, SUM([Order Details].UnitPrice * [Order Details].Quantity) AS TotalSold
FROM dbo.Customers
INNER JOIN dbo.Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE Orders.OrderDate BETWEEN '9/1/1996' AND '9/10/1996'
GROUP BY CompanyName
ORDER BY TotalSold DESC
GO

--49. Show each customer's earliest order date using inner join.
SELECT CompanyName, MIN(Orders.OrderDate) AS FirstOrder
FROM dbo.Customers 
INNER JOIN dbo.Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY CompanyName
ORDER BY CompanyName
GO

--50. Show each customer’s earliest order date (or NULL if no orders) using left outer join.
SELECT CompanyName, MIN(Orders.OrderDate) AS FirstOrder
FROM dbo.Customers 
LEFT JOIN dbo.Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY CompanyName
ORDER BY CompanyName
GO

--51. Show customers who have not placed any orders using right outer join.
SELECT CompanyName AS [No Orders] 
FROM dbo.Orders
RIGHT JOIN dbo.Customers ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL
ORDER BY CompanyName 
GO

--52. Show all products and categories, including those without matching entries, using full join.
SELECT ProductName, CategoryName 
FROM dbo.Products
FULL JOIN dbo.Categories ON dbo.Products.CategoryID = dbo.Categories.CategoryID
ORDER BY ProductName
GO

--53. Show total sales for each customer including those with no orders, using left join.
SELECT CompanyName, SUM([Order Details].UnitPrice * [Order Details].Quantity) AS TotalSold
FROM dbo.Customers
LEFT JOIN dbo.Orders ON Customers.CustomerID = Orders.CustomerID
INNER JOIN dbo.[Order Details] ON Orders.OrderID = [Order Details].OrderID
GROUP BY CompanyName
ORDER BY CompanyName
GO

--54. Show total sales for each customer including those with no orders, using right join.
SELECT CompanyName, SUM([Order Details].UnitPrice * [Order Details].Quantity) AS TotalSold
FROM dbo.Orders
INNER JOIN dbo.[Order Details] ON Orders.OrderID = [Order Details].OrderID
RIGHT JOIN dbo.Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY CompanyName
ORDER BY CompanyName
GO

--55. Show total sales for each customer including those with no orders or order details, using left joins.
SELECT CompanyName, SUM([Order Details].UnitPrice * [Order Details].Quantity) AS TotalSold
FROM dbo.Customers
LEFT JOIN dbo.Orders ON Orders.CustomerID = Customers.CustomerID
LEFT JOIN dbo.[Order Details] ON Orders.OrderID = dbo.[Order Details].OrderID
GROUP BY CompanyName
ORDER BY CompanyName
GO

--56. Show employees along with their managers (only those who have managers).
SELECT Employees.FirstName + ' ' + Employees.LastName AS EmployeeName,
       Managers.FirstName + ' ' + Managers.LastName AS ManagerName
FROM dbo.Employees 
INNER JOIN dbo.Employees AS Managers ON Employees.ReportsTo = Managers.EmployeeID
GO

--57. Show all employees including those without managers (e.g., the top boss with null ReportsTo).
SELECT Employees.FirstName + ' ' + Employees.LastName AS EmployeeName,
       Managers.FirstName + ' ' + Managers.LastName AS ManagerName
FROM dbo.Employees
LEFT JOIN dbo.Employees AS Managers ON Employees.ReportsTo = Managers.EmployeeID
GO

--Lab 4: Data Selection Queries
--simple select query

--1. show the column name in the product table
SELECT * FROM dbo.Products
WHERE 1=0
GO

--2. Concatenate ProductName with QuantityPerUnit to show packaging details, also select UnitPrice, and sort the result by ProductName.
SELECT ProductName+' Sold in '+QuantityPerUnit AS Packaging, UnitPrice
FROM dbo.Products
ORDER BY ProductName
GO

--3. Show packaging and price, sorted by UnitPrice from highest to lowest
SELECT ProductName + ' Sold in ' + QuantityPerUnit AS Packaging, UnitPrice
FROM dbo.Products
ORDER BY UnitPrice DESC
GO

--aggregate query
--1. Show total units for products with a unit price greater than 30 and at least 1 order, also sorted by total units descending
SELECT ProductName, UnitsInStock, UnitsOnOrder,
	SUM(UnitsInStock + UnitsOnOrder) AS TotalUnits
FROM dbo.Products
WHERE UnitPrice > 30 AND UnitsOnOrder > 0
GROUP BY ProductName, UnitsInStock, UnitsOnOrder
ORDER BY TotalUnits DESC
GO

--2. The same as above but only display rows where the TotalUnits are greater than 40
SELECT ProductName, UnitsInStock, UnitsOnOrder,
	SUM(UnitsInStock + UnitsOnOrder) AS TotalUnits
FROM dbo.Products
WHERE UnitPrice > 30 AND UnitsOnOrder > 0
GROUP BY ProductName, UnitsInStock, UnitsOnOrder
HAVING SUM(UnitsInStock + UnitsOnOrder) > 40
ORDER BY TotalUnits DESC

--Joining Tables with an Inner Join
--1. show the column name in the Categories table
SELECT * FROM dbo.Categories WHERE 1=0
GO

--2.  insert a new row for the All Diet category into the Categories table
INSERT INTO dbo.Categories(CategoryName, Description)
VALUES ('All Diet', 'Low carb, low protein, all types of dieting items')
GO

--3. Displays only the products that have a matching category and Sorts the result in ascending order by CategoryName.
SELECT Categories.CategoryName, Products.ProductName
FROM dbo.Categories INNER JOIN dbo.Products
	ON Categories.CategoryID = Products.CategoryID
ORDER BY Categories.CategoryName
GO

--4. display all of the categories regardless of whether they have any products associated with them.
SELECT Categories.CategoryName, Products.ProductName
FROM dbo.Categories LEFT JOIN dbo.Products
	ON Categories.CategoryID = Products.CategoryID
ORDER BY Categories.CategoryName
GO

--Aggregate Query with Multiple Inner Joins 
--1. retrieves the total sales amount for each product grouped by its category.
SELECT Categories.CategoryName, Products.ProductName,
	SUM([Order Details].UnitPrice*[Order Details].Quantity)
	AS Total
FROM dbo.Categories INNER JOIN dbo.Products
	ON Categories.CategoryID = Products.CategoryID
INNER JOIN dbo.[Order Details]
	ON Products.ProductID = [Order Details].ProductID
GROUP BY Categories.CategoryName, Products.ProductName
ORDER BY Categories.CategoryName, Products.ProductName
GO

--Aggregate Query with Inner and Outer Joins
--1. Show all categories and products with their total sales amount, 
-- including products with no sales and categories with no products.
SELECT Categories.CategoryName, Products.ProductName,
	SUM([Order Details].UnitPrice*[Order Details].Quantity)
	AS Total
FROM dbo.Categories LEFT JOIN dbo.Products
	ON Categories.CategoryID = Products.CategoryID
LEFT JOIN dbo.[Order Details]
	ON Products.ProductID = [Order Details].ProductID
GROUP BY Categories.CategoryName, Products.ProductName
ORDER BY Categories.CategoryName, Products.ProductName
GO