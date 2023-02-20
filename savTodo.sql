-- MySQL dump 10.13  Distrib 5.7.36, for Win64 (x86_64)
--
-- Host: 172.16.100.100    Database: TODO
-- ------------------------------------------------------
-- Server version	5.5.5-10.5.15-MariaDB-0+deb11u1

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
-- Table structure for table `client`
--
create schema todo;
use todo;
DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `statut_juridique` varchar(255) NOT NULL,
  `siret` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Acme Inc.','SARL','1234567890','1 rue de la Paix'),(2,'Bob Corp.','SA','0987654321','2 avenue des Champs-Élysées'),(3,'Car Ltd.','SAS','1357911131','3 boulevard Saint-Michel');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projet`
--

DROP TABLE IF EXISTS `projet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `montant_previsionnel` decimal(10,2) NOT NULL,
  `date_livraison` date NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projet`
--

LOCK TABLES `projet` WRITE;
/*!40000 ALTER TABLE `projet` DISABLE KEYS */;
INSERT INTO `projet` VALUES (1,'Projet Acme',10000.00,'2022-01-01',1),(2,'Projet Bob',20000.00,'2022-02-01',2),(3,'Projet Car',30000.00,'2022-03-01',3),(4,'Projet Acme 2',15000.00,'2022-04-01',1);
/*!40000 ALTER TABLE `projet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salarie`
--

DROP TABLE IF EXISTS `salarie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salarie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `taux_horaire` decimal(10,2) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `actif` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salarie`
--

LOCK TABLES `salarie` WRITE;
/*!40000 ALTER TABLE `salarie` DISABLE KEYS */;
INSERT INTO `salarie` VALUES (1,'John','Doe',50.00,'john.doe@todo.fr','$2y$10$CJ7argo1coznv4GWoKWmauqrjLKozLayH6qOopOgACBsnW4p3q8x2',0),(2,'Jane','Doe',60.00,'jane.doe@todo.fr','$2y$10$wbG0wB/nnSsBJM9AV4TLi.swwJwoRDRSEWRsbMAtSX5BDmAtcV8FC',0),(9,'EKIZ','Devin',60.00,'quentin.028@hotmail.fr','$2y$10$2pb6QXwufmZ0OWYCn9LLVuXyr3nAt2fYWWChIDT7o3jQ/gv2hsIeK',0),(10,'GROSSE','Antonin',60.00,'antonin.grosse@lyceefulbert.fr','$2y$10$1ocKvNVKxiKXc1TuYH2B4u1LDGg2LOA4gtwkhUYYDGwooIRzXHg/q',0),(28,'test','test',60.00,'quentin.028@hotmail.fr','$2y$10$81sk1kEqX0cTALxL3Hhyp.BDuCfVr1iQKhRjjomzeY2SACWXhE1SS',0),(29,'GASSE','Matis',60.00,'matis.gasse@lyceefulbert.fr','$2y$10$/V4DjZi/QxTHaciSGj7uuuk2Rx8moQjHrmPSp2jucMj6pMW80cSmC',0),(31,'perez','benjamin',60.00,'benjaminperez1@outlook.fr','$2y$10$QIA9z/stYqSFXLHZ7T3R8O2gn/80S53W6ZVmfK9qhliAVaINsXXSe',0),(46,'GASSE','Matis',60.00,'matis.gasse28@lyceefulbert.fr','$2y$10$/mEOUSmFaODJ.o/J/2g8TO6IAYSPfAdOt9mrzEomub2gsM9UiZCva',0),(78,'Younes','YounesLEBG',60.00,'younes@gmail.com','$2y$10$s.y08b6bCOACVny15nn.GOhe5MS9Rfku6QvykPNW.LxHQzccQXYUO',0),(79,'kevin','ferrandon',60.00,'kferrandon@gmail.com','$2y$10$gUM0oposNQ2GGZJXBAr91.cmzKn1KUii0Vtl6qXc0FGrBvusMBnby',0),(80,'tooo','pop',60.00,'k@todo.fr','$2y$10$j7xi9yC7yeVa46t5FiMOyOqvmRcpbH3WvhscrUYXgnHfETCF5tfMu',0);
/*!40000 ALTER TABLE `salarie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tache`
--

DROP TABLE IF EXISTS `tache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tache`
--

LOCK TABLES `tache` WRITE;
/*!40000 ALTER TABLE `tache` DISABLE KEYS */;
INSERT INTO `tache` VALUES (1,'Tâche 1'),(2,'Tâche 2'),(3,'Tâche 3'),(4,'Tâche 4'),(5,'Tâche 5'),(6,'Tâche 6'),(7,'Tâche 7');
/*!40000 ALTER TABLE `tache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temps`
--

DROP TABLE IF EXISTS `temps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `temps_travail` int(11) NOT NULL,
  `tache_id` int(11) NOT NULL,
  `projet_id` int(11) NOT NULL,
  `salarie_id` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `tache_id` (`tache_id`),
  KEY `projet_id` (`projet_id`),
  KEY `salarie_id` (`salarie_id`),
  CONSTRAINT `temps_ibfk_1` FOREIGN KEY (`tache_id`) REFERENCES `tache` (`id`),
  CONSTRAINT `temps_ibfk_2` FOREIGN KEY (`projet_id`) REFERENCES `projet` (`id`),
  CONSTRAINT `temps_ibfk_3` FOREIGN KEY (`salarie_id`) REFERENCES `salarie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temps`
--

LOCK TABLES `temps` WRITE;
/*!40000 ALTER TABLE `temps` DISABLE KEYS */;
INSERT INTO `temps` VALUES (1,7,1,3,2,0);
/*!40000 ALTER TABLE `temps` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-02 13:56:04
