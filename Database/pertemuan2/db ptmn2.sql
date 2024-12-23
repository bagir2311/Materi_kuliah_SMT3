-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table latihan1.mahasiswa
CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `id_mahasiswa` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `nim` varchar(15) DEFAULT NULL,
  `jurusan` varchar(50) DEFAULT NULL,
  `angkatan` year(4) DEFAULT NULL,
  PRIMARY KEY (`id_mahasiswa`),
  UNIQUE KEY `nim` (`nim`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table latihan1.mahasiswa: ~10 rows (approximately)
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` (`id_mahasiswa`, `nama`, `nim`, `jurusan`, `angkatan`) VALUES
	(1, 'Andi Saputro', '1234567890', 'Teknik Informatika', '2021'),
	(2, 'Budi Santoso', '1234567881', 'Sistem Informasi', '2020'),
	(3, 'Citra Lestari', '1234567872', 'Teknik Informatika', '2021'),
	(4, 'Dina Pratama', '1234567863', 'Teknik Komputer', '2019'),
	(5, 'Eko Putra', '1234567854', 'Sistem Informasi', '2020'),
	(6, 'Faisal Akbar', '1234567845', 'Teknik Informatika', '2018'),
	(7, 'Gita Rahmawati', '1234567836', 'Teknik Komputer', '2019'),
	(8, 'Hadi Firmansyah', '1234567827', 'Sistem Informasi', '2021'),
	(9, 'Intan Maharani', '1234567818', 'Teknik Informatika', '2022'),
	(10, 'Joko Prasetyo', '1234567809', 'Teknik Kommputer', '2022');
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
