/*** USER INFORMATION 
Student: Josh Block
Date: 1/27/22
Version: 1.0.5 ***/

--RECALL tables
SHOW tables;
--RECALL Tables_in_module2
DESCRIBE agents;
DESCRIBE customer;
DESCRIBE orders;

--Display all of the customer data. (25 rows returned)
SELECT * FROM customer;

--Display all of the agent data. (12 rows returned)
SELECT * FROM agents;

--Display customer names and grades. (25 rows returned)
SELECT cust_name, grade FROM customer;

--Display agent code, name, and working area. (12 rows returned)
SELECT agent_code, agent_name, working_area FROM agents;

--Display order number, order amount, and order date. (34 rows returned)
SELECT ord_num, ord_amount, ord_date FROM orders;

--Show all customer code, name, country, and phone number, for all customers from the United States. (4 rows returned)
SELECT cust_code, cust_name, cust_country, phone_no, FROM customer WHERE cust_country='USA';

--Show agent names and phone numbers for agents from Bangalore. (3 rows returned)
SELECT agent_name, phone_no FORM agents WHERE working_area='Bangalore';

--Show orders with advance amounts of $100. (6 rows returned)
SELECT * FROM orders WHERE advance_amount='100';

--Show the names of grade 2 customers. (10 rows returned)
SELECT * FROM customer WHERE grade='2';

--Show all customer information for customers from New York. (3 rows returned)
SELECT * FROM customer WHERE cust_city='New York';

--Show all agent information for agents who work in London with commission rates greater than 0.12. (2 rows returned)
SELECT * FROM agents WHERE working_area='London' AND commission>0.12;

--Show order number, agent code, and customer code for orders with advance amount less than or equal to $500, and order amount greater than or equal to $1500. (9 rows returned)
SELECT ord_num, agent_code, cust_code FROM orders WHERE advance_amount<=500 AND ord_amount>=1500;

--Show customer code, customer name, agent code, and outstanding amount for customers with outstanding amounts greater than $6000 and pay amount less tha or equal to $3000. (3 rows returned)
SELECT cust_code, cust_name, agent_code, outstanding_amt FROM customer WHERE oustanding_amt>6000 AND payment_amt<=3000;

--Show order numbers for order amounts less than $1000. (8 rows returned)
SELECT ord_num FROM orders WHERE ord_amount<1000;

--Show customer names from India with outstanding amounts less than $10,000. (5 rows returned)
SELECT cust_name FROM customer WHERE cust_country='India' AND outstanding_amt<10000;