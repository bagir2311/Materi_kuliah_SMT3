-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for penjualan
CREATE DATABASE IF NOT EXISTS `penjualan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `penjualan`;

-- Dumping structure for table penjualan.detail_pengadaan
CREATE TABLE IF NOT EXISTS `detail_pengadaan` (
  `Kode_Pengadaan` varchar(10) DEFAULT NULL,
  `Kode_Barang` varchar(10) DEFAULT NULL,
  `Jumlah` int DEFAULT NULL,
  KEY `Kode_Pengadaan` (`Kode_Pengadaan`),
  KEY `Kode_Barang` (`Kode_Barang`),
  CONSTRAINT `detail_pengadaan_ibfk_1` FOREIGN KEY (`Kode_Pengadaan`) REFERENCES `tbl_pengadaan` (`kode_pengadaan`),
  CONSTRAINT `detail_pengadaan_ibfk_2` FOREIGN KEY (`Kode_Barang`) REFERENCES `tbl_barang` (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table penjualan.detail_pengadaan: ~0 rows (approximately)

-- Dumping structure for table penjualan.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `kode_supplier` varchar(20) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `alamat_supplier` varchar(100) NOT NULL,
  PRIMARY KEY (`kode_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table penjualan.supplier: ~2 rows (approximately)
INSERT INTO `supplier` (`kode_supplier`, `nama_supplier`, `alamat_supplier`) VALUES
	('SUP001', 'PT. ABC', 'Jl. Merdeka No. 1'),
	('SUP002', 'PT. XYZ', 'Jl. Sudirman No. 20');

-- Dumping structure for table penjualan.tbl_barang
CREATE TABLE IF NOT EXISTS `tbl_barang` (
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `harga_jual` int DEFAULT NULL,
  `stok` int DEFAULT NULL,
  `harga_pengadaan` int DEFAULT NULL,
  PRIMARY KEY (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table penjualan.tbl_barang: ~7 rows (approximately)
INSERT INTO `tbl_barang` (`kode_barang`, `nama_barang`, `harga_jual`, `stok`, `harga_pengadaan`) VALUES
	('BRG_001', 'Indomie Goreng', 2500, 50, NULL),
	('BRG_002', 'Indomie Goreng Jumbo', 3000, 30, NULL),
	('BRG_003', 'Mie Sedaap Goreng', 2500, 50, NULL),
	('BRG_004', 'Mie Sedap Soto', 2300, 20, NULL),
	('BRG_005', 'Intermie Goreng', 1500, 10, NULL),
	('BRG_006', 'Intermie Soto', 1500, 25, NULL),
	('BRG_007', 'Pop Mie Ayam', 4500, 1, NULL);

-- Dumping structure for table penjualan.tbl_detailtransaksi
CREATE TABLE IF NOT EXISTS `tbl_detailtransaksi` (
  `kode_faktur` varchar(20) DEFAULT NULL,
  `kode_barang` varchar(20) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `harga_jual` int DEFAULT NULL,
  KEY `kode_faktur` (`kode_faktur`),
  KEY `kode_barang` (`kode_barang`),
  CONSTRAINT `tbl_detailtransaksi_ibfk_1` FOREIGN KEY (`kode_faktur`) REFERENCES `tbl_faktur` (`kode_faktur`),
  CONSTRAINT `tbl_detailtransaksi_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `tbl_barang` (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table penjualan.tbl_detailtransaksi: ~13 rows (approximately)
INSERT INTO `tbl_detailtransaksi` (`kode_faktur`, `kode_barang`, `qty`, `harga_jual`) VALUES
	('KD_001', 'BRG_001', 5, 3500),
	('KD_001', 'BRG_002', 8, 4000),
	('KD_001', 'BRG_003', 9, 3500),
	('KD_001', 'BRG_004', 3, 3300),
	('KD_002', 'BRG_005', 6, 2500),
	('KD_002', 'BRG_006', 6, 2500),
	('KD_003', 'BRG_007', 3, 5500),
	('KD_001', NULL, NULL, NULL),
	('KD_003', 'BRG_001', 5, 3500),
	('KD_003', 'BRG_001', 5, 3500),
	('KD_003', 'BRG_001', 5, 3500),
	('KD_003', 'BRG_001', 5, 3500),
	('KD_003', 'BRG_001', 5, 3500),
	('KD_003', 'BRG_001', 5, 3500),
	('KD_003', 'BRG_001', 5, 3500);

-- Dumping structure for table penjualan.tbl_detail_pengadaan
CREATE TABLE IF NOT EXISTS `tbl_detail_pengadaan` (
  `kode_pengadaan` varchar(20) DEFAULT NULL,
  `kode_barang` varchar(20) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `total_harga` int DEFAULT NULL,
  KEY `kode_pengadaan` (`kode_pengadaan`),
  KEY `kode_barang` (`kode_barang`),
  CONSTRAINT `tbl_detail_pengadaan_ibfk_1` FOREIGN KEY (`kode_pengadaan`) REFERENCES `tbl_pengadaan` (`kode_pengadaan`),
  CONSTRAINT `tbl_detail_pengadaan_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `tbl_barang` (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table penjualan.tbl_detail_pengadaan: ~6 rows (approximately)
INSERT INTO `tbl_detail_pengadaan` (`kode_pengadaan`, `kode_barang`, `jumlah`, `total_harga`) VALUES
	('PGD001', 'BRG_001', 10, 1000000),
	('PGD002', 'BRG_002', 5, 1000000),
	('PGD003', 'BRG_001', 6, 600000),
	('PGD003', 'BRG_003', 6, 600000),
	('PGD005', 'BRG002', 5, 1000000),
	('PGD005', 'BRG002', 5, 1000000),
	('PGD005', 'BRG002', 5, 1000000),
	('PGD005', 'BRG002', 5, 1000000);

-- Dumping structure for table penjualan.tbl_faktur
CREATE TABLE IF NOT EXISTS `tbl_faktur` (
  `kode_faktur` varchar(20) NOT NULL,
  `tanggal` date DEFAULT NULL,
  PRIMARY KEY (`kode_faktur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table penjualan.tbl_faktur: ~3 rows (approximately)
INSERT INTO `tbl_faktur` (`kode_faktur`, `tanggal`) VALUES
	('KD_001', '2020-07-13'),
	('KD_002', '2020-07-13'),
	('KD_003', '2020-07-13');

-- Dumping structure for table penjualan.tbl_pengadaan
CREATE TABLE IF NOT EXISTS `tbl_pengadaan` (
  `kode_pengadaan` varchar(20) NOT NULL,
  `tgl_pengadaan` date NOT NULL,
  `kode_supplier` varchar(20) NOT NULL,
  PRIMARY KEY (`kode_pengadaan`),
  KEY `kode_supplier` (`kode_supplier`),
  CONSTRAINT `tbl_pengadaan_ibfk_1` FOREIGN KEY (`kode_supplier`) REFERENCES `supplier` (`kode_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table penjualan.tbl_pengadaan: ~2 rows (approximately)
INSERT INTO `tbl_pengadaan` (`kode_pengadaan`, `tgl_pengadaan`, `kode_supplier`) VALUES
	('PGD001', '2024-10-15', 'SUP001'),
	('PGD002', '2024-10-15', 'SUP002'),
	('PGD003', '2024-10-16', 'SUP001');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
