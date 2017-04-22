-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: usami
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.21-MariaDB

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
-- Table structure for table `Comment`
--

DROP TABLE IF EXISTS `Comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Comment` (
  `user_id` varchar(20) NOT NULL,
  `image_id` varchar(20) NOT NULL,
  `text` varchar(140) NOT NULL,
  `comm_date` datetime NOT NULL,
  PRIMARY KEY (`user_id`,`image_id`,`comm_date`),
  KEY `comm_image_id_idx` (`image_id`),
  CONSTRAINT `comm_image_id` FOREIGN KEY (`image_id`) REFERENCES `Image` (`image_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `comm_user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
INSERT INTO `Comment` VALUES ('chiibi','1530515148','Where am I','2017-04-22 21:13:18'),('chiibi','361878563','This is so delicious','2017-04-22 21:12:38'),('chiibi','361878563','But very expensive','2017-04-22 21:12:45');
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Image`
--

DROP TABLE IF EXISTS `Image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Image` (
  `image_id` varchar(20) NOT NULL,
  `image_url` varchar(200) NOT NULL,
  `image_name` varchar(50) NOT NULL,
  `desc` varchar(140) NOT NULL,
  `upload_date` datetime NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `view` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`image_id`),
  KEY `img_user_id_idx` (`user_id`),
  CONSTRAINT `img_user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Image`
--

LOCK TABLES `Image` WRITE;
/*!40000 ALTER TABLE `Image` DISABLE KEYS */;
INSERT INTO `Image` VALUES ('-1001138163','-1001138163.jpg','Pongmile','','2017-04-22 21:32:19','johnny',1,1),('-1319287904','-1319287904.jpg','My bike','My bike in the rain','2017-04-22 21:11:25','chiibi',1,1),('-2119250648','-2119250648.jpg','Bell Kung Cute','','2017-04-22 21:29:05','vampirefeem',2,1),('-801718048','-801718048.jpg','Mac Screen','','2017-04-22 21:31:58','johnny',1,1),('1530515148','1530515148.jpg','MSP Party','party at microsoft','2017-04-22 21:10:04','chiibi',3,1),('1618883358','1618883358.jpg','Bell Kung','My beloved','2017-04-22 21:28:36','vampirefeem',1,1),('1839067390','1839067390.jpg','iPhone Wheel','','2017-04-22 21:30:16','vampirefeem',2,1),('2085644755','2085644755.jpg','Pizza','','2017-04-22 21:29:30','vampirefeem',2,1),('361878563','361878563.jpg','Burger Food','','2017-04-22 21:12:05','chiibi',6,1);
/*!40000 ALTER TABLE `Image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product`
--

DROP TABLE IF EXISTS `Product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product` (
  `product_id` varchar(20) NOT NULL,
  `price` float NOT NULL,
  `pgroup_id` varchar(20) NOT NULL,
  `image_id` varchar(20) DEFAULT NULL,
  `user_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `prod_pgroup_id_idx` (`pgroup_id`),
  KEY `prod_image_id_idx` (`image_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `prod_image_id` FOREIGN KEY (`image_id`) REFERENCES `Image` (`image_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `prod_pgroup_id` FOREIGN KEY (`pgroup_id`) REFERENCES `Product_Group` (`pgroup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES ('-1081755937',150,'usr','-2119250648','vampirefeem'),('-1114469606',0,'usr','1618883358','vampirefeem'),('-359048346',0,'usr','-1319287904','chiibi'),('1399238641',0,'usr','-801718048','johnny'),('1516123635',0,'usr','1530515148','chiibi'),('820627243',125,'usr','-1001138163','johnny'),('863061401',0,'usr','361878563','chiibi'),('874144749',1200,'usr','1839067390','vampirefeem'),('955951338',200,'usr','2085644755','vampirefeem'),('prm30',1000,'prm',NULL,NULL);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Product_Group`
--

DROP TABLE IF EXISTS `Product_Group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Product_Group` (
  `pgroup_id` varchar(20) NOT NULL,
  `pgroup_name` varchar(50) NOT NULL,
  PRIMARY KEY (`pgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Group`
--

LOCK TABLES `Product_Group` WRITE;
/*!40000 ALTER TABLE `Product_Group` DISABLE KEYS */;
INSERT INTO `Product_Group` VALUES ('prm','premium'),('usr','user');
/*!40000 ALTER TABLE `Product_Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profile`
--

DROP TABLE IF EXISTS `Profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profile` (
  `user_id` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `profile_image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `pro_user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profile`
--

LOCK TABLES `Profile` WRITE;
/*!40000 ALTER TABLE `Profile` DISABLE KEYS */;
INSERT INTO `Profile` VALUES ('admin','admin','root',NULL,'profile-placeholder.jpg'),('chiibi','Chiibi','buki',NULL,'-1361403060.jpg'),('johnny','John','Smith',NULL,'profile-placeholder.jpg'),('vampirefeem','Patcharapon','Joksamut',NULL,'profile-placeholder.jpg');
/*!40000 ALTER TABLE `Profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profile_focus`
--

DROP TABLE IF EXISTS `Profile_focus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Profile_focus` (
  `user_id` varchar(20) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`tag_id`),
  KEY `prof_tag_id_idx` (`tag_id`),
  CONSTRAINT `prof_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `Tag` (`tag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prof_user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profile_focus`
--

LOCK TABLES `Profile_focus` WRITE;
/*!40000 ALTER TABLE `Profile_focus` DISABLE KEYS */;
INSERT INTO `Profile_focus` VALUES ('johnny',29);
/*!40000 ALTER TABLE `Profile_focus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(20) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
INSERT INTO `Tag` VALUES (21,'party'),(22,'microsoft'),(23,'fun'),(24,'people'),(25,'group'),(26,'veichle'),(27,'bike'),(28,'rain'),(29,'food'),(30,'burger'),(31,'meat'),(32,'human'),(33,'');
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag_has`
--

DROP TABLE IF EXISTS `Tag_has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tag_has` (
  `tag_id` int(11) NOT NULL,
  `image_id` varchar(20) NOT NULL,
  PRIMARY KEY (`tag_id`,`image_id`),
  KEY `th_image_id_idx` (`image_id`),
  CONSTRAINT `th_image_id` FOREIGN KEY (`image_id`) REFERENCES `Image` (`image_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `th_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `Tag` (`tag_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag_has`
--

LOCK TABLES `Tag_has` WRITE;
/*!40000 ALTER TABLE `Tag_has` DISABLE KEYS */;
INSERT INTO `Tag_has` VALUES (21,'1530515148'),(22,'1530515148'),(23,'1530515148'),(24,'1530515148'),(25,'1530515148'),(26,'-1319287904'),(27,'-1319287904'),(28,'-1319287904'),(29,'2085644755'),(29,'361878563'),(30,'361878563'),(31,'361878563'),(32,'1618883358'),(33,'-1001138163'),(33,'-2119250648'),(33,'-801718048'),(33,'1839067390');
/*!40000 ALTER TABLE `Tag_has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `user_id` varchar(20) NOT NULL,
  `password` varchar(64) NOT NULL,
  `email` varchar(50) NOT NULL,
  `coin` int(11) NOT NULL,
  `exp_date` datetime NOT NULL,
  `u_type` varchar(3) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('admin','AA85A6DD1B46C4C5ADE8D0D2829E60F0FE0DB8CD5591E648C4B0B4B7CE30D0C5','admin@usami.com',0,'2017-04-22 18:10:06','ADM'),('chiibi','B4380586BB17A6A383F6A33A26516C17910F069ECEBB6974842A864DC058FB32','chiibi@buki.com',0,'2017-04-22 18:09:48','STD'),('johnny','4C7E3DEA653CEEA8AA36CACB658BEB8FCB6CF9D90A289E6A1886AD5ACE63604E','johnny@gmail.com',2800,'2017-05-22 21:31:30','PRM'),('vampirefeem','4C7E3DEA653CEEA8AA36CACB658BEB8FCB6CF9D90A289E6A1886AD5ACE63604E','vampirefeem@gmail.com',5200,'2017-05-22 18:12:05','PRM');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_buy`
--

DROP TABLE IF EXISTS `User_buy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_buy` (
  `user_id` varchar(20) NOT NULL,
  `product_id` varchar(20) NOT NULL,
  `buy_date` datetime NOT NULL,
  `buy_price` float NOT NULL,
  PRIMARY KEY (`user_id`,`product_id`),
  KEY `ubuy_product_id_idx` (`product_id`),
  CONSTRAINT `ubuy_product_id` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ubuy_user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_buy`
--

LOCK TABLES `User_buy` WRITE;
/*!40000 ALTER TABLE `User_buy` DISABLE KEYS */;
INSERT INTO `User_buy` VALUES ('johnny','874144749','2017-04-22 21:31:21',1200);
/*!40000 ALTER TABLE `User_buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_favorite`
--

DROP TABLE IF EXISTS `User_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_favorite` (
  `user_id` varchar(20) NOT NULL,
  `image_id` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`,`image_id`),
  KEY `uf_image_id_idx` (`image_id`),
  CONSTRAINT `ufav_image_id` FOREIGN KEY (`image_id`) REFERENCES `Image` (`image_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ufav_user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_favorite`
--

LOCK TABLES `User_favorite` WRITE;
/*!40000 ALTER TABLE `User_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_follow`
--

DROP TABLE IF EXISTS `User_follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_follow` (
  `user_id` varchar(20) NOT NULL,
  `follower_id` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`,`follower_id`),
  KEY `ufo_follower_id_idx` (`follower_id`),
  CONSTRAINT `ufo_follower_id` FOREIGN KEY (`follower_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ufo_user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_follow`
--

LOCK TABLES `User_follow` WRITE;
/*!40000 ALTER TABLE `User_follow` DISABLE KEYS */;
INSERT INTO `User_follow` VALUES ('chiibi','vampirefeem');
/*!40000 ALTER TABLE `User_follow` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-22 21:33:31
