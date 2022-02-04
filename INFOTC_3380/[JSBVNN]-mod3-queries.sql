/*** USER INFORMATION 
Student: Josh Block
Date: 2/03/22
Version: 1.0.7 ***/

--RECALL tables
SHOW tables;
--RECALL Tables_in_module2
DESCRIBE agents;
DESCRIBE customer;
DESCRIBE orders;

--Display the customer name and all of their agent’s information.
SELECT customer.CUST_NAME, agents.* FROM agents, customer WHERE agents.AGENT_CODE = customer.AGENT_CODE;
--For each order, display order number, order date, customer name and agent name.
SELECT orders.ORD_NUM, orders.ORD_DATE, customer.CUST_NAME, agents.AGENT_NAME FROM agents, customer, orders WHERE agents.AGENT_CODE = orders.AGENT_CODE AND customer.AGENT_CODE = orders.AGENT_CODE;
--Display agent name, customer name, order date, and order amount for customers from Canada.
SELECT agents.AGENT_NAME, customer.CUST_NAME, orders.ORD_DATE, orders.ORD_AMOUNT FROM agents, customer, orders WHERE agents.AGENT_CODE = customer.AGENT_CODE AND orders.AGENT_CODE = customer.AGENT_CODE AND customer.CUST_COUNTRY='Canada';
--Display customer name, order number, and order amount for customers in New York city.
SELECT c.CUST_NAME, o.ORD_NUM, o.ORD_AMOUNT FROM customer c, orders o WHERE o.AGENT_CODE = c.AGENT_CODE and c.CUST_CITY='New York';
--Display agent name, customer name, order number and order amount for orders of more than $1,500.
SELECT a.AGENT_NAME, c.CUST_NAME, o.ORD_NUM, o.ORD_AMOUNT FROM customer c, orders o, agents a WHERE a.agent_code = o.AGENT_CODE AND c.agent_code = o.agent_code AND o.ORD_AMOUNT > 1500;
--Display all agent and orders information.
SELECT a.*,o.* FROM agents a, orders o;
--Display customer name, customer code, outstanding amount, and agent name for customers with outstanding amounts greater than or equal to $6,000.
SELECT c.CUST_NAME, c.cust_code, c.outstanding_amt, a.agent_name FROM customer c, agents a WHERE a.agent_code = c.AGENT_CODE AND c.outstanding_amt>=6000;
--Display customer name, order number order amount, and advance amount if order amount is greater than or equal to $2,500 or advance amount is less than $300.
--Display agent name, agent working area, customer name, customer working area for customers and agents who have the same working area.
--Display customer name, agent name, and order number where order amount is less than $1,000 or opening amount is greater than $8000.