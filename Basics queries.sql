 #SELECT STATEMENT
 
 # SELECT column_name FROM table_name;-> its the basic statement its better to capitalise fo better understanding
 
 SELECT * FROM actor; # Opens the complete table
 SELECT first_name, last_update FROM actor; # open only the column entered
 
 # CHALLENGE FOR SELECT STATEMENT
 
 SELECT * FROM customer;
 SELECT first_name, last_name, email FROM customer;
 
 # SELECT DISTINCT STATEMENT
 
 SELECT * FROM film;
 #lets say we wanna know how many release year we have in this data
 SELECT DISTINCT(release_year) FROM film;
 SELECT DISTINCT(rental_rate) FROM film;
 
 # CHALLENGE FOR SELECT DISTINCT STATEMENT
  SELECT * FROM film;
  SELECT DISTINCT(rating) FROM film;
  
  #COUNT STATEMENT
  #count needs the parenthese unlike distinct because count is a function acting on something
 SELECT COUNT(*) FROM actor;
 SELECT COUNT(actor_id) FROM actor;
 SELECT COUNT(last_name) FROM actor;
 SELECT * FROM payment;
 SELECT COUNT(*) FROM payment;
 
 #SELECT WHERE STATEMENT
 
 SELECT * FROM customer;
 
 SELECT * FROM customer
 WHERE first_name = 'Jared';
 
 SELECT * FROM film;
 
 SELECT * FROM film
 WHERE rental_rate> 4;
 
  SELECT * FROM film
 WHERE rental_rate> 4 AND replacement_cost >=19.99;
 
 SELECT * FROM film
 WHERE rental_rate> 4 AND replacement_cost >=19.99
 AND rating = 'R' ;
 
 SELECT COUNT (title) FROM Film
 WHERE rental_rate> 4 AND replacement_cost>=19.99
 AND rating='R'; # from previous lecture count () can have any name or just * it doesnt make any difference in output.
 
 
SELECT COUNT(*) FROM film
WHERE rating ='R' OR rating='PG-13';

SELECT COUNT(*) FROM film
WHERE rating !='R'; 

SELECT * FROM film
WHERE rating !='R'; 

#CHALLENGES FOR SELECT WHERE STATEMENT

SELECT email FROM customer
WHERE first_name='Nancy' AND last_name='Thomas';

SELECT description FROM film
WHERE title='Outlaw Hanky';

SELECT phone FROM address
WHERE address='259 Ipoh Drive';

#ORDER BY KEYWORD
SELECT * FROM customer
ORDER BY first_name ; # if not mentioned itll always list in ascending order.

SELECT * FROM customer
ORDER BY first_name DESC; # ORDER BY DECENDING ORDER

SELECT store_id, first_name, last_name FROM customer
ORDER BY store_id;

#LIMIT KEYWORD

SELECT * FROM payment
ORDER BY payment_date
LIMIT 5;

SELECT * FROM payment
ORDER BY payment_date DESC
LIMIT 5;

SELECT * FROM payment
WHERE amount!=0.00
ORDER BY payment_date DESC
LIMIT 5;

SELECT * FROM payment
LIMIT 1;

#CHALLENGE FOR ORDER BY

SELECT customer_id FROM payment
Order by payment_id ASC
LIMIT 10;

SELECT title,length FROM film
order by length asc
limit 5;

SELECT title,length FROM film
where length<=50;

SELECT COUNT(title) FROM film
where length<=50;

#BETWEEN KEYWORD

SELECT * FROM payment
LIMIT 2;

SELECT * FROM payment
WHERE amount BETWEEN 8 AND 9;
# to to count the total numb of contraction use count keyword

SELECT COUNT (*) FROM payment
WHERE amount BETWEEN 8 AND 9;

SELECT COUNT (*) FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';

SELECT COUNT(*) FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';

# IN KEYWORD

SELECT * FROM payment;
SELECT DISTINCT(amount) FROM payment
ORDER BY amount;

SELECT * FROM payment
WHERE amount IN (0.99,1.98,1.99 );

SELECT COUNT (*) FROM payment
WHERE amount IN (0.99,1.98,1.99 );

SELECT COUNT(*) FROM payment
WHERE amount NOT IN (0.99,1.98,1.99 );

SELECT * FROM customer
WHERE first_name IN ('JARED','Julie','Jake'); # shows only the names in the data 

#LIKE AND ILIKE

SELECT * FROM customer
WHERE first_name LIKE'J%';

SELECT COUNT(*) FROM customer
WHERE first_name LIKE'J%';


SELECT * FROM customer
WHERE first_name LIKE'J%' AND last_name LIKE 'S%' ;

SELECT * FROM customer
WHERE first_name LIKE'%er%'; # % means multiple character is allowed

SELECT * FROM customer
WHERE first_name LIKE'_her%'; #_ means single character is allowed

SELECT * FROM customer
WHERE first_name NOT LIKE'_her%';

SELECT * FROM customer
WHERE first_name LIKE'A%'
ORDER BY last_name;

SELECT * FROM customer
WHERE first_name LIKE'A%' AND last_name NOT LIKE'B%'
ORDER BY last_name;