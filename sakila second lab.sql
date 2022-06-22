USE sakila;
----- In the table actor, which are the actors whose last names are not repeated? 
SELECT *
FROM actor
WHERE last_name NOT IN (
SELECT last_name 
FROM actor 
GROUP BY last_name
HAVING COUNT(last_name) >1
)
;
----- Which last names appear more than once?
SELECT * 
FROM actor 
WHERE last_name IN (
SELECT last_name 
FROM actor 
GROUP BY last_name
HAVING COUNT(last_name) >1
) 
;
----- How many rentals were processed by each employee
SELECT COUNT(staff_id)
FROM rental
WHERE staff_id = 1;

SELECT COUNT(staff_id)
FROM rental
WHERE staff_id = 2;

----- How many films were released each year
SELECT COUNT(release_year)
FROM film
 ORDER BY release_year;

----- Using the film table, find out for each rating how many films were there.
SELECT COUNT(film_id), film_id, rating
FROM film
GROUP BY rating;

----- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT ROUND(AVG(length),2), film_id, rating
FROM film
GROUP BY rating;

----- Which kind of movies (rating) have a mean duration of more than two hours?
SELECT rating, film_id, AVG(length)
FROM film
GROUP BY rating
HAVING AVG(length) > 120;

----- Rank films by length (filter out the rows that have nulls or 0s in length column).
----- In your output, only select the columns title, length, and the rank.
SELECT title, length, rating
FROM film 
WHERE length IS NOT NULL
ORDER BY length DESC;









