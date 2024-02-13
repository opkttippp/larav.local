-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Laravel_db
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `color` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`, `color`, `image`) VALUES (1,'Mobile','2022-12-01 18:50:23','2022-12-01 18:50:23',NULL,'#d1e250','public/images/category/mobilnye_telefony_1669913423.jpg'),(2,'Television','2022-12-01 18:51:26','2022-12-01 18:51:26',NULL,'#16e407','public/images/category/tv_1668951806_1669913486.jpg'),(3,'Adapter','2022-12-01 19:16:01','2022-12-01 19:16:01',NULL,'#578acb','public/images/category/444_1669048573_1669914961.jpg');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `galleries`
--

DROP TABLE IF EXISTS `galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `galleries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int unsigned DEFAULT NULL,
  `photos` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `galleries_product_id_foreign` (`product_id`),
  CONSTRAINT `galleries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `galleries`
--

LOCK TABLES `galleries` WRITE;
/*!40000 ALTER TABLE `galleries` DISABLE KEYS */;
INSERT INTO `galleries` (`id`, `product_id`, `photos`, `created_at`, `updated_at`) VALUES (13,5,'public/images/product/tv_2_002_1669918913.jpg','2022-12-01 20:21:53','2022-12-01 20:21:53'),(14,5,'public/images/product/tv_2_003_1669918913.jpg','2022-12-01 20:21:53','2022-12-01 20:21:53'),(15,5,'public/images/product/tv_2_004_1669918913.jpg','2022-12-01 20:21:53','2022-12-01 20:21:53'),(16,6,'public/images/product/phone_1_002_1669919687.jpg','2022-12-01 20:34:47','2022-12-01 20:34:47'),(17,6,'public/images/product/phone_1_003_1669919687.jpg','2022-12-01 20:34:47','2022-12-01 20:34:47'),(18,6,'public/images/product/phone_1_004_1669919687.jpg','2022-12-01 20:34:47','2022-12-01 20:34:47'),(19,7,'public/images/product/111_1669919880.jpg','2022-12-01 20:38:00','2022-12-01 20:38:00'),(20,7,'public/images/product/222_1669919880.jpg','2022-12-01 20:38:00','2022-12-01 20:38:00'),(21,7,'public/images/product/333_1669919880.jpg','2022-12-01 20:38:00','2022-12-01 20:38:00'),(22,7,'public/images/product/444_1669919880.jpg','2022-12-01 20:38:00','2022-12-01 20:38:00'),(23,17,'public/images/product/tv_3_001_1674490533.jpg','2023-01-23 18:15:33','2023-01-23 18:15:33'),(24,17,'public/images/product/tv_3_002_1674490533.jpg','2023-01-23 18:15:33','2023-01-23 18:15:33'),(25,17,'public/images/product/tv_3_003_1674490533.jpg','2023-01-23 18:15:33','2023-01-23 18:15:33'),(26,17,'public/images/product/tv_3_004_1674490533.jpg','2023-01-23 18:15:33','2023-01-23 18:15:33'),(27,18,'public/images/product/zu_1_001_1674501865.jpg','2023-01-23 21:24:25','2023-01-23 21:24:25'),(28,18,'public/images/product/zu_1_002_1674501865.jpg','2023-01-23 21:24:25','2023-01-23 21:24:25'),(29,18,'public/images/product/zu_1_003_1674501865.jpg','2023-01-23 21:24:25','2023-01-23 21:24:25'),(30,18,'public/images/product/zu_1_004_1674501865.jpg','2023-01-23 21:24:25','2023-01-23 21:24:25'),(31,18,'public/images/product/zu_1_005_1674501865.jpg','2023-01-23 21:24:25','2023-01-23 21:24:25'),(32,19,'public/images/product/tv_4_001_1675550753.jpg','2023-01-23 21:26:56','2023-01-23 21:26:56'),(33,19,'public/images/product/tv_4_002_1675550753.jpg','2023-01-23 21:26:56','2023-01-23 21:26:56'),(34,19,'public/images/product/tv_4_003_1675550753.jpg','2023-01-23 21:26:56','2023-01-23 21:26:56'),(35,19,'public/images/product/tv_4_004_1675550753.jpg','2023-01-23 21:26:56','2023-01-23 21:26:56'),(36,20,'public/images/product/phone_2_001_1674504243.jpg','2023-01-23 22:04:03','2023-01-23 22:04:03'),(37,20,'public/images/product/phone_2_002_1674504243.jpg','2023-01-23 22:04:03','2023-01-23 22:04:03'),(38,20,'public/images/product/phone_2_003_1674504243.jpg','2023-01-23 22:04:03','2023-01-23 22:04:03');
/*!40000 ALTER TABLE `galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=336 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES (335,'default','{\"uuid\":\"98b30305-38d1-4d1f-b9d0-9a177662d6d9\",\"displayName\":\"App\\\\Jobs\\\\SendOrderEmail\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"failOnTimeout\":false,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendOrderEmail\",\"command\":\"O:23:\\\"App\\\\Jobs\\\\SendOrderEmail\\\":1:{s:7:\\\"\\u0000*\\u0000data\\\";a:11:{s:7:\\\"user_id\\\";i:366;s:12:\\\"customerName\\\";s:5:\\\"Anton\\\";s:16:\\\"customerLastName\\\";s:15:\\\"Ivanchenko12345\\\";s:13:\\\"customerEmail\\\";s:17:\\\"tttolll12@meta.ua\\\";s:15:\\\"customerAddress\\\";N;s:13:\\\"customerPhone\\\";s:15:\\\"+38-050-6800451\\\";s:7:\\\"comment\\\";N;s:5:\\\"total\\\";s:8:\\\"50918.00\\\";s:10:\\\"updated_at\\\";s:27:\\\"2024-03-07T21:01:23.000000Z\\\";s:10:\\\"created_at\\\";s:27:\\\"2024-03-07T21:01:23.000000Z\\\";s:2:\\\"id\\\";i:92;}}\"}}',0,NULL,1709845284,1709845284);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturs`
--

DROP TABLE IF EXISTS `manufacturs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manufacturs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `image` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturs`
--

LOCK TABLES `manufacturs` WRITE;
/*!40000 ALTER TABLE `manufacturs` DISABLE KEYS */;
INSERT INTO `manufacturs` (`id`, `country`, `name`, `image`) VALUES (1,'Republic of Korea','Samsung','public/images/manufactur/samsung_logo_1674855221.png'),(2,'Nokia Oyj','Nokia','public/images/manufactur/nokia_logo_1674846972.jpg'),(3,'Китай','Voltrip Duo','public/images/manufactur/voltrip_duo_logo _1674855165.jpeg'),(4,'Япония','Toshiba','public/images/manufactur/toshiba_logo_1674845553.jpg'),(5,'Нидерланды','Philips','public/images/manufactur/philips_logo_1674847862.jpg');
/*!40000 ALTER TABLE `manufacturs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `delete_message` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `messages_user_id_foreign` (`user_id`),
  CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`id`, `message`, `created_at`, `updated_at`, `user_id`, `delete_message`) VALUES (1,'Hi. Friends!!','2023-03-18 18:53:04','2023-03-29 15:57:36',2,0),(210,'qwert','2023-03-30 12:59:27','2023-03-30 12:59:27',2,0),(243,'qwert-qwer','2023-03-30 20:10:55','2023-03-30 20:11:03',2,0),(247,'User admin delete message...','2023-03-30 20:27:13','2023-04-14 15:36:27',1,1),(248,'HIX!!','2023-03-30 20:30:09','2023-03-30 21:00:52',2,0),(249,'sending!!','2023-03-31 15:51:03','2023-03-31 15:51:21',2,0),(250,'qweqwe','2023-04-14 15:38:55','2023-04-14 15:38:55',1,0),(251,'User admin delete message...','2023-04-14 15:41:37','2023-04-14 16:27:26',1,1),(252,'User admin delete message...','2023-04-14 16:27:11','2023-04-15 08:10:22',1,1),(253,'qwe','2023-04-15 08:10:15','2023-04-15 08:10:15',1,0),(258,'Hello!!','2024-03-05 20:33:23','2024-03-05 20:33:23',366,0);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES (22,'2023_03_18_130655_create_messages_table',2),(34,'2016_06_01_000001_create_oauth_auth_codes_table',3),(35,'2016_06_01_000002_create_oauth_access_tokens_table',3),(36,'2016_06_01_000003_create_oauth_refresh_tokens_table',3),(37,'2016_06_01_000004_create_oauth_clients_table',3),(38,'2016_06_01_000005_create_oauth_personal_access_clients_table',3),(39,'2019_12_14_000001_create_personal_access_tokens_table',3),(40,'2023_04_04_204533_create_jobs_table',4);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` bigint unsigned NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES (1,'App\\Models\\User',1),(2,'App\\Models\\User',2),(3,'App\\Models\\User',3),(3,'App\\Models\\User',58),(3,'App\\Models\\User',59),(3,'App\\Models\\User',61),(3,'App\\Models\\User',62),(3,'App\\Models\\User',63),(3,'App\\Models\\User',64),(3,'App\\Models\\User',65),(3,'App\\Models\\User',66),(3,'App\\Models\\User',67),(3,'App\\Models\\User',68),(3,'App\\Models\\User',69),(3,'App\\Models\\User',70),(3,'App\\Models\\User',71),(3,'App\\Models\\User',72),(3,'App\\Models\\User',73),(3,'App\\Models\\User',74),(3,'App\\Models\\User',75),(3,'App\\Models\\User',76),(3,'App\\Models\\User',77),(3,'App\\Models\\User',78),(3,'App\\Models\\User',79),(3,'App\\Models\\User',80),(3,'App\\Models\\User',81),(3,'App\\Models\\User',82),(3,'App\\Models\\User',83),(3,'App\\Models\\User',84),(3,'App\\Models\\User',85),(3,'App\\Models\\User',86),(3,'App\\Models\\User',87),(3,'App\\Models\\User',88),(3,'App\\Models\\User',89),(3,'App\\Models\\User',90),(3,'App\\Models\\User',91),(3,'App\\Models\\User',92),(3,'App\\Models\\User',93),(3,'App\\Models\\User',94),(3,'App\\Models\\User',95),(3,'App\\Models\\User',96),(3,'App\\Models\\User',97),(3,'App\\Models\\User',98),(3,'App\\Models\\User',99),(3,'App\\Models\\User',100),(3,'App\\Models\\User',101),(3,'App\\Models\\User',102),(3,'App\\Models\\User',103),(3,'App\\Models\\User',104),(3,'App\\Models\\User',106),(3,'App\\Models\\User',108),(3,'App\\Models\\User',109),(3,'App\\Models\\User',110),(3,'App\\Models\\User',111),(3,'App\\Models\\User',112),(3,'App\\Models\\User',113),(3,'App\\Models\\User',114),(3,'App\\Models\\User',115),(3,'App\\Models\\User',118),(3,'App\\Models\\User',119),(3,'App\\Models\\User',120),(3,'App\\Models\\User',121),(3,'App\\Models\\User',122),(3,'App\\Models\\User',123),(3,'App\\Models\\User',124),(3,'App\\Models\\User',125),(3,'App\\Models\\User',126),(3,'App\\Models\\User',127),(3,'App\\Models\\User',128),(3,'App\\Models\\User',129),(3,'App\\Models\\User',130),(3,'App\\Models\\User',131),(3,'App\\Models\\User',132),(3,'App\\Models\\User',133),(3,'App\\Models\\User',134),(3,'App\\Models\\User',135),(3,'App\\Models\\User',136),(3,'App\\Models\\User',137),(3,'App\\Models\\User',138),(3,'App\\Models\\User',139),(3,'App\\Models\\User',140),(3,'App\\Models\\User',141),(3,'App\\Models\\User',142),(3,'App\\Models\\User',143),(3,'App\\Models\\User',144),(3,'App\\Models\\User',145),(3,'App\\Models\\User',146),(3,'App\\Models\\User',239),(3,'App\\Models\\User',240),(3,'App\\Models\\User',241),(3,'App\\Models\\User',242),(3,'App\\Models\\User',243),(3,'App\\Models\\User',244),(3,'App\\Models\\User',245),(3,'App\\Models\\User',246),(3,'App\\Models\\User',247),(3,'App\\Models\\User',248),(3,'App\\Models\\User',249),(3,'App\\Models\\User',250),(3,'App\\Models\\User',251),(3,'App\\Models\\User',252),(3,'App\\Models\\User',253),(3,'App\\Models\\User',254),(3,'App\\Models\\User',255),(3,'App\\Models\\User',256),(3,'App\\Models\\User',257),(3,'App\\Models\\User',258),(3,'App\\Models\\User',259),(3,'App\\Models\\User',260),(3,'App\\Models\\User',261),(3,'App\\Models\\User',262),(3,'App\\Models\\User',263),(3,'App\\Models\\User',264),(3,'App\\Models\\User',265),(3,'App\\Models\\User',266),(3,'App\\Models\\User',267),(3,'App\\Models\\User',268),(3,'App\\Models\\User',269),(3,'App\\Models\\User',270),(3,'App\\Models\\User',271),(3,'App\\Models\\User',272),(3,'App\\Models\\User',273),(3,'App\\Models\\User',274),(3,'App\\Models\\User',275),(3,'App\\Models\\User',276),(3,'App\\Models\\User',277),(3,'App\\Models\\User',278),(3,'App\\Models\\User',279),(3,'App\\Models\\User',280),(3,'App\\Models\\User',281),(3,'App\\Models\\User',282),(3,'App\\Models\\User',283),(3,'App\\Models\\User',284),(3,'App\\Models\\User',285),(3,'App\\Models\\User',286),(3,'App\\Models\\User',287),(3,'App\\Models\\User',288),(3,'App\\Models\\User',289),(3,'App\\Models\\User',290),(3,'App\\Models\\User',291),(3,'App\\Models\\User',292),(3,'App\\Models\\User',293),(3,'App\\Models\\User',294),(3,'App\\Models\\User',295),(3,'App\\Models\\User',296),(3,'App\\Models\\User',297),(3,'App\\Models\\User',298),(3,'App\\Models\\User',299),(3,'App\\Models\\User',300),(3,'App\\Models\\User',301),(3,'App\\Models\\User',302),(3,'App\\Models\\User',303),(3,'App\\Models\\User',304),(3,'App\\Models\\User',305),(3,'App\\Models\\User',306),(3,'App\\Models\\User',307),(3,'App\\Models\\User',308),(3,'App\\Models\\User',309),(3,'App\\Models\\User',310),(3,'App\\Models\\User',311),(3,'App\\Models\\User',312),(3,'App\\Models\\User',313),(3,'App\\Models\\User',314),(3,'App\\Models\\User',315),(3,'App\\Models\\User',316),(3,'App\\Models\\User',317),(3,'App\\Models\\User',318),(3,'App\\Models\\User',319),(3,'App\\Models\\User',320),(3,'App\\Models\\User',321),(3,'App\\Models\\User',322),(3,'App\\Models\\User',323),(3,'App\\Models\\User',324),(3,'App\\Models\\User',325),(3,'App\\Models\\User',326),(3,'App\\Models\\User',327),(3,'App\\Models\\User',328),(3,'App\\Models\\User',329),(3,'App\\Models\\User',330),(3,'App\\Models\\User',331),(3,'App\\Models\\User',332),(3,'App\\Models\\User',333),(3,'App\\Models\\User',334),(3,'App\\Models\\User',335),(3,'App\\Models\\User',336),(3,'App\\Models\\User',337),(3,'App\\Models\\User',338),(3,'App\\Models\\User',339),(3,'App\\Models\\User',340),(3,'App\\Models\\User',341),(3,'App\\Models\\User',342),(3,'App\\Models\\User',343),(3,'App\\Models\\User',344),(3,'App\\Models\\User',345),(3,'App\\Models\\User',346),(3,'App\\Models\\User',347),(3,'App\\Models\\User',348),(3,'App\\Models\\User',349),(3,'App\\Models\\User',350),(3,'App\\Models\\User',351),(3,'App\\Models\\User',352),(3,'App\\Models\\User',353),(3,'App\\Models\\User',354),(3,'App\\Models\\User',355),(3,'App\\Models\\User',356),(3,'App\\Models\\User',357),(3,'App\\Models\\User',358),(3,'App\\Models\\User',359),(3,'App\\Models\\User',360),(3,'App\\Models\\User',366);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my`
--

DROP TABLE IF EXISTS `my`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `password_UNIQUE` (`password`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my`
--

LOCK TABLES `my` WRITE;
/*!40000 ALTER TABLE `my` DISABLE KEYS */;
INSERT INTO `my` (`id`, `name`, `password`) VALUES (1,'Lena','11111'),(2,'Hero!!','22222'),(3,'Luna','33333'),(4,'Luig','1234');
/*!40000 ALTER TABLE `my` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `my2`
--

DROP TABLE IF EXISTS `my2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `my2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) DEFAULT NULL,
  `order_id` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `my2`
--

LOCK TABLES `my2` WRITE;
/*!40000 ALTER TABLE `my2` DISABLE KEYS */;
INSERT INTO `my2` (`id`, `email`, `order_id`, `name`) VALUES (1,'Lena@com','1','Lena'),(2,'Lada@ua','2','Lada'),(3,'Luna@net','3','Luna');
/*!40000 ALTER TABLE `my2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES ('01af33d918e13fedd30d36bab0c283569ebcb5cd2d6c03b6b76e05d542001e7bddb7d7b981f23355',2,1,'authToken','[]',0,'2024-02-19 21:56:45','2024-02-19 21:56:45','2024-08-19 21:56:45'),('025d2f8493a7af92b0e9864267dcdaac4b038857a02eec96b5501f478b285f936597f47f8d0f288e',361,1,'authToken','[]',1,'2024-02-12 22:56:26','2024-02-12 22:56:53','2024-08-12 22:56:26'),('02d575920c800d4bbedc7c4cff75e1b20ff4453461eca15a5446341bbc3c8979725777718896dd18',281,1,'authToken','[]',1,'2024-02-04 23:43:06','2024-02-04 23:43:31','2024-08-04 23:43:06'),('047288c0c08933eb3b3aec7b46409bbd61b0bbe61fd8b25c44c180c8354b7c5fc072bb7b2488ce52',249,1,'authToken','[]',1,'2024-02-01 21:06:24','2024-02-01 21:07:12','2024-08-01 21:06:24'),('04d787df0f84ae8bc5b07d0b4806e07fb5baa099253c02d127a9e0111b22b6f23a8a60da27bfe0ae',1,1,'authToken','[]',1,'2024-02-01 19:39:40','2024-02-01 19:40:24','2024-08-01 19:39:40'),('04de76172a739ea9ab342e43df2ae272a1e77ebd020e0c881484238afbd472bca9d34194231ea272',156,1,'authToken','[]',0,'2024-01-30 18:48:27','2024-01-30 18:48:27','2024-07-30 18:48:27'),('0518040586873d7953eb1c4009c86a05b32df7bec9b9bb31e8334e14a6cad1f2aa5548bab3154bf8',348,1,'authToken','[]',1,'2024-02-09 22:17:55','2024-02-10 19:08:23','2024-08-09 22:17:55'),('0678695b62fa0f6eadd8aeeb6b450bc05ada98a7d4e275fb5576a1e9367ab66b0f2d881aaea7ccf6',256,1,'authToken','[]',1,'2024-02-04 18:22:22','2024-02-04 18:24:04','2024-08-04 18:22:22'),('0726e6f5dc6a0e23f1a2522c73ac66c5c5ff19535bf1f13b9c62b741b52d3bd386e3e04841ac81e5',366,1,'authToken','[]',0,'2024-03-07 21:00:56','2024-03-07 21:00:56','2024-09-07 21:00:56'),('07589204fede36e6086351e2445327625a009ad4f9e6d748ff5e77c62a60a19aeed49cea02af4669',152,1,'authToken','[]',1,'2024-01-29 21:12:18','2024-01-29 21:54:56','2024-07-29 21:12:18'),('080481a427b4b3bce36c96e34b01943ecbca084ca6154a103690184e92f45e005655889c14626249',1,1,'authToken','[]',1,'2024-01-29 17:47:24','2024-01-29 17:47:37','2024-07-29 17:47:24'),('08a98d2380bf9038c526e3c9a210388b72d35fe4423146a3f20eae18468889b563076ee19c8bb710',254,1,'authToken','[]',1,'2024-02-04 18:19:05','2024-02-04 18:20:16','2024-08-04 18:19:05'),('099198b5a76c06e85fa610103f9852d5fb96326283d4822d41b1d37e17203197e2038a6066d22b13',361,1,'authToken','[]',1,'2024-02-18 21:28:54','2024-02-18 22:46:59','2024-08-18 21:28:54'),('09bee3ef553c6793d57421c87323b79a3564d0deff58af6a35e1235e24240a9826b60129f82c464a',347,1,'authToken','[]',1,'2024-02-09 22:14:28','2024-02-09 22:16:04','2024-08-09 22:14:28'),('0a4d285e5cab5c6c9b88cabe1120aa7bfd95d4ca0706fba4e5cffe25b34ddaa1e66f6df9668ae812',310,1,'authToken','[]',0,'2024-02-08 23:16:40','2024-02-08 23:16:40','2024-08-08 23:16:40'),('0ac2fd0d2e6136ed3db3a5a391e8f96ef32703658ca22ec55b9c7b2fc3ad1f54f8d5229eb3e20831',361,1,'authToken','[]',1,'2024-02-18 22:50:22','2024-02-19 20:50:41','2024-08-18 22:50:22'),('123f139b131c41051bc38e838178a12dde3e4a271f28ebe9effd061be7376427085a12a1ff3ee4f8',361,1,'authToken','[]',1,'2024-02-12 22:42:46','2024-02-12 22:43:37','2024-08-12 22:42:46'),('12662e785b3e1f90900788ffde5ffe2d7ce10969502755ca4c6c800e6a570b766232ca4c00cd6c61',1,1,'authToken','[]',0,'2024-02-01 19:31:59','2024-02-01 19:31:59','2024-08-01 19:31:59'),('13c00376dbb3f0f41e6b4552814b46dd626dc44ea846e11c12a7a65185c4a31a6dc09a4be0205629',284,1,'authToken','[]',1,'2024-02-05 21:16:05','2024-02-05 21:26:02','2024-08-05 21:16:05'),('1676af291bcbf0a8c8dda78a47faee997bdee93fc87a6ccea237ee2a2b20a6b10efc25ffe462625c',298,1,'authToken','[]',1,'2024-02-08 17:23:12','2024-02-08 17:32:13','2024-08-08 17:23:12'),('16b37faff43b9e3d275ef27e289f621bba0fa828f6548aa67497a01c358e1ba3cbd05e549fa01894',365,1,'authToken','[]',1,'2024-02-25 21:55:21','2024-02-25 22:19:06','2024-08-25 21:55:21'),('1b57ba46af3c7f9aad563603f876f80c80fd156d7a168d2a4ed96c3f0dc2620e39222b2858ce64ea',154,1,'authToken','[]',1,'2024-01-29 22:10:59','2024-01-29 22:12:14','2024-07-29 22:10:59'),('1b6db85c0119bee3a3b0b1c4b03e310e24e898b97ba9858f89e025ad2b0dc120f42cbb213b28aa62',358,1,'authToken','[]',1,'2024-02-10 21:05:10','2024-02-10 21:06:25','2024-08-10 21:05:10'),('1cac6f5c1e19f6b3c8dfc64c49552f9df929ea7d96faf7ec2df277e01237cfa2e46488d579be1162',338,1,'authToken','[]',1,'2024-02-09 21:15:21','2024-02-09 21:16:44','2024-08-09 21:15:21'),('1d392e395d67160d06075a5e1fe3b2568a3d5220bd08e0c1c0baeb7538abc31489e05b26439b48cd',312,1,'authToken','[]',1,'2024-02-08 23:23:59','2024-02-08 23:27:50','2024-08-08 23:23:59'),('1e702703f79c8f394f52dff14b521b54c40bf20a1c89706883d7652742532f369be1d2fd2a2dc45d',1,1,'authToken','[]',0,'2024-01-28 19:40:09','2024-01-28 19:40:09','2024-07-28 19:40:09'),('20dc60f9b6b0c8ba6c01f8c7907a5cd4c209378bdbd5da6050625f74a23b4db711d45d6f904211b1',1,1,'authToken','[]',1,'2024-01-30 15:59:31','2024-01-30 15:59:41','2024-07-30 15:59:31'),('2439f6df7190295fcf8c32f287b24ed1911b0edb4f9c1fd9917f5abf8f42b0887afcfa18d4971197',1,1,'authToken','[]',0,'2024-01-30 15:58:26','2024-01-30 15:58:26','2024-07-30 15:58:26'),('25befb7af457cb4d803607c74662d96fae628dfe18d66144d1dab01ea4cca16b87252d27efceabd3',268,1,'authToken','[]',1,'2024-02-04 21:26:20','2024-02-04 21:33:20','2024-08-04 21:26:20'),('26a5cb44a4f5431f74e0025972dab3d75b2f4653e0a09ef082ce2c4319ae7a3a1a81d48a856bc725',326,1,'authToken','[]',1,'2024-02-09 18:36:50','2024-02-09 18:38:25','2024-08-09 18:36:50'),('28c8e2aadf383cc2427595143a1e5e79be528064553faa2607fb97d6883fd07a4c347d545b0502ce',1,1,'authToken','[]',1,'2024-02-01 19:40:55','2024-02-01 19:40:57','2024-08-01 19:40:55'),('29769b13cfb7d19d2e0d0fe8404c9b2a1fb46bda9c3fbf8481c59bce5540fb98f12baa2b5db4ebdb',365,1,'authToken','[]',1,'2024-02-25 21:05:40','2024-02-25 21:32:40','2024-08-25 21:05:40'),('2a4e50e8e952b8a88af6e507bc07f1ddeecd10214ce802cab70093369bff3127505886fb59d7773c',1,1,'authToken','[]',1,'2024-02-01 19:41:00','2024-02-01 19:41:03','2024-08-01 19:41:00'),('2c41c02353ab2dc3e2b94a20456a4e174da67bd10ca52633ef25a6bf2b72ed83aa619263695b67c8',278,1,'authToken','[]',1,'2024-02-04 23:37:48','2024-02-04 23:39:41','2024-08-04 23:37:48'),('2eda9b3680d70a124267cfc9f9933a967a0704a3ff52ec2c26546b961670ac45123d089f1732a288',175,1,'authToken','[]',1,'2024-01-30 22:34:34','2024-01-30 22:34:37','2024-07-30 22:34:34'),('2f8120aabd496792ebb0858f28b01a2e96fc228401e6d943d0d5e9d834ccfa1fda95505151a379ee',240,1,'authToken','[]',1,'2024-02-01 19:49:25','2024-02-01 19:56:49','2024-08-01 19:49:25'),('3247eb4d74653ea621a4b9741c54c9e8b52573225161cbb1b367d9a773388fdf2b86a74c2b383551',164,1,'authToken','[]',1,'2024-01-30 19:01:12','2024-01-30 19:02:48','2024-07-30 19:01:12'),('345a3ac3425fe9a799b9c36af8b76a8ce22084eaacafa12d52c32541d17ca69c2e3e26ecdf9f7c50',1,1,'authToken','[]',1,'2024-01-29 21:06:06','2024-01-29 21:06:14','2024-07-29 21:06:06'),('35a03cb6a6845b0651c0682a123a15b9b3e2ead955ba983c63b297497957a762c45c1ec8ddb8aced',4,1,'authToken','[]',1,'2024-02-12 20:37:06','2024-02-12 21:12:31','2024-08-12 20:37:06'),('384361301fcc78fadd4f0fafbf50dc0830c1e1bf550a4d2d049663404565892c9366375d94949442',350,1,'authToken','[]',1,'2024-02-10 20:23:13','2024-02-10 20:24:47','2024-08-10 20:23:13'),('3854cd301a30e73373e79c18afd3a380af582cac44695d88b21e4a5ec2b284544fe8b58091420832',152,1,'authToken','[]',1,'2024-01-29 21:11:41','2024-01-29 21:11:44','2024-07-29 21:11:41'),('39a4173c4e830c71388c740f19efb0923fd5303eb6880ba5ef0a5fbfc542cb1c53cbe1e5f59a1363',313,1,'authToken','[]',1,'2024-02-08 23:28:40','2024-02-08 23:39:14','2024-08-08 23:28:40'),('3f1b2ed49862c25ce8b22ae4bfbadf5196d60594c75b99a1bb2b95ddd1c0bf9b575521da2b116517',1,1,'authToken','[]',0,'2024-02-01 19:32:05','2024-02-01 19:32:05','2024-08-01 19:32:05'),('3fe1083ad53e9fc71dd88604daf9dc15f15961b52018b1ce1817da52a58c13fdb5c8ac35a3f122c7',352,1,'authToken','[]',1,'2024-02-10 20:42:40','2024-02-10 20:44:03','2024-08-10 20:42:40'),('4362514632e623861de4caa573d8f19f4094c458ed6aad76f0f7dcb4792badb0adfcc5e39cb5e1d4',309,1,'authToken','[]',1,'2024-02-08 23:15:02','2024-02-08 23:15:58','2024-08-08 23:15:02'),('43ff0e83152ccf641c4afb92e0ef259cc8d4cb81fd75dcc830148be53cf9559b7fa0a4ef70dfbcb6',361,1,'authToken','[]',0,'2024-02-19 21:51:00','2024-02-19 21:51:00','2024-08-19 21:51:00'),('45c4f41d703550b94e1b21a0a15aa2ecfdb33f22f7fa71d66d95aa94d5d51c6fa52065d0b32a636c',292,1,'authToken','[]',1,'2024-02-05 22:28:05','2024-02-05 22:38:36','2024-08-05 22:28:05'),('45e34eaf90b56edcf3b0d79a60b807421d7936b56775468b1e6fe42b66fb46e2299a2cee4f697041',290,1,'authToken','[]',1,'2024-02-05 21:49:44','2024-02-05 21:53:29','2024-08-05 21:49:44'),('485b6a225e2fae914715f12c018259cc171f59aa19099d942db694b7438b9e0b624043a148798d5e',303,1,'authToken','[]',1,'2024-02-08 21:08:12','2024-02-08 22:23:01','2024-08-08 21:08:12'),('4861d048b2aab0c6901efc5207ab6d776b89cf0175e6703a29cf557996226c1114d0f7cc96c371e8',248,1,'authToken','[]',1,'2024-02-01 21:03:29','2024-02-01 21:05:33','2024-08-01 21:03:29'),('48ada37674ac44db08c11d8b8ce5969acc1625eefadfca6e8ee5815dad304e11dcd1c95962db68d3',253,1,'authToken','[]',1,'2024-02-01 21:23:59','2024-02-01 21:39:10','2024-08-01 21:23:59'),('49265b509b2c2d5668486f62807badbec5d664651b5cc046863eea512a37e925a86dbc9efccbe07b',156,1,'authToken','[]',0,'2024-01-30 16:28:12','2024-01-30 16:28:12','2024-07-30 16:28:12'),('497160d904f249e794541107c611afc4429b8d49534074bc04057926e922282cd0fd72800930adc7',156,1,'authToken','[]',1,'2024-01-30 16:09:10','2024-01-30 16:16:56','2024-07-30 16:09:10'),('4a756a0107236387d9c0775bcccf471a1facf28d73a8ccc3aa01108954fd05f0c278dc99c98757c6',158,1,'authToken','[]',1,'2024-01-30 18:59:33','2024-01-30 19:01:00','2024-07-30 18:59:33'),('4e58f84cb99a53cc3ef7dde013bdabfd7dd84e4014374088bc36c95f7ef48b6f85f3bd10a9b3f1e2',1,1,'authToken','[]',1,'2024-02-01 19:41:27','2024-02-01 19:41:29','2024-08-01 19:41:27'),('4f642b97dc736395d5074b78a865d93ed2c356661182d980675ea86f00ace65308723a67d3d3057a',360,1,'authToken','[]',1,'2024-02-10 21:24:40','2024-02-10 23:40:54','2024-08-10 21:24:40'),('505e6070dcd7544908333904f1c331fcb521dd86dadddda24bd4cfa78cdf75b959b576a1259f069a',330,1,'authToken','[]',1,'2024-02-09 18:46:40','2024-02-09 19:04:56','2024-08-09 18:46:40'),('515ba7b9ce6fc1113baeb648e6042cfa86a25cbcf53ba3f34fb9d389e1f1f1694f8652d1268e8007',343,1,'authToken','[]',1,'2024-02-09 21:37:43','2024-02-09 21:51:04','2024-08-09 21:37:43'),('52f9399543276ef88b261f74342b550bac57b4cc1e361d7b3f2163e879163d216dc8d021cad48c5f',269,1,'authToken','[]',1,'2024-02-04 21:34:02','2024-02-04 21:45:36','2024-08-04 21:34:02'),('530da19f93838196784d43a958c3154ffd00cd35b8d39bc60d4df4a87a896cc6d0d0487c0d27112f',345,1,'authToken','[]',1,'2024-02-09 21:59:05','2024-02-09 22:01:53','2024-08-09 21:59:05'),('58437b73d40656f9ed4e5374a2bcc4be00af2de89ed7ed164ecd2193e50421e13b086f9ea4254a0d',321,1,'authToken','[]',0,'2024-02-09 18:14:00','2024-02-09 18:14:01','2024-08-09 18:14:00'),('598217e23571386e2aca71608a2154a425853d8474631fceba66076f212672b27140b0d59c2b92ca',325,1,'authToken','[]',1,'2024-02-09 18:24:15','2024-02-09 18:36:19','2024-08-09 18:24:15'),('5b0719d141b16c08288a82b4fb09164a14f9c5c6af8c106131750d502b63468b8e0640590dab8eb5',361,1,'authToken','[]',1,'2024-02-12 22:52:55','2024-02-12 22:56:12','2024-08-12 22:52:55'),('5b5d64e8e51e134684557432d391ab3d28e47fb0f2f21ad205cbdf9a4e6af9f9dae3c5cc66e5da93',1,1,'authToken','[]',0,'2024-02-01 19:37:07','2024-02-01 19:37:07','2024-08-01 19:37:07'),('5c82d4ede3681021670b602a59dd274b81c0b27ffb5650baac20c5292ed4364b0c1ffb1fce591b0d',291,1,'authToken','[]',1,'2024-02-05 21:53:55','2024-02-05 22:04:22','2024-08-05 21:53:55'),('5ce427ac7cedc6d666ff6f0ff62ce8d9c51ef252acb656eaa54af04e4f002b94ee32004887ab795d',293,1,'authToken','[]',1,'2024-02-05 22:42:31','2024-02-08 16:55:43','2024-08-05 22:42:31'),('5d84ed20a1a66ac5c270013e3895e7b7bc8960cb597f55114330cbbf2ce97a2638165a2d935b0f4c',287,1,'authToken','[]',1,'2024-02-05 21:33:04','2024-02-05 21:34:17','2024-08-05 21:33:04'),('5e3fbda7382a7a00b2c88549a299b45c9096eddca3bb4fe22c8ad61253ae555f16ffe41eb45e1ced',311,1,'authToken','[]',1,'2024-02-08 23:19:54','2024-02-08 23:23:26','2024-08-08 23:19:54'),('61ba8614c4f83e9ae3392d6184ea7d41e41b23f709aab92cbe4ee0364d8cccb906c2ee0be5251d8a',340,1,'authToken','[]',1,'2024-02-09 21:20:35','2024-02-09 21:21:54','2024-08-09 21:20:35'),('62a7f61a3eb8cecdf6ce66c234e29370696d7a042e764e4f63762e1277823334aa7c787c8b7cbe33',1,1,'authToken','[]',1,'2024-01-29 21:11:33','2024-01-29 21:11:37','2024-07-29 21:11:33'),('6417e616905195502343fcf250cabfabb2c5bd994d4fc5bde7e8fa748d720cfb09a5858f186501ec',181,1,'authToken','[]',1,'2024-01-30 22:49:38','2024-01-30 22:49:42','2024-07-30 22:49:38'),('649d9ecfe14038cd9103c7aaf4a7f69cb72e302a34b7e0ffa5ca1ed7032c751aac2b044391317d62',156,1,'authToken','[]',1,'2024-01-30 16:07:46','2024-01-30 16:09:07','2024-07-30 16:07:46'),('6841237ea103070d9d90998535b30c004d1c6a61195c26f5966ce5747b6864350215c6f7b32683ff',318,1,'authToken','[]',0,'2024-02-09 18:07:00','2024-02-09 18:07:00','2024-08-09 18:07:00'),('6b80311dd9ae19b15861d5b92ed239efcf5c387faa28ca9cb83fa053253c674e1592a74ee0a8dcb6',246,1,'authToken','[]',1,'2024-02-01 20:45:06','2024-02-01 20:47:39','2024-08-01 20:45:06'),('6d0e89e90ae63eb68228ffc819304b66a746ddb4dd8c0cbf4cbc44ecbfa702ad4b3647360fc0e778',361,1,'authToken','[]',1,'2024-02-18 21:12:03','2024-02-18 21:28:41','2024-08-18 21:12:03'),('6f768625cf6185013d798c7055e6439b4d1c353fdf799d78aedafa4b4fbd9af689b2c9888c3c284e',2,1,'authToken','[]',1,'2024-01-29 17:47:52','2024-01-29 17:47:55','2024-07-29 17:47:52'),('6f9d036603c7dc82b6d499decc736ff7c71740b6ae9f4ee8ab9aa9a1cbe026de2b4d8a2bdca49ff3',323,1,'authToken','[]',1,'2024-02-09 18:16:45','2024-02-09 18:18:56','2024-08-09 18:16:45'),('6ff23e16e9b7f51b7491ae92cff6ad3cbede5b0c19c517ac3b7e25da8a7c7c745ed9328fcffe8230',280,1,'authToken','[]',0,'2024-02-04 23:41:36','2024-02-04 23:41:36','2024-08-04 23:41:36'),('716d74a334791147d37a4c5541ba2af8a746dad269162a172acc67b16c56c7ef82df0ae2ad6b657f',365,1,'authToken','[]',1,'2024-02-25 20:57:17','2024-02-25 21:05:31','2024-08-25 20:57:17'),('7229ab1308268b12ab85c11eb8780278c56bba840bd6efe36ffa3bbc39d79c298b811f56844e8cd1',329,1,'authToken','[]',1,'2024-02-09 18:45:00','2024-02-09 18:46:15','2024-08-09 18:45:00'),('7370f822485a7c97adb53c1057a3268f09edbbc1b421c3f71b971552e8b4143c7ee714e42414e887',366,1,'authToken','[]',1,'2024-03-02 22:38:09','2024-03-06 22:24:13','2024-09-02 22:38:09'),('73d2316b17310835539d688961315103a4d1939ca32fa75d2c733229e7e2f2fca9fbeeabfa7ba96d',319,1,'authToken','[]',1,'2024-02-09 18:08:05','2024-02-09 18:10:50','2024-08-09 18:08:05'),('740a3e52fb5bf73fe29e6941b17578107f7f76ad6fa456a2a3e5c5c02b7ca96ce74ab6ec3cebaf3c',181,1,'authToken','[]',1,'2024-01-30 22:49:12','2024-01-30 22:49:16','2024-07-30 22:49:12'),('77f97e4c1fd649075ee29001d6ac1e2598a28d076d16969f284a9012d23b6aa55027e2c905931d76',328,1,'authToken','[]',1,'2024-02-09 18:42:44','2024-02-09 18:44:26','2024-08-09 18:42:44'),('794e16aa8a8ae4f87e2aadb923be917b03df3486617582027aa8dc6febd825ce590a3f2b2769f2f7',353,1,'authToken','[]',1,'2024-02-10 20:45:35','2024-02-10 20:49:30','2024-08-10 20:45:35'),('7c86a1c61da9792ed2c7e1f12ef5c57e7c420d4a9d415a8068e09e82a995960deb2f3b5307ffee3c',361,1,'authToken','[]',0,'2024-02-19 21:44:51','2024-02-19 21:44:51','2024-08-19 21:44:51'),('7d578361ece1e678bd06d8d051a2cf6ad7a88f28504560b8889574064324abde1393b0957a41b828',179,1,'authToken','[]',1,'2024-01-30 22:44:57','2024-01-30 22:45:00','2024-07-30 22:44:57'),('7d6be075ce9c7ba3784d00f56695e9b01eeab058c2c1a983808017e5c32860d2ae434d22fae427d4',1,1,'authToken','[]',1,'2024-02-04 23:12:23','2024-02-04 23:12:28','2024-08-04 23:12:23'),('7db91eeeb9f8ab05ecc88e35955ae9bbbd26927566b51a68b39d53f67bd6d0cf336ff401b83d0d60',2,1,'authToken','[]',1,'2024-02-18 21:09:19','2024-02-18 21:11:02','2024-08-18 21:09:19'),('7dc0e97d2a705767ca3d0360064159c27cf38a50700826975515573b144ad7fb57f09d516e343b2f',1,1,'authToken','[]',1,'2024-01-29 21:08:42','2024-01-29 21:08:46','2024-07-29 21:08:42'),('7eadadf67fc2e604574de4e4167238e10242a022f78a6d236e649a49b8ceb14c850929f6d632d33d',158,1,'authToken','[]',1,'2024-01-30 18:50:20','2024-01-30 18:51:30','2024-07-30 18:50:20'),('7eb075d32c3f0b3ef7999728acf562cc02792ddc6abd8630d1f33329fd1f9e80e5a2ae14dc987065',364,1,'authToken','[]',0,'2024-02-22 20:07:41','2024-02-22 20:07:41','2024-08-22 20:07:41'),('7ecc697e6e7e1a06a44500fe0b51e791c99822f38d187175c773437d771f87152820c087287f013b',2,1,'authToken','[]',1,'2024-02-01 19:40:48','2024-02-01 19:40:51','2024-08-01 19:40:48'),('80686675187da6cb4575d02398c95bf4537eeec381deba6714c7e5a7b9f72cd014fbe90c507c18b2',361,1,'authToken','[]',1,'2024-02-13 11:11:48','2024-02-13 11:11:53','2024-08-13 11:11:48'),('807f8907221b3f8e630d59d1afafd72f990ac7469892c43d67bc2fd2283e6f0b9f7e97ae1666ceab',1,1,'authToken','[]',1,'2024-01-29 19:45:31','2024-01-29 19:45:34','2024-07-29 19:45:31'),('8156e0f658704c0bb380e78ac0eeee0455d863bbd146cec4a0871268e54660d83696936c438117f3',327,1,'authToken','[]',1,'2024-02-09 18:39:19','2024-02-09 18:40:58','2024-08-09 18:39:19'),('816e9226779059c343cd0f521471e40b07d1ca9dfe072f0606ed9715117c79c18ebc311464705ff4',165,1,'authToken','[]',0,'2024-01-30 19:04:17','2024-01-30 19:04:17','2024-07-30 19:04:17'),('832d5b9599eed77bb040c9022b65790e7fabe0098985fc198f8d754e8696a5e586acdb9b7d634a6f',362,1,'authToken','[]',1,'2024-02-22 19:49:12','2024-02-22 19:49:17','2024-08-22 19:49:12'),('834ca6000f7b371414d68072ca9a7fe80a240dd9b07038349da4dc4b3ca1056fa559dda3463583c1',314,1,'authToken','[]',1,'2024-02-08 23:43:28','2024-02-09 17:38:50','2024-08-08 23:43:28'),('83ac05d10cbf1f54dc8e354e2ce650ea77f59a52cb2f3a63314ee39895e48739f0f9c456ff4498cd',167,1,'authToken','[]',1,'2024-01-30 19:17:12','2024-01-30 19:17:29','2024-07-30 19:17:12'),('85e10933c174d179cffd1b6f6ae0ea45722e9b3af945e5ec5b38eecca1b7d9d2f4e7683840c5a057',365,1,'authToken','[]',1,'2024-02-25 21:53:00','2024-02-25 21:55:02','2024-08-25 21:53:00'),('86ef6b0748d7fadf425c7b4c14c2671e59b18bac1a1bb249c146e8c4a5d71c803961f215e2cf06e3',339,1,'authToken','[]',1,'2024-02-09 21:18:17','2024-02-09 21:20:09','2024-08-09 21:18:17'),('87abd0b2fc3be98b2581a740e995707c18ae58253969a0487f5a5706e178efa16864715762b8c860',304,1,'authToken','[]',1,'2024-02-08 22:23:34','2024-02-08 22:25:04','2024-08-08 22:23:34'),('8a418423a856b87ae8da6c111dc8b4af95417192d91ca2b933726c65de749a28ac223cb23843934c',250,1,'authToken','[]',1,'2024-02-01 21:07:39','2024-02-01 21:08:11','2024-08-01 21:07:39'),('8a4cd4b947999f4352156c3178cc0a71b9fa6e0ba83c880ef4b60ec68bf85b77859ae3a846cac298',239,1,'authToken','[]',0,'2024-02-01 19:44:11','2024-02-01 19:44:11','2024-08-01 19:44:11'),('8b35ca42a480c3bf0a76e1c9f6a80cc47a1e44b0bb3142f4afb4ffdb50ec347edaf63439d32e3e76',322,1,'authToken','[]',1,'2024-02-09 18:15:38','2024-02-09 18:16:23','2024-08-09 18:15:38'),('8b92ed3ab5aa9a5bf321a1a297756ebdd73a731f544dacd333eb96457f793e571ffe1eb0b38e6934',361,1,'authToken','[]',1,'2024-02-12 23:48:58','2024-02-13 11:07:18','2024-08-12 23:48:58'),('8be23203dafedcb08fe86393ae25f71300f55299f51024599f01289d399a46e91ed558eecb193bbb',1,1,'authToken','[]',0,'2024-02-01 19:33:51','2024-02-01 19:33:51','2024-08-01 19:33:51'),('8d3cc4c36fc401d8c87bc5749f1570d3f090e14695ceca95cda6d7e2cadcf20b3d44ae702db8e397',276,1,'authToken','[]',0,'2024-02-04 23:32:44','2024-02-04 23:32:44','2024-08-04 23:32:44'),('8e27d1813696e445626a318ce65e158f3fb3847a5e3479966840ddfa35b98b0f30184e83289070f9',289,1,'authToken','[]',1,'2024-02-05 21:41:09','2024-02-05 21:49:18','2024-08-05 21:41:09'),('8f4caff217c3cc226b7c17690e4d0df71cd6ef714032e8a4852e544910c69a81e6edcebed2fc6d92',366,1,'authToken','[]',1,'2024-03-06 22:26:38','2024-03-07 21:00:48','2024-09-06 22:26:38'),('919bfe9943ec7e89e55347e6cedb2b32845e94d3d4547b6330a1a922151c4fdd12132dee351eaf2d',361,1,'authToken','[]',1,'2024-02-13 12:20:45','2024-02-13 17:13:49','2024-08-13 12:20:45'),('93a66393f28d88421602db94fadfd61855729a4e55b986a01577b7ec6fbe3132c10bc4f3c7fcacd0',260,1,'authToken','[]',1,'2024-02-04 19:55:11','2024-02-04 19:59:39','2024-08-04 19:55:11'),('9551a65094984fbd80d2d8e2e3aa47774fa21c1ae88d697ece2d8d8c10ba71cd904a565d03955993',356,1,'authToken','[]',1,'2024-02-10 20:56:31','2024-02-10 20:58:43','2024-08-10 20:56:31'),('9726d84c2db1ff8b37687fbc590c6366b04faa4576f6a338043571defb7dee0ce08e994a00b9dba4',257,1,'authToken','[]',1,'2024-02-04 18:24:28','2024-02-04 18:25:52','2024-08-04 18:24:28'),('97d94a39e39485cd334ec55176996ab5b377bcc4c9d4eabb25f1fafe1c6c4fb15bbba66f66e36ce4',1,1,'authToken','[]',1,'2024-01-28 19:41:15','2024-01-28 19:41:23','2024-07-28 19:41:15'),('9855708d9ec5848fcf2ce04edbdcbc765a1ccdc5c03c68eef40cb69612f324caefe37907425d6a5a',361,1,'authToken','[]',1,'2024-02-13 17:17:24','2024-02-14 22:37:12','2024-08-13 17:17:24'),('99e9bbd90a0b5770532b02873cc519187f3d062baf32e109ff637e6b2952571fa35a2be1146cf565',282,1,'authToken','[]',1,'2024-02-04 23:44:18','2024-02-05 21:12:57','2024-08-04 23:44:18'),('9b1d6e4f42d66ab896e3e9715202bf3d7c191e064b6c89acfb2a372c918320510cd426d5841cec8f',277,1,'authToken','[]',1,'2024-02-04 23:35:33','2024-02-04 23:36:14','2024-08-04 23:35:33'),('9caf5441dd252fecda01d12b99ab5a433b5ece262fbeac89dae956e14449f960c6cff355357cc1f3',1,1,'authToken','[]',0,'2024-02-01 19:36:46','2024-02-01 19:36:46','2024-08-01 19:36:46'),('9e413820a619ca17104ebf1fbca2cd9bd6016299cd423179f8a7dcdd9e5512a39117af38ccb459c4',153,1,'authToken','[]',1,'2024-01-29 21:55:18','2024-01-29 21:55:35','2024-07-29 21:55:18'),('9f93d8155beff41e7fa41ac522eab0888da4f792f60ff82cce407e352f0d2912f487bae1a1a4f846',242,1,'authToken','[]',1,'2024-02-01 20:16:11','2024-02-01 20:39:45','2024-08-01 20:16:11'),('a0fd6f9aa85792d2dfd56373058a116e76c06b2aeec22af7f4ec7410b5d41bdf283901542f5ffc51',1,1,'authToken','[]',1,'2024-02-12 22:52:28','2024-02-12 22:52:31','2024-08-12 22:52:28'),('a10984d3f12094fdd996b9fb3a344f52333d18bde1f5f16ff34b0a72b9d7518209607034c1ff29e0',1,1,'authToken','[]',1,'2024-01-30 19:11:09','2024-01-30 19:13:18','2024-07-30 19:11:09'),('a10d6b3fe1a7557357de08c97035ec5d99135da830bdad5c40064ab55a80cdf009770391c08e831b',1,1,'authToken','[]',0,'2024-02-01 19:31:35','2024-02-01 19:31:35','2024-08-01 19:31:35'),('a146e15dc3cb9e2b6379b5d0cd925dc1ef20e77b6f8b20b31956d27ffecb3a6fe4c6d335039ce37f',365,1,'authToken','[]',0,'2024-02-29 21:04:41','2024-02-29 21:04:41','2024-08-29 21:04:41'),('a3e1f53cd061c94a89ad08a7448271ddfb4a87fe96c6317a006876a2ebc66fc2e68357f2569b1264',344,1,'authToken','[]',1,'2024-02-09 21:52:01','2024-02-09 21:58:33','2024-08-09 21:52:01'),('a612a047bd80c116c74c10dd27d02f399b6c9d71a778f09fa53fd10f485f47b671d4fb49b2da8f31',4,1,'authToken','[]',1,'2024-02-12 22:38:51','2024-02-12 22:39:00','2024-08-12 22:38:51'),('a689fd963142fd4b274b4ca2078f03eeebd2a929db4c84c8def0f50d25610befb40c24359129bce0',362,1,'authToken','[]',1,'2024-02-22 19:48:29','2024-02-22 19:48:35','2024-08-22 19:48:29'),('a6a39eeabd9b50b8a5fd281dd38eff57ad8b1f8d1f3bd48730fbd8fa9b790e6a2aabffdda4cc721a',1,1,'authToken','[]',1,'2024-01-30 15:57:17','2024-01-30 15:58:22','2024-07-30 15:57:17'),('a6a771752ba294cdf7fe371f17e5d874ff2f1543c33330cea5530da23d99244c806ddc40e06828a6',302,1,'authToken','[]',1,'2024-02-08 17:44:32','2024-02-08 21:07:37','2024-08-08 17:44:32'),('a6b54be0a7accf5ba1fb8292861160ee2a3e8b46d167c735d222d9d5162ff32d7b2f5315d50ef70c',279,1,'authToken','[]',1,'2024-02-04 23:40:27','2024-02-04 23:40:56','2024-08-04 23:40:27'),('a792f48e3f36772ea1e995142a4460e3f027af1b3ce466e8e31df15a98beb71851b35923be5871bb',342,1,'authToken','[]',1,'2024-02-09 21:29:34','2024-02-09 21:36:52','2024-08-09 21:29:34'),('a7c798f885ec78e0763a4f472c1880bc7ec515d86fb1d7978dae837301048d5b02abbef3f3bbae8c',171,1,'authToken','[]',1,'2024-01-30 22:12:48','2024-01-30 22:13:16','2024-07-30 22:12:48'),('a7ccc3f51adb0d0ea478f3e235772ca0a8098f14d2b9b3252ef6b6fee9d3f8b3689e57df02abbbeb',1,1,'authToken','[]',1,'2024-01-30 15:54:47','2024-01-30 15:57:14','2024-07-30 15:54:47'),('a7e8521c63dba78464055a5bf7cb37312bb274013df3faa92329a8cab8d3014fa6dc205578c2393f',155,1,'authToken','[]',1,'2024-01-29 22:13:31','2024-01-29 22:13:58','2024-07-29 22:13:31'),('a83a29b7a47d9938ba3bcb7026f6444d0926dfe02805bacf790798b4b2e228d0d5d9d9880be64bc5',366,1,'authToken','[]',1,'2024-03-02 22:05:02','2024-03-02 22:37:52','2024-09-02 22:05:02'),('a949a38ae645002975d16343870418c334cf0e662aab9ed5a4f18a3fed5832a737c67e7f1e0320a5',308,1,'authToken','[]',1,'2024-02-08 23:13:17','2024-02-08 23:13:54','2024-08-08 23:13:17'),('aa37c9fa3e05389c84f7b1b9cbec8bb5327eeff2b56973b5c7c74a3da694b21ca5b45cc24569a63f',1,1,'authToken','[]',1,'2024-01-29 22:29:13','2024-01-29 22:29:49','2024-07-29 22:29:13'),('ab7da276ad0ede3c8e49d1ee50eddd49dc9910ef4de7dcc6eee00409676edb9f2a1301c182b9bba3',1,1,'authToken','[]',0,'2024-02-19 21:55:38','2024-02-19 21:55:38','2024-08-19 21:55:38'),('ace8b0532922938ea7e0e51dfb9510d12d0d0e50af8e73ae910ab2b2dbba8806b383da6a664631dd',166,1,'authToken','[]',1,'2024-01-30 19:13:22','2024-01-30 19:13:50','2024-07-30 19:13:22'),('ae8a6d58726fe04eb19215c7c5670c0c8cd3e4c5e0da0125ef6dd57f2e2f4fca3e15ce0b51ca7e48',297,1,'authToken','[]',1,'2024-02-08 17:15:50','2024-02-08 17:20:08','2024-08-08 17:15:50'),('aec993a693cb5b97c26207a486b453ea886164a7c963f131e3b0ac682fad7556c15da6d1b473745e',361,1,'authToken','[]',0,'2024-02-19 20:53:38','2024-02-19 20:53:38','2024-08-19 20:53:38'),('af33a76e94e68060690315466feab5583a442406f10914b5579f37f1dcd608d34a4b1521ecd2375a',5,1,'authToken','[]',1,'2024-01-30 19:09:37','2024-01-30 19:11:05','2024-07-30 19:09:37'),('af853082b65df18f47204791dd5601962b3447706585ce7bdbb394dab25998bf9b2f0dc10b53a1c5',355,1,'authToken','[]',1,'2024-02-10 20:53:01','2024-02-10 20:54:50','2024-08-10 20:53:01'),('b04be0be8cb339aa34d4d38819d461e666b5028e5eae37be7b43f5b9d94d39608cfeead7029a1302',317,1,'authToken','[]',1,'2024-02-09 18:04:12','2024-02-09 18:06:29','2024-08-09 18:04:12'),('b1aa7c31d0ec3cc19e6e1f5d3a5389e0049a80ae9d920c02175177a0a35780c0d95296dfda00a4d1',259,1,'authToken','[]',1,'2024-02-04 19:54:01','2024-02-04 19:54:38','2024-08-04 19:54:01'),('b2cba2bf94804a2a6b94918a31021e0b90f89dcccd6491d3586f85b96cf15b3c1a0c17802b65e631',305,1,'authToken','[]',1,'2024-02-08 22:25:40','2024-02-08 22:52:56','2024-08-08 22:25:40'),('b2f5d602952955bf236da2c192fd4ac4c446e87744340b94b9e5122ca321901af48e6150d962ca1c',243,1,'authToken','[]',1,'2024-02-01 20:40:37','2024-02-01 20:40:44','2024-08-01 20:40:37'),('b3b4e155a1fc31c8586e8913287a9f9d1040cfbecbbcea6b6afa730290466d7d46452d4af7efdd5d',238,1,'authToken','[]',1,'2024-02-01 19:40:26','2024-02-01 19:40:43','2024-08-01 19:40:26'),('b3d1236759e86f0c963aa7fcbcaa385d2344f478e985a742591a1f7c54a2c13c5aaac1a0501da923',251,1,'authToken','[]',1,'2024-02-01 21:11:10','2024-02-01 21:11:57','2024-08-01 21:11:10'),('b53f5b08435b2411193fd0673017155ebaad4b106edb135c527ed277d75f29c2d7c98be8b5fd745e',359,1,'authToken','[]',1,'2024-02-10 21:18:45','2024-02-10 21:23:57','2024-08-10 21:18:45'),('b803235d1cd44b1451dae1b17058d794b3b37ab7445f84a4d161e86cf5521bc96153d5f675b0f9fd',238,1,'authToken','[]',0,'2024-02-01 19:36:52','2024-02-01 19:36:52','2024-08-01 19:36:52'),('b8043ed72f014f1ea2dd9064acbabf4a68b8e3df16503b320d73c4d234ca1f1ab5c9e3745afe81ae',181,1,'authToken','[]',0,'2024-01-30 22:49:45','2024-01-30 22:49:46','2024-07-30 22:49:45'),('b97975e234f4ec07ff8b59e287c3d0ae089d108def231cd4429da089e8b6f4c18524ec7b44fef176',152,1,'authToken','[]',1,'2024-01-29 17:47:40','2024-01-29 17:47:43','2024-07-29 17:47:40'),('ba5de7eed748c2bc1880fa350a9e137b7ad62eae9e1957b53040371099ed43b9dd55b2581a077a4f',333,1,'authToken','[]',1,'2024-02-09 20:19:20','2024-02-09 20:23:04','2024-08-09 20:19:20'),('bac1dff5d4a358f58812e179863e270459e2bb7a5f4e9b3505446f64875ea608922a4f4e1fea404d',357,1,'authToken','[]',1,'2024-02-10 21:02:16','2024-02-10 21:03:13','2024-08-10 21:02:16'),('bb0797d31308568c5b14bb04a721bccf022c1248954b94763326176e5b83a0194b0572d5d73892f9',346,1,'authToken','[]',1,'2024-02-09 22:05:01','2024-02-09 22:09:39','2024-08-09 22:05:01'),('bb10b9e961f0b5970127adaabdf23bdc7b12dbae44bd42ba048d15afe1491b3210b606f0ffd781ee',362,1,'authToken','[]',1,'2024-02-22 19:49:34','2024-02-22 19:49:40','2024-08-22 19:49:34'),('be3fd0d588c259fb1b9349e48e6898bf72efd28955d41401f29e8b7d4d0890eb737749f3ef5ae7fd',334,1,'authToken','[]',1,'2024-02-09 20:23:44','2024-02-09 20:55:38','2024-08-09 20:23:44'),('bfcf52be8a9c39b37688674c7b01f3e35e8e361474b29abb8e1a3fa58f2f94ec50c41a84205623bc',320,1,'authToken','[]',1,'2024-02-09 18:11:23','2024-02-09 18:13:33','2024-08-09 18:11:23'),('c012b6c40455cd7a30aea5e75a9868c694189ebb05b01c57d94a7c0a7f07de822926f87a005267be',285,1,'authToken','[]',1,'2024-02-05 21:27:19','2024-02-05 21:30:38','2024-08-05 21:27:19'),('c08e60511872d7e0a2b852b3fbe21055e28c4c1c27bb11818e6af6f70f5e1bf306d03b76e2e84b4f',283,1,'authToken','[]',1,'2024-02-05 21:15:05','2024-02-05 21:15:16','2024-08-05 21:15:05'),('c2019aec7881fc09095e67dcbd15ca21b021304adea85e427272291c9031422de2f4753834b517d0',315,1,'authToken','[]',1,'2024-02-09 17:50:54','2024-02-09 18:01:40','2024-08-09 17:50:54'),('c312525812cbcc172cd93fc4896b5c56bae14af4bef04abfcb501b7b81cbb8b174562dc27d3696bd',255,1,'authToken','[]',0,'2024-02-04 18:20:40','2024-02-04 18:20:40','2024-08-04 18:20:40'),('c45d87b157440ee2141e434109fd4a9fa1a0f3321a11fb1c31903b979625c67e53aedc79c725dccf',299,1,'authToken','[]',1,'2024-02-08 17:32:59','2024-02-08 17:34:26','2024-08-08 17:32:59'),('c911402303dba9daa7487040d1c9c455ee6d41d6176abf1497017e28e5fc148d816e6887ea0a666c',294,1,'authToken','[]',1,'2024-02-08 17:07:52','2024-02-08 17:09:52','2024-08-08 17:07:52'),('c9b5052388d1788a05adac70d402b2fcb5db49af9cac07ac5bcab6a138a23bb5f91661f5bf0dd7ad',331,1,'authToken','[]',1,'2024-02-09 19:05:31','2024-02-09 19:11:16','2024-08-09 19:05:31'),('cb81834e30b2a2668c38e394d9f3dae52289f9b7d2d1541981a64d57295d48624349e00dbdb118f2',241,1,'authToken','[]',1,'2024-02-01 20:08:53','2024-02-01 20:13:47','2024-08-01 20:08:53'),('cc3cb89f912c623d67fb01e96d1887e33ca56d8f9cfe722d63894d6040fe77ad608119b98a568f81',275,1,'authToken','[]',0,'2024-02-04 23:26:56','2024-02-04 23:26:56','2024-08-04 23:26:56'),('cc3cd00d90fcad4c83f3c4d457d8d906ef12521049045c3b83d34bf1afc7a22641ad13f9a23be07b',177,1,'authToken','[]',1,'2024-01-30 22:42:07','2024-01-30 22:42:11','2024-07-30 22:42:07'),('cdb4fa9dd6aba9d5855dae7c42fbf31970c8a8df604dad78c06d6a93a3858d8b6a41f72f6e359368',361,1,'authToken','[]',1,'2024-02-14 22:37:38','2024-02-15 21:20:08','2024-08-14 22:37:38'),('ce21aaabc6f6f018796723632b88c33a379a54dfc2570ae6f0afe79b2b8e86606977874e842c8aac',181,1,'authToken','[]',1,'2024-01-30 22:49:19','2024-01-30 22:49:35','2024-07-30 22:49:19'),('d08c309716053f32f9c03ce86fd19e35bb66deb7b1e34c2a8924e9bf3824f6da6278c7cff2da055b',362,1,'authToken','[]',0,'2024-02-22 19:52:12','2024-02-22 19:52:12','2024-08-22 19:52:12'),('d36ff2272c1d01293a18e7d92ebcb41b022527c9e202d8a09c3cbf3746f3cbb887dbf607db227707',365,1,'authToken','[]',1,'2024-02-25 21:32:52','2024-02-25 21:52:52','2024-08-25 21:32:52'),('d40afdb7875cd64dfdc23d9a75f0656c57ef759d415f9b4afc5a9f86611d3649b444397d59207fa6',1,1,'authToken','[]',0,'2024-02-01 19:36:04','2024-02-01 19:36:04','2024-08-01 19:36:04'),('d43674d8af41c8fa6c059afaedde55a5d83cb3f64e061044eac48bd58bea86b7ad6180df74e352e2',245,1,'authToken','[]',0,'2024-02-01 20:43:05','2024-02-01 20:43:05','2024-08-01 20:43:05'),('d444d9eb1cb67ac92ae431c73a9c7fe88527ee9450524a9a66fa8e94b99ea2d668854a24f9825b53',1,1,'authToken','[]',0,'2024-02-01 19:38:22','2024-02-01 19:38:22','2024-08-01 19:38:22'),('d4493f8f04e48feeb940d99b7fcf5188d7c4108c3f903b50c4190235df233ef28b53fa294e19763e',335,1,'authToken','[]',1,'2024-02-09 20:56:14','2024-02-09 21:05:19','2024-08-09 20:56:14'),('d4feadfd7227a0aa3768b5ea0489617656428e69e97540d132ce2e7acdac523de84f6dd554301ceb',267,1,'authToken','[]',1,'2024-02-04 20:20:43','2024-02-04 20:21:20','2024-08-04 20:20:43'),('d5240b35463ece52314f493160640924522530ea7e3478e36e30bd490ecd6402f29d22ffac57c7d9',1,1,'authToken','[]',1,'2024-02-19 20:50:51','2024-02-19 20:53:18','2024-08-19 20:50:51'),('d5f663984c7d3a618b8a04f5d1671cd6d2d0df591bee2bae89263ed43571a7d82d7c8319e4a555b9',166,1,'authToken','[]',1,'2024-01-30 19:13:57','2024-01-30 19:16:56','2024-07-30 19:13:57'),('d6bc9aedd6998d289af3d1588ddbc0ac6c179a175859ecd90f2794b78b5bb27c8f27274797910927',2,1,'authToken','[]',1,'2024-01-29 21:11:51','2024-01-29 21:11:55','2024-07-29 21:11:51'),('d7d9746b760e2da60d3715c62e0a841861cd3bea9c42c3d264d0f6c57349c8501b059a8c57dd6423',362,1,'authToken','[]',1,'2024-02-22 19:46:02','2024-02-22 19:47:19','2024-08-22 19:46:02'),('d80a942487a03929ff6abc2dfcdc3520adbe8d6b55066d1d8d86e63b1a0813374f84d013a0a6a1f2',361,1,'authToken','[]',1,'2024-02-15 21:20:38','2024-02-18 21:09:10','2024-08-15 21:20:38'),('d823302001627540ea95c72d67dd96a73bfc11f8f170d4038eec7bb7d4e4d56947fb828c48b4f611',158,1,'authToken','[]',1,'2024-01-30 18:59:23','2024-01-30 18:59:28','2024-07-30 18:59:23'),('dce2ba9f1da27d5fbd5b76a74eccd5b3a28f004781647128cee4b368e89021b4b370c3140e1216fa',365,1,'authToken','[]',0,'2024-02-22 20:17:14','2024-02-22 20:17:14','2024-08-22 20:17:14'),('dd782caae05d50b2e7a783a491cd5a765f318276b751ebb86f08465681028620f418561c0579f704',286,1,'authToken','[]',1,'2024-02-05 21:31:07','2024-02-05 21:32:22','2024-08-05 21:31:07'),('df69ee127dd0bac5feb424df3f74aab8f6e9d3d194dc190eacedd525e34458a244761ad95162fe20',157,1,'authToken','[]',1,'2024-01-30 18:49:11','2024-01-30 18:49:38','2024-07-30 18:49:11'),('e15dfb1b1810bf34abcfa881bb9f2557634babdc89eaecfc674ae3a6781d09f82c12b4577565efb3',349,1,'authToken','[]',1,'2024-02-10 19:31:27','2024-02-10 20:20:13','2024-08-10 19:31:27'),('e1de503f5f363137ee603649d80f6a37566e4ce3916a1478251064d26202d3edc9eae635191cb0f2',247,1,'authToken','[]',1,'2024-02-01 20:53:22','2024-02-01 20:54:10','2024-08-01 20:53:22'),('e2dbcfb4acfc6ffd905e96da15dc7505ff87afc4b16761e4f4ffe95fc2972c8e99c19a367acf1f70',1,1,'authToken','[]',0,'2024-02-01 19:32:35','2024-02-01 19:32:35','2024-08-01 19:32:35'),('e307116edd32f3a44341c39135d46ba18c45139da9bb1aaacc2b7c2abc9f9705733a33ebe84feee7',288,1,'authToken','[]',1,'2024-02-05 21:37:24','2024-02-05 21:40:40','2024-08-05 21:37:24'),('e5f4eb340d3ab6b3150fca36167cf96ed54db6f90cbd3d5e76f8b5d4a37508f16850c90a88a6e753',300,1,'authToken','[]',1,'2024-02-08 17:34:58','2024-02-08 17:36:37','2024-08-08 17:34:58'),('e6b125f58711b6852f7949ea2402290813b1bd1bf79ce62c2217ad0ff1ea701794e52a823981938c',361,1,'authToken','[]',1,'2024-02-18 22:48:15','2024-02-18 22:50:13','2024-08-18 22:48:15'),('e79b804fe9375ab0520f3dae62b88466e90cd94937289fb57605da7f72504c320636328ae730533e',341,1,'authToken','[]',1,'2024-02-09 21:22:24','2024-02-09 21:28:52','2024-08-09 21:22:24'),('e9025d8a05c5546e0ac8830e06c0e7e0b21d67cbf3ecff2d376e057b94401b2276dd2d999919895f',165,1,'authToken','[]',1,'2024-01-30 19:03:00','2024-01-30 19:04:13','2024-07-30 19:03:00'),('e9ad1afd0e5ad18936b954b7a359e19b81eed842f1054ab60ddd5b8ae5aa550211965bf72c149d75',1,1,'authToken','[]',0,'2024-02-01 19:36:33','2024-02-01 19:36:33','2024-08-01 19:36:33'),('e9b08e1bd257b8adba207313946a238e9c7a0bfb3d992e1ba3c04638d4aab508642d95cd81bca72b',258,1,'authToken','[]',1,'2024-02-04 18:30:07','2024-02-04 18:30:42','2024-08-04 18:30:07'),('ed589db189355cdbb1d72c958f3ff1ec92fc150a6e2308a00b5279b02b299e62e6164b478891cb77',306,1,'authToken','[]',1,'2024-02-08 22:59:07','2024-02-08 23:06:39','2024-08-08 22:59:07'),('eea2b3c2346ca69e871ba095c19ae5d9df8303bf0177d3fee06d747f7f3dd12ca75d5991440eaed6',316,1,'authToken','[]',1,'2024-02-09 18:02:35','2024-02-09 18:03:16','2024-08-09 18:02:35'),('eec3835f18bc35a07c56e576aab157e24588777640326cdfcf4bb4dc54491c3ef58ac4ae2bc5d5d3',332,1,'authToken','[]',1,'2024-02-09 19:11:56','2024-02-09 20:18:40','2024-08-09 19:11:56'),('ef279345a658982fb50f1fbdc46453cde334bd42383e5286b8d0965cd1eb20642177beeb94dd124a',337,1,'authToken','[]',1,'2024-02-09 21:11:33','2024-02-09 21:14:40','2024-08-09 21:11:33'),('efd1ded5c69ffd181aa871ed67beeeac46ecbb3e37323e4190a6e75ad5a6e029a0866af89cc302c0',363,1,'authToken','[]',0,'2024-02-22 19:53:03','2024-02-22 19:53:03','2024-08-22 19:53:03'),('f2e6b78d0b204458ac9ddf9b7b4a592635497eb0c4a576e4338c51a67e1103127a4471e0641c2e1c',252,1,'authToken','[]',1,'2024-02-01 21:21:18','2024-02-01 21:23:34','2024-08-01 21:21:18'),('f32ba92ddce76d550cb309cf0138af7437275ede6ca376659576560e0603d2b399021fe2c8f2703c',152,1,'authToken','[]',1,'2024-01-28 19:40:59','2024-01-28 19:41:13','2024-07-28 19:40:59'),('f392f54e6e834d468322428a7b8c2268329c06e5f9326cefce9199aaff1577f9bb711e51095a1fe8',362,1,'authToken','[]',1,'2024-02-22 19:50:57','2024-02-22 19:51:12','2024-08-22 19:50:57'),('f43a883c9425beffc81663b7d8a822037cb3fddc4b643662d446d4b17b282a4f87df4a97dbfaa978',351,1,'authToken','[]',1,'2024-02-10 20:26:18','2024-02-10 20:28:55','2024-08-10 20:26:18'),('f4feec3e1fc329af2c9f393a2d4bb09455ab31425b181940b236988d147d508b5fbcd4c75bc15340',244,1,'authToken','[]',1,'2024-02-01 20:41:55','2024-02-01 20:42:40','2024-08-01 20:41:55'),('f514108e9a25ae123223ae8d941144034f5aa98bd1719e5a623ebe5eb473593b0fa1db82d17f7339',324,1,'authToken','[]',1,'2024-02-09 18:19:34','2024-02-09 18:23:26','2024-08-09 18:19:34'),('f55f85fd56fc803f6f0239a2f2cc88aab0fbeb07c532cfca033d2aa4783a0431418ea06348d2c722',336,1,'authToken','[]',1,'2024-02-09 21:06:59','2024-02-09 21:10:30','2024-08-09 21:06:59'),('f602d5743869503d087d42c6e0324b7a29d66d7646760d4ef11d10a7a773ef78df8581df3a10a6f2',301,1,'authToken','[]',1,'2024-02-08 17:37:25','2024-02-08 17:43:24','2024-08-08 17:37:25'),('f8c9b17c33e14da7593f4b785b06dce4d4437c17ecf72148c84828e643d9d9c36d117746e55607f4',354,1,'authToken','[]',1,'2024-02-10 20:50:06','2024-02-10 20:51:17','2024-08-10 20:50:06'),('fd6c31bddc018cb71343672871b6d691eb4e05019bdffa041d0dd7aa03d3b2c0dc565eaf6a60f9a0',1,1,'authToken','[]',1,'2024-01-29 22:30:00','2024-01-30 15:48:08','2024-07-29 22:30:00'),('fdd526a7d499e62a34fdaece0ec18291d664e10d278e48c3356ce91372e19ce53bd2c29f8c1d5e20',181,1,'authToken','[]',1,'2024-01-30 22:49:07','2024-01-30 22:49:10','2024-07-30 22:49:07'),('fe31ca4d6fb0381c6f1255d39ba878f5ac9b6bd8df434077f723ad1e3c25d799d5fe0efe5e27622d',365,1,'authToken','[]',1,'2024-02-25 22:19:13','2024-02-29 20:13:32','2024-08-25 22:19:13'),('fef904279cf241fc8353f312f2d7695e9d7eb35466484f3db2521a3b86acf8b8b789c98529fc05fd',1,1,'authToken','[]',0,'2024-02-01 19:36:14','2024-02-01 19:36:15','2024-08-01 19:36:14'),('ff9af3b9f25de245f91f5e12f3e2c09a5e80ad880e2004d9353ae7e3edbc4fdf558f4d6d3820aa11',2,1,'authToken','[]',1,'2024-01-28 19:41:27','2024-01-28 19:41:33','2024-07-28 19:41:27');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` bigint unsigned NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES (1,NULL,'Laravel Personal Access Client','5h7JajNST3AKg8qm2hpbi6TIzwB2fQIAtUTis8IG',NULL,'http://localhost',1,0,0,'2023-04-14 16:25:55','2023-04-14 16:25:55'),(2,NULL,'Laravel Password Grant Client','34uieNuG9nQ9tGoRn39ALSOXVYJihmMeREBHj23U','users','http://localhost',0,1,0,'2023-04-14 16:25:55','2023-04-14 16:25:55');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES (1,1,'2023-04-14 16:25:55','2023-04-14 16:25:55');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `order_id` int unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(84) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_order_item_orders1_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` (`id`, `quantity`, `price`, `product_id`, `order_id`, `title`, `image`) VALUES (124,5,31999.00,5,63,'',NULL),(125,5,346.00,7,63,'',NULL),(126,1,4670.00,6,63,'',NULL),(200,1,29900.00,5,92,'Телевизор Samsung QE55Q60BAUXUA','public/images/product/tv_2_001_1669918913.jpg'),(201,1,4670.00,6,92,'Мобильный телефон Nokia С21 Plus 3/32 Dark Cyan','public/images/product/phone_1_001_1669919687.jpg'),(202,1,346.00,7,92,'Зарядное устройство Promate Voltrip-Duo 17 Вт 2 USB','public/images/product/111_1669919880.jpg'),(203,2,8001.00,17,92,'Телевизор Toshiba 32WA2063DG','public/images/product/tv_3_001_1674490533.jpg');
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customerLastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customerEmail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customerPhone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customerAddress` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orders_users1_idx` (`user_id`),
  CONSTRAINT `fk_orders_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`id`, `customerName`, `customerLastName`, `customerEmail`, `customerPhone`, `customerAddress`, `comment`, `total`, `created_at`, `updated_at`, `user_id`) VALUES (63,'admin','ddd','admin@gmail.com','3456789','sss','qwerttt',166395.00,'2022-12-04 01:46:41','2022-12-04 01:46:41',1),(92,'Anton','Ivanchenko12345','tttolll12@meta.ua','+38-050-6800451',NULL,NULL,50918.00,'2024-03-07 21:01:23','2024-03-07 21:01:23',366);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (1,'show','web','2022-11-30 17:05:34','2022-11-30 17:05:34'),(2,'add','web','2022-11-30 17:05:34','2022-11-30 17:05:34'),(3,'edit','web','2022-11-30 17:05:34','2022-11-30 17:05:34'),(4,'delete','web','2022-11-30 17:05:34','2022-11-30 17:05:34');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  `barcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int NOT NULL,
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'https://via.placeholder.com/640x480',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `category_id` int unsigned NOT NULL,
  `manufactur_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_products_categories1_idx` (`category_id`),
  KEY `fk_products_manufacturs1_idx` (`manufactur_id`),
  CONSTRAINT `fk_products_categories1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  CONSTRAINT `fk_products_manufacturs1` FOREIGN KEY (`manufactur_id`) REFERENCES `manufacturs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `title`, `slug`, `description`, `image`, `price`, `barcode`, `stock`, `cover`, `created_at`, `updated_at`, `deleted_at`, `category_id`, `manufactur_id`) VALUES (5,'Телевизор Samsung QE55Q60BAUXUA','televizor-samsung-qe55q60bauxua','Миллиард оттенков цвета благодаря технологии квантовых точек\r\n100% цветовой объем благодаря технологии квантовых точек\r\nТехнология квантовых точек обеспечивает очень высокое качество изображения. Благодаря 100% объему цвета, технология квантовых точек преобразует свет в потрясающую цветовую палитру, качество цветопередачи при этом остается высоким при любом уровне яркости.\r\n\r\nОптимизированная подсветка для повышения контрастности\r\nТехнология двойной подсветки Dual LED\r\nИнновационная технология подсветки обеспечивает более четкую и точную контрастность за счет оптимизации цветового тона подсветки в соответствии с типом просматриваемого контента.\r\n\r\nБолее широкий диапазон контрастности\r\nТехнология Quantum HDR\r\nТехнология Quantum HDR позволяет выявить мельчайшие детали изображения и обеспечить оптимальную контрастность, чтобы вы получили максимальное удовольствие от просмотра каждой сцены. Технология динамического мэппинга HDR10+, характеристики которого превышают требования обычных стандартов, позволяет создавать более глубокие оттенки черного, более естественную цветопередачу и улучшенную детализацию.','public/images/product/tv_2_001_1669918913.jpg',29900.00,'1',125,'https://via.placeholder.com/640x480','2022-12-01 20:08:15','2022-12-01 20:22:15',NULL,2,1),(6,'Мобильный телефон Nokia С21 Plus 3/32 Dark Cyan','mobilnyi-telefon-nokia-s21-plus-332-dark-cyan','Экран (6.517\", IPS, 1600x720) / Unisoc SC9863A (1.6 ГГц + 1.2 ГГц) / двойная основная камера: 13 Мп + 2 Мп, фронтальная 5 Мп / RAM 3 ГБ / 32 ГБ встроенной памяти + microSD (до 256 ГБ) / 3G / LTE / GPS / поддержка 2х SIM-карт (Nano-SIM) / Android 11 / 4000 мА*ч','public/images/product/phone_1_001_1669919687.jpg',4670.00,'2',1001,'https://via.placeholder.com/640x480','2022-12-01 20:34:47','2022-12-01 20:34:47',NULL,1,2),(7,'Зарядное устройство Promate Voltrip-Duo 17 Вт 2 USB','zariadnoe-ustroistvo-promate-voltrip-duo-17-vt-2-usb','Voltrip-Duo – идеальное решение для тех, кто не использует Quick Charge, но хочет заряжать свой гаджет максимально быстро и эффективно в автомобиле.\r\n\r\nОсобенности:\r\n\r\n2 через 1: Заряжай 2 устройства одновременно на суммарной мощности до 17 Вт (5 В, 3.4 А).\r\nUSB 2.4A: Гарантирует максимальную скорость зарядки для устройств, не оборудованных технологией Quick Charge 3.0.\r\nТехнология адаптивной зарядки: Автоматически подберет оптимальный и безопасный уровень мощности, в зависимости от вашего устройства.\r\nБезопасность: Voltrip-Duo оснащен чипом Smart IC, который защищает от перегрева, скачков напряжения, короткого замыкания и чрезмерной зарядки вашего гаджета.\r\nНадёжная фиксация: В прикуривателях разных типов, благодаря пружинным фиксаторам на корпусе.\r\nЛаконичный дизайн: Компактный размер и корпус под карбон, устройство займет минимум места и с легкостью впишется в интерьер вашего авто.','public/images/product/111_1669919880.jpg',346.00,'3',23,'https://via.placeholder.com/640x480','2022-12-01 20:38:00','2022-12-01 23:10:52',NULL,3,3),(17,'Телевизор Toshiba 32WA2063DG','televizor-toshiba-32wa2063dg','Отличное изображение\r\nФормат поддерживаемый телевизором, подарит вам отличную детализацию и четкость картинки. Получите новые ощущения от просмотра ваших любимых телепередач и кинофильмов.\r\n\r\nHDMI\r\nСовременный мультемедийный интерфейс HDMI для передачи несжатого потока аудио и видео данных. По одному кабелю возможна передача несжатого цифрового видео и многоканального звука со скоростью намного выше, чем позволяли все предыдущие варианты подключения. Одиночный кабель значительно упрощает процесс установки домашних развлекательных систем и гарантирует наилучшее качество изображения и воспроизведения звука.','public/images/product/tv_3_001_1674490533.jpg',8001.00,'123',1234,'https://via.placeholder.com/640x480','2023-01-23 17:36:08','2023-01-23 20:04:06',NULL,2,4),(18,'Зарядное устройство Grand-X CH-15B','zariadnoe-ustroistvo-grand-x-ch-15b','Зарядное устройство Grand-X 5V 2.1A USB Black (CH-15) с защитой от перегрузки\r\n\r\nXарактеристики:\r\n\r\nВходное напряжение: 220 В\r\nВыходное напряжение: 5 В\r\nВыходной ток: 2.1A\r\nРазмер: 85 х 35 х 22 мм\r\nВес: 35 г','public/images/product/zu_1_001_1674501865.jpg',135.00,'14',11,'https://via.placeholder.com/640x480','2023-01-23 20:29:32','2023-01-23 21:24:25',NULL,3,1),(19,'Телевизор Philips 32PFS6805/12','televizor-philips-32pfs680512','Philips предлагает качественное изображение в совокупности с такими преимуществами как насыщенность цвета, яркость и четкость. Благодаря отличной картинке ваши любимые телепрограммы и фильмы предстанут перед в совершенно новом свете. Все это заключено в элегантный тонкий корпус. Сядьте поудобнее, расслабьтесь и смотрите телевизор с наилучшим качеством изображения.','public/images/product/tv_4_001_1674503986.jpg',8999.00,'16',17,'https://via.placeholder.com/640x480','2023-01-23 21:26:56','2023-01-23 21:59:46',NULL,2,5),(20,'Мобильный телефон Nokia G10 3/32GB','mobilnyi-telefon-nokia-g10-332gb','Экран (6.5\", IPS 1600x720) / MediaTek Helio G25 (2.0 ГГц) / тройная основная камера: 13 Мп + 2 Мп + 2 Мп, фронтальная 8 Мп / RAM 3 ГБ / 32 ГБ встроенной памяти + microSD (до 512 ГБ) / 3G / LTE / GPS / поддержка 2х SIM-карт (Nano-SIM) / Android 11 / 5050 мА*ч','public/images/product/phone_2_001_1674504243.jpg',4499.00,'1',12,'https://via.placeholder.com/640x480','2023-01-23 22:04:03','2023-01-23 22:04:03',NULL,1,2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reviews_users1_idx` (`user_id`),
  CONSTRAINT `fk_reviews_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` (`id`, `name`, `subject`, `review`, `email`, `created_at`, `updated_at`, `avatar`, `product_id`, `status`, `user_id`) VALUES (29,'admin','team','All right!!','admin@gmail.com','2022-12-01 20:31:49','2022-12-01 20:31:49',NULL,5,4,1),(30,'admin','sdfdf','asdfsdf','admin@gmail.com','2022-12-04 00:35:02','2022-12-04 00:35:02',NULL,5,NULL,1),(31,'admin','issue','How it\'s work?','admin@gmail.com','2022-12-04 00:35:37','2022-12-04 00:35:37',NULL,5,5,1),(32,'admin','tema','heelloo!!','admin@gmail.com','2022-12-04 00:56:29','2022-12-04 00:56:29',NULL,7,3,1),(33,'tttolll','news','Hello . All rigth!','tttolll@rambler.ru','2022-12-21 19:03:05','2022-12-21 19:03:05',NULL,6,NULL,2),(34,'tttolll','news','Hello . All rigth!','tttolll@rambler.ru','2022-12-21 19:03:15','2022-12-21 19:03:15',NULL,6,3,2),(35,'tttolll','news','dddddddd','tttolll@rambler.ru','2022-12-21 22:19:09','2022-12-21 22:19:09',NULL,5,3,2),(36,'admin','tema','Query!!!!','admin@gmail.com','2023-01-04 20:31:29','2023-01-04 20:31:29',NULL,5,4,1),(37,'admin','qwer','viva','admin@gmail.com','2023-01-27 12:00:36','2023-01-27 12:00:36',NULL,5,4,1);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES (1,1),(2,1),(3,1),(4,1),(1,2),(2,2),(3,2),(1,3),(2,3);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES (1,'admin','web','2022-11-30 15:52:37','2022-11-30 15:52:37'),(2,'manager','web','2022-11-30 15:53:53','2022-11-30 15:53:53'),(3,'user','web','2022-11-30 15:54:01','2022-11-30 15:54:01');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` smallint NOT NULL DEFAULT '9',
  `verify_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `secondname` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_verify_token_unique` (`verify_token`)
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `avatar`, `provider`, `provider_id`, `access_token`, `remember_token`, `status`, `verify_token`, `created_at`, `updated_at`, `phone`, `address`, `lastname`, `secondname`, `birthday`) VALUES (1,'admin','tttolll12345@gmail.com','2024-01-29 22:29:13','$2y$10$HkF8lerKcuI43dceyIcGjO2..sSJlSg/tkw/nhLYjXEolmsAlyDrK','public/avatar/guest.jpg','google','114713337860853773592','ya29.a0AfB_byBBAuL8Euff1bC5eGAmsmkVUoJpa4rAjd64e3hTnz-mCa9YYi4ZhGy4FXD_Lte4gXOZTz0Z4B_-3PIFa0eRLNbuifefKUOvWI83lX88QdHiKqHFMlTfLPIKae9IuSr2B2QKxGHnB8McTusi__Mx5xLPzDbzERQaCgYKAaMSARISFQHGX2MiX6yuUOyPIxFze--m6p0Esw0170','3xtmXHugaBVmrrknKJABsbBmcaHD9DXh3A3QfFfdZ5VPXWT18Dy9x0yEyjbn',1,NULL,'2022-11-30 17:31:32','2024-01-30 19:11:09','null',NULL,NULL,NULL,NULL),(2,'tttolll','bora17071980@ukr.net','2022-11-30 21:00:58','$2y$10$hCS1R2i4J7ktSi.iPiZMq.PZjB27gBMa3GP1F/tzYWTFoZ6caJq5u','public/avatar/yMzZlVv3dUiqczoebTCIysULmWvCsj4FeW5UzrTU_1670535191.jpg',NULL,NULL,NULL,'0jcROGc39p243svPbR4l9kTpbw3VRe1UyFScXRJTeWi7jqlpiWQBOeF9Pz7T',1,NULL,'2022-11-30 17:38:00','2022-12-08 23:33:11','null',NULL,NULL,NULL,NULL),(3,'Vladik','vladik@vladik.com','2022-11-30 21:01:00','$2y$10$Ra1BhqPiKtEDDwTaKrpUtebzf2sAFX/nRpNNUc5bpBeF23cNA.tie','public/avatar/mZT09nHOsTjatXK4FnPhlleEgNudXHvGv06ikOMW_1670535210.jpg',NULL,NULL,NULL,'fYht1JgWrSjTa9APIAgzQbvymGvSqs10sZ1VE6p8Hg6znbb8OWJv2ukFyLOw',1,NULL,'2022-11-30 17:40:18','2022-12-08 23:33:30','null',NULL,NULL,NULL,NULL),(366,'Anton','tttolll12@meta.ua','2024-03-02 22:05:14','$2y$10$VakiYYUNIQIoT/zOAfMTtOil3i2Fm97wdcUkGVYOL/JMDnfm9jsHW','public/avatar/galina_1709670770.jpg',NULL,NULL,NULL,NULL,1,NULL,'2024-03-02 22:05:02','2024-03-05 20:32:50','+38-050-6800451',NULL,'Ivanchenko12345','qwerr','1970-10-20');
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

-- Dump completed on 2024-03-07 23:07:51
