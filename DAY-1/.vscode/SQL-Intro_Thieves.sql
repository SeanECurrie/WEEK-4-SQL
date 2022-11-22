SELECT *
FROM rental;

SELECT payment_id
from payment;


SELECT first_name, last_name
FROM actor;

SELECT first_name, last_name
FROM actor
WHERE first_name = 'Nick';

SELECT first_name
FROM actor
WHERE first_name LIKE 'N%';

SELECT first_name
FROM actor
WHERE first_name LIKE 'K__%';

SELECT *
FROM payment;

SELECT amount
FROM payment
WHERE amount > 10;

SELECT amount
from payment
where amount BETWEEN 10 AND 15;

SELECT amount
FROM payment
ORDER BY amount DESC;

SELECT customer_id, amount, payment_date
FROM payment
ORDER BY payment_date;

SELECT customer_id, amount, payment_date
FROM payment
WHERE amount <> 2.99
ORDER BY amount;

-- Aggregate functions
-- MIN()
-- MAX()
-- SUM()
-- AVG()
-- COUNT()

SELECT SUM(amount)
FROM payment
WHERE amount >= 5.99;

SELECT AVG(amount)
FROM payment
WHERE amount >= 5.99;

SELECT COUNT(amount)
FROM payment
WHERE amount >= 5.99;

SELECT COUNT(DISTINCT amount)
FROM payment;

SELECT MIN(amount) AS min_amount_paid
FROM payment;

-- GROUP BY : used with aggregate functions

SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id
ORDER BY customer_id;

-- customer that paid the most

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 10;

-- WHERE keyword cannot be used with aggregaates , HAVING can

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) < 500
ORDER BY SUM(amount) DESC;

------------------------------------------
---------------HOMEWORK-------------------
------------------------------------------

-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT COUNT(last_name)
FROM actor
WHERE last_name = 'Wahlberg';

Answer : 2

-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- Answer : 4803

-- 3. What film does the store have the most of? (search in inventory table)
SELECT COUNT(film_id), film_id
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

-- Answer : There are a lot with 8

-- 4. How many customers have the last name ‘Williams’?
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'Williams'

-- Answer : 1

-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, COUNT(payment_id)
FROM payment
GROUP BY staff_id
ORDER BY staff_id;

-- Answer : 2

-- 6. How many different distinct names are there?
SELECT FIRST_NAME, LAST_NAME, Count(*) AS CNT
FROM ACTOR
GROUP BY FIRST_NAME, LAST_NAME
HAVING COUNT(*) = 1;

-- Answer : There are 201 distinct names in Actors

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT COUNT(actor_id), film_id, title
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

-- Answer : film_id 508


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(last_name), store_id
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id;

-- Answer : 13

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
--with ids between 380 and 430? (use group by and having > 250)
SELECT amount, COUNT(rental_id) 
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(rental_id) > 250;

-- Answer : 3

-- 10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;
-- Answer : 5, PG-13





