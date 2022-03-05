/*** USER INFORMATION 
Student: Josh Block
Date: 2/27/22
Version: 1.3.9 ***/

/* 
RECALL the collections:
USE classicmodels
show collections
-------------------
RECALL structure of the data in your collections:
db.orders.findOne();
db.customers.findOne();
db.products.findOne();
db.employees.findOne();
*/

// How many products have an MSRP of $100 of greater?
db.products.count({"MSRP":{$gte:100}},{"productName":1, "MSRP":1,"_id":0})

// Calculate the number of orders each customer has placed and display the top 25 in descending order based on orders placed. Display the customer name and the orders placed in a columns called “Orders Placed”.
db.orders.aggregate([
    {$group:{_id:"$customerName",OrdersPlace:{$sum:1}}},
    {$sort:{OrdersPlace: -1}},
    {$limit: 25}
])

// List the product names where the quantity in stock is greater than 5000
db.products.find({"quantityInStock":{$gte:5000}},{"productName":1, "quantityInStock":1,"_id":0})

// Calculate and display the number of customers in each state. Display the customer name and and number of customers in each state in a column called “Number of Customers in State”. Sort the results by the Number of Customers in State.
db.customers.aggregate([
    {$group:{_id: "$state",NumberofCustomersinState: {$sum:1}}},
    {$sort:{NumberofCustomersinState:1}}
])

// Which employees manage the most people? Develop a query to calculate the number of people each employees manages. Display the employee number and number of employees employees they manage in a column called “Number of Reports”.
db.employees.aggregate([
    {$group:{_id:"$reportsTo",NumberofReports:{$sum:1}}},
    {$sort:{NumberofReports: -1}}
])

// List the names and credit limit of the customers with the 10 highest credit limits
db.customers.aggregate([
    {$project:{_id:0,customerName:1,creditLimit:1}},
    {$sort:{creditLimit:-1}},
    {$limit: 10}
])

// Write a query to calculate the number of product lines in the database. Display the result in a column called “Number of Lines”. 
db.products.aggregate([
    {$project:{_id:0,NumberofLines:{$sum:"$productLine"}}}
])

db.products.aggregate([
    {$group:{_id:"$Line",NumberofProductLines:{$sum:1}}},
    {$sort:{NumberofReports: -1}}
])
// Calculate the dollar value of each product in inventory. You can calculate this by multiplying the quantity in stock by the buy price. Display the product name, quantity in stock, buy price, and in its dollar value in a column called “Dollar Value”. Sort the results in descending order based on dollar value.
db.products.aggregate([
    {$project:{_id:0,productName:1,quantityInStock:1,buyPrice:1,DollarValue:{$multiply:["$quantityInStock","$buyPrice"]}}},
    {$sort:{DollarValue:-1}}
])