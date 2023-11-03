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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `level`
--

LOCK TABLES `level` WRITE;
/*!40000 ALTER TABLE `level` DISABLE KEYS */;
/*!40000 ALTER TABLE `level` ENABLE KEYS */;
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
  `nomor_kwh` double DEFAULT NULL,
  `nama_pelanggan` varchar(200) DEFAULT NULL,
  `alamat` text,
  `id_tarif` int DEFAULT NULL,
  PRIMARY KEY (`id_pelanggan`),
  KEY `pelanggan_FK` (`id_tarif`),
  CONSTRAINT `pelanggan_FK` FOREIGN KEY (`id_tarif`) REFERENCES `tarif` (`id_tarif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pelanggan`
--

LOCK TABLES `pelanggan` WRITE;
/*!40000 ALTER TABLE `pelanggan` DISABLE KEYS */;
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
  `id_tagihan` int NOT NULL,
  `id_pelanggan` int NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pembayaran`
--

LOCK TABLES `pembayaran` WRITE;
/*!40000 ALTER TABLE `pembayaran` DISABLE KEYS */;
/*!40000 ALTER TABLE `pembayaran` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `penggunaan`
--

DROP TABLE IF EXISTS `penggunaan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `penggunaan` (
  `id_penggunaan` int NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int DEFAULT NULL,
  `bulan` varchar(2) DEFAULT NULL,
  `tahun` year DEFAULT NULL,
  `meter_awal` int DEFAULT NULL,
  `meter_akhir` int DEFAULT NULL,
  PRIMARY KEY (`id_penggunaan`),
  KEY `penggunaan_FK` (`id_pelanggan`),
  CONSTRAINT `penggunaan_FK` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `penggunaan`
--

LOCK TABLES `penggunaan` WRITE;
/*!40000 ALTER TABLE `penggunaan` DISABLE KEYS */;
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
  `bulan` varchar(2) DEFAULT NULL,
  `tahun` year DEFAULT NULL,
  `jumlah_meter` int DEFAULT NULL,
  `status` enum('1','2') DEFAULT NULL,
  PRIMARY KEY (`id_tagihan`),
  KEY `tagihan_FK` (`id_penggunaan`),
  KEY `tagihan_FK_1` (`id_pelanggan`),
  CONSTRAINT `tagihan_FK` FOREIGN KEY (`id_penggunaan`) REFERENCES `penggunaan` (`id_penggunaan`),
  CONSTRAINT `tagihan_FK_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tagihan`
--

LOCK TABLES `tagihan` WRITE;
/*!40000 ALTER TABLE `tagihan` DISABLE KEYS */;
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
  `daya` double DEFAULT NULL,
  `tarifperkwh` double DEFAULT NULL,
  PRIMARY KEY (`id_tarif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarif`
--

LOCK TABLES `tarif` WRITE;
/*!40000 ALTER TABLE `tarif` DISABLE KEYS */;
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
  CONSTRAINT `user_FK` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'aplp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-01 19:04:40


ALTER TABLE `user` ADD CONSTRAINT `user_FK` FOREIGN KEY (`id_level`) REFERENCES `level` (`id_level`);

ALTER TABLE `pengguna` ADD CONSTRAINT `penggunaan_FK` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

ALTER TABLE `tagihan` ADD CONSTRAINT `tagihan_FK` FOREIGN KEY (`id_penggunaan`) REFERENCES `penggunaan` (`id_penggunaan`),
  CONSTRAINT `tagihan_FK_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

ALTER TABLE `penggunaan` ADD CONSTRAINT `penggunaan_FK` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

ALTER TABLE `pembayaraan` ADD CONSTRAINT `pembayaran_FK` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  CONSTRAINT `pembayaran_FK_1` FOREIGN KEY (`id_tagihan`) REFERENCES `tagihan` (`id_tagihan`),
  CONSTRAINT `pembayaran_FK_2` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

ALTER TABLE `pelanggan` ADD CONSTRAINT `pelanggan_FK` FOREIGN KEY (`id_tarif`) REFERENCES `tarif` (`id_tarif`);


DELIMITER $$

CREATE PROCEDURE hitung_penggunaan_dan_biaya_pln (
    IN p_id_pelanggan INT,
    IN p_bulan INT,
    IN p_tahun INT
)
BEGIN
    DECLARE v_awal_meter DECIMAL(10, 2);
    DECLARE v_akhir_meter DECIMAL(10, 2);
    DECLARE v_penggunaan DECIMAL(10, 2);
    DECLARE v_tarif DECIMAL(10, 2);
    DECLARE v_biaya_pln DECIMAL(10, 2);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Terjadi kesalahan. Transaksi dibatalkan.' AS message;
    END;

    START TRANSACTION;
    
    -- Ambil nilai awal dan akhir meteran
    SELECT awal_meter, akhir_meter 
    FROM penggunaan
    WHERE id_pelanggan = p_id_pelanggan
    
    -- Hitung penggunaan listrik
    SET v_penggunaan = v_akhir_meter - v_awal_meter;
    
    -- Ambil tarif listrik dari tabel tarif_pln
    SELECT tarifperkwh 
    FROM tarif t
    JOIN pelanggan p ON p.id_tarif = t.id_tarif 
    WHERE p.id_pelanggan = p_id_pelanggan
    
    -- Hitung biaya PLN
    SET v_biaya_pln = v_penggunaan * v_tarif;
    
    -- Simpan data penggunaan dan biaya ke dalam tabel penggunaan_pln
    INSERT INTO penggunaan_pln (pelanggan_id, bulan, tahun, penggunaan, biaya)
    VALUES (p_pelanggan_id, p_bulan, p_tahun, v_penggunaan, v_biaya_pln);

    COMMIT;
    SELECT 'Penggunaan dan biaya PLN telah dihitung dan disimpan.' AS message;
END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE hitung_tagihan_pln (
    IN p_pelanggan_id INT,
    IN p_bulan INT,
    IN p_tahun INT
)
BEGIN
    DECLARE v_awal_meter DECIMAL(10, 2);
    DECLARE v_akhir_meter DECIMAL(10, 2);
    DECLARE v_penggunaan DECIMAL(10, 2);
    DECLARE v_tarif DECIMAL(10, 2);
    DECLARE v_biaya_pln DECIMAL(10, 2);
    DECLARE v_id_penggunaan INT;
    DECLARE v_tagihan DECIMAL(10, 2);
    
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
    WHERE p.id_pelanggan = p_id_pelanggan;
    
    -- Hitung biaya PLN
    SET v_biaya_pln = v_penggunaan * v_tarif;
    
    -- Hitung total tagihan
    SET v_tagihan = v_biaya_pln; -- Gantilah 'biaya_lainnya' dengan biaya tambahan jika ada
    
    -- Simpan data tagihan ke dalam tabel tagihan_pln
    INSERT INTO tagihan (id_penggunaan, id_pelanggan, bulan, tahun, jumlah_meter, jumlah_tagihan)
    VALUES (v_id_penggunaan, p_pelanggan_id, p_bulan, p_tahun, v_penggunaan, v_tagihan);

    COMMIT;
    SELECT 'Tagihan PLN telah dihitung dan disimpan.' AS message;
END$$

DELIMITER ;



CREATE EVENT MonthlyUsageEvent
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_TIMESTAMP
DO
   INSERT INTO penggunaan  (id_pelanggan, bulan, tahun, meter_awal, meter_akhir)
    SELECT id_pelanggan, CURDATE(), CURDATE(), FLOOR(RAND() * 100), FLOOR(RAND() * 1000)
    FROM pelanggan;


    DELIMITER $$

CREATE PROCEDURE bayar_pln (
    IN p_pelanggan_id INT,
    IN p_nomor_meter VARCHAR(12),
    IN p_jumlah_pembayaran DOUBLE
)
BEGIN
    DECLARE v_saldo_pelanggan DOUBLE;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Terjadi kesalahan. Transaksi dibatalkan.' AS message;
    END;

    START TRANSACTION;
    
    -- Ambil saldo pelanggan saat ini
    SELECT saldo INTO v_saldo_pelanggan
    FROM pelanggan
    WHERE id_pelanggan = p_pelanggan_id;
    
    -- Periksa apakah saldo mencukupi untuk pembayaran
    IF v_saldo_pelanggan >= p_jumlah_pembayaran THEN
        -- Kurangi saldo pelanggan
        UPDATE pelanggan
        SET saldo = saldo - p_jumlah_pembayaran
        WHERE pelanggan_id = p_pelanggan_id;
        
        -- Simpan data pembayaran
        INSERT INTO pembayaran_pln (pelanggan_id, nomor_meter, jumlah_pembayaran, tanggal_pembayaran)
        VALUES (p_pelanggan_id, p_nomor_meter, p_jumlah_pembayaran, NOW());
        
        COMMIT;
        SELECT 'Pembayaran PLN berhasil.';
    ELSE
        SELECT 'Saldo tidak mencukupi untuk pembayaran PLN.';
    END IF;
    
END$$

DELIMITER ;


USE `aplp`;
DROP function IF EXISTS `hitung_total_meter_satu_tahun`;

DELIMITER $$
USE `aplp`$$
CREATE FUNCTION `hitung_total_meter_satu_tahun` (id_pelanggan INT, tahun INT)
RETURNS DOUBLE
BEGIN
 DECLARE total_meter DECIMAL;

	SELECT SUM(jumlah_meter) INTO total_meter
    FROM tagihan
    WHERE id_pelanggan = id_pelanggan AND YEAR(tanggal) = tahun;
    
    RETURN total_meter;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE topup_pelanggan(
    IN p_pelanggan_id INT,
    IN p_jumlah_topup DOUBLE
)
BEGIN
    DECLARE v_saldo_sebelum DOUBLE;
    DECLARE v_saldo_setelah DOUBLE;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Terjadi kesalahan. Transaksi dibatalkan.' AS message;
    END;

    START TRANSACTION;

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
END$$

DELIMITER ;


DELIMITER $$

CREATE PROCEDURE pembayaran_tagihan(
    IN p_pelanggan_id INT,
    IN p_tagihan_id INT
)
BEGIN
    DECLARE v_saldo DECIMAL(10, 2);
    DECLARE v_total_tagihan DECIMAL(10, 2);
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Terjadi kesalahan. Transaksi dibatalkan.' AS message;
    END;

    START TRANSACTION;

    -- Ambil saldo pelanggan
    SELECT saldo INTO v_saldo
    FROM pelanggan
    WHERE id_pelanggan = p_pelanggan_id;

    -- Ambil total tagihan
    SELECT jumlah_tagihan INTO v_total_tagihan
    FROM tagihan
    WHERE id_tagihan = p_tagihan_id;

    -- Periksa apakah saldo mencukupi untuk pembayaran
    IF v_saldo >= v_total_tagihan THEN
        -- Kurangi saldo pelanggan
        UPDATE pelanggan
        SET saldo = saldo - v_total_tagihan
        WHERE id_pelanggan = p_pelanggan_id;

        -- Tandai tagihan sebagai lunas
        UPDATE tagihan
        SET status = 'Lunas'
        WHERE id_tagihan = p_tagihan_id;

        COMMIT;
        SELECT 'Pembayaran berhasil. Saldo pelanggan setelah pembayaran: ' AS message, v_saldo - v_total_tagihan AS saldo_setelah;
    ELSE
        SELECT 'Saldo tidak mencukupi untuk pembayaran.' AS message;
    END IF;
END$$

DELIMITER ;



CREATE DEFINER=`serkom`@`%` PROCEDURE `pembayaran_tagihan`(
    IN p_pelanggan_id INT,
    IN p_tagihan_id INT
)
BEGIN
    DECLARE v_saldo DECIMAL(10, 2);
    DECLARE v_total_tagihan DECIMAL(10, 2);
    DECLARE v_status_tagihan VARCHAR(20);
    DECLARE v_tagihan_valid BOOLEAN;
    DECLARE v_pelanggan_valid BOOLEAN;
    
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
		SELECT id_pelanggan, saldo INTO v_id_pelanggan, v_saldo
		FROM pelanggan
		WHERE id_pelanggan = p_pelanggan_id;
		
		-- Ambil total tagihan dan status tagihan
		SELECT id_tagihan, jumlah_tagihan, status INTO v_id_tagihan, v_total_tagihan, v_status_tagihan
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
			INSERT INTO pembayaran (id_pelanggan, id_tagihan, total_bayar, tanggal_pembayaran)
			VALUES (p_pelanggan_id, p_tagihan_id, v_total_tagihan, NOW());

			COMMIT;
			SELECT 'Pembayaran berhasil. Saldo pelanggan setelah pembayaran: ' AS message, v_saldo - v_total_tagihan AS saldo_setelah;
		ELSE
			SELECT 'Saldo tidak mencukupi untuk pembayaran.' AS message;
		END IF;
    ELSE
        SELECT 'ID pelanggan atau ID tagihan tidak valid.' AS message;
    END IF;
END



DELIMITER $$
CREATE DEFINER=`serkom`@`%` PROCEDURE `hitung_tagihan_pln`(
 IN p_pelanggan_id INT,
 IN p_bulan INT,
 IN p_tahun INT)
BEGIN
	 DECLARE v_awal_meter DECIMAL(10, 2);
    DECLARE v_akhir_meter DECIMAL(10, 2);
    DECLARE v_penggunaan DECIMAL(10, 2);
    DECLARE v_tarif DECIMAL(10, 2);
    DECLARE v_biaya_pln DECIMAL(10, 2);
    DECLARE v_id_penggunaan INT;
    DECLARE v_tagihan DECIMAL(10, 2);
    
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
END$$
DELIMITER ;
