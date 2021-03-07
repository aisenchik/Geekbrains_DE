-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: db_uber
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Temporary view structure for view `summary_stats`
--

DROP TABLE IF EXISTS `summary_stats`;
/*!50001 DROP VIEW IF EXISTS `summary_stats`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `summary_stats` AS SELECT 
 1 AS `mon`,
 1 AS `yea`,
 1 AS `orders`,
 1 AS `rides`,
 1 AS `MAU_pass`,
 1 AS `MAU_drivers`,
 1 AS `total_gmv`,
 1 AS `AVG_orders_per_pass`,
 1 AS `AVG_orders_per_driver`,
 1 AS `AVG_check`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tbl_ban`
--

DROP TABLE IF EXISTS `tbl_ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_ban` (
  `ban_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ban_reason` varchar(155) DEFAULT 'bad user',
  `created_at` varchar(45) NOT NULL DEFAULT 'CURRENT_TIMESTAMP',
  PRIMARY KEY (`ban_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_car_class`
--

DROP TABLE IF EXISTS `tbl_car_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_car_class` (
  `carclass_id` int unsigned NOT NULL,
  `carmodel_id` int unsigned NOT NULL,
  `carbrand_id` int unsigned NOT NULL,
  KEY `fk_tbl_car_class_tbl_class_name1_idx` (`carclass_id`),
  KEY `fk_tbl_car_class_tbl_carmodel1_idx` (`carmodel_id`),
  KEY `fk_tbl_car_class_tbl_carbrand1_idx` (`carbrand_id`),
  CONSTRAINT `fk_tbl_car_class_tbl_carbrand1` FOREIGN KEY (`carbrand_id`) REFERENCES `tbl_carbrand` (`carbrand_id`),
  CONSTRAINT `fk_tbl_car_class_tbl_carmodel1` FOREIGN KEY (`carmodel_id`) REFERENCES `tbl_carmodel` (`carmodel_id`),
  CONSTRAINT `fk_tbl_car_class_tbl_class_name1` FOREIGN KEY (`carclass_id`) REFERENCES `tbl_class_name` (`carclass_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_carbrand`
--

DROP TABLE IF EXISTS `tbl_carbrand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_carbrand` (
  `carbrand_id` int unsigned NOT NULL AUTO_INCREMENT,
  `carbrand_name` varchar(45) NOT NULL,
  PRIMARY KEY (`carbrand_id`),
  UNIQUE KEY `carbrand_name_UNIQUE` (`carbrand_name`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_carmodel`
--

DROP TABLE IF EXISTS `tbl_carmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_carmodel` (
  `carmodel_id` int unsigned NOT NULL AUTO_INCREMENT,
  `carmodel_name` varchar(45) NOT NULL,
  PRIMARY KEY (`carmodel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1123 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_city`
--

DROP TABLE IF EXISTS `tbl_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_city` (
  `city_id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `city_name` varchar(45) NOT NULL,
  `population` int DEFAULT NULL,
  `country_id` int unsigned NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `fk_tbl_city_tbl_country1_idx` (`country_id`),
  CONSTRAINT `fk_tbl_city_tbl_country1` FOREIGN KEY (`country_id`) REFERENCES `tbl_country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_class_name`
--

DROP TABLE IF EXISTS `tbl_class_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_class_name` (
  `carclass_id` int unsigned NOT NULL AUTO_INCREMENT,
  `class_name` varchar(45) NOT NULL,
  PRIMARY KEY (`carclass_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_country`
--

DROP TABLE IF EXISTS `tbl_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_country` (
  `country_id` int unsigned NOT NULL AUTO_INCREMENT,
  `country_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_geo`
--

DROP TABLE IF EXISTS `tbl_geo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_geo` (
  `order_id` int unsigned NOT NULL,
  `fromlatitude` float DEFAULT NULL,
  `fromlongitude` float DEFAULT NULL,
  `tolatitude` float DEFAULT NULL,
  `tolongitude` float DEFAULT NULL,
  `distance` float DEFAULT NULL,
  `duration` float DEFAULT NULL,
  KEY `fk_tbl_geo_tbl_order1_idx` (`order_id`),
  CONSTRAINT `fk_tbl_geo_tbl_order1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_order`
--

DROP TABLE IF EXISTS `tbl_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_order` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('done','cancel','delete') NOT NULL,
  `price` decimal(14,4) NOT NULL,
  `from` varchar(155) NOT NULL,
  `to` varchar(155) NOT NULL,
  `pass_id` int unsigned NOT NULL,
  `driver_id` int unsigned NOT NULL,
  `carclass_id` int unsigned NOT NULL,
  `city_id` int unsigned NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_tbl_order_tbl_user1_idx` (`pass_id`),
  KEY `fk_tbl_order_tbl_user2_idx` (`driver_id`),
  KEY `fk_tbl_order_tbl_class_name1_idx` (`carclass_id`),
  KEY `fk_tbl_order_tbl_city1_idx` (`city_id`),
  CONSTRAINT `fk_tbl_order_tbl_city1` FOREIGN KEY (`city_id`) REFERENCES `tbl_city` (`city_id`),
  CONSTRAINT `fk_tbl_order_tbl_class_name1` FOREIGN KEY (`carclass_id`) REFERENCES `tbl_class_name` (`carclass_id`),
  CONSTRAINT `fk_tbl_order_tbl_user1` FOREIGN KEY (`pass_id`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `fk_tbl_order_tbl_user2` FOREIGN KEY (`driver_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tbl_order_BEFORE_INSERT` BEFORE INSERT ON `tbl_order` FOR EACH ROW BEGIN
	IF NEW.pass_id = NEW.driver_id THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Trigger Warning! Pass_id = Driver_id';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tbl_order_log`
--

DROP TABLE IF EXISTS `tbl_order_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_order_log` (
  `order_id` int unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `stage` enum('cancel','create_order','start_ride','driver_arrived','complete') NOT NULL,
  KEY `fk_tbl_order_log_tbl_order1_idx` (`order_id`),
  CONSTRAINT `fk_tbl_order_log_tbl_order1` FOREIGN KEY (`order_id`) REFERENCES `tbl_order` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_user` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `mode` enum('passenger','driver') NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `city_id` int NOT NULL,
  `gender` enum('m','f') NOT NULL,
  `carmodel_id` int unsigned DEFAULT NULL,
  `carbrand_id` int unsigned DEFAULT NULL,
  `ban_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_tbl_user_tbl_carmodel1_idx` (`carmodel_id`),
  KEY `fk_tbl_user_tbl_carbrand1_idx` (`carbrand_id`),
  KEY `fk_tbl_user_tbl_ban1_idx` (`ban_id`),
  CONSTRAINT `fk_tbl_user_tbl_ban1` FOREIGN KEY (`ban_id`) REFERENCES `tbl_ban` (`ban_id`),
  CONSTRAINT `fk_tbl_user_tbl_carbrand1` FOREIGN KEY (`carbrand_id`) REFERENCES `tbl_carbrand` (`carbrand_id`),
  CONSTRAINT `fk_tbl_user_tbl_carmodel1` FOREIGN KEY (`carmodel_id`) REFERENCES `tbl_carmodel` (`carmodel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6001 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `users_cars`
--

DROP TABLE IF EXISTS `users_cars`;
/*!50001 DROP VIEW IF EXISTS `users_cars`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `users_cars` AS SELECT 
 1 AS `user_id`,
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `carbrand_name`,
 1 AS `carmodel_name`,
 1 AS `class_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'db_uber'
--

--
-- Dumping routines for database 'db_uber'
--
/*!50003 DROP FUNCTION IF EXISTS `last_activity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `last_activity`(for_user_id INT) RETURNS date
    READS SQL DATA
BEGIN
	DECLARE last_usage DATE;
    
    SELECT DATE(MAX(created_at))
    INTO last_usage
    FROM tbl_order to2
    WHERE pass_id = for_user_id OR driver_id = for_user_id
    AND status = 'done';
    
RETURN DATE(last_usage);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `summary_stats`
--

/*!50001 DROP VIEW IF EXISTS `summary_stats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `summary_stats` AS select `main_table`.`mon` AS `mon`,`main_table`.`yea` AS `yea`,`main_table`.`orders` AS `orders`,`main_table`.`rides` AS `rides`,`main_table`.`MAU_pass` AS `MAU_pass`,`main_table`.`MAU_drivers` AS `MAU_drivers`,`main_table`.`total_gmv` AS `total_gmv`,(`main_table`.`orders` / `main_table`.`MAU_pass`) AS `AVG_orders_per_pass`,(`main_table`.`orders` / `main_table`.`MAU_drivers`) AS `AVG_orders_per_driver`,(`main_table`.`total_gmv` / `main_table`.`orders`) AS `AVG_check` from (select month(`tbl_order`.`created_at`) AS `mon`,year(`tbl_order`.`created_at`) AS `yea`,count(`tbl_order`.`order_id`) AS `orders`,count(if((`tbl_order`.`status` = 'done'),`tbl_order`.`order_id`,NULL)) AS `rides`,count(distinct `tbl_order`.`pass_id`) AS `MAU_pass`,count(distinct `tbl_order`.`driver_id`) AS `MAU_drivers`,sum(if((`tbl_order`.`status` = 'done'),`tbl_order`.`price`,NULL)) AS `total_gmv` from `tbl_order` group by `yea`,`mon` order by `yea`,`mon`) `main_table` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users_cars`
--

/*!50001 DROP VIEW IF EXISTS `users_cars`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `users_cars` AS select `tu`.`user_id` AS `user_id`,`tu`.`first_name` AS `first_name`,`tu`.`last_name` AS `last_name`,`t_bra`.`carbrand_name` AS `carbrand_name`,`t_mod`.`carmodel_name` AS `carmodel_name`,`t_nam`.`class_name` AS `class_name` from ((((`tbl_user` `tu` left join `tbl_carmodel` `t_mod` on((`t_mod`.`carmodel_id` = `tu`.`carmodel_id`))) left join `tbl_carbrand` `t_bra` on((`t_bra`.`carbrand_id` = `tu`.`carbrand_id`))) left join `tbl_car_class` `t_cla` on(((`t_cla`.`carmodel_id` = `t_mod`.`carmodel_id`) and (`t_cla`.`carbrand_id` = `tu`.`carbrand_id`)))) left join `tbl_class_name` `t_nam` on((`t_nam`.`carclass_id` = `t_cla`.`carclass_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-07 21:53:14
