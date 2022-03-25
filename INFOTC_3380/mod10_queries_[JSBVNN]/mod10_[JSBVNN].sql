/*** USER INFORMATION 
Student: Josh Block
Date: 3/24/22
Version: 1.0.1 ***/

--RECALL tables
SHOW tables;
--RECALL Tables_in_classicmodels
DESCRIBE <table in classicmodels>;

--Write queries using subqueries for the following questions.

-- Display the customer number, name, and phone number for customers with sales rep Gerard Hernandez, employee number 1370
SELECT customerNumber, customerName, phone
FROM customers
WHERE customerNumber IN (SELECT customerNumber FROM customers WHERE salesRepEmployeeNumber = 1370);

-- Show the state and the number of customers in that state for states with a greater number of customers than Connecticut (CT)
SELECT state, COUNT(state) AS "Num Customers in State"
FROM customers
GROUP BY state
HAVING COUNT(state) > (SELECT COUNT(state) FROM customers WHERE state = "CT")
ORDER by COUNT(state) DESC;

-- Write a query to show the customer number, name, payment date, and payment amount for payments greater than the average payment.
SELECT c.customerNumber, c.customerName, p.paymentDate, p.amount
FROM customers c, payments p
GROUP BY c.customerNumber, c.customerName, p.paymentDate, p.amount
HAVING AVG(p.amount) < p.amount
ORDER BY p.amount DESC;

SELECT c.customerNumber, c.customerName, p.paymentDate, p.amount
FROM customers c, payments p
WHERE c.customerNumber IN (SELECT customerNumber FROM payments WHERE amount > (SELECT AVG(amount) FROM payments));

SELECT c.customerNumber, c.customerName, p.paymentDate, p.amount
FROM payments p, customers c
WHERE p.customerNumber = c.customerNumber
AND p.amount > (SELECT AVG(amount) FROM payments);

-- Create a query to generate a list of managers. Show their employee number, first name, and last name.
SELECT e.employeeNumber, e.firstName, e.lastName
FROM employees e
WHERE e.reportsTo IN (SELECT employeeNumber FROM employees);

-- Which offices have the same number of employees as the London office? Show the city, office code and number of employees.
SELECT o.city, o.officeCode, e.employeeNumber
FROM offices o, employees e
WHERE o.city IN (SELECT o.city FROM offices WHERE o.city = "London")
AND o.officeCode = e.officeCode
GROUP BY o.city, o.officeCode, e.employeeNumber;

-- Which product(s) have a higher quantity ordered than “1940s Ford truck”? Show the product names and quantity ordered.
SELECT p.productName, SUM(p.quantityInStock) AS "Quantity Ordered"
FROM products p
GROUP BY p.productName, p.quantityInStock
HAVING SUM(p.quantityInStock) > (SELECT SUM(quantityInStock) FROM products WHERE productName = "1940s Ford truck")
ORDER BY SUM(p.quantityInStock) DESC;

-- Show the products that have a lower dollar value in orders than the “1957 Corvette Convertible”. Show the product name and total value.
SELECT p.productName, SUM(p.quantityInStock * p.buyPrice) AS "Total Value"
FROM products p
GROUP BY p.productName, p.quantityInStock, p.buyPrice
HAVING SUM(p.quantityInStock * p.buyPrice) < (SELECT SUM(quantityInStock * buyPrice) FROM products WHERE productName = "1957 Corvette Convertible")
ORDER BY SUM(p.quantityInStock * p.buyPrice) ASC;

-- Show the order number, customer number, and order total for orders with a larger order total than order number 10222.


--Write queries using wildcards for the following questions.

-- Show the company name and total payments for companies whose name ends in “Ltd”.
-- How many employees have a three digit extension? A three digit extension looks like xXXX.
-- Show the product code, name, vendor, and buy price for products from the 1950s (1950 - 1959). The year appears is in the name.
-- show all office information for offices in the 212 area code. Hint. Look at the phone number.
-- Show first name, last name, employee number and email for the sales managers.
-- Show the name, product code, quantity in stock, and buy price for products with “Chevy” in the name.







