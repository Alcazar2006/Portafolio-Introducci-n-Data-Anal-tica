SELECT COUNT(*) AS film_count FROM film;
SELECT COUNT(*) AS actor_count FROM actor;
SELECT COUNT(*) AS film_category_count FROM film_category;
SELECT COUNT(*) AS category_count FROM category;
SELECT COUNT(*) AS customer_count FROM customer;
SELECT COUNT(*) AS payment_count FROM payment;
SELECT COUNT(*) AS rental_count FROM rental;
SELECT COUNT(*) AS inventory_count FROM inventory;
SELECT COUNT(*) AS store_count FROM store;
SELECT COUNT(*) AS staff_count FROM staff;
SELECT COUNT(*) AS film_actor_count FROM film_actor;
SELECT COUNT(*) AS city_count FROM city;
SELECT COUNT(*) AS address_count FROM address;
SELECT COUNT(*) AS language_count FROM language;
SELECT COUNT(*) AS country_count FROM country;


-- Query 1
SELECT ci.*, co.*
FROM city ci
JOIN country co ON ci.country_id = co.country_id;

-- Query 2
SELECT title, length
FROM film
WHERE length > 60;

-- Query 3
SELECT s.store_id, SUM(p.amount) AS total_revenue
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
JOIN store s ON c.store_id = s.store_id
GROUP BY s.store_id;

-- Query 4
SELECT title, rental_rate
FROM film
ORDER BY rental_rate DESC
LIMIT 1;

-- Query 5
SELECT city.city, COUNT(c.customer_id) AS num_customers
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ON a.city_id = city.city_id
GROUP BY city.city
ORDER BY num_customers DESC;