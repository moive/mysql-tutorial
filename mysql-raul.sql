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