/*** USER INFORMATION 
Student: Josh Block
Date: 4/03/22
Version: 1.0.3 ***/

--RECALL tables
SHOW tables;
--RECALL Tables_in_classicmodels
DESCRIBE <table in employees>;
-- Remove view
DROP VIEW <view_name>;

-- This is the example provided. First you create a new view, then execute the CREATE VIEW statement. 
CREATE VIEW customerPayments AS
SELECT c.customerName, p.checkNumber, p.paymentDate, p.amount
FROM customers c
INNER JOIN payments p ON c.customerNumber = p.customerNumber;

SELECT * FROM customerPayments;

-- Write a query to create a view named "SFEmployees" for those salespeople who work in the San Francisco office. Include the employee name (first, last), number, email, and job title. 
CREATE VIEW SFEmployees AS
SELECT e.firstName, e.lastName, e.employeeNumber, e.email, e.jobTitle
FROM employees e
INNER JOIN offices o ON e.officeCode = o.officeCode
WHERE o.city = 'San Francisco';
    -- Query the SFEmployees view to count the number of employees in the San Francisco office.
    SELECT COUNT(*) FROM SFEmployees;

-- Write a query to create a view named "managers" to display all the managers. Include the manager’s name (first, last), number, email,  job title, and office city. 
CREATE VIEW managers AS
SELECT e.firstName, e.lastName, e.employeeNumber, e.email, e.jobTitle, o.city
FROM employees e
INNER JOIN offices o ON e.officeCode = o.officeCode
WHERE e.jobTitle LIKE '%Manager%';
    -- Query the managers view to show the number of managers in each city.
    SELECT city, COUNT(*) FROM managers GROUP BY city;

-- Write a query to create a view named "custByCity" to get a count of how many customers there are in each city.
CREATE VIEW custByCity AS
SELECT c.city, COUNT(c.customerName) AS "CustomerCount"
FROM customers c
GROUP BY c.city;
    -- Query the custByCity view to show the number of customers in Singapore.
    SELECT city, CustomerCount FROM custByCity WHERE city = 'Singapore';

-- Write a query to create a view named "paymentsByMonth" that calculates payments per month. You will have to group by multiple columns for this query: month and year because payments from January 2004 and January 2005 should not be grouped together. Remember the SQL month() and year() functions. 
CREATE VIEW paymentsByMonth AS
SELECT month(p.paymentDate) AS "Month", year(p.paymentDate) AS "Year", SUM(p.amount) AS "TotalPayments"
FROM payments p
GROUP BY month(p.paymentDate), year(p.paymentDate)
ORDER BY month(p.paymentDate), year(p.paymentDate) ASC;
   -- Query the paymentsByMonth view to show payments in November 2004
    SELECT * FROM paymentsByMonth WHERE Month = 11 AND Year = 2004;

-- Write a query to create a view named "orderTotalsByMonth" to calculate order totals (in dollars) per month. 
CREATE VIEW orderTotalsByMonth AS
SELECT month(o.orderDate) AS "Month", year(o.orderDate) AS "Year", SUM(od.quantityOrdered * od.priceEach) AS "TotalOrders"
FROM orders o
INNER JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY month(o.orderDate), year(o.orderDate)
ORDER BY month(o.orderDate), year(o.orderDate) ASC;
    -- Query the orderTotalsByMonth view to show the order total in August 2004.
    SELECT * FROM orderTotalsByMonth WHERE Month = 8 AND Year = 2004;

-- Write a query to create a view named "salesPerLine" that calculates sales per product line. 
CREATE VIEW salesPerLine AS
SELECT l.productLine, SUM(od.quantityOrdered * od.priceEach) AS "TotalSales"
FROM products p
INNER JOIN productlines l ON p.productLine = l.productLine
INNER JOIN orderdetails od ON p.productCode = od.productCode
GROUP BY l.productLine;
    
    -- Query the salesPerLine view to show the total sales for the "Classic Cars" line.
    SELECT * FROM salesPerLine WHERE productLine = 'Classic Cars';

-- Write a query to create a view named "productSalesYear" that calculates sales per product per year. Include the product name, sales total, and year.
CREATE VIEW productSalesYear AS
SELECT p.productName, SUM(od.quantityOrdered * od.priceEach) AS "TotalSales", year(o.orderDate) AS "Year"
FROM products p
INNER JOIN orderdetails od ON p.productCode = od.productCode
INNER JOIN orders o ON od.orderNumber = o.orderNumber
GROUP BY p.productName, year(o.orderDate)
ORDER BY p.productName, year(o.orderDate) ASC; 
    -- Query the productSalesYear view to show the sales per year for the "2001 Ferrari Enzo"
    SELECT * FROM productSalesYear WHERE productName = '2001 Ferrari Enzo' AND Year = 2004;

-- Write a query to create a view named "orderTotals" that displays the order total for each order. Include order number, customer name, and total. 
CREATE VIEW orderTotals AS
SELECT o.orderNumber, c.customerName, SUM(od.quantityOrdered * od.priceEach) AS "Total"
FROM orders o
INNER JOIN customers c ON o.customerNumber = c.customerNumber
INNER JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY o.orderNumber;
    -- Query the orderTotals view to select the top 15 orders.
    SELECT * FROM orderTotals ORDER BY Total DESC LIMIT 15;

-- Write a query to create a view named "salesPerRep" that calculates total sales for each sales rep.
CREATE VIEW salesPerRep AS
SELECT e.firstName, e.lastName, SUM(od.quantityOrdered * od.priceEach) AS "TotalSales"
FROM employees e
INNER JOIN customers c ON c.salesRepEmployeeNumber = e.employeeNumber
INNER JOIN orders o ON o.customerNumber = c.customerNumber
INNER JOIN orderdetails od ON o.orderNumber = od.orderNumber
GROUP BY e.firstName, e.lastName
ORDER BY SUM(od.quantityOrdered * od.priceEach) ASC;
    -- Query the salesPerRep view to show the total sales for the sales rep with the first name "Andy".
    SELECT * FROM salesPerRep WHERE firstName = 'Andy';

-- Write a query to create a view named "salesPerOffice" that displays sales per office.
CREATE VIEW salesPerOffice AS
SELECT o.city, SUM(od.quantityOrdered * od.priceEach) AS "TotalSales"
FROM offices o
INNER JOIN employees e ON e.officeCode = o.officeCode
INNER JOIN customers c ON c.salesRepEmployeeNumber = e.employeeNumber
INNER JOIN orders oe ON oe.customerNumber = c.customerNumber
INNER JOIN orderdetails od ON oe.orderNumber = od.orderNumber
GROUP BY o.city
ORDER BY SUM(od.quantityOrdered * od.priceEach) ASC;
    -- Query the salesPerOffice view to show the total sales for the office in Singapore.
    SELECT * FROM salesPerOffice WHERE city = 'Tokyo';