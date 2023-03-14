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

-- DATABASE ITUNES
CREATE DATABASE ITUNES;

-- CREATE TABLES
create table musica_rock(
    cod_music varchar(6) primary key,
    titulo varchar(40) not null,
    artista varchar(30) not null,
    album varchar(40) not null
);

create table musica_pop(
    cod_music varchar(6) primary key,
    titulo varchar(40) not null,
    artista varchar(30) not null,
    album varchar(40) not null
);

-- INSERT DATA
insert into musica_rock values ('mr001','Psychosocial','Slipknot','All Hope Is Gone');
insert into musica_rock values ('mr002','In the End','Linkin Park','Hybrid Theory');
insert into musica_rock values ('mr003','Welcome To The Jungle','Guns N Roses','Appetite for Destruction');
insert into musica_rock values ('mr004','Battery','Metallica','Master of Puppets');
insert into musica_rock values ('mr005','Whole Lotta Love','Led Zeppelin','Led Zeppelin II');
insert into musica_rock values ('mr006','Panama','Van Halen','1984s');


insert into musica_pop values ('mp001','Billie Jean','Michael Jackson','Thriller');
insert into musica_pop values ('mp002','Look What You Made Me Do','Taylor Swift','Reputation');
insert into musica_pop values ('mp003','I Feel It Coming','The Weeknd','Starboy');
insert into musica_pop values ('mp004','Love You like a Love Song','Selena Gomez','When the Sun Goes Down');
insert into musica_pop values ('mp005','Poker Face','Lady Gaga','The Fame');
insert into musica_pop values ('mp006','Boyfriend','Justin Bieber','Believe');


insert into musica_rock values ('mr007','crawling','Linkin Park','Hybrid Theory');
insert into musica_rock values ('mr008','Sweet Child O Mine','Guns N Roses','Appetite for Destruction');
insert into musica_pop values ('mp007','Paparazzi','Lady Gaga','The Fame');
insert into musica_pop values ('mp008','The Girl Is Mine','Michael Jackson','Thriller');

-- UNIR DOS TABLAS SIMILARES

SELECT * FROM MUSICA_POP
UNION
SELECT * FROM MUSICA_ROCK;


-- Seleccionar todas las canciones y sus autores correspondientes;
SELECT TITULO,ARTISTA FROM MUSICA_POP
UNION
SELECT TITULO,ARTISTA FROM MUSICA_ROCK;

-- Seleccionar todos los artistas con sus albunes y sus autores correspondientes
-- No se consideran valores repetidos
-- si hay data repedida solo solo mostrará uno de ellos
SELECT ARTISTA,ALBUM FROM MUSICA_POP
UNION
ALL -- si quieres mostrar todos añadir ALL después de UNION
SELECT ARTISTA, ALBUM FROM MUSICA_ROCK;

-- Seleccionar los albunes de todos los artistas donde solo se tomará en cuenta los álbunes pop
SELECT ALBUM, ARTISTA FROM MUSICA_POP
EXCEPT
SELECT ALBUM, ARTISTA FROM MUSICA_ROCK;

-- Otra forma si en caso EXCEPT no funciona
SELECT ALBUM, ARTISTA FROM MUSICA_POP
WHERE ALBUM NOT IN(SELECT ALBUM FROM MUSICA_ROCK);

-- Crear tabla datos_aritista
create table datos_artista(
    cod_artist varchar(6) primary key,
    artista  varchar(30) not null,
    disquera varchar(30) not null,
    album varchar(40) not null
);

--insertando data a la tabla datos_artista
insert into datos_artista values ('art001','Linkin Park','Universal Music Group','Hybrid Theory');
insert into datos_artista values ('art002','Guns N Roses','Sony Music Entertainment','Appetite for Destruction');
insert into datos_artista values ('art003','Metallica','Warner Music Group','Master of Puppets');
insert into datos_artista values ('art004','Van Halen','YG Entertainment','1984s');
insert into datos_artista values ('art005','Michael Jackson','Universal Music Group','Thriller');
insert into datos_artista values ('art006','Taylor Swift','Sony Music Entertainment','Reputation');
insert into datos_artista values ('art007','The Weeknd','Universal Music Group','Starboy');
insert into datos_artista values ('art008','Selena Gomez','Universal Music Group','When the Sun Goes Down');

-- Verificar las disqueras que trabajan con el género rock
SELECT ARTISTA, ALBUM FROM DATOS_ARTISTA
EXCEPT
SELECT ARTISTA, ALBUM FROM MUSICA_POP;

-- Obtener la cantidad de canciones pop por album, colocar un alias para clasificarlo
SELECT ARTISTA, ALBUM, COUNT(*) AS '# DE CANCIONES' FROM MUSICA_POP GROUP BY ALBUM;

-- Desplegar los empleados (nombre y nacionalidad) y las películas donde trabajaron (identificador de pélicula) utilizando el producto cartesiano

SELECT E.NOMBRE_EMP, E.NACIONALIDAD, T.IDENTIFICADOR
FROM EMPLEADO E,TRABAJA T
WHERE E.CODIGO_EMP = T.CODIGO_EMP;

--create database spotify
CREATE DATABASE SPOTIFY;
USE SPOTIFY;
'source C:\Users\USER\Desktop\BACKUP-CINE\copia_spotify.sql'

-- Desplegar el id_usuario, username, password y fecha de renovacion de la tarjeta paypal de los usuarios premium que pagan con paypal.
SELECT U.ID_USUARIO, U.USERNAME, U.PASSWORD, P.FECHA_RENOVACION
FROM USUARIO U, PREMIUM_PP P
WHERE U.ID_USUARIO = P.ID_USUARIO;


-- Desplegar los empleados (nombre y nacionalidad) y las películas donde trabajaron (indentificador de película) UTILIZANDO INNER JOIN.
SELECT E.NOMBRE_EMP,E.NACIONALIDAD,T.IDENTIFICADOR
FROM EMPLEADO E INNER JOIN TRABAJA T -- INNER JOIN en lugar de la ','
ON E.CODIGO_EMP = T.CODIGO_EMP; -- ON en lugar de WHERE en cartesian product

-- Desplegar el id_usuario, username, password y fecha de renovacion de la tarjeta de credito de los usuarios premium que pagan con tarjeta de credito usando INNER JOIN.
SELECT U.ID_USUARIO,U.USERNAME,U.PASSWORD,T.FECHA_RENOVACION
FROM USUARIO U INNER JOIN PREMIUM_TC T
ON U.ID_USUARIO = T.ID_USUARIO;

-- LEFT JOIN damos priordad a la tabla de la izquierda
-- RIGHT JOIN damos prioridad a la tabla de la derecha

-- eliminar database spotify
-- crear de nuevo database spotify
-- importar data
'source C:\Users\USER\Desktop\BACKUP-CINE\copia2_spotify.sql'

-- Seleccionar e id_album, titulo del album, titulo de la cancion y duracion de la cancion.
SELECT A.ID_ALBUM,A.TITULO,C.TITULO,C.DURACION
FROM ALBUM A LEFT JOIN CANCION C
ON A.ID_ALBUM = C.ID_ALBUM;

-- usando   RIGHT JOIN
SELECT A.ID_ALBUM,A.TITULO,C.TITULO,C.DURACION
FROM ALBUM A RIGHT JOIN CANCION C
ON A.ID_ALBUM = C.ID_ALBUM;


-- Desplegar titulo original de la película y todos los campos de la tabla trabaja
SELECT P.TITULO_ORIGINAL, T.*
FROM PELICULA P INNER JOIN TRABAJA T
ON P.IDENTIFICADOR = T.IDENTIFICADOR;

-- Seleccionar el id_aritsta, su alias y el titulo de la cancion de todos los artistas.
SELECT AR.ID_ARTISTA,AR.ALIAS,CA.TITULO
FROM ARTISTA AR INNER JOIN ALBUM AL
ON AR.ID_ARTISTA = AL.ID_ARTISTA
INNER JOIN CANCION CA
ON AL.ID_ALBUM = CA.ID_ALBUM;

-- agrupando por alias
SELECT AR.ID_ARTISTA,AR.ALIAS,CA.TITULO, COUNT(AR.ALIAS)
FROM ARTISTA AR INNER JOIN ALBUM AL
ON AR.ID_ARTISTA = AL.ID_ARTISTA
INNER JOIN CANCION CA
ON AL.ID_ALBUM = CA.ID_ALBUM
GROUP BY AR.ALIAS;

-- Desplegar el genero, pais de origen, titulo original con el codigo de empleado y el nombre del personaje que trabajaron en películas, donde su clasificación se 'Mayor a 15 años'
SELECT P.GENERO,P.PAIS_ORIGEN,P.TITULO_ORIGINAL,T.CODIGO_EMP,T.NOMBRE_PERSONAJE
FROM PELICULA P INNER JOIN TRABAJA T
ON P.IDENTIFICADOR = T.IDENTIFICADOR
AND P.CLASIFICACION = 'Mayor a 15 años';