/*** USER INFORMATION 
Student: Josh Block
Date: 4/18/22
Version: 1.0.2 ***/

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

mysql> SHOW tables;
+--------------------+
| Tables_in_project2 |
+--------------------+
| countries          |
| departments        |
| dependents         |
| employees          |
| jobs               |
| locations          |
| regions            |
+--------------------+

mysql> DESCRIBE countries;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| country_id   | char(2)     | NO   | PRI | NULL    |       |
| country_name | varchar(40) | YES  |     | NULL    |       |
| region_id    | int         | NO   | MUL | NULL    |       |
+--------------+-------------+------+-----+---------+-------+

mysql> DESCRIBE departments;
+-----------------+-------------+------+-----+---------+----------------+
| Field           | Type        | Null | Key | Default | Extra          |
+-----------------+-------------+------+-----+---------+----------------+
| department_id   | int         | NO   | PRI | NULL    | auto_increment |
| department_name | varchar(30) | NO   |     | NULL    |                |
| location_id     | int         | YES  | MUL | NULL    |                |
+-----------------+-------------+------+-----+---------+----------------+

mysql> DESCRIBE dependents;
+--------------+-------------+------+-----+---------+----------------+
| Field        | Type        | Null | Key | Default | Extra          |
+--------------+-------------+------+-----+---------+----------------+
| dependent_id | int         | NO   | PRI | NULL    | auto_increment |
| first_name   | varchar(50) | NO   |     | NULL    |                |
| last_name    | varchar(50) | NO   |     | NULL    |                |
| relationship | varchar(25) | NO   |     | NULL    |                |
| employee_id  | int         | NO   | MUL | NULL    |                |
+--------------+-------------+------+-----+---------+----------------+

mysql> DESCRIBE employees;
+---------------+--------------+------+-----+---------+----------------+
| Field         | Type         | Null | Key | Default | Extra          |
+---------------+--------------+------+-----+---------+----------------+
| employee_id   | int          | NO   | PRI | NULL    | auto_increment |
| first_name    | varchar(20)  | YES  |     | NULL    |                |
| last_name     | varchar(25)  | NO   |     | NULL    |                |
| email         | varchar(100) | NO   |     | NULL    |                |
| phone_number  | varchar(20)  | YES  |     | NULL    |                |
| hire_date     | date         | NO   |     | NULL    |                |
| job_id        | int          | NO   | MUL | NULL    |                |
| salary        | decimal(8,2) | NO   |     | NULL    |                |
| manager_id    | int          | YES  | MUL | NULL    |                |
| department_id | int          | YES  | MUL | NULL    |                |
+---------------+--------------+------+-----+---------+----------------+

mysql> DESCRIBE jobs;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| job_id     | int          | NO   | PRI | NULL    | auto_increment |
| job_title  | varchar(35)  | NO   |     | NULL    |                |
| min_salary | decimal(8,2) | YES  |     | NULL    |                |
| max_salary | decimal(8,2) | YES  |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+

mysql> DESCRIBE locations;
+----------------+-------------+------+-----+---------+----------------+
| Field          | Type        | Null | Key | Default | Extra          |
+----------------+-------------+------+-----+---------+----------------+
| location_id    | int         | NO   | PRI | NULL    | auto_increment |
| street_address | varchar(40) | YES  |     | NULL    |                |
| postal_code    | varchar(12) | YES  |     | NULL    |                |
| city           | varchar(30) | NO   |     | NULL    |                |
| state_province | varchar(25) | YES  |     | NULL    |                |
| country_id     | char(2)     | NO   | MUL | NULL    |                |
+----------------+-------------+------+-----+---------+----------------+

mysql> DESCRIBE regions;
+-------------+-------------+------+-----+---------+----------------+
| Field       | Type        | Null | Key | Default | Extra          |
+-------------+-------------+------+-----+---------+----------------+
| region_id   | int         | NO   | PRI | NULL    | auto_increment |
| region_name | varchar(25) | YES  |     | NULL    |                |
+-------------+-------------+------+-----+---------+----------------+


-- Write a query to create a view named “EmployeesPerRegion” that shows the region_name and the number of employees from that region in a column called “Number of Employees”. [Not created]
CREATE VIEW EmployeesPerRegion AS
SELECT regions.region_name, COUNT(employees.employee_id) AS Number_of_Employees
FROM regions
JOIN countries ON regions.region_id = countries.region_id
JOIN locations ON countries.country_id = locations.country_id
JOIN departments ON locations.location_id = departments.location_id
JOIN employees ON departments.department_id = employees.department_id
GROUP BY regions.region_name;

    -- Query the EmployeesPerRegion to show the number of employees from the Americas. [Not queried]
    SELECT * FROM EmployeesPerRegion WHERE region_name = 'Americas';

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