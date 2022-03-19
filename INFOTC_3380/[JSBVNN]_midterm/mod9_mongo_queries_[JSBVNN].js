/*** USER INFORMATION 
Student: Josh Block
Date: 3/15/22
Version: 1.0.1 ***/

/* 
RECALL the collections:
USE classicmodels;
USE sakila;
SHOW tables;
-------------------
RECALL structure of the data in your collections:
db.orders.findOne();
db.customers.findOne();
db.products.findOne();
db.employees.findOne();
*/

// How many orders has each order line appeared in? Display order line number and number of orders.
db.orders.aggregate([
    {$unwind : "$orderDetails"},
    {$group: {_id: "$orderDetails.orderLineNumber", NumberOfOrders:{$sum:1}}},
    {$sort: {"NumberOfOrders": -1}}
])
// Correct

// Calculate the total payments each customer has made. Display customer name and the total payment.
db.customers.aggregate([
    {$unwind: "$payments"},
    {$group: {_id: "$customerName", totalPayments: {$sum: "$payments.amount"}}},
    {$sort:{"totalPayments":-1}}
])
// Correct

// Calculate the number of payments each customer has made. Display customer name and the number of payments.
db.customers.aggregate([
    {$unwind : "$payments"},
    {$group:{_id: "$customerName", totalPayments: {$sum:1}}},
    {$sort:{"totalPayments":-1}}
])
// Correct

// How many employees work in each office. List the office code and number of employees.
db.employees.aggregate([
    {$unwind: "$office"},
    {$group:{_id:"$office.officeCode",NumberOfEmployees:{$sum:1}}},
    {$sort:{"NumberOfEmployees":-1}}
])
// Correct

// What are the 10 most expensive orders? Display the Customer name and order total and display results in descending order by order total.
db.orders.aggregate([
    {$unwind : "$orderDetails"},
    {$group: {_id:"$customerName", OrderTotal:{$sum: {$multiply:["$orderDetails.quantityOrdered", "$orderDetails.priceEach"]}}}},
    {$sort:{"OrderTotal": -1}},
    {$limit: 10},
])

db.orders.aggregate([
    {$unwind : "$orderDetails"},
    {$group: {_id:{_id:"$_id", CustomerName:"$customerName"}, OrderTotal:{$sum: {$multiply:["$orderDetails.quantityOrdered", "$orderDetails.priceEach"]}}}},
    {$sort:{"OrderTotal": -1}},
    {$limit: 10},
])
// Correct

// What is the sales value of each product in stock? Sale value is calculated by multiplying quantity in stock by MSRP. Display the product name and the sales value in descending order based on sales value.
db.products.aggregate([
    {$project: {_id:"$productName", salesValue:{$sum: {$multiply:["$quantityInStock", "$MSRP"]}}}},
    {$sort:{"salesValue": -1}}
])
// Correct

// Which Customer has ordered the most "1913 Ford Model T Speedster". Display the customer name and total ordered.
db.customers.aggregate([
    {$unwind : "$orderDetails"},
    {$group: {_id:{_id:"$_id", CustomerName:"$customerName"}, OrderTotal:{$sum: {$multiply:["$orderDetails.quantityOrdered", "$orderDetails.priceEach"]}}}},
    {$sort:{"OrderTotal": -1}},
    {$limit: 10},
])

db.customers.aggregate([
    {$unwind : "$orderDetails"},
    {$group: {_id:{_id:"$_id", CustomerName:"$customerName"}, TotatFMTOrdered:"orderDetails.productName":"1913 Ford Model T Speedster"}},
    {$sort:{"OrderTotal": -1}},
    {$limit: 10},
])

db.customers.aggregate([
    {$unwind: "$payments"},
    {$project:{_id: 0, customerName: 1, "payments.amount": 1}},
    {$sort: {"payments.amount": -1}},
    {$limit: 1}
])

// How many customers does each sales rep have? Display the Sales rep name and the number of customers.
