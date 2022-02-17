/*** USER INFORMATION 
Student: Josh Block
Date: 2/15/22
Version: 1.3.1 ***/

/* 
RECALL the collections:
show collections
-------------------
RECALL structure of the data in your collections:
db.zips.findOne();
db.stocks.findOne();
*/

// Which states have zip codes with populations greater than (75,000) people?
db.zips.aggregate([{$match:{pop:{$gt:75000}}},{$project: {state:1}}]);
db.zips.aggregate([{$group: {_id: "$state"}, PopulationGreaterThan75000:{"$pop":{gt:74000}}},{$project: {_id:1,state:1}}])
// Which cities have populations greater than 200,000 people?
db.zips.aggregate([ {$match : {pop:{$gt:200000}}},{$group: {city: "$city"}},{$project:{_id:0,city:1}}]);
// What is the total population of each city in FL. Sort in ascending order based on total population?
db.zips.aggregate([{$match:{state:"FL"}},{$group:{"_id":"$city",TotalPopulation:{$sum: "$pop"}}},{$sort:{TotalPopulation:1}}])
// What are the 10 most populous cities in MO?
db.zips.aggregate([{$match:{state:"MO"}},{$group: {"_id":"$city",TotalPopulation:{$sum:"$pop"}}},{$project: {city:1,TotalPopulation: 1}},{$sort:{TotalPopulation: -1}},{$limit: 10}])
// What is the population of New York City, NY?
db.zips.aggregate([{$group:{"_id":null,TotalPopulation:{$sum:"$pop"}}},{$project:{TotalPopulation:1}},{$sort:{TotalPopulation:1}}])
db.zips.aggregate([{$match: {$and: [{state:"NY"},{city:"NEW YORK CITY"}]}}])
// List the cities in Illinois that have 3 or more zip codes? Sort in descending order by total number of zip codes. Hint: count multiple occurrences of a city’s name.
// Which city has the fewest number of zip codes?
// What is the name and total population of the most populous city in the zips database?
// What is the name and total population of the least populous city in the zips database?
// What is the name and total population for the 15 most populous cities in the zips database?
// List the symbol and company name of the companies with the ten (10) highest stock price.
// List total earnings (EBITDA) by sector.
// List the average earnings by sector
// Show the company name and symbol of the top 10 companies in earnings in the Industrials sector?
// List the names of the companies in the Information Technology sector that paid dividends to shareholders. You will know this if the “Dividend Yield” field is greater than 0.
// What are the top 10 companies in the “Health Care” sector when it comes to “Earnings/Share”?
// Calculate the total earnings (EBITDA) for all companies in the Information Technology sector.
// Calculate the number of outstanding shares for companies in the Industrials sector. Number of outstanding shares can be calculated by dividing the Market Cap by the Price. Display company name, symbol, and number of outstanding shares in ascending order.