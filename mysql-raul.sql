-- init session mysql
-- mysql -u root -p

-- instruction instalation sakila-sql 
-- https://dev.mysql.com/doc/sakila/en/sakila-installation.html

-- import database sakila in local
-- mysql> SOURCE C:/temp/sakila-db/sakila-schema.sql;
-- mysql> SOURCE C:/temp/sakila-db/sakila-data.sql;

-- using sakila dabase
USE sakila;

-- display all database
SHOW DATABASES;

-- diplay all tables in sakila
SHOW TABLES;

-- display all actor;
SELECT * FROM ACTOR;

-- Column alias AS
SELECT actor_id AS Id, first_name AS Name, last_name AS LastName FROM actor LIMIT 10;

SELECT city_id AS ID, city, country_id AS 'COUNTRY ID', last_update AS 'LAST UPDATE' FROM CITY LIMIT 20;

-- distinct
SELECT DISTINCT(store_id) FROM CUSTOMER; -- 2

SELECT DISTINCT(customer_id) FROM payment; // 599

-- order by
SELECT * FROM country ORDER BY country DESC;

-- min and max value amount table payment
select distinct(amount) from payment order by amount asc;
select min(amount) from payment;
select max(amount) from payment;

-- select where
SELECT * FROM actor WHERE first_name = 'DAN';
SELECT * FROM city WHERE country_id = 102;
SELECT * FROM customer WHERE store_id = 1;

SELECT * FROM inventory WHERE film_id < 50;
SELECT DISTINCT amount FROM payment WHERE amount<3;

SELECT * FROM language WHERE name <> 'German';

--exercices select
SELECT description, release_year FROM film LIMIT 10;
SELECT * FROM film WHERE title = 'IMPACT ALADDIN';
SELECT * FROM payment WHERE amount > 0.99 LIMIT 100;

-- AND - OR - NOT
SELECT * FROM category WHERE NOT name='Action';
SELECT DISTINCT(RATING) FROM film WHERE NOT rating = 'PG';

SELECT * FROM payment WHERE customer_id = 36 AND amount > 0.99 AND staff_id = 1;
SELECT * FROM rental WHERE NOT staff_id = 1 AND customer_id > 250 AND inventory_id < 100;

-- IN
-- SELECT first_name FROM customer WHERE first_name = 'MARY' OR first_name = 'PATRICIA';
SELECT first_name FROM customer WHERE first_name IN('MARY','PATRICIA');

SELECT title FROM film WHERE special_features IN('Trailers','Deleted Scenes');
SELECT title FROM film WHERE special_features IN('Trailers','Deleted Scenes') AND rating IN('G','NC-17');
SELECT title FROM film WHERE special_features IN('Trailers','Deleted Scenes') AND rating IN('G','NC-17') AND length > 100;

SELECT * FROM category WHERE name NOT IN ('Action','Animation','Children');

SELECT * FROM film_text WHERE title IN ('ZORRO ARK', 'VIRGIN DAISY', 'UNITED PILOT');
SELECT * FROM city WHERE city IN ('Chiayi', 'Dongying', 'Fukuyama', 'Kilis');


-- USE BETWEEN
SELECT * FROM rental WHERE (customer_id BETWEEN 300 AND 350) AND staff_id = 1;
SELECT * FROM payment WHERE amount BETWEEN 3 AND 5;

-- USE NOT
SELECT * FROM payment WHERE amount NOT BETWEEN 3 AND 5;

-- EXERCICES
SELECT * FROM payment WHERE (amount BETWEEN 2.99 AND 4.99) AND (staff_id = 2) AND (customer_id BETWEEN 1 AND 2);
SELECT * FROM payment WHERE (amount BETWEEN 2.99 AND 4.99) AND (staff_id = 2) AND customer_id IN(1,2);

SELECT * FROM address WHERE city_id BETWEEN 300 AND 350;
SELECT * FROM film WHERE (rental_rate BETWEEN 0.99 AND 2.99) AND (length <= 50) AND (replacement_cost < 20);