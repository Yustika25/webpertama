-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 11, 2020 at 03:47 PM
-- Server version: 10.1.40-MariaDB
-- PHP Version: 7.1.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `is_ada` enum('y','n') NOT NULL DEFAULT 'y',
  `kode_buku` varchar(255) NOT NULL,
  `id_judul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buku`
--

INSERT INTO `buku` (`id_buku`, `is_ada`, `kode_buku`, `id_judul`) VALUES
(1, 'y', 'a01', 1),
(2, 'n', 'a02', 1),
(3, 'n', 'b01', 2),
(4, 'y', 'a03', 1),
(5, 'y', 'a04', 1),
(6, 'y', 'a22', 2),
(7, 'y', 'b22', 1),
(8, 'n', 'a30', 2),
(9, 'y', 'b45', 1),
(10, 'y', 'b89', 1),
(11, 'y', 'a23', 2),
(12, 'y', 'c11', 3),
(13, 'y', 'p05', 2),
(14, 'y', 'a203', 4),
(15, 'y', '5674', 2);

-- --------------------------------------------------------

--
-- Table structure for table `denda`
--

CREATE TABLE `denda` (
  `id_denda` int(11) NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `is_kembali` enum('y','n') NOT NULL DEFAULT 'y',
  `jumlah` int(11) NOT NULL,
  `id_pinjam` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `denda`
--

INSERT INTO `denda` (`id_denda`, `tanggal_kembali`, `is_kembali`, `jumlah`, `id_pinjam`) VALUES
(1, '2019-06-28', 'y', 51000, 13),
(2, '2019-07-02', 'y', 85000, 15),
(3, '2019-07-10', 'y', 63000, 23);

-- --------------------------------------------------------

--
-- Table structure for table `judul`
--

CREATE TABLE `judul` (
  `id_judul` int(11) NOT NULL,
  `judul_buku` varchar(255) NOT NULL,
  `penulis` varchar(255) NOT NULL,
  `penerbit` varchar(255) NOT NULL,
  `cover` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `judul`
--

INSERT INTO `judul` (`id_judul`, `judul_buku`, `penulis`, `penerbit`, `cover`) VALUES
(1, 'Mengenal Codeignitger', 'Dio dava ramadha', 'Bintang kehidupan', '20190627063517.jpg'),
(2, 'Kata Kata Indah', 'Yustika', 'Obor', '20190626181037.jpg'),
(3, 'Mengenal Bulan', 'Saya Sendiri', 'Saya Sendiri', '20190626181421.jpg'),
(4, 'kata- kata mutiara ', 'dava', 'ramedia', '20190702083745.png');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `in_pinjam` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `id_siswa` int(10) NOT NULL,
  `id_buku` int(10) NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `is_kembali` enum('y','n') NOT NULL DEFAULT 'n'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `peminjaman`
--

CREATE TABLE `peminjaman` (
  `id_pinjam` int(11) NOT NULL,
  `tanggal_pinjam` date NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_buku` int(11) NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `is_kembali` enum('y','n') NOT NULL DEFAULT 'n',
  `id_judul` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `peminjaman`
--

INSERT INTO `peminjaman` (`id_pinjam`, `tanggal_pinjam`, `id_siswa`, `id_buku`, `tanggal_kembali`, `is_kembali`, `id_judul`) VALUES
(10, '2019-05-01', 1, 6, '2019-06-28', 'y', 2),
(11, '2019-06-28', 1, 2, '2019-06-28', 'y', 1),
(12, '2019-06-28', 3, 7, '2019-06-29', 'y', 1),
(13, '2019-05-01', 1, 6, '2019-06-28', 'y', 2),
(14, '2019-06-28', 3, 3, '0000-00-00', 'n', 2),
(15, '2019-04-01', 1, 6, '2019-07-02', 'y', 2),
(16, '2019-06-30', 4, 8, '0000-00-00', 'n', 2),
(17, '2019-07-02', 4, 13, '2019-07-02', 'y', 2),
(18, '2019-07-03', 4, 12, '2019-07-03', 'y', 3),
(19, '2019-07-03', 1, 6, '2019-07-03', 'y', 2),
(20, '2019-07-03', 5, 2, '0000-00-00', 'n', 1),
(21, '2019-07-03', 4, 15, '2019-07-10', 'y', 2),
(22, '2019-07-03', 5, 13, '2019-07-03', 'y', 2),
(23, '2019-05-01', 1, 6, '2019-07-10', 'y', 2);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(10) NOT NULL,
  `nis` varchar(4) NOT NULL,
  `nama_siswa` varchar(255) NOT NULL,
  `jenis_kelamin` enum('l','p') NOT NULL,
  `email` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nis`, `nama_siswa`, `jenis_kelamin`, `email`) VALUES
(1, '4151', 'Azam', 'l', 'dioramadhan74@gmail.com'),
(4, '9019', 'Fani', 'p', ''),
(5, '014', 'vina', 'p', ''),
(6, '015', 'tono', 'l', 'ketoprakenak12@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_user` varchar(225) NOT NULL,
  `level` enum('admin','operator') NOT NULL,
  `is_blokir` enum('y','n') NOT NULL DEFAULT 'n',
  `profile` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `nama_user`, `level`, `is_blokir`, `profile`) VALUES
(2, 'ramadhan', '95ee5253d5409d3f32f1dad503718fa1', 'dio dava ramadha', 'admin', 'n', '20190711161036.jpg'),
(5, 'yustika', 'c27cd12c8034c739304c22a3a3748e39', 'Yustika Heti Handal', 'operator', 'n', '20190817154315.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `denda`
--
ALTER TABLE `denda`
  ADD PRIMARY KEY (`id_denda`);

--
-- Indexes for table `judul`
--
ALTER TABLE `judul`
  ADD PRIMARY KEY (`id_judul`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`in_pinjam`);

--
-- Indexes for table `peminjaman`
--
ALTER TABLE `peminjaman`
  ADD PRIMARY KEY (`id_pinjam`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `denda`
--
ALTER TABLE `denda`
  MODIFY `id_denda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `judul`
--
ALTER TABLE `judul`
  MODIFY `id_judul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `in_pinjam` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peminjaman`
--
ALTER TABLE `peminjaman`
  MODIFY `id_pinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
