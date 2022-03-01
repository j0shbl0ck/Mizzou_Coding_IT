/*** USER INFORMATION 
Student: Josh Block
Date: 2/27/22
Version: 1.0.1 ***/

--RECALL tables
SHOW tables;
--RECALL Tables_in_classicmodels
DESCRIBE <table in employees>;

-- List all of the current employees first name, last name, salary and department name.
SELECT e.first_name, e.last_name, s.salary, d.dept_name
FROM employees e, salaries s, departments d
WHERE e.emp_no = s.emp_no
-- List the first name, last name, and salary of the current employees with the ten (10) highest salaries.
SELECT e.first_name, e.last_name, s.salary
FROM employees e, salaries s,
WHERE e.emp_no = s.emp_no
ORDER BY COUNT(s.salary) ASC
LIMIT 10;
-- What is the total payroll (sum of all current salaries) for the company.
-- Display a list of the unique titles for this company.
-- List the first name, last name, and department name for all current department managers. Remember that a current manager has a to_date value of 9999-01-01.
-- How many employees does each department currently have? List the department name and number of employees in a column named “Number of Employees”.
-- How many males and how many females have been hired by this company in its history?
-- List the titles and the number of current employees that hold that title.


-- Calculate the total payments made by each customer in the database who has made a payment. Display the customer name and the total payments in a column named “Total Payments”. 
SELECT c.customerName, COUNT(p.amount) AS "Total Payments"
FROM payments p, customers c
WHERE c.customerNumber = p.customerNumber
GROUP BY c.customerName
ORDER BY COUNT(p.amount);