-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: r6ze0q02l4me77k3.chr7pe7iynqr.eu-west-1.rds.amazonaws.com    Database: pz47tf96hyu6txjp
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `agenda`
--

DROP TABLE IF EXISTS `agenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agenda` (
  `id_agenda` int NOT NULL AUTO_INCREMENT,
  `actif` bit(1) NOT NULL,
  `id_centre_medical` int DEFAULT NULL,
  `id_docteur` int DEFAULT NULL,
  `id_specialite` int DEFAULT NULL,
  PRIMARY KEY (`id_agenda`),
  KEY `FKkl5yi9x7v2et8xiubxjbog2os` (`id_centre_medical`),
  KEY `FKl70jugths914207e0lw0pg19y` (`id_docteur`),
  KEY `FK8m2g1q81dvymlyob8a0hnuhlt` (`id_specialite`),
  CONSTRAINT `FK8m2g1q81dvymlyob8a0hnuhlt` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id_specialite`),
  CONSTRAINT `FKkl5yi9x7v2et8xiubxjbog2os` FOREIGN KEY (`id_centre_medical`) REFERENCES `centre_medical` (`id_centre_medicale`),
  CONSTRAINT `FKl70jugths914207e0lw0pg19y` FOREIGN KEY (`id_docteur`) REFERENCES `docteur` (`id_docteur`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agenda`
--

LOCK TABLES `agenda` WRITE;
/*!40000 ALTER TABLE `agenda` DISABLE KEYS */;
INSERT INTO `agenda` VALUES (1,'',1,2,2),(2,'\0',2,2,1),(3,'',1,5,1),(4,'\0',2,5,2),(5,'',3,7,6),(6,'',1,7,3),(7,'\0',6,7,7),(8,'',1,12,1),(9,'',2,12,2);
/*!40000 ALTER TABLE `agenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centre_docteur_specialite`
--

DROP TABLE IF EXISTS `centre_docteur_specialite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centre_docteur_specialite` (
  `id_docteur` int NOT NULL,
  `id_specialite` int NOT NULL,
  `id_centre_medicale` int NOT NULL,
  PRIMARY KEY (`id_docteur`,`id_centre_medicale`),
  KEY `FKi4covgfj6iafpgom868tlfd3k` (`id_specialite`),
  KEY `FK9id5w7ib4jnwrhtm8jccf7e39` (`id_centre_medicale`),
  CONSTRAINT `FK9id5w7ib4jnwrhtm8jccf7e39` FOREIGN KEY (`id_centre_medicale`) REFERENCES `centre_medical` (`id_centre_medicale`),
  CONSTRAINT `FKaq051n1eg5s5dhqsj8iih54yp` FOREIGN KEY (`id_docteur`) REFERENCES `docteur` (`id_docteur`),
  CONSTRAINT `FKi4covgfj6iafpgom868tlfd3k` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id_specialite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centre_docteur_specialite`
--

LOCK TABLES `centre_docteur_specialite` WRITE;
/*!40000 ALTER TABLE `centre_docteur_specialite` DISABLE KEYS */;
INSERT INTO `centre_docteur_specialite` VALUES (2,1,2),(5,1,1),(12,1,1),(2,2,1),(5,2,2),(12,2,2),(7,3,1),(7,6,3),(7,7,6);
/*!40000 ALTER TABLE `centre_docteur_specialite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centre_medical`
--

DROP TABLE IF EXISTS `centre_medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centre_medical` (
  `id_centre_medicale` int NOT NULL AUTO_INCREMENT,
  `adresse` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_centre_medicale`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centre_medical`
--

LOCK TABLES `centre_medical` WRITE;
/*!40000 ALTER TABLE `centre_medical` DISABLE KEYS */;
INSERT INTO `centre_medical` VALUES (1,'14 Boulevard Jourdan, 75014','Institut Pasteur','01 73 93 23 23'),(2,'Avenue Garibaldi, 93400  ','Cabinet Henry',''),(3,'3 Rue Thénard, 75005 Paris','Centre de santé Saint-Michel','01 53 73 03 03'),(4,'Centre Accès Vision ','81 Rue Michel Ange, 75016 Paris','01 63 83 13 13'),(5,'52 Avenue du Général Michel Bizot, 75012 Paris','Centre de Santé APAS','01 47 07 77 77'),(6,'80 Rue des Entrepreneurs, 75015 Paris','Groupe Ophtalys','01 83 75 52 65');
/*!40000 ALTER TABLE `centre_medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docteur`
--

DROP TABLE IF EXISTS `docteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `docteur` (
  `adresse` varchar(255) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `id_docteur` int NOT NULL,
  PRIMARY KEY (`id_docteur`),
  CONSTRAINT `FKidaoc92ywpr98xnxlxs89y6d` FOREIGN KEY (`id_docteur`) REFERENCES `utilisateur` (`id_utilsateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docteur`
--

LOCK TABLES `docteur` WRITE;
/*!40000 ALTER TABLE `docteur` DISABLE KEYS */;
INSERT INTO `docteur` VALUES ('1 Boulevard Jourdan','Dupont','Pierre','0660254563',2),('1 Boulevard Jourdan','Martin','Alain','0660254563',5),('1 Boulevard Jourdan','monroq','alain','0660254563',7),('adresse','docteur','docteur','0660234567',12);
/*!40000 ALTER TABLE `docteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `adresse` varchar(255) DEFAULT NULL,
  `anneeDeNaissance` int NOT NULL,
  `compte_actif` bit(1) DEFAULT NULL,
  `nom` varchar(255) DEFAULT NULL,
  `prenom` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `id_patient` int NOT NULL,
  PRIMARY KEY (`id_patient`),
  CONSTRAINT `FK955d15ptnvs5r94aa3vh7pjg9` FOREIGN KEY (`id_patient`) REFERENCES `utilisateur` (`id_utilsateur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('Paris 14',1990,'','Dubois','Nicholas','0660254563',4),('1 Boulevard Jourdan',1993,'','Martin','Pierre','0660254563',6),('adresse',1990,'','patient','patient','0623456789',10);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rendez_vous`
--

DROP TABLE IF EXISTS `rendez_vous`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rendez_vous` (
  `id_rendez_vous` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `id_agenda` int DEFAULT NULL,
  `id_patient` int DEFAULT NULL,
  PRIMARY KEY (`id_rendez_vous`),
  KEY `FKioq4v6x7u76hu4tqgb0tpx0m` (`id_agenda`),
  KEY `FKdr5rw99v3d270m8ax89huphda` (`id_patient`),
  CONSTRAINT `FKdr5rw99v3d270m8ax89huphda` FOREIGN KEY (`id_patient`) REFERENCES `patient` (`id_patient`),
  CONSTRAINT `FKioq4v6x7u76hu4tqgb0tpx0m` FOREIGN KEY (`id_agenda`) REFERENCES `agenda` (`id_agenda`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rendez_vous`
--

LOCK TABLES `rendez_vous` WRITE;
/*!40000 ALTER TABLE `rendez_vous` DISABLE KEYS */;
INSERT INTO `rendez_vous` VALUES (16,'2021-02-25 08:00:00','disponible',5,NULL),(17,'2021-02-25 09:00:00','disponible',5,NULL),(18,'2021-02-25 08:30:00','disponible',5,NULL),(19,'2021-02-25 09:30:00','disponible',5,NULL),(20,'2021-02-25 10:00:00','indisponible',5,NULL),(21,'2021-02-25 10:30:00','indisponible',5,NULL),(22,'2021-02-25 11:00:00','indisponible',5,NULL),(23,'2021-02-25 11:30:00','disponible',6,NULL),(24,'2021-02-25 12:00:00','disponible',6,NULL),(25,'2021-02-25 12:30:00','disponible',6,NULL),(26,'2021-02-25 13:00:00','indisponible',6,NULL),(27,'2021-02-25 13:30:00','indisponible',6,NULL),(28,'2021-02-25 14:00:00','indisponible',6,NULL),(29,'2021-11-15 07:00:00','disponible',8,NULL),(30,'2021-11-15 07:30:00','disponible',8,NULL),(31,'2021-11-15 08:00:00','disponible',8,NULL),(32,'2021-11-15 08:30:00','disponible',8,NULL),(33,'2021-11-15 09:00:00','disponible',8,NULL),(34,'2021-11-15 09:30:00','disponible',8,NULL),(35,'2021-11-15 10:30:00','disponible',8,NULL),(36,'2021-11-15 10:00:00','disponible',8,NULL),(37,'2021-11-15 11:00:00','disponible',8,NULL),(38,'2021-11-15 11:30:00','disponible',8,NULL),(39,'2021-11-15 12:00:00','disponible',8,NULL),(40,'2021-11-15 12:30:00','disponible',8,NULL),(41,'2021-11-15 13:00:00','disponible',8,NULL),(42,'2021-11-15 13:30:00','disponible',8,NULL),(43,'2021-11-15 14:00:00','disponible',8,NULL),(44,'2021-11-15 14:30:00','disponible',8,NULL),(45,'2021-11-15 15:00:00','disponible',8,NULL),(46,'2021-11-15 15:30:00','disponible',8,NULL),(47,'2021-11-15 16:00:00','disponible',8,NULL),(48,'2021-11-15 16:30:00','disponible',8,NULL),(49,'2021-11-17 07:00:00','disponible',8,NULL),(50,'2021-11-17 07:30:00','disponible',8,NULL),(51,'2021-11-17 08:30:00','disponible',8,NULL),(52,'2021-11-17 10:00:00','disponible',8,NULL),(53,'2021-11-17 09:30:00','disponible',8,NULL),(54,'2021-11-17 09:00:00','disponible',8,NULL),(55,'2021-11-17 08:00:00','disponible',8,NULL),(56,'2021-11-09 07:00:00','disponible',9,NULL),(57,'2021-11-09 08:00:00','disponible',9,NULL),(58,'2021-11-09 07:30:00','disponible',9,NULL),(59,'2021-11-09 08:30:00','disponible',9,NULL),(60,'2021-11-09 09:00:00','disponible',9,NULL),(61,'2021-11-09 09:30:00','disponible',9,NULL),(62,'2021-11-09 10:00:00','disponible',9,NULL),(63,'2021-11-09 11:00:00','disponible',9,NULL),(64,'2021-11-09 10:30:00','disponible',9,NULL),(65,'2021-11-09 11:30:00','disponible',9,NULL),(66,'2021-11-09 12:00:00','disponible',9,NULL),(67,'2021-11-09 12:30:00','disponible',9,NULL),(68,'2021-11-09 13:00:00','disponible',9,NULL),(69,'2021-11-09 13:30:00','disponible',9,NULL);
/*!40000 ALTER TABLE `rendez_vous` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rendez_vous_annulee`
--

DROP TABLE IF EXISTS `rendez_vous_annulee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rendez_vous_annulee` (
  `id` int NOT NULL,
  `date` datetime DEFAULT NULL,
  `id_agenda` int DEFAULT NULL,
  `id_patient` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK795sm65tyf93cmworwn97e0jd` (`id_agenda`),
  KEY `FKf9tctfq39hxkklfkog2escir5` (`id_patient`),
  CONSTRAINT `FK795sm65tyf93cmworwn97e0jd` FOREIGN KEY (`id_agenda`) REFERENCES `agenda` (`id_agenda`),
  CONSTRAINT `FKf9tctfq39hxkklfkog2escir5` FOREIGN KEY (`id_patient`) REFERENCES `patient` (`id_patient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rendez_vous_annulee`
--

LOCK TABLES `rendez_vous_annulee` WRITE;
/*!40000 ALTER TABLE `rendez_vous_annulee` DISABLE KEYS */;
/*!40000 ALTER TABLE `rendez_vous_annulee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialite` (
  `id_specialite` int NOT NULL AUTO_INCREMENT,
  `libelle` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_specialite`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialite`
--

LOCK TABLES `specialite` WRITE;
/*!40000 ALTER TABLE `specialite` DISABLE KEYS */;
INSERT INTO `specialite` VALUES (1,'Généraliste'),(2,'Dermatologie'),(3,'Endocrinologie'),(4,'Cardiologie'),(5,'Gynécologie'),(6,'Néphrologie'),(7,'Ophtalmologie');
/*!40000 ALTER TABLE `specialite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `id_utilsateur` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `type_utilisateur` varchar(255) NOT NULL,
  PRIMARY KEY (`id_utilsateur`),
  UNIQUE KEY `UK_35ysk0sh9ruwixrld3nc0weut` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'admin@heal.com','admin','admin'),(2,'pierre_dupont@gmail.com','123456','docteur'),(4,'nicholas_dubois@gmail.com','123456','patient'),(5,'alain_martin@gmail.com','123456','docteur'),(6,'pierre_martin@gmail.com','123456','patient'),(7,'alain.monroq@gmail.com','123456','docteur'),(10,'patient@gmail.com','123456','patient'),(12,'docteur@gmail.com','123456','docteur');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pz47tf96hyu6txjp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-13 18:19:24
