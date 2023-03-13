CREATE DATABASE PRUEBA;

CREATE TABLE USUARIO(
    ID_USUARIO INT UNSIGNED PRIMARY KEY, -- UNSIGNED no negativos
    NOMBRE VARCHAR(50) NOT NULL UNIQUE, -- UNIQUE -- unico especial
    FECHA_RENOVACION DATE NOT NULL,
    MES_CADUCIDAD TINYINT(2) UNSIGNED ZEROFILL CHECK(MES_CADUCIDAD>=1 AND MES_CADUCIDAD <=12), --zerofill rellena con cero a la izquiera
    ANIO_CADUCIDAD YEAR CHECK(ANIO_CADUCIDAD >= 2023),
    GENERO ENUM("MASCULINO","FEMENINO") NOT NULL, -- solo permite MASCULINO y FEMENINO
    TIPO_USUARIO ENUM("GRATIS","DE_PAGO") NOT NULL DEFAULT "GRATIS"
);


-- importa base de datos CINE
-- crear database CINE
CREATE DATABASE CINE;

-- seleccionar database CINE
USE CINE;

-- en terminal escribir source <ruta del sql a importa>
source C:\Users\USER\Desktop\BACKUP-CINE\cine_BK.sql

-- desc = describe
DESC EMPLEADO;

-- para crear una nueva tabla con la estrcutura de una ya existente
-- LIMIT 0 para crear tabla vacía
CREATE TABLE EMPLEADOS_ANTIGUOS SELECT * FROM EMPLEADO LIMIT 0;

--insertar data en tabla empleados_antiguos
insert into empleados_antiguos values ("EMP0001","John McTiernan","EEUU");
insert into empleados_antiguos values ("EMP0002","Bruce Willis","Aleman");
insert into empleados_antiguos values ("EMP0003","Alan Rickman","Reino Unido");
insert into empleados_antiguos values ("EMP0004","Bonnie Bedelia","EEUU");
insert into empleados_antiguos values ("EMP0005","William Atherton","EEUU");
insert into empleados_antiguos values ("EMP0006","Vin Diesel","EEUU");
insert into empleados_antiguos values ("EMP0007","Dwayne Johnson","EEUU");
insert into empleados_antiguos values ("EMP0008","Michelle Rodriguez","EEUU");
insert into empleados_antiguos values ("EMP0009","Kurt Russell","EEUU");
insert into empleados_antiguos values ("EMP0010","Gary Gray","EEUU");
insert into empleados_antiguos values ("EMP0011","Leonardo DiCaprio","EEUU");      
insert into empleados_antiguos values ("EMP0012","Kate Winslet","Reino Unido");
insert into empleados_antiguos values ("EMP0013","Nicole Kidman","EEUU");
insert into empleados_antiguos values ("EMP0014","Fionnula Flanagan","Irlanda");
insert into empleados_antiguos values ("EMP0015","Patrick Wilson","EEUU");
insert into empleados_antiguos values ("EMP0016","Vera Farmiga","EEUU");
insert into empleados_antiguos values ("EMP0017","Paolo Agazi","Bolivia");
insert into empleados_antiguos values ("EMP0018","Gerardo Suarez","Bolivia");        
insert into empleados_antiguos values ("EMP0019","Pablo Echarri","Argentina");
insert into empleados_antiguos values ("EMP0020","Fernando Arze","Bolivia");
insert into empleados_antiguos values ("EMP0021","Cristian Mercado","Bolivia");
insert into empleados_antiguos values ("EMP0022","Gory Patiño","Bolivia");   

--verificar los datos agregados
SELECT * FROM EMPLEADOS_ANTIGUOS;

-- realizar backup de base de datos cine
--introducir en una nueva terminal la siguiente instrucción
'mysqldump -u root -p cine > E:\MOISES\tutorials\mysql-tutorial\backup\cine_bk.sql'

-- EXERCICES;
-- eliminar db cine
-- importar bd cine-copia.sql
-- Desplegar nombre y edad de todas las personas que tienen mayor a 35 años;
SELECT NOMBRE, EDAD FROM PERSONA WHERE EDAD > 35;

-- Desplegar título original, genero y clasificacion de todas las películas 'apta todo publico'
SELECT TITULO_ORIGINAL, GENERO, CLASIFICACION FROM PELICULA WHERE CLASIFICACION = 'Apta todo publico';

-- Desplegar en ordern descendente por edad el nombre y edad de las personas
SELECT NOMBRE, EDAD FROM PERSONA ORDER BY EDAD DESC;

-- Obtener la cantidad de empleados por pais
SELECT NACIONALIDAD, COUNT(*) FROM EMPLEADO GROUP BY NACIONALIDAD;