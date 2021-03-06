-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: firstdb
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blockeduser`
--

DROP TABLE IF EXISTS `blockeduser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `blockeduser` (
  `idblockedUser` int(11) NOT NULL AUTO_INCREMENT,
  `created` date DEFAULT NULL,
  `idUser` int(11) NOT NULL,
  `blockedUserID` int(11) NOT NULL,
  PRIMARY KEY (`idblockedUser`),
  KEY `idUser_idx` (`idUser`),
  KEY `blockedUserIdBU_idx` (`blockedUserID`) /*!80000 INVISIBLE */,
  CONSTRAINT `blockedUserIdBU` FOREIGN KEY (`blockedUserID`) REFERENCES `users` (`id`),
  CONSTRAINT `idUserBU` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blockeduser`
--

LOCK TABLES `blockeduser` WRITE;
/*!40000 ALTER TABLE `blockeduser` DISABLE KEYS */;
/*!40000 ALTER TABLE `blockeduser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comment` (
  `idComment` int(11) NOT NULL AUTO_INCREMENT,
  `created` date DEFAULT NULL,
  `idPost` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `commentText` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`idComment`),
  KEY `idPostCT_idx` (`idPost`),
  KEY `idUserCT_idx` (`userID`),
  CONSTRAINT `idPostCT` FOREIGN KEY (`idPost`) REFERENCES `post` (`idPost`),
  CONSTRAINT `idUserCT` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flaggedpost`
--

DROP TABLE IF EXISTS `flaggedpost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `flaggedpost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) DEFAULT NULL,
  `idPost` int(11) NOT NULL,
  `idUserSend` int(11) NOT NULL,
  `idUserFlagged` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idPostFPT_idx` (`idPost`),
  KEY `senderUserIDFPT_idx` (`idUserSend`),
  KEY `flaggedUserIDFPT_idx` (`idUserFlagged`),
  CONSTRAINT `flaggedUserIDFPT` FOREIGN KEY (`idUserFlagged`) REFERENCES `users` (`id`),
  CONSTRAINT `idPostFPT` FOREIGN KEY (`idPost`) REFERENCES `post` (`idPost`),
  CONSTRAINT `senderUserIDFPT` FOREIGN KEY (`idUserSend`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flaggedpost`
--

LOCK TABLES `flaggedpost` WRITE;
/*!40000 ALTER TABLE `flaggedpost` DISABLE KEYS */;
/*!40000 ALTER TABLE `flaggedpost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follower`
--

DROP TABLE IF EXISTS `follower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `follower` (
  `idfollower` int(11) NOT NULL AUTO_INCREMENT,
  `created` date DEFAULT NULL,
  `idUser` int(11) NOT NULL,
  `followingUserId` int(11) NOT NULL,
  PRIMARY KEY (`idfollower`),
  KEY `idUserFolower_idx` (`idUser`),
  KEY `followingUserId_idx` (`followingUserId`),
  CONSTRAINT `followingUserIdFolloweTable` FOREIGN KEY (`followingUserId`) REFERENCES `users` (`id`),
  CONSTRAINT `idUserFollowerTable` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follower`
--

LOCK TABLES `follower` WRITE;
/*!40000 ALTER TABLE `follower` DISABLE KEYS */;
/*!40000 ALTER TABLE `follower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `friend` (
  `idfriend` int(11) NOT NULL AUTO_INCREMENT,
  `addedOn` date DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `friendID` int(11) NOT NULL,
  PRIMARY KEY (`idfriend`),
  KEY `userIDFT_idx` (`userID`),
  CONSTRAINT `friendIDFT` FOREIGN KEY (`userID`) REFERENCES `users` (`id`),
  CONSTRAINT `userIDFT` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `like`
--

DROP TABLE IF EXISTS `like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `like` (
  `idLike` int(11) NOT NULL AUTO_INCREMENT,
  `created` date DEFAULT NULL,
  `likedUserID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`idLike`),
  KEY `likedUserIDLT_idx` (`likedUserID`),
  KEY `userIDLT_idx` (`userID`),
  CONSTRAINT `likedUserIDLT` FOREIGN KEY (`likedUserID`) REFERENCES `users` (`id`),
  CONSTRAINT `userIDLT` FOREIGN KEY (`userID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `like`
--

LOCK TABLES `like` WRITE;
/*!40000 ALTER TABLE `like` DISABLE KEYS */;
/*!40000 ALTER TABLE `like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `notification` (
  `idNotification` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  `senderUserID` int(11) NOT NULL,
  `receiverUserID` int(11) NOT NULL,
  PRIMARY KEY (`idNotification`),
  KEY `receiverUserIDNT_idx` (`receiverUserID`),
  KEY `senderUserIDNT_idx` (`senderUserID`),
  CONSTRAINT `receiverUserIDNT` FOREIGN KEY (`receiverUserID`) REFERENCES `users` (`id`),
  CONSTRAINT `senderUserIDNT` FOREIGN KEY (`senderUserID`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `post` (
  `idPost` int(11) NOT NULL AUTO_INCREMENT,
  `postDescription` varchar(500) DEFAULT NULL,
  `postImage` longblob,
  `idUser` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`idPost`),
  KEY `idUser_idx` (`idUser`),
  CONSTRAINT `idUser` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privatemessage`
--

DROP TABLE IF EXISTS `privatemessage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `privatemessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` date DEFAULT NULL,
  `idUser` int(11) NOT NULL,
  `destUserID` int(11) NOT NULL,
  `messageBody` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idUserPMT_idx` (`idUser`),
  KEY `destUserIDPMT_idx` (`destUserID`),
  CONSTRAINT `destUserIDPMT` FOREIGN KEY (`destUserID`) REFERENCES `users` (`id`),
  CONSTRAINT `idUserPMT` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privatemessage`
--

LOCK TABLES `privatemessage` WRITE;
/*!40000 ALTER TABLE `privatemessage` DISABLE KEYS */;
/*!40000 ALTER TABLE `privatemessage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `pass` varchar(99) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phonenr` int(11) DEFAULT NULL,
  `imgpath` varchar(199) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `language` varchar(45) DEFAULT NULL,
  `sex` varchar(45) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `interestedin` varchar(45) DEFAULT NULL,
  `etnicity` varchar(45) DEFAULT NULL,
  `height` double DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `religion` varchar(45) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `city_state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(1,'Vio','pass',NULL,'sd@mail.ru',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Nemo','pas',NULL,'fd',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'boi','boi',NULL,'boi@boi.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'mike','qwerty123',NULL,'mike@yahoo.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'mihai','$2a$10$mx2BOJ5YdaR4moPTaUYbAeMwoYqnTwqx1bJ1j0TtCbvRvIBVx8Hh2',NULL,'mihaicrotioru10@yahoo.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'Mihai Croitoru','$2a$10$QA0QySu3I8mdlnenIhy2bONeBuhjue8CVA9VXCC6WJQYOfRmxusma',NULL,'mike1000@yahoo.com',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'bob','$2a$10$HZ/s7Hd7fQrcSN1xm3xFxOcZv8ncVinRMqpg0CKX55AgDFc0.xWtu','Bobl','bob@b.com',123,'C:\\fakepath\\Pasaport_CasapuViorel.jpg','balkfj','Afrikanns','F',23,'Women','boby',123,23,'Cao Dai','Europe','France','Ile-de-France'),(25,'gol','$2a$10$k2PwKhV94myy8qbGeSCOKeGRoLghnox6XpZxE.acMLmcilVkYQfbq','Goll','gol@g.com',123,'C:\\fakepath\\Pasaport_CasapuViorel.jpg','sdfa','Afrikanns','F',23,'Women','golish',170,70,'Hinduism','Europe','Romania','Ialomita'),(26,'myname','$2a$10$PYmRgxVSODMkSfcjOKaGPuiKDDj1RvfU6aMUK0vgYJwqukw8tyqQ2','mylastname','myname@m.com',1234,'','asdf','Afrikanns','F',23,'Women','efsf',160,56,'Secular','Europe','Romania','Ialomita'),(27,'men','$2a$10$r1mlOp3SNUuEJvvxSeXpeuIRoJWtmEsmBFRmGXr6N2YRn9c/gmZ3y','menn','men@m.com',342,'profileImages/men/Pasaport_CasapuViorel.jpg','jlksdfj','Afrikanns','F',23,'Women','bl',189,89,'Secular','Europe','Romania','Constanta');
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

-- Dump completed on 2019-05-08 17:36:35
