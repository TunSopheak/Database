CREATE DATABASE MMABOOK;
use MMABOOK;
-- Table 1: Products
CREATE TABLE Products (
    ProductCode VARCHAR(50) PRIMARY KEY,
    Description VARCHAR(255) NOT NULL,
    UnitPrice DECIMAL(10, 4) NOT NULL, 
    OnHandQuantity INT NOT NULL        
);

INSERT INTO Products (ProductCode, Description, UnitPrice, OnHandQuantity) VALUES
('A3CS', 'Murach''s ASP.NET 3.5 Web Programming with C# 2008', 54.5000, 4637),
('A3VB', 'Murach''s ASP.NET 3.5 Web Programming with VB 2008', 54.5000, 3974),
('ADC3', 'Murach''s ADO.NET 3.5, LINQ, and EF with C# 2008', 54.5000, 5244),
('ADV3', 'Murach''s ADO.NET 3.5, LINQ, and EF with VB 2008', 54.5000, 4538),
('CRFC', 'Murach''s CICS Desk Reference', 50.0000, 1865),
('CSH8', 'Murach''s C# 2008', 54.5000, 5136),
('DB1R', 'DB2 for the COBOL Programmer, Part 1 (2nd Edition)', 42.0000, 4825),
('DB2R', 'DB2 for the COBOL Programmer, Part 2 (2nd Edition)', 45.0000, 621),
('JSE6', 'Murach''s JAVA SE 6', 52.5000, 3455),
('JSP2', 'Murach''s JAVA Servlets and JSP (2nd Edition)', 52.5000, 4999),
('MCBL', 'Murach''s Structured COBOL', 62.5000, 2386),
('MCCP', 'Murach''s CICS for the COBOL Programmer', 54.0000, 2368),
('MDOM', 'Murach''s JavaScript and DOM Scripting', 54.5000, 6937),
('SQL8', 'Murach''s SQL Server 2008', 52.5000, 2465),
('VB08', 'Murach''s Visual Basic 2008', 54.5000, 2193),
('ZJLR', 'Murach''s OS/390 and z/OS JCL', 62.5000, 677);

SELECT *FROM Products;
DELETE FROM Products;



-- Table 2:
CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,       
    CustomerID INT NOT NULL,
    InvoiceDate DATETIME NOT NULL,  
    ProductTotal DECIMAL(10, 4) NOT NULL,
    SalesTax DECIMAL(10, 4) NOT NULL,
    Shipping DECIMAL(10, 4) NOT NULL,
    InvoiceTotal DECIMAL(10, 4) NOT NULL
);
INSERT INTO Invoices (InvoiceID, CustomerID, InvoiceDate, ProductTotal, SalesTax, Shipping, InvoiceTotal) VALUES
(41, 333, '2010-01-13 12:00:00', 54.5000, 4.0900, 3.7500, 62.3400),
(42, 666, '2010-01-13 12:00:00', 54.5000, 4.0900, 3.7500, 62.3400),
(43, 332, '2010-01-13 12:00:00', 52.5000, 3.9400, 3.7500, 60.1900),
(44, 555, '2010-01-13 12:00:00', 54.5000, 4.0900, 3.7500, 62.3400),
(45, 213, '2010-01-13 12:00:00', 54.5000, 4.0900, 3.7500, 62.3400),
(46, 20, '2010-01-13 12:00:00', 206.5000, 15.4900, 7.5000, 229.4900),
(47, 10, '2010-01-13 12:00:00', 234.5000, 17.5900, 8.7500, 260.8400);

SELECT *FROM Invoices;



-- Table 3: InvoiceLineItems
CREATE TABLE InvoiceLineItems (
    InvoiceID INT,
    ProductCode VARCHAR(50),
    UnitPrice DECIMAL(10,4) NOT NULL,
    Quantity INT NOT NULL,
    ItemTotal DECIMAL(10,4) NOT NULL,
    PRIMARY KEY (InvoiceID, ProductCode),
    FOREIGN KEY (InvoiceID) REFERENCES Invoices(InvoiceID),
    FOREIGN KEY (ProductCode) REFERENCES Products(ProductCode)
);
INSERT INTO InvoiceLineItems (InvoiceID, ProductCode, UnitPrice, Quantity, ItemTotal) VALUES
(41, 'A3VB', 54.5000, 1, 54.5000),
(42, 'A3VB', 54.5000, 1, 54.5000),
(43, 'JSE6', 52.5000, 1, 52.5000),
(44, 'A3VB', 54.5000, 1, 54.5000),
(45, 'A3VB', 54.5000, 1, 54.5000),
(46, 'A3VB', 54.5000, 1, 54.5000),
(46, 'DB2R', 45.0000, 1, 45.0000),
(46, 'SQL8', 52.5000, 1, 52.5000),
(46, 'VB08', 54.5000, 1, 54.5000),
(47, 'A3VB', 54.5000, 1, 54.5000),
(47, 'DB2R', 45.0000, 4, 180.0000);

SELECT *FROM InvoiceLineItems;