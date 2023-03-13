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

