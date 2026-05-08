show databases;
create database db_rumah_sakit;


CREATE TABLE `DOKTER` (
  `id_dokter` int,
  `nama` varchar(255),
  `sp` varchar(255),
  `no_tlp` varchar(255),
  `kode_poli` int,
  PRIMARY KEY (`id_dokter`, `kode_poli`)
);

CREATE TABLE `POLIKLINIK` (
  `kode_poli` int PRIMARY KEY,
  `nama_poli` varchar(255)
);

CREATE TABLE `pasien` (
  `NIK` int PRIMARY KEY,
  `nama` varchar(30),
  `alamat` varchar(30),
  `BOD` datetime
);

CREATE TABLE `DAFTAR` (
  `no_antrean` int PRIMARY KEY,
  `tanggal_lahir` datemate,
  `NIK` int,
  `kode_poli` int
);

CREATE TABLE `RM` (
  `no_rm` int PRIMARY KEY,
  `nik` int,
  `kode_obat` int
);

CREATE TABLE `OBAT` (
  `kode_obat` int PRIMARY KEY,
  `nama_obat` varchar(255),
  `harga` int
);

ALTER TABLE `DOKTER` ADD FOREIGN KEY (`no_tlp`) REFERENCES `POLIKLINIK` (`kode_poli`);

ALTER TABLE `POLIKLINIK` ADD FOREIGN KEY (`kode_poli`) REFERENCES `DAFTAR` (`no_antrean`);

ALTER TABLE `DAFTAR` ADD FOREIGN KEY (`no_antrean`) REFERENCES `pasien` (`NIK`);

ALTER TABLE `pasien` ADD FOREIGN KEY (`NIK`) REFERENCES `RM` (`no_rm`);

ALTER TABLE `RM` ADD FOREIGN KEY (`no_rm`) REFERENCES `OBAT` (`kode_obat`);
