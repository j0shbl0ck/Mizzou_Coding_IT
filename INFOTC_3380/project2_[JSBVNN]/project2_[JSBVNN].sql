/*** USER INFORMATION 
Student: Josh Block
Date: 4/18/22
Version: 1.0.6 ***/

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


-- Write a query to create a view named “EmployeesPerRegion” that shows the region_name and the number of employees from that region in a column called “Number of Employees”. [Complete]
CREATE VIEW EmployeesPerRegion AS
SELECT regions.region_name, COUNT(employees.employee_id) AS Number_of_Employees
FROM regions
JOIN countries ON regions.region_id = countries.region_id
JOIN locations ON countries.country_id = locations.country_id
JOIN departments ON locations.location_id = departments.location_id
JOIN employees ON departments.department_id = employees.department_id
GROUP BY regions.region_name;

    -- Query the EmployeesPerRegion to show the number of employees from the Americas. [Complete]
    SELECT * FROM EmployeesPerRegion WHERE region_name = 'Americas';

-- Write a query to create a view named “managers” to display all the managers. Include the manager’s name (first, last), phone number, email, job title, and department name. [Complete]
CREATE VIEW managers AS
SELECT employees.first_name, employees.last_name, employees.phone_number, employees.email, jobs.job_title, departments.department_name
FROM employees
JOIN jobs ON employees.job_id = jobs.job_id
JOIN departments ON employees.department_id = departments.department_id
WHERE jobs.job_title LIKE '%Manager%'
GROUP BY employees.employee_id;

    -- Query the managers view to show the number of managers in each department. [Complete]
    SELECT departments.department_name, COUNT(managers.first_name) AS Number_of_Managers 
    FROM managers
    JOIN departments ON managers.department_name = departments.department_name
    GROUP BY departments.department_name;


-- Write a query to create a view named “DependentsByDepartment” to get a count of how many dependents there are in each department. [Complete]
CREATE VIEW DependentsByDepartment AS
SELECT departments.department_name, COUNT(dependents.dependent_id) AS Number_of_Dependents
FROM departments
JOIN locations ON departments.location_id = locations.location_id
JOIN employees ON departments.department_id = employees.department_id
JOIN dependents ON employees.employee_id = dependents.employee_id
GROUP BY departments.department_name;

    -- Query the DependentsByDepartment view to show the department with the largest number of dependents. This should show the department name and the number of dependents. [Complete]
    SELECT * FROM DependentsByDepartment ORDER BY Number_of_Dependents DESC LIMIT 2;

-- Write a query to create a view named “HiresByYear” that calculates the number of employees hired each year. Remember the SQL $year function. [Complete]
CREATE VIEW HiresByYear AS
SELECT YEAR(employees.hire_date) AS Hire_Year, COUNT(employees.employee_id) AS Number_of_Hires
FROM employees
GROUP BY Hire_Year;
    -- Query the HiresByYear view to show the number of hires in 1997. [Complete]
    SELECT * FROM HiresByYear WHERE Hire_Year = 1997;

-- Write a query to create a view named “SalaryByDepartment” to calculate total salaries for each department. [Complete]
CREATE VIEW SalaryByDepartment AS
SELECT departments.department_name, SUM(employees.salary) AS Total_Salary
FROM departments
JOIN locations ON departments.location_id = locations.location_id
JOIN employees ON departments.department_id = employees.department_id
GROUP BY departments.department_name;

    -- Query the SalaryByDepartment view to show the total salary for the Finance department. [Complete]
    SELECT * FROM SalaryByDepartment WHERE department_name = 'Finance';

-- Write a query to create a view named “SalaryByJobTitle” to calculate total salaries for each job title. [Complete]
CREATE VIEW SalaryByJobTitle AS
SELECT jobs.job_title, SUM(employees.salary) AS Total_Salary
FROM jobs
JOIN employees ON jobs.job_id = employees.job_id
GROUP BY jobs.job_title;

    -- Query the SalaryByJobTitle view to show the job title and total salary for the title with the highest total salary. [Complete]
    SELECT * FROM SalaryByJobTitle ORDER BY Total_Salary DESC LIMIT 1;

-- Write a query to create a view named “EmployeeDependents” that calculates the number of dependents each employees has. This query should show employees even if they have 0 dependents. Display the employee name (first, last), email, phone number, and number of dependents. Hint: left or right join. [Complete]
CREATE VIEW EmployeeDependents AS
SELECT employees.first_name, employees.last_name, employees.email, employees.phone_number, COUNT(dependents.dependent_id) AS Number_of_Dependents
FROM employees
LEFT JOIN dependents ON employees.employee_id = dependents.employee_id
GROUP BY employees.employee_id;

    -- Query the EmployeeDependents view to show employees with no children". Show employee name (first, last), email, phone number, and number of dependents. [Complete]
    SELECT * FROM EmployeeDependents WHERE Number_of_Dependents = 0;
    
-- Write a query to create a view named “CountryLocation” that calculates the number of locations in each country. This query should show countries even if they have 0 locations. Display the country name and number of locations. Hint: left or right join. [Complete]
CREATE VIEW CountryLocation AS
SELECT countries.country_name, COUNT(locations.location_id) AS Number_of_Locations
FROM countries
LEFT JOIN locations ON countries.country_id = locations.country_id
GROUP BY countries.country_name;

    -- Query the CountryLocation view to show countries with no locations". Show country name and number of locations. [Complete]
    SELECT * FROM CountryLocation WHERE Number_of_Locations = 0;
