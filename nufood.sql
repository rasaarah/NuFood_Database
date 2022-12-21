-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 16 Nov 2016 pada 11.05
-- Versi Server: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nufood`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_makanan`
--

CREATE TABLE `tbl_makanan` (
  `id_makanan` int(11) NOT NULL,
  `nama_makanan` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_makanan`
--

INSERT INTO `tbl_makanan` (`id_makanan`, `nama_makanan`, `harga`) VALUES
(1, 'Soto Mie Bogor', 13000),
(2, 'Soto Ayam', 15000),
(3, 'Nasi Padang', 16000),
(4, 'D''Besto', 14000),
(5, 'Hisana', 14000),
(6, 'Sabana', 14000),
(7, 'Mie Ayam Kampung', 10000),
(8, 'Mie Ayam Dedi', 15000),
(9, 'Mie Ayam Ajib', 13000),
(10, 'Nasi Goreng', 12000),
(11, 'Ketoprak', 10000),
(12, 'Gado-gado', 15000),
(13, 'Ayam Bakar', 17000),
(14, 'Bakso Rawit', 15000),
(15, 'Bakso Urat', 15000),
(16, 'Pecel Ayam', 17000),
(17, 'Pecel Ati', 13000),
(18, 'Pecel Lele', 16000),
(19, 'Pecel Bebek', 23000),
(20, 'Nasi Goreng', 13000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_order`
--

CREATE TABLE `tbl_order` (
  `id_order` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `kode_pemesanan` int(10) NOT NULL,
  `id_makanan` int(11) NOT NULL,
  `note` text,
  `status` int(10) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `jenis_order` enum('Utama','Alternatif 1','Alternatif 2') NOT NULL,
  `jam_makan` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_order`
--

INSERT INTO `tbl_order` (`id_order`, `id_user`, `kode_pemesanan`, `id_makanan`, `note`, `status`, `waktu`, `jenis_order`, `jam_makan`) VALUES
(16, 35, 1, 11, '', 0, '2016-11-08 08:12:05', 'Utama', 0),
(17, 52, 2, 1, 'Utama', 1, '2016-11-16 10:02:35', 'Utama', 0),
(18, 52, 2, 4, 'Alt1', -1, '2016-11-16 10:02:35', 'Alternatif 1', 0),
(19, 52, 2, 5, 'Alt2', -1, '2016-11-16 10:02:35', 'Alternatif 2', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_topup`
--

CREATE TABLE `tbl_topup` (
  `id_topup` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `nilai_topup` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_topup`
--

INSERT INTO `tbl_topup` (`id_topup`, `id_user`, `nilai_topup`) VALUES
(2, 35, 25000),
(3, 36, 50000),
(4, 33, 50000),
(5, 35, 30000),
(6, 52, 70000),
(7, 68, 50000),
(8, 68, 10000),
(9, 68, 0),
(10, 68, -10000),
(11, 68, 0),
(12, 33, 0),
(13, 45, 60000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_order` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `waktu` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id_transaksi`, `id_user`, `id_order`, `harga`, `waktu`, `keterangan`) VALUES
(1, 52, 17, 13000, '2016-11-16 10:02:35', 'Sudah mba');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `saldo` float DEFAULT NULL,
  `status` enum('ob','karyawan','admin') NOT NULL,
  `token` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `nama`, `nama_lengkap`, `password`, `saldo`, `status`, `token`) VALUES
(30, 'noval', 'Noval Wahyu', '467bae90b19ee6eb379a749cb924f726', 0, 'ob', '272f6a89c756d197fcef4f70906172026c699d33'),
(31, 'wahyu', 'Wahyu Maulana Rizqi', '32c9e71e866ecdbc93e497482aa6779f', 0, 'ob', '47462bcb8139ba504a4fce1d55debe10f2cae9b4'),
(32, 'hafi', 'Muhammad Hafi', 'f85f10fdcd7d8c36f39b5497ac152d89', 0, 'ob', ''),
(33, 'agus', 'Agus Setiawan', 'fdf169558242ee051cca1479770ebac3', 22000, 'karyawan', '05234151487a6e2604e9e0f67d4a7b9c8e653e47'),
(34, 'ayi', 'Ayi Lestari', '3352224f8d2af6077fde6c45b60e26e9', 75000, 'karyawan', '7c74395531901b44f8f0724783c94917447504b3'),
(35, 'arty', 'Arty Tary Martina', '84659539fc6d9efe79cb090c5df28c8c', 12000, 'karyawan', 'f3e3f3d27c03b87ce9a11d25210c372877602c22'),
(36, 'bagir', 'Bagir Alfujri', '147625027cf1f1c5b281a253d1c38c65', 50000, 'karyawan', '4bccfbb200675b61b0769dfd20767a4128f53951'),
(37, 'cindy', 'Cindy', 'cc4b2066cfef89f2475de1d4da4b29c7', 0, 'karyawan', ''),
(38, 'dewi', 'Dewi Kartika Mala Sari', 'ed1d859c50262701d92e5cbf39652792', 0, 'karyawan', ''),
(39, 'donny', 'Donny', 'befcc07a5d7b46c63c6087f08bc601d4', 0, 'karyawan', ''),
(40, 'hana', 'Eka Hana Mulyantono', '52fd46504e1b86d80cfa22c0a1168a9d', -10000, 'karyawan', '37f15d8c54e46d749ba5203db8b16fbfb6b0fa96'),
(41, 'heri', 'Heri Ahmadi', '6812af90c6a1bbec134e323d7e70587b', 0, 'karyawan', ''),
(42, 'hafiz', 'Indah Hafiz', '839a54bf20626e4942bc8f11873f0654', 0, 'karyawan', ''),
(43, 'ircham', 'Ircham Fuadi', '30a3fc645604ac4d6871f3615232c264', -52000, 'karyawan', ''),
(44, 'andiyan', 'M Andiyan Perwira', 'b30b414b5d9c1a0b597e2e9d57692410', 0, 'karyawan', ''),
(45, 'popong', 'Pulong Atmoko', 'bf8dcb7dd9dd56256552fef258ebf6d0', 60000, 'karyawan', '8f0b27ee7fa468a30ab59d4fb5ed0f714c4f6d04'),
(46, 'purnomo', 'Setyo Purnomo', '7392ed5e575dc6fb7b4c98422673be72', 0, 'karyawan', ''),
(47, 'tris', 'Sutrisno', '7b1df8d14235bb3be1ea368d220bfac3', 0, 'karyawan', ''),
(48, 'subur', 'Subur Legowo', 'a1eb7a6eb40ac2fc6014cc5651636938', 90000, 'karyawan', '4e6a591c4ca4c92b0f9c197c0226881feb4be3a5'),
(49, 'wali', 'Syahwali', 'bf8cd26e6c6732b8df17a31b54800ed8', 0, 'karyawan', ''),
(50, 'wildan', 'Wildan Nurdiana', 'af6b3aa8c3fcd651674359f500814679', 0, 'karyawan', ''),
(51, 'iman', 'Iman Prihadi', '5be9a68073f66a56554e25614e9f1c9a', 0, 'karyawan', '61d412db005d1ccd0ca2d4dcabfe55fdd616e8ff'),
(52, 'miya', 'Miya', '3b650cc81ad6bfc4f7e84403c89294a8', 27000, 'karyawan', '140e9b859aff5a03190ff1d8f394432b3d3260d1'),
(53, 'nando', 'Nando Bonavia', '45a9a31e5f1ff59621b681a5edbffe85', 0, 'karyawan', ''),
(54, 'fajar', 'Fajar Hidayat', '24bc50d85ad8fa9cda686145cf1f8aca', 0, 'karyawan', ''),
(55, 'bagas', 'Bagas', 'ee776a18253721efe8a62e4abd29dc47', 0, 'karyawan', ''),
(56, 'rere', 'Rere', 'bd134207f74532a8b094676c4a2ca9ed', 0, 'karyawan', ''),
(57, 'oka', 'Oka', 'dcf80b2416ca823e8d807558a9310eb3', 0, 'karyawan', ''),
(58, 'didot', 'Didot', 'af5734ae74ce6fd7a804a355d89e5d66', 0, 'karyawan', ''),
(59, 'bayu', 'Bayu Rama Andiyawan', 'a430e06de5ce438d499c2e4063d60fd6', 0, 'karyawan', ''),
(68, 'arnas', ' Arnas', '418d89a45edadb8ce4da17e07f72536c', 37000, 'karyawan', ''),
(73, 'dani', 'ichsan ramdani', '55b7e8b895d047537e672250dd781555', 50000, 'karyawan', ''),
(75, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', NULL, 'admin', '8293a9273b487dcf86e92530d8e28b9a08e9a12a'),
(79, 'rina', 'rina', '3aea9516d222934e35dd30f142fda18c', 0, 'ob', ''),
(80, 'aaa', 'aaa', '47bce5c74f589f4867dbd57e9ca9f808', 0, 'ob', 'fdda2131cc5625c64293e4dfdb07cd2c7facf12b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_makanan`
--
ALTER TABLE `tbl_makanan`
  ADD PRIMARY KEY (`id_makanan`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_makanan` (`id_makanan`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `tbl_topup`
--
ALTER TABLE `tbl_topup`
  ADD PRIMARY KEY (`id_topup`),
  ADD KEY `id_karyawan` (`id_user`);

--
-- Indexes for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_makanan`
--
ALTER TABLE `tbl_makanan`
  MODIFY `id_makanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `tbl_topup`
--
ALTER TABLE `tbl_topup`
  MODIFY `id_topup` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`id_makanan`) REFERENCES `tbl_makanan` (`id_makanan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_order_ibfk_3` FOREIGN KEY (`id_makanan`) REFERENCES `tbl_makanan` (`id_makanan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_order_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_topup`
--
ALTER TABLE `tbl_topup`
  ADD CONSTRAINT `tbl_topup_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD CONSTRAINT `tbl_transaksi_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_transaksi_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_transaksi_ibfk_3` FOREIGN KEY (`id_order`) REFERENCES `tbl_order` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_transaksi_ibfk_4` FOREIGN KEY (`id_user`) REFERENCES `tbl_user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_transaksi_ibfk_5` FOREIGN KEY (`id_order`) REFERENCES `tbl_order` (`id_order`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
