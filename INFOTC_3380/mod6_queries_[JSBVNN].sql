/*** USER INFORMATION 
Student: Josh Block
Date: 2/22/22
Version: 1.0.3 ***/

--RECALL tables
SHOW tables;
--RECALL Tables_in_classicmodels
DESCRIBE <table in classicmodels>;

-- Calculate the number of orders for each product that has been ordered. Display the product name and number of orders in a column called “Number of Orders”. Display the results in descending order based on “Number of Orders”. Note: You are calculating the number of orders and not quantity ordered. For example, if Alice orders 3 pizzas today and 5 pizzas next week then pizza orders equals 2 and the quantity of pizzas ordered equals 8. 109 rows returned.
SELECT p.productName, COUNT(c.orderNumber) AS "Number of Orders"
FROM products p, orderdetails c
WHERE p.productCode = c.productCode
GROUP BY productName
ORDER BY COUNT(c.orderNumber) DESC;
-- Calculate the total number of each product that has been ordered. Display the product name and quantity ordered in a column called “Quantity Ordered”. Display the results in descending order based on Quantity Ordered. 109 rows returned.
SELECT p.productName, COUNT(d.quantityOrdered) AS "Quantity Ordered"
FROM products p, orderdetails d
WHERE p.productCode = d.productCode
GROUP BY p.productName
ORDER BY COUNT(d.quantityOrdered) DESC;
-- Calculate the total dollar value of the top 25 products that has been ordered in the database. Display the product name and the dollar value in a column called “Total Value”.
SELECT p.productName, SUM(d.quantityOrdered * d.priceEach) AS "Total Value"
FROM products p, orderdetails d
WHERE p.productCode = d.productCode
GROUP BY p.productName
ORDER BY SUM(quantityOrdered * priceEach) DESC
LIMIT 25;
-- Calculate the number of orders each customer has placed and display the top 25 in descending order based on orders placed. Display the customer name and the orders placed in a columns called “Orders Placed”.
SELECT c.customerName, COUNT(o.orderNumber) AS "Orders Placed"
FROM customers c, orders o
WHERE c.customerNumber = o.customerNumber
GROUP BY c.customerName
ORDER BY COUNT(o.orderNumber) DESC
LIMIT 25;
-- Calculate the total payments made each year. Display the year and total payments in a column called “Total Payments”. Note: you will have to use the YEAR() function to get the year portion of the payment date.
SELECT YEAR(paymentDate), SUM(amount) AS "Total Payments" --could also refer to how many payments people made
FROM payments
GROUP BY YEAR(paymentDate)
ORDER BY SUM(amount); 
-- Calculate the total payments made each month in 2004. Display the month and total payments in a column called “Total Payments”. Order the results by month in ascending order. Note: you will have to use the MONTH() and YEAR() functions.
SELECT MONTH(paymentDate),SUM(amount) AS "Total Payments"
FROM payments
WHERE YEAR(paymentDate) = 2004
GROUP BY MONTH(paymentDate)
ORDER BY MONTH(paymentDate) ASC;
-- Calculate the total payments made each day in December of 2004. Display the day in a column named “Day” and total payments in a column called “Total Payments”. Order the results by day in ascending order. Note: you will have to use the MONTH(), DAY(), and YEAR() functions.
SELECT DAY(paymentDate),SUM(amount) AS "Total Payments"
FROM payments
WHERE YEAR(paymentDate) = 2004 && MONTH(paymentDate) = 12
GROUP BY DAY(paymentDate)
ORDER BY DAY(paymentDate) ASC;
-- Calculate the total payments made by each customer in the database who has made a payment. Display the customer name and the total payments in a column named “Total Payments”. Order the results by total payments.
SELECT c.customerName, COUNT(p.amount) AS "Total Payments"
FROM payments p, customers c
WHERE c.customerNumber = p.customerNumber
GROUP BY c.customerName
ORDER BY COUNT(p.amount);
-- Calculate and display the number of customers in each state. Display the state name and and number of customers in each state in a column called “Number of Customers in State”. Sort the results by the Number of Customers in State.
SELECT c.state, COUNT(c.customerNumber) AS "Number of Customers in State"
FROM customers c
GROUP BY c.state
ORDER BY COUNT(c.customerNumber);
-- Which employees manage the most people? Develop a query to calculate the number of people each employees manages. Display the employee number and number of employees employees they manage in a column called “Number of Reports”. Hint: we know an employee manages another employee if their employee number appears in the reportsTo column in the employee table.
SELECT e.reportsTo, COUNT(e.employeeNumber) AS "Number of Reports"
FROM employees e
GROUP BY e.reportsTo
ORDER BY COUNT(e.employeeNumber) DESC;
-- Write a query to calculate the number of product lines in the database. Display the result in a column called “Number of Lines”.
SELECT COUNT(p.productLine) AS "Number of Lines"
FROM productlines p;
-- Calculate the dollar value of each product in inventory. You can calculate this by multiplying the quantity in stock by the buy price. Display the product name, quantity in stock, buy price, and in its dollar value in a column called “Dollar Value”. Sort the results in descending order based on dollar value.
SELECT p.productName, p.quantityInStock, p.buyPrice, SUM(p.quantityInStock * p.buyPrice) AS "Dollar Value"
FROM products p
GROUP BY p.productName, p.quantityInStock, p.buyPrice
ORDER BY SUM(p.quantityInStock * p.buyPrice) DESC;



https://stackoverflow.com/questions/9246410/mysql-query-find-customer-w-orders-but-without-payment
https://teaching.csse.uwa.edu.au/units/CITS1402/lectures/db-classicmodels.pdf
https://www.mysqltutorial.org/mysql-sample-database.aspx
https://github.com/ronaldbradford/schema/blob/master/classicmodels.sql
https://arvidyuen7.github.io/classicmodels/classicmodels_rmd.html
https://quizlet.com/163072730/classicmodels-sql-exercises-flash-cards/ 