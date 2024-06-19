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
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'leandro garcia','leandrog@outlook.com','123abc',1,'2024-05-01'),(2,'liliana gonzales','liligonzalez@outlook.com','345def',1,'2024-05-02'),(3,'sofia benitez','sofibenitez@outlook.com','789ghi',0,'2024-05-03'),(4,'tomas ernesto diaz','tomasediaz@outlook.com','112jkl',1,'2024-05-04'),(5,'patricia rolan','patriciarolan@outlook.com','134llm',1,'2024-05-05'),(6,'brandon quintero','bquinteros@outlook.com','156nop',1,'2024-05-06'),(7,'natalia mora','nataliamora@outlook.com','178qrs',0,'2024-05-07'),(8,'luciano dinenno','lucianod@outlook.com','191tuv',1,'2024-05-08'),(9,'fabian sueiro','fabiansueiro@outlook.com','212wxy',1,'2024-05-09'),(10,'rocio juarez','rojuarez@outlook.com','234zab',1,'2024-05-10'),(11,'ignacio lucas rodriguez','ignaciolrodriguez@outlook.com','256cde',0,'2024-05-11'),(12,'felix ivan gomez','fivangomez@outlook.com','278efg',1,'2024-05-12'),(13,'bruno david fernandez','brunodfernandez@outlook.com','291hij',0,'2024-05-13'),(14,'jorge luis lopez','jorgeluisl@outlook.com','323kln',1,'2024-05-14'),(15,'tomas leandro martinez','tlmartinez@outlook.com','345mop',1,'2024-05-15');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_usuario_insert` AFTER INSERT ON `usuarios` FOR EACH ROW BEGIN
    INSERT INTO us_auditoria 
    (usuario_sistema, tip_accion, descrip_accion, fecha, hora)
    VALUES 
    (USER(), 'INSERT', CONCAT('Usuario creado: ', NEW.nombre_completo), CURDATE(), CURTIME());
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_usuario_update` AFTER UPDATE ON `usuarios` FOR EACH ROW BEGIN
	DECLARE descrip_accion_text TEXT;
    SET descrip_accion_text = 'Usuario actualizdo: ';
    
    IF OLD.nombre_completo <> NEW.nombre_completo THEN
		SET descrip_accion_text = CONCAT(descrip_accion_text, 'nombre_completo de ''',OLD.nombre_completo, ''' a ''', NEW.nombre_completo, '''; ');
	END IF;
    
    IF OLD.email <> NEW.email THEN
		SET descrip_accion_text = CONCAT(descrip_accion_text, 'email de ''',OLD.email, ''' a ''', NEW.email, '''; ');
    END IF;
    
    IF OLD.contrasena <> NEW.contrasena THEN
		SET descrip_accion_text = CONCAT(descrip_accion_text, 'contrasena cambiada: ');
    END IF;
    
    IF OLD.suscripcion <> NEW.suscripcion THEN
		SET descrip_accion_text = CONCAT(descrip_accion_text, 'suscripcion de ''',OLD.suscripcion, ''' a ''', NEW.suscripcion, '''; ');
    END IF;
    
    IF OLD.f_insercion_us <> NEW.f_insercion_us THEN
    SET descrip_accion_text = CONCAT(descrip_accion_text, 'f_insercion_us de ''',OLD.f_insercion_us, ''' a ''', NEW.f_insercion_us, '''; ');
    END IF;
    
    INSERT INTO us_auditoria
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_usuario_delete` AFTER DELETE ON `usuarios` FOR EACH ROW BEGIN
    INSERT INTO us_auditoria 
    (usuario_sistema, tip_accion, descrip_accion, fecha, hora)
    VALUES 
    (USER(), 'DELETE', CONCAT('Usuario eliminado: ', OLD.nombre_completo), CURDATE(), CURTIME());
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
