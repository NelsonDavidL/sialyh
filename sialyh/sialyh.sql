-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: sialyh
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `idCard` int unsigned NOT NULL,
  `date` date NOT NULL,
  `signature` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `subtotal` int NOT NULL,
  `total` int NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `authorization` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  `user_approved_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `applications_user_id_ccbebfe7_fk_auth_user_id` (`user_id`),
  KEY `applications_user_approved_id_203cf8f4_fk_auth_user_id` (`user_approved_id`),
  CONSTRAINT `applications_user_approved_id_203cf8f4_fk_auth_user_id` FOREIGN KEY (`user_approved_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `applications_user_id_ccbebfe7_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `applications_chk_1` CHECK ((`idCard` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (3,'Admon'),(2,'Facturacion'),(1,'Tiendas');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,24),(2,1,57),(3,1,58),(4,1,59),(5,1,60),(6,1,61),(20,1,79),(19,1,80),(11,2,24),(10,2,28),(12,2,57),(13,2,58),(14,2,59),(15,2,60),(16,2,61),(17,2,62),(18,2,63),(7,2,64),(8,2,65),(9,2,66);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add user',3,'add_user'),(10,'Can change user',3,'change_user'),(11,'Can delete user',3,'delete_user'),(12,'Can view user',3,'view_user'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add modules',5,'add_modules'),(18,'Can change modules',5,'change_modules'),(19,'Can delete modules',5,'delete_modules'),(20,'Can view modules',5,'view_modules'),(21,'Can add incomes',6,'add_incomes'),(22,'Can change incomes',6,'change_incomes'),(23,'Can delete incomes',6,'delete_incomes'),(24,'Can view incomes',6,'view_incomes'),(25,'Can add listings',7,'add_listings'),(26,'Can change listings',7,'change_listings'),(27,'Can delete listings',7,'delete_listings'),(28,'Can view listings',7,'view_listings'),(29,'Can add man invoice',8,'add_manInvoice'),(30,'Can change man invoice',8,'change_manInvoice'),(31,'Can delete man invoice',8,'delete_manInvoice'),(32,'Can view man invoice',8,'view_manInvoice'),(33,'Can add tem pay payment',9,'add_temPayPayment'),(34,'Can change tem pay payment',9,'change_temPayPayment'),(35,'Can delete tem pay payment',9,'delete_temPayPayment'),(36,'Can view tem pay payment',9,'view_temPayPayment'),(37,'Can add sep bonuses',10,'add_sepBonuses'),(38,'Can change sep bonuses',10,'change_sepBonuses'),(39,'Can delete sep bonuses',10,'delete_sepBonuses'),(40,'Can view sep bonuses',10,'view_sepBonuses'),(41,'Can add pay discounts',11,'add_payDiscounts'),(42,'Can change pay discounts',11,'change_payDiscounts'),(43,'Can delete pay discounts',11,'delete_payDiscounts'),(44,'Can view pay discounts',11,'view_payDiscounts'),(45,'Can add data management',12,'add_dataManagement'),(46,'Can change data management',12,'change_dataManagement'),(47,'Can delete data management',12,'delete_dataManagement'),(48,'Can view data management',12,'view_dataManagement'),(49,'Can add log entry',13,'add_logentry'),(50,'Can change log entry',13,'change_logentry'),(51,'Can delete log entry',13,'delete_logentry'),(52,'Can view log entry',13,'view_logentry'),(53,'Can add session',14,'add_session'),(54,'Can change session',14,'change_session'),(55,'Can delete session',14,'delete_session'),(56,'Can view session',14,'view_session'),(57,'ingresos_manejodedatos',6,'view_dataManagement'),(58,'ingresos_facturasmanuales',6,'view_manInvoices'),(59,'ingresos_bonoseparado',6,'view_sepBonuses'),(60,'ingresos_descuentonomina',6,'view_paydiscount'),(61,'ingresos_pagosnomina',6,'view_paypayroll'),(62,'listados_facturasmanuales',7,'view_listinvoices'),(63,'listados_descuentonomina',7,'view_listpaydiscount'),(64,'listados_pagosnomina',7,'view_listpaypayroll'),(65,'listados_bonoseparado',7,'view_listsepBonuses'),(66,'listados_manejodatos',7,'view_listdataManagement'),(67,'Can add petty_cash',15,'add_petty_cash'),(68,'Can change petty_cash',15,'change_petty_cash'),(69,'Can delete petty_cash',15,'delete_petty_cash'),(70,'Can view petty_cash',15,'view_petty_cash'),(71,'Can add det applications',16,'add_detapplications'),(72,'Can change det applications',16,'change_detapplications'),(73,'Can delete det applications',16,'delete_detapplications'),(74,'Can view det applications',16,'view_detapplications'),(75,'Can add applications',17,'add_applications'),(76,'Can change applications',17,'change_applications'),(77,'Can delete applications',17,'delete_applications'),(78,'Can view applications',17,'view_applications'),(79,'solicitudes',17,'view_solicitudes'),(80,'consultation',17,'view_consultation'),(81,'aprobaciones',17,'view_approvals');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$9MowxsGBKjiRqFEpNQ1k6y$hHf3K9ssxlcEhoJd3AZ/ILU8fw8y+oWMD1bwJ/PoYf8=','2024-04-29 04:25:47.901950',1,'admin','','','nelson875413@gmail.com',1,1,'2024-04-12 19:10:47.319015'),(2,'pbkdf2_sha256$260000$j8KO5jVECfFWRzhTbvI4xa$G+JOqHYRqEhqDDo8cLB+W34excyLmODPH/MLJw2M7JM=','2024-04-12 19:57:28.576729',0,'S03','S 03 ECOMMERCE','ECOMMERCE','almacenlyh03@gmail.com',0,1,'2024-04-12 19:33:46.000000'),(3,'pbkdf2_sha256$260000$lTW35SVxpYzhuXzuPGCOYb$YOKBOdX4eV7YzT51MHSi0tvyGktehwkNlgIiOJDv8wU=','2024-04-29 04:26:18.143502',0,'S04','S 04 KENNEDY PEQUEÑO','KENNEDYPEQUEÑO','almacenlyh04@gmail.com',0,1,'2024-04-12 19:33:57.000000'),(4,'pbkdf2_sha256$260000$AS5nayciSCHh9xo0iYt7Dc$lvGlVpj2tlYBtRvhv2uonhI9C/IWa3VMfJh4i6Y2i2U=',NULL,0,'S05','S 05 C.C. CENTRO MAYOR','CENTROMAYOR','almacenlyh05@gmail.com',0,1,'2024-04-12 19:34:09.000000'),(5,'pbkdf2_sha256$260000$Y7lFzAi5UCKBgK3k21ufNU$UhwcmUG6jTr4gVSh7rxSBRkZpOjMz72dx5+d0UGGEeE=',NULL,0,'S06','S 06 VILLA DEL RIO','VILLADELRIO','almacenlyh06@gmail.com',0,1,'2024-04-12 19:34:20.000000'),(6,'pbkdf2_sha256$260000$MYb9Si8oTKZ5fHRPiMfveG$kqsWOqoNCDqddax4hGSWm0nPdn+fXycu7ugRZ/YcVw4=',NULL,0,'S07','S 07 BARRANQUILLA PRADO','BARRANQUILLA','almacenlyh07@gmail.com',0,1,'2024-04-12 19:34:29.000000'),(7,'pbkdf2_sha256$260000$qUV3ByTwPy4FxG06ND4JQ4$VEbI2vCeuIz8yxwfmV94/8+eQxVP25Z6yKAEnKUbjeo=',NULL,0,'S08','S 08 SAN PEDRO PLAZA NEIVA','SANPEDRO','almacenlyh08@gmail.com',0,1,'2024-04-12 19:34:37.000000'),(8,'pbkdf2_sha256$260000$vw8Xd9weKWzGP6UJDjjX8E$Ylelth3TuDXQjxH0nTL11y9ZICQbv0ohXdgeABcIJYc=',NULL,0,'S10','S 10 IBAGUE','IBAGUES10','almacenlyh10@gmail.com',0,1,'2024-04-12 19:34:44.000000'),(9,'pbkdf2_sha256$260000$ZutCfSvEDvlXfjYQjW3cyK$Kr5qo8qZ/iiMJ6BExoPi1KxxNynzlXuz9W75uNGSiYk=',NULL,0,'S12','S 12 CEDRITOS MISTER','CEDRITOS','almacenlyh12@gmail.com',0,1,'2024-04-12 19:34:52.000000'),(10,'pbkdf2_sha256$260000$yuGEOOP5dhFW2AEAQbFrvs$vvwbx2Dzi6raX2JdYxwIoB4b1yXA2rR4/lTwzL+JqOc=',NULL,0,'S13','S 13 CUCUTA VENTURA PLAZA','VENTURAS13','almacenlyh13@gmail.com',0,1,'2024-04-12 19:35:01.000000'),(11,'pbkdf2_sha256$260000$a1qK1fDgR3cUHIaUSb8iT5$EyZa0vG1ZrJk3p3CdHjUbzzZZyTjYGn/UV3OdjTne64=',NULL,0,'S14','S 14 C.C. GALERIAS','GALERIASS14','almacenlyh14@gmail.com',0,1,'2024-04-12 19:35:07.000000'),(12,'pbkdf2_sha256$260000$3pH7SgwgT5tVJ6W7DGtHGh$3rFkYird4DXD798tvVL/CZh3T5pUxWkB4Xgvi1kQpMM=',NULL,0,'S15','S 15 LA 17 CENTRO','CENTROS15','almacenlyh15@gmail.com',0,1,'2024-04-12 19:35:14.000000'),(13,'pbkdf2_sha256$260000$z5785MnLVtMJhFBYnHopBo$ERfECS3UIRAbhXAXqdDAjXHHb/jvz9Pn81rUGrVyy3Q=',NULL,0,'S16','S 16 BUC/MANGA MEGA MALL','MEGAMALLS16','almacenlyh16@gmail.com',0,1,'2024-04-12 19:35:21.000000'),(14,'pbkdf2_sha256$260000$VwzGreXO3iWnLnzuTHM8Vs$BQUJ2ae+mJTjWDoB5gm4DEru3LSv00/QjUj+G2IrEZM=',NULL,0,'S18','S 18 BARRANCABERMEJA','BARRANCABERMEJA','almacenlyh18@gmail.com',0,1,'2024-04-12 19:35:27.000000'),(15,'pbkdf2_sha256$260000$FhinK5SpxQ2AwNkcxq8rlY$gxxTiQQnSbCbjvbjU2QwyYXZmyqtsKbvTN7GTjmwbcY=',NULL,0,'S19','S 19 C.C. HAYUELOS','HAYUELOS','almacenlyh19@gmail.com',0,1,'2024-04-12 19:35:35.000000'),(16,'pbkdf2_sha256$260000$y9eYNouFsf5zTEauLZ0QOQ$slmxwBiQGXkAe63y8ZSFOW+Jg9+tBFKEgAhaYkAfgQE=',NULL,0,'S20','S 20 CARIBE PLAZA','CARIBES20','almacenlyh20@gmail.com',0,1,'2024-04-12 19:35:42.000000'),(17,'pbkdf2_sha256$260000$D7jiQUKXqBJVnHuZ5thj8X$1l7ZEFXblhGrdljt5a25XCb6Rbj+OVMF4esIfFZUw4k=',NULL,0,'S22','S 22 VALLEDUPAR GUATAPURI','GUATAPURI','almacenlyh22@gmail.com',0,1,'2024-04-12 19:35:48.000000'),(18,'pbkdf2_sha256$260000$boaIg506S5tHH71Yy4iojR$3tPq9+GAHwZoMk9nWkHvXEv17ySskF4LTxL0yDMrUMc=',NULL,0,'S23','S 23 BULEVAR 1 PISO','BULEVAR1','almacenlyh23@gmail.com',0,1,'2024-04-12 19:35:56.000000'),(19,'pbkdf2_sha256$260000$aFPakLZ2a7bWUlvU7Czgjy$4UebCBiKgVod8detMnRfnyayJLj7+WAMrWAmIl8fZz0=',NULL,0,'S26','S 26 QUIRIGUA','QUIRIGUA','almacenlyh26@gmail.com',0,1,'2024-04-12 19:36:02.000000'),(20,'pbkdf2_sha256$260000$SZLWRf3gvbQ9UosXxs2KJ4$pvT+Yh3LVuv02b650XPwjOKMaABdmM2eK/oAl9wN+ao=',NULL,0,'S30','S 30 RESTREPO GATAS','RESTREPOGATAS','almacenlyh30@gmail.com',0,1,'2024-04-12 19:36:09.000000'),(21,'pbkdf2_sha256$260000$7NxmKAznfwetaDcUgRszB1$gcPA8AAbiGHNlFkuHkT6J44r+fz8NdH17scx4POKv8g=','2024-04-12 19:57:13.360261',0,'S31','S 31 FONTIBON','FONTIBON','almacenlyh31@gmail.com',0,1,'2024-04-12 19:36:15.000000'),(22,'pbkdf2_sha256$260000$Aau9lzSqo3lg4Y1jkdIjbt$ZNnW8f2+kIWcN/btFNw7y3bKhWMVmqVy7sdxVajC7Oo=',NULL,0,'S32','S 32 C.C. TUNAL VIEJO','TUNALVIEJO','almacenlyh32@gmail.com',0,1,'2024-04-12 19:36:22.000000'),(23,'pbkdf2_sha256$260000$ZuFYHO0m99199IwK7ouyNo$+03NatsOkPtak9Xbh9AGPTRNQbEULbpud5r0r0G7JCc=',NULL,0,'S34','S 34 DE LA 57','DELA57S34','almacenlyh34@gmail.com',0,1,'2024-04-12 19:36:28.000000'),(24,'pbkdf2_sha256$260000$wzK4Fiw0tWQQ23JFvVNiwn$4Rm5gKL32jbbQ7Da8C5aU1w+6MSdZ7xIRk81IzMPCM4=',NULL,0,'S37','S 37 P. AMERICAS GRANDE','PAMERICAS','almacenlyh37@gmail.com',0,1,'2024-04-12 19:36:35.000000'),(25,'pbkdf2_sha256$260000$ude7S9lHJaInMxhJr0HSnV$mGS7xdLX0SkDFOXBMh2YYOyKEaPklOtZuTgHlexxNCo=',NULL,0,'S38','S 38 CEDRITOS VIEJO','CEDRITOSVIEJO','almacenlyh38@gmail.com',0,1,'2024-04-12 19:36:43.000000'),(26,'pbkdf2_sha256$260000$S2tOKCUGoODvR0SlnRaFXf$saDJjk41bipIJStLGYyRLweHIidsSZVO5Rw1R1OXZYs=',NULL,0,'S40','S 40 KENNEDY GRANDE','KENNEDYGRANDE','almacenlyh40@gmail.com',0,1,'2024-04-12 19:36:51.000000'),(27,'pbkdf2_sha256$260000$uKEA4da4YI31t0PaYOA4ed$7F5JlkwBf1WiryNtM8GtVmknjJQSTiqtlzTkI9AYpbY=',NULL,0,'S43','S 43 RESTREPO OUTLET','RESTREPOOUTLET','almacenlyh43@gmail.com',0,1,'2024-04-12 19:36:57.000000'),(28,'pbkdf2_sha256$260000$Y9DkWvqSg2glpqd2MvYq6n$YJcW4YImj0u2w1/dQr+ZxAfhuHKyb6siEej1bfqQyKQ=',NULL,0,'S47','S 47 UNISUR FEMENINO','UNISURS47','almacenlyh47@gmail.com',0,1,'2024-04-12 19:37:04.000000'),(29,'pbkdf2_sha256$260000$7G864oIlCASMo6UFoFlFb5$WknP6wSA0Pb9dlZ3C/FfgNqwdRSelmO9YiG8VFnHXCk=',NULL,0,'S48','S 48 C.C. SUBA','CCSUBAS48','almacenlyh48@gmail.com',0,1,'2024-04-12 19:37:14.000000'),(30,'pbkdf2_sha256$260000$zlytnw09ajQdsReYwo15iw$fPBhN/9ou4qvOUpmuXz3YVmdy93ZeRt/qOEOp8ZMAvE=',NULL,0,'S50','S 50 C.C. GRANAHORRAR','GRANAHORRAR','almacenlyh50@gmail.com',0,1,'2024-04-12 19:37:20.000000'),(31,'pbkdf2_sha256$260000$4VF8hI9DrRVdvhzhBrV0Wz$m+/Cldjo0zpXwXer+R3olOI37aV9GbcYciRO4oSRnGI=',NULL,0,'S51','S 51 BUCARAMANGA','BUCARAMANGA','almacenlyh51@gmail.com',0,1,'2024-04-12 19:37:30.000000'),(32,'pbkdf2_sha256$260000$rnKGeCNV3BhjvkG4jZIar2$uYZdcdpXBumFeMkzc4xRVTmcw3mmfrOHpks7E5gs6dg=',NULL,0,'S52','S 52 C.C. BULEVAR 2 PISO','BULEVAR2','almacenlyh52@gmail.com',0,1,'2024-04-12 19:37:37.000000'),(33,'pbkdf2_sha256$260000$ZZSnpbrsSf9fxesWiADunW$kP3ngDXpXMBnwlOlAcdl37Jf2eVoDDdvQNqHhqcK6Ow=',NULL,0,'S55','S 55 UNICENTRO','UNICENTRO','almacenlyh55@gmail.com',0,1,'2024-04-12 19:37:46.000000'),(34,'pbkdf2_sha256$260000$Piqd8ck83Yf1Xs9rFtNHmg$/vtOd0YduSocSaREIjXXi8nyDWjHmi6cfIwf0eblkAs=',NULL,0,'S56','S 56 C.C. CENTRO CHIA GRANDE','CENTROCHIA','almacenlyh56@gmail.com',0,1,'2024-04-12 19:37:52.000000'),(35,'pbkdf2_sha256$260000$X5Xx44EXahf83GoFKnyGDu$dR+Dxw777/j0fN4U1kIJMfDKlbg+Fj53T5yj74WQxh8=',NULL,0,'S57','S 57 C.C. SALITRE NUEVO','SALITRENUEVO','almacenlyh57@gmail.com',0,1,'2024-04-12 19:38:00.000000'),(36,'pbkdf2_sha256$260000$sB0dXLGEADNDhJaIWa3lQv$+un091t+C//SE39326o1vhZCZb3OSOVaPdzJbXK71Tw=',NULL,0,'S61','S 61 C.C.SAN DIEGO','SANDIEGOS61','almacenlyh61@gmail.com',0,1,'2024-04-12 19:38:05.000000'),(37,'pbkdf2_sha256$260000$7kJvXyVcJZ0zGLdUuT90yl$mWfMPxJnbnWLAmdabj1WvicgRex2b1E3MfZLNycjprY=',NULL,0,'S62','S 62 C.C. BOCAGRANDE CARTAGENA','BOCAGRANDE','almacenlyh62@gmail.com',0,1,'2024-04-12 19:38:14.000000'),(38,'pbkdf2_sha256$260000$HNPJgt92ioqCMMGjH4zCn3$Wp3z5hBwNTpfE2gaA1t96TrgRopt7uW4gQkjzBXYOjg=',NULL,0,'S63','S 63 MULTICENTRO CARTAGENA','MULTICENTRO','almacenlyh63@gmail.com',0,1,'2024-04-12 19:38:22.000000'),(39,'pbkdf2_sha256$260000$g0QdQ8PgLQXWQUyLNqQjp1$0CjdFvaMXS1n9zLd+G3BiNFhMF8TLSXJFXhfdgMc3TM=','2024-04-16 20:42:17.230205',0,'FAC01','FACTURACION','FACTURACION','pruebalyhsistemas@outlook.es',0,1,'2024-04-12 19:38:33.000000');
=======
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$260000$9MowxsGBKjiRqFEpNQ1k6y$hHf3K9ssxlcEhoJd3AZ/ILU8fw8y+oWMD1bwJ/PoYf8=','2024-04-12 19:11:10.187748',1,'admin','','','nelson875413@gmail.com',1,1,'2024-04-12 19:10:47.319015'),(2,'pbkdf2_sha256$260000$j8KO5jVECfFWRzhTbvI4xa$G+JOqHYRqEhqDDo8cLB+W34excyLmODPH/MLJw2M7JM=','2024-04-12 19:57:28.576729',0,'S03','S 03 ECOMMERCE','ECOMMERCE','almacenlyh03@gmail.com',0,1,'2024-04-12 19:33:46.000000'),(3,'pbkdf2_sha256$260000$lTW35SVxpYzhuXzuPGCOYb$YOKBOdX4eV7YzT51MHSi0tvyGktehwkNlgIiOJDv8wU=',NULL,0,'S04','S 04 KENNEDY PEQUEÑO','KENNEDYPEQUEÑO','almacenlyh04@gmail.com',0,1,'2024-04-12 19:33:57.000000'),(4,'pbkdf2_sha256$260000$AS5nayciSCHh9xo0iYt7Dc$lvGlVpj2tlYBtRvhv2uonhI9C/IWa3VMfJh4i6Y2i2U=',NULL,0,'S05','S 05 C.C. CENTRO MAYOR','CENTROMAYOR','almacenlyh05@gmail.com',0,1,'2024-04-12 19:34:09.000000'),(5,'pbkdf2_sha256$260000$Y7lFzAi5UCKBgK3k21ufNU$UhwcmUG6jTr4gVSh7rxSBRkZpOjMz72dx5+d0UGGEeE=',NULL,0,'S06','S 06 VILLA DEL RIO','VILLADELRIO','almacenlyh06@gmail.com',0,1,'2024-04-12 19:34:20.000000'),(6,'pbkdf2_sha256$260000$MYb9Si8oTKZ5fHRPiMfveG$kqsWOqoNCDqddax4hGSWm0nPdn+fXycu7ugRZ/YcVw4=',NULL,0,'S07','S 07 BARRANQUILLA PRADO','BARRANQUILLA','almacenlyh07@gmail.com',0,1,'2024-04-12 19:34:29.000000'),(7,'pbkdf2_sha256$260000$qUV3ByTwPy4FxG06ND4JQ4$VEbI2vCeuIz8yxwfmV94/8+eQxVP25Z6yKAEnKUbjeo=',NULL,0,'S08','S 08 SAN PEDRO PLAZA NEIVA','SANPEDRO','almacenlyh08@gmail.com',0,1,'2024-04-12 19:34:37.000000'),(8,'pbkdf2_sha256$260000$vw8Xd9weKWzGP6UJDjjX8E$Ylelth3TuDXQjxH0nTL11y9ZICQbv0ohXdgeABcIJYc=',NULL,0,'S10','S 10 IBAGUE','IBAGUES10','almacenlyh10@gmail.com',0,1,'2024-04-12 19:34:44.000000'),(9,'pbkdf2_sha256$260000$ZutCfSvEDvlXfjYQjW3cyK$Kr5qo8qZ/iiMJ6BExoPi1KxxNynzlXuz9W75uNGSiYk=',NULL,0,'S12','S 12 CEDRITOS MISTER','CEDRITOS','almacenlyh12@gmail.com',0,1,'2024-04-12 19:34:52.000000'),(10,'pbkdf2_sha256$260000$yuGEOOP5dhFW2AEAQbFrvs$vvwbx2Dzi6raX2JdYxwIoB4b1yXA2rR4/lTwzL+JqOc=',NULL,0,'S13','S 13 CUCUTA VENTURA PLAZA','VENTURAS13','almacenlyh13@gmail.com',0,1,'2024-04-12 19:35:01.000000'),(11,'pbkdf2_sha256$260000$a1qK1fDgR3cUHIaUSb8iT5$EyZa0vG1ZrJk3p3CdHjUbzzZZyTjYGn/UV3OdjTne64=',NULL,0,'S14','S 14 C.C. GALERIAS','GALERIASS14','almacenlyh14@gmail.com',0,1,'2024-04-12 19:35:07.000000'),(12,'pbkdf2_sha256$260000$3pH7SgwgT5tVJ6W7DGtHGh$3rFkYird4DXD798tvVL/CZh3T5pUxWkB4Xgvi1kQpMM=',NULL,0,'S15','S 15 LA 17 CENTRO','CENTROS15','almacenlyh15@gmail.com',0,1,'2024-04-12 19:35:14.000000'),(13,'pbkdf2_sha256$260000$z5785MnLVtMJhFBYnHopBo$ERfECS3UIRAbhXAXqdDAjXHHb/jvz9Pn81rUGrVyy3Q=',NULL,0,'S16','S 16 BUC/MANGA MEGA MALL','MEGAMALLS16','almacenlyh16@gmail.com',0,1,'2024-04-12 19:35:21.000000'),(14,'pbkdf2_sha256$260000$VwzGreXO3iWnLnzuTHM8Vs$BQUJ2ae+mJTjWDoB5gm4DEru3LSv00/QjUj+G2IrEZM=',NULL,0,'S18','S 18 BARRANCABERMEJA','BARRANCABERMEJA','almacenlyh18@gmail.com',0,1,'2024-04-12 19:35:27.000000'),(15,'pbkdf2_sha256$260000$FhinK5SpxQ2AwNkcxq8rlY$gxxTiQQnSbCbjvbjU2QwyYXZmyqtsKbvTN7GTjmwbcY=',NULL,0,'S19','S 19 C.C. HAYUELOS','HAYUELOS','almacenlyh19@gmail.com',0,1,'2024-04-12 19:35:35.000000'),(16,'pbkdf2_sha256$260000$y9eYNouFsf5zTEauLZ0QOQ$slmxwBiQGXkAe63y8ZSFOW+Jg9+tBFKEgAhaYkAfgQE=',NULL,0,'S20','S 20 CARIBE PLAZA','CARIBES20','almacenlyh20@gmail.com',0,1,'2024-04-12 19:35:42.000000'),(17,'pbkdf2_sha256$260000$D7jiQUKXqBJVnHuZ5thj8X$1l7ZEFXblhGrdljt5a25XCb6Rbj+OVMF4esIfFZUw4k=',NULL,0,'S22','S 22 VALLEDUPAR GUATAPURI','GUATAPURI','almacenlyh22@gmail.com',0,1,'2024-04-12 19:35:48.000000'),(18,'pbkdf2_sha256$260000$boaIg506S5tHH71Yy4iojR$3tPq9+GAHwZoMk9nWkHvXEv17ySskF4LTxL0yDMrUMc=',NULL,0,'S23','S 23 BULEVAR 1 PISO','BULEVAR1','almacenlyh23@gmail.com',0,1,'2024-04-12 19:35:56.000000'),(19,'pbkdf2_sha256$260000$aFPakLZ2a7bWUlvU7Czgjy$4UebCBiKgVod8detMnRfnyayJLj7+WAMrWAmIl8fZz0=',NULL,0,'S26','S 26 QUIRIGUA','QUIRIGUA','almacenlyh26@gmail.com',0,1,'2024-04-12 19:36:02.000000'),(20,'pbkdf2_sha256$260000$SZLWRf3gvbQ9UosXxs2KJ4$pvT+Yh3LVuv02b650XPwjOKMaABdmM2eK/oAl9wN+ao=',NULL,0,'S30','S 30 RESTREPO GATAS','RESTREPOGATAS','almacenlyh30@gmail.com',0,1,'2024-04-12 19:36:09.000000'),(21,'pbkdf2_sha256$260000$7NxmKAznfwetaDcUgRszB1$gcPA8AAbiGHNlFkuHkT6J44r+fz8NdH17scx4POKv8g=','2024-04-12 19:57:13.360261',0,'S31','S 31 FONTIBON','FONTIBON','almacenlyh31@gmail.com',0,1,'2024-04-12 19:36:15.000000'),(22,'pbkdf2_sha256$260000$Aau9lzSqo3lg4Y1jkdIjbt$ZNnW8f2+kIWcN/btFNw7y3bKhWMVmqVy7sdxVajC7Oo=',NULL,0,'S32','S 32 C.C. TUNAL VIEJO','TUNALVIEJO','almacenlyh32@gmail.com',0,1,'2024-04-12 19:36:22.000000'),(23,'pbkdf2_sha256$260000$ZuFYHO0m99199IwK7ouyNo$+03NatsOkPtak9Xbh9AGPTRNQbEULbpud5r0r0G7JCc=',NULL,0,'S34','S 34 DE LA 57','DELA57S34','almacenlyh34@gmail.com',0,1,'2024-04-12 19:36:28.000000'),(24,'pbkdf2_sha256$260000$wzK4Fiw0tWQQ23JFvVNiwn$4Rm5gKL32jbbQ7Da8C5aU1w+6MSdZ7xIRk81IzMPCM4=',NULL,0,'S37','S 37 P. AMERICAS GRANDE','PAMERICAS','almacenlyh37@gmail.com',0,1,'2024-04-12 19:36:35.000000'),(25,'pbkdf2_sha256$260000$ude7S9lHJaInMxhJr0HSnV$mGS7xdLX0SkDFOXBMh2YYOyKEaPklOtZuTgHlexxNCo=',NULL,0,'S38','S 38 CEDRITOS VIEJO','CEDRITOSVIEJO','almacenlyh38@gmail.com',0,1,'2024-04-12 19:36:43.000000'),(26,'pbkdf2_sha256$260000$S2tOKCUGoODvR0SlnRaFXf$saDJjk41bipIJStLGYyRLweHIidsSZVO5Rw1R1OXZYs=',NULL,0,'S40','S 40 KENNEDY GRANDE','KENNEDYGRANDE','almacenlyh40@gmail.com',0,1,'2024-04-12 19:36:51.000000'),(27,'pbkdf2_sha256$260000$uKEA4da4YI31t0PaYOA4ed$7F5JlkwBf1WiryNtM8GtVmknjJQSTiqtlzTkI9AYpbY=',NULL,0,'S43','S 43 RESTREPO OUTLET','RESTREPOOUTLET','almacenlyh43@gmail.com',0,1,'2024-04-12 19:36:57.000000'),(28,'pbkdf2_sha256$260000$Y9DkWvqSg2glpqd2MvYq6n$YJcW4YImj0u2w1/dQr+ZxAfhuHKyb6siEej1bfqQyKQ=',NULL,0,'S47','S 47 UNISUR FEMENINO','UNISURS47','almacenlyh47@gmail.com',0,1,'2024-04-12 19:37:04.000000'),(29,'pbkdf2_sha256$260000$7G864oIlCASMo6UFoFlFb5$WknP6wSA0Pb9dlZ3C/FfgNqwdRSelmO9YiG8VFnHXCk=',NULL,0,'S48','S 48 C.C. SUBA','CCSUBAS48','almacenlyh48@gmail.com',0,1,'2024-04-12 19:37:14.000000'),(30,'pbkdf2_sha256$260000$zlytnw09ajQdsReYwo15iw$fPBhN/9ou4qvOUpmuXz3YVmdy93ZeRt/qOEOp8ZMAvE=',NULL,0,'S50','S 50 C.C. GRANAHORRAR','GRANAHORRAR','almacenlyh50@gmail.com',0,1,'2024-04-12 19:37:20.000000'),(31,'pbkdf2_sha256$260000$4VF8hI9DrRVdvhzhBrV0Wz$m+/Cldjo0zpXwXer+R3olOI37aV9GbcYciRO4oSRnGI=',NULL,0,'S51','S 51 BUCARAMANGA','BUCARAMANGA','almacenlyh51@gmail.com',0,1,'2024-04-12 19:37:30.000000'),(32,'pbkdf2_sha256$260000$rnKGeCNV3BhjvkG4jZIar2$uYZdcdpXBumFeMkzc4xRVTmcw3mmfrOHpks7E5gs6dg=',NULL,0,'S52','S 52 C.C. BULEVAR 2 PISO','BULEVAR2','almacenlyh52@gmail.com',0,1,'2024-04-12 19:37:37.000000'),(33,'pbkdf2_sha256$260000$ZZSnpbrsSf9fxesWiADunW$kP3ngDXpXMBnwlOlAcdl37Jf2eVoDDdvQNqHhqcK6Ow=',NULL,0,'S55','S 55 UNICENTRO','UNICENTRO','almacenlyh55@gmail.com',0,1,'2024-04-12 19:37:46.000000'),(34,'pbkdf2_sha256$260000$Piqd8ck83Yf1Xs9rFtNHmg$/vtOd0YduSocSaREIjXXi8nyDWjHmi6cfIwf0eblkAs=',NULL,0,'S56','S 56 C.C. CENTRO CHIA GRANDE','CENTROCHIA','almacenlyh56@gmail.com',0,1,'2024-04-12 19:37:52.000000'),(35,'pbkdf2_sha256$260000$X5Xx44EXahf83GoFKnyGDu$dR+Dxw777/j0fN4U1kIJMfDKlbg+Fj53T5yj74WQxh8=',NULL,0,'S57','S 57 C.C. SALITRE NUEVO','SALITRENUEVO','almacenlyh57@gmail.com',0,1,'2024-04-12 19:38:00.000000'),(36,'pbkdf2_sha256$260000$sB0dXLGEADNDhJaIWa3lQv$+un091t+C//SE39326o1vhZCZb3OSOVaPdzJbXK71Tw=',NULL,0,'S61','S 61 C.C.SAN DIEGO','SANDIEGOS61','almacenlyh61@gmail.com',0,1,'2024-04-12 19:38:05.000000'),(37,'pbkdf2_sha256$260000$7kJvXyVcJZ0zGLdUuT90yl$mWfMPxJnbnWLAmdabj1WvicgRex2b1E3MfZLNycjprY=',NULL,0,'S62','S 62 C.C. BOCAGRANDE CARTAGENA','BOCAGRANDE','almacenlyh62@gmail.com',0,1,'2024-04-12 19:38:14.000000'),(38,'pbkdf2_sha256$260000$HNPJgt92ioqCMMGjH4zCn3$Wp3z5hBwNTpfE2gaA1t96TrgRopt7uW4gQkjzBXYOjg=',NULL,0,'S63','S 63 MULTICENTRO CARTAGENA','MULTICENTRO','almacenlyh63@gmail.com',0,1,'2024-04-12 19:38:22.000000'),(39,'pbkdf2_sha256$260000$g0QdQ8PgLQXWQUyLNqQjp1$0CjdFvaMXS1n9zLd+G3BiNFhMF8TLSXJFXhfdgMc3TM=','2024-04-16 20:42:17.230205',0,'FAC01','FACTURACION','FACTURACION','pruebalyhsistemas@outlook.es',0,1,'2024-04-12 19:38:33.000000');
>>>>>>> 9806bfbe259a0918ea4985dc0e617adba0554d0d
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (2,3,1),(3,4,1),(4,5,1),(5,6,1),(6,7,1),(7,8,1),(8,9,1),(9,10,1),(10,11,1),(11,12,1),(12,13,1),(13,14,1),(14,15,1),(15,16,1),(16,17,1),(17,18,1),(18,19,1),(19,20,1),(20,21,1),(21,22,1),(22,23,1),(23,24,1),(24,25,1),(25,26,1),(26,27,1),(27,28,1),(28,29,1),(29,30,1),(30,31,1),(31,32,1),(32,33,1),(33,34,1),(34,35,1),(35,36,1),(36,37,1),(37,38,1),(1,39,2);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,2,24),(4,2,28),(2,2,57),(3,2,66);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datamanagement`
--

DROP TABLE IF EXISTS `datamanagement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datamanagement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `idCard` int unsigned NOT NULL,
  `file` varchar(200) NOT NULL,
  `created` date NOT NULL,
  `updated` date NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dataManagement_user_id_f348d767_fk_auth_user_id` (`user_id`),
  CONSTRAINT `dataManagement_user_id_f348d767_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `dataManagement_chk_1` CHECK ((`idCard` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datamanagement`
--

LOCK TABLES `datamanagement` WRITE;
/*!40000 ALTER TABLE `datamanagement` DISABLE KEYS */;
/*!40000 ALTER TABLE `datamanagement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detapplications`
--

DROP TABLE IF EXISTS `detapplications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detapplications` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `reference` varchar(64) NOT NULL,
  `detail` varchar(64) NOT NULL,
  `amount` int NOT NULL,
  `unitVal` int NOT NULL,
  `totalVal` int NOT NULL,
  `application_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `detApplications_application_id_367363c5_fk_applications_id` (`application_id`),
  CONSTRAINT `detApplications_application_id_367363c5_fk_applications_id` FOREIGN KEY (`application_id`) REFERENCES `applications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detapplications`
--

LOCK TABLES `detapplications` WRITE;
/*!40000 ALTER TABLE `detapplications` DISABLE KEYS */;
/*!40000 ALTER TABLE `detapplications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-04-12 19:29:54.262162','57','sialyhapp | incomes | ingresos_manejodedatos',1,'[{\"added\": {}}]',1,1),(2,'2024-04-12 19:30:04.845085','58','sialyhapp | incomes | ingresos_facturasmanuales',1,'[{\"added\": {}}]',1,1),(3,'2024-04-12 19:30:15.064785','59','sialyhapp | incomes | ingresos_bonoseparado',1,'[{\"added\": {}}]',1,1),(4,'2024-04-12 19:30:29.863729','60','sialyhapp | incomes | ingresos_descuentonomina',1,'[{\"added\": {}}]',1,1),(5,'2024-04-12 19:30:41.083680','61','sialyhapp | incomes | ingresos_pagosnomina',1,'[{\"added\": {}}]',1,1),(6,'2024-04-12 19:30:53.582208','62','sialyhapp | listings | listados_facturasmanuales',1,'[{\"added\": {}}]',1,1),(7,'2024-04-12 19:31:06.097526','63','sialyhapp | listings | listados_descuentonomina',1,'[{\"added\": {}}]',1,1),(8,'2024-04-12 19:31:16.563646','64','sialyhapp | listings | listados_pagosnomina',1,'[{\"added\": {}}]',1,1),(9,'2024-04-12 19:31:26.011323','65','sialyhapp | listings | listados_bonoseparado',1,'[{\"added\": {}}]',1,1),(10,'2024-04-12 19:31:36.001674','66','sialyhapp | listings | listados_manejodatos',1,'[{\"added\": {}}]',1,1),(11,'2024-04-12 19:32:51.545776','1','Tiendas',1,'[{\"added\": {}}]',2,1),(12,'2024-04-12 19:32:59.571708','2','Facturacion',1,'[{\"added\": {}}]',2,1),(13,'2024-04-12 19:33:04.793825','3','Admon',1,'[{\"added\": {}}]',2,1),(14,'2024-04-12 19:33:46.889948','2','S03',1,'[{\"added\": {}}]',3,1),(15,'2024-04-12 19:33:57.559053','3','S04',1,'[{\"added\": {}}]',3,1),(16,'2024-04-12 19:34:09.733610','4','S05',1,'[{\"added\": {}}]',3,1),(17,'2024-04-12 19:34:20.881139','5','S06',1,'[{\"added\": {}}]',3,1),(18,'2024-04-12 19:34:30.297767','6','S07',1,'[{\"added\": {}}]',3,1),(19,'2024-04-12 19:34:38.161009','7','S08',1,'[{\"added\": {}}]',3,1),(20,'2024-04-12 19:34:44.767003','8','S10',1,'[{\"added\": {}}]',3,1),(21,'2024-04-12 19:34:52.781624','9','S12',1,'[{\"added\": {}}]',3,1),(22,'2024-04-12 19:35:01.797739','10','S13',1,'[{\"added\": {}}]',3,1),(23,'2024-04-12 19:35:07.904549','11','S14',1,'[{\"added\": {}}]',3,1),(24,'2024-04-12 19:35:15.284983','12','S15',1,'[{\"added\": {}}]',3,1),(25,'2024-04-12 19:35:22.228005','13','S16',1,'[{\"added\": {}}]',3,1),(26,'2024-04-12 19:35:28.068196','14','S18',1,'[{\"added\": {}}]',3,1),(27,'2024-04-12 19:35:35.780839','15','S19',1,'[{\"added\": {}}]',3,1),(28,'2024-04-12 19:35:42.660641','16','S20',1,'[{\"added\": {}}]',3,1),(29,'2024-04-12 19:35:48.519252','17','S22',1,'[{\"added\": {}}]',3,1),(30,'2024-04-12 19:35:56.429712','18','S23',1,'[{\"added\": {}}]',3,1),(31,'2024-04-12 19:36:03.042517','19','S26',1,'[{\"added\": {}}]',3,1),(32,'2024-04-12 19:36:09.563932','20','S30',1,'[{\"added\": {}}]',3,1),(33,'2024-04-12 19:36:16.139967','21','S31',1,'[{\"added\": {}}]',3,1),(34,'2024-04-12 19:36:22.961021','22','S32',1,'[{\"added\": {}}]',3,1),(35,'2024-04-12 19:36:28.833227','23','S34',1,'[{\"added\": {}}]',3,1),(36,'2024-04-12 19:36:35.831903','24','S37',1,'[{\"added\": {}}]',3,1),(37,'2024-04-12 19:36:43.943595','25','S38',1,'[{\"added\": {}}]',3,1),(38,'2024-04-12 19:36:52.031462','26','S40',1,'[{\"added\": {}}]',3,1),(39,'2024-04-12 19:36:58.314282','27','S43',1,'[{\"added\": {}}]',3,1),(40,'2024-04-12 19:37:04.356912','28','S47',1,'[{\"added\": {}}]',3,1),(41,'2024-04-12 19:37:14.828596','29','S48',1,'[{\"added\": {}}]',3,1),(42,'2024-04-12 19:37:21.335450','30','S50',1,'[{\"added\": {}}]',3,1),(43,'2024-04-12 19:37:30.928909','31','S51',1,'[{\"added\": {}}]',3,1),(44,'2024-04-12 19:37:37.993545','32','S52',1,'[{\"added\": {}}]',3,1),(45,'2024-04-12 19:37:46.522015','33','S55',1,'[{\"added\": {}}]',3,1),(46,'2024-04-12 19:37:52.760436','34','S56',1,'[{\"added\": {}}]',3,1),(47,'2024-04-12 19:38:00.630908','35','S57',1,'[{\"added\": {}}]',3,1),(48,'2024-04-12 19:38:05.584096','36','S61',1,'[{\"added\": {}}]',3,1),(49,'2024-04-12 19:38:14.608594','37','S62',1,'[{\"added\": {}}]',3,1),(50,'2024-04-12 19:38:22.710039','38','S63',1,'[{\"added\": {}}]',3,1),(51,'2024-04-12 19:38:34.003551','39','FAC01',1,'[{\"added\": {}}]',3,1),(52,'2024-04-12 19:39:07.838125','39','FAC01',2,'[{\"changed\": {\"fields\": [\"First name\", \"Email address\", \"Groups\"]}}]',3,1),(53,'2024-04-12 19:40:00.756587','2','S03',2,'[{\"changed\": {\"fields\": [\"First name\", \"Email address\", \"User permissions\"]}}]',3,1),(54,'2024-04-12 19:40:35.738002','3','S04',2,'[{\"changed\": {\"fields\": [\"First name\", \"Email address\", \"Groups\"]}}]',3,1),(55,'2024-04-12 19:41:11.876531','4','S05',2,'[{\"changed\": {\"fields\": [\"First name\", \"Email address\", \"Groups\"]}}]',3,1),(56,'2024-04-12 19:41:22.657371','39','FAC01',2,'[{\"changed\": {\"fields\": [\"Last name\"]}}]',3,1),(57,'2024-04-12 19:41:43.435147','2','S03',2,'[{\"changed\": {\"fields\": [\"Last name\"]}}]',3,1),(58,'2024-04-12 19:41:53.987121','3','S04',2,'[{\"changed\": {\"fields\": [\"Last name\"]}}]',3,1),(59,'2024-04-12 19:42:02.115417','4','S05',2,'[{\"changed\": {\"fields\": [\"Last name\"]}}]',3,1),(60,'2024-04-12 19:42:09.215491','4','S05',2,'[]',3,1),(61,'2024-04-12 19:42:46.501694','5','S06',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(62,'2024-04-12 19:43:12.273803','6','S07',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(63,'2024-04-12 19:43:35.160029','7','S08',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(64,'2024-04-12 19:44:01.456410','8','S10',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(65,'2024-04-12 19:44:27.237723','9','S12',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(66,'2024-04-12 19:44:35.596657','9','S12',2,'[]',3,1),(67,'2024-04-12 19:45:03.150364','10','S13',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(68,'2024-04-12 19:45:19.648311','11','S14',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(69,'2024-04-12 19:45:40.757555','12','S15',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(70,'2024-04-12 19:46:03.332663','13','S16',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(71,'2024-04-12 19:46:24.894498','14','S18',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(72,'2024-04-12 19:46:51.638813','15','S19',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(73,'2024-04-12 19:47:22.049683','16','S20',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(74,'2024-04-12 19:47:47.884572','17','S22',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(75,'2024-04-12 19:48:07.952624','18','S23',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(76,'2024-04-12 19:48:27.718800','19','S26',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(77,'2024-04-12 19:48:48.526135','20','S30',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(78,'2024-04-12 19:49:05.905520','21','S31',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(79,'2024-04-12 19:49:24.567750','22','S32',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(80,'2024-04-12 19:49:45.364946','23','S34',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(81,'2024-04-12 19:50:09.659959','24','S37',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(82,'2024-04-12 19:50:30.029038','25','S38',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(83,'2024-04-12 19:51:02.414749','26','S40',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(84,'2024-04-12 19:51:20.797545','27','S43',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(85,'2024-04-12 19:51:54.088993','28','S47',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(86,'2024-04-12 19:52:14.536657','29','S48',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(87,'2024-04-12 19:52:32.356481','30','S50',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(88,'2024-04-12 19:52:51.134536','31','S51',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(89,'2024-04-12 19:53:14.922187','32','S52',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(90,'2024-04-12 19:53:41.524082','33','S55',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(91,'2024-04-12 19:54:04.712678','34','S56',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(92,'2024-04-12 19:54:23.755352','35','S57',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(93,'2024-04-12 19:54:44.840449','36','S61',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(94,'2024-04-12 19:54:51.129550','36','S61',2,'[]',3,1),(95,'2024-04-12 19:55:16.341847','37','S62',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(96,'2024-04-12 19:55:44.471712','38','S63',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Groups\"]}}]',3,1),(97,'2024-04-12 19:56:26.254621','1','Tiendas',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',2,1),(98,'2024-04-12 19:56:57.521434','2','Facturacion',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',2,1),(99,'2024-04-29 04:24:52.343183','79','human_resources | applications | solicitudes',1,'[{\"added\": {}}]',1,1),(100,'2024-04-29 04:25:06.704013','80','human_resources | applications | consultation',1,'[{\"added\": {}}]',1,1),(101,'2024-04-29 04:25:26.965513','81','human_resources | applications | aprobaciones',1,'[{\"added\": {}}]',1,1),(102,'2024-04-29 04:26:12.408023','1','Tiendas',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',2,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (15,'accounting','petty_cash'),(13,'admin','logentry'),(2,'auth','group'),(1,'auth','permission'),(3,'auth','user'),(12,'billing','dataManagement'),(8,'billing','manInvoice'),(11,'billing','payDiscounts'),(10,'billing','sepBonuses'),(9,'billing','temPayPayment'),(4,'contenttypes','contenttype'),(17,'human_resources','applications'),(16,'human_resources','detapplications'),(14,'sessions','session'),(6,'sialyhapp','incomes'),(7,'sialyhapp','listings'),(5,'sialyhapp','modules');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
<<<<<<< HEAD
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
=======
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
>>>>>>> 9806bfbe259a0918ea4985dc0e617adba0554d0d
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `django_migrations` VALUES (1,'sialyhapp','0001_initial','2024-04-12 19:07:33.997228'),(2,'sialyhapp','0002_incomes_listings','2024-04-12 19:07:35.527832'),(3,'contenttypes','0001_initial','2024-04-12 19:07:44.564649'),(4,'auth','0001_initial','2024-04-12 19:08:01.561282'),(5,'billing','0001_initial','2024-04-12 19:08:03.907287'),(6,'billing','0002_auto_20240403_1507','2024-04-12 19:08:09.942898'),(7,'billing','0003_alter_sepBonuses_numbond','2024-04-12 19:08:11.770101'),(8,'billing','0004_auto_20240408_1139','2024-04-12 19:08:14.673107'),(9,'billing','0005_dataManagement','2024-04-12 19:08:17.442313'),(10,'billing','0006_auto_20240411_1307','2024-04-12 19:08:20.671919'),(11,'admin','0001_initial','2024-04-12 19:09:33.224056'),(12,'admin','0002_logentry_remove_auto_add','2024-04-12 19:09:33.364456'),(13,'admin','0003_logentry_add_action_flag_choices','2024-04-12 19:09:33.458056'),(14,'contenttypes','0002_remove_content_type_name','2024-04-12 19:09:35.916662'),(15,'auth','0002_alter_permission_name_max_length','2024-04-12 19:09:37.792666'),(16,'auth','0003_alter_user_email_max_length','2024-04-12 19:09:38.198266'),(17,'auth','0004_alter_user_username_opts','2024-04-12 19:09:38.340667'),(18,'auth','0005_alter_user_last_login_null','2024-04-12 19:09:39.699869'),(19,'auth','0006_require_contenttypes_0002','2024-04-12 19:09:39.777869'),(20,'auth','0007_alter_validators_add_error_messages','2024-04-12 19:09:39.902669'),(21,'auth','0008_alter_user_username_max_length','2024-04-12 19:09:41.575873'),(22,'auth','0009_alter_user_last_name_max_length','2024-04-12 19:09:43.184676'),(23,'auth','0010_alter_group_name_max_length','2024-04-12 19:09:43.486477'),(24,'auth','0011_update_proxy_permissions','2024-04-12 19:09:43.642478'),(25,'auth','0012_alter_user_first_name_max_length','2024-04-12 19:09:45.173280'),(26,'sessions','0001_initial','2024-04-12 19:09:46.236082'),(27,'billing','0007_auto_20240415_0934','2024-04-16 20:43:01.985121'),(28,'billing','0008_alter_manInvoice_file','2024-04-16 20:43:02.120926'),(29,'billing','0009_alter_manInvoice_file','2024-04-16 20:43:02.267935'),(30,'billing','0010_delete_temPayPayment','2024-04-16 20:43:02.775947'),(31,'accounting','0001_initial','2024-04-29 04:18:03.996161'),(32,'human_resources','0001_initial','2024-04-29 04:18:38.699957');
=======
INSERT INTO `django_migrations` VALUES (1,'sialyhapp','0001_initial','2024-04-12 19:07:33.997228'),(2,'sialyhapp','0002_incomes_listings','2024-04-12 19:07:35.527832'),(3,'contenttypes','0001_initial','2024-04-12 19:07:44.564649'),(4,'auth','0001_initial','2024-04-12 19:08:01.561282'),(5,'billing','0001_initial','2024-04-12 19:08:03.907287'),(6,'billing','0002_auto_20240403_1507','2024-04-12 19:08:09.942898'),(7,'billing','0003_alter_sepBonuses_numbond','2024-04-12 19:08:11.770101'),(8,'billing','0004_auto_20240408_1139','2024-04-12 19:08:14.673107'),(9,'billing','0005_dataManagement','2024-04-12 19:08:17.442313'),(10,'billing','0006_auto_20240411_1307','2024-04-12 19:08:20.671919'),(11,'admin','0001_initial','2024-04-12 19:09:33.224056'),(12,'admin','0002_logentry_remove_auto_add','2024-04-12 19:09:33.364456'),(13,'admin','0003_logentry_add_action_flag_choices','2024-04-12 19:09:33.458056'),(14,'contenttypes','0002_remove_content_type_name','2024-04-12 19:09:35.916662'),(15,'auth','0002_alter_permission_name_max_length','2024-04-12 19:09:37.792666'),(16,'auth','0003_alter_user_email_max_length','2024-04-12 19:09:38.198266'),(17,'auth','0004_alter_user_username_opts','2024-04-12 19:09:38.340667'),(18,'auth','0005_alter_user_last_login_null','2024-04-12 19:09:39.699869'),(19,'auth','0006_require_contenttypes_0002','2024-04-12 19:09:39.777869'),(20,'auth','0007_alter_validators_add_error_messages','2024-04-12 19:09:39.902669'),(21,'auth','0008_alter_user_username_max_length','2024-04-12 19:09:41.575873'),(22,'auth','0009_alter_user_last_name_max_length','2024-04-12 19:09:43.184676'),(23,'auth','0010_alter_group_name_max_length','2024-04-12 19:09:43.486477'),(24,'auth','0011_update_proxy_permissions','2024-04-12 19:09:43.642478'),(25,'auth','0012_alter_user_first_name_max_length','2024-04-12 19:09:45.173280'),(26,'sessions','0001_initial','2024-04-12 19:09:46.236082'),(27,'billing','0007_auto_20240415_0934','2024-04-16 20:43:01.985121'),(28,'billing','0008_alter_manInvoice_file','2024-04-16 20:43:02.120926'),(29,'billing','0009_alter_manInvoice_file','2024-04-16 20:43:02.267935'),(30,'billing','0010_delete_temPayPayment','2024-04-16 20:43:02.775947');
>>>>>>> 9806bfbe259a0918ea4985dc0e617adba0554d0d
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
<<<<<<< HEAD
INSERT INTO `django_session` VALUES ('8wewu26ezzlhjz1hhzwebv6ml7k4yeu2','.eJxVjMsOwiAQRf-FtSE8C-PSvd9AmAGkaiAp7cr479qkC93ec859sRC3tYZt5CXMiZ2ZBnb6HTHSI7edpHtst86pt3WZke8KP-jg157y83K4fwc1jvqtnURVCOxkwClHILwgpOJFTgLQuWxRGm8m5ckVrTFLYROIQskoE4tm7w_-IDfo:1rwpdB:5qq4bwuoo1KqDew2eMLFOiH80fvF5mHRLtIZX06naNM','2024-04-30 20:42:17.362212'),('tv72yyh3q4ay296o92reslue2dvcw8un','.eJxVjMsOwiAQRf-FtSG8YVy67zcQYEapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMQZ2ZlpdvrdcioPajvAe2q3zktv6zJnviv8oINPHel5Ody_g5pG_dbgLWpAC0aGAtIHJA_FG20FBHAugTa5OJLKXZ2ySpAJQB6NUDmA0ez9AbD7Nl0:1s1IWK:p4nzrGxpb4OpY36ELhLtEPkrGpTsaQ2M7ltqSX_NkiU','2024-05-13 04:21:40.405562');
=======
INSERT INTO `django_session` VALUES ('8wewu26ezzlhjz1hhzwebv6ml7k4yeu2','.eJxVjMsOwiAQRf-FtSE8C-PSvd9AmAGkaiAp7cr479qkC93ec859sRC3tYZt5CXMiZ2ZBnb6HTHSI7edpHtst86pt3WZke8KP-jg157y83K4fwc1jvqtnURVCOxkwClHILwgpOJFTgLQuWxRGm8m5ckVrTFLYROIQskoE4tm7w_-IDfo:1rwpdB:5qq4bwuoo1KqDew2eMLFOiH80fvF5mHRLtIZX06naNM','2024-04-30 20:42:17.362212');
>>>>>>> 9806bfbe259a0918ea4985dc0e617adba0554d0d
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incomes`
--

DROP TABLE IF EXISTS `incomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incomes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `incomes` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incomes`
--

LOCK TABLES `incomes` WRITE;
/*!40000 ALTER TABLE `incomes` DISABLE KEYS */;
/*!40000 ALTER TABLE `incomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listings`
--

DROP TABLE IF EXISTS `listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listings` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `listings` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listings`
--

LOCK TABLES `listings` WRITE;
/*!40000 ALTER TABLE `listings` DISABLE KEYS */;
/*!40000 ALTER TABLE `listings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maninvoice`
--

DROP TABLE IF EXISTS `maninvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maninvoice` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numInvoice` int unsigned NOT NULL,
  `dateInvoice` date DEFAULT NULL,
  `file` varchar(200) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `manInvoice_user_id_d10ac0a5_fk_auth_user_id` (`user_id`),
  CONSTRAINT `manInvoice_user_id_d10ac0a5_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `manInvoice_chk_1` CHECK ((`numInvoice` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maninvoice`
--

LOCK TABLES `maninvoice` WRITE;
/*!40000 ALTER TABLE `maninvoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `maninvoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `module` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paydiscounts`
--

DROP TABLE IF EXISTS `paydiscounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paydiscounts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numInvoice` int unsigned NOT NULL,
  `datepayDiscounts` date DEFAULT NULL,
  `file` varchar(200) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `payDiscounts_user_id_e038704a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `payDiscounts_user_id_e038704a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `payDiscounts_chk_1` CHECK ((`numInvoice` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paydiscounts`
--

LOCK TABLES `paydiscounts` WRITE;
/*!40000 ALTER TABLE `paydiscounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `paydiscounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `petty_cash`
--

DROP TABLE IF EXISTS `petty_cash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `petty_cash` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dateInvoice` date NOT NULL,
  `file` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `petty_cash_user_id_205c67b9_fk_auth_user_id` (`user_id`),
  CONSTRAINT `petty_cash_user_id_205c67b9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `petty_cash`
--

LOCK TABLES `petty_cash` WRITE;
/*!40000 ALTER TABLE `petty_cash` DISABLE KEYS */;
/*!40000 ALTER TABLE `petty_cash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sepbonuses`
--

DROP TABLE IF EXISTS `sepbonuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sepbonuses` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numBond` bigint unsigned NOT NULL,
  `dateInvoice` date DEFAULT NULL,
  `valBond` int unsigned NOT NULL,
  `file` varchar(200) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sepBonuses_user_id_133030c8_fk_auth_user_id` (`user_id`),
  CONSTRAINT `sepBonuses_user_id_133030c8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `sepBonuses_chk_1` CHECK ((`numBond` >= 0)),
  CONSTRAINT `sepBonuses_chk_2` CHECK ((`valBond` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sepbonuses`
--

<<<<<<< HEAD
LOCK TABLES `sepbonuses` WRITE;
/*!40000 ALTER TABLE `sepbonuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `sepbonuses` ENABLE KEYS */;
=======
LOCK TABLES `sepBonuses` WRITE;
/*!40000 ALTER TABLE `sepBonuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `sepBonuses` ENABLE KEYS */;
>>>>>>> 9806bfbe259a0918ea4985dc0e617adba0554d0d
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

<<<<<<< HEAD
-- Dump completed on 2024-04-28 23:31:47
=======
-- Dump completed on 2024-04-16 15:45:37
>>>>>>> 9806bfbe259a0918ea4985dc0e617adba0554d0d
