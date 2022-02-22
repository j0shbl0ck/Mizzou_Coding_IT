/*** USER INFORMATION 
Student: Josh Block
Date: 2/22/22
Version: 1.0.0 ***/

--RECALL tables
SHOW tables;
--RECALL Tables_in_module2
DESCRIBE orders;
DESCRIBE customer;
DESCRIBE orders;

-- Calculate the number of orders for each product that has been ordered. Display the product name and number of orders in a column called “Number of Orders”. Display the results in descending order based on “Number of Orders”. Note: You are calculating the number of orders and not quantity ordered. For example, if Alice orders 3 pizzas today and 5 pizzas next week then pizza orders equals 2 and the quantity of pizzas ordered equals 8. 109 rows returned.

-- Calculate the total number of each product that has been ordered. Display the product name and quantity ordered in a column called “Quantity Ordered”. Display the results in descending order based on Quantity Ordered. 109 rows returned.
-- Calculate the total dollar value of the top 25 products that has been ordered in the database. Display the product name and the dollar value in a column called “Total Value”.
-- Calculate the number of orders each customer has placed and display the top 25 in descending order based on orders placed. Display the customer name and the orders placed in a columns called “Orders Placed”.
-- Calculate the total payments made each year. Display the year and total payments in a column called “Total Payments”. Note: you will have to use the YEAR() function to get the year portion of the payment date.
-- Calculate the total payments made each month in 2004. Display the month and total payments in a column called “Total Payments”. Order the results by month in ascending order. Note: you will have to use the MONTH() and YEAR() functions.
-- Calculate the total payments made each day in December of 2004. Display the day in a column named “Day” and total payments in a column called “Total Payments”. Order the results by day in ascending order. Note: you will have to use the MONTH(), DAY(), and YEAR() functions.
-- Calculate the total payments made by each customer in the database who has made a payment. Display the customer name and the total payments in a column named “Total Payments”. Order the results by total payments.
-- Calculate and display the number of customers in each state. Display the state name and and number of customers in each state in a column called “Number of Customers in State”. Sort the results by the Number of Customers in State.
-- Which employees manage the most people? Develop a query to calculate the number of people each employees manages. Display the employee number and number of employees employees they manage in a column called “Number of Reports”. Hint: we know an employee manages another employee if their employee number appears in the reportsTo column in the employee table.
-- Write a query to calculate the number of product lines in the database. Display the result in a column called “Number of Lines”.
-- Calculate the dollar value of each product in inventory. You can calculate this by multiplying the quantity in stock by the buy price. Display the product name, quantity in stock, buy price, and in its dollar value in a column called “Dollar Value”. Sort the results in descending order based on 