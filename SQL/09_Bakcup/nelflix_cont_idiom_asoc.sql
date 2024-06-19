-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: nelflix
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `cont_idiom_asoc`
--

LOCK TABLES `cont_idiom_asoc` WRITE;
/*!40000 ALTER TABLE `cont_idiom_asoc` DISABLE KEYS */;
INSERT INTO `cont_idiom_asoc` VALUES (1,1,'2024-06-19'),(1,2,'2024-06-19'),(1,3,'2024-06-19'),(1,4,'2024-06-19'),(1,5,'2024-06-19'),(1,6,'2024-06-19'),(2,1,'2024-06-19'),(2,3,'2024-06-19'),(2,5,'2024-06-19'),(3,1,'2024-06-19'),(3,2,'2024-06-19'),(3,3,'2024-06-19'),(3,6,'2024-06-19'),(4,1,'2024-06-19'),(5,1,'2024-06-19'),(5,2,'2024-06-19'),(5,3,'2024-06-19'),(5,4,'2024-06-19'),(5,5,'2024-06-19'),(5,6,'2024-06-19'),(6,1,'2024-06-19'),(6,2,'2024-06-19'),(6,3,'2024-06-19'),(6,6,'2024-06-19'),(7,1,'2024-06-19'),(7,2,'2024-06-19'),(8,1,'2024-06-19'),(9,2,'2024-06-19'),(9,3,'2024-06-19'),(9,4,'2024-06-19'),(9,5,'2024-06-19'),(10,1,'2024-06-19'),(11,1,'2024-06-19'),(11,2,'2024-06-19'),(11,3,'2024-06-19'),(11,5,'2024-06-19'),(12,1,'2024-06-19'),(12,3,'2024-06-19'),(12,6,'2024-06-19'),(13,1,'2024-06-19'),(14,1,'2024-06-19'),(15,2,'2024-06-19'),(15,3,'2024-06-19'),(15,4,'2024-06-19');
/*!40000 ALTER TABLE `cont_idiom_asoc` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_cont_idiom_asoc_insert` BEFORE INSERT ON `cont_idiom_asoc` FOR EACH ROW BEGIN
    SET NEW.f_insercion_as = CURDATE();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-19 13:16:24
