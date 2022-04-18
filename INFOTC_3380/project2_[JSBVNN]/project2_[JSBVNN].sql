/*** USER INFORMATION 
Student: Josh Block
Date: 4/18/22
Version: 1.0.0 ***/

-- Recall all databases
SHOW DATABASES;
-- Use databases
USE <database>;
-- Show tables
SHOW TABLES;
-- Describe table in project2
DESCRIBE <table in project2>;
-- Update table
UPDATE <table in project2> SET <column> = <value> WHERE <column> = <value>;
-- Delete table
DELETE FROM <table in module2> WHERE <column> = <value>;
-- Insert into table
INSERT INTO <table in module2> (<columns>) VALUES (<values>);
-- Select from table
SELECT <columns> FROM <table in module2> WHERE <column> = <value>;



-- Write a query to create a view named “EmployeesPerRegion” that shows the region_name and the number of employees from that region in a column called “Number of Employees”.
    -- Query the EmployeesPerRegion to show the number of employees from the Americas.

-- Write a query to create a view named “managers” to display all the managers. Include the manager’s name (first, last), phone number, email, job title, and department name.
    -- Query the managers view to show the number of managers in each department.

-- Write a query to create a view named “DependentsByDepartment” to get a count of how many dependents there are in each department.
    -- Query the DependentsByDepartment view to show the department with the largest number of dependents. This should show the department name and the number of dependents.

-- Write a query to create a view named “HiresByYear” that calculates the number of employees hired each year. Remember the SQL $year function.
    -- Query the HiresByYear view to show the number of hires in 1997.

-- Write a query to create a view named “SalaryByDepartment” to calculate total salaries for each department.
    -- Query the SalaryByDepartment view to show the total salary for the Finance department.

-- Write a query to create a view named “SalaryByJobTitle” to calculate total salaries for each job title.
    -- Query the SalaryByJobTitle view to show the job title and total salary for the title with the highest total salary.

-- Write a query to create a view named “EmployeeDependents” that calculates the number of dependents each employees has. This query should show employees even if they have 0 dependents. Display the employee name (first, last), email, phone number, and number of dependents. Hint: left or right join.
    -- Query the EmployeeDependents view to show employees with no children". Show employee name (first, last), email, phone number, and number of dependents.
    
-- Write a query to create a view named “CountryLocation” that calculates the number of locations in each country. This query should show countries even if they have 0 locations. Display the country name and number of locations.
    -- Query the CountryLocation view to show countries with no locations". Show country name and number of locations.