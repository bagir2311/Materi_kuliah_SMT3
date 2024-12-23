CREATE TABLE tbl_detail_pengadaan(
kode_pengadaan VARCHAR (20),
kode_barang VARCHAR (20),
jumlah INT, 
total_harga INT,
PRIMARY KEY (kode_pengadaan,kode_barang),
FOREIGN KEY (kode_pengadaan) REFERENCES 
tbl_pengadaan (kode_pengadaan),
FOREIGN KEY (kode_barang) REFERENCES 
tbl_barang(kode_barang))