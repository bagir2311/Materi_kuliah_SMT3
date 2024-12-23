-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 16, 2024 at 11:19 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `penjualan`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cek_stok_berdsarkan_kodebrg` (IN `kode_barang_in` VARCHAR(10), OUT `nama_barang_out` VARCHAR(100), OUT `stok_out` INT)   BEGIN
    SELECT nama_barang, stok 
    INTO nama_barang_out, stok_out
    FROM tbl_barang WHERE kode_barang = kode_barang_in;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `total_penjualan_barang` ()   BEGIN
    SELECT kode_barang, SUM(qty),
	 SUM(qty*harga_jual) AS total_harga
	 FROM tbl_detailtransaksi
	 GROUP BY kode_barang;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `hitung_diskon` (`total_pembelian` INT) RETURNS INT DETERMINISTIC BEGIN
    -- Logika atau operasi
    DECLARE diskon INT;
    IF total_pembelian > 100000 THEN
    	SET diskon = total_pembelian * 0.1;
    ELSE
    	SET diskon = 0;
   END IF;
   
    RETURN diskon;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `cek_stok`
-- (See below for the actual view)
--
CREATE TABLE `cek_stok` (
`kode_barang` varchar(20)
,`nama_barang` varchar(50)
,`harga_jual` int
,`stok` int
,`harga_pengadaan` int
);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pengadaan`
--

CREATE TABLE `detail_pengadaan` (
  `Kode_Pengadaan` varchar(10) DEFAULT NULL,
  `Kode_Barang` varchar(10) DEFAULT NULL,
  `Jumlah` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `stok_dibawah_rata2`
-- (See below for the actual view)
--
CREATE TABLE `stok_dibawah_rata2` (
`kode_barang` varchar(20)
,`nama_barang` varchar(50)
,`harga_jual` int
,`stok` int
,`harga_pengadaan` int
);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `kode_supplier` varchar(20) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `alamat_supplier` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`kode_supplier`, `nama_supplier`, `alamat_supplier`) VALUES
('SUP001', 'PT. ABC', 'Jl. Merdeka No. 1'),
('SUP002', 'PT. XYZ', 'Jl. Sudirman No. 20');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_arsip_barang`
--

CREATE TABLE `tbl_arsip_barang` (
  `id_arsip` int NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `stok` int NOT NULL,
  `waktu_hapus` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_arsip_barang`
--

INSERT INTO `tbl_arsip_barang` (`id_arsip`, `kode_barang`, `nama_barang`, `stok`, `waktu_hapus`) VALUES
(1, 'BRG_009', 'Intermie', 435, '2024-12-16 20:53:44');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_barang`
--

CREATE TABLE `tbl_barang` (
  `kode_barang` varchar(20) NOT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `harga_jual` int DEFAULT NULL,
  `stok` int DEFAULT NULL,
  `harga_pengadaan` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_barang`
--

INSERT INTO `tbl_barang` (`kode_barang`, `nama_barang`, `harga_jual`, `stok`, `harga_pengadaan`) VALUES
('BRG_001', 'Indomie Goreng', 2500, 50, NULL),
('BRG_002', 'Indomie Goreng Jumbo', 3000, 30, NULL),
('BRG_003', 'Mie Sedaap Goreng', 2500, 50, NULL),
('BRG_004', 'Mie Sedap Soto', 2300, 20, NULL),
('BRG_005', 'Intermie Goreng', 1500, 10, NULL),
('BRG_006', 'Intermie Soto', 1500, 25, NULL),
('BRG_007', 'Pop Mie Ayam', 4500, 0, NULL);


-- --------------------------------------------------------

--
-- Table structure for table `tbl_detailtransaksi`
--

CREATE TABLE `tbl_detailtransaksi` (
  `kode_faktur` varchar(20) DEFAULT NULL,
  `kode_barang` varchar(20) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `harga_jual` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_detailtransaksi`
--

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

-- --------------------------------------------------------

--
-- Table structure for table `tbl_detail_pengadaan`
--

CREATE TABLE `tbl_detail_pengadaan` (
  `kode_pengadaan` varchar(20) DEFAULT NULL,
  `kode_barang` varchar(20) DEFAULT NULL,
  `jumlah` int DEFAULT NULL,
  `total_harga` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_detail_pengadaan`
--

INSERT INTO `tbl_detail_pengadaan` (`kode_pengadaan`, `kode_barang`, `jumlah`, `total_harga`) VALUES
('PGD001', 'BRG_001', 10, 1000000),
('PGD002', 'BRG_002', 5, 1000000),
('PGD003', 'BRG_001', 6, 600000),
('PGD003', 'BRG_003', 6, 600000),
('PGD005', 'BRG002', 5, 1000000),
('PGD005', 'BRG002', 5, 1000000),
('PGD005', 'BRG002', 5, 1000000),
('PGD005', 'BRG002', 5, 1000000);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_faktur`
--

CREATE TABLE `tbl_faktur` (
  `kode_faktur` varchar(20) NOT NULL,
  `tanggal` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_faktur`
--

INSERT INTO `tbl_faktur` (`kode_faktur`, `tanggal`) VALUES
('KD_001', '2020-07-13'),
('KD_002', '2020-07-13'),
('KD_003', '2020-07-13');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pengadaan`
--

CREATE TABLE `tbl_pengadaan` (
  `kode_pengadaan` varchar(20) NOT NULL,
  `tgl_pengadaan` date NOT NULL,
  `kode_supplier` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tbl_pengadaan`
--

INSERT INTO `tbl_pengadaan` (`kode_pengadaan`, `tgl_pengadaan`, `kode_supplier`) VALUES
('PGD001', '2024-10-15', 'SUP001'),
('PGD002', '2024-10-15', 'SUP002'),
('PGD003', '2024-10-16', 'SUP001');

-- --------------------------------------------------------

--
-- Structure for view `cek_stok`
--
DROP TABLE IF EXISTS `cek_stok`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cek_stok`  AS SELECT `tbl_barang`.`kode_barang` AS `kode_barang`, `tbl_barang`.`nama_barang` AS `nama_barang`, `tbl_barang`.`harga_jual` AS `harga_jual`, `tbl_barang`.`stok` AS `stok`, `tbl_barang`.`harga_pengadaan` AS `harga_pengadaan` FROM `tbl_barang` WHERE (`tbl_barang`.`stok` = 0)  ;

-- --------------------------------------------------------

--
-- Structure for view `stok_dibawah_rata2`
--
DROP TABLE IF EXISTS `stok_dibawah_rata2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stok_dibawah_rata2`  AS SELECT `tbl_barang`.`kode_barang` AS `kode_barang`, `tbl_barang`.`nama_barang` AS `nama_barang`, `tbl_barang`.`harga_jual` AS `harga_jual`, `tbl_barang`.`stok` AS `stok`, `tbl_barang`.`harga_pengadaan` AS `harga_pengadaan` FROM `tbl_barang` WHERE (`tbl_barang`.`stok` < (select avg(`tbl_barang`.`stok`) from `tbl_barang`))  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_pengadaan`
--
ALTER TABLE `detail_pengadaan`
  ADD KEY `Kode_Pengadaan` (`Kode_Pengadaan`),
  ADD KEY `Kode_Barang` (`Kode_Barang`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`kode_supplier`);

--
-- Indexes for table `tbl_arsip_barang`
--
ALTER TABLE `tbl_arsip_barang`
  ADD PRIMARY KEY (`id_arsip`);

--
-- Indexes for table `tbl_barang`
--
ALTER TABLE `tbl_barang`
  ADD PRIMARY KEY (`kode_barang`);

--
-- Indexes for table `tbl_detailtransaksi`
--
ALTER TABLE `tbl_detailtransaksi`
  ADD KEY `kode_faktur` (`kode_faktur`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `tbl_detail_pengadaan`
--
ALTER TABLE `tbl_detail_pengadaan`
  ADD KEY `kode_pengadaan` (`kode_pengadaan`),
  ADD KEY `kode_barang` (`kode_barang`);

--
-- Indexes for table `tbl_faktur`
--
ALTER TABLE `tbl_faktur`
  ADD PRIMARY KEY (`kode_faktur`);

--
-- Indexes for table `tbl_pengadaan`
--
ALTER TABLE `tbl_pengadaan`
  ADD PRIMARY KEY (`kode_pengadaan`),
  ADD KEY `kode_supplier` (`kode_supplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_arsip_barang`
--
ALTER TABLE `tbl_arsip_barang`
  MODIFY `id_arsip` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pengadaan`
--
ALTER TABLE `detail_pengadaan`
  ADD CONSTRAINT `detail_pengadaan_ibfk_1` FOREIGN KEY (`Kode_Pengadaan`) REFERENCES `tbl_pengadaan` (`kode_pengadaan`),
  ADD CONSTRAINT `detail_pengadaan_ibfk_2` FOREIGN KEY (`Kode_Barang`) REFERENCES `tbl_barang` (`kode_barang`);

--
-- Constraints for table `tbl_detailtransaksi`
--
ALTER TABLE `tbl_detailtransaksi`
  ADD CONSTRAINT `tbl_detailtransaksi_ibfk_1` FOREIGN KEY (`kode_faktur`) REFERENCES `tbl_faktur` (`kode_faktur`),
  ADD CONSTRAINT `tbl_detailtransaksi_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `tbl_barang` (`kode_barang`);

--
-- Constraints for table `tbl_detail_pengadaan`
--
ALTER TABLE `tbl_detail_pengadaan`
  ADD CONSTRAINT `tbl_detail_pengadaan_ibfk_1` FOREIGN KEY (`kode_pengadaan`) REFERENCES `tbl_pengadaan` (`kode_pengadaan`),
  ADD CONSTRAINT `tbl_detail_pengadaan_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `tbl_barang` (`kode_barang`);

--
-- Constraints for table `tbl_pengadaan`
--
ALTER TABLE `tbl_pengadaan`
  ADD CONSTRAINT `tbl_pengadaan_ibfk_1` FOREIGN KEY (`kode_supplier`) REFERENCES `supplier` (`kode_supplier`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
