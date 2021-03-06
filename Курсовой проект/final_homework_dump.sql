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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-07  1:37:11
