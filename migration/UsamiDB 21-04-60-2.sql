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
-- Dumping data for table `Comment`
--

LOCK TABLES `Comment` WRITE;
/*!40000 ALTER TABLE `Comment` DISABLE KEYS */;
INSERT INTO `Comment` VALUES ('vampirefeem','846341987','sdfsdafd\r\n','2017-04-21 20:48:28'),('vampirefeem','846341987','sdfdsaf','2017-04-21 20:48:31'),('vampirefeem','846341987','dsafsadfaf','2017-04-21 20:48:33'),('vampirefeem','846341987','sdafdsafsafds','2017-04-21 20:48:36'),('vampirefeem','846341987','sdafdsafsafsda','2017-04-21 20:48:40'),('vampirefeem','846341987','sadfdsafsdaf','2017-04-21 20:48:43'),('vampirefeem','846341987','asdfsafdsfsadfs','2017-04-21 20:48:46'),('vampirefeem','846341987','sdafd/slakfl;dsaklf;ksadf','2017-04-21 20:48:50'),('vampirefeem','846341987','ds;lkfl;adskfl;kdsf\r\n','2017-04-21 20:48:54'),('vampirefeem','846341987','sd;klf;sdkflksdfl;ksadf','2017-04-21 20:48:58'),('vampirefeem','846341987','akl;fm;ks;fkdafkds;lkfa','2017-04-21 20:49:03');
/*!40000 ALTER TABLE `Comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Image`
--

LOCK TABLES `Image` WRITE;
/*!40000 ALTER TABLE `Image` DISABLE KEYS */;
INSERT INTO `Image` VALUES ('-1424983834','-1424983834.jpg','Omlette','','2017-04-21 19:08:48','chiibi',2,1),('-1887894301','-1887894301.jpg','pimpavee','','2017-04-21 20:47:14','vampirefeem',1,1),('-561161235','-561161235.jpg','Movie Tickets','','2017-04-21 18:35:12','chiibi',6,1),('-603896180','-603896180.jpg','Banz Kung','ad','2017-04-21 18:13:28','vampirefeem',18,0),('1397894336','1397894336.jpg','Me','','2017-04-21 21:41:11','vampirefeem',7,1),('1444271632','1444271632.jpg','This is a lock','hello','2017-04-21 21:01:31','vampirefeem',1,1),('1908816114','1908816114.jpg','What the hell is thia','','2017-04-21 20:46:57','vampirefeem',1,1),('262810185','262810185.jpg','asdasdasd','','2017-04-21 20:59:49','vampirefeem',4,1),('610185933','610185933.jpg','MacBook Pro ads','I want to buy this','2017-04-21 18:14:05','vampirefeem',4,1),('668815035','668815035.jpg','op;asdposakdasokopdsa','','2017-04-21 20:54:03','vampirefeem',1,1),('691575829','691575829.jpg','Whattt','','2017-04-21 19:25:15','vampirefeem',1,1),('698349142','698349142.jpg','Black Bike vomvom','Obsidian bike parked in the rain.','2017-04-21 18:09:28','vampirefeem',3,0),('846341987','846341987.jpg','some random books','asdasdasd','2017-04-21 20:46:38','vampirefeem',16,1);
/*!40000 ALTER TABLE `Image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Product`
--

LOCK TABLES `Product` WRITE;
/*!40000 ALTER TABLE `Product` DISABLE KEYS */;
INSERT INTO `Product` VALUES ('-104844051',199,'usr','610185933','vampirefeem'),('-1053565545',21312300,'usr','1444271632','vampirefeem'),('-1345009654',0,'usr','-561161235','chiibi'),('-1945473027',0,'usr','668815035','vampirefeem'),('-301942079',0,'usr','262810185','vampirefeem'),('1256234292',0,'usr','691575829','vampirefeem'),('1325630481',111,'usr','-1424983834','chiibi'),('1630302922',123,'usr','1397894336','vampirefeem'),('1851444741',123,'usr','846341987','vampirefeem'),('186999617',0,'usr','698349142','vampirefeem'),('2129648207',10,'usr','-603896180','vampirefeem'),('364789685',0,'usr','-1887894301','vampirefeem'),('947403072',0,'usr','1908816114','vampirefeem'),('prm30',1000,'prm',NULL,NULL);
/*!40000 ALTER TABLE `Product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Product_Group`
--

LOCK TABLES `Product_Group` WRITE;
/*!40000 ALTER TABLE `Product_Group` DISABLE KEYS */;
INSERT INTO `Product_Group` VALUES ('prm','premium'),('usr','user');
/*!40000 ALTER TABLE `Product_Group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Profile`
--

LOCK TABLES `Profile` WRITE;
/*!40000 ALTER TABLE `Profile` DISABLE KEYS */;
INSERT INTO `Profile` VALUES ('chiibi','Chiibi','buki',NULL,'-1361403060.jpg'),('nutchy','Chayanon','',NULL,'profile-placeholder.jpg'),('vampirefeem','Patcharapon','Joksamut',NULL,'1067128501.jpg');
/*!40000 ALTER TABLE `Profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Profile_focus`
--

LOCK TABLES `Profile_focus` WRITE;
/*!40000 ALTER TABLE `Profile_focus` DISABLE KEYS */;
INSERT INTO `Profile_focus` VALUES ('vampirefeem',13);
/*!40000 ALTER TABLE `Profile_focus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
INSERT INTO `Tag` VALUES (13,'cute'),(14,'bike'),(15,'black'),(16,'car'),(17,'rain'),(18,'human'),(19,'fat'),(20,'');
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `Tag_has`
--

LOCK TABLES `Tag_has` WRITE;
/*!40000 ALTER TABLE `Tag_has` DISABLE KEYS */;
INSERT INTO `Tag_has` VALUES (14,'698349142'),(15,'698349142'),(16,'698349142'),(17,'698349142'),(18,'-603896180'),(19,'-603896180'),(20,'-1424983834'),(20,'-1887894301'),(20,'-561161235'),(20,'1397894336'),(20,'1444271632'),(20,'1908816114'),(20,'262810185'),(20,'610185933'),(20,'668815035'),(20,'691575829'),(20,'846341987');
/*!40000 ALTER TABLE `Tag_has` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES ('chiibi','4C7E3DEA653CEEA8AA36CACB658BEB8FCB6CF9D90A289E6A1886AD5ACE63604E','chiibi@bibi.com',24889,'2013-09-04 13:30:00','STD'),('nutchy','6E89F09C665BC9B246517B7DC9BA97C9254530A70B6AAF180E0DDFA665153E1B','58070021@kmitl.ac.th',0,'2013-09-04 13:30:00','STD'),('vampirefeem','4C7E3DEA653CEEA8AA36CACB658BEB8FCB6CF9D90A289E6A1886AD5ACE63604E','vampirefeem@gmail.com',576388,'2013-09-04 13:30:00','prm');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `User_buy`
--

LOCK TABLES `User_buy` WRITE;
/*!40000 ALTER TABLE `User_buy` DISABLE KEYS */;
INSERT INTO `User_buy` VALUES ('chiibi','-104844051','2017-04-21 19:04:13',199),('chiibi','2129648207','2017-04-21 18:15:02',10);
/*!40000 ALTER TABLE `User_buy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `User_favorite`
--

LOCK TABLES `User_favorite` WRITE;
/*!40000 ALTER TABLE `User_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `User_follow`
--

LOCK TABLES `User_follow` WRITE;
/*!40000 ALTER TABLE `User_follow` DISABLE KEYS */;
INSERT INTO `User_follow` VALUES ('chiibi','vampirefeem'),('vampirefeem','chiibi');
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

-- Dump completed on 2017-04-21 21:46:35
