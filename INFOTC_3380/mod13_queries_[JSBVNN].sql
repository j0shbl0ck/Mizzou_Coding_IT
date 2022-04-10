/*** USER INFORMATION 
Student: Josh Block
Date: 4/10/22
Version: 1.0.0 ***/

-- Recall all tables
SHOW tables;
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

-- Write a query to calculate the payments each sales agent is responsible for. Display the agent name and the total payments.

-- Write a query to calculate payments for each sales agent by country of the sales agent. Display the agent country and total payments.

-- Calculate the commission for each order. Display order id, customer name, agent name, and commission amount.

# --------------------------
Update Queries
# --------------------------

-- In the customers table, for customers from New York update the CUST_CITY value to change it from “New York” to “NY”.
    
    -- Write an query to select all customers from New York City.

-- Increase the commission for sales agents from London by 20%.

    -- Write query to calculate the commission for each order where the agent is from London. Display order id, customer name, agent name, and commission amount.

-- Update customers with grade 2 to grade 3.
    
    -- Write query that selects all customers names and customer codes with grade 3.

# --------------------------
Delete Queries
# --------------------------

-- Delete sales agents from Bangalore.
    
    -- Write a query to select all columns for all sales agents

-- Delete customers whose name begins with the letter “S”.
    
    -- Write a query that selects all columns for all customers.