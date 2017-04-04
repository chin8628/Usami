-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: usami
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
  PRIMARY KEY (`user_id`,`image_id`),
  KEY `image_id_idx` (`image_id`),
  CONSTRAINT `comm_image_id` FOREIGN KEY (`image_id`) REFERENCES `Image` (`image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `comm_user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
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
  PRIMARY KEY (`image_id`),
  KEY `img_user_id_idx` (`user_id`),
  CONSTRAINT `img_user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Image`
--

LOCK TABLES `Image` WRITE;
/*!40000 ALTER TABLE `Image` DISABLE KEYS */;
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
  `sale` int(11) NOT NULL,
  `p_type` varchar(3) NOT NULL,
  `pgroup_id` varchar(20) NOT NULL,
  `image_id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `prod_pgroup_id_idx` (`pgroup_id`),
  KEY `prod_image_id_idx` (`image_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `prod_image_id` FOREIGN KEY (`image_id`) REFERENCES `Image` (`image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prod_pgroup_id` FOREIGN KEY (`pgroup_id`) REFERENCES `Product_Group` (`pgroup_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
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
  `count` int(11) NOT NULL,
  PRIMARY KEY (`pgroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Product_Group`
--

LOCK TABLES `Product_Group` WRITE;
/*!40000 ALTER TABLE `Product_Group` DISABLE KEYS */;
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
  `birthdate` date NOT NULL,
  `profile_image` varchar(200) NOT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `pro_user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profile`
--

LOCK TABLES `Profile` WRITE;
/*!40000 ALTER TABLE `Profile` DISABLE KEYS */;
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
  `tag_id` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`,`tag_id`),
  KEY `prof_tag_id_idx` (`tag_id`),
  CONSTRAINT `prof_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `Tag` (`tag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `prof_user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profile_focus`
--

LOCK TABLES `Profile_focus` WRITE;
/*!40000 ALTER TABLE `Profile_focus` DISABLE KEYS */;
/*!40000 ALTER TABLE `Profile_focus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tag` (
  `tag_id` varchar(20) NOT NULL,
  `tag_name` varchar(20) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag_has`
--

DROP TABLE IF EXISTS `Tag_has`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tag_has` (
  `tag_id` varchar(20) NOT NULL,
  `image_id` varchar(20) NOT NULL,
  PRIMARY KEY (`tag_id`,`image_id`),
  KEY `th_image_id_idx` (`image_id`),
  CONSTRAINT `th_image_id` FOREIGN KEY (`image_id`) REFERENCES `Image` (`image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `th_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `Tag` (`tag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag_has`
--

LOCK TABLES `Tag_has` WRITE;
/*!40000 ALTER TABLE `Tag_has` DISABLE KEYS */;
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
  `password` varchar(30) NOT NULL,
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
INSERT INTO `User` VALUES ('bbellkungziiza','04723','bbellkungziiza@hotmail.com',0,'2013-09-04 13:30:00','STD'),('eiei','ei','eiei@hotmail.com',0,'2013-09-04 13:30:00','STD'),('sweetbellza','04723','sweetbellza@hotmail.com',0,'2013-09-04 13:30:00','STD'),('test','1234','vampirefeem@gmail.com',0,'2013-09-04 13:30:00','STD');
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
  CONSTRAINT `ubuy_product_id` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ubuy_user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_buy`
--

LOCK TABLES `User_buy` WRITE;
/*!40000 ALTER TABLE `User_buy` DISABLE KEYS */;
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
  CONSTRAINT `ufav_image_id` FOREIGN KEY (`image_id`) REFERENCES `Image` (`image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ufav_user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
  CONSTRAINT `ufo_follower_id` FOREIGN KEY (`follower_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ufo_user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_follow`
--

LOCK TABLES `User_follow` WRITE;
/*!40000 ALTER TABLE `User_follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_watch`
--

DROP TABLE IF EXISTS `User_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_watch` (
  `user_id` varchar(20) NOT NULL,
  `image_id` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`,`image_id`),
  KEY `uw_image_id_idx` (`image_id`),
  CONSTRAINT `uw_image_id` FOREIGN KEY (`image_id`) REFERENCES `Image` (`image_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `uw_user_id` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_watch`
--

LOCK TABLES `User_watch` WRITE;
/*!40000 ALTER TABLE `User_watch` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'usami'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-04 14:47:44
