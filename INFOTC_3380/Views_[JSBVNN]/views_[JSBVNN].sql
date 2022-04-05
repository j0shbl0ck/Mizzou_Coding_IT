/*** USER INFORMATION 
Student: Josh Block
Date: 4/03/22
Version: 1.0.1 ***/

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
    -- Query the paymentsByMonth view to show the total payments for January 2004.
    SELECT * FROM paymentsByMonth WHERE Month = 1 AND Year = 2004;

   -- Query the paymentsByMonth view to show payments in November 2004

-- Write a query to create a view named "orderTotalsByMonth" to calculate order totals (in dollars) per month. Query the orderTotalsByMonth view to show the order total in August 2004.

-- Write a query to create a view named "salesPerLine" that calculates sales per product line. Query the salesPerLine view to show the total sales for the "Classic Cars" line.

-- Write a query to create a view named "productSalesYear" that calculates sales per product per year. Include the product name, sales total, and year. Query the productSalesYear view to show the sales per year for the "2001 Ferrari Enzo"

-- Write a query to create a view named "orderTotals" that displays the order total for each order. Include order number, customer name, and total. Query the orderTotals view to select the top 15 orders.

-- Write a query to create a view named "salesPerRep" that calculates total sales for each sales rep.

-- Write a query to create a view named "salesPerOffice" that displays sales per office.