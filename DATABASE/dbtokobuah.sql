-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jun 2025 pada 06.38
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbtokobuah`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$AIy0X1Ep6alaHDTofiChGeqq7k/d1Kc8vKQf1JZo0mKrzkkj6M626');

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `kode_customer` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telp` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`kode_customer`, `nama`, `email`, `username`, `password`, `telp`) VALUES
('C0004', 'Nadiya', 'nadiya@gmail.com', 'nadiya', '$2y$10$6wHH.7rF1q3JtzKgAhNFy.4URchgJC8R.POT1osTAWmasDXTTO7ZG', '0898765432'),
('C0005', 'Agus', 'agus@gmail.com', 'agus', '$2y$10$nMpGeqG9bvq7HTnHR6TKjeTKkv7vOcXdaWtVsGT.YRzWSf671MiEO', '+62812345678'),
('C0007', 'suli', 'suli@gmail.com', 'suli', '$2y$10$znZ5n.0yKLTvctlXl3MKEuUKQAicZQsmPgimHfU3WVxYE4CibgFAm', '761284521857'),
('C0008', 'marwan', 'marwan@gmail.com', 'marwan', '$2y$10$/ZYV51RAI0pYENfllT8r8OX9umK6XnHTZz0RlzUjDg2EWrJL.fju6', '532725454327');

-- --------------------------------------------------------

--
-- Struktur dari tabel `inventory`
--

CREATE TABLE `inventory` (
  `kode_bk` varchar(100) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `qty` varchar(200) NOT NULL,
  `satuan` varchar(200) NOT NULL,
  `harga` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `inventory`
--

INSERT INTO `inventory` (`kode_bk`, `nama`, `qty`, `satuan`, `harga`, `tanggal`) VALUES
('M0001', 'Apel Malang', '16', 'Kg', 25000, '2025-06-11'),
('M0002', 'Anggur Merah', '40', 'Kg', 35000, '2025-06-11'),
('M0003', 'Melon', '15', 'Kg', 20000, '2025-06-11'),
('M0004', 'Strawbery', '7', 'Kg', 30000, '2025-06-11'),
('M0005', 'Nanas', '30', 'Kg', 15000, '2025-06-11'),
('M0006', 'Alpukat', '25', 'Kg', 25000, '2025-06-12'),
('M0007', 'Semangka', '15', 'Kg', 15000, '2025-06-12'),
('M0008', 'Jeruk', '50', 'Kg', 20000, '2025-06-12'),
('M0009', 'Mangga', '30', 'Kg', 25000, '2025-06-12'),
('M0010', 'Kelengkeng', '0', 'Kg', 35000, '2025-06-12'),
('M0011', 'Manggis', '30', 'Kg', 30000, '2025-06-12'),
('M0012', 'Pisang Raja', '20', 'Kg', 15000, '2025-06-12'),
('M0013', 'Wortel', '20', 'kg', 10000, '2025-06-12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `kode_customer` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `keranjang`
--

INSERT INTO `keranjang` (`id_keranjang`, `kode_customer`, `kode_produk`, `nama_produk`, `qty`, `harga`) VALUES
(26, 'C0003', 'P0005', 'Nanas', 1, 15000),
(31, 'C0008', 'P0002', 'Anggur Merah', 2, 30000),
(32, 'C0008', 'P0008', 'Jeruk', 1, 20000),
(33, 'C0008', 'P0003', 'Melon', 2, 20000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `kode_produk` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`kode_produk`, `nama`, `image`, `deskripsi`, `harga`) VALUES
('P0001', 'Apel Malang', '68444f93c715e.png', 'Apel segar dari malang									', 25000),
('P0002', 'Anggur Merah', '68445018d9fd9.png', 'anggur merah\r\n									', 30000),
('P0003', 'Melon', '684450a788d3e.png', 'Melon segar manis', 20000),
('P0004', 'Strawbery', '684451af62550.png', 'Strawbery super\r\n			', 30000),
('P0005', 'Nanas', '684451ddb4da2.png', 'Nanas super asal pemalang\r\n			', 15000),
('P0006', 'Alpukat', '684451fe0be38.png', 'Alpukat mentega daging tebal\r\n			', 25000),
('P0007', 'Semangka', '684a0bdf52883.png', 'Semngka segar unggulan\r\n			', 15000),
('P0008', 'Jeruk', '684a0c9cdf9d6.png', 'Jeruk Orange berkualitas\r\n			', 20000),
('P0009', 'Mangga ', '684a0d1c0be22.png', 'Mangga haum manis dengan kualitas super\r\n			', 25000),
('P0010', 'Kelengkeng', '684a0e48765c2.png', 'Kelengkeng super manis\r\n			', 35000),
('P0011', 'Manggis', '684a0ec07b9dd.png', 'Manggis dengan pilihan terbaik\r\n			', 30000),
('P0012', 'Pisang Raja', '684a0f3b76504.png', 'Pisang super manis\r\n			', 15000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produksi`
--

CREATE TABLE `produksi` (
  `id_order` int(11) NOT NULL,
  `invoice` varchar(200) NOT NULL,
  `kode_customer` varchar(200) NOT NULL,
  `kode_produk` varchar(200) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `status` varchar(200) NOT NULL,
  `tanggal` date NOT NULL,
  `provinsi` varchar(200) NOT NULL,
  `kota` varchar(200) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `kode_pos` varchar(200) NOT NULL,
  `terima` varchar(200) NOT NULL,
  `tolak` varchar(200) NOT NULL,
  `cek` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produksi`
--

INSERT INTO `produksi` (`id_order`, `invoice`, `kode_customer`, `kode_produk`, `nama_produk`, `qty`, `harga`, `status`, `tanggal`, `provinsi`, `kota`, `alamat`, `kode_pos`, `terima`, `tolak`, `cek`) VALUES
(16, 'INV0007', 'C0007', 'P0002', 'Anggur Merah', 1, 35000, 'Pesanan Baru', '2525-06-07', 'jawa tengah', 'semarang', 'karonsih', '1234', '2', '1', 0),
(17, 'INV0008', 'C0008', 'P0002', 'Anggur Merah', 1, 35000, 'Pesanan Diterima (Siap Kirim)', '2525-06-10', 'sumsel', 'palembang', 'musi banyasin', '1451545', '1', '0', 0),
(18, 'INV0009', 'C0008', 'P0002', 'Anggur Merah', 1, 35000, '0', '2525-06-12', '', '', '', '', '1', '0', 0),
(19, 'INV0010', 'C0008', 'P0011', 'Manggis', 1, 30000, 'Pesanan Baru', '2525-06-12', 'PONDOK PESANTREN MADINATUL AMIN', 'PONDOK PESANTREN MADINATUL AMIN', 'Ngaliyan, Kota Semarang', '478324', '2', '1', 0),
(20, 'INV0011', 'C0008', 'P0001', 'Apel Malang', 3, 25000, 'Pesanan Diterima (Siap Kirim)', '2525-06-12', 'jawa tengah', 'Kota Semarang', 'Ngaliyan, Kota Semarang', '7890', '1', '0', 0),
(21, 'INV0011', 'C0008', 'P0003', 'Melon', 3, 20000, 'Pesanan Diterima (Siap Kirim)', '2525-06-12', 'jawa tengah', 'Kota Semarang', 'Ngaliyan, Kota Semarang', '7890', '1', '0', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `report_cancel`
--

CREATE TABLE `report_cancel` (
  `id_report_cancel` int(11) NOT NULL,
  `id_order` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `jumlah` varchar(100) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `report_inventory`
--

CREATE TABLE `report_inventory` (
  `id_report_inv` int(11) NOT NULL,
  `kode_bk` varchar(100) NOT NULL,
  `nama_bahanbaku` varchar(100) NOT NULL,
  `jml_stok_bk` int(11) NOT NULL,
  `tanggal` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `report_omset`
--

CREATE TABLE `report_omset` (
  `id_report_omset` int(11) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_omset` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `report _penjualan`
--

CREATE TABLE `report _penjualan` (
  `id_report_sell` int(11) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `jumlah_terjual` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `report_produksi`
--

CREATE TABLE `report_produksi` (
  `id_report_prd` int(11) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `report_profit`
--

CREATE TABLE `report_profit` (
  `id_report_profit` int(11) NOT NULL,
  `kode_bom` varchar(100) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `jumlah` varchar(11) NOT NULL,
  `total_profit` varchar(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`kode_customer`);

--
-- Indeks untuk tabel `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`kode_bk`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`kode_produk`);

--
-- Indeks untuk tabel `produksi`
--
ALTER TABLE `produksi`
  ADD PRIMARY KEY (`id_order`);

--
-- Indeks untuk tabel `report_cancel`
--
ALTER TABLE `report_cancel`
  ADD PRIMARY KEY (`id_report_cancel`);

--
-- Indeks untuk tabel `report_inventory`
--
ALTER TABLE `report_inventory`
  ADD PRIMARY KEY (`id_report_inv`);

--
-- Indeks untuk tabel `report_omset`
--
ALTER TABLE `report_omset`
  ADD PRIMARY KEY (`id_report_omset`);

--
-- Indeks untuk tabel `report _penjualan`
--
ALTER TABLE `report _penjualan`
  ADD PRIMARY KEY (`id_report_sell`);

--
-- Indeks untuk tabel `report_produksi`
--
ALTER TABLE `report_produksi`
  ADD PRIMARY KEY (`id_report_prd`);

--
-- Indeks untuk tabel `report_profit`
--
ALTER TABLE `report_profit`
  ADD PRIMARY KEY (`id_report_profit`),
  ADD UNIQUE KEY `kode_bom` (`kode_bom`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `produksi`
--
ALTER TABLE `produksi`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `report_cancel`
--
ALTER TABLE `report_cancel`
  MODIFY `id_report_cancel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `report_inventory`
--
ALTER TABLE `report_inventory`
  MODIFY `id_report_inv` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `report_omset`
--
ALTER TABLE `report_omset`
  MODIFY `id_report_omset` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `report _penjualan`
--
ALTER TABLE `report _penjualan`
  MODIFY `id_report_sell` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `report_produksi`
--
ALTER TABLE `report_produksi`
  MODIFY `id_report_prd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `report_profit`
--
ALTER TABLE `report_profit`
  MODIFY `id_report_profit` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
