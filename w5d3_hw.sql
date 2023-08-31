-- Question 1
SELECT customer_id, first_name, last_name, address, city, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country 
ON city.country_id = country.country_id
WHERE district = 'Texas';

-- Question 2
SELECT first_name, last_name, amount
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;

-- Question 3
SELECT store_id, first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);

-- Question 4
SELECT customer_id, first_name, last_name, address, city, country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city 
ON address.city_id = city.city_id
INNER JOIN country 
ON city.country_id = country.country_id
WHERE country = 'Nepal';

-- Question 5
SELECT first_name, last_name, COUNT(payment.payment_id) AS total_transactions
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id, first_name, last_name
ORDER BY total_transactions DESC
LIMIT 1;

-- Question 6
SELECT rating, COUNT (*) AS rating_movie_count
FROM film
GROUP BY rating
ORDER BY rating_movie_count DESC;

-- Question 7
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT payment.customer_id
	FROM payment
	WHERE payment.amount > 6.99
	GROUP BY payment.customer_id
	HAVING COUNT(payment.payment_id) = 1

);

-- Question 8
SELECT COUNT (*) AS free_rentals
FROM rental
JOIN payment 
ON rental.rental_id = payment.rental_id
WHERE payment.amount = 0;



