-- Subqueries
-- You can make subqueries in 3 spots
-- SELECT, FROM, and WHERE clauses

-- SELECT columns_you_want_to_see
-- FROM table_you_want_to_pull_from
-- WHERE conditions_go_here

-- WHERE is the most common
-- turn 2 queries into 1

-- Query 1: Find the customer_id that has spent more that $175
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;

-- Query 2: Get all customer info(name,address, etc...)
SELECT *
FROM customer;

-- NOW OUR SUBQUERY TO COMBINE THEM TOGETHER using WHERE and IN
SELECT first_name, last_name, email
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
    ORDER BY SUM(amount) DESC
);

-- Another Subquery Example (adding joins)
SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
    SELECT actor.actor_id
    FROM actor
    INNER JOIN film_actor
    ON actor.actor_id = film_actor.actor_id
    INNER JOIN film
    ON film_actor.film_id = film.film_id
    WHERE title = 'Mulan Moon'
);

-- FROM CLAUSE SUB QUERY
SELECT first_name, last_name, title
FROM (
    SELECT first_name, last_name, title
    FROM actor
    INNER JOIN film_actor
    ON actor.actor_id=film_actor.actor_id
    INNER JOIN film
    ON film_actor.film_id=film.film_id
) AS actor_movie_titles
WHERE title = 'Mulan Moon';