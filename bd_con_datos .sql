CREATE DATABASE  IF NOT EXISTS `ecomerce_algo` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecomerce_algo`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: ecomerce_algo
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(125) NOT NULL,
  `lastName` varchar(125) NOT NULL,
  `email` varchar(100) NOT NULL,
  `mobile` varchar(25) NOT NULL,
  `address` text NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `confirmCode` varchar(10) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ofname` text NOT NULL,
  `pid` int NOT NULL,
  `quantity` int NOT NULL,
  `oplace` text NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `dstatus` varchar(10) NOT NULL DEFAULT 'no',
  `odate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ddate` date DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uid` int DEFAULT NULL,
  `id_pedido` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (62,'Ferdor',22,1,'local','0000','borrador','2022-09-11 20:50:20','2022-09-11','2022-09-11 20:50:20',18,'20220911205020ferdor'),(65,'Jilit',34,5,'CL 89 CR 10 -245','3003003030','vendido','2022-09-11 20:51:38','2022-09-20','2022-09-12 20:35:49',17,'20220912203549jilit'),(66,'Jilit',24,5,'CL 89 CR 10 -245','3003003030','vendido','2022-09-11 20:51:54','2022-09-13','2022-09-12 20:40:17',17,'20220912204017jilit'),(69,'Jilit',22,5,'CL 89 CR 10 -245','3003003030','vendido','2022-09-12 20:34:27','2022-09-20','2022-09-12 20:43:15',17,'20220912204315jilit'),(70,'Jilit',26,8,'CL 89 CR 10 -245','3003003030','vendido','2022-09-12 20:34:27','2022-09-21','2022-09-12 20:52:14',17,'20220912205214jilit'),(71,'Jilit',28,9,'CL 89 CR 10 -245','3003003030','vendido','2022-09-12 20:34:27','2022-09-21','2022-09-12 20:52:14',17,'20220912205214jilit'),(72,'Jilit',33,10,'CL 89 CR 10 -245','3003003030','vendido','2022-09-12 20:34:27','2022-09-21','2022-09-12 20:52:14',17,'20220912205214jilit'),(73,'kima',22,2,'CL 89 CR 10 -245','65546554654','vendido','2022-09-12 20:53:46','2022-09-28','2022-09-12 21:23:14',16,'20220912212314kima'),(74,'kima',23,4,'CL 89 CR 10 -245','65546554654','vendido','2022-09-12 20:53:46','2022-09-28','2022-09-12 21:23:14',16,'20220912212314kima'),(77,'kima',28,3,'CL 89 CR 10 -245','65546554654','vendido','2022-09-12 20:53:46','2022-09-28','2022-09-12 21:23:14',16,'20220912212314kima'),(78,'kima',31,1,'CL 89 CR 10 -245','65546554654','vendido','2022-09-12 20:53:46','2022-09-28','2022-09-12 21:23:14',16,'20220912212314kima'),(79,'kima',34,1,'CL 89 CR 10 -245','65546554654','vendido','2022-09-12 20:53:53','2022-09-28','2022-09-12 21:23:14',16,'20220912212314kima'),(80,'kima',22,4,'CL 89 CR 10 -245','3003003030','vendido','2022-09-12 21:25:29','2022-09-20','2022-09-12 21:25:49',16,'20220912212549kima'),(81,'kima',23,2,'CL 89 CR 10 -245','3003003030','vendido','2022-09-12 21:25:29','2022-09-20','2022-09-12 21:25:49',16,'20220912212549kima'),(82,'kima',24,2,'CL 89 CR 10 -245','3003003030','vendido','2022-09-12 21:25:29','2022-09-20','2022-09-12 21:25:49',16,'20220912212549kima'),(83,'kima',25,1,'CL 89 CR 10 -245','3003003030','vendido','2022-09-12 21:25:29','2022-09-20','2022-09-12 21:25:49',16,'20220912212549kima'),(84,'kima',26,2,'CL 89 CR 10 -245','3003003030','vendido','2022-09-12 21:25:29','2022-09-20','2022-09-12 21:25:49',16,'20220912212549kima'),(85,'kima',28,1,'CL 89 CR 10 -245','3003003030','vendido','2022-09-12 21:25:29','2022-09-20','2022-09-12 21:25:49',16,'20220912212549kima'),(86,'kima',29,1,'CL 89 CR 10 -245','3003003030','vendido','2022-09-12 21:25:29','2022-09-20','2022-09-12 21:25:49',16,'20220912212549kima'),(87,'kima',22,1,'av 1110 cr 45 89','3006007070','vendido','2022-09-12 21:28:17','2022-09-25','2022-09-12 21:28:43',16,'20220912212843kima'),(88,'kima',24,1,'av 1110 cr 45 89','3006007070','vendido','2022-09-12 21:28:17','2022-09-25','2022-09-12 21:28:43',16,'20220912212843kima'),(89,'kima',25,1,'av 1110 cr 45 89','3006007070','vendido','2022-09-12 21:28:17','2022-09-25','2022-09-12 21:28:44',16,'20220912212843kima'),(90,'kima',22,1,'av 1110 cr 45 89','3003003030','vendido','2022-09-12 21:29:45','2022-09-20','2022-09-12 21:29:55',16,'20220912212955kima'),(92,'kima',31,1,'KR 1225 AV 89 -78','30005005050','vendido','2022-09-12 21:43:03','2022-09-13','2022-09-12 21:57:06',16,'20220912215706kima'),(93,'kima',32,1,'KR 1225 AV 89 -78','30005005050','vendido','2022-09-12 21:43:03','2022-09-13','2022-09-12 21:57:06',16,'20220912215706kima'),(94,'kima',22,1,'KR 1225 AV 89 -78','30005005050','vendido','2022-09-12 21:46:48','2022-09-13','2022-09-12 21:57:06',16,'20220912215706kima'),(95,'kima',29,1,'KR 1225 AV 89 -78','30005005050','vendido','2022-09-12 21:46:48','2022-09-13','2022-09-12 21:57:06',16,'20220912215706kima'),(96,'kima',22,3,'orale a la derecha','65546554654','vendido','2022-09-12 22:27:01','2022-09-13','2022-09-12 22:27:20',16,'20220912222720kima'),(97,'kima',24,3,'orale a la derecha','65546554654','vendido','2022-09-12 22:27:01','2022-09-13','2022-09-12 22:27:20',16,'20220912222720kima'),(98,'kima',25,2,'orale a la derecha','65546554654','vendido','2022-09-12 22:27:01','2022-09-13','2022-09-12 22:27:20',16,'20220912222720kima'),(99,'kima',28,2,'orale a la derecha','65546554654','vendido','2022-09-12 22:27:01','2022-09-13','2022-09-12 22:27:20',16,'20220912222720kima'),(100,'kima',29,1,'orale a la derecha','65546554654','vendido','2022-09-12 22:27:01','2022-09-13','2022-09-12 22:27:20',16,'20220912222720kima'),(101,'kima',22,4,'En alguna parte de allá','+57 300 6052717','vendido','2022-09-12 22:39:38','2022-09-14','2022-09-12 22:39:59',16,'20220912223959kima'),(102,'kima',29,3,'En alguna parte de allá','+57 300 6052717','vendido','2022-09-12 22:39:38','2022-09-14','2022-09-12 22:39:59',16,'20220912223959kima'),(103,'kima',30,2,'En alguna parte de allá','+57 300 6052717','vendido','2022-09-12 22:39:38','2022-09-14','2022-09-12 22:39:59',16,'20220912223959kima'),(112,'Soy un amigo nuevo',26,1,'av 1110 cr 45 89','3003003030','vendido','2022-09-13 21:49:13','2022-09-29','2022-09-13 21:50:49',19,'20220913215049nuevo10'),(113,'Soy un amigo nuevo',34,1,'av 1110 cr 45 89','3003003030','vendido','2022-09-13 21:49:30','2022-09-29','2022-09-13 21:50:49',19,'20220913215049nuevo10'),(114,'Soy un amigo nuevo',33,1,'av 1110 cr 45 89','3003003030','vendido','2022-09-13 21:49:42','2022-09-29','2022-09-13 21:50:49',19,'20220913215049nuevo10'),(117,'Soy un amigo nuevo',22,1,'av 1110 cr 45 89','3003003030','vendido','2022-09-13 22:05:45','2022-09-14','2022-09-13 22:05:59',19,'20220913220559nuevo10'),(118,'Soy un amigo nuevo',25,1,'av 1110 cr 45 89','3003003030','vendido','2022-09-13 22:05:45','2022-09-14','2022-09-13 22:05:59',19,'20220913220559nuevo10'),(120,'Soy un amigo nuevo',22,1,'av 1110 cr 45 89','3003003030','vendido','2022-09-13 22:21:35','2022-09-19','2022-09-13 22:21:45',19,'20220913222145nuevo10'),(121,'Soy un amigo nuevo',22,5,'CL 89 CR 10 -245','3003003030','vendido','2022-09-13 23:15:45','2022-09-18','2022-09-13 23:30:00',19,'20220913233000nuevo10'),(125,'Soy un amigo nuevo',22,1,'KR 111 AV 3333 CR 555','4004004040','vendido','2022-09-13 23:40:22','2022-09-21','2022-09-13 23:42:25',19,'20220913234225nuevo10'),(126,'Soy un amigo nuevo',28,1,'KR 111 AV 3333 CR 555','4004004040','vendido','2022-09-13 23:41:54','2022-09-21','2022-09-13 23:42:25',19,'20220913234225nuevo10'),(127,'Soy un amigo nuevo',29,1,'KR 111 AV 3333 CR 555','4004004040','vendido','2022-09-13 23:41:54','2022-09-21','2022-09-13 23:42:25',19,'20220913234225nuevo10');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_level`
--

DROP TABLE IF EXISTS `product_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_level` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pedicure` varchar(10) NOT NULL DEFAULT 'no',
  `manicure` varchar(10) NOT NULL DEFAULT 'no',
  `maquillaje` varchar(10) NOT NULL DEFAULT 'no',
  `corte` varchar(10) NOT NULL DEFAULT 'no',
  `plomeria` varchar(10) NOT NULL DEFAULT 'no',
  `cerrajeria` varchar(10) NOT NULL DEFAULT 'no',
  `electricidad` varchar(10) NOT NULL DEFAULT 'no',
  `masajes` varchar(10) NOT NULL DEFAULT 'no',
  `meditacion` varchar(10) NOT NULL DEFAULT 'no',
  `aromaterapia` varchar(10) NOT NULL DEFAULT 'no',
  `psiquiatria` varchar(10) NOT NULL DEFAULT 'no',
  `product_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `psicologia` varchar(10) DEFAULT 'no',
  `tpareja` varchar(10) DEFAULT 'no',
  `tocupacional` varchar(10) DEFAULT 'no',
  `yoga` varchar(45) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `fk_product_level_products1_idx` (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_level`
--

LOCK TABLES `product_level` WRITE;
/*!40000 ALTER TABLE `product_level` DISABLE KEYS */;
INSERT INTO `product_level` VALUES (22,'yes','no','yes','no','no','no','no','no','no','no','no',22,'2022-09-11 11:32:41','2022-09-11 11:32:41',NULL,NULL,NULL,NULL),(23,'no','no','no','yes','yes','no','no','no','no','no','no',23,'2022-09-11 11:33:13','2022-09-11 11:33:13',NULL,NULL,NULL,NULL),(24,'no','no','no','no','no','yes','no','yes','no','no','no',24,'2022-09-11 11:33:48','2022-09-11 11:33:48',NULL,NULL,NULL,NULL),(25,'no','no','no','no','no','no','no','no','no','yes','yes',25,'2022-09-11 11:34:18','2022-09-11 11:34:18',NULL,NULL,NULL,NULL),(26,'yes','no','no','yes','no','no','no','no','no','no','no',26,'2022-09-11 12:35:48','2022-09-11 12:35:48',NULL,NULL,NULL,NULL),(27,'no','no','no','no','yes','yes','no','no','no','no','no',27,'2022-09-11 12:36:24','2022-09-11 12:36:24',NULL,NULL,NULL,NULL),(28,'no','no','no','no','no','no','yes','yes','no','no','no',28,'2022-09-11 12:37:12','2022-09-11 12:37:12',NULL,NULL,NULL,NULL),(29,'no','no','no','no','no','yes','no','no','no','yes','yes',29,'2022-09-11 12:37:45','2022-09-11 12:37:45',NULL,NULL,NULL,NULL),(30,'yes','yes','yes','yes','no','no','no','no','no','no','no',30,'2022-09-11 14:42:36','2022-09-11 14:42:36',NULL,NULL,NULL,NULL),(31,'no','no','no','no','no','no','no','no','no','no','yes',34,'2022-09-11 20:49:38','2022-09-11 20:49:38','yes','yes','yes','no');
/*!40000 ALTER TABLE `product_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_view`
--

DROP TABLE IF EXISTS `product_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_view` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `product_id` int NOT NULL,
  `user_id` int NOT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_product_view_products1_idx` (`product_id`),
  KEY `fk_product_view_users1_idx` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_view`
--

LOCK TABLES `product_view` WRITE;
/*!40000 ALTER TABLE `product_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pName` varchar(100) NOT NULL,
  `price` int NOT NULL,
  `description` text NOT NULL,
  `available` int NOT NULL,
  `category` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `pCode` varchar(20) NOT NULL,
  `picture` text NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (22,'P1',1,'1',1,'belleza','1','1010010','Imagen1.png','2022-09-11 11:32:41','2022-09-11 19:39:56',16),(23,'P2',2,'2',2,'hogar','2','2020','WhatsApp_Image_2022-08-04_at_10.36.56_AM.jpeg','2022-09-11 11:33:13','2022-09-11 19:39:56',17),(24,'P3 Editado',3,'3',3,'','3','3','ARBOL_DE_PROBLEMAS_PRIORZACION_APP-Page-2.drawio_1.png','2022-09-11 11:33:48','2022-09-12 18:49:02',18),(25,'P4',4,'4',4,'salud_mental','4','44','69360-1650763546611-imagen_2022-04-23_202546603.png','2022-09-11 11:34:18','2022-09-11 19:39:56',16),(26,'P11',11,'P11',11,'belleza','123','123','Excelencia_Metodologia-Copy_of_Actualizacion_V.jpg','2022-09-11 12:35:48','2022-09-11 19:39:56',17),(28,'P33 Algo ha cambiado ahora',34654,'KJHLKJ',465,'','65465DF','654D','ARBOL_DE_PROBLEMAS_PRIORZACION_APP.jpg','2022-09-11 12:37:12','2022-09-12 19:24:18',18),(29,'P55',5555,'555',555,'salud_mental','ÑSKDLJ','DSLKFJ','CURVA_MOD_III_UN_ACTIVO_APP.png','2022-09-11 12:37:45','2022-09-11 19:39:56',17),(30,'PRODUCTO CON ID',1010100,'ID',10,'belleza','1010','10','Excelencia_Metodologia-Copy_of_Actualizacion_V.drawio.png','2022-09-11 14:42:36','2022-09-11 19:39:56',16),(31,'Soy el prodcuto nuevo',8999,'Otro nuevo',55,'belleza','1010','6568d','Imagen1.png','2022-09-11 20:28:57','2022-09-11 20:28:57',18),(32,'Otro intento',10,'alksdlkf',10,'belleza','1012','5656','WhatsApp_Image_2022-08-04_at_10.36.56_AM.jpeg','2022-09-11 20:37:27','2022-09-11 20:37:27',18),(33,'Producto para level',1010,'Producto para level',10,'hogar','102020','10dr','WhatsApp_Image_2022-08-04_at_10.36.56_AM.jpeg','2022-09-11 20:43:16','2022-09-11 20:43:16',18),(34,'Salud espiritual',1133,'Salud espiritual',1313,'relajacion','10101010','33333estarbien','Excelencia_Metodologia-Copy_of_Actualizacion_V.jpg','2022-09-11 20:49:38','2022-09-11 22:08:48',18);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `reg_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `online` varchar(1) NOT NULL DEFAULT '0',
  `activation` varchar(3) NOT NULL DEFAULT 'yes',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (16,'kima','kima@gmail.com','kima','$2b$12$JtVen2p5.wWZD3iv6sCiUujiAhrrlS7Xzl9P/w6PsAqmKRNVjlAKq','3216098118','2022-09-11 11:31:59','1','yes','2022-09-13 23:00:04'),(17,'Jilit','jilit@hotmail.com','jilit','$2b$12$vy67ocCs9eVWtuo7In5Iz.FhdlSv41cvCsmNswEHS40HkZ8XOZbRW','3005005050','2022-09-11 14:46:53','1','yes','2022-09-13 23:00:04'),(18,'Ferdor Primero','dert@gmail.com','ferdor','$2b$12$97zsvMeY5LomZH2dGvVrvuBQ2GhCYXNBw9nAO01V0VV9dki/Hr/aO','3004004040','2022-09-11 14:49:26','1','yes','2022-09-13 23:00:04'),(19,'Soy un amigo nuevo','semaga89@gmail.com','nuevo10','$2b$12$bcqn85CF.q2wZUEwB6rzr.ZpbpKVdtzXzb8TJyPXqmr4fvjedBbSW','3003003030','2022-09-13 20:35:19','1','yes','2022-09-13 20:36:25');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-13 23:49:41
