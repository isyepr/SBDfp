--TABLE--
CREATE TABLE MEMBER1(
M_NO CHAR(5) PRIMARY KEY,
M_NAMA VARCHAR(100),
M_TGLLAHIR DATE,
M_ALAMAT VARCHAR(100),
M_TELP VARCHAR(15),
M_TGLDAFTAR DATE
);

CREATE TABLE KARYAWAN(
K_KODE CHAR(5) PRIMARY KEY,
C_ID INTEGER,
K_NAMA VARCHAR(100),
K_ALAMAT VARCHAR (100),
K_BAGIAN VARCHAR (20),
K_TGLMASUK DATE
);

CREATE TABLE CABANG(
C_ID INTEGER PRIMARY KEY,
C_ALAMAT VARCHAR(100),
C_TELP VARCHAR(15)
);

CREATE TABLE PROMO(
  P_ID INTEGER PRIMARY KEY,
  P_NAMA VARCHAR(20),
  P_DESKRIPSI VARCHAR (100),
  P_TGLMULAI DATE,
  P_TGLSELESAI DATE,
  P_DISKON INTEGER
);

CREATE TABLE JENIS_LAYANAN(
J_ID INTEGER PRIMARY KEY,
J_NAMA VARCHAR (100),
J_HARGA INTEGER
);

CREATE TABLE NOTA(
N_NOTA INTEGER,
N_TGLMASUK DATE,
N_TGLJADI DATE,
N_TGLAMBIL DATE,
KODE_RAK INTEGER,
N_CBGAMBIL INTEGER,
N_CBGMASUK INTEGER
);

CREATE TABLE STATUS_PEMBAYARAN(
SP_ID INTEGER PRIMARY KEY,
SP_KET INTEGER
);

CREATE TABLE STATUS_TRANSAKSI(
ST_ID INTEGER PRIMARY KEY,
ST_KET INTEGER
);

ALTER TABLE DETIL_NOTA
ADD CONSTRAINT FK_N_NOTA
FOREIGN KEY (N_NOTA) REFERENCE NOTA(N_NOTA);

ALTER TABLE DETIL_NOTA
ADD CONSTRAINT FK_J_ID
FOREIGN KEY (J_ID) REFERENCE JENIS_LAYANAN(J_ID);

ALTER TABLE DETIL_KARYAWAN
ADD CONSTRAINT FK_K_KODE
FOREIGN KEY (K_KODE) REFERENCE KARYAWAN(K_KODE);

ALTER TABLE DETIL_KARYAWAN
ADD CONSTRAINT FK_N_NOTA
FOREIGN KEY (N_NOTA) REFERENCE NOTA(N_NOTA);

ALTER TABLE NOTA
ADD CONSTRAINT FK_ST_ID 
FOREIGN KEY (ST_ID) REFERENCE STATUS_TRANSAKSI(ST_ID);

ALTER TABLE NOTA
ADD CONSTRAINT FK_SP_ID
FOREIGN KEY (SP_ID) REFERENCE STATUS_PEMBAYARAN(SP_ID);

ALTER TABLE NOTA
ADD CONSTRAINT FK_P_ID
FOREIGN KEY (P_ID) REFERENCE PROMO(P_ID);

ALTER TABLE NOTA
ADD CONSTRAINT FK_M_ID
FOREIGN KEY (M_ID) REFERENCE
