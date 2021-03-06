/*** USER INFORMATION 
Student: Josh Block
Date: 4/10/22
Version: 1.0.7 ***/

-- Recall all databases
SHOW DATABASES;
-- Use databases
USE <database>;
-- Show tables
SHOW TABLES;
-- Describe table in module2
DESCRIBE <table in module2>;
-- Update table
UPDATE <table in module2> SET <column> = <value> WHERE <column> = <value>;
-- Delete table
DELETE FROM <table in module2> WHERE <column> = <value>;
-- Insert into table
INSERT INTO <table in module2> (<columns>) VALUES (<values>);
-- Select from table
SELECT <columns> FROM <table in module2> WHERE <column> = <value>;


# --------------------------
Select (Read) Queries 
# --------------------------

-- Write a query to calculate the payments each sales agent is responsible for. Display the agent name and the total payments. [INCOMPLETE]
SELECT AGENT_NAME, SUM(c.PAYMENT_AMT) AS TOTAL_PAYMENTS 
FROM agents a, orders o, customer c 
WHERE a.AGENT_CODE = o.AGENT_CODE AND o.CUST_CODE = c.CUST_CODE
GROUP BY AGENT_NAME;

-- Write a query to calculate payments for each sales agent by country of the sales agent. Display the agent country and total payments. [INCOMPLETE]
SELECT COUNTRY, SUM(c.PAYMENT_AMT) AS TOTAL_PAYMENTS
FROM agents a, orders o, customer c
WHERE a.AGENT_CODE = o.AGENT_CODE AND o.CUST_CODE = c.CUST_CODE
GROUP BY COUNTRY;

-- Write a query to calculate the commission for each order. Display order id, customer name, agent name, and commission amount. [INCOMPLETE]
SELECT ORD_NUM, CUST_NAME, AGENT_NAME, COMMISSION
FROM orders o, customer c, agents a
WHERE o.CUST_CODE = c.CUST_CODE AND o.AGENT_CODE = a.AGENT_CODE
GROUP BY ORD_NUM;


# --------------------------
Update Queries
# --------------------------

-- In the customers table, for customers from New York update the CUST_CITY value to change it from “New York” to “NY”. [COMPLETE]
UPDATE customer
SET CUST_CITY = 'NY'
WHERE CUST_CITY = 'New York';
    
    -- Write an query to select all customers from New York City. [COMPLETE]
    SELECT * 
    FROM customer 
    WHERE CUST_CITY = 'NY';

-- Increase the commission for sales agents from London by 20%. [COMPLETE]
UPDATE agents
SET COMMISSION = (COMMISSION * 0.2) + COMMISSION
WHERE WORKING_AREA = 'London';

    -- Write query to calculate the commission for each order where the agent is from London. Display order id, customer name, agent name, and commission amount. [COMPLETE]
    SELECT o.ORD_NUM, c.CUST_NAME, a.AGENT_NAME, a.COMMISSION
    FROM orders o
    JOIN customer c
    ON o.CUST_CODE = c.CUST_CODE
    JOIN agents a
    ON o.AGENT_CODE = a.AGENT_CODE
    WHERE a.WORKING_AREA = 'London';

-- Update customers with grade 2 to grade 3. [COMPLETE]
UPDATE customer
SET GRADE = 3
WHERE GRADE = 2;
    
    -- Write query that selects all customers names and customer codes with grade 2. [COMPLETE - Run before update to show customers with original grade 2]
    SELECT CUST_NAME, CUST_CODE
    FROM customer
    WHERE GRADE = 2;
    -- Write query that selects all customers names and customer codes with grade 3. [COMPLETE]
    SELECT CUST_NAME, CUST_CODE 
    FROM customer 
    WHERE GRADE = 3;


# --------------------------
Delete Queries
# --------------------------

-- Delete sales agents from Bangalore. [COMPLETE]
DELETE FROM agents
WHERE WORKING_AREA = 'Bangalore';
    
    -- Write a query to select all columns for all sales agents [COMPLETE - Run before delete]
    SELECT *
    FROM agents
    ORDER BY WORKING_AREA;

-- Delete customers whose name begins with the letter “S”. [COMPLETE]
DELETE FROM customer
WHERE CUST_NAME LIKE 'S%';
    
    -- Write a query that selects all columns for all customers. [COMPLETE - Run before delete]
    SELECT *
    FROM customer
    ORDER BY CUST_NAME;