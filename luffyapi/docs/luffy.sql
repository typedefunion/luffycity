-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: luffy_db
-- ------------------------------------------------------
-- Server version	5.7.25

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
  `codename` varchar(100) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry','add_logentry',1),(2,'Can change log entry','change_logentry',1),(3,'Can delete log entry','delete_logentry',1),(4,'Can view log entry','view_logentry',1),(5,'Can add permission','add_permission',2),(6,'Can change permission','change_permission',2),(7,'Can delete permission','delete_permission',2),(8,'Can view permission','view_permission',2),(9,'Can add group','add_group',3),(10,'Can change group','change_group',3),(11,'Can delete group','delete_group',3),(12,'Can view group','view_group',3),(13,'Can add content type','add_contenttype',4),(14,'Can change content type','change_contenttype',4),(15,'Can delete content type','delete_contenttype',4),(16,'Can view content type','view_contenttype',4),(17,'Can add session','add_session',5),(18,'Can change session','change_session',5),(19,'Can delete session','delete_session',5),(20,'Can view session','view_session',5),(21,'Can add User Widget','add_userwidget',6),(22,'Can change User Widget','change_userwidget',6),(23,'Can delete User Widget','delete_userwidget',6),(24,'Can view User Widget','view_userwidget',6),(25,'Can add User Setting','add_usersettings',7),(26,'Can change User Setting','change_usersettings',7),(27,'Can delete User Setting','delete_usersettings',7),(28,'Can view User Setting','view_usersettings',7),(29,'Can add log entry','add_log',8),(30,'Can change log entry','change_log',8),(31,'Can delete log entry','delete_log',8),(32,'Can view log entry','view_log',8),(33,'Can add Bookmark','add_bookmark',9),(34,'Can change Bookmark','change_bookmark',9),(35,'Can delete Bookmark','delete_bookmark',9),(36,'Can view Bookmark','view_bookmark',9),(37,'Can add revision','add_revision',10),(38,'Can change revision','change_revision',10),(39,'Can delete revision','delete_revision',10),(40,'Can view revision','view_revision',10),(41,'Can add version','add_version',11),(42,'Can change version','change_version',11),(43,'Can delete version','delete_version',11),(44,'Can view version','view_version',11),(45,'Can add 轮播图','add_bannerinfo',12),(46,'Can change 轮播图','change_bannerinfo',12),(47,'Can delete 轮播图','delete_bannerinfo',12),(48,'Can view 轮播图','view_bannerinfo',12),(49,'Can add 导航','add_navinfo',13),(50,'Can change 导航','change_navinfo',13),(51,'Can delete 导航','delete_navinfo',13),(52,'Can view 导航','view_navinfo',13),(53,'Can add 用户','add_user',14),(54,'Can change 用户','change_user',14),(55,'Can delete 用户','delete_user',14),(56,'Can view 用户','view_user',14),(57,'Can add 课程课时','add_courselesson',15),(58,'Can change 课程课时','change_courselesson',15),(59,'Can delete 课程课时','delete_courselesson',15),(60,'Can view 课程课时','view_courselesson',15),(61,'Can add 课程分类','add_coursecategory',16),(62,'Can change 课程分类','change_coursecategory',16),(63,'Can delete 课程分类','delete_coursecategory',16),(64,'Can view 课程分类','view_coursecategory',16),(65,'Can add 课程章节','add_coursechapter',17),(66,'Can change 课程章节','change_coursechapter',17),(67,'Can delete 课程章节','delete_coursechapter',17),(68,'Can view 课程章节','view_coursechapter',17),(69,'Can add 专题课程','add_course',18),(70,'Can change 专题课程','change_course',18),(71,'Can delete 专题课程','delete_course',18),(72,'Can view 专题课程','view_course',18),(73,'Can add 讲师导师','add_teacher',19),(74,'Can change 讲师导师','change_teacher',19),(75,'Can delete 讲师导师','delete_teacher',19),(76,'Can view 讲师导师','view_teacher',19),(77,'Can add 课程有效期选项','add_courseexpire',20),(78,'Can change 课程有效期选项','change_courseexpire',20),(79,'Can delete 课程有效期选项','delete_courseexpire',20),(80,'Can view 课程有效期选项','view_courseexpire',20),(81,'Can add 商品活动','add_activity',21),(82,'Can change 商品活动','change_activity',21),(83,'Can delete 商品活动','delete_activity',21),(84,'Can view 商品活动','view_activity',21),(85,'Can add 课程优惠类型','add_pricediscounttype',22),(86,'Can change 课程优惠类型','change_pricediscounttype',22),(87,'Can delete 课程优惠类型','delete_pricediscounttype',22),(88,'Can view 课程优惠类型','view_pricediscounttype',22),(89,'Can add 课程与优惠策略的关系表','add_coursepricediscount',23),(90,'Can change 课程与优惠策略的关系表','change_coursepricediscount',23),(91,'Can delete 课程与优惠策略的关系表','delete_coursepricediscount',23),(92,'Can view 课程与优惠策略的关系表','view_coursepricediscount',23),(93,'Can add 价格优惠策略','add_pricediscount',24),(94,'Can change 价格优惠策略','change_pricediscount',24),(95,'Can delete 价格优惠策略','delete_pricediscount',24),(96,'Can view 价格优惠策略','view_pricediscount',24),(97,'Can add 订单记录','add_order',25),(98,'Can change 订单记录','change_order',25),(99,'Can delete 订单记录','delete_order',25),(100,'Can view 订单记录','view_order',25),(101,'Can add 订单详情','add_orderdetail',26),(102,'Can change 订单详情','change_orderdetail',26),(103,'Can delete 订单详情','delete_orderdetail',26),(104,'Can view 订单详情','view_orderdetail',26),(105,'Can add 用户的优惠券','add_usercoupon',27),(106,'Can change 用户的优惠券','change_usercoupon',27),(107,'Can delete 用户的优惠券','delete_usercoupon',27),(108,'Can view 用户的优惠券','view_usercoupon',27),(109,'Can add 优惠券','add_coupon',28),(110,'Can change 优惠券','change_coupon',28),(111,'Can delete 优惠券','delete_coupon',28),(112,'Can view 优惠券','view_coupon',28),(113,'Can add credit','add_credit',29),(114,'Can change credit','change_credit',29),(115,'Can delete credit','delete_credit',29),(116,'Can view credit','view_credit',29),(117,'Can add 课程购买记录','add_usercourse',30),(118,'Can change 课程购买记录','change_usercourse',30),(119,'Can delete 课程购买记录','delete_usercourse',30),(120,'Can view 课程购买记录','view_usercourse',30);
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
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_ly_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(28,'coupon','coupon'),(27,'coupon','usercoupon'),(21,'courses','activity'),(18,'courses','course'),(16,'courses','coursecategory'),(17,'courses','coursechapter'),(20,'courses','courseexpire'),(15,'courses','courselesson'),(23,'courses','coursepricediscount'),(24,'courses','pricediscount'),(22,'courses','pricediscounttype'),(19,'courses','teacher'),(12,'home','bannerinfo'),(13,'home','navinfo'),(25,'orders','order'),(26,'orders','orderdetail'),(10,'reversion','revision'),(11,'reversion','version'),(5,'sessions','session'),(29,'users','credit'),(14,'users','user'),(30,'users','usercourse'),(9,'xadmin','bookmark'),(8,'xadmin','log'),(7,'xadmin','usersettings'),(6,'xadmin','userwidget');
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
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-08-07 16:49:05.077134'),(2,'contenttypes','0002_remove_content_type_name','2019-08-07 16:49:05.140131'),(3,'auth','0001_initial','2019-08-07 16:49:05.202047'),(4,'users','0001_initial','2019-08-07 16:49:05.407030'),(5,'admin','0001_initial','2019-08-07 16:49:05.537186'),(6,'admin','0002_logentry_user','2019-08-07 16:49:05.585185'),(7,'home','0001_initial','2019-08-07 16:49:05.678227'),(8,'reversion','0001_initial','2019-08-07 16:49:05.787655'),(9,'sessions','0001_initial','2019-08-07 16:49:05.908926'),(10,'xadmin','0001_initial','2019-08-07 16:49:06.037076'),(11,'courses','0001_initial','2019-08-13 15:22:29.840266'),(12,'courses','0002_auto_20190814_1454','2019-08-14 06:55:43.990264'),(13,'courses','0003_auto_20190815_1713','2019-08-15 09:13:46.347529'),(14,'courses','0004_course_course_video','2019-08-16 03:43:28.423651'),(15,'courses','0005_courseexpire','2019-08-19 08:44:53.058323'),(16,'courses','0006_auto_20190819_1659','2019-08-19 08:59:19.248126'),(17,'courses','0007_auto_20190819_2003','2019-08-19 12:04:03.013881'),(18,'orders','0001_initial','2019-08-26 17:46:03.023613'),(19,'coupon','0001_initial','2019-08-26 22:00:59.586614'),(20,'coupon','0002_auto_20190827_2027','2019-08-27 20:28:05.645724'),(21,'users','0002_auto_20190827_2027','2019-08-27 20:28:05.985178'),(22,'users','0003_auto_20190827_2035','2019-08-27 20:35:26.312840'),(23,'users','0004_usercourse','2019-08-28 22:36:37.610240');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('q7mabhvo7e75kdd7uq340if8wkgmwams','NjJiOWFhMzMyN2M5ZWE0Zjk4YzE0NjcwOTA2MWQ4YWU5NmY0OTM5Yjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudXRpbHMuVXNlcm5hbWVNb2JpbGVBdXRoQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjZkMzM5NTNlMTYxMTJjZGNlMWMzNTU0MTk0NGYyYmIxNDk2Njg1MGQiLCJMSVNUX1FVRVJZIjpbWyJob21lIiwibmF2aW5mbyJdLCIiXX0=','2019-08-23 12:22:32.013573');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_activity`
--

DROP TABLE IF EXISTS `ly_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(150) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `remark` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_activity`
--

LOCK TABLES `ly_activity` WRITE;
/*!40000 ALTER TABLE `ly_activity` DISABLE KEYS */;
INSERT INTO `ly_activity` VALUES (1,1,1,0,'2019-08-19 20:51:00.687090','2019-08-19 20:51:00.687112','超级新品日','2019-08-19 00:00:00.000000','2019-09-19 00:00:00.000000',NULL),(2,2,1,0,'2019-08-19 20:52:11.172690','2019-08-19 20:52:11.172736','中秋节快乐够','2019-09-01 00:00:00.000000','2019-10-08 00:00:00.000000',NULL),(3,3,1,0,'2019-08-19 20:53:55.813859','2019-08-19 20:53:55.813896','日常满减','2019-08-19 20:53:00.000000','2022-11-01 20:53:00.000000',NULL);
/*!40000 ALTER TABLE `ly_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_banner`
--

DROP TABLE IF EXISTS `ly_banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `note` varchar(150) NOT NULL,
  `link` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_banner`
--

LOCK TABLES `ly_banner` WRITE;
/*!40000 ALTER TABLE `ly_banner` DISABLE KEYS */;
INSERT INTO `ly_banner` VALUES (1,1,1,0,'2019-08-09 12:20:48.537735','2019-08-09 12:20:48.537770','banner/1_b2JtHxR.png','第一张','李老板','www.jd.com'),(2,2,1,0,'2019-08-09 12:21:06.118315','2019-08-09 12:21:06.118346','banner/2_Serq6x6.jpeg','第二张','张老板','http://www.baidu.com');
/*!40000 ALTER TABLE `ly_banner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_coupon`
--

DROP TABLE IF EXISTS `ly_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(64) NOT NULL,
  `coupon_type` smallint(6) NOT NULL,
  `timer` int(11) NOT NULL,
  `condition` int(11) NOT NULL,
  `sale` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_coupon`
--

LOCK TABLES `ly_coupon` WRITE;
/*!40000 ALTER TABLE `ly_coupon` DISABLE KEYS */;
INSERT INTO `ly_coupon` VALUES (1,1,1,0,'2019-08-26 22:20:08.694864','2019-08-26 22:20:08.694894','十元优惠券',1,30,10,'-10'),(2,2,1,0,'2019-08-26 22:20:36.815842','2019-08-26 22:20:36.815871','五十元优惠券',1,30,50,'-50'),(3,3,1,0,'2019-08-26 22:21:13.259992','2019-08-26 22:21:13.260048','九折优惠券',2,7,100,'*0.9');
/*!40000 ALTER TABLE `ly_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_course`
--

DROP TABLE IF EXISTS `ly_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(128) NOT NULL,
  `course_img` varchar(255) DEFAULT NULL,
  `course_type` smallint(6) NOT NULL,
  `brief` longtext,
  `level` smallint(6) NOT NULL,
  `pub_date` date NOT NULL,
  `period` int(11) NOT NULL,
  `attachment_path` varchar(128) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `students` int(11) NOT NULL,
  `lessons` int(11) NOT NULL,
  `pub_lessons` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `course_category_id` int(11) DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `course_video` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_course_course_category_id_0fae919c_fk_ly_course_category_id` (`course_category_id`),
  KEY `ly_course_teacher_id_1a7162ce_fk_ly_teacher_id` (`teacher_id`),
  CONSTRAINT `ly_course_course_category_id_0fae919c_fk_ly_course_category_id` FOREIGN KEY (`course_category_id`) REFERENCES `ly_course_category` (`id`),
  CONSTRAINT `ly_course_teacher_id_1a7162ce_fk_ly_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `ly_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_course`
--

LOCK TABLES `ly_course` WRITE;
/*!40000 ALTER TABLE `ly_course` DISABLE KEYS */;
INSERT INTO `ly_course` VALUES (1,1,1,0,'2019-08-13 15:43:17.033224','2019-08-19 09:52:17.514612','Python开发21天入门','course/course-cover.jpeg',0,'<p>我的图片呢？ <img alt=\"\" src=\"/media/course/course-cover_fJVWBPY.jpeg\" />这将是一段很长的详情介绍</p>',0,'2019-08-13',7,'README.md',0,93606,154,154,888.00,1,1,'course/mda-jbjpbuzeb0b7qzey.mp4'),(2,2,1,0,'2019-08-13 15:44:40.249161','2019-08-16 04:08:39.369883','爬虫从门到进阶','course/Loginbg.3377d0c_PEJYW6A.jpg',0,'<p>这将是一段很长的详情介绍</p>',1,'2019-08-13',7,'README_6smHeH6.md',0,42510,65,50,199.00,1,2,''),(3,3,1,0,'2019-08-14 08:58:10.293390','2019-08-14 08:58:10.293451','负载均衡','course/Loginbg.3377d0c_eV6Iaju.jpg',0,'这将是一段很长的详情介绍',0,'2019-08-14',7,'README_dzKKwZc.md',0,520,45,40,250.00,2,2,NULL),(4,4,1,0,'2019-08-14 08:59:22.834549','2019-08-14 08:59:22.834581','linux进阶','course/Loginbg.3377d0c_v9pD5Me.jpg',0,'这将是一段很长的详情介绍',1,'2019-08-14',7,'README_y52cxDr.md',0,200,80,80,500.00,2,2,NULL),(5,5,1,0,'2019-08-14 09:01:14.083819','2019-08-14 09:01:14.083946','7天玩转Vue','course/2.jpeg',0,'这将是一段很长的详情介绍',0,'2019-08-14',7,'README_btwCadQ.md',0,199,30,30,99.00,3,1,NULL),(6,6,1,0,'2019-08-14 09:02:50.070018','2019-08-14 11:34:04.635396','jQuery进阶','course/2_cCNq6iH.jpeg',0,'这将是一段很长的详情介绍',1,'2019-08-14',7,'README_O608Fle.md',0,654,75,70,800.00,3,1,NULL),(7,7,1,0,'2019-08-14 09:04:21.935104','2019-08-14 09:04:21.935165','Python从小白到大神','course/course-cover_fJVWBPY.jpeg',0,'这将是一段很长的详情介绍',1,'2019-08-14',7,'README_GBWF9c8.md',0,3564,82,82,5000.00,4,1,NULL),(8,8,1,0,'2019-08-14 09:05:50.193522','2019-08-14 09:05:50.193563','助你成为Python大佬','course/course-cover_tKO3utA.jpeg',0,'这将是一段很长的详情介绍',1,'2019-08-14',7,'README_wQ9CCFj.md',0,653,35,35,900.00,4,2,NULL),(9,9,1,0,'2019-08-14 09:07:57.578227','2019-08-14 11:31:06.096234','C/C++从入门到脱发','course/1.png',0,'这将是一段很长的详情介绍',2,'2019-08-14',7,'README_tlxULXz.md',0,963,50,20,1000.00,5,1,NULL);
/*!40000 ALTER TABLE `ly_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_course_category`
--

DROP TABLE IF EXISTS `ly_course_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_course_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_course_category`
--

LOCK TABLES `ly_course_category` WRITE;
/*!40000 ALTER TABLE `ly_course_category` DISABLE KEYS */;
INSERT INTO `ly_course_category` VALUES (1,1,1,0,'2019-08-13 15:32:25.140059','2019-08-14 11:31:29.571558','python'),(2,2,1,0,'2019-08-13 15:32:56.430905','2019-08-14 11:31:33.760568','linxu运维'),(3,3,1,0,'2019-08-13 15:33:05.082206','2019-08-13 15:33:05.082269','前端开发'),(4,4,1,0,'2019-08-13 15:33:16.111431','2019-08-13 15:33:16.111472','Python进阶'),(5,5,1,0,'2019-08-13 15:33:25.415617','2019-08-13 15:33:25.415647','开发工具'),(6,6,1,1,'2019-08-13 15:33:39.649476','2019-08-14 08:56:08.715993','Go语言');
/*!40000 ALTER TABLE `ly_course_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_course_chapter`
--

DROP TABLE IF EXISTS `ly_course_chapter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_course_chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `chapter` smallint(6) NOT NULL,
  `name` varchar(128) NOT NULL,
  `summary` longtext,
  `pub_date` date NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_course_chapter_course_id_e677b55c_fk_ly_course_id` (`course_id`),
  CONSTRAINT `ly_course_chapter_course_id_e677b55c_fk_ly_course_id` FOREIGN KEY (`course_id`) REFERENCES `ly_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_course_chapter`
--

LOCK TABLES `ly_course_chapter` WRITE;
/*!40000 ALTER TABLE `ly_course_chapter` DISABLE KEYS */;
INSERT INTO `ly_course_chapter` VALUES (1,1,1,0,'2019-08-13 15:45:43.090427','2019-08-14 02:16:56.551104',1,'初识编码','第一章','2019-08-13',1),(2,2,1,0,'2019-08-13 15:46:11.539559','2019-08-13 15:50:17.620484',2,'计算机基础','第二章','2019-08-13',1),(3,3,1,0,'2019-08-13 15:46:39.072001','2019-08-13 15:50:12.700281',3,'Python第一课','第三章','2019-08-13',1),(4,4,1,0,'2019-08-13 15:47:22.250712','2019-08-15 16:06:17.256281',4,'Python第一次实操代码','第四章','2019-08-13',1),(5,5,1,0,'2019-08-13 15:47:51.011462','2019-08-13 15:50:43.055978',5,'项目','第五章','2019-08-13',1),(6,6,1,0,'2019-08-14 09:09:07.506090','2019-08-14 09:09:07.506163',1,'爬虫认知','这是第一章','2019-08-14',2),(7,7,1,0,'2019-08-14 09:09:39.643591','2019-08-14 09:09:39.643656',2,'爬虫应用','这是第二章','2019-08-14',2);
/*!40000 ALTER TABLE `ly_course_chapter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_course_expire`
--

DROP TABLE IF EXISTS `ly_course_expire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_course_expire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `expire_time` int(11) DEFAULT NULL,
  `expire_text` varchar(150) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_course_expire_course_id_e843fad2_fk_ly_course_id` (`course_id`),
  CONSTRAINT `ly_course_expire_course_id_e843fad2_fk_ly_course_id` FOREIGN KEY (`course_id`) REFERENCES `ly_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_course_expire`
--

LOCK TABLES `ly_course_expire` WRITE;
/*!40000 ALTER TABLE `ly_course_expire` DISABLE KEYS */;
INSERT INTO `ly_course_expire` VALUES (1,1,1,0,'2019-08-19 08:51:51.289871','2019-08-19 09:00:58.077397',30,'一个月有效',1,180.00),(2,2,1,0,'2019-08-19 08:52:10.118097','2019-08-19 09:00:51.301084',60,'两个月有效',1,200.00),(3,3,1,0,'2019-08-19 08:52:24.093825','2019-08-19 09:00:43.335090',90,'三个月有效',1,500.00),(5,1,1,0,'2019-08-19 09:01:27.979102','2019-08-19 09:01:27.979144',30,'一个月有效',2,180.00),(6,2,1,0,'2019-08-19 09:01:42.764080','2019-08-19 09:01:42.764122',60,'两个月有效',2,200.00),(7,3,1,0,'2019-08-19 09:01:59.341644','2019-08-19 09:01:59.341776',90,'三个月有效',2,500.00),(9,1,1,0,'2019-08-19 09:02:45.125697','2019-08-19 09:02:45.125726',30,'一个月有效',9,180.00),(10,2,1,0,'2019-08-19 09:03:01.610420','2019-08-19 09:03:01.610453',60,'两个月有效',9,200.00),(11,3,1,0,'2019-08-19 09:03:15.839290','2019-08-19 09:03:15.839356',90,'三个月有效',9,500.00);
/*!40000 ALTER TABLE `ly_course_expire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_course_lesson`
--

DROP TABLE IF EXISTS `ly_course_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_course_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(128) NOT NULL,
  `orders` smallint(5) unsigned NOT NULL,
  `section_type` smallint(6) NOT NULL,
  `section_link` varchar(255) DEFAULT NULL,
  `duration` varchar(32) DEFAULT NULL,
  `pub_date` datetime(6) NOT NULL,
  `free_trail` tinyint(1) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `is_show_list` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_course_lesson_chapter_id_09ff8644_fk_ly_course_chapter_id` (`chapter_id`),
  KEY `ly_course_lesson_course_id_1e932817_fk_ly_course_id` (`course_id`),
  CONSTRAINT `ly_course_lesson_chapter_id_09ff8644_fk_ly_course_chapter_id` FOREIGN KEY (`chapter_id`) REFERENCES `ly_course_chapter` (`id`),
  CONSTRAINT `ly_course_lesson_course_id_1e932817_fk_ly_course_id` FOREIGN KEY (`course_id`) REFERENCES `ly_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_course_lesson`
--

LOCK TABLES `ly_course_lesson` WRITE;
/*!40000 ALTER TABLE `ly_course_lesson` DISABLE KEYS */;
INSERT INTO `ly_course_lesson` VALUES (1,1,0,'2019-08-13 15:51:36.078754','2019-08-30 09:44:23.644216','程序员的第一步',1,2,'a971622b88114705e77d86b6d3162916_a','5:00','2019-08-13 15:51:36.079021',1,1,1,1),(2,1,0,'2019-08-13 15:52:03.536178','2019-08-14 07:49:01.421160','程序员的第二步',2,2,'http://baidu.com','5:30','2019-08-13 15:52:03.536249',1,2,1,1),(3,1,0,'2019-08-13 15:52:36.676062','2019-08-14 07:49:10.679292','程序员的第三步',3,2,'http://baidu.com','5:00','2019-08-13 15:52:36.676174',0,3,1,1),(4,1,0,'2019-08-13 15:52:53.104319','2019-08-15 16:05:32.516961','程序员的第四步',4,2,'http://baidu.com','5:30','2019-08-13 15:52:53.104427',0,4,1,0),(5,1,0,'2019-08-13 15:53:15.146956','2019-08-14 07:49:33.221735','程序员的第五步',5,2,'http://baidu.com','5:00','2019-08-13 15:53:15.147020',0,5,1,0),(6,1,0,'2019-08-14 09:10:38.406312','2019-08-14 09:10:38.406387','爬虫工具的下载',1,2,'http://baidu.com','5:00','2019-08-14 09:10:38.406445',1,6,2,1),(7,1,0,'2019-08-14 09:11:12.957983','2019-08-14 09:11:12.958074','爬虫软件的配置',2,2,'http://baidu.com','5:30','2019-08-14 09:11:12.958129',1,6,2,1),(8,1,0,'2019-08-14 09:11:42.467217','2019-08-14 09:11:42.467250','爬取第一个网站',3,2,'http://baidu.com','5:00','2019-08-14 09:11:42.467288',0,7,2,1),(9,0,0,'2019-08-14 09:12:19.584020','2019-08-14 09:12:19.584069','爬虫终极大招',4,2,'http://baidu.com','5:30','2019-08-14 09:12:19.584202',0,7,2,1);
/*!40000 ALTER TABLE `ly_course_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_course_price_dicount`
--

DROP TABLE IF EXISTS `ly_course_price_dicount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_course_price_dicount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `active_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `discount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_course_price_dicount_active_id_ef099c15_fk_ly_activity_id` (`active_id`),
  KEY `ly_course_price_dicount_course_id_e8675a4d_fk_ly_course_id` (`course_id`),
  KEY `ly_course_price_dico_discount_id_3e8b8e2b_fk_ly_price_` (`discount_id`),
  CONSTRAINT `ly_course_price_dico_discount_id_3e8b8e2b_fk_ly_price_` FOREIGN KEY (`discount_id`) REFERENCES `ly_price_discount` (`id`),
  CONSTRAINT `ly_course_price_dicount_active_id_ef099c15_fk_ly_activity_id` FOREIGN KEY (`active_id`) REFERENCES `ly_activity` (`id`),
  CONSTRAINT `ly_course_price_dicount_course_id_e8675a4d_fk_ly_course_id` FOREIGN KEY (`course_id`) REFERENCES `ly_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_course_price_dicount`
--

LOCK TABLES `ly_course_price_dicount` WRITE;
/*!40000 ALTER TABLE `ly_course_price_dicount` DISABLE KEYS */;
INSERT INTO `ly_course_price_dicount` VALUES (2,2,1,0,'2019-08-19 20:52:40.843803','2019-08-19 20:52:40.843874',1,2,2),(5,5,1,0,'2019-08-19 20:56:02.508240','2019-08-19 20:56:02.508265',1,7,1),(8,8,1,0,'2019-08-19 21:15:12.325364','2019-08-19 21:15:12.325399',1,8,3),(9,4,1,0,'2019-08-20 22:57:30.440982','2019-08-20 22:57:30.441017',1,9,5),(10,5,1,0,'2019-08-20 22:57:52.141597','2019-08-20 22:57:52.141637',1,1,5);
/*!40000 ALTER TABLE `ly_course_price_dicount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_credit`
--

DROP TABLE IF EXISTS `ly_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_credit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `opera` smallint(6) NOT NULL,
  `number` smallint(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_credit_user_id_41bb3032_fk_ly_users_id` (`user_id`),
  CONSTRAINT `ly_credit_user_id_41bb3032_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_credit`
--

LOCK TABLES `ly_credit` WRITE;
/*!40000 ALTER TABLE `ly_credit` DISABLE KEYS */;
/*!40000 ALTER TABLE `ly_credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_nav`
--

DROP TABLE IF EXISTS `ly_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(150) NOT NULL,
  `link` varchar(150) NOT NULL,
  `opt` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_nav`
--

LOCK TABLES `ly_nav` WRITE;
/*!40000 ALTER TABLE `ly_nav` DISABLE KEYS */;
INSERT INTO `ly_nav` VALUES (1,1,1,0,'2019-08-09 12:21:34.354162','2019-08-20 21:25:51.195491','免费课','/course',1),(2,1,1,0,'2019-08-09 12:21:54.470241','2019-08-09 12:22:31.898173','找到我们','http://www.baidu.com',2),(3,2,1,0,'2019-08-09 12:22:19.839458','2019-08-09 12:22:19.839502','联系我们','http://www.jd.com',2);
/*!40000 ALTER TABLE `ly_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_order`
--

DROP TABLE IF EXISTS `ly_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `order_title` varchar(150) NOT NULL,
  `total_price` decimal(6,2) NOT NULL,
  `real_price` decimal(6,2) NOT NULL,
  `order_number` varchar(64) NOT NULL,
  `order_status` smallint(6) NOT NULL,
  `pay_type` smallint(6) NOT NULL,
  `credit` int(11) NOT NULL,
  `coupon` int(11) NOT NULL,
  `order_desc` longtext NOT NULL,
  `pay_time` datetime(6) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_order_user_id_ae588b8c_fk_ly_users_id` (`user_id`),
  CONSTRAINT `ly_order_user_id_ae588b8c_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_order`
--

LOCK TABLES `ly_order` WRITE;
/*!40000 ALTER TABLE `ly_order` DISABLE KEYS */;
INSERT INTO `ly_order` VALUES (1,0,0,0,'2019-08-26 19:32:12.129336','2019-08-29 23:15:00.157672','路飞学城课程购买',843.00,843.00,'201908261932120000019805',3,1,0,0,'',NULL,1),(2,0,0,0,'2019-08-26 20:25:22.332564','2019-08-29 23:15:00.204187','路飞学城课程购买',843.00,843.00,'201908262025220000017663',3,1,0,0,'',NULL,1),(3,0,0,0,'2019-08-26 20:29:48.923224','2019-08-29 23:15:00.215098','路飞学城课程购买',0.00,0.00,'201908262029480000015506',3,1,0,0,'',NULL,1),(4,0,0,0,'2019-08-26 20:29:55.468419','2019-08-29 23:15:00.226787','路飞学城课程购买',0.00,0.00,'201908262029550000018306',3,1,0,0,'',NULL,1),(5,0,0,0,'2019-08-26 20:48:34.000521','2019-08-29 23:15:00.234773','路飞学城课程购买',1798.00,1798.00,'201908262048330000013725',3,1,0,0,'',NULL,1),(6,0,0,0,'2019-08-26 21:12:20.150714','2019-08-29 23:15:00.238702','路飞学城课程购买',955.00,955.00,'201908262112200000018011',3,1,0,0,'',NULL,1),(7,0,0,0,'2019-08-26 21:15:01.204191','2019-08-29 23:15:00.243826','路飞学城课程购买',955.00,955.00,'201908262115010000015795',3,1,0,0,'',NULL,1),(8,0,0,0,'2019-08-26 21:15:33.186874','2019-08-29 23:15:00.253605','路飞学城课程购买',955.00,955.00,'201908262115330000014472',3,2,0,0,'',NULL,1),(9,0,0,0,'2019-08-27 15:13:45.023571','2019-08-29 23:15:00.257144','路飞学城课程购买',955.00,859.50,'201908271513450000016482',3,1,0,1,'',NULL,1),(10,0,0,0,'2019-08-27 23:05:17.603111','2019-08-29 23:15:00.261399','路飞学城课程购买',3818.00,1436.20,'201908272305170000015838',3,1,20000,1,'',NULL,1),(11,0,0,0,'2019-08-28 12:07:32.774138','2019-08-29 23:15:00.269042','路飞学城课程购买',955.00,955.00,'201908281207320000017540',3,1,0,0,'',NULL,1),(12,0,0,0,'2019-08-28 12:09:48.892594','2019-08-29 23:15:00.280918','路飞学城课程购买',955.00,759.50,'201908281209480000010433',3,1,1000,1,'',NULL,1),(13,0,0,0,'2019-08-28 12:11:47.009590','2019-08-29 23:15:00.284244','路飞学城课程购买',720.00,548.00,'201908281211460000012953',3,1,1000,1,'',NULL,1),(14,0,0,0,'2019-08-28 12:13:50.119116','2019-08-29 23:15:00.287127','路飞学城课程购买',720.00,548.00,'201908281213500000016809',3,1,1000,1,'',NULL,1),(15,0,0,0,'2019-08-28 12:16:54.942548','2019-08-29 23:15:00.290091','路飞学城课程购买',955.00,759.50,'201908281216540000010337',3,1,1000,1,'',NULL,1),(16,0,0,0,'2019-08-28 12:17:51.627870','2019-08-29 23:15:00.295982','路飞学城课程购买',720.00,720.00,'201908281217510000019593',3,1,0,0,'',NULL,1),(17,0,0,0,'2019-08-28 19:52:36.440460','2019-08-28 21:09:34.349792','路飞学城课程购买',955.00,759.50,'201908281952360000016859',1,1,1000,1,'','2019-08-28 21:09:34.349627',1),(18,0,0,0,'2019-08-28 21:40:04.258334','2019-08-29 23:15:00.302564','路飞学城课程购买',955.00,805.00,'201908282140040000011312',3,1,1000,2,'',NULL,1),(19,0,0,0,'2019-08-28 23:00:16.612661','2019-08-29 23:15:00.307734','路飞学城课程购买',720.00,570.00,'201908282300160000013724',3,1,1000,2,'',NULL,1),(20,0,0,0,'2019-08-28 23:03:17.123351','2019-08-29 23:15:00.312165','路飞学城课程购买',955.00,805.00,'201908282303170000012321',3,1,1000,2,'',NULL,1),(21,0,0,0,'2019-08-28 23:34:21.938605','2019-08-29 23:15:00.315840','路飞学城课程购买',1455.00,1305.00,'201908282334210000012241',3,1,1000,2,'',NULL,1),(22,0,0,0,'2019-08-28 23:45:21.563253','2019-08-29 23:15:00.326411','路飞学城课程购买',955.00,805.00,'201908282345210000011916',3,1,1000,2,'',NULL,1),(23,0,0,0,'2019-08-28 23:48:00.084260','2019-08-28 23:48:47.057590','路飞学城课程购买',955.00,805.00,'201908282348000000018362',1,1,1000,2,'','2019-08-28 23:48:47.057344',1),(24,0,0,0,'2019-08-29 00:33:20.041067','2019-08-29 00:33:56.504028','路飞学城课程购买',955.00,855.00,'201908290033200000012463',1,1,1000,0,'','2019-08-29 00:33:56.503904',1),(25,0,0,0,'2019-08-29 00:38:02.114474','2019-08-29 00:38:38.637279','路飞学城课程购买',955.00,855.00,'201908290038020000011088',1,1,1000,0,'','2019-08-29 00:38:38.636396',1),(26,0,0,0,'2019-08-29 00:59:09.675351','2019-08-29 23:15:00.332242','路飞学城课程购买',955.00,955.00,'201908290059090000013458',3,1,0,0,'',NULL,1),(27,0,0,0,'2019-08-29 01:06:06.964272','2019-08-29 01:06:41.451789','路飞学城课程购买',955.00,955.00,'201908290106060000010581',1,1,0,0,'','2019-08-29 01:06:41.451614',1),(28,0,0,0,'2019-08-30 12:21:06.071096','2019-08-30 12:21:06.117277','路飞学城课程购买',955.00,955.00,'201908301221060000015693',0,1,0,0,'',NULL,1),(29,0,0,0,'2019-08-30 12:22:18.631004','2019-08-30 12:22:18.648864','路飞学城课程购买',955.00,955.00,'201908301222180000018359',0,1,0,0,'',NULL,1),(30,0,0,0,'2019-08-30 12:35:39.723006','2019-08-30 12:35:39.761342','路飞学城课程购买',955.00,955.00,'201908301235390000015902',0,1,0,0,'',NULL,1),(31,0,0,0,'2019-08-30 12:36:35.854241','2019-08-30 12:36:35.882654','路飞学城课程购买',720.00,720.00,'201908301236350000012848',0,1,0,0,'',NULL,1),(32,0,0,0,'2019-08-30 14:51:08.172662','2019-08-30 14:51:08.223288','路飞学城课程购买',1563.00,1563.00,'201908301451080000011032',0,1,0,0,'',NULL,1),(33,0,0,0,'2019-08-30 14:58:12.660382','2019-08-30 14:58:12.683590','路飞学城课程购买',843.00,843.00,'201908301458120000012906',0,1,0,0,'',NULL,1),(34,0,0,0,'2019-08-30 15:00:09.561161','2019-08-30 15:00:09.584411','路飞学城课程购买',843.00,843.00,'201908301500090000014808',0,1,0,0,'',NULL,1),(35,0,0,0,'2019-08-30 15:04:35.375433','2019-08-30 15:04:35.401330','路飞学城课程购买',843.00,843.00,'201908301504350000013691',0,1,0,0,'',NULL,1),(36,0,0,0,'2019-08-30 15:05:37.168965','2019-08-30 15:05:37.198575','路飞学城课程购买',170.00,170.00,'201908301505370000017739',0,1,0,0,'',NULL,1),(37,0,0,0,'2019-08-30 15:13:05.180681','2019-08-30 15:15:55.372517','路飞学城课程购买',170.00,70.00,'201908301513050000014117',1,1,1000,0,'','2019-08-30 15:15:55.372315',1),(38,0,0,0,'2019-08-30 21:29:11.340449','2019-08-30 21:31:05.004725','路飞学城课程购买',170.00,169.90,'201908302129110000017632',1,1,1,0,'','2019-08-30 21:31:05.004552',1);
/*!40000 ALTER TABLE `ly_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_order_detail`
--

DROP TABLE IF EXISTS `ly_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `expire` int(11) NOT NULL,
  `price` decimal(6,2) NOT NULL,
  `real_price` decimal(6,2) NOT NULL,
  `discount_name` varchar(120) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_order_detail_course_id_cb34575d_fk_ly_course_id` (`course_id`),
  KEY `ly_order_detail_order_id_735380ae_fk_ly_order_id` (`order_id`),
  CONSTRAINT `ly_order_detail_course_id_cb34575d_fk_ly_course_id` FOREIGN KEY (`course_id`) REFERENCES `ly_course` (`id`),
  CONSTRAINT `ly_order_detail_order_id_735380ae_fk_ly_order_id` FOREIGN KEY (`order_id`) REFERENCES `ly_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_order_detail`
--

LOCK TABLES `ly_order_detail` WRITE;
/*!40000 ALTER TABLE `ly_order_detail` DISABLE KEYS */;
INSERT INTO `ly_order_detail` VALUES (1,0,0,0,'2019-08-26 19:32:12.267847','2019-08-26 19:32:12.267893',0,888.00,843.00,'满减',1,1),(2,0,0,0,'2019-08-26 20:25:22.440931','2019-08-26 20:25:22.440978',0,888.00,843.00,'满减',1,2),(3,0,0,0,'2019-08-26 20:48:34.064180','2019-08-26 20:48:34.064363',0,1000.00,955.00,'满减',9,5),(4,0,0,0,'2019-08-26 20:48:34.092148','2019-08-26 20:48:34.092170',0,888.00,843.00,'满减',1,5),(5,0,0,0,'2019-08-26 21:12:20.200446','2019-08-26 21:12:20.200484',0,1000.00,955.00,'满减',9,6),(6,0,0,0,'2019-08-26 21:15:01.225411','2019-08-26 21:15:01.225438',0,1000.00,955.00,'满减',9,7),(7,0,0,0,'2019-08-26 21:15:33.207219','2019-08-26 21:15:33.207293',0,1000.00,955.00,'满减',9,8),(8,0,0,0,'2019-08-27 15:13:45.107168','2019-08-27 15:13:45.107262',0,1000.00,955.00,'满减',9,9),(9,0,0,0,'2019-08-27 23:05:17.656867','2019-08-27 23:05:17.656952',0,800.00,800.00,NULL,6,10),(10,0,0,0,'2019-08-27 23:05:17.705663','2019-08-27 23:05:17.705688',0,1000.00,955.00,'满减',9,10),(11,0,0,0,'2019-08-27 23:05:17.720705','2019-08-27 23:05:17.720760',0,500.00,500.00,NULL,4,10),(12,0,0,0,'2019-08-27 23:05:17.736128','2019-08-27 23:05:17.736146',0,888.00,843.00,'满减',1,10),(13,0,0,0,'2019-08-27 23:05:17.753976','2019-08-27 23:05:17.754048',0,900.00,720.00,'限时折扣',8,10),(14,0,0,0,'2019-08-28 12:07:32.857452','2019-08-28 12:07:32.857543',0,1000.00,955.00,'满减',9,11),(15,0,0,0,'2019-08-28 12:09:48.933736','2019-08-28 12:09:48.933757',0,1000.00,955.00,'满减',9,12),(16,0,0,0,'2019-08-28 12:11:47.222934','2019-08-28 12:11:47.223011',0,900.00,720.00,'限时折扣',8,13),(17,0,0,0,'2019-08-28 12:13:50.141448','2019-08-28 12:13:50.141472',0,900.00,720.00,'限时折扣',8,14),(18,0,0,0,'2019-08-28 12:16:54.975903','2019-08-28 12:16:54.975927',0,1000.00,955.00,'满减',9,15),(19,0,0,0,'2019-08-28 12:17:51.649705','2019-08-28 12:17:51.649723',0,900.00,720.00,'限时折扣',8,16),(20,0,0,0,'2019-08-28 19:52:36.454835','2019-08-28 19:52:36.454853',0,1000.00,955.00,'满减',9,17),(21,0,0,0,'2019-08-28 21:40:04.327120','2019-08-28 21:40:04.327143',0,1000.00,955.00,'满减',9,18),(22,0,0,0,'2019-08-28 23:00:16.708303','2019-08-28 23:00:16.708359',0,900.00,720.00,'限时折扣',8,19),(23,0,0,0,'2019-08-28 23:03:17.171515','2019-08-28 23:03:17.171540',0,1000.00,955.00,'满减',9,20),(24,0,0,0,'2019-08-28 23:34:21.995925','2019-08-28 23:34:21.995947',0,1000.00,955.00,'满减',9,21),(25,0,0,0,'2019-08-28 23:34:22.014575','2019-08-28 23:34:22.014594',0,500.00,500.00,NULL,4,21),(26,0,0,0,'2019-08-28 23:34:22.036663','2019-08-28 23:34:22.036686',0,5000.00,0.00,'限时免费',7,21),(27,0,0,0,'2019-08-28 23:45:21.608101','2019-08-28 23:45:21.608123',0,1000.00,955.00,'满减',9,22),(28,0,0,0,'2019-08-28 23:45:21.641433','2019-08-28 23:45:21.641457',0,5000.00,0.00,'限时免费',7,22),(29,0,0,0,'2019-08-28 23:48:00.112100','2019-08-28 23:48:00.112136',0,1000.00,955.00,'满减',9,23),(30,0,0,0,'2019-08-28 23:48:00.129355','2019-08-28 23:48:00.129379',0,5000.00,0.00,'限时免费',7,23),(31,0,0,0,'2019-08-29 00:33:20.074933','2019-08-29 00:33:20.075019',0,1000.00,955.00,'满减',9,24),(32,0,0,0,'2019-08-29 00:38:02.132362','2019-08-29 00:38:02.132378',0,1000.00,955.00,'满减',9,25),(33,0,0,0,'2019-08-29 00:59:09.702126','2019-08-29 00:59:09.702143',0,1000.00,955.00,'满减',9,26),(34,0,0,0,'2019-08-29 01:06:06.998440','2019-08-29 01:06:06.998461',0,1000.00,955.00,'满减',9,27),(35,0,0,0,'2019-08-30 12:21:06.108559','2019-08-30 12:21:06.108576',0,1000.00,955.00,'满减',9,28),(36,0,0,0,'2019-08-30 12:22:18.647898','2019-08-30 12:22:18.647917',0,1000.00,955.00,'满减',9,29),(37,0,0,0,'2019-08-30 12:35:39.757159','2019-08-30 12:35:39.757177',0,1000.00,955.00,'满减',9,30),(38,0,0,0,'2019-08-30 12:36:35.880786','2019-08-30 12:36:35.880805',0,900.00,720.00,'限时折扣',8,31),(39,0,0,0,'2019-08-30 14:51:08.205424','2019-08-30 14:51:08.205446',0,888.00,843.00,'满减',1,32),(40,0,0,0,'2019-08-30 14:51:08.222181','2019-08-30 14:51:08.222200',0,900.00,720.00,'限时折扣',8,32),(41,0,0,0,'2019-08-30 14:58:12.681822','2019-08-30 14:58:12.681839',0,888.00,843.00,'满减',1,33),(42,0,0,0,'2019-08-30 15:00:09.582989','2019-08-30 15:00:09.583005',0,888.00,843.00,'满减',1,34),(43,0,0,0,'2019-08-30 15:04:35.394734','2019-08-30 15:04:35.394753',0,888.00,843.00,'满减',1,35),(44,0,0,0,'2019-08-30 15:05:37.193976','2019-08-30 15:05:37.194047',30,180.00,170.00,'满减',1,36),(45,0,0,0,'2019-08-30 15:13:05.245090','2019-08-30 15:13:05.245113',30,180.00,170.00,'满减',1,37),(46,0,0,0,'2019-08-30 21:29:11.386826','2019-08-30 21:29:11.386851',30,180.00,170.00,'满减',1,38);
/*!40000 ALTER TABLE `ly_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_price_discount`
--

DROP TABLE IF EXISTS `ly_price_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_price_discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `condition` int(11) NOT NULL,
  `sale` longtext,
  `discount_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_price_discount_discount_type_id_021f3115_fk_ly_price_` (`discount_type_id`),
  CONSTRAINT `ly_price_discount_discount_type_id_021f3115_fk_ly_price_` FOREIGN KEY (`discount_type_id`) REFERENCES `ly_price_discount_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_price_discount`
--

LOCK TABLES `ly_price_discount` WRITE;
/*!40000 ALTER TABLE `ly_price_discount` DISABLE KEYS */;
INSERT INTO `ly_price_discount` VALUES (1,1,1,0,'2019-08-19 20:47:02.695726','2019-08-19 20:47:02.695810',0,'',1),(2,2,1,0,'2019-08-19 20:47:25.875179','2019-08-19 20:47:25.875202',100,'*0.88',2),(3,3,1,0,'2019-08-19 20:47:49.928098','2019-08-19 20:47:49.928233',500,'*0.8',2),(4,4,1,0,'2019-08-19 20:48:38.343577','2019-08-19 20:48:38.343816',100,'-100',3),(5,5,1,0,'2019-08-19 20:49:03.007525','2019-08-20 22:56:15.273438',100,'满100-10\r\n满200-25\r\n满300-45',4);
/*!40000 ALTER TABLE `ly_price_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_price_discount_type`
--

DROP TABLE IF EXISTS `ly_price_discount_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_price_discount_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(32) NOT NULL,
  `remark` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_price_discount_type`
--

LOCK TABLES `ly_price_discount_type` WRITE;
/*!40000 ALTER TABLE `ly_price_discount_type` DISABLE KEYS */;
INSERT INTO `ly_price_discount_type` VALUES (1,1,1,0,'2019-08-19 20:45:46.555602','2019-08-19 20:45:46.556229','限时免费',NULL),(2,2,1,0,'2019-08-19 20:46:03.451363','2019-08-19 20:46:03.451430','限时折扣','阶梯级别的折扣'),(3,3,1,0,'2019-08-19 20:46:28.022668','2019-08-19 20:46:28.022703','限时减免',NULL),(4,4,1,0,'2019-08-19 20:46:38.353836','2019-08-19 23:35:35.706930','满减',NULL);
/*!40000 ALTER TABLE `ly_price_discount_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_teacher`
--

DROP TABLE IF EXISTS `ly_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `name` varchar(32) NOT NULL,
  `role` smallint(6) NOT NULL,
  `title` varchar(64) NOT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `brief` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_teacher`
--

LOCK TABLES `ly_teacher` WRITE;
/*!40000 ALTER TABLE `ly_teacher` DISABLE KEYS */;
INSERT INTO `ly_teacher` VALUES (1,1,1,0,'2019-08-13 15:41:01.683088','2019-08-15 15:19:55.774314','Alex',0,'老男孩Python教学总监','金角大王','teacher/8268683.png','老师自诉'),(2,2,1,0,'2019-08-13 15:41:58.878730','2019-08-15 15:20:12.583175','波波',0,'前百度数据挖掘工程师','叫我波波','teacher/8268683_JDDUwb9.png','老师自诉');
/*!40000 ALTER TABLE `ly_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_user_coupon`
--

DROP TABLE IF EXISTS `ly_user_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_user_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `is_use` tinyint(1) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_user_coupon_coupon_id_d4690c35_fk_ly_coupon_id` (`coupon_id`),
  KEY `ly_user_coupon_user_id_801e1fee_fk_ly_users_id` (`user_id`),
  CONSTRAINT `ly_user_coupon_coupon_id_d4690c35_fk_ly_coupon_id` FOREIGN KEY (`coupon_id`) REFERENCES `ly_coupon` (`id`),
  CONSTRAINT `ly_user_coupon_user_id_801e1fee_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_user_coupon`
--

LOCK TABLES `ly_user_coupon` WRITE;
/*!40000 ALTER TABLE `ly_user_coupon` DISABLE KEYS */;
INSERT INTO `ly_user_coupon` VALUES (1,1,1,0,'2019-08-26 22:22:30.546279','2019-08-28 21:09:34.380136','2019-08-26 22:22:00.000000',1,3,1),(2,2,1,0,'2019-08-26 22:22:42.242128','2019-08-28 23:48:47.071436','2019-08-26 22:22:00.000000',1,2,1),(3,3,1,0,'2019-08-26 22:22:53.854132','2019-08-26 22:22:53.854154','2019-08-26 22:22:00.000000',0,1,1),(4,4,1,0,'2019-08-27 09:31:31.883568','2019-08-27 09:31:31.883612','2019-08-27 09:31:00.000000',0,2,11);
/*!40000 ALTER TABLE `ly_user_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_user_course`
--

DROP TABLE IF EXISTS `ly_user_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_user_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orders` int(11) NOT NULL,
  `is_show` tinyint(1) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `created_time` datetime(6) NOT NULL,
  `updated_time` datetime(6) NOT NULL,
  `trade_no` varchar(128) DEFAULT NULL,
  `buy_type` smallint(6) NOT NULL,
  `pay_time` datetime(6) DEFAULT NULL,
  `out_time` datetime(6) DEFAULT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ly_user_course_course_id_8643fef5_fk_ly_course_id` (`course_id`),
  KEY `ly_user_course_user_id_94018e47_fk_ly_users_id` (`user_id`),
  CONSTRAINT `ly_user_course_course_id_8643fef5_fk_ly_course_id` FOREIGN KEY (`course_id`) REFERENCES `ly_course` (`id`),
  CONSTRAINT `ly_user_course_user_id_94018e47_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_user_course`
--

LOCK TABLES `ly_user_course` WRITE;
/*!40000 ALTER TABLE `ly_user_course` DISABLE KEYS */;
INSERT INTO `ly_user_course` VALUES (1,0,0,0,'2019-08-28 23:48:47.123852','2019-08-28 23:48:47.123880','2019082822001418111000049377',1,'2019-08-28 23:48:47.057344','2199-01-01 00:00:00.000000',9,1),(2,0,0,0,'2019-08-28 23:48:47.158791','2019-08-28 23:48:47.158832','2019082822001418111000049377',1,'2019-08-28 23:48:47.057344','2199-01-01 00:00:00.000000',7,1),(3,0,0,0,'2019-08-29 00:33:56.523820','2019-08-29 00:33:56.523844','2019082922001418111000052273',1,'2019-08-29 00:33:56.503904','2199-01-01 00:00:00.000000',9,1),(4,0,0,0,'2019-08-29 00:38:38.670483','2019-08-29 00:38:38.670519','2019082922001418111000052274',1,'2019-08-29 00:38:38.636396','2199-01-01 00:00:00.000000',9,1),(5,0,0,0,'2019-08-29 01:06:41.474080','2019-08-29 01:06:41.474119','2019082922001418111000052276',1,'2019-08-29 01:06:41.451614','2199-01-01 00:00:00.000000',9,1),(6,0,0,0,'2019-08-30 15:15:55.390821','2019-08-30 15:15:55.390838','2019083022001418111000053817',1,'2019-08-30 15:15:55.372315','2019-09-29 15:15:55.372315',1,1),(7,0,0,0,'2019-08-30 21:31:05.039694','2019-08-30 21:31:05.039731','2019083022001418111000053818',1,'2019-08-30 21:31:05.004552','2019-09-29 21:31:05.004552',1,1);
/*!40000 ALTER TABLE `ly_user_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_users`
--

DROP TABLE IF EXISTS `ly_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `credit` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_users`
--

LOCK TABLES `ly_users` WRITE;
/*!40000 ALTER TABLE `ly_users` DISABLE KEYS */;
INSERT INTO `ly_users` VALUES (1,'pbkdf2_sha256$150000$2OxEzRv2SlHE$BRE8rtjYy7KISXffE7unSWCzfiGTTkMpT3dYWGvzK+A=','2019-08-12 09:40:00.000000',1,'admin','','','admin@admin.admin',1,1,'2019-08-07 16:50:00.000000','',NULL,24999),(10,'pbkdf2_sha256$150000$PUeXJ5NRaYVx$/k6za+0QQARgYFw/QEnuc2yVyb2MuzkJ7HxSqRTfoKQ=',NULL,0,'13212345679','','','',0,1,'2019-08-13 09:36:13.298307','','13212345679',0),(11,'pbkdf2_sha256$150000$eu7yGRsN5pdw$vsFqy40Pi5YDQiBk00huAKNFycaSU9DzOu2/U4uVhuI=',NULL,0,'15079204849','','','',0,1,'2019-08-13 11:14:12.689577','','15079204849',0);
/*!40000 ALTER TABLE `ly_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_users_groups`
--

DROP TABLE IF EXISTS `ly_users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_users_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ly_users_groups_user_id_group_id_e3b73a35_uniq` (`user_id`,`group_id`),
  KEY `ly_users_groups_group_id_7505a66d_fk_auth_group_id` (`group_id`),
  CONSTRAINT `ly_users_groups_group_id_7505a66d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `ly_users_groups_user_id_b293b4e8_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_users_groups`
--

LOCK TABLES `ly_users_groups` WRITE;
/*!40000 ALTER TABLE `ly_users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `ly_users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ly_users_user_permissions`
--

DROP TABLE IF EXISTS `ly_users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ly_users_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ly_users_user_permissions_user_id_permission_id_5b1027ec_uniq` (`user_id`,`permission_id`),
  KEY `ly_users_user_permis_permission_id_14148e4f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `ly_users_user_permis_permission_id_14148e4f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `ly_users_user_permissions_user_id_047a052d_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ly_users_user_permissions`
--

LOCK TABLES `ly_users_user_permissions` WRITE;
/*!40000 ALTER TABLE `ly_users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ly_users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reversion_revision`
--

DROP TABLE IF EXISTS `reversion_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_user_id_17095f45_fk_ly_users_id` (`user_id`),
  KEY `reversion_revision_date_created_96f7c20c` (`date_created`),
  CONSTRAINT `reversion_revision_user_id_17095f45_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reversion_revision`
--

LOCK TABLES `reversion_revision` WRITE;
/*!40000 ALTER TABLE `reversion_revision` DISABLE KEYS */;
/*!40000 ALTER TABLE `reversion_revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reversion_version`
--

DROP TABLE IF EXISTS `reversion_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) NOT NULL,
  `db` varchar(191) NOT NULL,
  `format` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `object_repr` longtext NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reversion_version_db_content_type_id_objec_b2c54f65_uniq` (`db`,`content_type_id`,`object_id`,`revision_id`),
  KEY `reversion_version_content_type_id_7d0ff25c_fk_django_co` (`content_type_id`),
  KEY `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` (`revision_id`),
  CONSTRAINT `reversion_version_content_type_id_7d0ff25c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reversion_version`
--

LOCK TABLES `reversion_version` WRITE;
/*!40000 ALTER TABLE `reversion_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `reversion_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_bookmark`
--

DROP TABLE IF EXISTS `xadmin_bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_ly_users_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_bookmark`
--

LOCK TABLES `xadmin_bookmark` WRITE;
/*!40000 ALTER TABLE `xadmin_bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_log`
--

DROP TABLE IF EXISTS `xadmin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_ly_users_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_log`
--

LOCK TABLES `xadmin_log` WRITE;
/*!40000 ALTER TABLE `xadmin_log` DISABLE KEYS */;
INSERT INTO `xadmin_log` VALUES (1,'2019-08-09 12:20:48.551687','127.0.0.1','1','第一张','create','已添加。',12,1),(2,'2019-08-09 12:21:06.122031','127.0.0.1','2','第二张','create','已添加。',12,1),(3,'2019-08-09 12:21:34.358034','127.0.0.1','1','免费课','create','已添加。',13,1),(4,'2019-08-09 12:21:54.473049','127.0.0.1','2','找到我们','create','已添加。',13,1),(5,'2019-08-09 12:22:19.841110','127.0.0.1','3','联系我们','create','已添加。',13,1),(6,'2019-08-09 12:22:31.900462','127.0.0.1','2','找到我们','change','修改 orders',13,1),(7,'2019-08-13 15:32:25.153138','127.0.0.1','1','python','create','已添加。',16,1),(8,'2019-08-13 15:32:56.432174','127.0.0.1','2','linxu运维','create','已添加。',16,1),(9,'2019-08-13 15:33:05.083718','127.0.0.1','3','前端开发','create','已添加。',16,1),(10,'2019-08-13 15:33:16.113012','127.0.0.1','4','Python进阶','create','已添加。',16,1),(11,'2019-08-13 15:33:25.415992','127.0.0.1','5','开发工具','create','已添加。',16,1),(12,'2019-08-13 15:33:39.650301','127.0.0.1','6','Go语言','create','已添加。',16,1),(13,'2019-08-13 15:41:01.723846','127.0.0.1','1','Alex','create','已添加。',19,1),(14,'2019-08-13 15:41:58.880018','127.0.0.1','2','波波','create','已添加。',19,1),(15,'2019-08-13 15:43:17.042977','127.0.0.1','1','Python开发21天入门','create','已添加。',18,1),(16,'2019-08-13 15:44:40.259807','127.0.0.1','2','爬虫从门到进阶','create','已添加。',18,1),(17,'2019-08-13 15:45:43.092184','127.0.0.1','1','Python开发21天入门:(第1章)初识编码','create','已添加。',17,1),(18,'2019-08-13 15:46:11.541243','127.0.0.1','2','Python开发21天入门:(第1章)计算机基础','create','已添加。',17,1),(19,'2019-08-13 15:46:39.075810','127.0.0.1','3','Python开发21天入门:(第1章)Python第一课','create','已添加。',17,1),(20,'2019-08-13 15:47:22.253932','127.0.0.1','4','Python开发21天入门:(第2章)第一个Python代码','create','已添加。',17,1),(21,'2019-08-13 15:47:51.012377','127.0.0.1','5','Python开发21天入门:(第3章)项目','create','已添加。',17,1),(22,'2019-08-13 15:49:30.942316','127.0.0.1','2','Python开发21天入门:(第2章)计算机基础','change','修改 chapter 和 summary',17,1),(23,'2019-08-13 15:49:41.774593','127.0.0.1','4','Python开发21天入门:(第2章)第一个Python代码','change','没有字段被修改。',17,1),(24,'2019-08-13 15:49:58.636220','127.0.0.1','1','Python开发21天入门:(第1章)初识编码','change','修改 summary',17,1),(25,'2019-08-13 15:50:12.701357','127.0.0.1','3','Python开发21天入门:(第3章)Python第一课','change','修改 chapter 和 summary',17,1),(26,'2019-08-13 15:50:17.621497','127.0.0.1','2','Python开发21天入门:(第2章)计算机基础','change','没有字段被修改。',17,1),(27,'2019-08-13 15:50:30.831776','127.0.0.1','4','Python开发21天入门:(第4章)第一个Python代码','change','修改 chapter 和 summary',17,1),(28,'2019-08-13 15:50:43.063322','127.0.0.1','5','Python开发21天入门:(第5章)项目','change','修改 chapter 和 summary',17,1),(29,'2019-08-13 15:51:36.080804','127.0.0.1','1','Python开发21天入门:(第1章)初识编码-第一章第一节','create','已添加。',15,1),(30,'2019-08-13 15:52:03.540171','127.0.0.1','2','Python开发21天入门:(第2章)计算机基础-第二章第一节','create','已添加。',15,1),(31,'2019-08-13 15:52:08.023738','127.0.0.1','2','Python开发21天入门:(第2章)计算机基础-第二章第一节','change','没有字段被修改。',15,1),(32,'2019-08-13 15:52:12.543699','127.0.0.1','1','Python开发21天入门:(第1章)初识编码-第一章第一节','change','修改 is_show',15,1),(33,'2019-08-13 15:52:36.680132','127.0.0.1','3','Python开发21天入门:(第3章)Python第一课-第三章第一节','create','已添加。',15,1),(34,'2019-08-13 15:52:53.108410','127.0.0.1','4','Python开发21天入门:(第4章)第一个Python代码-第四章第一节','create','已添加。',15,1),(35,'2019-08-13 15:53:15.148085','127.0.0.1','5','Python开发21天入门:(第5章)项目-第五章第一节','create','已添加。',15,1),(36,'2019-08-13 16:21:03.086762','127.0.0.1','6','Go语言','change','修改 is_delete',16,1),(37,'2019-08-14 02:16:46.763431','127.0.0.1','5','Python开发21天入门:(第5章)项目-第五章第一节','change','没有字段被修改。',15,1),(38,'2019-08-14 02:16:56.552670','127.0.0.1','1','Python开发21天入门:(第1章)初识编码','change','没有字段被修改。',17,1),(39,'2019-08-14 07:28:26.881832','127.0.0.1','5','Python开发21天入门:(第5章)项目-第五章第一节','change','没有字段被修改。',15,1),(40,'2019-08-14 07:28:33.354220','127.0.0.1','1','Python开发21天入门:(第1章)初识编码-第一章第一节','change','修改 is_show_list',15,1),(41,'2019-08-14 07:28:39.385032','127.0.0.1','2','Python开发21天入门:(第2章)计算机基础-第二章第一节','change','修改 is_show_list',15,1),(42,'2019-08-14 07:28:45.012351','127.0.0.1','3','Python开发21天入门:(第3章)Python第一课-第三章第一节','change','修改 is_show_list',15,1),(43,'2019-08-14 07:29:44.872069','127.0.0.1','1','Python开发21天入门:(第1章)初识编码-第一章第一节','change','没有字段被修改。',15,1),(44,'2019-08-14 07:48:48.416675','127.0.0.1','1','Python开发21天入门:(第1章)初识编码-程序员的第一步','change','修改 name',15,1),(45,'2019-08-14 07:49:01.448331','127.0.0.1','2','Python开发21天入门:(第2章)计算机基础-程序员的第二步','change','修改 name',15,1),(46,'2019-08-14 07:49:10.682815','127.0.0.1','3','Python开发21天入门:(第3章)Python第一课-程序员的第三步','change','修改 name',15,1),(47,'2019-08-14 07:49:23.918703','127.0.0.1','4','Python开发21天入门:(第4章)第一个Python代码-程序员的第四步','change','修改 name',15,1),(48,'2019-08-14 07:49:33.224767','127.0.0.1','5','Python开发21天入门:(第5章)项目-程序员的第五步','change','修改 name',15,1),(49,'2019-08-14 08:56:08.728805','127.0.0.1','6','Go语言','change','没有字段被修改。',16,1),(50,'2019-08-14 08:58:10.312484','127.0.0.1','3','负载均衡','create','已添加。',18,1),(51,'2019-08-14 08:59:22.845955','127.0.0.1','4','linux进阶','create','已添加。',18,1),(52,'2019-08-14 09:01:14.091794','127.0.0.1','5','7天玩转Vue','create','已添加。',18,1),(53,'2019-08-14 09:02:50.072799','127.0.0.1','6','jQuery进阶','create','已添加。',18,1),(54,'2019-08-14 09:04:21.939237','127.0.0.1','7','Python从小白到大神','create','已添加。',18,1),(55,'2019-08-14 09:05:50.198014','127.0.0.1','8','助你成为Python大佬','create','已添加。',18,1),(56,'2019-08-14 09:07:57.594381','127.0.0.1','9','C/C++从入门到脱发','create','已添加。',18,1),(57,'2019-08-14 09:09:07.514826','127.0.0.1','6','爬虫从门到进阶:(第1章)爬虫认知','create','已添加。',17,1),(58,'2019-08-14 09:09:39.648047','127.0.0.1','7','爬虫从门到进阶:(第2章)爬虫应用','create','已添加。',17,1),(59,'2019-08-14 09:10:38.409796','127.0.0.1','6','爬虫从门到进阶:(第1章)爬虫认知-爬虫工具的下载','create','已添加。',15,1),(60,'2019-08-14 09:11:12.961804','127.0.0.1','7','爬虫从门到进阶:(第1章)爬虫认知-爬虫软件的配置','create','已添加。',15,1),(61,'2019-08-14 09:11:42.474192','127.0.0.1','8','爬虫从门到进阶:(第2章)爬虫应用-爬取第一个网站','create','已添加。',15,1),(62,'2019-08-14 09:12:19.593250','127.0.0.1','9','爬虫从门到进阶:(第2章)爬虫应用-爬虫终极大招','create','已添加。',15,1),(63,'2019-08-14 09:19:26.989360','127.0.0.1','9','C/C++从入门到脱发','change','修改 course_img',18,1),(64,'2019-08-14 11:31:06.129797','127.0.0.1','9','C/C++从入门到脱发','change','没有字段被修改。',18,1),(65,'2019-08-14 11:31:29.576445','127.0.0.1','1','python','change','没有字段被修改。',16,1),(66,'2019-08-14 11:31:33.770242','127.0.0.1','2','linxu运维','change','没有字段被修改。',16,1),(67,'2019-08-14 11:34:04.650387','127.0.0.1','6','jQuery进阶','change','修改 course_category',18,1),(68,'2019-08-15 07:32:01.532104','127.0.0.1','1','Python开发21天入门','change','修改 brief',18,1),(69,'2019-08-15 07:33:34.882430','127.0.0.1','1','Python开发21天入门','change','没有字段被修改。',18,1),(70,'2019-08-15 14:17:14.380049','127.0.0.1','1','Python开发21天入门','change','修改 brief',18,1),(71,'2019-08-15 15:15:22.024434','127.0.0.1','1','Python开发21天入门','change','修改 brief',18,1),(72,'2019-08-15 15:19:55.803957','127.0.0.1','1','Alex','change','修改 image',19,1),(73,'2019-08-15 15:20:12.589499','127.0.0.1','2','波波','change','修改 image',19,1),(74,'2019-08-15 16:04:32.107291','127.0.0.1','4','Python开发21天入门:(第4章)程序员的第四步','change','修改 name',17,1),(75,'2019-08-15 16:05:32.523742','127.0.0.1','4','Python开发21天入门:(第4章)程序员的第四步-程序员的第四步','change','修改 is_show',15,1),(76,'2019-08-15 16:06:17.264014','127.0.0.1','4','Python开发21天入门:(第4章)Python第一次实操代码','change','修改 name',17,1),(77,'2019-08-16 03:47:43.970496','127.0.0.1','1','Python开发21天入门','change','修改 course_video',18,1),(78,'2019-08-16 04:06:09.620195','127.0.0.1','2','爬虫从门到进阶','change','修改 course_img 和 brief',18,1),(79,'2019-08-16 04:06:33.339368','127.0.0.1','2','爬虫从门到进阶','change','修改 course_img',18,1),(80,'2019-08-16 04:06:54.191517','127.0.0.1','2','爬虫从门到进阶','change','修改 course_img',18,1),(81,'2019-08-16 04:07:44.290812','127.0.0.1','2','爬虫从门到进阶','change','修改 course_img',18,1),(82,'2019-08-16 04:08:28.961613','127.0.0.1','2','爬虫从门到进阶','change','修改 course_img',18,1),(83,'2019-08-16 04:08:39.372916','127.0.0.1','2','爬虫从门到进阶','change','修改 course_img',18,1),(84,'2019-08-19 08:51:51.296302','127.0.0.1','1','Python开发21天入门','create','已添加。',20,1),(85,'2019-08-19 08:52:10.121977','127.0.0.1','2','Python开发21天入门','create','已添加。',20,1),(86,'2019-08-19 08:52:24.098295','127.0.0.1','3','Python开发21天入门','create','已添加。',20,1),(87,'2019-08-19 09:00:26.997802','127.0.0.1','4','课程：Python开发21天入门， 有效期：永久有效, 价格：998','create','已添加。',20,1),(88,'2019-08-19 09:00:43.340287','127.0.0.1','3','课程：Python开发21天入门， 有效期：三个月有效, 价格：500','change','修改 price',20,1),(89,'2019-08-19 09:00:51.302739','127.0.0.1','2','课程：Python开发21天入门， 有效期：两个月有效, 价格：200','change','修改 price',20,1),(90,'2019-08-19 09:00:58.078961','127.0.0.1','1','课程：Python开发21天入门， 有效期：一个月有效, 价格：180','change','修改 price',20,1),(91,'2019-08-19 09:01:27.984108','127.0.0.1','5','课程：爬虫从门到进阶， 有效期：一个月有效, 价格：180','create','已添加。',20,1),(92,'2019-08-19 09:01:42.766502','127.0.0.1','6','课程：爬虫从门到进阶， 有效期：两个月有效, 价格：200','create','已添加。',20,1),(93,'2019-08-19 09:01:59.351743','127.0.0.1','7','课程：爬虫从门到进阶， 有效期：三个月有效, 价格：500','create','已添加。',20,1),(94,'2019-08-19 09:02:15.139977','127.0.0.1','8','课程：爬虫从门到进阶， 有效期：永久有效, 价格：998','create','已添加。',20,1),(95,'2019-08-19 09:02:23.896979','127.0.0.1','4','课程：Python开发21天入门， 有效期：永久有效, 价格：1000','change','修改 price',20,1),(96,'2019-08-19 09:02:45.129619','127.0.0.1','9','课程：C/C++从入门到脱发， 有效期：一个月有效, 价格：180','create','已添加。',20,1),(97,'2019-08-19 09:03:01.614120','127.0.0.1','10','课程：C/C++从入门到脱发， 有效期：两个月有效, 价格：200','create','已添加。',20,1),(98,'2019-08-19 09:03:15.841217','127.0.0.1','11','课程：C/C++从入门到脱发， 有效期：三个月有效, 价格：500','create','已添加。',20,1),(99,'2019-08-19 09:03:28.858398','127.0.0.1','12','课程：C/C++从入门到脱发， 有效期：永久有效, 价格：999','create','已添加。',20,1),(100,'2019-08-19 09:31:04.096104','127.0.0.1','12','课程：C/C++从入门到脱发， 有效期：永久有效, 价格：999.00','delete','',20,1),(101,'2019-08-19 09:31:09.580080','127.0.0.1','8','课程：爬虫从门到进阶， 有效期：永久有效, 价格：998.00','delete','',20,1),(102,'2019-08-19 09:31:14.153981','127.0.0.1','4','课程：Python开发21天入门， 有效期：永久有效, 价格：1000.00','delete','',20,1),(103,'2019-08-19 09:52:17.526599','127.0.0.1','1','Python开发21天入门','change','修改 price',18,1),(104,'2019-08-19 20:45:46.589632','127.0.0.1','1','限时免费','create','已添加。',22,1),(105,'2019-08-19 20:46:03.464447','127.0.0.1','2','限时折扣','create','已添加。',22,1),(106,'2019-08-19 20:46:28.025676','127.0.0.1','3','限时减免','create','已添加。',22,1),(107,'2019-08-19 20:46:38.362889','127.0.0.1','4','满减','create','已添加。',22,1),(108,'2019-08-19 20:47:02.699167','127.0.0.1','1','价格优惠:限时免费,优惠条件:0,优惠值:','create','已添加。',24,1),(109,'2019-08-19 20:47:25.880002','127.0.0.1','2','价格优惠:限时折扣,优惠条件:100,优惠值:*0.88','create','已添加。',24,1),(110,'2019-08-19 20:47:49.933070','127.0.0.1','3','价格优惠:限时折扣,优惠条件:500,优惠值:*0.8','create','已添加。',24,1),(111,'2019-08-19 20:48:38.351417','127.0.0.1','4','价格优惠:限时减免,优惠条件:100,优惠值:-100','create','已添加。',24,1),(112,'2019-08-19 20:49:03.009525','127.0.0.1','5','价格优惠:满减,优惠条件:100,优惠值:满100-10','create','已添加。',24,1),(113,'2019-08-19 20:49:21.776198','127.0.0.1','6','价格优惠:满减,优惠条件:200,优惠值:满200-15','create','已添加。',24,1),(114,'2019-08-19 20:49:39.182296','127.0.0.1','7','价格优惠:满减,优惠条件:300,优惠值:满300-25','create','已添加。',24,1),(115,'2019-08-19 20:51:00.690034','127.0.0.1','1','超级新品日','create','已添加。',21,1),(116,'2019-08-19 20:52:11.181679','127.0.0.1','2','中秋节快乐够','create','已添加。',21,1),(117,'2019-08-19 20:52:29.562316','127.0.0.1','1','课程：Python开发21天入门，优惠活动: 超级新品日,开始时间:2019-08-19 00:00:00,结束时间:2019-09-19 00:00:00','create','已添加。',23,1),(118,'2019-08-19 20:52:40.849965','127.0.0.1','2','课程：爬虫从门到进阶，优惠活动: 超级新品日,开始时间:2019-08-19 00:00:00,结束时间:2019-09-19 00:00:00','create','已添加。',23,1),(119,'2019-08-19 20:53:55.815144','127.0.0.1','3','日常满减','create','已添加。',21,1),(120,'2019-08-19 20:55:34.206833','127.0.0.1','3','课程：C/C++从入门到脱发，优惠活动: 中秋节快乐够,开始时间:2019-09-01 00:00:00,结束时间:2019-10-08 00:00:00','create','已添加。',23,1),(121,'2019-08-19 20:55:51.061304','127.0.0.1','4','课程：7天玩转Vue，优惠活动: 中秋节快乐够,开始时间:2019-09-01 00:00:00,结束时间:2019-10-08 00:00:00','create','已添加。',23,1),(122,'2019-08-19 20:56:02.508870','127.0.0.1','5','课程：Python从小白到大神，优惠活动: 超级新品日,开始时间:2019-08-19 00:00:00,结束时间:2019-09-19 00:00:00','create','已添加。',23,1),(123,'2019-08-19 21:14:42.683090','127.0.0.1','6','课程：linux进阶，优惠活动: 超级新品日,开始时间:2019-08-19 00:00:00,结束时间:2019-09-19 00:00:00','create','已添加。',23,1),(124,'2019-08-19 21:14:56.585821','127.0.0.1','7','课程：jQuery进阶，优惠活动: 中秋节快乐够,开始时间:2019-09-01 00:00:00,结束时间:2019-10-08 00:00:00','create','已添加。',23,1),(125,'2019-08-19 21:15:12.328597','127.0.0.1','8','课程：助你成为Python大佬，优惠活动: 超级新品日,开始时间:2019-08-19 00:00:00,结束时间:2019-09-19 00:00:00','create','已添加。',23,1),(126,'2019-08-19 23:19:29.925978','127.0.0.1','3','课程：C/C++从入门到脱发，优惠活动: 中秋节快乐够,开始时间:2019-09-01 00:00:00,结束时间:2019-10-08 00:00:00','change','没有字段被修改。',23,1),(127,'2019-08-19 23:35:35.720714','127.0.0.1','4','满减','change','没有字段被修改。',22,1),(128,'2019-08-19 23:37:15.031635','127.0.0.1','3','课程：C/C++从入门到脱发，优惠活动: 超级新品日,开始时间:2019-08-19 00:00:00,结束时间:2019-09-19 00:00:00','change','修改 active 和 discount',23,1),(129,'2019-08-19 23:37:27.984084','127.0.0.1','1','课程：Python开发21天入门，优惠活动: 超级新品日,开始时间:2019-08-19 00:00:00,结束时间:2019-09-19 00:00:00','change','修改 discount',23,1),(130,'2019-08-20 21:25:51.214292','127.0.0.1','1','免费课','change','修改 link',13,1),(131,'2019-08-20 22:55:33.716824','127.0.0.1','7','价格优惠:满减,优惠条件:300,优惠值:满100-15\r\n满200-25\r\n满300-25','change','修改 sale',24,1),(132,'2019-08-20 22:55:45.873512','127.0.0.1','6','价格优惠:满减,优惠条件:200,优惠值:满100-15\r\n满200-25\r\n满300-25','change','修改 sale',24,1),(133,'2019-08-20 22:56:15.278377','127.0.0.1','5','价格优惠:满减,优惠条件:100,优惠值:满100-10\r\n满200-25\r\n满300-45','change','修改 sale',24,1),(134,'2019-08-20 22:56:38.134492','127.0.0.1','7','价格优惠:满减,优惠条件:300,优惠值:满100-15\r\n满200-25\r\n满300-25','delete','',24,1),(135,'2019-08-20 22:56:45.384086','127.0.0.1','6','价格优惠:满减,优惠条件:200,优惠值:满100-15\r\n满200-25\r\n满300-25','delete','',24,1),(136,'2019-08-20 22:57:30.449840','127.0.0.1','9','课程：C/C++从入门到脱发，优惠活动: 超级新品日,开始时间:2019-08-19 00:00:00,结束时间:2019-09-19 00:00:00','create','已添加。',23,1),(137,'2019-08-20 22:57:52.144598','127.0.0.1','10','课程：Python开发21天入门，优惠活动: 超级新品日,开始时间:2019-08-19 00:00:00,结束时间:2019-09-19 00:00:00','create','已添加。',23,1),(138,'2019-08-26 22:20:08.714260','127.0.0.1','1','十元优惠券','create','已添加。',28,1),(139,'2019-08-26 22:20:36.819177','127.0.0.1','2','五十元优惠券','create','已添加。',28,1),(140,'2019-08-26 22:21:13.262313','127.0.0.1','3','九折优惠券','create','已添加。',28,1),(141,'2019-08-26 22:22:30.548138','127.0.0.1','1','优惠券:九折优惠券,用户:admin','create','已添加。',27,1),(142,'2019-08-26 22:22:42.245226','127.0.0.1','2','优惠券:五十元优惠券,用户:admin','create','已添加。',27,1),(143,'2019-08-26 22:22:53.855848','127.0.0.1','3','优惠券:十元优惠券,用户:admin','create','已添加。',27,1),(144,'2019-08-27 09:31:31.897599','127.0.0.1','4','优惠券:五十元优惠券,用户:15079204849','create','已添加。',27,1),(145,'2019-08-27 20:38:17.383100','127.0.0.1','1','admin','change','修改 last_login 和 credit',14,1),(146,'2019-08-30 09:44:23.661773','127.0.0.1','1','Python开发21天入门:(第1章)初识编码-程序员的第一步','change','修改 section_link',15,1);
/*!40000 ALTER TABLE `xadmin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_usersettings`
--

DROP TABLE IF EXISTS `xadmin_usersettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_ly_users_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_usersettings`
--

LOCK TABLES `xadmin_usersettings` WRITE;
/*!40000 ALTER TABLE `xadmin_usersettings` DISABLE KEYS */;
INSERT INTO `xadmin_usersettings` VALUES (1,'dashboard:home:pos','',1);
/*!40000 ALTER TABLE `xadmin_usersettings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `xadmin_userwidget`
--

DROP TABLE IF EXISTS `xadmin_userwidget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_ly_users_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_ly_users_id` FOREIGN KEY (`user_id`) REFERENCES `ly_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `xadmin_userwidget`
--

LOCK TABLES `xadmin_userwidget` WRITE;
/*!40000 ALTER TABLE `xadmin_userwidget` DISABLE KEYS */;
/*!40000 ALTER TABLE `xadmin_userwidget` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-01 23:40:10
