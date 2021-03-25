-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: auction
-- ------------------------------------------------------
-- Server version	5.7.16-log
create database auction;
use auction;

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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `mem_id` varchar(20) NOT NULL,
  `mem_password` varchar(20) DEFAULT NULL,
  `mem_name` varchar(20) DEFAULT NULL,
  `mem_sex` char(6) DEFAULT NULL,
  `mem_birth` varchar(20) DEFAULT NULL,
  `mem_phone` varchar(20) DEFAULT NULL,
  `mem_email` varchar(30) DEFAULT NULL,
  `mem_address` varchar(50) DEFAULT NULL,
  `mem_time` varchar(40) DEFAULT NULL,
  `mem_key` varchar(45) DEFAULT NULL,
  `mem_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`mem_id`),
  UNIQUE KEY `mem_id_UNIQUE` (`mem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('admin','admin','admin','man','1970-01-01','010-1243-1312','ggg@naver.com','asd/vvf','2016-11-25 21:26:06.113',NULL,1),('bb','bb','bb','man','1974-04-04','010-1234-4444','kungfumong@naver.com','bb/bb','2016-12-02 14:19:30.201','29fde',1),('hohoyo','hohoyo','호호','man','2008-08-11','010-4125-5125','kk@naver.com','aa/aa','2016-11-30 23:07:52.613','3f457',1),('jin0402','123','진현식','man','1970-01-01','010-1111-4444','ska5135@naver.com','22/22','2016-12-02 13:52:46.989','286f1',1),('kim','kim','김길동','man','1983-11-07','010-1234-4441','naitn@naver.com','jaifa/aiagb','2016-11-30 23:07:28.015','1dd50',1),('ohye','ohye','오예','man','2007-01-01','010-5135-632','anmti@naver.com','aaadg/gagag','2016-11-30 23:08:16.402','b6e46',1),('한글','gksrmf','한글','man','1970-01-01','010-1234-1241','kungfumong@naver.com','한글/한글222','2016-12-02 14:30:10.542','6856a',0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `subject` varchar(45) DEFAULT NULL,
  `content` text,
  `regdate` timestamp NULL DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  `pos` int(11) DEFAULT NULL,
  `ref` int(11) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `key1_idx` (`name`),
  CONSTRAINT `notice_key1` FOREIGN KEY (`name`) REFERENCES `member` (`mem_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,'admin','공지사항 전합니다 5조 김현영 진현식 김규남 입니다.','공지사항 내용니다','2016-11-30 14:15:57',1,NULL,NULL),(2,'admin','두번째 공지사항은두번째 공지사항은두번째 공지사항은두번째 공지사항은두번째 공지사항은','ㅁㄴㄹ','2016-11-30 14:16:33',2,NULL,NULL),(3,'admin','간다ㅏ라마바라사 ㅏ&#50522;차자팥카차하','ㅇㅇ','2016-11-30 14:18:13',1,NULL,NULL),(4,'admin','옥셩옥셩고셩ㄴ 경매 경ㅁ개 옥션 옥셩 겸ㅇ매','경매옥션!','2016-11-30 14:19:05',0,NULL,NULL),(5,'admin','경매는 옥션입니다!!!!!!!!!!!!!!!!!!!!','경매는 옥션입니다!!!!!!!!!!!!!!!!!!!!','2016-11-30 14:19:15',1,NULL,NULL),(6,'admin','페이징 보여주기 위해@@@쓰고있따!!','열심히!!!','2016-11-30 14:19:30',0,NULL,NULL);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_title` varchar(45) DEFAULT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `product_stprice` varchar(45) DEFAULT NULL,
  `product_unit` varchar(45) DEFAULT NULL,
  `product_date` varchar(45) DEFAULT NULL,
  `product_memo` longtext,
  `product_img` varchar(45) DEFAULT NULL,
  `product_writer` varchar(45) DEFAULT NULL,
  `product_time` date DEFAULT NULL,
  `product_now` int(11) DEFAULT NULL,
  `product_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_id_UNIQUE` (`product_id`),
  KEY `product_writer_idx` (`product_writer`),
  CONSTRAINT `product_writer` FOREIGN KEY (`product_writer`) REFERENCES `member` (`mem_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (57,'기타기타!','기타치세요','500000','100','3일','기타 사세용~~ 좋아요~','ga.jpg/pabv.jpg/null','kim','2016-12-08',20000000,1),(58,'갤럭시? 아이폰??','갤럭시가 좋아? 아이폰이 좋아?','500000','10','3일','난 둘다~','ea.jpg/null/null','kim','2016-12-08',6000000,1),(59,'슈퍼카 엄청비쌈','슈퍼카 엄청비쌈','999999999','10','3일','난 돈없어서 못삼','product1.jpg/null/null','ohye','2016-12-08',1,0),(60,'LG결합상품사셈!! 리얼 쌈','LG결합상품임!!','1000','10','3일','자꾸 집에 전화오더라!','zxczxc.png/null/null','kim','2016-12-08',3000,1),(61,'그람그람','그람그람 100g먹으면 100g더','50000','10','3일','그람그람~ 그램그램~','pr3.jpg/pabv1.jpg/pr21.jpg','hohoyo','2016-12-08',50000,1),(65,'국화입니당~~','국화','20000','2000','4일','국화를 사랑합시다','Chrysanthemum1.jpg/null/null','jin0402','2016-12-08',80000,1),(66,'글의제목','사막입니다','50000','10','3일','내용','Desert.jpg/Hydrangeas.jpg/Jellyfish.jpg','bb','2016-12-08',50000,1),(68,'ghh','hhfgh','33333','11','3일','zxcv','pabv2.jpg/null/null','bb','2016-12-09',33333,1),(69,'nnfgnfn','nfgnfgn','33333','11','3일','zxc','product12.jpg/null/null','bb','2016-12-09',33333,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tender`
--

DROP TABLE IF EXISTS `product_tender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_tender` (
  `product_tender_num` int(11) NOT NULL,
  `product_tender_id` varchar(45) NOT NULL,
  `product_tender_price` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_tender_num`,`product_tender_id`),
  KEY `ket2_idx` (`product_tender_id`),
  CONSTRAINT `ket2` FOREIGN KEY (`product_tender_id`) REFERENCES `member` (`mem_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `key1` FOREIGN KEY (`product_tender_num`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tender`
--

LOCK TABLES `product_tender` WRITE;
/*!40000 ALTER TABLE `product_tender` DISABLE KEYS */;
INSERT INTO `product_tender` VALUES (57,'kim',20000000),(58,'kim',540000),(60,'kim',3000),(65,'kim',70000);
/*!40000 ALTER TABLE `product_tender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `subject` varchar(45) DEFAULT NULL,
  `content` text,
  `pos` int(11) DEFAULT NULL,
  `ref` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `regdate` timestamp NULL DEFAULT NULL,
  `count` int(11) DEFAULT '0',
  PRIMARY KEY (`num`),
  KEY `question_key1_idx` (`name`),
  CONSTRAINT `question_key1` FOREIGN KEY (`name`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'kim','프로젝트 하는데 힘들었나요!!?','정말 궁급합니다!',NULL,NULL,NULL,'2016-11-30 14:20:28',19);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionreply`
--

DROP TABLE IF EXISTS `questionreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questionreply` (
  `num` int(11) NOT NULL,
  `name` varchar(5) DEFAULT NULL,
  `writer` varchar(45) DEFAULT NULL,
  `content` text,
  `ref` int(11) DEFAULT NULL,
  `pos` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `questionreaply_key2_idx` (`num`),
  KEY `key1_idx` (`name`),
  KEY `key2_idx` (`writer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionreply`
--

LOCK TABLES `questionreply` WRITE;
/*!40000 ALTER TABLE `questionreply` DISABLE KEYS */;
INSERT INTO `questionreply` VALUES (1,'kim','aa','하 무지 힘들었습니다',0,2,0,'2016-12-02 05:25:13'),(2,'aa','aa','gafdg',0,1,0,'2016-12-02 05:25:14');
/*!40000 ALTER TABLE `questionreply` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-09 20:44:03
