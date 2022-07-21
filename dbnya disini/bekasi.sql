-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 21, 2022 at 09:58 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bekasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `kode` varchar(50) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `kondisi` enum('baik','buruk','rusak','') NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `tanggal_pengadaan` date NOT NULL DEFAULT current_timestamp(),
  `gambar` varchar(255) NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `is_inventaris` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama`, `jenis`, `kode`, `kategori_id`, `kondisi`, `keterangan`, `tanggal_pengadaan`, `gambar`, `id_lokasi`, `is_active`, `is_inventaris`) VALUES
(1, 'Printer Hp', 'Elektronika', '1111', 2, 'baik', 'Baik Banget', '2022-02-01', 'barang.jpg', 2, 1, 0),
(3, 'Tanah', '500 m2', '8999555', 1, '', '', '2022-02-01', 'bukti.jpg', 1, 1, 1),
(5, 'Laptop', 'Elektronika', 'L001', 2, 'baik', 'Baik Banget', '2022-03-01', 'barang.jpg', 1, 1, 1),
(6, 'pulpen', 'Alat Tulis', 'p001', 2, 'baik', 'Baik Banget', '2022-02-01', 'barang.jpg', 1, 1, 0),
(7, 'komputer', 'Elektronika', 'k009', 2, 'buruk', 'Komputernya sudah ketinggalan jaman', '2022-02-01', 'barang.jpg', 2, 1, 1),
(8, 'Meja Kantor', 'Perabotan', '0011006', 2, 'baik', 'Baik Banget', '2022-02-01', 'barang.jpg', 1, 0, 0),
(10, 'Sound System', 'Elektronika', 'S-01212', 2, 'baik', 'Baik Banget', '2022-02-02', 'barang.jpg', 1, 1, 0),
(11, 'Mic', 'Elektronika', 'S-01214', 2, 'baik', 'Baik Banget', '2022-02-22', 'barang.jpg', 2, 0, 0),
(13, 'Lampu Sorot', 'Elektronika', 'S-01215', 2, 'baik', 'Baik Banget', '2022-02-25', 'barang.jpg', 2, 1, 0),
(15, 'Tanah', '100 Hektar', 'T-01234', 1, 'baik', 'Baik Banget', '2022-04-07', 'barang.jpg', 1, 1, 0),
(16, 'Coffe Machine', '', 'C-12345', 2, 'baik', 'bisa digunakan', '2022-07-10', 'barang.jpg', 1, 1, 1),
(17, 'Televisi', '', 'T-121234', 2, 'baik', 'Bagus', '2022-07-28', 'barang1.jpg', 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `kartu_inventaris_barang`
--

CREATE TABLE `kartu_inventaris_barang` (
  `id` int(11) NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `status_pengesahan` int(11) NOT NULL DEFAULT 0,
  `kode_pengesahan` varchar(255) DEFAULT NULL,
  `id_camat` int(11) DEFAULT NULL,
  `is_valid` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kartu_inventaris_barang`
--

INSERT INTO `kartu_inventaris_barang` (`id`, `id_lokasi`, `status_pengesahan`, `kode_pengesahan`, `id_camat`, `is_valid`, `created_at`, `updated_at`) VALUES
(10, 1, 0, NULL, NULL, 0, '2022-04-11 01:27:18', '2022-04-11 01:27:18'),
(11, 1, 0, NULL, NULL, 0, '2022-04-11 01:27:23', '2022-04-11 01:27:23'),
(12, 2, 0, NULL, NULL, 0, '2022-04-11 01:31:36', '2022-04-11 01:31:36'),
(13, 2, 0, NULL, NULL, 0, '2022-04-11 01:31:53', '2022-04-11 01:31:53'),
(14, 1, 1, '648GwNduIEAYKXD', 7, 0, '2022-04-11 01:32:50', '2022-04-10 00:00:00'),
(15, 1, 0, NULL, NULL, 0, '2022-06-27 01:36:53', '2022-06-27 01:36:53'),
(16, 1, 0, NULL, NULL, 1, '2022-06-27 02:32:19', '2022-06-27 02:32:19'),
(17, 2, 1, 'iTLSKJ1VFx2WrhB', 7, 1, '2022-06-27 02:32:28', '2022-07-21 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `kartu_inventaris_ruangan`
--

CREATE TABLE `kartu_inventaris_ruangan` (
  `id` int(11) NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `status_pengesahan` int(11) NOT NULL DEFAULT 0,
  `kode_pengesahan` varchar(255) DEFAULT NULL,
  `id_camat` int(11) DEFAULT NULL,
  `is_valid` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kartu_inventaris_ruangan`
--

INSERT INTO `kartu_inventaris_ruangan` (`id`, `id_lokasi`, `status_pengesahan`, `kode_pengesahan`, `id_camat`, `is_valid`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'X8WK1YjYVmcIojo', 7, 1, '2022-02-05 00:43:08', '2022-02-05 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kib` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `kib`) VALUES
(1, 'Tanah', 'A'),
(2, 'Peralatan dan Mesin', 'B'),
(3, 'Gedung dan Bangunan', 'C'),
(4, 'Jalan, Irigasi dan Jaringan', 'D'),
(5, 'Aset Tetap Lainnya', 'E'),
(6, 'Konstruksi Dalam Pengerjaan', 'F'),
(7, 'Aset Lainnya', 'G');

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `id` int(11) NOT NULL,
  `nama_kecamatan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`id`, `nama_kecamatan`) VALUES
(1, 'Bantar Gebang'),
(2, 'Bekasi Barat'),
(3, 'Bekasi Selatan'),
(4, 'Bekasi Timur'),
(5, 'Bekasi Utara'),
(6, 'Jatiasih'),
(7, 'Jatisampurna'),
(8, 'Medan Satria'),
(9, 'Mustika Jaya'),
(10, 'Pondok Gede'),
(11, 'Pondok Melati'),
(12, 'Rawalumbu');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id` int(11) NOT NULL,
  `nama_lokasi` varchar(255) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `id_kecamatan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id`, `nama_lokasi`, `alamat`, `id_kecamatan`) VALUES
(1, 'Kantor Tambun', 'Tambun', 1),
(2, 'Gudang Inventaris Cikarang', 'Jl. Raya Pantura, Cikarang', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pengesahan_barang`
--

CREATE TABLE `pengesahan_barang` (
  `id` int(11) NOT NULL,
  `id_kartu_inventaris_barang` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengesahan_barang`
--

INSERT INTO `pengesahan_barang` (`id`, `id_kartu_inventaris_barang`, `id_barang`, `created_at`) VALUES
(45, 5, 5, '2022-04-11 01:27:18'),
(46, 3, 3, '2022-04-11 01:27:23'),
(47, 3, 5, '2022-04-11 01:27:23'),
(48, 7, 7, '2022-04-11 01:31:53'),
(49, 16, 3, '2022-04-11 01:32:50'),
(50, 16, 5, '2022-04-11 01:32:50'),
(51, 16, 16, '2022-04-11 01:32:50'),
(52, 15, 3, '2022-06-27 01:36:53'),
(53, 15, 5, '2022-06-27 01:36:53'),
(54, 15, 16, '2022-06-27 01:36:53'),
(55, 16, 3, '2022-06-27 02:32:19'),
(56, 16, 5, '2022-06-27 02:32:19'),
(57, 16, 16, '2022-06-27 02:32:19'),
(58, 17, 7, '2022-06-27 02:32:28');

-- --------------------------------------------------------

--
-- Table structure for table `pengesahan_ruangan`
--

CREATE TABLE `pengesahan_ruangan` (
  `id` int(11) NOT NULL,
  `id_kartu_inventaris_ruangan` int(11) NOT NULL,
  `id_ruangan` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengesahan_ruangan`
--

INSERT INTO `pengesahan_ruangan` (`id`, `id_kartu_inventaris_ruangan`, `id_ruangan`, `created_at`) VALUES
(1, 1, 1, '2022-02-05 00:43:08');

-- --------------------------------------------------------

--
-- Table structure for table `ruangan`
--

CREATE TABLE `ruangan` (
  `id` int(11) NOT NULL,
  `nama_ruangan` varchar(255) NOT NULL,
  `id_lokasi` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ruangan`
--

INSERT INTO `ruangan` (`id`, `nama_ruangan`, `id_lokasi`, `status`, `keterangan`, `is_active`) VALUES
(1, 'Aula Pertemuan Kota', 1, 'Tersedia', 'Kondisi bagus', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL,
  `kode_barang` varchar(10) NOT NULL,
  `nomor_anggota` varchar(10) NOT NULL,
  `tanggal_datang` datetime NOT NULL,
  `tanggal_distribusi` datetime NOT NULL,
  `status` enum('datang','dikirim') NOT NULL DEFAULT 'datang',
  `bap` varchar(255) NOT NULL,
  `approval` int(11) NOT NULL,
  `waktu` enum('Pagi','Siang','Sore','Malam') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `kode_barang`, `nomor_anggota`, `tanggal_datang`, `tanggal_distribusi`, `status`, `bap`, `approval`, `waktu`) VALUES
(5, '0011006', '007', '2021-06-10 00:00:00', '2021-06-11 00:00:00', 'dikirim', 'contoh.pdf', 1, 'Pagi'),
(6, '0011006', '007', '2021-06-10 00:00:00', '2021-06-10 00:00:00', 'datang', 'contoh.pdf', 1, 'Pagi'),
(7, '0011006', '006', '2022-01-10 00:00:00', '2022-01-15 00:00:00', 'datang', 'contoh.pdf', 2, 'Pagi'),
(8, '8999555', '006', '2022-01-19 00:00:00', '2022-02-04 00:00:00', 'datang', 'contoh.pdf', 0, 'Pagi'),
(9, '8999555', '006', '2022-01-12 00:00:00', '2022-01-14 00:00:00', 'datang', 'contoh.pdf', 0, 'Pagi'),
(10, 'p001', '006', '2022-01-15 00:00:00', '2022-02-05 00:00:00', 'datang', 'SURAT-PENGANTAR-PENGAMBILAN-IJAZAH1.pdf', 0, 'Pagi');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_operator` varchar(50) NOT NULL,
  `nomor_anggota` varchar(10) NOT NULL,
  `hak_akses` enum('petugas','admin','kelurahan','kecamatan','pengelola') NOT NULL,
  `id_kecamatan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama_operator`, `nomor_anggota`, `hak_akses`, `id_kecamatan`) VALUES
(1, 'admin', 'admin', 'Admin', '001', 'admin', NULL),
(2, 'dediajalah', '12345678', 'dedi', '002', 'admin', NULL),
(5, 'bedul', '12345678', 'Bedul', '006', 'petugas', 1),
(6, 'kusno', '12345678', 'kusno', '007', 'petugas', 1),
(7, 'andini', '1234', 'Andini Septia', '008', 'kecamatan', 1),
(8, 'sentaurus', '1234', 'Senta Ruslamon', '009', 'pengelola', 1),
(9, 'sem', '1234', 'Solihin Emda', '010', 'kelurahan', 1),
(10, 'darwin', '1234', 'Darwin', '011', 'kecamatan', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kartu_inventaris_barang`
--
ALTER TABLE `kartu_inventaris_barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_pengesahan` (`kode_pengesahan`);

--
-- Indexes for table `kartu_inventaris_ruangan`
--
ALTER TABLE `kartu_inventaris_ruangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengesahan_barang`
--
ALTER TABLE `pengesahan_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengesahan_ruangan`
--
ALTER TABLE `pengesahan_ruangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ruangan`
--
ALTER TABLE `ruangan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `kartu_inventaris_barang`
--
ALTER TABLE `kartu_inventaris_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `kartu_inventaris_ruangan`
--
ALTER TABLE `kartu_inventaris_ruangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pengesahan_barang`
--
ALTER TABLE `pengesahan_barang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `pengesahan_ruangan`
--
ALTER TABLE `pengesahan_ruangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ruangan`
--
ALTER TABLE `ruangan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
