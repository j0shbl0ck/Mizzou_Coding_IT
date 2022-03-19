/*** USER INFORMATION 
Student: Josh Block
Date: 3/15/22
Version: 1.0.2 ***/

--RECALL tables
SHOW tables;
--RECALL Tables_in_classicmodels
DESCRIBE <table in sakila>;

-- Display the customer first name, last name, and movie titles the rented in 2006. Sort result by customer last name.
SELECT c.first_name, c.last_name, f.title 
FROM customer c, film f, rental r 
WHERE c.customer_id = r.customer_id, 
GROUP BY c.first_name, c.last_name, f.title;

/* //. Please help ,WHAT AM I DOING WRONG HERE
SELECT c.first_name, c.last_name, f.title
FROM customer c, film_text f, rental r, inventory i
WHERE c.customer_id = r.customer_id AND i.film_id = f.film_id AND YEAR(r.rental_date)=2006
GROUP BY f.title
ORDER BY c.last_name;
you need to group by first, last name and title */

-- How many films are in each category? List the category name in a column called "Category Name" and number of films in the category in a column called "Number of Films". Sort by number of films in descending order
SELECT c.name AS "Category Name", COUNT(f.film_id) AS "Number of Films"
FROM category c, film f
WHERE c.last_update = f.last_update
GROUP BY c.name
ORDER BY COUNT(f.film_id) DESC;


-- Calculate each customer's total payments and display the top 15 customers in terms of total payments in descending order. Display the customer first and last name and total payment amount in a column called "Total Payments".
SELECT c.first_name, c.last_name, SUM(p.amount) AS "Total Payments"
FROM customer c, payment p
WHERE c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY SUM(p.amount) DESC
LIMIT 15;
-- CORRECT

-- Calculate the total payments for each store. Display store id and total payments in a Column called Total Payments. Display results in descending order by total payments
SELECT s.store_id, SUM(p.amount) AS "Total Payments"
FROM store s, payment p, staff z
WHERE s.store_id = z.store_id AND z.staff_id = p.staff_id
GROUP BY s.store_id
ORDER BY SUM(p.amount) DESC;
-- CORRECT

-- Which films are rented the most? Display the Film name and the total rentals in a column called "Total Rentals". Display results in descending order by total rentals.
SELECT f.title, COUNT(r.customer_id) 
FROM rental r, film f, inventory i 
WHERE r.inventory_id = i.inventory_id AND f.film_id = i.film_id
GROUP BY f.title
ORDER BY COUNT(r.customer_id) DESC;
-- CORRECT

-- Which Film categories are rented the most? Display the category name and the total rentals in a column called "Total Rentals". Display results in descending order by total rentals.

-- Display the inventory list of movie titles for store number 1. Display the film title and quantity in stock in a column named "In Stock". Display results in alphabetical order of the titles
 
-- Which actors have acted in the most movies? List the actor first and last name and the number of movies in a column named "Number of Movies". Display results in descending order by number of movies.