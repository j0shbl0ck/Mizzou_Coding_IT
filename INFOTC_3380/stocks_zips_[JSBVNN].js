/*** USER INFORMATION 
Student: Josh Block
Date: 2/10/22
Version: 1.0.4 ***/

/* 
RECALL the collections:
show collections
-------------------
RECALL structure of the data in your collections:
db.zips.findOne();
db.stocks.findOne();
*/

// List all zip codes and city from your home state.
db.zips.find({"state": "MO"},{"_id":1,"city":1});
// List all of the zip codes and cities from the states of Missouri, Florida, Iowa, and Kansas.
db.zips.find({$or:[{"state":"MO"},{"state":"FL"},{"state":"IA"},{"state":"KS"}]},{"_id": 1,"city":1});
// List the zip codes, city, and population in Ohio for all the zip codes with populations of less than 2000 people?
db.zips.find({"state":"OH","pop":{$lt:2000}},{"_id":1,"city":1,"pop":1,});
// List the zip codes, city, and population for zip codes in the United States that have populations greater than 50,000 people?
db.zips.find({"pop":{$gt:50000}},{"_id":1,"city":1,"pop":1});
// Which zip codes are located in the city of Columbia, Missouri?
db.zips.find({"state":"MO","city":"COLUMBIA"},{"_id":1});
// List the population by zip code for all zip codes in the state of Missouri.
db.zips.find({"state":"MO"},{"pop":1,"_id":1});
// Which states have cities named Springfield?
db.zips.distinct("state",{"city":"SPRINGFIELD"});
// How many cities named Springfield are there in the United States?
db.zips.count({"city":"SPRINGFIELD"});
// List the zip code, population, and state for cities named Emerald.
db.zips.find({"city":"EMERALD"},{"_id":1,"pop":1,"state":1});
// List the zip code, city, and state for cities with a population of 10 people.
db.zips.find({"pop":{$eq:10}},{"_id":1,"pop":1,"state":1});
// List all of the documents in the stocks collection.
db.stocks.find();
// List the company name and symbol for all companies in the “Information Technology” sector.
db.stocks.find({"Sector":"Information Technology"},{"Name":1,"Symbol":1});
// List the symbol, company name, and stock price for all companies in the “Financials” sector whose stock price is greater than $75.
db.stocks.find({"Sector":"Financials","Price":{$gt:75}},{"Symbol":1,"Name":1,"Price":1});
// List the Company name, sector, and earnings (EBITDA) for all companies with earnings (EBITDA) of at least $2.5 Billion
db.stocks.find({"EBITDA":{$gte:2500000000}},{"Name":1,"Sector":1,"EBITDA":1});
// List the company name, symbol and sector for all companies with a 52 Week High greater than or equal to 150.
db.stocks.find({"52 Week High":{$gte:150}},{"Name":1,"Symbol":1,"Sector":1});
// List the symbol, company name, and stock price for all companies in the “Real Estate” sector whose stock price is less than $50.
db.stocks.find({"Sector":"Real Estate","Price":{$lt:75}},{"Symbol":1,"Name":1,"Price":1});
// List the company name, symbol and dividend yield for companies in the Utilities or Industrials sectors.
db.stocks.find({$or:[{"Sector":"Real Estate"},{"Sector":"Utilities"}]},{"Name":1,"Symbol":1,"Dividend Yield":1});
// List the company name, symbol and market cap for companies whose dividend yield is greater than 3 or whose earnings/share is less than 1.
db.stocks.find({$or:[{"Dividend Yield":{$gt:3}},{"Price/Earnings":{$lt:1}}]},{"Name":1,"Symbol":1,"Market Cap":1});
