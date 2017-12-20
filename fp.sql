--TABLE--
CREATE TABLE MEMBER_TABLE(
M_ID CHAR(5) PRIMARY KEY,
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
N_NOTA INTEGER PRIMARY KEY,
ST_ID integer,
P_ID integer,
M_ID char(5),
SP_id  integer,
N_TGLMASUK DATE,
N_TGLJADI DATE,
N_TGLAMBIL DATE,
KODE_RAK INTEGER,
N_CBGAMBIL INTEGER,
N_CBGPROSES INTEGER,
N_CBGMASUK INTEGER,
N_HARGABLMDISKON INTEGER,
N_HARGADISKON INTEGER
);


CREATE TABLE STATUS_PEMBAYARAN(
SP_ID INTEGER PRIMARY KEY,
SP_KET INTEGER
);


CREATE TABLE STATUS_TRANSAKSI(
ST_ID INTEGER PRIMARY KEY,
ST_KET INTEGER
);

CREATE TABLE DETIL_NOTA(
N_NOTA INTEGER ,
J_ID INTEGER);

CREATE TABLE DETIL_KARYAWAN(
K_KODE CHAR(5),
N_NOTA INTEGER
);
drop table detil_nota;
drop table detil_karyawan;
drop table nota;

ALTER TABLE DETIL_NOTA
ADD CONSTRAINT FK_N_NOTA
FOREIGN KEY (N_NOTA) REFERENCES NOTA(N_NOTA);

ALTER TABLE DETIL_NOTA
ADD CONSTRAINT FK_J_ID
FOREIGN KEY (J_ID) REFERENCES JENIS_LAYANAN(J_ID);

ALTER TABLE DETIL_KARYAWAN
ADD CONSTRAINT FK_K_K_KODE
FOREIGN KEY (K_KODE) REFERENCES KARYAWAN(K_KODE);

ALTER TABLE DETIL_KARYAWAN
ADD CONSTRAINT FK_K_N_NOTA
FOREIGN KEY (N_NOTA) REFERENCES NOTA(N_NOTA);

ALTER TABLE NOTA
ADD CONSTRAINT FK_ST_ID 
FOREIGN KEY (ST_ID) REFERENCES STATUS_TRANSAKSI(ST_ID);

ALTER TABLE NOTA
ADD CONSTRAINT FK_SP_ID
FOREIGN KEY (SP_ID) REFERENCES STATUS_PEMBAYARAN(SP_ID);

ALTER TABLE NOTA
ADD CONSTRAINT FK_P_ID
FOREIGN KEY (P_ID) REFERENCES PROMO(P_ID);

ALTER TABLE NOTA
ADD CONSTRAINT FK_M_ID
FOREIGN KEY (M_NO) REFERENCES MEMBER_TABLE(M_NO);



ALTER TABLE STATUS_TRANSAKSI
RENAME TO STATUS_PROSES;

ALTER TABLE STATUS_PEMBAYARAN
MODIFY SP_KET VARCHAR(15);

ALTER TABLE STATUS_PROSES
MODIFY ST_KET VARCHAR(15);

ALTER TABLE STATUS_PROSES
MODIFY ST_KET VARCHAR(50);

ALTER TABLE DETIL_NOTA
ADD DN_JUMLAH INTEGER;

ALTER SESSION SET NLS_DATE_FORMAT = 'DD MM YY';
--INSERT DATA CABANG--

INSERT INTO CABANG VALUES ('1', 'Keputih gang 1','081239475587');
INSERT INTO CABANG VALUES ('2', 'Kertajaya Indah Regency','081363575523');
INSERT INTO CABANG VALUES ('3', 'Gebang Lor','081212343453');
INSERT INTO CABANG VALUES ('4', 'Mulyosari Utara','0878615273281');

--INSERT DATA JENIS LAYANAN--

INSERT INTO JENIS_LAYANAN VALUES ('11', 'Cuci Kering', '5000');
INSERT INTO JENIS_LAYANAN VALUES ('12', 'Cuci Kering Setrika', '7000');
INSERT INTO JENIS_LAYANAN VALUES ('13', 'Cuci Kering Kilat', '10000');
INSERT INTO JENIS_LAYANAN VALUES ('14', 'Setrika', '3000');
INSERT INTO JENIS_LAYANAN VALUES ('15', 'Cuci Bed Cover', '10000');
INSERT INTO JENIS_LAYANAN VALUES ('16', 'Cuci Boneka', '7000');

--INSERT DATA KARYAWAN--

INSERT INTO KARYAWAN VALUES ('K1101', '1', 'ARDAN AMIRULLAH', 'Komplek Ampel, Surabaya', 'Cuci', '12-12-2015');
INSERT INTO KARYAWAN VALUES ('K1202', '1', 'DHEIMAS ERWIN MUHAMMAD', 'Desa Manyar, Gresik', 'Setrika', '11-12-2015');
INSERT INTO KARYAWAN VALUES ('K1303', '1', 'WAFI MAHENDRA', 'Keputih Gang Buntu No.08', 'Kasir', '12-12-2016');
INSERT INTO KARYAWAN VALUES ('K2101', '2', 'CAESAR ATENG MAHENDRA', 'Perumahan Bumi Marina Emas no.17', 'Cuci', '06-02-2015');
INSERT INTO KARYAWAN VALUES ('K2202', '2', 'ALFI EZRA', 'Gebang Wetan 1 No.12', 'Setrika', '13-10-2015');
INSERT INTO KARYAWAN VALUES ('K2303', '2', 'ICHSAN ROSIDIN', 'Keputih Perintis 1 No.28', 'Kasir', '22-04-2016');
INSERT INTO KARYAWAN VALUES ('K3101', '3', 'ADINDA MEGA AGUSTIARA', 'Perumahan Wisma Permai no.01', 'Cuci', '06-03-2016');
INSERT INTO KARYAWAN VALUES ('K3202', '3', 'ALIVIA WAHYU RAMADANTI', 'Gubeng No.11', 'Setrika', '13-10-2015');
INSERT INTO KARYAWAN VALUES ('K3303', '3', 'DARIS AN-NAHDA', 'Keputih Perintis 1 No.19', 'Kasir', '22-08-2015');
INSERT INTO KARYAWAN VALUES ('K4101', '4', 'SIHING PUSPITA', 'Perumahan Dosen Blok R no.06', 'Cuci', '06-02-2017');
INSERT INTO KARYAWAN VALUES ('K4202', '4', 'LAILATUL AJIJAH', 'Keputih Gang 3 no.02', 'Setrika', '13-10-2014');
INSERT INTO KARYAWAN VALUES ('K4303', '4', 'NOVI JESIKA ANASTASIA', 'Keputih Gang 1 no.01', 'Kasir', '30-12-2015');

--INSERT DATA MEMBER--

INSERT INTO MEMBER_TABLE VALUES ('M001', 'ISYE PUTRI ROSELIN', '01-02-2000', 'APARTEMENT PUNCAK KERTAJAYA A762', '082156090560', '19-12-2016');
INSERT INTO MEMBER_TABLE VALUES ('M002', 'DEWI SEKARINI', '06-04-1999', 'SURABAYA TENGAH', '08137284923', '09-11-2015');
INSERT INTO MEMBER_TABLE VALUES ('M003', 'DIMAS KAMURAPI', '11-10-1998', 'JL JOJORAN BARAT NO 12', '0821532425346','19-10-2015');
INSERT INTO MEMBER_TABLE VALUES ('M004', 'GHIFAROZA RAHMADIANA', '01-11-1998', 'JL KENJERAN TIMUR BLOK C NO 31', '084363452342', '19-04-2015');
INSERT INTO MEMBER_TABLE VALUES ('M005', 'SULTANA BALQIS', '21-12-1998', 'JL IR SOEKARNO NO 77', '087835425233', '19-06-2014');
INSERT INTO MEMBER_TABLE VALUES ('M006', 'PUTRI NURUL A', '22-06-1998', 'PERUMAHAN ARAYA BLOK A NO.12A', '052343572323', '12-02-2016');
INSERT INTO MEMBER_TABLE VALUES ('M007', 'ROGO JAGAD', '31-05-1998', 'APARTEMENT COSMOPOLIS AB762', '0523414325342', '15-09-2015');
INSERT INTO MEMBER_TABLE VALUES ('M008', 'FARIS DIDIN', '27-04-1998', 'APARTEMENT PUNCAK KERTAJAYA A762', '0821123006574', '19-10-2016');
INSERT INTO MEMBER_TABLE VALUES ('M009', 'ARYA WINATA', '29-03-1997', 'APARTEMENT COSMOPOLIS A762', '0821563467865', '13-12-2014');
INSERT INTO MEMBER_TABLE VALUES ('M0010', 'RAHAJENG DWI PERMATASARI', '21-03-1998', 'KEJAWAN NO 11', '0811237468364', '04-12-2015');
INSERT INTO MEMBER_TABLE VALUES ('M0011', 'AGUEL SATRIA', '24-06-1998', 'PERUMDOS BLOK T NO 12', '0821928752933','23-08-2014');
INSERT INTO MEMBER_TABLE VALUES ('M0012', 'FANDY PUTRA MOHAMMAD', '14-07-1998', 'APARTEMENT PUNCAK KERTAJAYA A762', '0759873253384', '27-12-2015');
INSERT INTO MEMBER_TABLE VALUES ('M0013', 'RANI AULIA HIDAYAT', '15-12-1998', 'PERUMAHAN BUMI MARINA EMAS NO 28', '08212938947875',  '18-10-2016');
INSERT INTO MEMBER_TABLE VALUES ('M0014', 'ANGGA YUDISTHIRA', '30-11-1998', 'APARTEMENT DIAN REGENCY BB762', '08152738784982', '15-02-2015');
INSERT INTO MEMBER_TABLE VALUES ('M0015', 'NELLY PRILLYANA', '01-02-1998', 'APARTEMENT PUNCAK KERTAJAYA A8623', '082156090563', '29-01-2016');
INSERT INTO MEMBER_TABLE VALUES ('M0016', 'RIJA RUSADI', '01-02-1998', 'APARTEMENT PUNCAK KERTAJAYA B1734', '081349767789', 'L','12-04-2016');

--INSERT DATA PROMO--

INSERT INTO PROMO VALUES ('1', 'KEMERDEKAAN', 'Promo di bulan Agustus untuk merayakan kemerdekaan', '01-07-2017', '30-7-2017', '17');
INSERT INTO PROMO VALUES ('2', 'TAHUN BARU', ' Promo di bulan Desember', '01-12-2017', '31-12-2017', '12');
INSERT INTO PROMO VALUES ('3', 'RAMADHAN', ' Promo di bulan Juni', '01-06-2017', '30-06-207', '15');

--INSERT DATA STATUS PEMBAYARAN--
INSERT INTO STATUS_PEMBAYARAN VALUES ('0', 'BELUM LUNAS');
INSERT INTO STATUS_PEMBAYARAN VALUES ('1', 'LUNAS');

--INSERT DATA STATUS TRANSAKSI--
INSERT INTO STATUS_PROSES VALUES ('1','MASUK');
INSERT INTO STATUS_PROSES VALUES ('2','DIPROSES');
INSERT INTO STATUS_PROSES VALUES ('3','DIPINDAH KE CABANG LAIN');
INSERT INTO STATUS_PROSES VALUES ('4','SELESAI');
INSERT INTO STATUS_PROSES VALUES ('5','SELESAI DI CABANG LAIN');
INSERT INTO STATUS_PROSES VALUES ('6','SUDAH DIAMBIL DARI CABANG LAIN');
INSERT INTO STATUS_PROSES VALUES ('7','SUDAH DIAMBIL PELANGGAN');

--INSERT NOTA--
--bulan januari--
INSERT INTO NOTA VALUES ('1', '2', NULL, 'M001', '0', '05-01-2017', '08-01-2017', '08-01-2017', '1', '1', '1', '1','15000');
INSERT INTO DETIL_NOTA VALUES('1', '11', '15000');
INSERT INTO DETIL_KARYAWAN VALUES('K1101', '1');
INSERT INTO DETIL_KARYAWAN VALUES('K1202', '1');
INSERT INTO DETIL_KARYAWAN VALUES('K1303', '1');
INSERT INTO NOTA VALUES ('2', '1', NULL, 'M002', '1', '10-01-2017', '11-01-2017', '11-01-2017', '1', '3', '3', '4',  '29000');
INSERT INTO DETIL_NOTA VALUES('2','14', '9000');
INSERT INTO DETIL_NOTA VALUES('2','15', '20000');
INSERT INTO DETIL_KARYAWAN VALUES('K3101', '2');
INSERT INTO DETIL_KARYAWAN VALUES('K3202', '2');
INSERT INTO DETIL_KARYAWAN VALUES('K4303', '2');
--bulan februari--
INSERT INTO NOTA VALUES ('3', '4', NULL, 'M003', '1', '09-02-2017', '09-02-2017', '10-02-2017', '2', '2', '2', '2', '30000');
INSERT INTO DETIL_NOTA VALUES('3','15', '30000');
INSERT INTO DETIL_KARYAWAN VALUES('K2101', '3');
INSERT INTO DETIL_KARYAWAN VALUES('K2202', '3');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '3');
INSERT INTO NOTA VALUES ('4', '5', NULL, 'M003', '0', '19-02-2017', '20-02-2017', '20-02-2017', '1', '2', '1', '2',  '24500');
INSERT INTO DETIL_NOTA VALUES('4','12', '24500');
INSERT INTO DETIL_KARYAWAN VALUES('K1101', '4');
INSERT INTO DETIL_KARYAWAN VALUES('K1202', '4');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '4');
INSERT INTO NOTA VALUES ('5', '6', NULL, 'M003', '0', '25-02-2017', '27-02-2017', '27-02-2017', '2', '3', '3', '3',  '17500');
INSERT INTO DETIL_NOTA VALUES('5','11', '12500');
INSERT INTO DETIL_NOTA VALUES('5','13', '5000');
INSERT INTO DETIL_KARYAWAN VALUES('K3101', '5');
INSERT INTO DETIL_KARYAWAN VALUES('K3202', '5');
INSERT INTO DETIL_KARYAWAN VALUES('K3303', '5');
--bulan maret--
INSERT INTO NOTA VALUES ('6', '3', NULL, 'M005', '1', '12-03-2017', '12-03-2017', '13-02-2017', '2', '4', '4', '3',  '45000'); 
INSERT INTO DETIL_NOTA VALUES('6','11', '15000');
INSERT INTO DETIL_NOTA VALUES('6','13', '15000');
INSERT INTO DETIL_NOTA VALUES('6','14', '15000');
INSERT INTO DETIL_KARYAWAN VALUES('K4101', '6');
INSERT INTO DETIL_KARYAWAN VALUES('K4202', '6');
INSERT INTO DETIL_KARYAWAN VALUES('K3303', '6');
INSERT INTO NOTA VALUES ('7', '1', NULL, 'M008', '1', '12-03-2017', '13-03-2017', '14-02-2017', '1', '1', '3', '1',  '7000');
INSERT INTO DETIL_NOTA VALUES('7','16', '7000');
INSERT INTO DETIL_KARYAWAN VALUES('K3101', '7');
INSERT INTO DETIL_KARYAWAN VALUES('K3202', '7');
INSERT INTO DETIL_KARYAWAN VALUES('K1303', '7'); 
--bulan april--
INSERT INTO NOTA VALUES ('8', '2', NULL, 'M006', '1', '01-04-2017', '02-04-2017', '03-04-2017', '2', '1', '1', '2', '17500'); 
INSERT INTO DETIL_NOTA VALUES('8','11', '17500');
INSERT INTO DETIL_KARYAWAN VALUES('K1101', '8');
INSERT INTO DETIL_KARYAWAN VALUES('K1202', '8');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '8'); 
INSERT INTO NOTA VALUES ('9', '4', NULL, 'M001', '0', '03-04-2017', '05-04-2017', '05-04-2017', '1', '4', '4', '4',  '75000'); 
INSERT INTO DETIL_NOTA VALUES('9','16', '35000');
INSERT INTO DETIL_NOTA VALUES('9','15', '40000');
INSERT INTO DETIL_KARYAWAN VALUES('K4101', '9');
INSERT INTO DETIL_KARYAWAN VALUES('K4202', '9');
INSERT INTO DETIL_KARYAWAN VALUES('K4303', '9'); 
--bulan mei--
INSERT INTO NOTA VALUES ('10', '6', NULL, 'M004', '1', '12-05-2017', '15-05-2017', '16-05-2017', '1', '3', '3', '3',  '21000'); 
INSERT INTO DETIL_NOTA VALUES('10','12', '21000');
INSERT INTO DETIL_KARYAWAN VALUES('K3101', '10');
INSERT INTO DETIL_KARYAWAN VALUES('K3202', '10');
INSERT INTO DETIL_KARYAWAN VALUES('K3303', '10'); 
--bulan juni--
INSERT INTO NOTA VALUES ('11', '2', '3', 'M002', '1', '4-06-2017', '7-06-2017', '7-06-2017', '2', '4', '4', '3', '22100'); 
INSERT INTO DETIL_NOTA VALUES('11','16', '10500');
INSERT INTO DETIL_NOTA VALUES('11','13', '5000');
INSERT INTO DETIL_NOTA VALUES('11','12', '10500');
INSERT INTO DETIL_KARYAWAN VALUES('K4101', '11');
INSERT INTO DETIL_KARYAWAN VALUES('K4202', '11');
INSERT INTO DETIL_KARYAWAN VALUES('K3303', '11');
--bulan juli--
INSERT INTO NOTA VALUES ('12', '1', NULL, 'M001','1', '11-07-2017', '13-07-2017', '13-07-2017', '1', '1', '3', '1',  '5000');
INSERT INTO DETIL_NOTA VALUES('12','11', '5000');
INSERT INTO DETIL_KARYAWAN VALUES('K3101', '12');
INSERT INTO DETIL_KARYAWAN VALUES('K3202', '12');
INSERT INTO DETIL_KARYAWAN VALUES('K1303', '12');
INSERT INTO NOTA VALUES ('13', '2', NULL, 'M001','0', '18-07-2017', '20-07-2017', '20-07-2017', '2', '4', '4', '4', '7000');
INSERT INTO DETIL_NOTA VALUES('13','16', '7000');
INSERT INTO DETIL_KARYAWAN VALUES('K4101', '13');
INSERT INTO DETIL_KARYAWAN VALUES('K4202', '13');
INSERT INTO DETIL_KARYAWAN VALUES('K4303', '13');
INSERT INTO NOTA VALUES ('14', '3', NULL, 'M004','1','1-07-2017', '8-07-2017', '9-07-2017', '1', '2', '2', '2',  '38000');
INSERT INTO DETIL_NOTA VALUES('14','11', '15000');
INSERT INTO DETIL_NOTA VALUES('14','12', '7000');
INSERT INTO DETIL_NOTA VALUES('14','13', '10000');
INSERT INTO DETIL_NOTA VALUES('14','14', '6000');
INSERT INTO DETIL_KARYAWAN VALUES('K2101', '14');
INSERT INTO DETIL_KARYAWAN VALUES('K2202', '14');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '14');
INSERT INTO NOTA VALUES ('15', '6', NULL,'M005', '0','2-07-2017', '5-07-2017', '6-07-2017', '1', '1', '2', '1',  '41000');
INSERT INTO DETIL_NOTA VALUES('15','15', '20000');
INSERT INTO DETIL_NOTA VALUES('15','16', '21000');
INSERT INTO DETIL_KARYAWAN VALUES('K2101', '15');
INSERT INTO DETIL_KARYAWAN VALUES('K2202', '15');
INSERT INTO DETIL_KARYAWAN VALUES('K1303', '15');
INSERT INTO NOTA VALUES ('16', '7', NULL,'M006', '1','4-07-2017', '7-07-2017', '7-07-2017','2', '2', '2', '4', '27000');
INSERT INTO DETIL_NOTA VALUES('16','14', '27000');
INSERT INTO DETIL_KARYAWAN VALUES('K2101', '16');
INSERT INTO DETIL_KARYAWAN VALUES('K2202', '16');
INSERT INTO DETIL_KARYAWAN VALUES('K4303', '16');
INSERT INTO NOTA VALUES ('17', '3', NULL,'M007', '1','4-07-2017', '7-07-2017', '7-07-2017', '1', '3', '3', '2',  '42500');
INSERT INTO DETIL_NOTA VALUES('17','15', '7500');
INSERT INTO DETIL_NOTA VALUES('17','11', '20000');
INSERT INTO DETIL_NOTA VALUES('17','13', '15000');
INSERT INTO DETIL_KARYAWAN VALUES('K3101', '17');
INSERT INTO DETIL_KARYAWAN VALUES('K3202', '17');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '17');
INSERT INTO NOTA VALUES ('18', '4', NULL,'M007', '1','12-07-2017', '16-07-2017', '17-07-2017', '2', '3', '3', '3', '25500');
INSERT INTO DETIL_NOTA VALUES('18','13', '7500');
INSERT INTO DETIL_NOTA VALUES('18','14', '18000');
INSERT INTO DETIL_KARYAWAN VALUES('K3101', '18');
INSERT INTO DETIL_KARYAWAN VALUES('K3202', '18');
INSERT INTO DETIL_KARYAWAN VALUES('K3303', '18');
--bulan agustus--
INSERT INTO NOTA VALUES ('19', '1', '1','M008', '0','14-08-2017', '18-08-2017', '19-08-2017', '1', '1', '1', '4',  '41500');
INSERT INTO DETIL_NOTA VALUES('19','13', '20000');
INSERT INTO DETIL_NOTA VALUES('19','14', '30000');
INSERT INTO DETIL_KARYAWAN VALUES('K1101', '19');
INSERT INTO DETIL_KARYAWAN VALUES('K1202', '19');
INSERT INTO DETIL_KARYAWAN VALUES('K4303', '19');
INSERT INTO NOTA VALUES ('20', '2', '1', 'M002', '1','13-08-2017', '15-08-2017', '16-08-2017', '2', '3', '1', '3',  '45650');
INSERT INTO DETIL_NOTA VALUES('20','11', '15000');
INSERT INTO DETIL_NOTA VALUES('20','12', '25000');
INSERT INTO DETIL_NOTA VALUES('20','13', '15000');
INSERT INTO DETIL_KARYAWAN VALUES('K1101', '20');
INSERT INTO DETIL_KARYAWAN VALUES('K1202', '20');
INSERT INTO DETIL_KARYAWAN VALUES('K3303', '20');
INSERT INTO NOTA VALUES ('21','4', '1', 'M009', '0','1-08-2017', '4-08-2017', '6-08-2017', '1', '4', '4', '4',  '37350');
INSERT INTO DETIL_NOTA VALUES('21','11', '5000');
INSERT INTO DETIL_NOTA VALUES('21','12', '7000');
INSERT INTO DETIL_NOTA VALUES('21','13', '10000');
INSERT INTO DETIL_NOTA VALUES('21','14', '6000');
INSERT INTO DETIL_NOTA VALUES('21','15', '10000');
INSERT INTO DETIL_NOTA VALUES('21','16', '7000');
INSERT INTO DETIL_KARYAWAN VALUES('K4101', '21');
INSERT INTO DETIL_KARYAWAN VALUES('K4202', '21');
INSERT INTO DETIL_KARYAWAN VALUES('K4303', '21');
INSERT INTO NOTA VALUES ('22','7', '1', 'M008', '0','1-08-2017', '6-08-2017', '6-08-2017', '2', '4', '2', '4',  '11620');
INSERT INTO DETIL_NOTA VALUES('22','16', '14000');
INSERT INTO DETIL_KARYAWAN VALUES('K2101', '22');
INSERT INTO DETIL_KARYAWAN VALUES('K2202', '22');
INSERT INTO DETIL_KARYAWAN VALUES('K4303', '22');
INSERT INTO NOTA VALUES ('23','6', '1', 'M0010','1', '1-08-2017', '4-08-2017', '6-08-2017', '1', '1', '1', '1', '13695');
INSERT INTO DETIL_NOTA VALUES('23','14', '4500');
INSERT INTO DETIL_NOTA VALUES('23','15', '5000');
INSERT INTO DETIL_NOTA VALUES('23','16', '7000');
INSERT INTO DETIL_KARYAWAN VALUES('K1101', '23');
INSERT INTO DETIL_KARYAWAN VALUES('K1202', '23');
INSERT INTO DETIL_KARYAWAN VALUES('K1303', '23');
INSERT INTO NOTA VALUES ('24', '3', '1','M0010', '0','11-08-2017', '14-08-2017', '14-08-2017', '1', '2', '1', '2',  '15770');
INSERT INTO DETIL_NOTA VALUES('24','12', '7000');
INSERT INTO DETIL_NOTA VALUES('24','13', '12000');
INSERT INTO DETIL_KARYAWAN VALUES('K1101', '24');
INSERT INTO DETIL_KARYAWAN VALUES('K1202', '24');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '24');
--bulan september--
INSERT INTO NOTA VALUES ('25','7', NULL, 'M007','0', '4-09-2017', '7-09-2017', '7-09-2017', '1', '4', '1', '4',  '45000');
INSERT INTO DETIL_NOTA VALUES('25','11', '5000');
INSERT INTO DETIL_NOTA VALUES('25','12', '7000');
INSERT INTO DETIL_NOTA VALUES('25','13', '10000');
INSERT INTO DETIL_NOTA VALUES('25','14', '6000');
INSERT INTO DETIL_NOTA VALUES('25','15', '10000');
INSERT INTO DETIL_NOTA VALUES('25','16', '7000');
INSERT INTO DETIL_KARYAWAN VALUES('K1101', '25');
INSERT INTO DETIL_KARYAWAN VALUES('K1202', '25');
INSERT INTO DETIL_KARYAWAN VALUES('K4303', '25');
INSERT INTO NOTA VALUES ('26','1', NULL, 'M007','1', '4-09-2017', '7-09-2017', '7-09-2017', '1', '3', '2', '3',  '10000');
INSERT INTO DETIL_NOTA VALUES('26','13', '5000');
INSERT INTO DETIL_NOTA VALUES('26','15', '5000');
INSERT INTO DETIL_KARYAWAN VALUES('K2101', '26');
INSERT INTO DETIL_KARYAWAN VALUES('K2202', '26');
INSERT INTO DETIL_KARYAWAN VALUES('K3303', '26');
INSERT INTO NOTA VALUES ('27','3', NULL, 'M002', '0','4-09-2017', '7-09-2017', '7-09-2017', '2', '1', '3', '1',  '23500');
INSERT INTO DETIL_NOTA VALUES('27','14', '9000');
INSERT INTO DETIL_NOTA VALUES('27','15', '7500');
INSERT INTO DETIL_NOTA VALUES('27','16', '7000');
INSERT INTO DETIL_KARYAWAN VALUES('K3101', '27');
INSERT INTO DETIL_KARYAWAN VALUES('K3202', '27');
INSERT INTO DETIL_KARYAWAN VALUES('K1303', '27');
INSERT INTO NOTA VALUES ('28','5', NULL, 'M0011','0', '1-09-2017', '5-09-2017', '5-09-2017', '1', '2', '2', '4', '15000');
INSERT INTO DETIL_NOTA VALUES('28','11', '15000');
INSERT INTO DETIL_KARYAWAN VALUES('K2101', '28');
INSERT INTO DETIL_KARYAWAN VALUES('K2202', '28');
INSERT INTO DETIL_KARYAWAN VALUES('K4303', '28');
INSERT INTO NOTA VALUES ('29','6', NULL, 'M0012', '0','1-09-2017', '3-09-2017', '3-09-2017', '1', '1', '1', '2',  '19000');
INSERT INTO DETIL_NOTA VALUES('29','12', '5000');
INSERT INTO DETIL_NOTA VALUES('29','16', '14000');
INSERT INTO DETIL_KARYAWAN VALUES('K1101', '29');
INSERT INTO DETIL_KARYAWAN VALUES('K1202', '29');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '29');
--bulan oktober--
INSERT INTO NOTA VALUES ('30','7', NULL, 'M0014','0', '1-10-2017', '4-10-2017', '4-10-2017','1', '2', '2', '2',  '31500');
INSERT INTO DETIL_NOTA VALUES('30','12', '14000');
INSERT INTO DETIL_NOTA VALUES('30','13', '17500');
INSERT INTO DETIL_KARYAWAN VALUES('K2101', '30');
INSERT INTO DETIL_KARYAWAN VALUES('K2202', '30');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '30');
INSERT INTO NOTA VALUES ('31','1', NULL, 'M0014','1', '2-10-2017', '7-10-2017', '7-10-2017','2', '1', '1', '1', '35000');
INSERT INTO DETIL_NOTA VALUES('31','11', '16000');
INSERT INTO DETIL_NOTA VALUES('31','14', '12000');
INSERT INTO DETIL_NOTA VALUES('31','16', '7000');
INSERT INTO DETIL_KARYAWAN VALUES('K1101', '31');
INSERT INTO DETIL_KARYAWAN VALUES('K1202', '31');
INSERT INTO DETIL_KARYAWAN VALUES('K1303', '31');
INSERT INTO NOTA VALUES ('32','6', NULL, 'M0015','0', '6-10-2017', '10-10-2017', '11-10-2017','2', '3', '3', '1',  '40000');
INSERT INTO DETIL_NOTA VALUES('32','15', '40000');
INSERT INTO DETIL_KARYAWAN VALUES('K3101', '32');
INSERT INTO DETIL_KARYAWAN VALUES('K3202', '32');
INSERT INTO DETIL_KARYAWAN VALUES('K1303', '32');
INSERT INTO NOTA VALUES ('33','2', NULL, 'M0016','1', '8-10-2017', '12-10-2017', '13-10-2017','2', '3', '3', '1',  '24000');
INSERT INTO DETIL_NOTA VALUES('33','12', '7000');
INSERT INTO DETIL_NOTA VALUES('33','13', '10000');
INSERT INTO DETIL_NOTA VALUES('33','16', '7000');
INSERT INTO DETIL_KARYAWAN VALUES('K3101', '33');
INSERT INTO DETIL_KARYAWAN VALUES('K3202', '33');
INSERT INTO DETIL_KARYAWAN VALUES('K1303', '33');
--bulan november--
INSERT INTO NOTA VALUES ('34','6', NULL, 'M007','0', '4-11-2017', '8-11-2017', '8-11-2017','1', '2', '2', '2',  '67000');
INSERT INTO DETIL_NOTA VALUES('34','11', '10000');
INSERT INTO DETIL_NOTA VALUES('34','12', '21000');
INSERT INTO DETIL_NOTA VALUES('34','13', '5000');
INSERT INTO DETIL_NOTA VALUES('34','14', '12000');
INSERT INTO DETIL_NOTA VALUES('34','15', '5000');
INSERT INTO DETIL_NOTA VALUES('34','16', '14000');
INSERT INTO DETIL_KARYAWAN VALUES('K2101', '34');
INSERT INTO DETIL_KARYAWAN VALUES('K2202', '34');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '34');
INSERT INTO NOTA VALUES ('35','3', NULL, 'M008','0', '4-11-2017', '10-11-2017', '10-11-2017','2', '3', '3', '2', '25000');
INSERT INTO DETIL_NOTA VALUES('35','11', '25000');
INSERT INTO DETIL_KARYAWAN VALUES('K3101', '35');
INSERT INTO DETIL_KARYAWAN VALUES('K3202', '35');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '35');
INSERT INTO NOTA VALUES ('36','4', NULL, 'M001','0', '8-11-2017', '14-11-2017', '15-11-2017','2', '2', '4', '2',  '43000');
INSERT INTO DETIL_NOTA VALUES('36','11', '8000');
INSERT INTO DETIL_NOTA VALUES('36','13', '12000');
INSERT INTO DETIL_NOTA VALUES('36','14', '15000');
INSERT INTO DETIL_NOTA VALUES('36','15', '8000');
INSERT INTO DETIL_KARYAWAN VALUES('K4101', '36');
INSERT INTO DETIL_KARYAWAN VALUES('K4202', '36');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '36');
INSERT INTO NOTA VALUES ('37','2', NULL, 'M009','1', '12-11-2017', '14-11-2017', '14-11-2017','1', '1', '1', '1',  '35000');
INSERT INTO DETIL_NOTA VALUES('37','16', '35000');
INSERT INTO DETIL_KARYAWAN VALUES('K1101', '37');
INSERT INTO DETIL_KARYAWAN VALUES('K1202', '37');
INSERT INTO DETIL_KARYAWAN VALUES('K1303', '37');
INSERT INTO NOTA VALUES ('38','1', NULL, 'M002','0', '1-11-2017', '4-11-2017', '4-11-2017', '2', '2', '1', '2',  '34000');
INSERT INTO DETIL_NOTA VALUES('38','11', '14000');
INSERT INTO DETIL_NOTA VALUES('38','12', '14000');
INSERT INTO DETIL_NOTA VALUES('38','14', '6000');
INSERT INTO DETIL_KARYAWAN VALUES('K1101', '38');
INSERT INTO DETIL_KARYAWAN VALUES('K1202', '38');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '38');
INSERT INTO NOTA VALUES ('39','1', NULL, 'M005','1', '3-11-2017', '7-11-2017', '7-11-2017','2', '3', '4', '3', '17000');
INSERT INTO DETIL_NOTA VALUES('39','12', '7000');
INSERT INTO DETIL_NOTA VALUES('39','13', '10000');
INSERT INTO DETIL_KARYAWAN VALUES('K4101', '39');
INSERT INTO DETIL_KARYAWAN VALUES('K4202', '39');
INSERT INTO DETIL_KARYAWAN VALUES('K3303', '39');
INSERT INTO NOTA VALUES ('40','4', NULL, 'M002','0', '12-11-2017', '16-11-2017', '17-11-2017','2', '1', '1', '3',  '42000');
INSERT INTO DETIL_NOTA VALUES('40','12', '42000');
INSERT INTO DETIL_KARYAWAN VALUES('K1101', '40');
INSERT INTO DETIL_KARYAWAN VALUES('K1202', '40');
INSERT INTO DETIL_KARYAWAN VALUES('K3303', '40');
INSERT INTO NOTA VALUES ('41','3', NULL, 'M009','1', '14-11-2017', '20-11-2017', '20-11-2017', '1', '2', '2', '4',  '31000');
INSERT INTO DETIL_NOTA VALUES('41','12', '28000');
INSERT INTO DETIL_NOTA VALUES('41','14', '3000');
INSERT INTO DETIL_KARYAWAN VALUES('K2101', '41');
INSERT INTO DETIL_KARYAWAN VALUES('K2202', '41');
INSERT INTO DETIL_KARYAWAN VALUES('K4303', '41');
INSERT INTO NOTA VALUES ('42','2', NULL, 'M002','0', '15-11-2017', '18-11-2017', '18-11-2017','2', '3', '3', '3',  '17000');
INSERT INTO DETIL_NOTA VALUES('42','15', '17000');
INSERT INTO DETIL_KARYAWAN VALUES('K3101', '42');
INSERT INTO DETIL_KARYAWAN VALUES('K3202', '42');
INSERT INTO DETIL_KARYAWAN VALUES('K3303', '42');
--bulan desember--
INSERT INTO NOTA VALUES ('43','7', '2', 'M003','1', '1-12-2017', '3-12-2017', '3-12-2017', '2', '2', '2', '2',  '39600');
INSERT INTO DETIL_NOTA VALUES('43','11', '5000');
INSERT INTO DETIL_NOTA VALUES('43','12', '7000');
INSERT INTO DETIL_NOTA VALUES('43','13', '10000');
INSERT INTO DETIL_NOTA VALUES('43','14', '6000');
INSERT INTO DETIL_NOTA VALUES('43','15', '10000');
INSERT INTO DETIL_NOTA VALUES('43','16', '7000');
INSERT INTO DETIL_KARYAWAN VALUES('K2101', '43');
INSERT INTO DETIL_KARYAWAN VALUES('K2202', '43');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '43');
INSERT INTO NOTA VALUES ('44','2', '2', 'M007','0', '1-12-2017', '5-12-2017', '5-12-2017', '1', '4', '4', '4', '10560');
INSERT INTO DETIL_NOTA VALUES('44','11', '5000');
INSERT INTO DETIL_NOTA VALUES('44','16', '7000');
INSERT INTO DETIL_KARYAWAN VALUES('K4101', '44');
INSERT INTO DETIL_KARYAWAN VALUES('K4202', '44');
INSERT INTO DETIL_KARYAWAN VALUES('K4303', '44');
INSERT INTO NOTA VALUES ('45','3', '2', 'M002','1', '1-12-2017', '5-12-2017', '5-12-2017', '2', '3', '3', '3',  '38280');
INSERT INTO DETIL_NOTA VALUES('45','11', '22000');
INSERT INTO DETIL_NOTA VALUES('45','12', '10500');
INSERT INTO DETIL_NOTA VALUES('45','13', '7500');
INSERT INTO DETIL_NOTA VALUES('45','16', '3500');
INSERT INTO DETIL_KARYAWAN VALUES('K3101', '45');
INSERT INTO DETIL_KARYAWAN VALUES('K3202', '45');
INSERT INTO DETIL_KARYAWAN VALUES('K3303', '45');
INSERT INTO NOTA VALUES ('46','1', '2', 'M001','1', '4-12-2017', '8-12-2017', '8-12-2017', '1', '1', '1', '1',  '19800');
INSERT INTO DETIL_NOTA VALUES('46','11', '4600');
INSERT INTO DETIL_NOTA VALUES('46','12', '3500');
INSERT INTO DETIL_NOTA VALUES('46','13', '5000');
INSERT INTO DETIL_NOTA VALUES('46','14', '3000');
INSERT INTO DETIL_NOTA VALUES('46','15', '5000');
INSERT INTO DETIL_NOTA VALUES('46','16', '3500');
INSERT INTO DETIL_KARYAWAN VALUES('K1101', '46');
INSERT INTO DETIL_KARYAWAN VALUES('K1202', '46');
INSERT INTO DETIL_KARYAWAN VALUES('K1303', '46');
INSERT INTO NOTA VALUES ('47','2', '2', 'M003','1', '6-12-2017', '10-12-2017', '10-12-2017','2', '2', '3', '2', '12320');
INSERT INTO DETIL_NOTA VALUES('47','13', '14000');
INSERT INTO DETIL_KARYAWAN VALUES('K3101', '47');
INSERT INTO DETIL_KARYAWAN VALUES('K3202', '47');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '47');
INSERT INTO NOTA VALUES ('48','3', '2', 'M003','1', '10-12-2017', '14-12-2017', '15-12-2017','1', '4', '4', '2',  '21560');
INSERT INTO DETIL_NOTA VALUES('48','12', '24500');
INSERT INTO DETIL_KARYAWAN VALUES('K4101', '48');
INSERT INTO DETIL_KARYAWAN VALUES('K4202', '48');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '48');
INSERT INTO NOTA VALUES ('49','4', '2', 'M004','0', '10-12-2017', '14-12-2017', '15-12-2017','1', '4', '4', '3',  '15840');
INSERT INTO DETIL_NOTA VALUES('49','14', '18000');
INSERT INTO DETIL_KARYAWAN VALUES('K4101', '49');
INSERT INTO DETIL_KARYAWAN VALUES('K4202', '49');
INSERT INTO DETIL_KARYAWAN VALUES('K3303', '49');
INSERT INTO NOTA VALUES ('50','5', '2', 'M004','0', '13-12-2017', '16-12-2017', '16-12-2017', '2', '2', '3', '2',  '24640');
INSERT INTO DETIL_NOTA VALUES('50','11', '5000');
INSERT INTO DETIL_NOTA VALUES('50','12', '7000');
INSERT INTO DETIL_NOTA VALUES('50','13', '10000');
INSERT INTO DETIL_NOTA VALUES('50','14', '6000');
INSERT INTO DETIL_KARYAWAN VALUES('K3101', '50');
INSERT INTO DETIL_KARYAWAN VALUES('K3202', '50');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '50');
INSERT INTO NOTA VALUES ('51','6', '2', 'M002','1', '20-12-2017', '26-12-2017', '26-12-2017', '1', '2', '2', '2', '19360');
INSERT INTO DETIL_NOTA VALUES('51','11', '5000');
INSERT INTO DETIL_NOTA VALUES('51','12', '7000');
INSERT INTO DETIL_NOTA VALUES('51','13', '10000');
INSERT INTO DETIL_KARYAWAN VALUES('K2101', '51');
INSERT INTO DETIL_KARYAWAN VALUES('K2202', '51');
INSERT INTO DETIL_KARYAWAN VALUES('K2303', '51');


--menampilkan nama, nomor nota,tanggal jadi jumlah nota sebelum dan sesudah diskon--
select m.m_nama, n.n_nota, n.n_tgljadi, n.n_hargablmdiskon, n.n_hargadiskon
from nota n, member_table m
where m.m_no = n.m_no;

--Menampilkan nama member laundry yang status laundrynya �diproses� di bulan Desember.--
select m.m_nama
from nota n, member_table m, status_proses s
where s.st_ket='DIPROSES' and s.st_id = n.st_id and to_char(n.n_tglmasuk,'MM')='12' and m.m_no = n.m_no;

--tampilkan nama member, nomor nota, dan transaksi yang harga sebelum diskonnya lebih dari 50000--
select m.m_nama, n.n_nota, z.total_bayar
from member_table  m, nota n, (select d.n_nota as ide, sum(d.dn_jumlah) as total_bayar
from detil_nota d
group by d.n_nota) z
where z.total_bayar>50000 and z.ide = n.n_nota and m.m_no = n.m_no
order by m.m_nama asc;

--menampilkan nama penyetrika, kode karyawan, nomor nota yang status laundrynya SELESAI--
select w.namakar as NAMA_KAR, w.ide as ID_KAR, n.n_nota
from status_proses s, nota n, detil_karyawan d, (select k.k_kode as ide, k.k_nama as namakar
from karyawan k
where k.k_bagian = 'Setrika')w
where s.st_ket='SELESAI' and s.st_id = n.st_id and n.n_nota = d.n_nota and d.k_kode =w.ide;

--menampilkan 5 nama member dan jumlah pembayaran paling besar setelah diskon--

select  m.m_nama, m.m_no, p.TOTAL
from member_table m, (select l.total_bayar as TOTAL, l.nomem as id_mem
from (select sum(n.n_hargadiskon) as total_bayar, n.m_no as nomem
from nota n
group by n.m_no
order by total_bayar desc
)l
where rownum<=5
)p
where m.m_no = p.id_mem
order by p.total desc;

--rata rata tiap bulan--
select m.bulanz, cast(k.totalbiaya/m.jumlah_nota as integer) as Rata_bulan
from(select sum(n.n_hargadiskon) as totalbiaya, to_char(n.n_tglmasuk ,'MM') as bulan
from nota n
group by to_char(n.n_tglmasuk ,'MM'))k, (select count(n.n_tglmasuk) as jumlah_nota, to_char(n.n_tglmasuk ,'MM') as bulanz
from nota n
group by to_char(n.n_tglmasuk ,'MM')) m
where k.bulan=m.bulanz
order by m.bulanz asc






