-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: qlthuvien
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
-- Table structure for table `bangcap`
--

DROP TABLE IF EXISTS `bangcap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bangcap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenbangcap` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bangcap`
--

LOCK TABLES `bangcap` WRITE;
/*!40000 ALTER TABLE `bangcap` DISABLE KEYS */;
/*!40000 ALTER TABLE `bangcap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baocaoctmuontheotheloai`
--

DROP TABLE IF EXISTS `baocaoctmuontheotheloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `baocaoctmuontheotheloai` (
  `baocaomuontheotheloai_id` int(11) NOT NULL,
  `theloai_id` int(11) NOT NULL,
  `tentheloai` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soluotmuon` int(11) DEFAULT NULL,
  `tile` float NOT NULL,
  PRIMARY KEY (`baocaomuontheotheloai_id`,`theloai_id`),
  KEY `theloai_id` (`theloai_id`),
  CONSTRAINT `baocaoctmuontheotheloai_ibfk_1` FOREIGN KEY (`baocaomuontheotheloai_id`) REFERENCES `baocaomuontheotheloai` (`id`),
  CONSTRAINT `baocaoctmuontheotheloai_ibfk_2` FOREIGN KEY (`theloai_id`) REFERENCES `theloai` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baocaoctmuontheotheloai`
--

LOCK TABLES `baocaoctmuontheotheloai` WRITE;
/*!40000 ALTER TABLE `baocaoctmuontheotheloai` DISABLE KEYS */;
/*!40000 ALTER TABLE `baocaoctmuontheotheloai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baocaoctnotienphat`
--

DROP TABLE IF EXISTS `baocaoctnotienphat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `baocaoctnotienphat` (
  `baocaonotienphat_id` int(11) NOT NULL,
  `thedocgia_id` int(11) NOT NULL,
  `tendocgia` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tienno` int(11) NOT NULL,
  PRIMARY KEY (`baocaonotienphat_id`,`thedocgia_id`),
  KEY `thedocgia_id` (`thedocgia_id`),
  CONSTRAINT `baocaoctnotienphat_ibfk_1` FOREIGN KEY (`baocaonotienphat_id`) REFERENCES `baocaonotienphat` (`id`),
  CONSTRAINT `baocaoctnotienphat_ibfk_2` FOREIGN KEY (`thedocgia_id`) REFERENCES `thedocgia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baocaoctnotienphat`
--

LOCK TABLES `baocaoctnotienphat` WRITE;
/*!40000 ALTER TABLE `baocaoctnotienphat` DISABLE KEYS */;
/*!40000 ALTER TABLE `baocaoctnotienphat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baocaoctsachtratre`
--

DROP TABLE IF EXISTS `baocaoctsachtratre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `baocaoctsachtratre` (
  `baocaosachtratre_id` int(11) NOT NULL,
  `sach_id` int(11) NOT NULL,
  `tensach` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaymuon` datetime NOT NULL,
  `songaytratre` int(11) NOT NULL,
  PRIMARY KEY (`baocaosachtratre_id`,`sach_id`),
  KEY `sach_id` (`sach_id`),
  CONSTRAINT `baocaoctsachtratre_ibfk_1` FOREIGN KEY (`baocaosachtratre_id`) REFERENCES `baocaosachtratre` (`id`),
  CONSTRAINT `baocaoctsachtratre_ibfk_2` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baocaoctsachtratre`
--

LOCK TABLES `baocaoctsachtratre` WRITE;
/*!40000 ALTER TABLE `baocaoctsachtratre` DISABLE KEYS */;
/*!40000 ALTER TABLE `baocaoctsachtratre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baocaomuontheotheloai`
--

DROP TABLE IF EXISTS `baocaomuontheotheloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `baocaomuontheotheloai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thang` int(11) NOT NULL,
  `tongluotmuon` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baocaomuontheotheloai`
--

LOCK TABLES `baocaomuontheotheloai` WRITE;
/*!40000 ALTER TABLE `baocaomuontheotheloai` DISABLE KEYS */;
/*!40000 ALTER TABLE `baocaomuontheotheloai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baocaonotienphat`
--

DROP TABLE IF EXISTS `baocaonotienphat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `baocaonotienphat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ngay` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baocaonotienphat`
--

LOCK TABLES `baocaonotienphat` WRITE;
/*!40000 ALTER TABLE `baocaonotienphat` DISABLE KEYS */;
/*!40000 ALTER TABLE `baocaonotienphat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baocaosachtratre`
--

DROP TABLE IF EXISTS `baocaosachtratre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `baocaosachtratre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ngay` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baocaosachtratre`
--

LOCK TABLES `baocaosachtratre` WRITE;
/*!40000 ALTER TABLE `baocaosachtratre` DISABLE KEYS */;
/*!40000 ALTER TABLE `baocaosachtratre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bophan`
--

DROP TABLE IF EXISTS `bophan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `bophan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenbophan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bophan`
--

LOCK TABLES `bophan` WRITE;
/*!40000 ALTER TABLE `bophan` DISABLE KEYS */;
/*!40000 ALTER TABLE `bophan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chucvu`
--

DROP TABLE IF EXISTS `chucvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chucvu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenchucvu` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chucvu`
--

LOCK TABLES `chucvu` WRITE;
/*!40000 ALTER TABLE `chucvu` DISABLE KEYS */;
/*!40000 ALTER TABLE `chucvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctphieumuonsach`
--

DROP TABLE IF EXISTS `ctphieumuonsach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ctphieumuonsach` (
  `phieumuon_id` int(11) NOT NULL,
  `sach_id` int(11) NOT NULL,
  PRIMARY KEY (`phieumuon_id`,`sach_id`),
  KEY `sach_id` (`sach_id`),
  CONSTRAINT `ctphieumuonsach_ibfk_1` FOREIGN KEY (`phieumuon_id`) REFERENCES `phieumuonsach` (`id`),
  CONSTRAINT `ctphieumuonsach_ibfk_2` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctphieumuonsach`
--

LOCK TABLES `ctphieumuonsach` WRITE;
/*!40000 ALTER TABLE `ctphieumuonsach` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctphieumuonsach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ctphieutrasach`
--

DROP TABLE IF EXISTS `ctphieutrasach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ctphieutrasach` (
  `phieutra_id` int(11) NOT NULL,
  `sach_id` int(11) NOT NULL,
  `tinhtrang` int(11) NOT NULL,
  `songaymuon` int(11) NOT NULL,
  `tienphat` int(11) NOT NULL,
  PRIMARY KEY (`phieutra_id`,`sach_id`),
  KEY `sach_id` (`sach_id`),
  CONSTRAINT `ctphieutrasach_ibfk_1` FOREIGN KEY (`phieutra_id`) REFERENCES `phieutrasach` (`id`),
  CONSTRAINT `ctphieutrasach_ibfk_2` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ctphieutrasach`
--

LOCK TABLES `ctphieutrasach` WRITE;
/*!40000 ALTER TABLE `ctphieutrasach` DISABLE KEYS */;
/*!40000 ALTER TABLE `ctphieutrasach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ghinhanmatsach`
--

DROP TABLE IF EXISTS `ghinhanmatsach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ghinhanmatsach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sach_id` int(11) DEFAULT NULL,
  `ngayghinhan` datetime DEFAULT NULL,
  `thedocgia_id` int(11) DEFAULT NULL,
  `tienphat` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sach_id` (`sach_id`),
  KEY `thedocgia_id` (`thedocgia_id`),
  CONSTRAINT `ghinhanmatsach_ibfk_1` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`id`),
  CONSTRAINT `ghinhanmatsach_ibfk_2` FOREIGN KEY (`thedocgia_id`) REFERENCES `thedocgia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ghinhanmatsach`
--

LOCK TABLES `ghinhanmatsach` WRITE;
/*!40000 ALTER TABLE `ghinhanmatsach` DISABLE KEYS */;
/*!40000 ALTER TABLE `ghinhanmatsach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaidocgia`
--

DROP TABLE IF EXISTS `loaidocgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `loaidocgia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tenloaidocgia` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaidocgia`
--

LOCK TABLES `loaidocgia` WRITE;
/*!40000 ALTER TABLE `loaidocgia` DISABLE KEYS */;
/*!40000 ALTER TABLE `loaidocgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nhanvien` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hoten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaysinh` datetime NOT NULL,
  `diachi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dienthoai` int(11) NOT NULL,
  `bophan_id` int(11) NOT NULL,
  `bangcap_id` int(11) NOT NULL,
  `chucvu_id` int(11) NOT NULL,
  `creator_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bophan_id` (`bophan_id`),
  KEY `bangcap_id` (`bangcap_id`),
  KEY `chucvu_id` (`chucvu_id`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `nhanvien_ibfk_1` FOREIGN KEY (`bophan_id`) REFERENCES `bophan` (`id`),
  CONSTRAINT `nhanvien_ibfk_2` FOREIGN KEY (`bangcap_id`) REFERENCES `bangcap` (`id`),
  CONSTRAINT `nhanvien_ibfk_3` FOREIGN KEY (`chucvu_id`) REFERENCES `chucvu` (`id`),
  CONSTRAINT `nhanvien_ibfk_4` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieumuonsach`
--

DROP TABLE IF EXISTS `phieumuonsach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `phieumuonsach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thedocgia_id` int(11) DEFAULT NULL,
  `ngaymuon` datetime DEFAULT NULL,
  `ngaytra` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `thedocgia_id` (`thedocgia_id`),
  CONSTRAINT `phieumuonsach_ibfk_1` FOREIGN KEY (`thedocgia_id`) REFERENCES `thedocgia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieumuonsach`
--

LOCK TABLES `phieumuonsach` WRITE;
/*!40000 ALTER TABLE `phieumuonsach` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieumuonsach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieuthutienphat`
--

DROP TABLE IF EXISTS `phieuthutienphat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `phieuthutienphat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tienno` int(11) NOT NULL,
  `tienthu` int(11) NOT NULL,
  `tienconlai` int(11) NOT NULL,
  `thedocgia_id` int(11) DEFAULT NULL,
  `phieutra_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `thedocgia_id` (`thedocgia_id`),
  KEY `phieutra_id` (`phieutra_id`),
  CONSTRAINT `phieuthutienphat_ibfk_1` FOREIGN KEY (`thedocgia_id`) REFERENCES `thedocgia` (`id`),
  CONSTRAINT `phieuthutienphat_ibfk_2` FOREIGN KEY (`phieutra_id`) REFERENCES `phieutrasach` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieuthutienphat`
--

LOCK TABLES `phieuthutienphat` WRITE;
/*!40000 ALTER TABLE `phieuthutienphat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieuthutienphat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieutrasach`
--

DROP TABLE IF EXISTS `phieutrasach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `phieutrasach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phieumuon_id` int(11) DEFAULT NULL,
  `thedocgia_id` int(11) DEFAULT NULL,
  `ngaytra` datetime DEFAULT NULL,
  `tienphat` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `phieumuon_id` (`phieumuon_id`),
  KEY `thedocgia_id` (`thedocgia_id`),
  CONSTRAINT `phieutrasach_ibfk_1` FOREIGN KEY (`phieumuon_id`) REFERENCES `phieumuonsach` (`id`),
  CONSTRAINT `phieutrasach_ibfk_2` FOREIGN KEY (`thedocgia_id`) REFERENCES `thedocgia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieutrasach`
--

LOCK TABLES `phieutrasach` WRITE;
/*!40000 ALTER TABLE `phieutrasach` DISABLE KEYS */;
/*!40000 ALTER TABLE `phieutrasach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sach`
--

DROP TABLE IF EXISTS `sach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tensach` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `namxb` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nhaxb` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tacgia` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaynhap` datetime DEFAULT NULL,
  `trigia` int(11) DEFAULT NULL,
  `tinhtrang` tinyint(1) DEFAULT NULL,
  `theloai_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `theloai_id` (`theloai_id`),
  CONSTRAINT `sach_ibfk_1` FOREIGN KEY (`theloai_id`) REFERENCES `theloai` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sach`
--

LOCK TABLES `sach` WRITE;
/*!40000 ALTER TABLE `sach` DISABLE KEYS */;
/*!40000 ALTER TABLE `sach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thanhlysach`
--

DROP TABLE IF EXISTS `thanhlysach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `thanhlysach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ngaythanhly` datetime DEFAULT NULL,
  `sach_id` int(11) DEFAULT NULL,
  `lydo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sach_id` (`sach_id`),
  CONSTRAINT `thanhlysach_ibfk_1` FOREIGN KEY (`sach_id`) REFERENCES `sach` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanhlysach`
--

LOCK TABLES `thanhlysach` WRITE;
/*!40000 ALTER TABLE `thanhlysach` DISABLE KEYS */;
/*!40000 ALTER TABLE `thanhlysach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thedocgia`
--

DROP TABLE IF EXISTS `thedocgia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `thedocgia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hoten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `diachi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngaysinh` datetime NOT NULL,
  `ngaylapthe` datetime DEFAULT NULL,
  `loaidocgia_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `loaidocgia_id` (`loaidocgia_id`),
  CONSTRAINT `thedocgia_ibfk_1` FOREIGN KEY (`loaidocgia_id`) REFERENCES `loaidocgia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thedocgia`
--

LOCK TABLES `thedocgia` WRITE;
/*!40000 ALTER TABLE `thedocgia` DISABLE KEYS */;
/*!40000 ALTER TABLE `thedocgia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theloai`
--

DROP TABLE IF EXISTS `theloai`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `theloai` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theloai`
--

LOCK TABLES `theloai` WRITE;
/*!40000 ALTER TABLE `theloai` DISABLE KEYS */;
/*!40000 ALTER TABLE `theloai` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `use_role` enum('ADMIN','ThuThu','THuKho','ThuQuy') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-11 23:19:55
