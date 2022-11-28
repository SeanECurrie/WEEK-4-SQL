-- 1. List all customers who live in Texas (use
-- JOINs)

select count(district)
FROM customer
INNER JOIN address
ON customer.address_id=address.address_id
WHERE district LIKE 'Texas';