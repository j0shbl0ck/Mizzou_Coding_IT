/*** USER INFORMATION 
Student: Josh Block
Date: 4/03/22
Version: 1.0.1 ***/

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
    "payments",
    [
        {$group: {_id: {month: {$month: "$paymentDate"}, year: {$year: "$paymentDate"}}, TotalPayments: {$sum: "$amount"}}}
    ]
)
    // Query the paymentsByMonth view to show payments in November 2004
    db.paymentsByMonth.find({"_id.month":11, "_id.year":2004})


// Write a query to create a view named "orderTotalsByMonth" to calculate order totals (in dollars) per month.
    // Query the orderTotalsByMonth view to show the order total in August 2004.
// Write a query to create a view named "productSalesYear" that calculates sales per product per year. Include the product name, sales total, and year.
    // Query the productSalesYear view to show the sales per year for the "2001 Ferrari Enzo"
// Write a query to create a view named "orderTotals" that displays the order total for each order. Include order number, customer name, and total.
    // Query the orderTotals view to select the top 15 orders.