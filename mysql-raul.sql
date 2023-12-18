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

-- LIKE
SELECT * FROM actor WHERE first_name LIKE 'A%' AND last_name LIKE 'B%';
SELECT * FROM actor WHERE first_name LIKE '%A' AND last_name LIKE '%N';

SELECT * FROM actor WHERE first_name LIKE '%NE%' AND last_name LIKE '%RO%';
SELECT * FROM actor WHERE first_name LIKE 'C%N' AND last_name LIKE 'G%';
SELECT * FROM film WHERE release_year = 2006 AND title LIKE 'ALI%';

-- INNER JOIN
SELECT * FROM film F
INNER JOIN language L ON(F.language_id = L.language_id);

-- cleaning code
SELECT F.title, f.description, f.release_year, L.name FROM film F
INNER JOIN language L ON(F.language_id = L.language_id);

SELECT A.address as Address, C.city as City FROM address A INNER JOIN city C ON(A.city_id=C.city_id);

-- RIGHT JOIN
SELECT 
c.customer_id,
c.first_name,
c.last_name,
a.actor_id,
a.first_name,
a.last_name
FROM customer c RIGHT JOIN actor a ON (c.last_name = a.last_name);

-- LEFT JOIN
SELECT 
c.customer_id,
c.first_name,
c.last_name,
a.actor_id,
a.first_name,
a.last_name
FROM customer c LEFT JOIN actor a ON (c.last_name = a.last_name);

-- Consulta la tabla address de la base de datos sakila.
-- Realiza un INNER JOIN con las tablas city y country
-- Mostrar las columnas address, city, country

SELECT a.address, c.city, co.country FROM address a 
INNER JOIN city c ON (a.city_id = c.city_id)
INNER JOIN country co ON (c.country_id = co.country_id);

-- Consulta la tabla customer de la base de datos sakila.
-- Realiza un LEFT JOIN con las tablas store y address
-- Mostrar las columnas first_name, address, store_id

SELECT c.first_name, a.address, s.store_id FROM customer c
LEFT JOIN store s ON (c.store_id = s.store_id)
LEFT JOIN address a ON (s.address_id = a.address_id);

-- Consulta la tabla rental de la base de datos sakila.
-- Realiza un INNER JOIN con la tabla staff
-- Mostrar las columnas rental_id, first_name

SELECT r.rental_id, s.first_name FROM rental r
INNER JOIN staff s ON (r.staff_id = s.staff_id);

-- Plus values amount
SELECT SUM(amount) FROM payment;

-- Plus multiples columns
SELECT inventory_id + film_id + store_id FROM inventory LIMIT 30;

-- Counter row db actor
SELECT COUNT(*) FROM actor; -- 200
SELECT COUNT(*) FROM category; -- 16

-- Get AVG
SELECT AVG(amount) FROM payment LIMIT 30;
SELECT AVG(rental_rate) FROM film LIMIT 30;

-- Get Max amount
SELECT MAX(amount) FROM payment;

-- Get MIN amount
SELECT MIN(amount) FROM payment;

-- count with rental_id db rental
SELECT COUNT(rental_id) FROM rental;

-- Max amount value
SELECT MAX(amount) FROM payment

-- Grouper by
SELECT last_name, COUNT(*) FROM actor GROUP BY last_name LIMIT 30;

SELECT c.customer_id, c.first_name, c.last_name, SUM(p.amount) 
FROM payment p INNER 
JOIN customer c ON (c.customer_id = p.customer_id) 
GROUP BY c.customer_id, first_name, c.last_name;

-- exercise group by
SELECT customer_id, MAX(rental_date) FROM rental GROUP BY customer_id;

-- use sentence HAVING
SELECT last_name, COUNT(*) FROM actor GROUP BY 1 HAVING COUNT(*)>3;

SELECT c.customer_id, c.last_name, c.first_name, SUM(p.amount) FROM payment p INNER JOIN customer c ON (p.customer_id = c.customer_id) GROUP BY 1,2,3 HAVING SUM(p.amount)<60 ORDER BY SUM(p.amount) DESC;

SELECT last_name, COUNT(last_name) FROM actor GROUP BY 1 HAVING COUNT(last_name)>2;