--How many actors are there with the last name ‘Wahlberg’?

select * from actor 
where last_name = 'Wahlberg';

-- How many payments were made between $3.99 and $5.99?

SELECT count (*) as Payment
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- What film does the store have the most of? (search in inventory)
SELECT film_id, COUNT(*) AS Total_copies
FROM inventory
GROUP BY film_id
ORDER BY Total_copies DESC
LIMIT 1;

--How many customers have the last name ‘William’?
select * from customer
where last_name = 'Williams';

--What store employee (get the id) sold the most rentals?

SELECT staff_id, COUNT(*) AS Total_rentals_sold
FROM rental
GROUP BY staff_id
ORDER BY Total_rentals_sold DESC
LIMIT 1;

-- How many different district names are there?
select district, count (*) as total_district
from address
group by district
order by total_district desc;


--What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(*) AS num_actors
FROM film_actor
GROUP BY film_id
ORDER BY num_actors DESC
LIMIT 1;

-- From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT COUNT(*) AS num_customers
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';

--How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
SELECT amount, COUNT(*) AS total_payments
FROM payment
JOIN rental ON payment.rental_id = rental.rental_id
JOIN customer ON rental.customer_id = customer.customer_id
WHERE customer.customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(*) > 250;

-- Within the film table, how many rating categories are there? And what rating has the most movies total?

SELECT COUNT(DISTINCT rating) AS num_rating_categories
FROM film;

SELECT rating, COUNT(*) AS num_movies
FROM film
GROUP BY rating
ORDER BY num_movies DESC
LIMIT 1;