-- MySQL dump 10.16  Distrib 10.1.37-MariaDB, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: biblioteca
-- ------------------------------------------------------
-- Server version	10.1.37-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autores` (
  `ID_Autor` smallint(6) NOT NULL AUTO_INCREMENT,
  `nome_Autor` varchar(30) DEFAULT NULL,
  `sobrenome_Autor` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_Autor`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Daniel','Barret'),(2,'Gerald','Carter'),(3,'Mark','Sobell'),(4,'William','Stanek'),(5,'Richard','Blum'),(6,'Jostein','Gaarder'),(7,'Umberto','Eco'),(8,'Neil','De Grasse Tyson'),(9,'Stephen','Hawking'),(10,'Stephen','Jay Gould'),(11,'Charles','Darwin'),(12,'Alan','Turing'),(13,'Simon','Monk'),(14,'Paul','Scherz');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autores2`
--

DROP TABLE IF EXISTS `autores2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autores2` (
  `ID_Autor` smallint(6) NOT NULL AUTO_INCREMENT,
  `nome_Autor` varchar(30) DEFAULT NULL,
  `sobrenome_Autor` varchar(60) NOT NULL,
  PRIMARY KEY (`ID_Autor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores2`
--

LOCK TABLES `autores2` WRITE;
/*!40000 ALTER TABLE `autores2` DISABLE KEYS */;
/*!40000 ALTER TABLE `autores2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `ID_Categoria` smallint(6) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(30) NOT NULL DEFAULT 'Ficção',
  PRIMARY KEY (`ID_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (10,'Tecnologia'),(11,'História'),(12,'Literatura'),(13,'Astronomia');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoras`
--

DROP TABLE IF EXISTS `editoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editoras` (
  `ID_Editora` smallint(6) NOT NULL AUTO_INCREMENT,
  `nome_Editora` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Editora`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoras`
--

LOCK TABLES `editoras` WRITE;
/*!40000 ALTER TABLE `editoras` DISABLE KEYS */;
INSERT INTO `editoras` VALUES (1,'Prentice Hall'),(2,'O´Reilly'),(3,'Microsoft Press'),(4,'Wiley'),(5,'McGraw-Hill Education');
/*!40000 ALTER TABLE `editoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livros` (
  `ID_Livro` int(11) NOT NULL AUTO_INCREMENT,
  `nome_Livro` varchar(70) NOT NULL,
  `ID_Categoria` smallint(6) NOT NULL,
  `ID_Autor` smallint(6) NOT NULL,
  `ID_Editora` smallint(6) NOT NULL,
  `data_Pub` date NOT NULL,
  `preco_Livro` decimal(6,2) NOT NULL,
  `ISBN` char(13) DEFAULT NULL,
  PRIMARY KEY (`ID_Livro`),
  KEY `ID_Categoria` (`ID_Categoria`),
  KEY `ID_Autor` (`ID_Autor`),
  KEY `ID_Editora` (`ID_Editora`),
  CONSTRAINT `livros_ibfk_1` FOREIGN KEY (`ID_Categoria`) REFERENCES `categorias` (`ID_Categoria`),
  CONSTRAINT `livros_ibfk_2` FOREIGN KEY (`ID_Autor`) REFERENCES `autores` (`ID_Autor`),
  CONSTRAINT `livros_ibfk_3` FOREIGN KEY (`ID_Editora`) REFERENCES `editoras` (`ID_Editora`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (1,'Linux Command Line and Shell Scripting',10,5,4,'2015-01-09',68.35,'9781118983843'),(2,'SSH, o Shell Seguro',10,1,2,'2005-05-17',58.30,'9780596008956'),(3,'Using Samba',10,2,2,'2003-12-21',61.45,'9780596002565'),(4,'Fedora and Red Hat Linux',10,3,1,'2014-01-10',62.24,'9780133477436'),(5,'Windows Server 2012 Inside Out',10,4,3,'2013-01-25',66.80,'9780735666313'),(6,'Microsoft Exchange Server 2010',10,4,3,'2010-12-01',45.30,'9780735640610'),(7,'Practical Electronics for Inventors',10,13,5,'2016-03-24',67.80,'9781259587542');
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendas`
--

DROP TABLE IF EXISTS `vendas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vendas` (
  `ID_Venda` smallint(6) NOT NULL,
  `nome_Vendedor` varchar(20) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `produto` varchar(20) DEFAULT NULL,
  `cidade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Venda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendas`
--

LOCK TABLES `vendas` WRITE;
/*!40000 ALTER TABLE `vendas` DISABLE KEYS */;
INSERT INTO `vendas` VALUES (10,'Jorge',1400,'Mouse','São Paulo'),(12,'Tatiana',1220,'Teclado','São Paulo'),(14,'Ana',1700,'Teclado','Rio de Janeiro'),(15,'Rita',2120,'Webcam','Recife'),(18,'Marcos',980,'Mouse','São Paulo'),(19,'Carla',1120,'Webcam','Recife'),(22,'Roberto',3145,'Mouse','São Paulo');
/*!40000 ALTER TABLE `vendas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-07-22 13:12:18
