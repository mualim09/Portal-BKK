-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 07 Okt 2020 pada 03.49
-- Versi Server: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bkk`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jadwal`
--

CREATE TABLE `tb_jadwal` (
  `kode_jadwal` varchar(6) NOT NULL,
  `id_loker` varchar(10) NOT NULL,
  `tgl_tes` date NOT NULL,
  `tempat` varchar(60) NOT NULL,
  `waktu` varchar(30) NOT NULL,
  `keterangan` enum('Tampil','Arsip') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jadwal`
--

INSERT INTO `tb_jadwal` (`kode_jadwal`, `id_loker`, `tgl_tes`, `tempat`, `waktu`, `keterangan`) VALUES
('P001', 'ADM01', '2020-08-28', 'Aula Kelas SMK NU Maarif Kudus', '10.00 - Selesai', 'Tampil'),
('P002', 'PLJ89K', '2020-09-19', 'Aula SMK NU Maarif 2 Kudus', '10.00 - Selesai', 'Tampil'),
('P003', 'AHM02', '2020-10-02', 'Aula Kelas SMK NU Maarif Kudus', '10.00 - Selesai', 'Tampil'),
('P004', 'ADM01', '2020-09-30', 'Aula SMK NU Ma\'arif Kudus', '08.00 - Selesai', 'Tampil');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jurusan`
--

CREATE TABLE `tb_jurusan` (
  `kode_jur` varchar(5) NOT NULL,
  `nama_jur` varchar(30) NOT NULL,
  `keterangan` text NOT NULL,
  `tahun` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_jurusan`
--

INSERT INTO `tb_jurusan` (`kode_jur`, `nama_jur`, `keterangan`, `tahun`) VALUES
('TPP', 'Teknik Pengolahan Hasil Pertan', 'Mempelajari tentang pengolahan hasil pertanian        ', 2013),
('TSM1', 'Teknik Sepeda Motor', 'Teknik Sepeda Motor mempelajari tentang praktek memperbaiki sepeda motor', 2012);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kelulusan`
--

CREATE TABLE `tb_kelulusan` (
  `kode_hasil` varchar(5) NOT NULL,
  `id_loker` varchar(10) NOT NULL,
  `berkas` varchar(50) NOT NULL,
  `url` text NOT NULL,
  `keterangan` enum('Tampil','Arsip') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kelulusan`
--

INSERT INTO `tb_kelulusan` (`kode_hasil`, `id_loker`, `berkas`, `url`, `keterangan`) VALUES
('HAM03', 'AHM03', 'MTA 2.1.pdf', 'http://localhost/bkk/admin/kelulusan/terupload/MTA 2.1.pdf', 'Tampil'),
('PO01', 'AHM01', 'sdg.pdf', 'http://localhost/bkk/admin/kelulusan/terupload/sdg.pdf', 'Tampil');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_loker`
--

CREATE TABLE `tb_loker` (
  `id_loker` varchar(10) NOT NULL,
  `nm_perusahaan` varchar(50) NOT NULL,
  `nm_loker` varchar(50) NOT NULL,
  `keterangan` text NOT NULL,
  `sumber` varchar(40) NOT NULL,
  `status` enum('Tangguhkan','Tampil','Arsip') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_loker`
--

INSERT INTO `tb_loker` (`id_loker`, `nm_perusahaan`, `nm_loker`, `keterangan`, `sumber`, `status`) VALUES
('ADM01', 'Astra Daihatsu Motor', 'Assembly, Body', 'Perakitan Body Works', 'PT. Astra Daihatsu', 'Tampil'),
('AHM01', 'PT. Astra Honda Motor', 'Teknisi', 'Pria Lulusan SMK Kejuruan', 'PT. Astra Honda Motor', 'Tampil'),
('AHM02', 'PT. Astra Honda Motor', 'Quality Control', 'QC Bag. Final Assembly', 'PT. Astra Honda Motor', 'Tampil'),
('AHM03', 'PT. Astra Honda Motor', 'Perakitan Mesin Dan Rangka', 'Jurusan SMK Teknik Pemesinan atau Otomotif Coba', 'PT. Astra Honda Motor', 'Arsip'),
('AHM087', 'CV Sri Slamet', 'Pengelasan', 'Pria Umur 24', 'Febrian Syahbana', 'Arsip'),
('PLJ89K', 'PT. Pura', 'Welding', 'Jurusan Pengelasan, Pemesinan', 'Mochammad Febrian Syahbana', 'Tangguhkan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pendaftaran`
--

CREATE TABLE `tb_pendaftaran` (
  `id_pendaftaran` varchar(10) NOT NULL,
  `id_loker` varchar(10) NOT NULL,
  `nisn` varchar(15) NOT NULL,
  `berkas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_peserta`
--

CREATE TABLE `tb_peserta` (
  `nisn` varchar(15) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jekel` enum('Pria','Wanita') NOT NULL,
  `tempat_lhr` varchar(15) NOT NULL,
  `tgl_lhr` date NOT NULL,
  `nama_ortu` varchar(25) NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(15) NOT NULL,
  `jurusan` varchar(35) NOT NULL,
  `id_sekolah` varchar(5) NOT NULL,
  `tahun_lulus` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_peserta`
--

INSERT INTO `tb_peserta` (`nisn`, `nama`, `jekel`, `tempat_lhr`, `tgl_lhr`, `nama_ortu`, `alamat`, `telp`, `jurusan`, `id_sekolah`, `tahun_lulus`) VALUES
('12345', 'Riani Ananta Putri', 'Wanita', 'Kudus', '1999-09-25', 'Cahyo', 'Dsahjah', '089876567888', 'Teknik Rekayasa Perangkat Lunak', 'YSM02', 2018),
('201653054', 'Mochammad Febrian Syahbana', 'Pria', 'Kudus', '1999-08-13', 'Isom', 'Desa Golantepus Rt 01/04 Mejobo Kudus', '08980695197', 'Teknik Pemesinan', 'YSM01', 2017),
('201653055', 'Yudha Aris Kristanto', 'Pria', 'Balikpapan', '1998-08-28', 'Sumarlan Odi', 'Desa Ploso Depan Politekik Kudus, Jati Kudus', '089876567888', 'Teknik Listrik', 'YSM02', 2018),
('201653056', 'Febrian', 'Pria', 'Kudus', '1999-02-10', 'Isom', 'Desa Golantepus RT 1 RW 04 ', '089806789009', 'Teknik Rekayasa Perangkat Lunak', 'YSM01', 2018),
('201653059', 'Nisa Cahya', 'Wanita', 'Kudus', '2000-08-14', 'Cahyo', 'Desa Undaan', '08980695197', 'Teknik Rekayasa Perangkat Lunak', 'YSM02', 2018),
('282930', 'Riani Ananta Putri', 'Wanita', 'Kudus', '1999-02-10', 'Rony', 'Kudus', '085226224831', 'Teknik Rekayasa Perangkat Lunak', 'YSM01', 2019);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_sekolah`
--

CREATE TABLE `tb_sekolah` (
  `id_sekolah` varchar(5) NOT NULL,
  `nama_sekolah` varchar(35) NOT NULL,
  `email` varchar(40) NOT NULL,
  `keterangan` text NOT NULL,
  `tahun` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_sekolah`
--

INSERT INTO `tb_sekolah` (`id_sekolah`, `nama_sekolah`, `email`, `keterangan`, `tahun`) VALUES
('YSM01', 'SMK NU MA\'ARIF 1 KUDUS', 'smknumaarif@gmail.com', 'Desa Prambatan Lor No.679, Pereng, Prambatan Kudus 59361', 1991),
('YSM02', 'SMK NU MA\'ARIF 2 KUDUS', 'smknumaarif2@gmail.com', 'Jl. Raya Siliwangi Gg. 1 No. 99, Karang, Jekulo Kudus 59382', 2010),
('YSM03', 'SMK NU MA\'ARIF 3 KUDUS', 'smknumaarif3@yahoo.co.id', 'Desa Golantepus Kec. Mejobo Kab. Kudus 59381', 2009);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_tracer`
--

CREATE TABLE `tb_tracer` (
  `id_alumni` varchar(9) NOT NULL,
  `nisn` varchar(15) NOT NULL,
  `status` enum('Bekerja','Studi') NOT NULL,
  `nama_instansi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_tracer`
--

INSERT INTO `tb_tracer` (`id_alumni`, `nisn`, `status`, `nama_instansi`) VALUES
('ASM0001', '201653054', 'Studi', 'Univesitas Muria Kudus'),
('ASM0002', '201653055', 'Bekerja', 'PT. Pura Engineering'),
('ASM0003', '282930', 'Bekerja', 'PT. Telkomsel Indonesia'),
('ASM0004', '12345', 'Studi', 'Univesitas Muria Kudus');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_user`
--

CREATE TABLE `tb_user` (
  `nisn` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `level` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_user`
--

INSERT INTO `tb_user` (`nisn`, `password`, `level`) VALUES
('201653054', 'Febrian', 'Peserta'),
('201653056', 'Febrian123', 'Peserta'),
('282930', 'Riani', 'Peserta'),
('201653059', 'nisa', 'Peserta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `username` varchar(5) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `password` varchar(8) NOT NULL,
  `email` varchar(40) NOT NULL,
  `alamat` text NOT NULL,
  `level` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`username`, `nama`, `password`, `email`, `alamat`, `level`) VALUES
('OP01', 'Febrian Syahbana', 'febrian', 'syahbanafebrian@gmail.com', 'Golantepus', 'Operator'),
('P001', 'PT. Astra Honda Motor', 'ahm', 'ahmindonesia@gmail.com', 'Kompleks Industri Kab. Tangerang Prov. DKI Jakarta', 'Perusahaan / CV'),
('P002', 'PT. Astra Daihatsu', 'adm', 'admindo@gmail.com', 'Kompleks Industri Kab. Tangerang Prov. DKI Jakarta', 'Perusahaan / CV'),
('PB01', 'PT. Pura Barutama', 'pura', 'purabarutama@gmail.com', 'Jalan Raya Kudus Pati KM 26 Jekulo Kudus                                ', 'Perusahaan / CV'),
('YSM01', 'SMK NU Ma\'arif 1 Kudus', 'smknu1', 'smknumaarif@gmail.com', 'Desa Prambatan Lor', 'Ka. BKK'),
('YSM02', 'SMK NU Ma\'arif 2 Kudus', 'smknu2', 'smknumaarif2@gmail.com', 'Bulung Cangkring, Jekulo Kudus', 'Ka. BKK'),
('YSM03', 'SMK NU Maarif 3 Kudus', 'smknu3', 'smknu3maarif@gmail.com', 'Desa Golantepus Mejobo Kudus', 'Ka. BKK');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD PRIMARY KEY (`kode_jadwal`),
  ADD KEY `id_loker` (`id_loker`);

--
-- Indexes for table `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  ADD PRIMARY KEY (`kode_jur`);

--
-- Indexes for table `tb_kelulusan`
--
ALTER TABLE `tb_kelulusan`
  ADD PRIMARY KEY (`kode_hasil`),
  ADD KEY `id_loker` (`id_loker`);

--
-- Indexes for table `tb_loker`
--
ALTER TABLE `tb_loker`
  ADD PRIMARY KEY (`id_loker`);

--
-- Indexes for table `tb_pendaftaran`
--
ALTER TABLE `tb_pendaftaran`
  ADD PRIMARY KEY (`id_pendaftaran`),
  ADD KEY `id_loker` (`id_loker`),
  ADD KEY `nisn` (`nisn`);

--
-- Indexes for table `tb_peserta`
--
ALTER TABLE `tb_peserta`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `id_sekolah` (`id_sekolah`);

--
-- Indexes for table `tb_sekolah`
--
ALTER TABLE `tb_sekolah`
  ADD PRIMARY KEY (`id_sekolah`);

--
-- Indexes for table `tb_tracer`
--
ALTER TABLE `tb_tracer`
  ADD PRIMARY KEY (`id_alumni`),
  ADD KEY `nisn` (`nisn`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD KEY `nisn` (`nisn`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_jadwal`
--
ALTER TABLE `tb_jadwal`
  ADD CONSTRAINT `tb_jadwal_ibfk_1` FOREIGN KEY (`id_loker`) REFERENCES `tb_loker` (`id_loker`);

--
-- Ketidakleluasaan untuk tabel `tb_kelulusan`
--
ALTER TABLE `tb_kelulusan`
  ADD CONSTRAINT `tb_kelulusan_ibfk_1` FOREIGN KEY (`id_loker`) REFERENCES `tb_loker` (`id_loker`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pendaftaran`
--
ALTER TABLE `tb_pendaftaran`
  ADD CONSTRAINT `tb_pendaftaran_ibfk_1` FOREIGN KEY (`id_loker`) REFERENCES `tb_loker` (`id_loker`),
  ADD CONSTRAINT `tb_pendaftaran_ibfk_2` FOREIGN KEY (`nisn`) REFERENCES `tb_peserta` (`nisn`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_peserta`
--
ALTER TABLE `tb_peserta`
  ADD CONSTRAINT `tb_peserta_ibfk_1` FOREIGN KEY (`id_sekolah`) REFERENCES `tb_sekolah` (`id_sekolah`);

--
-- Ketidakleluasaan untuk tabel `tb_tracer`
--
ALTER TABLE `tb_tracer`
  ADD CONSTRAINT `tb_tracer_ibfk_1` FOREIGN KEY (`nisn`) REFERENCES `tb_peserta` (`nisn`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_user`
--
ALTER TABLE `tb_user`
  ADD CONSTRAINT `tb_user_ibfk_1` FOREIGN KEY (`nisn`) REFERENCES `tb_peserta` (`nisn`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
