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
-- Dumping data for table `dispositivos`
--

LOCK TABLES `dispositivos` WRITE;
/*!40000 ALTER TABLE `dispositivos` DISABLE KEYS */;
INSERT INTO `dispositivos` VALUES (1,1,'Tablet','Android','2024-05-01'),(2,2,'Celular','IOS','2024-05-02'),(3,1,'Computadora','Windows','2024-05-01'),(4,1,'Television','Google TV','2024-05-01'),(5,2,'Computadora','Linux','2024-05-02'),(6,3,'Celular','IOS','2024-05-03'),(7,4,'Tablet','Android','2024-05-04'),(8,1,'Celular','Android','2024-05-04'),(9,4,'Celular','IOS','2024-05-04'),(10,3,'Television','Android TV','2024-05-05'),(11,5,'Television','Android TV','2024-05-05'),(12,6,'Computadora','Windows','2024-05-06'),(13,5,'Celular','IOS','2024-05-06'),(14,6,'Celular','Android','2024-05-07'),(15,7,'Computadora','Windows','2024-05-07'),(16,8,'Tablet','Android','2024-05-08'),(17,9,'Celular','IOS','2024-05-09'),(18,9,'Computadora','Windows','2024-05-09'),(19,10,'Television','Google TV','2024-05-10'),(20,11,'Computadora','Linux','2024-05-11'),(21,11,'Celular','IOS','2024-05-12'),(22,12,'Tablet','Android','2024-05-12'),(23,12,'Celular','Android','2024-05-13'),(24,13,'Celular','IOS','2024-05-13'),(25,12,'Television','Android TV','2024-05-14'),(26,14,'Television','Android TV','2024-05-14'),(27,12,'Computadora','Windows','2024-05-15'),(28,15,'Celular','IOS','2024-05-15'),(29,15,'Celular','Android','2024-05-15'),(30,14,'Computadora','Windows','2024-05-15');
/*!40000 ALTER TABLE `dispositivos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_dispositivo_insert` BEFORE INSERT ON `dispositivos` FOR EACH ROW BEGIN
    INSERT INTO disp_auditoria 
    (usuario_sistema, tip_accion, descrip_accion, fecha, hora)
    VALUES 
    (USER(), 'INSERT', CONCAT('Dato insertado: ', NEW.id_dispositivo), CURDATE(), CURTIME());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_dispositivo_update` AFTER UPDATE ON `dispositivos` FOR EACH ROW BEGIN
	DECLARE descrip_accion_text TEXT;
    SET descrip_accion_text = 'Dato actualizado: ';
    
    IF OLD.id_usuario_disp <> NEW.id_usuario_disp THEN
		SET descrip_accion_text = CONCAT(descrip_accion_text, 'id_usuario_disp de ''',OLD.id_usuario_disp, ''' a ''', NEW.id_usuario_disp, '''; ');
	END IF;
    
    IF OLD.dispositivo <> NEW.dispositivo THEN
		SET descrip_accion_text = CONCAT(descrip_accion_text, 'dispositivo de ''',OLD.dispositivo, ''' a ''', NEW.dispositivo, '''; ');
	END IF;
    
    IF OLD.sist_operativo <> NEW.sist_operativo THEN
		SET descrip_accion_text = CONCAT(descrip_accion_text, 'sist_operativo de ''',OLD.sist_operativo, ''' a ''', NEW.sist_operativo, '''; ');
    END IF;
    
    IF OLD.f_insercion_disp <> NEW.f_insercion_disp THEN
		SET descrip_accion_text = CONCAT(descrip_accion_text, 'f_insercion_disp de ''',OLD.f_insercion_disp, ''' a ''', NEW.f_insercion_disp, '''; ');
    END IF;
    
    INSERT INTO disp_auditoria
    (usuario_sistema, tip_accion, descrip_accion, fecha, hora)
    VALUES 
    (USER(),'UPDATE', descrip_accion_text, CURDATE(), CURTIME());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_dispositivo_delete` BEFORE DELETE ON `dispositivos` FOR EACH ROW BEGIN
    INSERT INTO disp_auditoria 
    (usuario_sistema, tip_accion, descrip_accion, fecha, hora)
    VALUES 
    (USER(), 'DELETE', CONCAT('Dato borrado: ', OLD.id_dispositivo), CURDATE(), CURTIME());
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
