-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2020 at 05:00 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_todolist`
--

-- --------------------------------------------------------

--
-- Table structure for table `aktivitas`
--

CREATE TABLE `aktivitas` (
  `no` int(3) NOT NULL,
  `kegiatan` varchar(20) NOT NULL,
  `deskripsi` text NOT NULL,
  `kondisi` int(2) NOT NULL,
  `done` varchar(10) NOT NULL DEFAULT '''belum'''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aktivitas`
--

INSERT INTO `aktivitas` (`no`, `kegiatan`, `deskripsi`, `kondisi`, `done`) VALUES
(13, 'Ulang tahun bebeb', 'Ulang tahun bebeb yang ke 19, jangan lupa beli kado yang bagus, okay?', 3, 'belum'),
(14, 'UJIAN', 'jangan lupa belajar, ujian makin dekat bambang, gimana mau dapet nilai bagus kalau belajar aja ga mau..', 3, 'sudah'),
(15, 'Tugas', 'Jangan Lupa, Tugas dikumpulin lho..', 1, 'belum');

-- --------------------------------------------------------

--
-- Table structure for table `sifat`
--

CREATE TABLE `sifat` (
  `id` int(11) NOT NULL,
  `sifat` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sifat`
--

INSERT INTO `sifat` (`id`, `sifat`) VALUES
(1, 'Mendesak'),
(2, 'Segera'),
(3, 'Penting'),
(4, 'Biasa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aktivitas`
--
ALTER TABLE `aktivitas`
  ADD PRIMARY KEY (`no`);

--
-- Indexes for table `sifat`
--
ALTER TABLE `sifat`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aktivitas`
--
ALTER TABLE `aktivitas`
  MODIFY `no` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sifat`
--
ALTER TABLE `sifat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
