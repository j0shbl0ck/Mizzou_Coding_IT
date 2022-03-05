/*** USER INFORMATION 
Student: Josh Block
Date: 2/27/22
Version: 1.3.6 ***/

--RECALL tables
SHOW tables;
--RECALL Tables_in_classicmodels
DESCRIBE <table in employees>;

-- List all of the current employees first name, last name, salary and department name.
SELECT e.first_name, e.last_name, s.salary, d.dept_name
FROM employees e, salaries s, departments d
WHERE e.emp_no = s.emp_no
GROUP BY e.first_name, e.last_name, d.dept_name

-- List the first name, last name, and salary of the current employees with the ten (10) highest salaries.
SELECT e.first_name, e.last_name, s.salary
FROM employees e, salaries s
WHERE e.emp_no = s.emp_no
ORDER BY s.salary DESC
LIMIT 10;

-- What is the total payroll (sum of all current salaries) for the company.
SELECT SUM(s.salary) AS "salary"
FROM salaries s;

-- Display a list of the unique titles for this company.
SELECT DISTINCT(t.title)
FROM titles t
ORDER BY t.title DESC;

-- List the first name, last name, and department name for all current department managers. Remember that a current manager has a to_date value of 9999-01-01.
SELECT e.first_name, e.last_name, d.dept_name
FROM employees e, departments d, dept_manager f
WHERE e.emp_no = f.emp_no
GROUP BY e.first_name, e.last_name, d.dept_name;

-- How many employees does each department currently have? List the department name and number of employees in a column named “Number of Employees”.
SELECT d.dept_name, SUM(d.dept_no) AS "Number of Employees"
FROM departments d
GROUP BY d.dept_name
ORDER BY SUM(d.dept_no);

-- How many males and how many females have been hired by this company in its history?
SELECT e.gender, count(e.gender)
FROM employees e
GROUP BY e.gender;
-- THIS IS CORRECT

-- List the titles and the number of current employees that hold that title.
SELECT t.title, COUNT(e.emp_no)
FROM titles t, employees e
WHERE t.emp_no = e.emp_no
GROUP BY t.title
ORDER BY COUNT(e.emp_no);

