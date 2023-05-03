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