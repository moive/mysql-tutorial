-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: cine
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `Codigo_emp` varchar(10) NOT NULL,
  `Nombre_emp` varchar(100) NOT NULL,
  `Nacionalidad` varchar(70) NOT NULL,
  PRIMARY KEY (`Codigo_emp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES ('EMP0001','John McTiernan','EEUU'),('EMP0002','Bruce Willis','Alemania'),('EMP0003','Alan Rickman','Reino Unido'),('EMP0004','Bonnie Bedelia','EEUU'),('EMP0005','William Atherton','EEUU'),('EMP0006','Vin Diesel','EEUU'),('EMP0007','Dwayne Johnson','EEUU'),('EMP0008','Michelle Rodriguez','EEUU'),('EMP0009','Kurt Russell','EEUU'),('EMP0010','Gary Gray','EEUU'),('EMP0011','Leonardo DiCaprio','EEUU'),('EMP0012','Kate Winslet','Reino Unido'),('EMP0013','Nicole Kidman','EEUU'),('EMP0014','Fionnula Flanagan','Irlanda'),('EMP0015','Patrick Wilson','EEUU'),('EMP0016','Vera Farmiga','EEUU');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados_antiguos`
--

DROP TABLE IF EXISTS `empleados_antiguos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleados_antiguos` (
  `Codigo_emp` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Nombre_emp` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `Nacionalidad` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados_antiguos`
--

LOCK TABLES `empleados_antiguos` WRITE;
/*!40000 ALTER TABLE `empleados_antiguos` DISABLE KEYS */;
INSERT INTO `empleados_antiguos` VALUES ('EMP0001','John McTiernan','EEUU'),('EMP0002','Bruce Willis','Aleman'),('EMP0003','Alan Rickman','Reino Unido'),('EMP0004','Bonnie Bedelia','EEUU'),('EMP0005','William Atherton','EEUU'),('EMP0006','Vin Diesel','EEUU'),('EMP0007','Dwayne Johnson','EEUU'),('EMP0008','Michelle Rodriguez','EEUU'),('EMP0009','Kurt Russell','EEUU'),('EMP0010','Gary Gray','EEUU'),('EMP0011','Leonardo DiCaprio','EEUU'),('EMP0012','Kate Winslet','Reino Unido'),('EMP0013','Nicole Kidman','EEUU'),('EMP0014','Fionnula Flanagan','Irlanda'),('EMP0015','Patrick Wilson','EEUU'),('EMP0016','Vera Farmiga','EEUU'),('EMP0017','Paolo Agazi','Bolivia'),('EMP0018','Gerardo Suarez','Bolivia'),('EMP0019','Pablo Echarri','Argentina'),('EMP0020','Fernando Arze','Bolivia'),('EMP0021','Cristian Mercado','Bolivia'),('EMP0022','Gory Pati?o','Bolivia');
/*!40000 ALTER TABLE `empleados_antiguos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-13 16:11:33
