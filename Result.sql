USE MMABooks

--1. Show ProductCode, UnitPrice, and OnHandQuantity for products sold to Sarah Chamberland on 2013-01-13
SELECT p.ProductCode, p.UnitPrice, p.OnHandQuantity
FROM dbo.Products p
JOIN dbo.InvoiceLineItems il ON p.ProductCode = il.ProductCode
JOIN dbo.Invoices i ON il.InvoiceID = i.InvoiceID
JOIN dbo.Customers c ON i.CustomerID = c.CustomerID
WHERE c.Name = 'Chamberland, Sarah'
AND i.InvoiceDate = '2013-01-13'
GO

--2. Show the average sales of each product for the first quarter of 2013
SELECT 
    ProductCode,
    AVG(Quantity * UnitPrice) AS AverageSales_Q1_2013
FROM 
    dbo.Invoices
JOIN 
    dbo.InvoiceLineItems ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
WHERE 
    Invoices.InvoiceDate BETWEEN '2013-01-01' AND '2013-03-31'
GROUP BY 
    InvoiceLineItems.ProductCode
GO

--3. Show the name and address of customers who have made purchases
SELECT c.Name, c.Address
FROM 
    dbo.Customers c
JOIN 
    dbo.Invoices i ON c.CustomerID = i.CustomerID
JOIN 
    dbo.InvoiceLineItems il ON i.InvoiceID = il.InvoiceID
GO