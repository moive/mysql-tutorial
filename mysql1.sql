CREATE DATABASE salvadora;

SHOW DATABASES; -- muestra todas las bases de datos

USE salvadora;

CREATE TABLE CLIENTE (
    CI INT (10) NOT NULL,
    NOMBRE VARCHAR(20) NOT NULL,
    APELLIDO VARCHAR(20) NOT NULL,
    DIRECCION TEXT(50),
    TELEFONO INT(8),
    PRIMARY KEY (CI)
);


CREATE TABLE PROVEEDOR (
	ID_PROVEEDOR INT NOT NULL,
    NOMBRE VARCHAR(45) NULL,
    DIRECCION VARCHAR(45) NULL,
    TELEFONO INT(10) NULL,
    PRIMARY KEY (ID_PROVEEDOR)
);

SELECT * FROM PROVEEDOR;

CREATE TABLE PRODUCTO(
	COD_PRODUCTO INT(15) PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(22),
    MARCA VARCHAR(22),
    COLOR VARCHAR(22),
    STOCK INT(100),
    PRECIO FLOAT
)AUTO_INCREMENT = 100; -- el auto_increment: empieza en 100

SHOW TABLES;

-- agregar columna MODELO despues de COLOR
ALTER TABLE PRODUCTO
    ADD COLUMN MODELO VARCHAR(15) AFTER COLOR;

CREATE TABLE COMPRA(
	CI INT(13) NOT NULL,
    COD_PRODUCTO INT(15) NOT NULL,
    FECHA_COMPRA DATE,
    CANTIDAD INT(100),
    PRIMARY KEY (CI, COD_PRODUCTO)
);

SELECT * FROM COMPRA;

CREATE TABLE PROVEE (
	ID_PROVEEDOR INT(10) NOT NULL,
    COD_PRODUCTO INT(15) NOT NULL,
    FECHA DATE,
    CANTIDAD INT(100),
    PRIMARY KEY (ID_PROVEEDOR, COD_PRODUCTO)
);

DESCRIBE cliente; --muestra la estructura de la tabla
SHOW TABLES; -- muestra todas las tablas de salvadora;

INSERT INTO CLIENTE (CI,NOMBRE,APELLIDO,DIRECCION,TELEFONO)
    VALUE(335287,'Victor','Cruz','calle 4 z. Miraflores',77850451);

INSERT INTO CLIENTE (CI,NOMBRE,APELLIDO,DIRECCION,TELEFONO)
	VALUE(789564,'Victoria','Zarate','calle Las Begonias,  Miraflores',89750455);


DELETE FROM CLIENTE; -- elimina todos los registros de la tabla cliente


--insert datos a PRODUCTO
INSERT INTO PRODUCTO (COD_PRODUCTO,NOMBRE,MARCA,COLOR,MODELO,STOCK,PRECIO)
VALUES
(101, 'TOSTADORA','OSTER','ROJO','RT-8',34,1200),
(NULL,'LAVADORA','LG','GRIS','RT-7',20,23000);

-- Agregar foreign key (CI)
ALTER TABLE COMPRA ADD FOREIGN KEY (CI) REFERENCES CLIENTE(CI);

-- Agregar foreign key (COD_PRODUCTO)
ALTER TABLE COMPRA ADD FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTO(COD_PRODUCTO);

-- Mostrar los foreign key
select * from INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_NAME = 'COMPRA';

-- otra opcion:
SHOW CREATE TABLE PROVEE; -- se ve mejor en terminal que worbench

-- Agregar foreign key (ID_PROVEEDOR)
ALTER TABLE PROVEE ADD FOREIGN KEY (ID_PROVEEDOR) REFERENCES PROVEEDOR(ID_PROVEEDOR);

-- Agregar foreign key (COD_PRODUCTO)
ALTER TABLE PROVEE ADD FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTO(COD_PRODUCTO);

--establecer FECHA_COMPRA de la tabla COMPRA
ALTER TABLE COMPRA
    CHANGE FECHA_COMPRA
    FECHA_COMPRA TIMESTAMP NOT NULL
    DEFAULT CURRENT_TIMESTAMP;

INSERT INTO CLIENTE
    (CI,NOMBRE,APELLIDO,DIRECCION,TELEFONO)
VALUES
    (5798046,"WILDER","ARMELLA","CALLE R z pinos",7885428),
    (1834505,"DELICIA","CORTEZ","CALLE 56 z green",7254872),
    (2233046,"MERCEDES","MIRANDA","CALLE f z leon",7112081),
    (5543170,"EDDIE","PERALTA","CALLE 67 z golketa",7985412),
    (5785085,"JAIME","CRUZ","CALLE 80 z miraflores",7548352),
    (5008608,"EDWIN","RAMIREZ","CALLE 12 z fuel",7888021),
    (1830258,"SOLEDAD","FLORES","CALLE 4 z olivos",6654812),
    (1880804,"RAMIRO","BENITEZ","CALLE 2 z golveta",2579457),
    (1892870,"LAURA","CRUZ","plaza avaroa","1235798"),
    (7193156,"LUCERO","RAMIEZZ","CALLE 5 z golbert",12374387)
    ;
-- ...........................................................

INSERT INTO PRODUCTO
    (COD_PRODUCTO,NOMBRE,MARCA,COLOR,MODELO,STOCK,PRECIO)
VALUES
    (null,"lavajilla","balay","blanco","ju-301",15,31000),
    (null,"lavadora","sansung","gris","ity-65",15,700),
    (null,"cocina","dako","blanco","wqe-34",30,2400),
    (null,"Cafetera","eletrolux","blanco","ui-95",34,1250),
    (null,"tostadora","vidaelect","negro","ewq-65",15,2300),
    (null,"secadora","fell","azul","32-uy","34",2400),
    (null,"horno","continental","negro","12-fr",20,2120),
    (null,"lavadora","continental","negro","23-ip",24,3000),
    (null,"horno","continental","negro","81-th",10,1800),
    (null,"licuadora","electrolux","azul","10-br",24,4000),
    (null,"lavadora","oster","negro","17-nl",15,1250),
    (null,"sumidora","bsh","rojo","10-kl",15,1250),
    (null,"tostadora","continental","negro","13-am",30,2400),
    (null,"cocina","continental","verde","70-dm",34,2300),
    (null,"refrigerador","dako","gris","19-bf",20,3000),
    (null,"batidora","bsh","negro","96-za",10,1800),
    (null,"cafetera","continental","gris","ev-20",24,2300),
    (null,"refrigerador","continental","rojo","ay-90",15,1800),
    (null,"tostadora","bsh","blanco","77-kd",18,4000),
    (null,"sumidora","continental","rojo","34-tb",16,1250),
    (null,"licuadora","fell","verde","59-ax",16,1300),
    (null,"cocina","electrolux","negro","30-em",28,1500)
    ;
--..................................................................
INSERT INTO PROVEEDOR
    (ID_PROVEEDOR,NOMBRE,DIRECCION,TELEFONO)
VALUES
    (2018,"DORADO","CALLE 4 Z. OLIVOS",1694328),
    (2371,"COPACABANA","CALLE 6 Z. OBRAJES",7885412),
    (3249,"AURORA","CALLE 12 Z. SAN PEDRO",77364189),
    (2015,"LA PRIMERA","CALLE A Z. KOLVER",2256788),
    (1201,"DISMAC","CALLE 32 Z. SEYA",1279432)  
    ;

--.....................................................................
INSERT INTO COMPRA
    (CI,COD_PRODUCTO,FECHA_COMPRA,CANTIDAD)
VALUES
    (5798046,103,"2019-08-01",3),
    (1834505,102,"2019-08-02",2),
    (2233046,103,"2019-08-02",2),
    (5543170,104,"2019-08-03",4),
    (5785085,105,"2019-08-01",2),
    (5008608,106,"2019-08-04",1),
    (1830258,107,"2019-08-05",2),
    (1880804,108,"2019-08-06",4),
    (1892870,109,"2019-08-05",1),
    (7193156,110,"2019-08-06",3)
    ;
--....................................................................
INSERT INTO provee
    (ID_PROVEEDOR,COD_PRODUCTO,FECHA,CANTIDAD)
VALUES
    (2018,103,"2019-04-01",24),
    (2371,104,"2019-04-01",40),
    (3249,102,"2019-04-01",15),
    (2015,101,"2019-04-01",40),
    (1201,101,"2019-04-01",12),
    (2018,102,"2019-04-01",20),
    (2371,108,"2019-04-02",24),
    (3249,105,"2019-04-02",20),
    (2015,106,"2019-04-02",12),
    (2371,107,"2019-04-02",20),
    (3249,108,"2019-04-03",40),
    (2018,109,"2019-04-03",15),
    (1201,110,"2019-04-04",40),
    (3249,111,"2019-04-04",20),
    (2018,112,"2019-04-05",24),
    (2015,113,"2019-04-06",26),
    (2371,112,"2019-04-06",20),
    (2018,115,"2019-04-07",14),
    (1201,116,"2019-04-07",24),
    (2018,117,"2019-04-07",15),
    (3249,118,"2019-04-07",24),
    (2018,119,"2019-04-07",20),
    (1201,120,"2019-04-07",40),
    (2015,121,"2019-04-07",12),
    (3249,122,"2019-04-08",25),
    (1201,123,"2019-04-08",20),
    (2371,121,"2019-04-09",12),
    (2018,122,"2019-04-10",40),
    (3249,110,"2019-04-10",15)    
    ;


-- linea comando CMD para hacer backup
'mysqldump -u root -p --databases salvadora > E:\MOISES\tutorials\mysql-tutorial\backup\salvadora_bk.sql'

-- importar backup con linea de comando, despues de haber ingresado la credencial de mysql
'source E:\MOISES\tutorials\mysql-tutorial\backup\salvadora_bk.sql'

-- SELECT

SELECT NOMBRE, APELLIDO, TELEFONO FROM CLIENTE;
SELECT * FROM salvadora.cliente;


-- use where
SELECT * FROM cliente WHERE APELLIDO = 'CRUZ';
SELECT * FROM PRODUCTO WHERE MARCA = 'continental' AND PRECIO > 2000;

-- usando LIKE %: cualquier caracteres(plural) _ : cualquier caracter(singular)
SELECT NOMBRE,APELLIDO FROM CLIENTE WHERE APELLIDO LIKE "C%"; -- lista los apellidos que empiezan con C
SELECT * FROM PROVEEDOR WHERE ID_PROVEEDOR LIKE "%0%"; -- lista los ID_PROVEEDOR que tenga algun 0 cero
SELECT * FROM CLIENTE WHERE CI LIKE "18%"; -- lista los CI  que empiezan con 18
SELECT * FROM CLIENTE WHERE CI NOT LIKE "18%"; --list loc CI que no empiezan con 18
SELECT * FROM PRODUCTO WHERE COD_PRODUCTO LIKE "10_"; --lista los productos que tienen el cod_prod: 10_

-- usando BETWEEN
SELECT NOMBRE,MARCA,COLOR,PRECIO FROM PRODUCTO WHERE PRECIO BETWEEN 1500 AND 3000;

--aislando BETWEEN con NOT
SELECT NOMBRE,MARCA,COLOR,PRECIO FROM PRODUCTO WHERE PRECIO NOT BETWEEN 1500 AND 3000;

--usando IN para valores especificos
SELECT * FROM PRODUCTO WHERE PRECIO IN (1800,2300,3000);

--usando IN para filtrar string
SELECT NOMBRE,MARCA,COLOR FROM PRODUCTO WHERE COLOR IN('GRIS','ROJO','VERDE');

--obteniendo la suma del precio total con la función SUM
SELECT SUM(PRECIO) FROM PRODUCTO;

-- contando el total de elementos con la sentencia COUNT
SELECT COUNT(ID_PROVEEDOR) FROM PROVEEDOR;

-- obteniendo el valor mínimo con MIN()
SELECT MIN(PRECIO) FROM PRODUCTO;

-- obteniendo el valor máximo con MAX()
SELECT MAX(PRECIO) FROM PRODUCTO;

--sumar agrupando por marca
SELECT MARCA, SUM(PRECIO) FROM PRODUCTO GROUP BY MARCA;

--sumar agrupando por NOMBRE
SELECT NOMBRE, SUM(PRECIO) FROM PRODUCTO GROUP BY NOMBRE;

-- contando por marca
SELECT MARCA, COUNT(MARCA) FROM PRODUCTO GROUP BY (MARCA);

-- contar por marca pero, que sean de color negro
SELECT MARCA, COUNT(*) FROM PRODUCTO
    WHERE COLOR = 'negro'
    GROUP BY MARCA;

-- obtener el valor minimo por color
SELECT COLOR, MIN(PRECIO) FROM PRODUCTO GROUP BY COLOR;

-- obtener las marcas cuya suma de stock sea mayor a 30 -- HAVING FUNCTION() devuelve true o false
SELECT MARCA, SUM(STOCK) FROM PRODUCTO GROUP BY MARCA HAVING SUM(STOCK) > 30;

-- obtener la cantidad de colores que sean menores a 4
SELECT COLOR, COUNT(*) FROM PRODUCTO GROUP BY COLOR HAVING COUNT(*) < 4;

-- ordenar por color donde el precio sea el mínimo y menor a 2000;
SELECT COLOR, MIN(PRECIO) FROM PRODUCTO GROUP BY COLOR HAVING MIN(PRECIO) < 2000;

-- seleccionar por marca 'continental' y ordernarlo descendente
SELECT * FROM PRODUCTO WHERE MARCA = "continental" ORDER BY COD_PRODUCTO DESC;

-- seleccionar los productos por marca 'continental' y ordernarlos de manera descendente
SELECT NOMBRE FROM PRODUCTO WHERE MARCA = 'continental' ORDER BY NOMBRE DESC;

-- obtener los productos por marca ordenados por precio de manera descendente
SELECT COD_PRODUCTO, NOMBRE, MARCA,PRECIO FROM PRODUCTO WHERE MARCA = 'continental' ORDER BY PRECIO DESC;

-- EXERCICES

-- obtener los nombres de clientes de la empresa salvadora;
SELECT NOMBRES FROM CLIENTE;

-- obtener los nombres, marca y precio de los productos de la empresa salvadora;
SELECT NOMBRE,MARCA,PRECIO FROM PRODUCTO;

-- obtener todo los datos de los productos cuyo precio este entre 2000 y 3000
SELECT * FROM PRODUCTO WHERE PRECIO BETWEEN 2000 AND 3000;
SELECT * FROM PRODUCTO WHERE PRECIO >=2000 AND PRECIO <=3000;

-- obtener el número de productos cuyo precio sea igual a 1250
SELECT COUNT(*) FROM PRODUCTO WHERE PRECIO = 1250;

-- obtener el nombre, marca y el precio del producto mas barato.
SELECT NOMBRE,MARCA,PRECIO FROM WHERE PRECIO = (SELECT MIN(PRECIO) FROM PRODUCTO);

-- seleccionar todos los clientes que no tengan celular
SELECT NOMBRE, APELLIDO, TELEFONO FROM CLIENTE WHERE TELEFONO NOT LIKE "6%" AND TELEFONO NOT LIKE "7%";

--create database PRUEBA_DB
CREATE DATABASE PRUEBA_DB;

-- create table User
CREATE TABLE Usuario(
    CI INT(13) PRIMARY KEY,
    COD_PRODUCTO INT(13),
    FECHA_COMPRA DATE,
    CANTIDAD INT(15)
);

-- create table Services
CREATE TABLE Servicios(
    CI INT(13) PRIMARY KEY,
    COD_PRODUCTO INT(13),
    FECHA_COMPRA DATE,
    CANTIDAD INT(15),
    foreign key (COD_PRODUCTO) references PRODUCTO (COD_PRODUCTO)
);

--rename table Usuario
ALTER TABLE USUARIO RENAME CLIENTE;

-- eliminar la columna cantidad
ALTER TABLE CLIENTE DROP COLUMN CANTIDAD;

-- eliminar la columna stock, color
ALTER TABLE PRODUCTO DROP COLUMN STOCK, DROP COLUMN COLOR;

-- eliminar primary key de la tabla servicios
ALTER TABLE SERVICIOS DROP PRIMARY KEY;

-- eliminar llave foranea de la tabla servicios
ALTER TABLE SERVICIOS DROP FOREIGN KEY servicios_ibfk_1;

-- agregar campo TELEFONO
ALTER TABLE CLIENTE ADD TELEFONO INT(10);

-- agregar campo NOMBRE después del campo CI
ALTER TABLE CLIENTE ADD NOMBRE VARCHAR(15) AFTER CI;

-- agregar al inicio el campo CODIGO
ALTER TABLE CLIENTE ADD CODIGO INT(5) FIRST;

-- cambiar el campo TELEFONO por CELULAR
ALTER TABLE CLIENTE CHANGE TELEFONO CELULAR INT(10);


-- agregar el campo MODELO a producto
ALTER TABLE PRODUCTO  ADD MODELO VARCHAR(22);

--modificar el tipo de un campo;
ALTER TABLE PRODUCTO MODIFY MODELO INT(8) NOT NULL;