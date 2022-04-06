/*** USER INFORMATION 
Student: Josh Block
Date: 4/03/22
Version: 1.0.2 ***/

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
-------------------
To drop a colllection/view
db.<collection/view>.drop();

*/
---------------
// Create a view named MissouriCities to show the population of all the cities in Missouri based on the data in the zips collection
db.createView(
    "MissouriCities",
    "zips",
    [
        {$match: {state: "MO"}},
        {$group: {_id: "$city", TotalPopulation: {$sum: "$pop"}}},
        {$sort: {TotalPopulation: -1}}
    ]
)
    // query the MissouriCities view to find cities with populations of 100,000 or greater
    db.MissouriCities.aggregate([
        {$match: {TotalPopulation:{$gte:100000}}}
    ])

// create a view using the stocks collection to show the total EBITDA for each sector.
db.createView(
    "EBITDAbySector",
    "stocks",
    [ 
        {$group: {_id: "$Sector", TotalEarnings: {$sum: "$EBITDA"}}}  
    ]
)
    // query the EBTDAbySector view to find the total EBITDA for the "Health Care" Sector.
    db.EBITDAbySector.find({"_id":"Health Care"})

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

// Calculate the dollar value of each product in inventory. You can calculate this by multiplying the quantity in stock by the buy price. Display the product name, quantity in stock, buy price, and in its dollar value in a column called “Dollar Value”. Sort the results in descending order based on dollar value.
db.products.aggregate([
    {$project:{_id:0,ProductName:"$productName",QuantityinStock:"$quantityInStock",BuyPrice:"$buyPrice",DollarValue:{$multiply:["$quantityInStock","$MSRP"]}}},
    {$sort:{TotalValue: -1}},
    {$limit: 25}
])
---------------


// Write a query to create a view named "custByCity" to get a count of how many customers there are in each city.
db.createView(
    "custByCity",
    "customers",
    [
        {$group: {_id: "$city", count: {$sum: 1}}}
    ]
)
    // Query the custByCity view to show the number of customers in Singapore.
    db.custByCity.find({"_id":"Singapore"})

// Write a query to create a view named "paymentsByMonth" that calculates payments per month. You will have to group by multiple columns for this query: month and year because payments from January 2004 and January 2005 should not be grouped together. Remember the SQL month() and year() functions.
db.createView(
    "paymentsByMonth",
    "customers",
    [
        {$unwind:"$payments"},
        {$addFields:{"year":{$year: "$payments.paymentDate"},"month":{$month: "$payments.paymentDate"}}},
        {$group: {_id: {"year": "$year", "month": "$month"}, TotalPayments: {$sum: 1}}}
    ]
)
    // Query the paymentsByMonth view to show payments in November 2004
    db.paymentsByMonth.find({"_id.month":11, "_id.year":2004})

// Write a query to create a view named "orderTotalsByMonth" to calculate order totals (in dollars) per month.
db.createView(
    "orderTotalsByMonth",
    "orders",
    [
        {$unwind:"$orderDetails"},
        {$addFields:{"year":{$year: "$orderDate"},"month":{$month: "$orderDate"}}},
        {$group: {_id: {"year": "$year", "month": "$month"}, TotalOrder: {$sum: "$orderDetails.priceEach"}}}
    ]
)
    // Query the orderTotalsByMonth view to show the order total in August 2004.
    db.orderTotalsByMonth.find({"_id.month":8, "_id.year":2004})

// Write a query to create a view named "productSalesYear" that calculates sales per product per year. Include the product name, sales total, and year ascending.
db.createView(
    "productSalesYear",
    "orders",
    [
        {$unwind:"$orderDetails"},
        {$addFields:{"year":{$year: "$orderDate"}}},
        {$group: {_id: {"product": "$orderDetails.productName", "year": "$year"}, TotalSales: {$sum: "$orderDetails.priceEach"}}},
        {$sort: {_id: 1}}
    ]
)
    // Query the productSalesYear view to show the sales per year for the "2001 Ferrari Enzo"
    db.productSalesYear.find({"_id.product":"2001 Ferrari Enzo"})

// Write a query to create a view named "orderTotals" that displays the order total for each order. Include customer name, order number, and order total.
db.createView(
    "orderTotals",
    "orders",
    [
        {$unwind:"$orderDetails"},
        {$group: {_id: "$customerName", TotalOrder: {$sum: "$orderDetails.priceEach"}}}
    ]
)

    // Query the orderTotals view to select the top 15 orders.
    db.orderTotals.find().sort({TotalOrder: -1}).limit(15)





