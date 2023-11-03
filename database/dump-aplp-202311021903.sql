-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (arm64)
--
-- Host: 117.53.46.125    Database: aplp
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.20.04.1

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
-- Table structure for table `level`
--

DROP TABLE IF EXISTS `level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `level` (
  `id_level` int NOT NULL AUTO_INCREMENT,
  `nama_level` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
INSERT INTO `level` VALUES (1,'admin'),(2,'petugas'),(3,'pelanggan');
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_pembayaran`
--

DROP TABLE IF EXISTS `log_pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_pembayaran` (
  `id_log_pembayaran` int NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int DEFAULT NULL,
  `total_bayar` double DEFAULT NULL,
  `tanggal_pembayaran` datetime DEFAULT NULL,
  `id_tagihan` int DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id_log_pembayaran`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_pembayaran`
--

LOCK TABLES `log_pembayaran` WRITE;
/*!40000 ALTER TABLE `log_pembayaran` DISABLE KEYS */;
INSERT INTO `log_pembayaran` VALUES (1,38,200,'2023-11-02 14:44:13',5,1),(2,38,122000,'2023-11-02 14:44:50',5,1),(3,38,122000,'2023-11-02 17:44:21',5,1),(4,38,122000,'2023-11-02 17:47:48',5,1);
/*!40000 ALTER TABLE `log_pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pelanggan`
--

DROP TABLE IF EXISTS `pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pelanggan` (
  `id_pelanggan` int NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nomor_kwh` varchar(12) DEFAULT NULL,
  `nama_pelanggan` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `alamat` text,
  `id_tarif` int DEFAULT NULL,
  `saldo` double DEFAULT NULL,
  PRIMARY KEY (`id_pelanggan`),
  KEY `pelanggan_FK` (`id_tarif`),
  KEY `idx_nama_pelanggan` (`nama_pelanggan`),
  CONSTRAINT `pelanggan_FK` FOREIGN KEY (`id_tarif`) REFERENCES `tarif` (`id_tarif`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
INSERT INTO `pelanggan` VALUES (21,'Ramdan','','025180150800','Muhammad Ramdan','Ciaiw',4,0),(22,'','','025180150857','Zidun','Bogor',3,47000),(23,'','','025180150804','Syamsul Hidayatullah','Bandung',5,0),(24,'','','025180151645','Muhammad romi','Sukabirus',8,0),(25,'','','027180171426','Fajar Firdaus','Tajur',5,0),(26,'','','027180171449','Muhamad Segafi Kurniawan','Cibogo',4,0),(27,'','','027180171430','Muhammad Junaedi','Pasir Muncang',8,0),(28,'','','027180171444','Muhammad Nur Alfi','Tajur',4,0),(29,'','','027180171436','Ramadhan Yoga Pratam','Cengkareng, Jakarta',4,0),(30,'','','027180171409','Rizaldy Sukma Perkasa','Ciawi',4,0),(31,'','','028180111311','Muhammad ','Ciawi',8,0),(32,'','','028180111350','Alwi Gunawan','Cireketeg',4,0),(33,'','','029180121647','Muhammmad zidun','Ciawi',4,0),(34,'','','030180130851','Zainul Fahri','Ciawi',3,0),(35,'','','031180240927','Ari Aliansyah','gadog',3,0),(38,'Satrio','$2b$10$5aQORb7vtgq7Bzr6jkwxe.wj1ieFkjSCepZUlL6Q/jz7FYX7JNliK','123','ranbda','sss',1,269000);
/*!40000 ALTER TABLE `pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pembayaran`
--

DROP TABLE IF EXISTS `pembayaran`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pembayaran` (
  `id_pembayaran` int NOT NULL AUTO_INCREMENT,
  `id_tagihan` int DEFAULT NULL,
  `id_pelanggan` int DEFAULT NULL,
  `tanggal_pembayaran` datetime DEFAULT NULL,
  `bulan_bayar` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `total_bayar` double DEFAULT NULL,
  `id_user` int DEFAULT NULL,
  PRIMARY KEY (`id_pembayaran`),
  KEY `pembayaran_FK` (`id_user`),
  KEY `pembayaran_FK_1` (`id_tagihan`),
  KEY `pembayaran_FK_2` (`id_pelanggan`),
  CONSTRAINT `pembayaran_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `pembayaran_FK_1` FOREIGN KEY (`id_tagihan`) REFERENCES `tagihan` (`id_tagihan`),
  CONSTRAINT `pembayaran_FK_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayaran`
--

LOCK TABLES `pembayaran` WRITE;
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`serkom`@`%`*/ /*!50003 TRIGGER `pembayaran_AFTER_INSERT` AFTER INSERT ON `pembayaran` FOR EACH ROW BEGIN
 -- Lakukan tindakan yang Anda inginkan, seperti logging ke tabel log_pembayaran
    INSERT INTO log_pembayaran (id_pelanggan, id_tagihan, total_bayar, tanggal_pembayaran, id_user)
    VALUES (NEW.id_pelanggan, NEW.id_tagihan, NEW.total_bayar, NEW.tanggal_pembayaran, NEW.id_user);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `penggunaan`
--

DROP TABLE IF EXISTS `penggunaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penggunaan` (
  `id_penggunaan` int NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int DEFAULT NULL,
  `bulan` datetime DEFAULT NULL,
  `tahun` datetime DEFAULT NULL,
  `meter_awal` int DEFAULT NULL,
  `meter_akhir` int DEFAULT NULL,
  PRIMARY KEY (`id_penggunaan`),
  KEY `penggunaan_FK` (`id_pelanggan`),
  CONSTRAINT `penggunaan_FK` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penggunaan`
--

LOCK TABLES `penggunaan` WRITE;
/*!40000 ALTER TABLE `penggunaan` DISABLE KEYS */;
INSERT INTO `penggunaan` VALUES (95,38,'2023-11-02 00:00:00','2023-11-02 00:00:00',99,177),(96,22,'2023-11-02 00:00:00','2023-11-02 00:00:00',91,56),(97,34,'2023-11-02 00:00:00','2023-11-02 00:00:00',52,463),(98,35,'2023-11-02 00:00:00','2023-11-02 00:00:00',74,309),(99,21,'2023-11-02 00:00:00','2023-11-02 00:00:00',32,711),(100,26,'2023-11-02 00:00:00','2023-11-02 00:00:00',57,722),(101,28,'2023-11-02 00:00:00','2023-11-02 00:00:00',89,329),(102,29,'2023-11-02 00:00:00','2023-11-02 00:00:00',95,763),(103,30,'2023-11-02 00:00:00','2023-11-02 00:00:00',96,543),(104,32,'2023-11-02 00:00:00','2023-11-02 00:00:00',81,456),(105,33,'2023-11-02 00:00:00','2023-11-02 00:00:00',83,786),(106,23,'2023-11-02 00:00:00','2023-11-02 00:00:00',43,829),(107,25,'2023-11-02 00:00:00','2023-11-02 00:00:00',83,674),(108,24,'2023-11-02 00:00:00','2023-11-02 00:00:00',87,360),(109,27,'2023-11-02 00:00:00','2023-11-02 00:00:00',17,776),(110,31,'2023-11-02 00:00:00','2023-11-02 00:00:00',36,509);
/*!40000 ALTER TABLE `penggunaan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tagihan`
--

DROP TABLE IF EXISTS `tagihan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tagihan` (
  `id_tagihan` int NOT NULL AUTO_INCREMENT,
  `id_penggunaan` int NOT NULL,
  `id_pelanggan` int NOT NULL,
  `bulan` int DEFAULT NULL,
  `tahun` year DEFAULT NULL,
  `jumlah_meter` int DEFAULT NULL,
  `status` enum('Lunas','Belum Lunas') DEFAULT 'Belum Lunas',
  `jumlah_tagihan` double DEFAULT NULL,
  PRIMARY KEY (`id_tagihan`),
  KEY `tagihan_FK` (`id_penggunaan`),
  KEY `tagihan_FK_1` (`id_pelanggan`),
  CONSTRAINT `tagihan_FK` FOREIGN KEY (`id_penggunaan`) REFERENCES `penggunaan` (`id_penggunaan`),
  CONSTRAINT `tagihan_FK_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagihan`
--

LOCK TABLES `tagihan` WRITE;
/*!40000 ALTER TABLE `tagihan` DISABLE KEYS */;
INSERT INTO `tagihan` VALUES (7,95,38,11,2023,78,'Belum Lunas',78000);
/*!40000 ALTER TABLE `tagihan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarif`
--

DROP TABLE IF EXISTS `tarif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarif` (
  `id_tarif` int NOT NULL AUTO_INCREMENT,
  `daya` int DEFAULT NULL,
  `tarifperkwh` double DEFAULT NULL,
  PRIMARY KEY (`id_tarif`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarif`
--

LOCK TABLES `tarif` WRITE;
/*!40000 ALTER TABLE `tarif` DISABLE KEYS */;
INSERT INTO `tarif` VALUES (1,450,1000),(2,900,1500),(3,450,750),(4,900,1500),(5,1500,2000),(6,900,1400),(7,450,1000),(8,1300,1500);
/*!40000 ALTER TABLE `tarif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nama_admin` varchar(200) DEFAULT NULL,
  `id_level` int DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `user_FK` (`id_level`),
  KEY `idx_nama_admin` (`nama_admin`),
  CONSTRAINT `user_FK` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2b$10$qy/U6ner.5dwP4nkWXW92.mxuBcHyTVzR6K6EZQQ4j4Hd7fJ/BIBy','admin',1),(2,'petugas','$2b$10$aEbI5I3WcM1/TG.HpztxeObB.uNNnb4dOA87waFdPPgdgAlOMWehy','petugas',2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_pembayaran_pelanggan`
--

DROP TABLE IF EXISTS `view_pembayaran_pelanggan`;
/*!50001 DROP VIEW IF EXISTS `view_pembayaran_pelanggan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_pembayaran_pelanggan` AS SELECT 
 1 AS `id_pembayaran`,
 1 AS `tanggal_pembayaran`,
 1 AS `total_bayar`,
 1 AS `id_pelanggan`,
 1 AS `nama_pelanggan`,
 1 AS `nomor_kwh`,
 1 AS `id_tagihan`,
 1 AS `jumlah_meter`,
 1 AS `jumlah_tagihan`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_tagihan_pelanggan`
--

DROP TABLE IF EXISTS `view_tagihan_pelanggan`;
/*!50001 DROP VIEW IF EXISTS `view_tagihan_pelanggan`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_tagihan_pelanggan` AS SELECT 
 1 AS `id_pelanggan`,
 1 AS `nama_pelanggan`,
 1 AS `nomor_kwh`,
 1 AS `id_penggunaan`,
 1 AS `meter_awal`,
 1 AS `meter_akhir`,
 1 AS `id_tagihan`,
 1 AS `bulan`,
 1 AS `tahun`,
 1 AS `jumlah_meter`,
 1 AS `jumlah_tagihan`,
 1 AS `status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_user_level`
--

DROP TABLE IF EXISTS `view_user_level`;
/*!50001 DROP VIEW IF EXISTS `view_user_level`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_user_level` AS SELECT 
 1 AS `username`,
 1 AS `nama_admin`,
 1 AS `id_level`,
 1 AS `user_level`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'aplp'
--
/*!50003 DROP FUNCTION IF EXISTS `hitung_total_meter_satu_tahun` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`serkom`@`%` FUNCTION `hitung_total_meter_satu_tahun`(id_pelanggan INT, tahun INT) RETURNS double
BEGIN
 DECLARE total_meter DECIMAL;

	SELECT SUM(jumlah_meter) INTO total_meter
    FROM tagihan
    WHERE id_pelanggan = id_pelanggan AND tahun = tahun;
    
    RETURN total_meter;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `hitung_tagihan_pln` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`serkom`@`%` PROCEDURE `hitung_tagihan_pln`(
 IN p_pelanggan_id INT,
 IN p_bulan INT,
 IN p_tahun INT)
BEGIN
	 DECLARE v_awal_meter DOUBLE;
    DECLARE v_akhir_meter DOUBLE;
    DECLARE v_penggunaan DOUBLE;
    DECLARE v_tarif DOUBLE;
    DECLARE v_biaya_pln DOUBLE;
    DECLARE v_id_penggunaan INT;
    DECLARE v_tagihan DOUBLE;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Terjadi kesalahan. Transaksi dibatalkan.' AS message;
    END;

    START TRANSACTION;
    
    -- Ambil nilai awal dan akhir meteran
    SELECT meter_awal, meter_akhir, id_penggunaan INTO v_awal_meter, v_akhir_meter, v_id_penggunaan
    FROM penggunaan
    WHERE id_pelanggan = p_pelanggan_id
    AND EXTRACT(MONTH FROM bulan) = p_bulan
    AND EXTRACT(YEAR FROM tahun) = p_tahun;
    
    -- Hitung penggunaan listrik
    SET v_penggunaan = v_akhir_meter - v_awal_meter;
    
    -- Ambil tarif listrik dari tabel tarif_pln
    SELECT tarifperkwh INTO v_tarif 
    FROM tarif t
    JOIN pelanggan p ON p.id_tarif = t.id_tarif 
    WHERE p.id_pelanggan = p_pelanggan_id;
    
    -- Hitung biaya PLN
    SET v_biaya_pln = v_penggunaan * v_tarif;
    
    -- Hitung total tagihan
    SET v_tagihan = v_biaya_pln; -- Gantilah 'biaya_lainnya' dengan biaya tambahan jika ada
    
    -- Simpan data tagihan ke dalam tabel tagihan_pln
    INSERT INTO tagihan (id_penggunaan, id_pelanggan, bulan, tahun, jumlah_meter, jumlah_tagihan)
    VALUES (v_id_penggunaan, p_pelanggan_id, p_bulan, p_tahun, v_penggunaan, v_tagihan);

    COMMIT;
    SELECT 'Tagihan PLN telah dihitung dan disimpan.' AS message;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pembayaran_tagihan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`serkom`@`%` PROCEDURE `pembayaran_tagihan`(
    IN p_pelanggan_id INT,
    IN p_tagihan_id INT,
    IN p_user_id INT
)
BEGIN
    DECLARE v_saldo DOUBLE;
    DECLARE v_total_tagihan DOUBLE;
    DECLARE v_status_tagihan VARCHAR(20);
    DECLARE v_pelanggan_valid BOOLEAN;
    DECLARE v_tagihan_valid BOOLEAN;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Terjadi kesalahan. Transaksi dibatalkan.' AS message;
    END;

    START TRANSACTION;

    -- Periksa apakah ID pelanggan valid
    SELECT EXISTS(SELECT 1 FROM pelanggan WHERE id_pelanggan = p_pelanggan_id) INTO v_pelanggan_valid;

    -- Periksa apakah ID tagihan valid
    SELECT EXISTS(SELECT 1 FROM tagihan WHERE id_tagihan = p_tagihan_id) INTO v_tagihan_valid;

    IF v_pelanggan_valid AND v_tagihan_valid THEN
        -- Ambil saldo pelanggan
        SELECT saldo INTO v_saldo
        FROM pelanggan
        WHERE id_pelanggan = p_pelanggan_id;

        -- Ambil total tagihan dan status tagihan
        SELECT jumlah_tagihan, status INTO v_total_tagihan, v_status_tagihan
        FROM tagihan
        WHERE id_tagihan = p_tagihan_id;

        -- Periksa apakah saldo mencukupi untuk pembayaran
        IF v_status_tagihan = 'Lunas' THEN
            SELECT 'Tagihan ini sudah lunas.' AS message;
        ELSEIF v_saldo >= v_total_tagihan THEN
            -- Kurangi saldo pelanggan
            UPDATE pelanggan
            SET saldo = saldo - v_total_tagihan
            WHERE id_pelanggan = p_pelanggan_id;

            -- Tandai tagihan sebagai lunas
            UPDATE tagihan
            SET status = 'Lunas'
            WHERE id_tagihan = p_tagihan_id;

            -- Simpan data pembayaran ke dalam tabel pembayaran
            INSERT INTO pembayaran (id_pelanggan, id_tagihan, total_bayar, tanggal_pembayaran, id_user)
            VALUES (p_pelanggan_id, p_tagihan_id, v_total_tagihan, NOW(), p_user_id);

            COMMIT;
            SELECT 'Pembayaran berhasil. Saldo pelanggan setelah pembayaran: ' AS message, v_saldo - v_total_tagihan AS saldo_setelah;
        ELSE
            SELECT 'Saldo tidak mencukupi untuk pembayaran.' AS message;
        END IF;
    ELSE
        SELECT 'ID pelanggan atau ID tagihan tidak valid.' AS message;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `topup_pelanggan` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`serkom`@`%` PROCEDURE `topup_pelanggan`(
    IN p_pelanggan_id INT,
    IN p_jumlah_topup DOUBLE
)
BEGIN
    DECLARE v_saldo_sebelum DOUBLE;
    DECLARE v_saldo_setelah DOUBLE;
    DECLARE v_pelanggan_valid BOOLEAN;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Terjadi kesalahan. Transaksi dibatalkan.' AS message;
    END;

    START TRANSACTION;

	-- Periksa apakah ID pelanggan valid
    SELECT EXISTS(SELECT 1 FROM pelanggan WHERE id_pelanggan = p_pelanggan_id) INTO v_pelanggan_valid;

	IF v_pelanggan_valid THEN 
		-- Ambil saldo pelanggan sebelum top-up
		SELECT saldo INTO v_saldo_sebelum
		FROM pelanggan
		WHERE id_pelanggan = p_pelanggan_id;

		-- Lakukan top-up
		SET v_saldo_setelah = v_saldo_sebelum + p_jumlah_topup;

		-- Update saldo pelanggan
		UPDATE pelanggan
		SET saldo = v_saldo_setelah
		WHERE id_pelanggan = p_pelanggan_id;

		COMMIT;
		SELECT 'Top-up berhasil. Saldo sebelumnya: ' AS message, v_saldo_sebelum AS saldo_sebelum, 'Saldo setelah top-up: ' AS message, v_saldo_setelah AS saldo_setelah;
    ELSE
        SELECT 'ID pelanggan tidak valid.' AS message;
    END IF;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_pembayaran_pelanggan`
--

/*!50001 DROP VIEW IF EXISTS `view_pembayaran_pelanggan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`serkom`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_pembayaran_pelanggan` AS select `py`.`id_pembayaran` AS `id_pembayaran`,`py`.`tanggal_pembayaran` AS `tanggal_pembayaran`,`py`.`total_bayar` AS `total_bayar`,`pl`.`id_pelanggan` AS `id_pelanggan`,`pl`.`nama_pelanggan` AS `nama_pelanggan`,`pl`.`nomor_kwh` AS `nomor_kwh`,`t`.`id_tagihan` AS `id_tagihan`,`t`.`jumlah_meter` AS `jumlah_meter`,`t`.`jumlah_tagihan` AS `jumlah_tagihan`,`t`.`status` AS `status` from ((`pembayaran` `py` join `pelanggan` `pl` on((`pl`.`id_pelanggan` = `py`.`id_pelanggan`))) join `tagihan` `t` on((`t`.`id_tagihan` = `py`.`id_tagihan`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_tagihan_pelanggan`
--

/*!50001 DROP VIEW IF EXISTS `view_tagihan_pelanggan`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`serkom`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_tagihan_pelanggan` AS select `pl`.`id_pelanggan` AS `id_pelanggan`,`pl`.`nama_pelanggan` AS `nama_pelanggan`,`pl`.`nomor_kwh` AS `nomor_kwh`,`pn`.`id_penggunaan` AS `id_penggunaan`,`pn`.`meter_awal` AS `meter_awal`,`pn`.`meter_akhir` AS `meter_akhir`,`t`.`id_tagihan` AS `id_tagihan`,`t`.`bulan` AS `bulan`,`t`.`tahun` AS `tahun`,`t`.`jumlah_meter` AS `jumlah_meter`,`t`.`jumlah_tagihan` AS `jumlah_tagihan`,`t`.`status` AS `status` from ((`tagihan` `t` join `pelanggan` `pl` on((`pl`.`id_pelanggan` = `t`.`id_pelanggan`))) join `penggunaan` `pn` on((`pn`.`id_penggunaan` = `t`.`id_penggunaan`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_level`
--

/*!50001 DROP VIEW IF EXISTS `view_user_level`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`serkom`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_level` AS select `u`.`username` AS `username`,`u`.`nama_admin` AS `nama_admin`,`u`.`id_level` AS `id_level`,`l`.`nama_level` AS `user_level` from (`user` `u` join `level` `l` on((`u`.`id_level` = `l`.`id_level`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-02 19:03:45
