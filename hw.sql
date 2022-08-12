--1. Create a Stored Procedure that will insert a new film into the film table with the
--following arguments: title, description, release_year, language_id, rental_duration,
--rental_rate, length, replace_cost, rating

--2. Create a Stored Function that will take in a category_id and return the number of
--films in that category

--SELECT*
--FROM film;
--DROP FUNCTION add_film(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)


--CREATE OR REPLACE PROCEDURE add_film(
--	title varchar(255),
--	description TEXT,
--	release_year YEAR,
--	language_id int2,
--	rental_duration int2,
--	rental_rate numeric(4,2),
--	length int2,
--	replacement_cost numeric(5,2),
--	rating mpaa_rating
--)
--LANGUAGE plpgsql 
--AS $$ 
--BEGIN 
--	INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
--	VALUES(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating);
--END
--$$



--call add_film('New Movie', 'In a world far away....', 2,042, 1, 6, 7.99, 120, 20.99, 'R');

CREATE OR REPLACE PROCEDURE add_film2(
	title varchar(255),
	description TEXT,
	release_year YEAR,
	language_id integer,
	rental_duration integer,
	rental_rate numeric(4,2),
	length integer,
	replacement_cost numeric(5,2),
	rating mpaa_rating
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating)
	VALUES(title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating);
END
$$

CALL add_film2('New Movie', 'In a world far away....', 2042, 1, 6, 7.99, 120, 20.99, 'R');

SELECT *
FROM film
WHERE title LIKE 'New Movie';

---Q2
SELECT category_id, count(*)
FROM film_category
GROUP BY category_id;

cREATE OR REPLACE FUNCTION count_category_id(num integer)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
	DECLARE id_count INTEGER;
BEGIN
	SELECT COUNT(*) INTO id_count 
	FROM film_category
	WHERE category_id = num;
	RETURN id_count;
END;
$$

select count_category_id(15);