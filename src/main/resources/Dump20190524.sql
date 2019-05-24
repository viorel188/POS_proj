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
  CONSTRAINT `idPostCT` FOREIGN KEY (`idPost`) REFERENCES `posts` (`idPost`),
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
  CONSTRAINT `idPostFPT` FOREIGN KEY (`idPost`) REFERENCES `posts` (`idPost`),
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
-- Table structure for table `liketable`
--

DROP TABLE IF EXISTS `liketable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `liketable` (
  `id_like` int(11) NOT NULL AUTO_INCREMENT,
  `created` date DEFAULT NULL,
  `liked_user_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_like`),
  KEY `likedUserIDLT_idx` (`liked_user_id`),
  KEY `userIDLT_idx` (`user_id`),
  CONSTRAINT `likedUserIDLT` FOREIGN KEY (`liked_user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `userIDLT` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liketable`
--

LOCK TABLES `liketable` WRITE;
/*!40000 ALTER TABLE `liketable` DISABLE KEYS */;
INSERT INTO `liketable` VALUES (1,NULL,57,58),(26,NULL,53,52),(27,NULL,56,57),(28,NULL,58,57),(30,NULL,67,62),(31,NULL,68,62),(34,NULL,66,64),(35,NULL,67,64),(36,NULL,68,64),(37,NULL,70,64),(38,NULL,69,62);
/*!40000 ALTER TABLE `liketable` ENABLE KEYS */;
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
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `posts` (
  `idPost` int(11) NOT NULL AUTO_INCREMENT,
  `postDescription` varchar(2000) DEFAULT NULL,
  `postImage` longblob,
  `idUser` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`idPost`),
  KEY `idUser_idx` (`idUser`),
  CONSTRAINT `idUser` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
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
  `imgpath` varchar(255) DEFAULT NULL,
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
  `status` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'hg','$2a$10$taw1PYuML8hi.STMfJpRuef0wS5DUKuPiZ1bbf1eUjyIUS5iNYO3K','hg','hg@m.com',1234,'profileImages/hg/50962020_763510157340489_7747132433656446976_n.jpg','kjlfdsa','Afrikanns','Female',23,'Women','ghj',180,80,'Rastafarianism','Europe','Romania','Bucharest (Bucuresti)',NULL),(42,'uio','$2a$10$Y2XpP7oQegvC/SsAwWnp7e/tgNDSyFDVSQ7T2lhp0WOVLDyEvCrPK','uioll','uio@u.com',123,'profileImages/uio/SAP_EXAMPLE.PNG','dfsj','Afrikanns','Male',23,'Women','adsf',158,60,'Christianity','Australia/Oceania','Fiji','Central',NULL),(50,'soi','$2a$10$S1564rvmTG18u.eDCfVQ3.ZyvvVTZz9fmyKoFTQHW1a.N6ZQO4Mqa','soil','soi@s.com',234,'profileImages/soi/50962020_763510157340489_7747132433656446976_n.jpg','sdflkaj','Afrikanns','Female',23,'Women','dsf',180,78,'Secular','Europe','Albania','Tirana',NULL),(51,'hg','$2a$10$taw1PYuML8hi.STMfJpRuef0wS5DUKuPiZ1bbf1eUjyIUS5iNYO3K','hg','hg2@m.com',1234,'profileImages/hg/SAP_EXAMPLE.PNG','kjlfdsa','Afrikanns','Female',23,'Women','ghj',180,80,'Rastafarianism','Europe','Romania','Bucharest (Bucuresti)',NULL),(52,'vio','$2a$10$8g73vxYzhz2Lvyw7URDWPeKba.XKZk49a5jIBqQDD2RqVDJzS.TFi','Viol','vio@v.com',234,'profileImages/vio/51289004_414291509313980_4311646243148267520_n (1).jpg','dslkfj','Afrikanns','Female',23,'Women','sdf',189,89,'Rastafarianism','Europe','Georgia','T\'bilisi',NULL),(53,'mia','$2a$10$5bwkCbJRmCygJYsgmgHe6uigHaG3.yuy5VXFFaW8KVI.ZOp0CsBx2','miau','mia@m.com',13243,'profileImages/mia/50962020_763510157340489_7747132433656446976_n.jpg','dfal','Afrikanns','Female',20,'Women','miau',190,90,'Hinduism','Europe','Georgia','T\'bilisi',NULL),(55,'y','$2a$10$/PmHEdfFWZyLVJ1oF3xHN.5286HV3mKyils6nZhaHBkwArV7duCvq','yl','y@y.com',12,'profileImages/img-profile-missing.png','dsf','Afrikanns','Female',23,'Women','sadf',190,90,'Hinduism','Europe','Georgia','T\'bilisi',NULL),(56,'boss','$2a$10$RPX2QRhV45GJgcwA4PncCu972adock0gZwK8fHC4uiMeWpewazoOW','bossl','boss@b.com',234,'profileImages/boss/babyboss.jpg','dsflkj','Afrikanns','Male',23,'Women','jlkjlk',189,89,'Cao Dai','Europe','Romania','Ialomita',NULL),(57,'seniorita','$2a$10$KasXogp11e4BVGOuI49b4.XZehIETU24TGJ8Eo7RxAin64/SoIz5a','Lady','seniorita@s.com',777,'profileImages/seniorita/585e4bc4cb11b227491c3395.png','dfa','English','Female',20,'Men','evropeika',175,50,'Christianity','Europe','Romania','Ialomita',NULL),(58,'doggo','$2a$10$xD6O9g3GgDmBslu2ahNEPO/DPqtPNOiNgnFqg1v3j17wVJ2bEh98u','doggy','doggo@d.com',89898,'profileImages/doggo/sexydog.jpg','ldskfa','Afrikanns','Male',12,'Women','doggies',45,16,'Other','Europe','Romania','Ialomita',NULL),(60,'mihaicr','$2a$10$0T9epaeOm39cGa3UF4Q3xeEebenGR81PZ8DOSP58gmLp.Alcd/xp.','asdfsd','mihai100@yahoo.com',2345,'profileImages/mihaicr/FB_IMG_1459162152031.jpg','fkfgnfd gkfn dkg','English','Male',27,'Women','',189,82,'Buddhism','Europe','Denmark','Kobenhavns',NULL),(62,'John DoeOne','$2a$10$9qd8KqGF7qoJvFzyzwAJt.wNdpBrUMmvfQO.2ZWsGIAEoWwZZbYg2','Doe','johndoe1@gmail.com',1234567,'profileImages/John DoeOne/billyheatface512.png','hello world!','Czech','Male',34,'Women','Czech',175,65,'Atheist','Europe','Denmark','Bornholm',NULL),(63,'John DoeTwo','$2a$10$1G59GI./WKR.uJHG64415OKKTakG.sKdK9zmAgmY.lmpSHSiAjmPa','DoeTwo','johndoe2@gmail.com',654321,'profileImages/John DoeTwo/500_F_150593581_ythLwJ6TWEtbpXi94eh8Lsnqusrl8CMx.jpg',' fkshj lsf l','Cambodian','Male',27,'Women','albanian',187,86,'Christianity','Europe','Denmark','Bornholm',NULL),(64,'John DoeThree','$2a$10$ypXP8QCoT4QNMtvguq4NXe1UYM4EoeRmSsQdJqsojpG3Fa7MqnbUa','DoeThree','johndoe3@gmail.com',234576,'profileImages/John DoeThree/af25490494d3338afef00869c59fdd37.png','hallloooooooou !','Danish','Male',21,'Women','',168,56,'Jainism','Europe','Denmark','Bornholm',NULL),(65,'John DoeFour','$2a$10$d.PE2zvHhVWIUOnPl4YdBuus62wvfGK5tlkxdRRbkfAFPvblBbl4y','DoeFour','johndoe4@gmail.com',654327,'profileImages/John DoeFour/user-icon-male-with-beard-icon-hipster-flat-icon-avatar-of-man-with-K4AFJG.jpg','bonjour b!TC#3S !!!','Estonian','Male',34,'Men','',187,79,'Cao Dai','Europe','Denmark','Bornholm',NULL),(66,'Jane DoeOne','$2a$10$drdsfRVDfjE0wHxY5Tw7..cqS4xoK2xpHsjtN.4Zzga.OsGe.Lnn2','DoeOne','janedoe1@gmail.com',14236,'profileImages/Jane DoeOne/publicdomainq-girl_laptop.png','hello i\'m jane!','Danish','Female',34,'Men','',167,54,'Hinduism','Europe','Denmark','Bornholm',NULL),(67,'Jane DoeTwo','$2a$10$Nl7cUhptGRiRzruXdvEjVOyhN9iWL./ChKsFy6gquf5L8ucU9HY4C','DoeTwo','janedoe2@gmail.com',64532233,'profileImages/Jane DoeTwo/blond-female-user-md.png','Hello World!!!','Danish','Female',24,'Men','Danish',174,57,'Atheist','Europe','Denmark','Storstrom',NULL),(68,'Jane DoeThree','$2a$10$m4h8X6g6rUhxDsZMQQNG3u/flEwENXrLerxcsZFB9JDyGmBW9PXPG','DoeThree','janedoe3@gmail.com',7865432,'profileImages/Jane DoeThree/585e4bc4cb11b227491c3395.png','dsfghf fdgd ','Danish','Female',43,'Men','albanian',168,52,'Nonreligious','Europe','Denmark','Roskilde',NULL),(69,'Jane DoeFour','$2a$10$cOYDjUw.zSnK5WshTb5Ew.Ol3D4tjMxoEToVe7bZHOzxgd5FA8cSK','DoeFour','janedoe4@gmail.com',43567,'profileImages/Jane DoeFour/user-icon-female-white-shirt-md.png','sdfgh ddfg df gdf g','Czech','Female',31,'Men','Estonian',169,51,'Judaism','Europe','Denmark','Nordjylland',NULL),(70,'ana','$2a$10$rrRV3qmVWXgaQbQ8zuEB6Op3MicxZcps87cYGgYtCS9o2Ip.yS6O.','anna','ana1@gmail.com',2348765,'profileImages/ana/blond-female-user-md.png','sdfg dfg gdf ','Croation','Female',22,'Men','',169,52,'Jainism','Europe','Denmark','Arhus',NULL),(71,'bdshkjds','$2a$10$u6y1thSdgsxx9V/8AqImruUkPTDN/pW4aU.PiNgY6H.WQxAMao38.','One1','one@hello.com',32456,'profileImages/bdshkjds/billyheatface512.png','ewrwer wrwr ','Dutch','Male',31,'Women','Romanian',179,70,'Atheist','Central America','Costa Rica','San Jose',NULL),(72,'hfkds','$2a$10$o.K7635LtQkjmO6F7ROr8e/lfXyw77UCJVbqfSiORP5lw9L6g.mLq','one2','one2@hello.com',786234,'profileImages/hfkds/blond-female-user-md.png','ewfrw ss s g dfgfd gdfg dgf','Croation','Female',31,'Men','Romanian',171,53,'Atheist','Central America','Costa Rica','San Jose',NULL),(73,'Mihai','$2a$10$gJ51GsITFZ5dZXa4Rv8Rw.sL.ZtB8Uko9z3bNNt10aRiB5V84nROC','Croitoru','mihaicroitoru10@yahoo.com',6752378,'profileImages/Mihai/billyheatface512.png','Hello World !!!','English','Male',23,'Women','Moldavian',188,84,'Christianity','Europe','Romania','Ialomita',NULL);
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

-- Dump completed on 2019-05-24 20:24:08
