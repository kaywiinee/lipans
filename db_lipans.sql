-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: lipans_development
-- ------------------------------------------------------
-- Server version	5.7.12

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
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `type_id` int(11) DEFAULT NULL,
  `is_displayed` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ckeditor_assets`
--

DROP TABLE IF EXISTS `ckeditor_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ckeditor_assets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_file_name` varchar(255) NOT NULL,
  `data_content_type` varchar(255) DEFAULT NULL,
  `data_file_size` int(11) DEFAULT NULL,
  `assetable_id` int(11) DEFAULT NULL,
  `assetable_type` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ckeditor_assetable` (`assetable_type`,`assetable_id`) USING BTREE,
  KEY `idx_ckeditor_assetable_type` (`assetable_type`,`type`,`assetable_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ckeditor_assets`
--

LOCK TABLES `ckeditor_assets` WRITE;
/*!40000 ALTER TABLE `ckeditor_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ckeditor_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delayed_jobs`
--

DROP TABLE IF EXISTS `delayed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) NOT NULL DEFAULT '0',
  `attempts` int(11) NOT NULL DEFAULT '0',
  `handler` text NOT NULL,
  `last_error` text,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) DEFAULT NULL,
  `queue` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `delayed_jobs_priority` (`priority`,`run_at`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delayed_jobs`
--

LOCK TABLES `delayed_jobs` WRITE;
/*!40000 ALTER TABLE `delayed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `delayed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `image_file_name` varchar(255) DEFAULT NULL,
  `image_content_type` varchar(255) DEFAULT NULL,
  `image_file_size` int(11) DEFAULT NULL,
  `image_updated_at` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `is_best` tinyint(1) DEFAULT NULL,
  `description` text,
  `use` text,
  `note` text,
  `price` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Kem loại bỏ mụn bọc và mụn cám',1,1,'Loại bỏ đi tất cả c&aacute;c loại mụn tr&ecirc;n da mặt như: mụn bọc, mụn c&aacute;m, mụn đầu đen, mụn do dị ứng da v&agrave; mụn của tuổi dậy th&igrave;.<br />C&acirc;n bằng độ ẩm cho da v&agrave; se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng.<br />Nu&ocirc;i dưỡng cho da nhanh ch&oacute;ng trắng mịn trở lại.<br />Độ chống nắng SPF 30','<p>- Rửa mặt cho thật sạch bằng nước ấm v&agrave; lau cho vừa kh&ocirc;.<br />- Thoa 1 lớp kem thật mỏng ở v&ugrave;ng da c&oacute; mụn v&agrave; c&aacute;c chỗ bị dị ứng. Hoặc chấm 1 &iacute;t kem l&ecirc;n đầu mụn bọc, mụn mủ (ng&agrave;y 2 lần s&aacute;ng &amp; tối).<br />- Nếu thấy da bạn qu&aacute; nhờn v&agrave; c&oacute; nhiều mụn đỏ, trước khi thoa kem th&igrave; bạn n&ecirc;n rửa mặt bằng nước ấm với chanh tươi sau đ&oacute; rửa mặt cho sạch v&agrave; lau kh&ocirc; ( C&aacute;ch pha chế: lấy 1 ch&eacute;n nước ấm cho v&agrave;o 2 giọt chanh tươi, khuấy đều).<br />- Kh&ocirc;ng n&ecirc;n nặn mụn khi mụn chưa gi&agrave;. N&ecirc;n để mụn gi&agrave; v&agrave; gom đầu lại mới d&ugrave;ng kim y tế ch&iacute;ch nhẹ v&agrave;o mụn để nặn lấy c&ugrave;i ra. Sau đ&oacute; chấm 1 &iacute;t kem l&ecirc;n đầu mụn mới nặn.<br />- Khi da bạn đ&atilde; hết mụn m&agrave; c&ograve;n lại c&aacute;c vết th&acirc;m đen , bạn mua th&ecirc;m 1 sản phẩm của c&ocirc;ng ty: Kem dưỡng da ngừa mụn trứng c&aacute;. Kem sẽ tẩy bỏ c&aacute;c vết th&acirc;m mụn v&agrave; cho l&agrave;n da trắng mịn trở lại.</p>','<p>- Sản phẩm l&agrave; loại kem điều trị mụn n&ecirc;n trong thời gian điều trị bạn kh&ocirc;ng n&ecirc;n ra nắng thường xuy&ecirc;n.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.ại.</p>',64,'products/mun(tuyp).jpg',NULL,NULL),(2,'Kem dưỡng da ngừa mụn trứng cá (lẻ)',1,0,'Loại bỏ đi tất cả c&aacute;c loại mụn tr&ecirc;n da mặt như: mụn bọc, mụn c&aacute;m, mụn đầu đen...v&agrave; c&aacute;c vết th&acirc;m do mụn để lại.<br />Nu&ocirc;i dưỡng cho da nhanh ch&oacute;ng trắng mịn trở lại.<br />Độ chống nắng SPF 30.','<p>- Rửa mặt cho thật sạch bằng nước ấm v&agrave; lau cho vừa kh&ocirc;.<br />- Thoa 1 lớp kem thật mỏng ở v&ugrave;ng da c&oacute; mụn v&agrave; c&aacute;c chỗ bị dị ứng. Hoặc chấm 1 &iacute;t kem l&ecirc;n đầu mụn, vết th&acirc;m (ng&agrave;y 2 lần s&aacute;ng &amp; tối).<br />- Kh&ocirc;ng n&ecirc;n nặn mụn khi mụn chưa gi&agrave;. N&ecirc;n để mụn gi&agrave; v&agrave; gom đầu lại mới d&ugrave;ng kim y tế ch&iacute;ch nhẹ v&agrave;o mụn để nặn lấy c&ugrave;i ra. Sau đ&oacute; chấm 1 &iacute;t kem l&ecirc;n đầu mụn mới nặn.<br />- Khi da bạn đ&atilde; hết mụn, bạn vẫn n&ecirc;n tiếp tục sử dụng sản phẩm (ng&agrave;y 1 lần v&agrave;o buổi s&aacute;ng). Thoa kem thật mỏng để duy tr&igrave; l&agrave;n da trắng mịn v&agrave; kh&ocirc;ng cho mụn trở lại.</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',88,'products/mun(le).jpg',NULL,NULL),(3,'Kem dưỡng da ngừa mụn trứng cá (bộ)',1,0,'Loại bỏ đi tất cả c&aacute;c loại mụn tr&ecirc;n da mặt như: mụn bọc, mụn c&aacute;m, mụn đầu đen...v&agrave; c&aacute;c vết th&acirc;m do mụn để lại.<br />Nu&ocirc;i dưỡng cho da nhanh ch&oacute;ng trắng mịn trở lại.<br />Độ chống nắng SPF 30.','<p>- Rửa mặt cho thật sạch bằng nước ấm v&agrave; lau cho vừa kh&ocirc;.<br />- Thoa 1 lớp kem thật mỏng ở v&ugrave;ng da c&oacute; mụn v&agrave; c&aacute;c chỗ bị dị ứng. Hoặc chấm 1 &iacute;t kem l&ecirc;n đầu mụn, vết th&acirc;m (ng&agrave;y 2 lần s&aacute;ng &amp; tối).<br />- Kh&ocirc;ng n&ecirc;n nặn mụn khi mụn chưa gi&agrave;. N&ecirc;n để mụn gi&agrave; v&agrave; gom đầu lại mới d&ugrave;ng kim y tế ch&iacute;ch nhẹ v&agrave;o mụn để nặn lấy c&ugrave;i ra. Sau đ&oacute; chấm 1 &iacute;t kem l&ecirc;n đầu mụn mới nặn.<br />- Khi da bạn đ&atilde; hết mụn, bạn vẫn n&ecirc;n tiếp tục sử dụng sản phẩm (ng&agrave;y 1 lần v&agrave;o buổi s&aacute;ng). Thoa kem thật mỏng để duy tr&igrave; l&agrave;n da trắng mịn v&agrave; kh&ocirc;ng cho mụn trở lại.</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',174,'products/mun(bo).jpg',NULL,NULL),(4,'Kem dưỡng trắng da mặt (4g)',2,0,'Dưỡng cho l&agrave;n da nhanh ch&oacute;ng trắng s&aacute;ng, mịn m&agrave;ng.<br />Độ chống nắng SPF 30.','<p>- Rửa mặt bằng nước ấm, lau cho vừa kh&ocirc;.<br />- Massage thật nhẹ l&ecirc;n da mặt cho đều, tạo cho l&agrave;n da c&oacute; sự đ&agrave;n hồi sẽ gi&uacute;p cho da hấp thụ nhanh c&aacute;c chất dưỡng từ trong th&agrave;nh phần của kem.<br />- Rửa mặt lại bằng nước lạnh, lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng l&ecirc;n tr&ecirc;n mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',52,'products/trangmat(4g).jpg',NULL,NULL),(5,'Kem dưỡng trắng da mặt (10g)',2,0,'Dưỡng cho l&agrave;n da nhanh ch&oacute;ng trắng s&aacute;ng, mịn m&agrave;ng.<br />Độ chống nắng SPF 30.','<p>- Rửa mặt bằng nước ấm, lau cho vừa kh&ocirc;.<br />- Massage thật nhẹ l&ecirc;n da mặt cho đều, tạo cho l&agrave;n da c&oacute; sự đ&agrave;n hồi sẽ gi&uacute;p cho da hấp thụ nhanh c&aacute;c chất dưỡng từ trong th&agrave;nh phần của kem.<br />- Rửa mặt lại bằng nước lạnh, lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng l&ecirc;n tr&ecirc;n mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',96,'products/trangmat(le).jpg',NULL,NULL),(6,'Kem dưỡng trắng da mặt (bộ)',2,1,'Dưỡng cho l&agrave;n da nhanh ch&oacute;ng trắng s&aacute;ng, mịn m&agrave;ng.<br />C&acirc;n bằng độ ẩm cho da v&agrave; se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng.<br />Sản phẩm tốt cho da dầu v&agrave; da kh&ocirc;.<br />Độ chống nắng SPF 30.','<p>- Rửa mặt bằng nước ấm, lau cho vừa kh&ocirc;.<br />- Massage thật nhẹ l&ecirc;n da mặt cho đều, tạo cho l&agrave;n da c&oacute; sự đ&agrave;n hồi sẽ gi&uacute;p cho da hấp thụ nhanh c&aacute;c chất dưỡng từ trong th&agrave;nh phần của kem.<br />- Rửa mặt lại bằng nước lạnh, lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng l&ecirc;n tr&ecirc;n mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',144,'products/trangdamat(bo).jpg',NULL,NULL),(7,'Kem dưỡng da mặt 3 trong 1 (4g)',5,0,'Loại bỏ đi tất cả c&aacute;c đốm t&agrave;n nhang, đồi mồi tr&ecirc;n da mặt.<br />Nu&ocirc;i dưỡng cho l&agrave;n da trắng mịn m&agrave;ng.<br />Độ chống nắng SPF 30.','<p>Trước khi đi ngủ 10 ph&uacute;t, rửa mặt cho sạch v&agrave; lau vừa kh&ocirc;, sau đ&oacute; thoa một lớp kem mỏng l&ecirc;n da mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',52,'products/3in1(4g).jpg',NULL,NULL),(8,'Kem dưỡng da mặt 3 trong 1 (10g)',5,0,'Loại bỏ đi tất cả c&aacute;c đốm t&agrave;n nhang, đồi mồi tr&ecirc;n da mặt.<br />Nu&ocirc;i dưỡng cho l&agrave;n da trắng mịn m&agrave;ng.<br />Độ chống nắng SPF 30.','<p>Trước khi đi ngủ 10 ph&uacute;t, rửa mặt cho sạch v&agrave; lau vừa kh&ocirc;, sau đ&oacute; thoa một lớp kem mỏng l&ecirc;n da mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',96,'products/3in1(le).jpg',NULL,NULL),(9,'Kem dưỡng da mặt 3 trong 1 (bộ)',5,0,'Loại bỏ đi tất cả c&aacute;c đốm t&agrave;n nhang, đồi mồi tr&ecirc;n da mặt.<br />Nu&ocirc;i dưỡng cho l&agrave;n da trắng mịn m&agrave;ng.<br />C&acirc;n bằng độ ẩm cho da v&agrave; se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng.<br />Sản phẩm tốt cho da dầu v&agrave; da kh&ocirc;.<br />Độ chống nắng SPF 30.','<p>Trước khi đi ngủ 10 ph&uacute;t, rửa mặt cho sạch v&agrave; lau vừa kh&ocirc;, sau đ&oacute; thoa một lớp kem mỏng l&ecirc;n da mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',144,'products/3in1(bo).jpg',NULL,NULL),(10,'Kem dưỡng trắng da toàn thân',5,1,'Loại bỏ đi c&aacute;c tế b&agrave;o ch&eacute;t, c&aacute;c vết đồi mồi, vết th&acirc;m tr&ecirc;n cơ thể.<br />L&agrave;m tăng độ ẩm v&agrave; l&agrave;m cho l&agrave;n da nhanh ch&oacute;ng trắng s&aacute;ng, mịn m&agrave;ng.<br />Độ chống nắng SPF 30.','<p>- Khi tắm n&ecirc;n sử dụng b&ocirc;ng tắm ch&agrave; cho thật nhẹ l&ecirc;n l&agrave;n da để tạo cho da c&oacute; độ đ&agrave;n hồi v&agrave; tẩy đi c&aacute;c chất bả b&aacute;m theo da.<br />- Tắm cho sạch v&agrave; lau kh&ocirc;, sau đ&oacute; thoa 1 lớp kem mỏng l&ecirc;n v&ugrave;ng da n&agrave;o m&agrave; bạn muốn dưỡng trắng (ng&agrave;y 2 lần, s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.<br />- Đậy nắp cho k&iacute;n sau khi sử dụng</p>',98,'products/duongtoanthan.jpg',NULL,NULL),(11,'Kem tái tạo da',5,0,'T&aacute;i tạo lại c&aacute;c l&agrave;n da bị hư, da kh&ocirc; do sử dụng c&aacute;c sản phẩm c&oacute; nhiều chất tẩy hoặc do bụi đường g&acirc;y ra. <br />Nu&ocirc;i dưỡng cho da nhanh ch&oacute;ng trắng mịn trở lại. <br />Độ chống nắng SPF 30.','<p>- Trước khi đi ngủ 10 ph&uacute;t, rửa mặt bằng nước lạnh, lau cho vừa kh&ocirc;. Sau đ&oacute; massage thật nhẹ l&ecirc;n da mặt cho đều, tạo cho l&agrave;n da c&oacute; sự đ&agrave;n hồi sẽ gi&uacute;p cho da hấp thụ nhanh c&aacute;c chất dưỡng từ trong th&agrave;nh phần của kem.<br />- Rửa mặt lại bằng nước lạnh, lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng l&ecirc;n tr&ecirc;n mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',96,'products/taitaoda.jpg',NULL,NULL),(12,'Kem dưỡng da ngăn ngừa nám (lẻ)',3,0,'X&oacute;a đi tất cả vết n&aacute;m tr&ecirc;n da mặt do nắng g&acirc;y ra.<br />Nu&ocirc;i dưỡng cho da nhanh ch&oacute;ng trắng mịn trở lại.<br />Độ chống nắng SPF 30.','<p>- Rửa mặt bằng nước lạnh v&agrave; lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối). <br />- N&aacute;m da mặt c&oacute; thể chia ra nhiều loại kh&aacute;c nhau: <br /> + N&aacute;m do nắng tạo n&ecirc;n<br /> + N&aacute;m do sử dụng c&aacute;c loại hợp chất tẩy da.<br /> + N&aacute;m do n&oacute;ng trong cơ thể.<br />- Sản phẩm kem trị n&aacute;m của c&ocirc;ng ty ch&uacute;ng t&ocirc;i c&oacute; thế điều trị được c&aacute;c loại n&aacute;m do nắng v&agrave; c&aacute;c loại hợp chất tẩy da tạo n&ecirc;n. <br />- C&ograve;n ri&ecirc;ng về n&aacute;m do n&oacute;ng trong cơ thể th&igrave; bạn n&ecirc;n đến ph&ograve;ng kh&aacute;m đ&ocirc;ng y để kh&aacute;m v&agrave; uống thuốc điều trị n&aacute;m. Bạn n&ecirc;n kết hợp lvừa uống thuốc vừa thoa kem trị n&aacute;m, sẽ nhanh ch&oacute;ng gi&uacute;p l&agrave;n da bạn phục hồi trở lại một c&aacute;ch hiệu quả v&agrave; an to&agrave;n cho da.</p>','<p>- Tr&aacute;nh trực tiếp với &aacute;nh nắng ngo&agrave;i trời v&agrave;o buổi trưa trong l&uacute;c điếu trị.<br />- Nếu bạn đi nắng thường xuy&ecirc;n th&igrave; bạn sử dụng th&ecirc;m 1 lớp phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- N&ecirc;n uống nhiều nước, ki&ecirc;ng ăn đồ n&oacute;ng, đồ chi&ecirc;n v&agrave; nước c&oacute; ga.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',88,'products/nam(le).jpg',NULL,NULL),(13,'Kem dưỡng da ngăn ngừa nám (bộ)',3,1,'X&oacute;a đi tất cả vết n&aacute;m tr&ecirc;n da mặt do nắng g&acirc;y ra.<br />Nu&ocirc;i dưỡng cho da nhanh ch&oacute;ng trắng mịn trở lại.<br />C&acirc;n bằng độ ẩm cho da v&agrave; se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng.<br />Sản phẩm tốt cho da dầu v&agrave; da kh&ocirc;.<br />Độ chống nắng SPF 30.','<p>- Rửa mặt bằng nước lạnh v&agrave; lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối). <br />- N&aacute;m da mặt c&oacute; thể chia ra nhiều loại kh&aacute;c nhau: <br /> + N&aacute;m do nắng tạo n&ecirc;n<br /> + N&aacute;m do sử dụng c&aacute;c loại hợp chất tẩy da.<br /> + N&aacute;m do n&oacute;ng trong cơ thể.<br />- Sản phẩm kem trị n&aacute;m của c&ocirc;ng ty ch&uacute;ng t&ocirc;i c&oacute; thế điều trị được c&aacute;c loại n&aacute;m do nắng v&agrave; c&aacute;c loại hợp chất tẩy da tạo n&ecirc;n. <br />- C&ograve;n ri&ecirc;ng về n&aacute;m do n&oacute;ng trong cơ thể th&igrave; bạn n&ecirc;n đến ph&ograve;ng kh&aacute;m đ&ocirc;ng y để kh&aacute;m v&agrave; uống thuốc điều trị n&aacute;m. Bạn n&ecirc;n kết hợp lvừa uống thuốc vừa thoa kem trị n&aacute;m, sẽ nhanh ch&oacute;ng gi&uacute;p l&agrave;n da bạn phục hồi trở lại một c&aacute;ch hiệu quả v&agrave; an to&agrave;n cho da.</p>','<p>- Tr&aacute;nh trực tiếp với &aacute;nh nắng ngo&agrave;i trời v&agrave;o buổi trưa trong l&uacute;c điếu trị.<br />- Nếu bạn đi nắng thường xuy&ecirc;n th&igrave; bạn sử dụng th&ecirc;m 1 lớp phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- N&ecirc;n uống nhiều nước, ki&ecirc;ng ăn đồ n&oacute;ng, đồ chi&ecirc;n v&agrave; nước c&oacute; ga.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',174,'products/nam(bo).jpg',NULL,NULL),(14,'Kem giảm lão hóa da (kem khô)',4,0,'Gi&uacute;p l&agrave;m giảm qu&aacute; tr&igrave;nh l&atilde;o h&oacute;a da của tuổi trung ni&ecirc;n.<br />X&oacute;a mờ đi tất cả vết th&acirc;m v&agrave; vết nhăn dưới v&ugrave;ng mắt.<br />C&acirc;n bằng độ ẩm cho da v&agrave; se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng.<br />Độ chống nắng SPF 30.','<p>- Trước khi đi ngủ 10 ph&uacute;t, rửa mặt bằng nước ấm, lau cho vừa kh&ocirc;. Sau đ&oacute; massage thật nhẹ l&ecirc;n da mặt cho đều, tạo cho l&agrave;n da c&oacute; sự đ&agrave;n hồi sẽ gi&uacute;p cho da hấp thụ nhanh c&aacute;c chất dưỡng từ trong th&agrave;nh phần của kem.<br />- Rửa mặt lại bằng nước lạnh, lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng l&ecirc;n tr&ecirc;n mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Độ tuổi từ 35 tuổi trở l&ecirc;n, bạn n&ecirc;n ăn uống theo một chế độ hợp l&yacute;, khoa học.N&ecirc;n uống nhiều nước lọc, ki&ecirc;ng ăn đồ n&oacute;ng, kh&ocirc;ng thức qu&aacute; khua<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',298,'products/laohoada(vuong).jpg',NULL,NULL),(15,'Kem giảm lão hóa da (kem nhão)',4,0,'Gi&uacute;p l&agrave;m giảm qu&aacute; tr&igrave;nh l&atilde;o h&oacute;a da của tuổi trung ni&ecirc;n.<br />X&oacute;a mờ đi tất cả vết th&acirc;m v&agrave; vết nhăn dưới v&ugrave;ng mắt.<br />C&acirc;n bằng độ ẩm cho da v&agrave; se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng.<br />Sản phẩm tốt cho da dầu v&agrave; da kh&ocirc;.','<p>- Trước khi đi ngủ 10 ph&uacute;t, rửa mặt bằng nước ấm, lau cho vừa kh&ocirc;. Sau đ&oacute; massage thật nhẹ l&ecirc;n da mặt cho đều, tạo cho l&agrave;n da c&oacute; sự đ&agrave;n hồi sẽ gi&uacute;p cho da hấp thụ nhanh c&aacute;c chất dưỡng từ trong th&agrave;nh phần của kem.<br />- Rửa mặt lại bằng nước lạnh, lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng l&ecirc;n tr&ecirc;n mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Độ tuổi từ 35 tuổi trở l&ecirc;n, bạn n&ecirc;n ăn uống theo một chế độ hợp l&yacute;, khoa học.N&ecirc;n uống nhiều nước lọc, ki&ecirc;ng ăn đồ n&oacute;ng, kh&ocirc;ng thức qu&aacute; khua<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',168,'products/laohoada(tron).jpg',NULL,NULL),(16,'Kem trắng da 10 trong 1 (kem khô)',4,0,'L&agrave;m trắng s&aacute;ng da nhanh ch&oacute;ng.<br />Nu&ocirc;i dưỡng cho da trắng hồng tự nhi&ecirc;n.<br />Độ chống nắng SPF 30.','<p>- Trước khi đi ngủ 10 ph&uacute;t, rửa mặt bằng nước ấm, lau cho vừa kh&ocirc;. Sau đ&oacute; massage thật nhẹ l&ecirc;n da mặt cho đều, tạo cho l&agrave;n da c&oacute; sự đ&agrave;n hồi sẽ gi&uacute;p cho da hấp thụ nhanh c&aacute;c chất dưỡng từ trong th&agrave;nh phần của kem.<br />- Rửa mặt lại bằng nước lạnh, lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng l&ecirc;n tr&ecirc;n mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Bạn n&ecirc;n sử dụng sản phẩm trọn bộ để c&oacute; được một kết quả như &yacute;.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',298,'products/10in1(vuong).jpg',NULL,NULL),(17,'Kem trắng da 10 trong 1 (kem nhão)',4,0,'L&agrave;m trắng s&aacute;ng da nhanh ch&oacute;ng.<br />C&acirc;n bằng độ ẩm cho da v&agrave; se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng.<br />Nu&ocirc;i dưỡng cho da trắng hồng tự nhi&ecirc;n.<br />Sản phẩm tốt cho da dầu v&agrave; da kh&ocirc;.','<p>- Trước khi đi ngủ 10 ph&uacute;t, rửa mặt bằng nước ấm, lau cho vừa kh&ocirc;. Sau đ&oacute; massage thật nhẹ l&ecirc;n da mặt cho đều, tạo cho l&agrave;n da c&oacute; sự đ&agrave;n hồi sẽ gi&uacute;p cho da hấp thụ nhanh c&aacute;c chất dưỡng từ trong th&agrave;nh phần của kem.<br />- Rửa mặt lại bằng nước lạnh, lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng l&ecirc;n tr&ecirc;n mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da, v&agrave; sữa rửa mặt.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',162,'products/10in1(tron).jpg',NULL,NULL),(18,'Kem trắng da 10 trong 1 (bộ)',4,0,'L&agrave;m trắng s&aacute;ng da nhanh ch&oacute;ng.<br />C&acirc;n bằng độ ẩm cho da v&agrave; se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng.<br />Nu&ocirc;i dưỡng cho da trắng hồng tự nhi&ecirc;n.<br />Sản phẩm tốt cho da dầu v&agrave; da kh&ocirc;.<br />Độ chống nắng SPF 30.','<p>- Trước khi đi ngủ 10 ph&uacute;t, rửa mặt bằng nước ấm, lau cho vừa kh&ocirc;. Sau đ&oacute; massage thật nhẹ l&ecirc;n da mặt cho đều, tạo cho l&agrave;n da c&oacute; sự đ&agrave;n hồi sẽ gi&uacute;p cho da hấp thụ nhanh c&aacute;c chất dưỡng từ trong th&agrave;nh phần của kem.<br />- Rửa mặt lại bằng nước lạnh, lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng l&ecirc;n tr&ecirc;n mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Bạn n&ecirc;n sử dụng sản phẩm trọn bộ để c&oacute; được một kết quả như &yacute;.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',360,'products/10in1(bo).jpg',NULL,NULL),(19,'Kem dưỡng trắng phục hồi da (kem khô)',4,0,'Phục hồi, nu&ocirc;i dưỡng c&aacute;c l&agrave;n da bị hư, da kh&ocirc; do sử dụng c&aacute;c sản phẩm c&oacute; nhiều chất tẩy.<br />C&acirc;n bằng độ ẩm cho da v&agrave; se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng.<br />Nu&ocirc;i dưỡng cho da nhanh ch&oacute;ng trắng mịn trở lại.<br />Độ chống nắng SPF 30.','<p>- Trước khi đi ngủ 10 ph&uacute;t, rửa mặt bằng nước ấm, lau cho vừa kh&ocirc;. Sau đ&oacute; massage thật nhẹ l&ecirc;n da mặt cho đều, tạo cho l&agrave;n da c&oacute; sự đ&agrave;n hồi sẽ gi&uacute;p cho da hấp thụ nhanh c&aacute;c chất dưỡng từ trong th&agrave;nh phần của kem.<br />- Rửa mặt lại bằng nước lạnh, lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng l&ecirc;n tr&ecirc;n mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Bạn n&ecirc;n sử dụng sản phẩm trọn bộ để c&oacute; được một kết quả như &yacute;.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ đị<br />- Đậy nắp cho k&iacute;n sau khi sử dụng.</p>',298,'products/phuchoida(vuong).jpg',NULL,NULL),(20,'Kem dưỡng trắng phục hồi da (kem nhão)',4,0,'Phục hồi, nu&ocirc;i dưỡng c&aacute;c l&agrave;n da bị hư, da kh&ocirc; do sử dụng cac sản phẩm c&oacute; nhiều chất tẩy.<br />C&acirc;n bằng độ ẩm cho da v&agrave; se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng.<br />Nu&ocirc;i dưỡng cho da nhanh ch&oacute;ng trắng mịn trở lại.<br />Sản phẩm tốt cho da dầu v&agrave; da kh&ocirc;.','<p>- Trước khi đi ngủ 10 ph&uacute;t, rửa mặt bằng nước ấm, lau cho vừa kh&ocirc;. Sau đ&oacute; massage thật nhẹ l&ecirc;n da mặt cho đều, tạo cho l&agrave;n da c&oacute; sự đ&agrave;n hồi sẽ gi&uacute;p cho da hấp thụ nhanh c&aacute;c chất dưỡng từ trong th&agrave;nh phần của kem.<br />- Rửa mặt lại bằng nước lạnh, lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng l&ecirc;n tr&ecirc;n mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da, v&agrave; sữa rửa mặt.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ định.</p>',158,'products/phuchoida(tron).jpg',NULL,NULL),(21,'Kem dưỡng trắng phục hồi da (bộ)',4,0,'Phục hồi, nu&ocirc;i dưỡng c&aacute;c l&agrave;n da bị hư, da kh&ocirc; do sử dụng cac sản phẩm c&oacute; nhiều chất tẩy.<br />C&acirc;n bằng độ ẩm cho da v&agrave; se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng.<br />Nu&ocirc;i dưỡng cho da nhanh ch&oacute;ng trắng mịn trở lại.<br />Sản phẩm tốt cho da dầu v&agrave; da kh&ocirc;.<br />Độ chống nắng SPF 30.','<p>- Trước khi đi ngủ 10 ph&uacute;t, rửa mặt bằng nước ấm, lau cho vừa kh&ocirc;. Sau đ&oacute; massage thật nhẹ l&ecirc;n da mặt cho đều, tạo cho l&agrave;n da c&oacute; sự đ&agrave;n hồi sẽ gi&uacute;p cho da hấp thụ nhanh c&aacute;c chất dưỡng từ trong th&agrave;nh phần của kem.<br />- Rửa mặt lại bằng nước lạnh, lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng l&ecirc;n tr&ecirc;n mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Bạn n&ecirc;n sử dụng sản phẩm trọn bộ để c&oacute; được một kết quả như &yacute;.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ đị<br />- Đậy nắp cho k&iacute;n sau khi sử dụng.</p>',346,'products/phuchoida(bo).jpg',NULL,NULL),(22,'Kem loại bỏ tế bào chết (kem khô)',4,0,'Loại bỏ đi c&aacute;c tế b&agrave;o chết tr&ecirc;n da mặt, c&aacute;c vết n&aacute;m l&acirc;u năm.<br />C&aacute;c loại da kh&ocirc;, d&agrave;y sẽ nhanh ch&oacute;ng trắng s&aacute;ng, mịn m&agrave;ng trở lại.<br />Độ chống nắng SPF 30.','<p>- Trước khi đi ngủ 10 ph&uacute;t, rửa mặt bằng nước ấm, lau cho vừa kh&ocirc;. Sau đ&oacute; massage thật nhẹ l&ecirc;n da mặt cho đều, tạo cho l&agrave;n da c&oacute; sự đ&agrave;n hồi sẽ gi&uacute;p cho da hấp thụ nhanh c&aacute;c chất dưỡng từ trong th&agrave;nh phần của kem.<br />- Rửa mặt lại bằng nước lạnh, lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng l&ecirc;n tr&ecirc;n mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Bạn n&ecirc;n sử dụng sản phẩm trọn bộ để c&oacute; được một kết quả như &yacute;.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ đị<br />- Đậy nắp cho k&iacute;n sau khi sử dụng.</p>',298,'products/tebaochet(vuong).jpg',NULL,NULL),(23,'Kem loại bỏ tế bào chết (kem nhão)',4,0,'Loại bỏ đi c&aacute;c tế b&agrave;o chết tr&ecirc;n da mặt, c&aacute;c vết n&aacute;m l&acirc;u năm.<br />C&aacute;c loại da kh&ocirc;, d&agrave;y sẽ nhanh ch&oacute;ng trắng s&aacute;ng, mịn m&agrave;ng trở lại.<br />C&acirc;n bằng độ ẩm cho da v&agrave; se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng.<br />Sản phẩm tốt cho da dầu v&agrave; da kh&ocirc;.','<p>- Trước khi đi ngủ 10 ph&uacute;t, rửa mặt bằng nước ấm, lau cho vừa kh&ocirc;. Sau đ&oacute; massage thật nhẹ l&ecirc;n da mặt cho đều, tạo cho l&agrave;n da c&oacute; sự đ&agrave;n hồi sẽ gi&uacute;p cho da hấp thụ nhanh c&aacute;c chất dưỡng từ trong th&agrave;nh phần của kem.<br />- Rửa mặt lại bằng nước lạnh, lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng l&ecirc;n tr&ecirc;n mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Bạn n&ecirc;n sử dụng sản phẩm trọn bộ để c&oacute; được một kết quả như &yacute;.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ đị<br />- Đậy nắp cho k&iacute;n sau khi sử dụng.</p>',168,'products/tebaochet(tron).jpg',NULL,NULL),(24,'Kem loại bỏ tế bào chết (bộ)',4,0,'Loại bỏ đi c&aacute;c tế b&agrave;o chết tr&ecirc;n da mặt, c&aacute;c vết n&aacute;m l&acirc;u năm.<br />C&aacute;c loại da kh&ocirc;, d&agrave;y sẽ nhanh ch&oacute;ng trắng s&aacute;ng, mịn m&agrave;ng trở lại.<br />C&acirc;n bằng độ ẩm cho da v&agrave; se kh&iacute;t lỗ ch&acirc;n l&ocirc;ng.<br />Sản phẩm tốt cho da dầu v&agrave; da kh&ocirc;.<br />Độ chống nắng SPF 30.','<p>- Trước khi đi ngủ 10 ph&uacute;t, rửa mặt bằng nước ấm, lau cho vừa kh&ocirc;. Sau đ&oacute; massage thật nhẹ l&ecirc;n da mặt cho đều, tạo cho l&agrave;n da c&oacute; sự đ&agrave;n hồi sẽ gi&uacute;p cho da hấp thụ nhanh c&aacute;c chất dưỡng từ trong th&agrave;nh phần của kem.<br />- Rửa mặt lại bằng nước lạnh, lau cho vừa kh&ocirc;, thoa 1 lớp kem thật mỏng l&ecirc;n tr&ecirc;n mặt (ng&agrave;y 2 lần s&aacute;ng v&agrave; tối).</p>','<p>- Sản phẩm kh&ocirc;ng ăn nắng với nhiệt độ từ 30&deg;C trở xuống<br />- Khi đi ra ngo&agrave;i với nhiệt độ qu&aacute; cao, bạn n&ecirc;n sử dụng th&ecirc;m 1 &iacute;t phấn phủ nhẹ b&ecirc;n ngo&agrave;i da.<br />- Bạn n&ecirc;n sử dụng sản phẩm trọn bộ để c&oacute; được một kết quả như &yacute;.<br />- Kh&ocirc;ng n&ecirc;n sử dụng th&ecirc;m c&aacute;c loại sản phẩm c&oacute; nhiều chất tẩy da.<br />- Vui l&ograve;ng li&ecirc;n hệ với c&ocirc;ng ty nếu c&oacute; thắc mắc trong qu&aacute; tr&igrave;nh sử dụng sản phẩm.<br />- Kh&ocirc;ng sử dụng qu&aacute; liều chỉ đị<br />- Đậy nắp cho k&iacute;n sau khi sử dụng.</p>',366,'products/tebaochet(bo).jpg',NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20160311065508'),('20160315095051'),('20160318041537'),('20160319045934'),('20160331061438'),('20160331062032'),('20160401073311'),('20160412064314'),('20160413062541'),('20160413063616'),('20160414080618'),('20160415105641'),('20160422091154'),('20160426094257');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `price` int(11) DEFAULT NULL,
  `is_displayed` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `simple_captcha_data`
--

DROP TABLE IF EXISTS `simple_captcha_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simple_captcha_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(40) DEFAULT NULL,
  `value` varchar(6) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_key` (`key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `simple_captcha_data`
--

LOCK TABLES `simple_captcha_data` WRITE;
/*!40000 ALTER TABLE `simple_captcha_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `simple_captcha_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_services`
--

DROP TABLE IF EXISTS `type_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_services`
--

LOCK TABLES `type_services` WRITE;
/*!40000 ALTER TABLE `type_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `kind` varchar(255) DEFAULT NULL,
  `is_displayed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Mụn','product',1),(2,'Trắng mặt','product',1),(3,'Nám','product',1),(4,'Cao cấp','product',1),(5,'Những loại khác','product',1);
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`) USING BTREE,
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
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

-- Dump completed on 2016-08-17 11:29:35
