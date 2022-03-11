/*** USER INFORMATION 
Student: Josh Block
Date: 3/09/22
Version: 1.0.4 ***/

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


// Calculate the number of orders for each product that has been ordered. Display the product name and number of orders in a column called “Number of Orders”. Display the results in descending order based on “Number of Orders”. Note: You are calculating the number of orders and not quantity ordered. For example, if Alice orders 3 pizzas today and 5 pizzas next week then pizza orders equals 2 and the quantity of pizzas ordered equals 8.
db.orders.aggregate([
    {$unwind: "$orderDetails"},
    {$project:{_id: 0, "orderDetails.productName": 1, "orderDetails.quantityOrdered": 1}},
    {$sort: {"orderDetails.quantityOrdered": -1}},
])

// Calculate the total number of each product that has been ordered. Display the product name and quantity ordered in a column called “Quantity Ordered”. Display the results in descending order based on Quantity Ordered.
db.orders.aggregate([
    {$unwind: "$orderDetails"},
    {$project:{_id: 0, "orderDetails.productName": 1, "orderDetails.quantityOrdered": 1}},
    {$sort: {"orderDetails.quantityOrdered": -1}},
])

// Calculate the total dollar value of the top 25 products that has been ordered in the database. Display the product name and the dollar value in a column called “Total Value”.
db.products.aggregate([
    {$project:{_id:0,ProductName:"$productName",TotalValue:{$multiply:["$quantityInStock","$MSRP"]}}},
    {$sort:{TotalValue: -1}},
    {$limit: 25}
])

// Calculate the number of orders each customer has placed and display the top 25 in descending order based on orders placed. Display the customer name and the orders placed in a columns coaaled “Orders Placed”.
db.orders.aggregate([
    {$unwind: "$orderDetails"},
    {$project:{_id: 0, "orderDetails.productName": 1, "orderDetails.quantityOrdered": 1}},
    {$sort: {"orderDetails.quantityOrdered": -1}},
])

// Calculate the total payments made each year. Display the year and total payments in a column called “Total Payments”.
db.customers.aggregate([
    {$unwind:"$payments"},
    {$group: {_id:{$year:"$payments.paymentDate"},TotalPayments:{$sum:1}}}
])

// Calculate the total payments made each month in 2004. Display the month and total payments in a column called “Total Payments”. Order the results by month in ascending order. **Hint: You will need to use the $addFields to add a field for year using the $year function, then match for 2004
db.customers.aggregate([
    {$unwind:"$payments"},
    {$addFields:{"year":{$year: "$payments.paymentDate"}}},
    {$match:{"year": 2004}},
    {$group: {_id:{$month: "$payments.paymentDate"}, TotalPayments: {$sum: 1}}},
    {$sort: {_id: 1}}
])

// Calculate the total payments made each day in December of 2004. Display the day in a column named “Day” and total payments in a column called “Total Payments”. Order the results by day in ascending order. **Hint: You will need to use the $addFields to add a field for year and month, using the $year and $month functions, then match for 2004 and 12
db.customers.aggregate([
    {$unwind:"$payments"},
    {$addFields:{"year":{$year: "$payments.paymentDate"},"month":{$month: "$payments.paymentDate"}}},
    {$match:{"year": 2004,"month":12}},
    {$group: {_id:{$dayOfMonth: "$payments.paymentDate"}, TotalPayments: {$sum: 1}}},
    {$sort: {_id: 1}}
])

// Calculate the total payments made by each customer in the database who has made a payment. Display the customer name and the total payments in a column named “Total Payments”. Order the results by total payments.
db.customers.aggregate([
    {$group:{_id:"$customerName",TotalPayments:{$sum:1}}}
])

// Calculate and display the number of customers in each state. Display the customer name and and number of customers in each state in a column called “Number of Customers in State”. Sort the results by the Number of Customers in State.
db.customers.aggregate([
    {$group:{_id:"$state",NumberofCustomersinState:{$sum:1}}}
])

// Which employees manage the most people? Develop a query to calculate the number of people each employees manages. Display the employee number and number of employees employees they manage in a column called “Number of Reports”.
db.employees.aggregate([
    {$group:{_id:"$reportsTo",NumberofReports:{$sum:1}}},
    {$sort: {_id:1}}
])

// Write a query to calculate the number of product lines in the database. Display the result in a column called “Number of Lines”.
db.products.aggregate([
    {$group:{_id: "$productLine.line", pcount: {$sum: 1}}},
    {$count: "Number of ProductLines"}
])

// Calculate the dollar value of each product in inventory. You can calculate this by multiplying the quantity in stock by the buy price. Display the product name, quantity in stock, buy price, and in its dollar value in a column called “Dollar Value”. Sort the results in descending order based on dollar value.
db.products.aggregate([
    {$project:{_id:0,ProductName:"$productName",QuantityinStock:"$quantityInStock",BuyPrice:"$buyPrice",DollarValue:{$multiply:["$quantityInStock","$MSRP"]}}},
    {$sort:{TotalValue: -1}},
    {$limit: 25}
])