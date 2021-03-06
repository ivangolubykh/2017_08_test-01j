-- MySQL dump 10.13  Distrib 5.5.57, for linux-glibc2.12 (x86_64)
--
-- Host: localhost    Database: task_list_db
-- ------------------------------------------------------
-- Server version	5.5.57

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
-- Table structure for table `app_task_list_task`
--

DROP TABLE IF EXISTS `app_task_list_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_task_list_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime_create` datetime NOT NULL,
  `datetime_update` datetime NOT NULL,
  `name` varchar(200) NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_task_list_task_datetime_create_6155480f` (`datetime_create`),
  KEY `app_task_list_task_datetime_update_c0571717` (`datetime_update`),
  KEY `app_task_list_task_name_de37a87b` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_task_list_task`
--

LOCK TABLES `app_task_list_task` WRITE;
/*!40000 ALTER TABLE `app_task_list_task` DISABLE KEYS */;
INSERT INTO `app_task_list_task` VALUES (1,'2017-08-26 00:31:30','2017-08-26 00:31:30','Парадокс двух конвертов','Проводится лотерея. Предлагаются два конверта, в которых находятся две суммы денег, причём в одном из конвертов сумма отличается от суммы в другом конверте ровно в два раза. Никакие действия (измерительные и т. п.) совершать с конвертами нельзя. Можно лишь открыть один любой конверт и посчитать в нем деньги, после чего сделать выбор — взять этот конверт или взять другой конверт, чтобы получить большую сумму.\n\nПредположим, что мы увидели в одном из конвертов x рублей. Тогда в другом может быть 0,5x или 2x руб. Таким образом, считая, что в другом конверте равновероятно находится либо 0,5x, либо 2x, определяем средний выигрыш в случае, если мы возьмём другой конверт: (0,5x+2x)/2=1,25x рублей (соответственно, разумнее выбирать именно его, хотя мы и не знаем, больше там денег или меньше), что противоречит интуитивной симметрии задачи.'),(2,'2017-08-26 00:31:46','2017-08-26 00:31:46','Написать текст для этой задачи.',''),(3,'2017-08-26 00:32:04','2017-08-26 00:32:04','Выполнить планы с 5-го по 17-й включительно.','1.    Вспомнить детство и побегать за бабочками с сачком.\n2.    Сходить в лес за ягодами и грибами.\n3.    Сплести венок на голову из полевых цветов.\n4.    Побегать босиком по траве.\n5.    Устроить пикник с друзьями на берегу реки или в лесу.\n6.    Испечь картошку на костре.\n7.    Искупаться в реке или озере.\n8.    Прыгнуть через костер на праздник Купала.\n9.    Устроить день Водяного и обливаться водой.\n10.  Покататься на качелях.\n11.  Поспать в гамаке.\n12.  Искупаться ночью «нагишом».\n13.  Поймать кузнечика.\n14.  Полежать на траве, разглядывая облака.\n15.  Залезть на невысокое дерево.\n16.  Сходить в поход на несколько дней с палатками.\n17.  Увидеть красивую радугу и загадать желание.\n18.  Побегать под дождем.\n19.  Устроить летнюю фотосессию в цветах.\n20.  С разбега прыгнуть в воду.');
/*!40000 ALTER TABLE `app_task_list_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_task_list_user`
--

DROP TABLE IF EXISTS `app_task_list_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_task_list_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_task_list_user`
--

LOCK TABLES `app_task_list_user` WRITE;
/*!40000 ALTER TABLE `app_task_list_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_task_list_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_task_list_user_groups`
--

DROP TABLE IF EXISTS `app_task_list_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_task_list_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_task_list_user_groups_user_id_group_id_b45f30d8_uniq` (`user_id`,`group_id`),
  KEY `app_task_list_user_groups_group_id_e697fbc5_fk_auth_group_id` (`group_id`),
  CONSTRAINT `app_task_list_user_groups_group_id_e697fbc5_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `app_task_list_user_g_user_id_0dc20d1a_fk_app_task_` FOREIGN KEY (`user_id`) REFERENCES `app_task_list_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_task_list_user_groups`
--

LOCK TABLES `app_task_list_user_groups` WRITE;
/*!40000 ALTER TABLE `app_task_list_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_task_list_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_task_list_user_user_permissions`
--

DROP TABLE IF EXISTS `app_task_list_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_task_list_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_task_list_user_user__user_id_permission_id_287ae550_uniq` (`user_id`,`permission_id`),
  KEY `app_task_list_user_u_permission_id_6f320345_fk_auth_perm` (`permission_id`),
  CONSTRAINT `app_task_list_user_u_permission_id_6f320345_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `app_task_list_user_u_user_id_a80c0bf2_fk_app_task_` FOREIGN KEY (`user_id`) REFERENCES `app_task_list_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_task_list_user_user_permissions`
--

LOCK TABLES `app_task_list_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `app_task_list_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `app_task_list_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add user',6,'add_user'),(17,'Can change user',6,'change_user'),(18,'Can delete user',6,'delete_user'),(19,'Can add task',7,'add_task'),(20,'Can change task',7,'change_task'),(21,'Can delete task',7,'delete_task');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_app_task_list_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_app_task_list_user_id` FOREIGN KEY (`user_id`) REFERENCES `app_task_list_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(7,'app_task_list','task'),(6,'app_task_list','user'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-08-25 15:35:24'),(2,'contenttypes','0002_remove_content_type_name','2017-08-25 15:35:25'),(3,'auth','0001_initial','2017-08-25 15:35:25'),(4,'auth','0002_alter_permission_name_max_length','2017-08-25 15:35:25'),(5,'auth','0003_alter_user_email_max_length','2017-08-25 15:35:25'),(6,'auth','0004_alter_user_username_opts','2017-08-25 15:35:25'),(7,'auth','0005_alter_user_last_login_null','2017-08-25 15:35:25'),(8,'auth','0006_require_contenttypes_0002','2017-08-25 15:35:25'),(9,'auth','0007_alter_validators_add_error_messages','2017-08-25 15:35:25'),(10,'auth','0008_alter_user_username_max_length','2017-08-25 15:35:25'),(11,'app_task_list','0001_initial','2017-08-25 15:35:25'),(12,'admin','0001_initial','2017-08-25 15:35:25'),(13,'admin','0002_logentry_remove_auto_add','2017-08-25 15:35:25'),(14,'sessions','0001_initial','2017-08-25 15:35:25'),(15,'app_task_list','0002_task','2017-08-25 15:59:06'),(16,'app_task_list','0003_auto_20170825_2258','2017-08-25 22:58:16'),(17,'app_task_list','0004_auto_20170826_0030','2017-08-26 00:30:50');
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
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-26  0:32:31
