
CREATE DATABASE tokoOnline;

USE tokoOnline;

SHOW DATABASES;

CREATE TABLE anggota(
	idAnggota 	INT 		NOT NULL,
	username 	VARCHAR(50)	NOT NULL,
	passwordAnggota	VARCHAR(20)	NOT NULL,
	email		VARCHAR(100)	NOT NULL,
	fullName	VARCHAR(50)	NOT NULL,
	alamat		VARCHAR(100)	NOT NULL,
	telepon		VARCHAR(20)	NOT NULL,
	kelamin	ENUM('laki-laki','perempuan')
) ENGINE INNODB;

CREATE TABLE peringkat(
	idPeringkat	INT	NOT NULL,
	idAnggota	INT	NOT NULL,
	idProduk	INT	NOT NULL,
	nilai		INT	NOT NULL
) ENGINE INNODB;

CREATE TABLE komentar(
	idKomentar	INT		NOT NULL,
	idAnggota	INT		NOT NULL,
	idProduk	INT		NOT NULL,
	pesan		VARCHAR(200)	NOT NULL
) ENGINE INNODB;

CREATE TABLE transaksi(
	idTransaksi		INT	NOT NULL,
	idAnggota		INT	NOT NULL,
	idProduk		INT	NOT NULL,
	jumlah			INT	DEFAULT 0,
	statusPenerimaan	ENUM('diterima','ditolak','menunggu')	NOT NULL
) ENGINE INNODB;

CREATE TABLE produk(
	idProduk	INT		NOT NULL,
	namaProduk	VARCHAR(50)	NOT NULL,
	tipeProduk	VARCHAR(30)	DEFAULT 'lain-lain',
	deskripsi	VARCHAR(200),
	stock		INT		DEFAULT 0,
	harga		INT 		DEFAULT 0
) ENGINE INNODB;

CREATE TABLE keranjang(
	idKeranjang	INT	NOT NULL,
	idAnggota	INT	NOT NULL,
	idProduk	INT	NOT NULL,
	jumlah		INT 	DEFAULT 0
) ENGINE INNODB;

SHOW TABLES;

ALTER TABLE anggota
	ADD PRIMARY KEY (idAnggota);
	
ALTER TABLE peringkat
	ADD PRIMARY KEY (idPeringkat);
	
ALTER TABLE komentar
	ADD PRIMARY KEY (idKomentar);
	
ALTER TABLE transaksi
	ADD PRIMARY KEY (idTransaksi);
	
ALTER TABLE produk
	ADD PRIMARY KEY (idProduk);
	
ALTER TABLE keranjang
	ADD PRIMARY KEY (idKeranjang);
	
ALTER TABLE peringkat
	ADD CONSTRAINT fkPeringkatAnggota
		FOREIGN KEY (idAnggota) REFERENCES anggota (idAnggota);
		
ALTER TABLE peringkat
	ADD CONSTRAINT fkPeringkatProduk
		FOREIGN KEY (idProduk) REFERENCES produk (idProduk);
		
ALTER TABLE komentar
	ADD CONSTRAINT fkKomentarAnggota
		FOREIGN KEY (idAnggota) REFERENCES anggota (idAnggota);
		
ALTER TABLE komentar
	ADD CONSTRAINT fkKomentarProduk
		FOREIGN KEY (idProduk) REFERENCES produk (idProduk);
		
ALTER TABLE transaksi
	ADD CONSTRAINT fkTransaksiAnggota
		FOREIGN KEY (idAnggota) REFERENCES anggota (idAnggota);
		
ALTER TABLE transaksi
	ADD CONSTRAINT fkTransaksiProduk
		FOREIGN KEY (idProduk) REFERENCES produk (idProduk);
		
ALTER TABLE keranjang
	ADD CONSTRAINT fkKeranjangAnggota
		FOREIGN KEY (idAnggota) REFERENCES anggota (idAnggota);
		
ALTER TABLE keranjang
	ADD CONSTRAINT fkKeranjangProduk
		FOREIGN KEY (idProduk) REFERENCES produk (idProduk);
		
DESC anggota;
DESC keranjang;
DESC komentar;
DESC peringkat;
DESC produk;
DESC transaksi;

SHOW CREATE TABLE anggota;
SHOW CREATE TABLE keranjang;
SHOW CREATE TABLE komentar;
SHOW CREATE TABLE peringkat;
SHOW CREATE TABLE produk;
SHOW CREATE TABLE transaksi;