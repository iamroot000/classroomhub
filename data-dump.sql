-- MySQL dump 10.13  Distrib 5.7.34, for Linux (x86_64)
--
-- Host: localhost    Database: classroomdb
-- ------------------------------------------------------
-- Server version	5.7.34

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'finance_group'),(2,'guidance_group'),(3,'registrar_group'),(4,'teacher_group');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add alumni',7,'add_alumni'),(26,'Can change alumni',7,'change_alumni'),(27,'Can delete alumni',7,'delete_alumni'),(28,'Can view alumni',7,'view_alumni'),(29,'Can add application',8,'add_application'),(30,'Can change application',8,'change_application'),(31,'Can delete application',8,'delete_application'),(32,'Can view application',8,'view_application'),(33,'Can add educbackground',9,'add_educbackground'),(34,'Can change educbackground',9,'change_educbackground'),(35,'Can delete educbackground',9,'delete_educbackground'),(36,'Can view educbackground',9,'view_educbackground'),(37,'Can add fambackground',10,'add_fambackground'),(38,'Can change fambackground',10,'change_fambackground'),(39,'Can delete fambackground',10,'delete_fambackground'),(40,'Can view fambackground',10,'view_fambackground'),(41,'Can add governmentid',11,'add_governmentid'),(42,'Can change governmentid',11,'change_governmentid'),(43,'Can delete governmentid',11,'delete_governmentid'),(44,'Can view governmentid',11,'view_governmentid'),(45,'Can add health',12,'add_health'),(46,'Can change health',12,'change_health'),(47,'Can delete health',12,'delete_health'),(48,'Can view health',12,'view_health'),(49,'Can add schoolsurvey',13,'add_schoolsurvey'),(50,'Can change schoolsurvey',13,'change_schoolsurvey'),(51,'Can delete schoolsurvey',13,'delete_schoolsurvey'),(52,'Can view schoolsurvey',13,'view_schoolsurvey'),(53,'Can add test',14,'add_test'),(54,'Can change test',14,'change_test'),(55,'Can delete test',14,'delete_test'),(56,'Can view test',14,'view_test'),(57,'Can add preschool_grading',15,'add_preschool_grading'),(58,'Can change preschool_grading',15,'change_preschool_grading'),(59,'Can delete preschool_grading',15,'delete_preschool_grading'),(60,'Can view preschool_grading',15,'view_preschool_grading'),(61,'Can add students',16,'add_students'),(62,'Can change students',16,'change_students'),(63,'Can delete students',16,'delete_students'),(64,'Can view students',16,'view_students'),(65,'Can add teachers',17,'add_teachers'),(66,'Can change teachers',17,'change_teachers'),(67,'Can delete teachers',17,'delete_teachers'),(68,'Can view teachers',17,'view_teachers'),(69,'Can add enrolled_students',18,'add_enrolled_students'),(70,'Can change enrolled_students',18,'change_enrolled_students'),(71,'Can delete enrolled_students',18,'delete_enrolled_students'),(72,'Can view enrolled_students',18,'view_enrolled_students');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$07qpqUCA7NtbcYPVr35Hjg$gNNFCPHpmSzjsdPV6pjRQCRrsoelsIAJ6naTxwQEd18=','2021-06-23 11:04:42.492211',1,'superadmin','','','superadmin@gmail.com',1,1,'2021-05-20 07:38:53.454622'),(5,'pbkdf2_sha256$260000$9JdHOYeR3KK8VbdnnupLG5$wEH7CBL/vIYPNk/mH6d5hpvaMcznfP6ezOa1dRpyXv4=','2021-06-19 15:21:24.667528',0,'test_user_finance1','','','',0,1,'2021-05-25 03:23:18.000000'),(6,'pbkdf2_sha256$260000$vhLr5FVr325UtFF30epeLV$13whkJmL7YzzRV9DDvKoZeZ6UhsLv9b5II6PpcuEDwA=','2021-06-19 15:29:53.608507',0,'test_user_guidance1','','','',0,1,'2021-05-25 03:23:54.000000'),(7,'pbkdf2_sha256$260000$tMNsfc2ovqwWCVhVljUe5A$cQ4uqo8f/coL8wMWScSbk/LKAuUqMXuhoZPmPof7dQI=',NULL,0,'test_user_registrar1','','','',0,1,'2021-05-25 03:24:03.000000'),(8,'pbkdf2_sha256$260000$epeEkC4YO0nPa66Mkt2hKE$FVi2qrKcqQ2L/+v5pFPzhtfDAeX8ad1mpi5NHtlibZM=','2021-06-23 01:32:39.188987',0,'test_user_teacher1','','','',0,1,'2021-06-19 15:49:36.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,5,1),(2,6,2),(3,7,3),(4,8,4);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2021-05-20 07:45:25.224155','2','Aratan',1,'[{\"added\": {}}]',8,1),(2,'2021-05-20 08:18:47.347239','1','governmentid object (1)',1,'[{\"added\": {}}]',11,1),(3,'2021-05-21 08:21:33.034086','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(4,'2021-05-21 08:21:47.751116','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(5,'2021-05-21 09:42:01.330245','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(6,'2021-05-21 09:42:45.117143','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(7,'2021-05-21 09:45:33.050572','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(8,'2021-05-21 09:47:44.784668','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(9,'2021-05-21 09:51:10.100629','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(10,'2021-05-21 09:51:20.194209','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(11,'2021-05-21 09:52:08.369029','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(12,'2021-05-21 10:32:47.666965','3','Reginaldo',1,'[{\"added\": {}}]',8,1),(13,'2021-05-21 10:38:18.376691','5','governmentid object (5)',1,'[{\"added\": {}}]',11,1),(14,'2021-05-21 10:52:12.587506','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Lrn id\", \"Esc id\", \"Qvr id\"]}}]',8,1),(15,'2021-05-21 10:52:25.461509','3','Reginaldo',2,'[{\"changed\": {\"fields\": [\"Lrn id\", \"Esc id\", \"Qvr id\"]}}]',8,1),(16,'2021-05-22 09:34:01.330996','4','aratan',1,'[{\"added\": {}}]',8,1),(17,'2021-05-22 09:42:06.463970','4','aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(18,'2021-05-22 09:42:19.983528','4','aratan',2,'[]',8,1),(19,'2021-05-22 09:42:26.016213','3','Reginaldo',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(20,'2021-05-22 09:42:32.525134','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(21,'2021-05-22 09:42:53.084406','4','aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(22,'2021-05-22 09:42:57.721322','3','Reginaldo',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(23,'2021-05-22 09:43:03.867418','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(24,'2021-05-22 09:43:40.466147','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(25,'2021-05-22 09:49:36.626130','2','finance',1,'[{\"added\": {}}]',4,1),(26,'2021-05-22 09:50:01.679337','3','guidance',1,'[{\"added\": {}}]',4,1),(27,'2021-05-22 09:50:30.208596','4','registrar',1,'[{\"added\": {}}]',4,1),(28,'2021-05-22 09:50:57.049369','4','test_user1',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',4,1),(29,'2021-05-22 09:51:11.404695','3','test_user_finance1',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',4,1),(30,'2021-05-22 09:51:20.261710','4','test_user_guidance1',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',4,1),(31,'2021-05-22 09:51:31.226476','2','test_user_registrar1',2,'[{\"changed\": {\"fields\": [\"Username\"]}}]',4,1),(32,'2021-05-22 09:52:40.629457','1','finance_group',1,'[{\"added\": {}}]',3,1),(33,'2021-05-22 09:52:49.884962','2','guidance_group',1,'[{\"added\": {}}]',3,1),(34,'2021-05-22 09:53:00.640746','3','registrar group',1,'[{\"added\": {}}]',3,1),(35,'2021-05-22 09:53:06.825792','3','registrar_group',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',3,1),(36,'2021-05-22 10:03:23.218045','4','aratan',3,'',8,1),(37,'2021-05-22 10:03:33.498395','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(38,'2021-05-22 10:04:20.166793','3','Reginaldo',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(39,'2021-05-22 10:04:30.442767','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(40,'2021-05-22 10:31:38.673820','3','Reginaldo',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(41,'2021-05-24 09:37:40.929890','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(42,'2021-05-25 02:27:58.050717','2','Aratan',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(43,'2021-05-25 02:29:30.542029','3','Reginaldo',2,'[{\"changed\": {\"fields\": [\"Status\"]}}]',8,1),(44,'2021-05-25 03:22:51.429757','3','test_user_finance1',3,'',4,1),(45,'2021-05-25 03:22:51.430805','4','test_user_guidance1',3,'',4,1),(46,'2021-05-25 03:22:51.432076','2','test_user_registrar1',3,'',4,1),(47,'2021-05-25 03:23:18.772563','5','test_user_finance1',1,'[{\"added\": {}}]',4,1),(48,'2021-05-25 03:23:54.969435','6','test_user_guidance1',1,'[{\"added\": {}}]',4,1),(49,'2021-05-25 03:24:03.488281','7','test_user_registrar1',1,'[{\"added\": {}}]',4,1),(50,'2021-05-25 03:35:12.635719','5','test_user_finance1',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(51,'2021-05-25 03:35:19.568395','6','test_user_guidance1',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(52,'2021-05-25 03:35:25.110355','7','test_user_registrar1',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(53,'2021-05-25 08:39:17.114314','1','languages',1,'[{\"added\": {}}]',15,1),(54,'2021-05-25 08:39:33.793266','2','AP',1,'[{\"added\": {}}]',15,1),(55,'2021-05-25 08:39:42.912940','2','ap',2,'[{\"changed\": {\"fields\": [\"Components\"]}}]',15,1),(56,'2021-05-25 08:39:53.244648','3','science',1,'[{\"added\": {}}]',15,1),(57,'2021-05-25 08:40:01.996991','4','math',1,'[{\"added\": {}}]',15,1),(58,'2021-05-25 08:40:19.869795','5','mapeh',1,'[{\"added\": {}}]',15,1),(59,'2021-05-25 08:40:27.528495','6','epp',1,'[{\"added\": {}}]',15,1),(60,'2021-05-25 08:40:36.369349','7','tle',1,'[{\"added\": {}}]',15,1),(61,'2021-06-01 02:23:24.326003','1','Aratan',1,'[{\"added\": {}}]',16,1),(62,'2021-06-01 02:24:40.530664','1','Aratan',2,'[]',16,1),(63,'2021-06-19 15:49:09.906060','4','teacher_group',1,'[{\"added\": {}}]',3,1),(64,'2021-06-19 15:49:36.985194','8','test_user_teacher1',1,'[{\"added\": {}}]',4,1),(65,'2021-06-19 15:49:55.872661','8','test_user_teacher1',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(66,'2021-06-19 15:56:33.368750','1','teachers object (1)',1,'[{\"added\": {}}]',17,1),(67,'2021-06-20 02:21:04.447623','1','test_user_teacher1',2,'[{\"changed\": {\"fields\": [\"Subject\"]}}]',17,1),(68,'2021-06-20 02:47:33.680021','1','test_user_teacher1',2,'[{\"changed\": {\"fields\": [\"Subject\"]}}]',17,1),(69,'2021-06-20 04:47:45.095094','7','tle',2,'[{\"changed\": {\"fields\": [\"Sub performance task\"]}}]',15,1),(70,'2021-06-20 04:47:49.048162','7','tle',2,'[]',15,1),(71,'2021-06-20 04:56:33.179337','7','tle',2,'[]',15,1),(72,'2021-06-20 04:56:36.815598','6','epp',2,'[{\"changed\": {\"fields\": [\"Sub performance task\"]}}]',15,1),(73,'2021-06-20 04:56:40.285525','5','mapeh',2,'[{\"changed\": {\"fields\": [\"Sub performance task\"]}}]',15,1),(74,'2021-06-20 04:56:44.550528','4','math',2,'[{\"changed\": {\"fields\": [\"Sub performance task\"]}}]',15,1),(75,'2021-06-20 04:56:47.823666','3','science',2,'[{\"changed\": {\"fields\": [\"Sub performance task\"]}}]',15,1),(76,'2021-06-20 04:56:50.488405','1','languages',2,'[{\"changed\": {\"fields\": [\"Sub performance task\"]}}]',15,1),(77,'2021-06-20 05:01:23.681979','1','enrolled_students object (1)',1,'[{\"added\": {}}]',18,1),(78,'2021-06-20 05:18:09.535362','1','test_user_teacher1',2,'[{\"changed\": {\"fields\": [\"Section\"]}}]',17,1),(79,'2021-06-20 05:28:30.499934','1','test_user_teacher1',2,'[{\"changed\": {\"fields\": [\"Section\"]}}]',17,1),(80,'2021-06-22 10:43:59.308257','1','Aratan',2,'[{\"changed\": {\"fields\": [\"Written work grade\"]}}]',16,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(15,'grading_management','preschool_grading'),(16,'grading_management','students'),(17,'grading_management','teachers'),(7,'manager_enrollment','alumni'),(8,'manager_enrollment','application'),(9,'manager_enrollment','educbackground'),(18,'manager_enrollment','enrolled_students'),(10,'manager_enrollment','fambackground'),(11,'manager_enrollment','governmentid'),(12,'manager_enrollment','health'),(13,'manager_enrollment','schoolsurvey'),(14,'manager_enrollment','test'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-05-20 07:19:25.317894'),(2,'auth','0001_initial','2021-05-20 07:19:25.384060'),(3,'admin','0001_initial','2021-05-20 07:19:25.402693'),(4,'admin','0002_logentry_remove_auto_add','2021-05-20 07:19:25.407481'),(5,'admin','0003_logentry_add_action_flag_choices','2021-05-20 07:19:25.411960'),(6,'contenttypes','0002_remove_content_type_name','2021-05-20 07:19:25.430479'),(7,'auth','0002_alter_permission_name_max_length','2021-05-20 07:19:25.435838'),(8,'auth','0003_alter_user_email_max_length','2021-05-20 07:19:25.441313'),(9,'auth','0004_alter_user_username_opts','2021-05-20 07:19:25.446400'),(10,'auth','0005_alter_user_last_login_null','2021-05-20 07:19:25.456882'),(11,'auth','0006_require_contenttypes_0002','2021-05-20 07:19:25.457922'),(12,'auth','0007_alter_validators_add_error_messages','2021-05-20 07:19:25.462245'),(13,'auth','0008_alter_user_username_max_length','2021-05-20 07:19:25.468356'),(14,'auth','0009_alter_user_last_name_max_length','2021-05-20 07:19:25.473723'),(15,'auth','0010_alter_group_name_max_length','2021-05-20 07:19:25.480948'),(16,'auth','0011_update_proxy_permissions','2021-05-20 07:19:25.485456'),(17,'auth','0012_alter_user_first_name_max_length','2021-05-20 07:19:25.490372'),(18,'manager_enrollment','0001_initial','2021-05-20 07:19:25.524980'),(19,'sessions','0001_initial','2021-05-20 07:19:25.530900'),(20,'manager_enrollment','0002_alter_application_reg_date','2021-05-20 07:21:12.294525'),(21,'manager_enrollment','0003_alter_application_reg_date','2021-05-20 07:33:33.627080'),(22,'manager_enrollment','0004_alter_application_reg_date','2021-05-20 07:35:20.336960'),(23,'manager_enrollment','0005_alter_application_address','2021-05-20 07:43:48.380178'),(24,'manager_enrollment','0006_auto_20210521_1836','2021-05-21 10:36:26.761493'),(25,'manager_enrollment','0007_auto_20210521_1850','2021-05-21 10:50:51.197037'),(26,'manager_enrollment','0008_delete_schoolsurvey','2021-05-22 12:09:53.165971'),(27,'manager_enrollment','0009_schoolsurvey','2021-05-22 12:10:13.154085'),(28,'manager_enrollment','0010_auto_20210525_1547','2021-05-25 07:47:17.241757'),(29,'grading_management','0001_initial','2021-05-25 08:35:23.814331'),(30,'grading_management','0002_students','2021-05-25 08:58:36.789068'),(31,'grading_management','0003_rename_components_preschool_grading_subject','2021-06-01 02:16:27.718339'),(32,'grading_management','0004_teachers','2021-06-19 15:54:31.293692'),(33,'grading_management','0005_rename_last_name_teachers_username','2021-06-19 15:57:39.335537'),(34,'grading_management','0006_preschool_grading_sub_performance_task','2021-06-20 04:43:27.142232'),(35,'grading_management','0007_alter_preschool_grading_sub_performance_task','2021-06-20 04:45:31.690069'),(36,'manager_enrollment','0011_enrolled_students','2021-06-20 04:59:58.927960'),(37,'grading_management','0008_auto_20210620_1317','2021-06-20 05:17:31.245444'),(38,'grading_management','0009_auto_20210620_1623','2021-06-20 08:24:02.107652'),(39,'grading_management','0010_students_raw_written_work','2021-06-23 01:21:32.563360');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0hdiewzojl0ugskxhwr43yt9bed2anoi','.eJxVjMsOwiAQRf-FtSEDpTxcuvcbyAwDUjU0Ke3K-O_apAvd3nPOfYmI21rj1vMSJxZnocTpdyNMj9x2wHdst1mmua3LRHJX5EG7vM6cn5fD_Tuo2Ou3TtpaNkFh8ehAW5-L9TwC5QHQuEzoiQx5x8EmW8qoYChJQ6GggTiJ9wfvTjiQ:1lk2XU:Br4_BwMvLq_hvWM2_b9zd-JyZrN5UXs8yVHoF8D3q7M','2021-06-04 10:37:56.618983'),('23qva3flma3uhjdvp46c89hlfzmvjlbn','.eJxVjMsOwiAQRf-FtSGAvMal-34DGRiQqoGktCvjv2uTLnR7zzn3xQJuaw3byEuYiV2YZaffLWJ65LYDumO7dZ56W5c58l3hBx186pSf18P9O6g46rcGTGdlnQIXc8lEJFwEoRUU6YUtykuTHRkNMgpQCUCiR03WaW9QRs3eH97BN1s:1llSFD:toTWZPXeBF_08KwoO4Av0V_Lp1wTSDBvvqnsGi8JT14','2021-06-08 08:16:55.996333'),('3a7l6j0jrgpc9wdn0ro6dicle52ogtkn','.eJxVjEEOgjAQRe_StWkGp6XUpXvP0Mx0BosaSCisjHcXEha6_e_99zaJ1qWkteqcBjEX05nT78aUnzruQB403iebp3GZB7a7Yg9a7W0SfV0P9y9QqJbtHX3vo1Pnc6bYA7ZtppYV0G8NYZIAghwaJOQzKAh36IAR1YXYAJvPF_-oOEg:1lupoQ:nIjW6d8ztPaK0nsnS5YdHsUn9DXVNoBPPNOVop_vQiA','2021-07-04 05:16:02.319524'),('733rv1d6bjuk23vdq89trw74yt3kzhsg','.eJxVjEEOgjAQRe_StWkGp6XUpXvP0Mx0BosaSCisjHcXEha6_e_99zaJ1qWkteqcBjEX05nT78aUnzruQB403iebp3GZB7a7Yg9a7W0SfV0P9y9QqJbtHX3vo1Pnc6bYA7ZtppYV0G8NYZIAghwaJOQzKAh36IAR1YXYAJvPF_-oOEg:1lvIwL:cygLNwB8FeCLHLFExYWGaDjpJ9O_6V8_928TRGVj4yQ','2021-07-05 12:22:09.607253'),('bkzjr55kbbqri34nlhxyz3rc2cwvolfm','.eJxVjMsOwiAQRf-FtSEDpTxcuvcbyAwDUjU0Ke3K-O_apAvd3nPOfYmI21rj1vMSJxZnocTpdyNMj9x2wHdst1mmua3LRHJX5EG7vM6cn5fD_Tuo2Ou3TtpaNkFh8ehAW5-L9TwC5QHQuEzoiQx5x8EmW8qoYChJQ6GggTiJ9wfvTjiQ:1lsJRi:oBOudNhucXG1yvo6R35v93rxar6jHuiZJjU7JF3szKQ','2021-06-27 06:18:10.126673'),('bwgnqhixkhco5ppbn9dpfcuki6m86rqv','.eJxVjMsOwiAQRf-FtSEDpTxcuvcbyAwDUjU0Ke3K-O_apAvd3nPOfYmI21rj1vMSJxZnocTpdyNMj9x2wHdst1mmua3LRHJX5EG7vM6cn5fD_Tuo2Ou3TtpaNkFh8ehAW5-L9TwC5QHQuEzoiQx5x8EmW8qoYChJQ6GggTiJ9wfvTjiQ:1lnu2F:-IqDTrH6fiBxNtsovuY1DyYUADbO16tf7JJLj7Y__ic','2021-06-15 02:21:39.705006'),('fb9tuby2bso6nmzeldxdcul6ynw25aji','.eJxVjEEOgjAQRe_StWkGp6XUpXvP0Mx0BosaSCisjHcXEha6_e_99zaJ1qWkteqcBjEX05nT78aUnzruQB403iebp3GZB7a7Yg9a7W0SfV0P9y9QqJbtHX3vo1Pnc6bYA7ZtppYV0G8NYZIAghwaJOQzKAh36IAR1YXYAJvPF_-oOEg:1lvrju:UFyyCngTopWbkAV21CkhFZVt4jOlOh4JNkAFA2RHLAA','2021-07-07 01:31:38.593627'),('g7a0q0j3d8fb9va55w2krx0m7wnp0upd','.eJxVjMsOwiAQRf-FtSEDpTxcuvcbyAwDUjU0Ke3K-O_apAvd3nPOfYmI21rj1vMSJxZnocTpdyNMj9x2wHdst1mmua3LRHJX5EG7vM6cn5fD_Tuo2Ou3TtpaNkFh8ehAW5-L9TwC5QHQuEzoiQx5x8EmW8qoYChJQ6GggTiJ9wfvTjiQ:1lw0gU:mMIv5h3o1iXGAVufKB4iLtGgrKxxxKVroZMb6SCaQ08','2021-07-07 11:04:42.493932'),('kwg5bq9bsa656wfe0451et0fyrl802iv','.eJxVjMsOwiAQRf-FtSEDpTxcuvcbyAwDUjU0Ke3K-O_apAvd3nPOfYmI21rj1vMSJxZnocTpdyNMj9x2wHdst1mmua3LRHJX5EG7vM6cn5fD_Tuo2Ou3TtpaNkFh8ehAW5-L9TwC5QHQuEzoiQx5x8EmW8qoYChJQ6GggTiJ9wfvTjiQ:1lkjFv:nR4SX5Y1TcKEetJafvia9Qlid7F5IJJ8eGeRVavRmJI','2021-06-06 08:14:39.194442'),('pg8r90sf19fwbvgjlcfqvy7on8bpf0nk','.eJxVjMsOwiAQRf-FtSEDpTxcuvcbyAwDUjU0Ke3K-O_apAvd3nPOfYmI21rj1vMSJxZnocTpdyNMj9x2wHdst1mmua3LRHJX5EG7vM6cn5fD_Tuo2Ou3TtpaNkFh8ehAW5-L9TwC5QHQuEzoiQx5x8EmW8qoYChJQ6GggTiJ9wfvTjiQ:1llTUd:9NKisS-oZO92yNBorUWYnM-ww_hngU2HunUO0IqLt1M','2021-06-08 09:36:55.833154'),('pyx4ghxwpamnzfzrpamxiglkpou7lwsz','.eJxVjMsOwiAQRf-FtSEDpTxcuvcbyAwDUjU0Ke3K-O_apAvd3nPOfYmI21rj1vMSJxZnocTpdyNMj9x2wHdst1mmua3LRHJX5EG7vM6cn5fD_Tuo2Ou3TtpaNkFh8ehAW5-L9TwC5QHQuEzoiQx5x8EmW8qoYChJQ6GggTiJ9wfvTjiQ:1lvrnw:DUn_XsYA4xTd14r06goE-NQZIqapNrZ6xyaUarHZw4w','2021-07-07 01:35:48.850449'),('ucb6mdfsxeqw6evsrgsug705oe1ga15o','.eJxVjEEOgjAQRe_StWkGp6XUpXvP0Mx0BosaSCisjHcXEha6_e_99zaJ1qWkteqcBjEX05nT78aUnzruQB403iebp3GZB7a7Yg9a7W0SfV0P9y9QqJbtHX3vo1Pnc6bYA7ZtppYV0G8NYZIAghwaJOQzKAh36IAR1YXYAJvPF_-oOEg:1lvapE:nzO-oqbzSVX4NgRK66NS4tdAhjhGniQnzlEbKa2z30s','2021-07-06 07:28:00.242023');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grading_management_preschool_grading`
--

DROP TABLE IF EXISTS `grading_management_preschool_grading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grading_management_preschool_grading` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject` longtext,
  `written_work` int(11) NOT NULL,
  `performance_task` int(11) NOT NULL,
  `quarterly_assessment` int(11) NOT NULL,
  `sub_performance_task` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grading_management_preschool_grading`
--

LOCK TABLES `grading_management_preschool_grading` WRITE;
/*!40000 ALTER TABLE `grading_management_preschool_grading` DISABLE KEYS */;
INSERT INTO `grading_management_preschool_grading` VALUES (1,'languages',30,50,20,'{\"Recitation\": 20, \"Project\": 20, \"QTIPT:\" 20}'),(2,'ap',30,50,20,NULL),(3,'science',40,40,20,'{\"Recitation\": 20, \"Project\": 20, \"QTIPT:\" 20}'),(4,'math',40,40,20,'{\"Recitation\": 20, \"Project\": 20, \"QTIPT:\" 20}'),(5,'mapeh',20,60,20,'{\"Recitation\": 20, \"Project\": 20, \"QTIPT:\" 20}'),(6,'epp',20,60,20,'{\"Recitation\": 20, \"Project\": 20, \"QTIPT:\" 20}'),(7,'tle',20,60,20,'{\"Recitation\": 20, \"Project\": 20, \"QTIPT:\" 20}');
/*!40000 ALTER TABLE `grading_management_preschool_grading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grading_management_students`
--

DROP TABLE IF EXISTS `grading_management_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grading_management_students` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `last_name` longtext,
  `first_name` longtext,
  `q1_grade` int(11) NOT NULL,
  `q2_grade` int(11) NOT NULL,
  `q3_grade` int(11) NOT NULL,
  `q4_grade` int(11) NOT NULL,
  `performance_task_grade` int(11) NOT NULL,
  `initial_grade` int(11) NOT NULL,
  `subject` longtext,
  `section` longtext,
  `transm_grade` int(11) NOT NULL,
  `written_work_grade` int(11) NOT NULL,
  `raw_written_work` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grading_management_students`
--

LOCK TABLES `grading_management_students` WRITE;
/*!40000 ALTER TABLE `grading_management_students` DISABLE KEYS */;
INSERT INTO `grading_management_students` VALUES (1,'Aratan','Nikko Rei',0,0,0,0,0,0,'math','AE1MA',0,76,'[\'12\', \'12\', \'21\', \'31\', \'0\']');
/*!40000 ALTER TABLE `grading_management_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grading_management_teachers`
--

DROP TABLE IF EXISTS `grading_management_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grading_management_teachers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` longtext,
  `subject` longtext,
  `section` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grading_management_teachers`
--

LOCK TABLES `grading_management_teachers` WRITE;
/*!40000 ALTER TABLE `grading_management_teachers` DISABLE KEYS */;
INSERT INTO `grading_management_teachers` VALUES (1,'test_user_teacher1','math,science,english','A4QWE,A3QWE');
/*!40000 ALTER TABLE `grading_management_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_enrollment_application`
--

DROP TABLE IF EXISTS `manager_enrollment_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_enrollment_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstname` longtext NOT NULL,
  `middlename` longtext NOT NULL,
  `lastname` longtext NOT NULL,
  `ext_name` longtext,
  `email` longtext,
  `reg_date` datetime(6) NOT NULL,
  `gradelevel` longtext NOT NULL,
  `studenttype` longtext NOT NULL,
  `gender` longtext NOT NULL,
  `dateofbirth` date NOT NULL,
  `placeofbirth` longtext NOT NULL,
  `province` longtext NOT NULL,
  `mobilenumber` bigint(20) NOT NULL,
  `telephonenumber` bigint(20) DEFAULT NULL,
  `nationality` longtext NOT NULL,
  `religion` longtext NOT NULL,
  `address` longtext NOT NULL,
  `barangay` longtext NOT NULL,
  `city` longtext NOT NULL,
  `status_finance` longtext NOT NULL,
  `esc_id` int(11) DEFAULT NULL,
  `lrn_id` int(11) DEFAULT NULL,
  `qvr_id` int(11) DEFAULT NULL,
  `status_guidance` longtext NOT NULL,
  `status_registrar` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_enrollment_application`
--

LOCK TABLES `manager_enrollment_application` WRITE;
/*!40000 ALTER TABLE `manager_enrollment_application` DISABLE KEYS */;
INSERT INTO `manager_enrollment_application` VALUES (2,'Nikko Rei','Bayeta','Aratan','None','aratannikkorei@yahoo.com','2021-05-20 07:44:02.000000','GRADE 12','NEW','Male','1997-09-01','Tanza,Cavite','Cavite',9397672721,4545045,'Filipino','Catholic','073 Capt. Jose St.','Julugan 1','Tanza','approved',23124,12313,32134,'approved','pending'),(3,'Virginia','Patingan','Reginaldo','None','virgie.reginaldo29@gmail.com','2021-05-21 10:31:03.000000','GRADE 12','NEW','Female','1997-10-29','Taguig','Taguig',9356995434,4545045,'Filipino','Catholic','Taguig','Taguig','Taguig','declined',23411,43241,23133,'approved','pending');
/*!40000 ALTER TABLE `manager_enrollment_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager_enrollment_enrolled_students`
--

DROP TABLE IF EXISTS `manager_enrollment_enrolled_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager_enrollment_enrolled_students` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `firstname` longtext NOT NULL,
  `middlename` longtext NOT NULL,
  `lastname` longtext NOT NULL,
  `gradelevel` longtext NOT NULL,
  `section` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager_enrollment_enrolled_students`
--

LOCK TABLES `manager_enrollment_enrolled_students` WRITE;
/*!40000 ALTER TABLE `manager_enrollment_enrolled_students` DISABLE KEYS */;
INSERT INTO `manager_enrollment_enrolled_students` VALUES (1,'Nikko Rei','Bayeta','Aratan','4','A4QWE');
/*!40000 ALTER TABLE `manager_enrollment_enrolled_students` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-23  5:23:44
