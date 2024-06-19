-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: usuario_final
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
-- Temporary view structure for view `vw_cant_disp_por_usuario`
--

DROP TABLE IF EXISTS `vw_cant_disp_por_usuario`;
/*!50001 DROP VIEW IF EXISTS `vw_cant_disp_por_usuario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_cant_disp_por_usuario` AS SELECT 
 1 AS `id_usuario`,
 1 AS `nombre_completo`,
 1 AS `cantidad_dispositivos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_usuarios_disp_celulares`
--

DROP TABLE IF EXISTS `vw_usuarios_disp_celulares`;
/*!50001 DROP VIEW IF EXISTS `vw_usuarios_disp_celulares`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_usuarios_disp_celulares` AS SELECT 
 1 AS `id_usuario`,
 1 AS `nombre_completo`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_dispositivos_usuarios`
--

DROP TABLE IF EXISTS `vw_dispositivos_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_dispositivos_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_dispositivos_usuarios` AS SELECT 
 1 AS `nombre_completo`,
 1 AS `id_dispositivo`,
 1 AS `id_usuario_disp`,
 1 AS `dispositivo`,
 1 AS `sist_operativo`,
 1 AS `f_insercion_disp`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_contenido_popular`
--

DROP TABLE IF EXISTS `vw_contenido_popular`;
/*!50001 DROP VIEW IF EXISTS `vw_contenido_popular`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_contenido_popular` AS SELECT 
 1 AS `titulo`,
 1 AS `calificacion`,
 1 AS `descripcion_calif`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_usuarios`
--

DROP TABLE IF EXISTS `vw_usuarios`;
/*!50001 DROP VIEW IF EXISTS `vw_usuarios`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_usuarios` AS SELECT 
 1 AS `id_usuario`,
 1 AS `nombre_completo`,
 1 AS `email`,
 1 AS `suscripcion`,
 1 AS `f_insercion_us`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_cant_disp_por_usuario`
--

/*!50001 DROP VIEW IF EXISTS `vw_cant_disp_por_usuario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_cant_disp_por_usuario` AS select `nelflix`.`usuarios`.`id_usuario` AS `id_usuario`,`nelflix`.`usuarios`.`nombre_completo` AS `nombre_completo`,count(`nelflix`.`dispositivos`.`id_dispositivo`) AS `cantidad_dispositivos` from (`nelflix`.`usuarios` left join `nelflix`.`dispositivos` on((`nelflix`.`usuarios`.`id_usuario` = `nelflix`.`dispositivos`.`id_usuario_disp`))) group by `nelflix`.`usuarios`.`id_usuario`,`nelflix`.`usuarios`.`nombre_completo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_usuarios_disp_celulares`
--

/*!50001 DROP VIEW IF EXISTS `vw_usuarios_disp_celulares`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_usuarios_disp_celulares` AS select `nelflix`.`usuarios`.`id_usuario` AS `id_usuario`,`nelflix`.`usuarios`.`nombre_completo` AS `nombre_completo`,`nelflix`.`usuarios`.`email` AS `email` from `nelflix`.`usuarios` where `nelflix`.`usuarios`.`id_usuario` in (select `nelflix`.`dispositivos`.`id_usuario_disp` from `nelflix`.`dispositivos` where (`nelflix`.`dispositivos`.`dispositivo` = 'celular')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_dispositivos_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_dispositivos_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_dispositivos_usuarios` AS select `u`.`nombre_completo` AS `nombre_completo`,`d`.`id_dispositivo` AS `id_dispositivo`,`d`.`id_usuario_disp` AS `id_usuario_disp`,`d`.`dispositivo` AS `dispositivo`,`d`.`sist_operativo` AS `sist_operativo`,`d`.`f_insercion_disp` AS `f_insercion_disp` from (`nelflix`.`usuarios` `u` join `nelflix`.`dispositivos` `d` on((`u`.`id_usuario` = `d`.`id_usuario_disp`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_contenido_popular`
--

/*!50001 DROP VIEW IF EXISTS `vw_contenido_popular`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_contenido_popular` AS select `nelflix`.`contenidos`.`titulo` AS `titulo`,`nelflix`.`calificaciones`.`calificacion` AS `calificacion`,`nelflix`.`calificaciones`.`descripcion_calif` AS `descripcion_calif` from (`nelflix`.`contenidos` join `nelflix`.`calificaciones` on((`nelflix`.`contenidos`.`id_contenido` = `nelflix`.`calificaciones`.`id_contenido_calif`))) order by `nelflix`.`calificaciones`.`calificacion` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_usuarios`
--

/*!50001 DROP VIEW IF EXISTS `vw_usuarios`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_usuarios` AS select `nelflix`.`usuarios`.`id_usuario` AS `id_usuario`,`nelflix`.`usuarios`.`nombre_completo` AS `nombre_completo`,`nelflix`.`usuarios`.`email` AS `email`,`nelflix`.`usuarios`.`suscripcion` AS `suscripcion`,`nelflix`.`usuarios`.`f_insercion_us` AS `f_insercion_us` from `nelflix`.`usuarios` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'usuario_final'
--

--
-- Dumping routines for database 'usuario_final'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-19 13:16:23
