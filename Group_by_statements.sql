#AGGREGATE FUNCTION
SELECT * FROM film;
SELECT MIN(replacement_cost) FROM film;
SELECT MAX(replacement_cost) FROM film; 
SELECT MIN(rental_rate),MAX(rental_rate) FROM film;

SELECT COUNT(*) 
FROM film;
SELECT AVG(replacement_cost)
FROM film;
#since the result we got has lot of numbers after decimal well use round func
SELECT ROUND(AVG(replacement_cost),2)		#Round(what needs to be round, digit to display after decimal)
FROM film;

SELECT SUM (replacement_cost)
FROM film;

#GROUP BY STATEMENTS

SELECT * FROM payment;

SELECT customer_id FROM payment
GROUP BY customer_id
ORDER BY customer_id; #its a simple group by function with no aggregate function
# A Simple group by function is similar to select distinct but with order function the result will be in ascending order

lets do a query about which customer is spending much money

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount)

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC

#Difference between the sum and count function is that SUM= askin for the total number of dollars being transcated 
COUNT= how many transaction are occuring

#to count the actual number of transaction we are having

SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) DESC

#Now lets do group by in multiple column

SELECT * FROM payment;
SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY customer_id;

SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY customer_id, staff_id
ORDER BY customer_id,staff_id;
# Note always SELECT AND GROUP BY should be in same order

# NOW GROUP BY using payment_date

SELECT * FROM payment;
# we ll have to call a special group by statement.
# notice that we have a timestamp not just date. If we have to perform a group by for this there is specialized data function 

SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
ORDER BY SUM(amount) DESC

#CHALLENGE FOR GROUP BY

SELECT * FROM payment

SELECT staff_id,COUNT(amount) 
FROM payment
GROUP BY staff_id;


SELECT * FROM film

SELECT rating, ROUND(AVG(replacement_cost), 2) 
from film
GROUP BY rating;

SELECT * FROM payment;

SELECT customer_id,SUM(amount)
FROM payment
group by customer_id
ORDER BY SUM(amount) desc
LIMIT 5;

#HAVING

SELECT * FROM payment

SELECT customer_id, SUM(amount) FROM payment
WHERE customer_id NOT IN (184,87,477)
GROUP BY customer_id
# we cant filter where statement using SUM(amount) because sum is not gonna haapen untill group by statement is called

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount) >100

SELECT * FROM customer

SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id

#Now lets select the store_id that has more than 300 customer

SELECT store_id, COUNT(*) FROM customer
GROUP BY store_id
HAVING COUNT(*) >300

# The above query can also be written as below

SELECT store_id, COUNT(customer_id) FROM customer
GROUP BY store_id
HAVING COUNT(customer_id) >300

#CHALLENGE FOR HAVING 

SELECT * FROM payment
SELECT customer_id , COUNT(amount) 
FROM payment
GROUP BY customer_id
HAVING  COUNT(amount) >=40

SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id= (2)
GROUP BY customer_id
HAVING SUM(amount) >100
