-- MySQL dump 10.13  Distrib 5.7.28, for Linux (x86_64)
--
-- Host: localhost    Database: LMS
-- ------------------------------------------------------
-- Server version	5.7.28-0ubuntu0.18.04.4

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
-- Current Database: `LMS`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `LMS` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `LMS`;

--
-- Table structure for table `App_Parameters`
--

DROP TABLE IF EXISTS `App_Parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `App_Parameters` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `key_type` varchar(10) NOT NULL,
  `key_value` varchar(10) NOT NULL,
  `key_text` varchar(10) NOT NULL,
  `cur_status` varchar(10) NOT NULL,
  `lastupd_user` varchar(10) NOT NULL,
  `lastupd_stamp` varchar(10) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  `seq_num` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `App_Parameters_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `User_Details` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `App_Parameters`
--

LOCK TABLES `App_Parameters` WRITE;
/*!40000 ALTER TABLE `App_Parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `App_Parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Candidate_Bank_Details`
--

DROP TABLE IF EXISTS `Candidate_Bank_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Candidate_Bank_Details` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Candidate_Id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Account_Number` bigint(20) NOT NULL,
  `Is_Account_Num_Verified` tinyint(1) DEFAULT NULL,
  `Ifsc_code` varchar(20) NOT NULL,
  `is_ifsc_code_verified` tinyint(1) DEFAULT NULL,
  `pan_number` varchar(20) NOT NULL,
  `is_pan_number_verified` tinyint(1) DEFAULT NULL,
  `addhaar_num` bigint(20) NOT NULL,
  `is_addhaar_num_verified` tinyint(1) DEFAULT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `creator_user` (`creator_user`),
  KEY `Candidate_Id` (`Candidate_Id`),
  CONSTRAINT `Candidate_Bank_Details_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `User_Details` (`Id`),
  CONSTRAINT `Candidate_Bank_Details_ibfk_2` FOREIGN KEY (`Candidate_Id`) REFERENCES `Fellowship_Candidate` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Candidate_Bank_Details`
--

LOCK TABLES `Candidate_Bank_Details` WRITE;
/*!40000 ALTER TABLE `Candidate_Bank_Details` DISABLE KEYS */;
INSERT INTO `Candidate_Bank_Details` VALUES (1,1,'Amit Kumar Mahato',8542139751259,1,'SBINF1002',1,'DUYPK2314K',1,782505873049,1,'2019-12-13 06:45:29',1),(2,2,'Anand Dandi',7541203698452,1,'SBINF9650',1,'PKNPK2904K',1,420158523698,1,'2019-12-13 07:00:36',2),(3,3,'Shivani Kumari',6241025876325,1,'SBINF6201',1,'QDFGH3456L',1,520146302598,1,'2019-12-13 07:00:43',3),(4,4,'Tamil Selvan',9652014785362,1,'SBINF5204',1,'THNFD8365P',1,302541068746,1,'2019-12-13 07:00:48',4),(5,5,'Kavya Verma',8520147963054,1,'SBINF6304',1,'DYJMK9427T',1,630147965821,1,'2019-12-13 07:00:54',2),(6,6,'Naveen Shekhar Mahto',7520368745924,1,'SBINF8540',1,'QCDGO2639U',1,752463850275,1,'2019-12-13 07:00:59',3),(7,7,'Rahul CH',8520479634965,1,'SBINF6540',1,'CDHRK3670N',1,520147963582,1,'2019-12-13 07:01:05',1);
/*!40000 ALTER TABLE `Candidate_Bank_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Candidate_Documents`
--

DROP TABLE IF EXISTS `Candidate_Documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Candidate_Documents` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `doc_type` varchar(10) NOT NULL,
  `doc_path` varchar(50) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `creator_user` (`creator_user`),
  KEY `candidate_id` (`candidate_id`),
  CONSTRAINT `Candidate_Documents_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `User_Details` (`Id`),
  CONSTRAINT `Candidate_Documents_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `Fellowship_Candidate` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Candidate_Documents`
--

LOCK TABLES `Candidate_Documents` WRITE;
/*!40000 ALTER TABLE `Candidate_Documents` DISABLE KEYS */;
INSERT INTO `Candidate_Documents` VALUES (1,1,'pdf','/home/document/1.pdf',1,'2019-12-13 07:35:44',1),(2,2,'pdf','/home/document/2.pdf',1,'2019-12-13 07:36:16',2),(3,3,'.docx','/home/document/3.docx',1,'2019-12-13 07:36:44',3),(4,4,'.pdf','/home/document/4.pdf',1,'2019-12-13 07:37:17',4),(5,5,'.pdf','/home/document/5.pdf',1,'2019-12-13 07:37:42',2),(6,6,'.docx','/home/document/6.docx',1,'2019-12-13 07:38:52',3),(7,7,'.pdf','/home/document/7.pdf',1,'2019-12-13 07:39:17',4);
/*!40000 ALTER TABLE `Candidate_Documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Candidate_Qualification`
--

DROP TABLE IF EXISTS `Candidate_Qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Candidate_Qualification` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `candidate_id` int(11) NOT NULL,
  `diploma` tinyint(1) DEFAULT NULL,
  `degree_name` varchar(10) NOT NULL,
  `is_degree_name_verified` tinyint(1) DEFAULT NULL,
  `employee_dicipline` varchar(30) NOT NULL,
  `is_employee_decipline_verified` tinyint(1) DEFAULT NULL,
  `passing_year` int(4) NOT NULL,
  `is_passing_year_verified` tinyint(1) DEFAULT NULL,
  `aggr_per` double NOT NULL,
  `final_year_per` double NOT NULL,
  `is_final_year_per_verified` tinyint(1) DEFAULT NULL,
  `training_institute` varchar(30) NOT NULL,
  `is_training_institute_verified` tinyint(1) DEFAULT NULL,
  `training_duration_month` int(4) NOT NULL,
  `is_training_duration_month_verified` tinyint(1) DEFAULT NULL,
  `other_training` varchar(30) NOT NULL,
  `is_other_training_verified` tinyint(1) DEFAULT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `candidate_id` (`candidate_id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `Candidate_Qualification_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `User_Details` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Candidate_Qualification`
--

LOCK TABLES `Candidate_Qualification` WRITE;
/*!40000 ALTER TABLE `Candidate_Qualification` DISABLE KEYS */;
INSERT INTO `Candidate_Qualification` VALUES (1,1,0,'B.Tech',1,'good',1,2017,1,57.34,65.45,1,'Bridgelabz bangalore',1,4,1,'Jspider java developer',1,'2019-12-13 07:19:24',1),(2,2,0,'MCA',1,'good',1,2019,1,60.74,68.25,1,'Bridgelabz bangalore',1,4,1,'NIL',0,'2019-12-13 07:23:53',1),(3,2,0,'MCA',1,'good',1,2019,1,60.74,68.25,1,'Bridgelabz bangalore',1,4,1,'NIL',0,'2019-12-13 07:23:55',1),(4,3,0,'B.Tech',1,'good',1,2018,1,57.68,70.25,1,'Bridgelabz bangalore',1,4,1,'Jspider java developer',1,'2019-12-13 07:25:26',2),(5,4,0,'B.Tech',1,'good',1,2011,1,64.68,70.25,1,'Bridgelabz bangalore',1,4,1,'NIL',0,'2019-12-13 07:26:38',3),(6,5,0,'B.Tech',1,'good',1,2018,1,66.68,74.25,1,'Bridgelabz bangalore',1,4,1,'Jspider java developer',1,'2019-12-13 07:27:31',4),(7,6,0,'B.Tech',1,'good',1,2018,1,62.68,68.25,1,'Bridgelabz bangalore',1,4,1,'NIL',0,'2019-12-13 07:28:41',3),(8,7,0,'B.Tech',1,'good',1,2019,1,65.69,74.47,1,'Bridgelabz bangalore',1,4,1,'NIL',0,'2019-12-13 07:29:49',2);
/*!40000 ALTER TABLE `Candidate_Qualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Candidate_Tech_Stack_Assignment`
--

DROP TABLE IF EXISTS `Candidate_Tech_Stack_Assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Candidate_Tech_Stack_Assignment` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `requirement_id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `assign_date` date NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `creator_user` (`creator_user`),
  KEY `candidate_id` (`candidate_id`),
  KEY `requirement_id` (`requirement_id`),
  CONSTRAINT `Candidate_Tech_Stack_Assignment_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `User_Details` (`Id`),
  CONSTRAINT `Candidate_Tech_Stack_Assignment_ibfk_2` FOREIGN KEY (`candidate_id`) REFERENCES `Fellowship_Candidate` (`Id`),
  CONSTRAINT `Candidate_Tech_Stack_Assignment_ibfk_3` FOREIGN KEY (`requirement_id`) REFERENCES `Company_Requirement` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Candidate_Tech_Stack_Assignment`
--

LOCK TABLES `Candidate_Tech_Stack_Assignment` WRITE;
/*!40000 ALTER TABLE `Candidate_Tech_Stack_Assignment` DISABLE KEYS */;
INSERT INTO `Candidate_Tech_Stack_Assignment` VALUES (1,1,1,'2020-03-01',1,'2019-12-13 12:54:52',1);
/*!40000 ALTER TABLE `Candidate_Tech_Stack_Assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Company`
--

DROP TABLE IF EXISTS `Company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Company` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `location` varchar(9999) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `Company_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `User_Details` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company`
--

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;
INSERT INTO `Company` VALUES (1,'Capgemini','Capgemini, Campus 6B, Limited. Pritech Park SEZ Bellandur Village Vathur Hobli, Outer Ring Rd, Bengaluru, Karnataka 560037','Bengaluru',1,'2019-12-13 08:59:08',1),(2,'Accenture','Accenture, Prestige Technopolis 1/8, Dr.MH Maregowda Road, Adugodi, Bengaluru, Karnataka 560029','Bengaluru',1,'2019-12-13 09:04:18',1),(3,'Wipro','Wipro Centre, Papanna Street, Off, St Marks Rd, Bengaluru, Karnataka 560001','Bengaluru',1,'2019-12-13 09:05:59',2),(4,'IBM','IBM, Manyata Embassy Business Park, 8th Floor, G2, Outer Ring Road, Rachenahalli And Nagawara Villages, Bengaluru, Karnataka 560045','Bengaluru',1,'2019-12-13 09:07:01',3),(5,'HCL','HCL Technologies Limited, 5-6th Floor, Gold Hill Square, 690, Hosur Road, Bommanahalli, Bengaluru','Bengaluru',1,'2019-12-13 09:09:02',4),(6,'Google','4th Floor, Tower E, RMZ Infinity, No. 3, Swamy Vivekananda Rd, Sadanandanagar, Bennigana Halli, Bengaluru, Karnataka 560016','Bengaluru',1,'2019-12-13 09:10:19',2),(7,'TCS','Tata Consultancy Services, L-Center, L-Center, Vydehi RC-1 Block, No 82, EPIP Industrial Area, KIADB Export Promotion Industrial Area, Whitefield, Bengaluru, Karnataka 560066','Bengaluru',1,'2019-12-13 09:13:06',2);
/*!40000 ALTER TABLE `Company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Company_Requirement`
--

DROP TABLE IF EXISTS `Company_Requirement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Company_Requirement` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `requested_month` int(11) NOT NULL,
  `city` varchar(10) NOT NULL,
  `is_doc_verification` tinyint(1) DEFAULT NULL,
  `requirement_doc_path` varchar(20) NOT NULL,
  `no_of_engg` int(11) NOT NULL,
  `tech_stack_id` int(11) NOT NULL,
  `tech_type_id` int(11) NOT NULL,
  `maker_program_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `ideation_engg_id` int(11) NOT NULL,
  `buddy_engg_id` int(11) NOT NULL,
  `special_remark` varchar(10) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `creator_user` (`creator_user`),
  KEY `tech_stack_id` (`tech_stack_id`),
  KEY `tech_type_id` (`tech_type_id`),
  KEY `company_id` (`company_id`),
  KEY `maker_program_id` (`maker_program_id`),
  CONSTRAINT `Company_Requirement_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `User_Details` (`Id`),
  CONSTRAINT `Company_Requirement_ibfk_2` FOREIGN KEY (`tech_stack_id`) REFERENCES `Tech_Stack` (`Id`),
  CONSTRAINT `Company_Requirement_ibfk_3` FOREIGN KEY (`tech_type_id`) REFERENCES `Tech_Type` (`Id`),
  CONSTRAINT `Company_Requirement_ibfk_4` FOREIGN KEY (`company_id`) REFERENCES `Company` (`Id`),
  CONSTRAINT `Company_Requirement_ibfk_5` FOREIGN KEY (`maker_program_id`) REFERENCES `Maker_Program` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Company_Requirement`
--

LOCK TABLES `Company_Requirement` WRITE;
/*!40000 ALTER TABLE `Company_Requirement` DISABLE KEYS */;
INSERT INTO `Company_Requirement` VALUES (1,1,4,'Bengaluru',1,'/home/document/1.pdf',50,1,1,1,1,1,1,'good',1,'2019-12-13 12:43:19',1);
/*!40000 ALTER TABLE `Company_Requirement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fellowship_Candidate`
--

DROP TABLE IF EXISTS `Fellowship_Candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fellowship_Candidate` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(10) NOT NULL,
  `Middle_Name` varchar(10) DEFAULT NULL,
  `Last_Name` varchar(10) NOT NULL,
  `Emailid` varchar(50) NOT NULL,
  `Hired_City` varchar(10) NOT NULL,
  `Degree` varchar(10) NOT NULL,
  `Hired_Date` date NOT NULL,
  `Mobile_Number` bigint(20) NOT NULL,
  `Permanent_Pincode` int(11) NOT NULL,
  `Hired_Lab` varchar(10) NOT NULL,
  `Attitude` varchar(10) NOT NULL,
  `Communication_Remark` varchar(10) NOT NULL,
  `Knowledge_Remark` varchar(10) NOT NULL,
  `Aggregate_Remark` varchar(10) NOT NULL,
  `Creator_Stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Creator_User` int(11) NOT NULL,
  `Birth_Date` date NOT NULL,
  `Is_Birth_Date_Verified` tinyint(1) NOT NULL,
  `Parent_Name` varchar(50) NOT NULL,
  `Parent_Occupation` varchar(10) NOT NULL,
  `Parents_Mobile_Number` bigint(10) NOT NULL,
  `Parents_Annual_Salary` bigint(10) NOT NULL,
  `Local_Address` varchar(50) NOT NULL,
  `Permanent_Address` varchar(50) NOT NULL,
  `Photo_Path` varchar(50) NOT NULL,
  `Joining_Date` date NOT NULL,
  `Candidate_Status` varchar(10) NOT NULL,
  `Personal_Information` tinyint(1) NOT NULL,
  `Bank_Information` tinyint(1) NOT NULL,
  `Educational_Information` tinyint(1) NOT NULL,
  `Document_Status` varchar(50) NOT NULL,
  `Remark` varchar(10) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Creator_User` (`Creator_User`),
  CONSTRAINT `Fellowship_Candidate_ibfk_1` FOREIGN KEY (`Creator_User`) REFERENCES `User_Details` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fellowship_Candidate`
--

LOCK TABLES `Fellowship_Candidate` WRITE;
/*!40000 ALTER TABLE `Fellowship_Candidate` DISABLE KEYS */;
INSERT INTO `Fellowship_Candidate` VALUES (1,'Amit','Kumar','Mahato','amitkumarmahato@gmail.com','Bangalore','B.Tech','2019-10-18',9861234389,560017,'Bangalore','good','good','good','average','2019-12-12 10:28:31',1,'1993-02-28',1,'Y.Mahato','Service',7854236984,1000000,'Murgeshpallya','Chaibasa,Jharkhand','/home/user/Pictures/1.jpg','2019-10-21','joined',1,1,1,'verified','good'),(2,'Anand',NULL,'Dandi','dandi.anand@gmail.com','Bengaluru','MCA','2019-10-18',9852473456,860457,'Bangalore','average','good','good','average','2019-12-12 10:52:09',1,'1995-04-03',1,'A.Dandi','Employee',9845657516,800000,'Marathalli','Andhra Pradesh','/home/user/Pictures/2.jpg','2019-10-21','joined',1,1,1,'verified','good'),(3,'Shivani',NULL,'Kumari','shivanikumari@gmail.com','Bengaluru','B.Tech','2019-10-13',8975624531,546275,'Bangalore','Excellent','good','good','good','2019-12-12 11:45:06',1,'1995-02-14',1,'K.Das','Business',9845657516,1200000,'BTM Layout','TATA,Jharkhand','/home/user/Pictures/3.jpg','2019-10-16','joined',1,1,1,'verified','good'),(4,'Tamil',NULL,'Selvan','tamilselvan@gmail.com','Bengaluru','B.Tech','2019-10-25',9574168729,752149,'Bengaluru','Excellent','good','Excellent','good','2019-12-12 13:51:40',4,'1990-05-23',1,'Tamil Narayan','Contractor',8952476157,900000,'BTM Layout','Chennai,Tamil Nadu','/home/user/Pictures/4.jpg','2019-10-28','joined',1,1,1,'verified','excellent'),(5,'Kavya',NULL,'Verma','kavyaverma@gmail.com','Bengaluru','B.Tech','2019-10-25',9317824650,560147,'Bengaluru','good','good','good','good','2019-12-12 13:56:39',2,'1997-09-26',1,'Venkat Verma','Farmer',9080704573,500000,'BTM Layout','Andhra Pradesh','/home/user/Pictures/5.jpg','2019-10-28','joined',1,1,1,'verified','good'),(6,'Naveen','Sekhar','Mahto','naveenshekhar@gmail.com','Bengaluru','B.Tech','2019-10-25',8092741693,753080,'Bengaluru','good','average','good','good','2019-12-13 05:41:00',3,'1997-09-26',1,'Venkat Verma','Farmer',9080704573,500000,'BTM Layout','Andhra Pradesh','/home/user/Pictures/6.jpg','2019-10-28','joined',1,1,1,'verified','good'),(7,'Rahul',NULL,'CH','rahul.ch@gmail.com','Bengaluru','B.Tech','2019-10-25',8290456203,520147,'Bengaluru','good','excellent','good','excellent','2019-12-13 05:40:40',2,'1996-04-17',1,'Rajiv CH','Doctor',9080735040,900000,'Marathalli','Heballi,Karnataka','/home/user/Pictures/7.jpg','2019-10-28','joined',1,1,1,'verified','good');
/*!40000 ALTER TABLE `Fellowship_Candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hired_Candidate`
--

DROP TABLE IF EXISTS `Hired_Candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hired_Candidate` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `First_Name` varchar(10) NOT NULL,
  `Middle_Name` varchar(10) DEFAULT NULL,
  `Last_Name` varchar(10) NOT NULL,
  `Emailid` varchar(50) NOT NULL,
  `Hired_City` varchar(10) NOT NULL,
  `Degree` varchar(10) NOT NULL,
  `Hired_Date` date NOT NULL,
  `Mobile_Number` bigint(20) NOT NULL,
  `Permanent_Pincode` int(11) NOT NULL,
  `Hired_Lab` varchar(10) NOT NULL,
  `Attitude` varchar(10) NOT NULL,
  `Communication_Remark` varchar(10) DEFAULT NULL,
  `Knowledge_Remark` varchar(10) DEFAULT NULL,
  `Aggregate_Percentage` varchar(10) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `Creator_Stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Creator_User` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Creator_User` (`Creator_User`),
  CONSTRAINT `Hired_Candidate_ibfk_1` FOREIGN KEY (`Creator_User`) REFERENCES `User_Details` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hired_Candidate`
--

LOCK TABLES `Hired_Candidate` WRITE;
/*!40000 ALTER TABLE `Hired_Candidate` DISABLE KEYS */;
INSERT INTO `Hired_Candidate` VALUES (1,'Amit','Kumar','Mahato','amitmahato@gmail.com','Bengaluru','B.tech','2019-10-21',9958346764,560012,'Bengaluru','good','good','good','64','Accepted','2019-12-12 05:45:27',1),(2,'Anand',NULL,'Dandi','dandi.anand@gmail.com','Bengaluru','MCA','2019-10-21',9958341234,560012,'Bengaluru','ok','good','average','76','Accepted','2019-12-12 05:51:42',2),(3,'Shivani',NULL,'Kumari','shivanikumari@gmail.com','Bengaluru','B.tech','2019-10-16',8958546764,450013,'Bengaluru','good','very good','ok','59','Accepted','2019-12-12 06:15:02',3),(4,'Tamil',NULL,'Selvan','tamilselvan@gmail.com','Bengaluru','B.tech','2019-10-25',7858346764,769123,'Bengaluru','good','average','excellent','80','Accepted','2019-12-12 06:17:31',4),(5,'Kavya',NULL,'Verma','kavyaverma@gmail.com','Bengaluru','B.tech','2019-10-23',8954216282,524401,'Bengaluru','good','average','good','70','Accepted','2019-12-12 06:22:02',3),(6,'Naveen','Shekhar','Mahto','naveenshekhar@gmail.com','Bengaluru','B.tech','2019-11-13',9437231569,825330,'Bengaluru','ok','average','good','69','Accepted','2019-12-12 06:34:12',1),(7,'Rahul',NULL,'CH','rahul.ch@gmail.com','Bengaluru','B.tech','2019-11-13',9437654321,561234,'Bengaluru','ok','good','good','75','Accepted','2019-12-12 06:36:03',4),(8,'Riyaz',NULL,'Uddin','riyazuddin@gmail.com','Bengaluru','B.tech','2019-10-21',7698528519,560947,'Bengaluru','ok','ok','good','87','Pending','2019-12-12 06:39:25',2),(9,'Girish',NULL,'Puccha','girishpuccha1427@gmail.com','Bengaluru','B.tech','2019-10-21',8920572846,341678,'Bengaluru','good','good','good','60','Pending','2019-12-12 06:42:55',1),(10,'Subham',NULL,'Sarkar','subhamsarkar@gmail.com','Bengaluru','B.tech','2019-10-21',8912759513,651293,'Bengaluru','good','good','excellent','85','Rejected','2019-12-12 06:58:01',3),(11,'Vipul',NULL,'Sharma','vipulsharma@gmail.com','Bengaluru','MCA','2019-10-10',7894872359,572681,'Bengaluru','good','average','good','50','Rejected','2019-12-12 07:00:13',2),(12,'Soumya','Sundri','Sahoo','soumyasundrisahoo@gmail.com','Bengaluru','MCA','2019-10-21',9040594939,769005,'Bengaluru','good','good','good','54','Pending','2019-12-12 07:03:23',1);
/*!40000 ALTER TABLE `Hired_Candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lab`
--

DROP TABLE IF EXISTS `Lab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lab` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `Lab_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `User_Details` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lab`
--

LOCK TABLES `Lab` WRITE;
/*!40000 ALTER TABLE `Lab` DISABLE KEYS */;
INSERT INTO `Lab` VALUES (1,'Bridgelabz bengaluru','Bengaluru','BridgeLabz Solutions Bengaluru, No 42, 15th Cross & 14th Main Road, HSR Layout Sector 4 Opposite To HSR BDA Complex, behind Kumarakom restaurant, Bengaluru, Karnataka 560102',1,'2019-12-13 10:25:28',1),(2,'Bridgelabz mumbai','Mumbai','BridgeLabz Solutions LLP, Malhotra Chambers, First Floor, Govandi East, Mumbai, Maharashtra 400088',1,'2019-12-13 10:27:48',2);
/*!40000 ALTER TABLE `Lab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lab_Threshold`
--

DROP TABLE IF EXISTS `Lab_Threshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lab_Threshold` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `lab_id` int(11) NOT NULL,
  `lab_capacity` int(11) NOT NULL,
  `lead_threshold` varchar(50) NOT NULL,
  `ideation_engg_threshold` varchar(50) NOT NULL,
  `buddy_engg_threshold` varchar(50) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `creator_user` (`creator_user`),
  KEY `lab_id` (`lab_id`),
  CONSTRAINT `Lab_Threshold_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `User_Details` (`Id`),
  CONSTRAINT `Lab_Threshold_ibfk_2` FOREIGN KEY (`lab_id`) REFERENCES `Lab` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lab_Threshold`
--

LOCK TABLES `Lab_Threshold` WRITE;
/*!40000 ALTER TABLE `Lab_Threshold` DISABLE KEYS */;
INSERT INTO `Lab_Threshold` VALUES (1,1,150,'Amrutha Sagar','KalpeshMali','Venkat Reddy',1,'2019-12-13 11:00:28',1),(2,2,200,'Anundo','abcd','abcd',1,'2019-12-13 11:01:08',1);
/*!40000 ALTER TABLE `Lab_Threshold` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Maker_Program`
--

DROP TABLE IF EXISTS `Maker_Program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Maker_Program` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `program_name` varchar(20) NOT NULL,
  `program_type` varchar(10) NOT NULL,
  `program_link` varchar(50) NOT NULL,
  `tech_stack_id` int(11) NOT NULL,
  `tech_type_id` int(11) NOT NULL,
  `is_program_approved` tinyint(1) DEFAULT NULL,
  `Description` varchar(100) NOT NULL,
  `status` varchar(10) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Creator_user` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Creator_user` (`Creator_user`),
  KEY `tech_stack_id` (`tech_stack_id`),
  KEY `tech_type_id` (`tech_type_id`),
  CONSTRAINT `Maker_Program_ibfk_1` FOREIGN KEY (`Creator_user`) REFERENCES `User_Details` (`Id`),
  CONSTRAINT `Maker_Program_ibfk_2` FOREIGN KEY (`tech_stack_id`) REFERENCES `Tech_Stack` (`Id`),
  CONSTRAINT `Maker_Program_ibfk_3` FOREIGN KEY (`tech_type_id`) REFERENCES `Tech_Type` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Maker_Program`
--

LOCK TABLES `Maker_Program` WRITE;
/*!40000 ALTER TABLE `Maker_Program` DISABLE KEYS */;
INSERT INTO `Maker_Program` VALUES (1,'Java Full Stack','Java','url',1,1,1,'Full stack programmer','1','2019-12-13 11:49:35',1),(2,'Java Backend','Java','url',2,2,1,'Backend programmer','1','2019-12-13 11:50:26',2);
/*!40000 ALTER TABLE `Maker_Program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mentor`
--

DROP TABLE IF EXISTS `Mentor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mentor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mentor_type` varchar(20) NOT NULL,
  `lab_id` int(11) NOT NULL,
  `Status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `creator_user` (`creator_user`),
  KEY `lab_id` (`lab_id`),
  CONSTRAINT `Mentor_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `User_Details` (`Id`),
  CONSTRAINT `Mentor_ibfk_2` FOREIGN KEY (`lab_id`) REFERENCES `Lab` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mentor`
--

LOCK TABLES `Mentor` WRITE;
/*!40000 ALTER TABLE `Mentor` DISABLE KEYS */;
INSERT INTO `Mentor` VALUES (1,'Amrutha Sagar','buddy',1,1,'2019-12-13 12:08:20',1),(2,'Kalpesh Mali','buddy',1,1,'2019-12-13 12:08:25',1),(3,'Venkat Reddy','buddy',1,1,'2019-12-13 11:56:58',1),(4,'Varsha','buddy',1,1,'2019-12-13 11:57:04',1),(5,'Anundo','buddy',2,1,'2019-12-13 11:57:33',2);
/*!40000 ALTER TABLE `Mentor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mentor_Ideation_Map`
--

DROP TABLE IF EXISTS `Mentor_Ideation_Map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mentor_Ideation_Map` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `mentor_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `creator_user` (`creator_user`),
  KEY `mentor_id` (`mentor_id`),
  CONSTRAINT `Mentor_Ideation_Map_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `User_Details` (`Id`),
  CONSTRAINT `Mentor_Ideation_Map_ibfk_3` FOREIGN KEY (`mentor_id`) REFERENCES `Mentor` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mentor_Ideation_Map`
--

LOCK TABLES `Mentor_Ideation_Map` WRITE;
/*!40000 ALTER TABLE `Mentor_Ideation_Map` DISABLE KEYS */;
INSERT INTO `Mentor_Ideation_Map` VALUES (1,1,1,'2019-12-13 12:01:40',1),(2,2,1,'2019-12-13 12:01:52',2),(3,3,1,'2019-12-13 12:17:54',4),(4,4,1,'2019-12-13 12:17:30',2),(5,5,1,'2019-12-13 12:17:36',3);
/*!40000 ALTER TABLE `Mentor_Ideation_Map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mentor_Tech_Stack`
--

DROP TABLE IF EXISTS `Mentor_Tech_Stack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mentor_Tech_Stack` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `mentor_id` int(11) NOT NULL,
  `tech_stack_id` int(11) NOT NULL,
  `Status` varchar(10) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `creator_user` (`creator_user`),
  KEY `tech_stack_id` (`tech_stack_id`),
  KEY `mentor_id` (`mentor_id`),
  CONSTRAINT `Mentor_Tech_Stack_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `User_Details` (`Id`),
  CONSTRAINT `Mentor_Tech_Stack_ibfk_2` FOREIGN KEY (`tech_stack_id`) REFERENCES `Tech_Stack` (`Id`),
  CONSTRAINT `Mentor_Tech_Stack_ibfk_3` FOREIGN KEY (`mentor_id`) REFERENCES `Lab` (`Id`),
  CONSTRAINT `Mentor_Tech_Stack_ibfk_4` FOREIGN KEY (`mentor_id`) REFERENCES `Mentor` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mentor_Tech_Stack`
--

LOCK TABLES `Mentor_Tech_Stack` WRITE;
/*!40000 ALTER TABLE `Mentor_Tech_Stack` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mentor_Tech_Stack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tech_Stack`
--

DROP TABLE IF EXISTS `Tech_Stack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tech_Stack` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `tech_name` varchar(10) NOT NULL,
  `image_path` varchar(50) NOT NULL,
  `framework` varchar(20) NOT NULL,
  `cur_status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator_user` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `creator_user` (`creator_user`),
  CONSTRAINT `Tech_Stack_ibfk_1` FOREIGN KEY (`creator_user`) REFERENCES `User_Details` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tech_Stack`
--

LOCK TABLES `Tech_Stack` WRITE;
/*!40000 ALTER TABLE `Tech_Stack` DISABLE KEYS */;
INSERT INTO `Tech_Stack` VALUES (1,'java','/home/pictures/1.jpg','Java Full Stack',1,'2019-12-13 10:03:11',1),(2,'java','/home/pictures/2.jpg','Java Backend',1,'2019-12-13 10:03:42',2);
/*!40000 ALTER TABLE `Tech_Stack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tech_Type`
--

DROP TABLE IF EXISTS `Tech_Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tech_Type` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(20) NOT NULL,
  `cur_status` tinyint(1) NOT NULL,
  `creator_stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Creator_user` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Creator_user` (`Creator_user`),
  CONSTRAINT `Tech_Type_ibfk_1` FOREIGN KEY (`Creator_user`) REFERENCES `User_Details` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tech_Type`
--

LOCK TABLES `Tech_Type` WRITE;
/*!40000 ALTER TABLE `Tech_Type` DISABLE KEYS */;
INSERT INTO `Tech_Type` VALUES (1,'Java Full Stack',1,'2019-12-13 10:18:24',1),(2,'Java Backend',1,'2019-12-13 10:18:43',2);
/*!40000 ALTER TABLE `Tech_Type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Details`
--

DROP TABLE IF EXISTS `User_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Details` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(10) NOT NULL,
  `last_name` varchar(10) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `contact_number` bigint(20) NOT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Details`
--

LOCK TABLES `User_Details` WRITE;
/*!40000 ALTER TABLE `User_Details` DISABLE KEYS */;
INSERT INTO `User_Details` VALUES (1,'sudeepkatiar@gmail.com','Sudeep','Katiar','Sudeep@123',9040594939,1),(2,'amrutha.sagar@gmail.com','Amrutha','Sagar','Amrutha@123',9876543210,1),(3,'kalpesh.mali@gmail.com','Kalpesh','Mali','Kalpesh@123',9537543210,1),(4,'venkatreddy@gmail.com','Venkat','Reddy','Venkat@123',9861236509,1);
/*!40000 ALTER TABLE `User_Details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Roles`
--

DROP TABLE IF EXISTS `User_Roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User_Roles` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(10) NOT NULL,
  KEY `user_id` (`user_id`),
  CONSTRAINT `User_Roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User_Details` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Roles`
--

LOCK TABLES `User_Roles` WRITE;
/*!40000 ALTER TABLE `User_Roles` DISABLE KEYS */;
INSERT INTO `User_Roles` VALUES (1,'Admin'),(2,'Mentor'),(3,'Mentor'),(4,'Mentor');
/*!40000 ALTER TABLE `User_Roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-18 10:58:51
