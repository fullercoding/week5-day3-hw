--1. List all customers who live in Texas (use JOINs)

Select first_name, last_name, district
FROM customer
JOIN address
On customer.address_id = address.address_id
WHERE district = 'Texas'

-- Answer: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still

--2. Get all payments above $6.99 with the Customer's Full Name

SELECT first_name, last_name, amount
FROM customer
JOIN payment
on payment.customer_id = customer.customer_id
WHERE amount > 6.99

--3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN
(SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING sum(amount) >= 175
ORDER BY sum(amount))

--4. List all customers that live in Nepal (use the city table)
Select first_name, last_name, country
from customer
JOIN address
ON address.address_id = customer.address_id
JOIN city
ON city.city_id = address.city_id
JOIN country
ON country.country_id = city.country_id
WHERE country = 'Nepal'

-- Answer: Kevin Schuler

--5. Which staff member had the most transactions?

Select staff_id, COUNT(staff_id)
from payment
GROUP BY staff_id

--Answer: staff_id 2 sold most

--6. How many movies of each rating are there?
SELECT COUNT(rating) AS total_ratings destinct
from film

--Come back to --

--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT first_name, last_name, amount
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE amount > 6.99
-- come back to -- 

--8. How many free rentals did our store give away?
Select COUNT(amount)
FROM payment
where amount = 0

-- Answer : 24 Free rentals