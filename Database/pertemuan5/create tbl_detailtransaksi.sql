CREATE TABLE tbl_detailtransaksi(
kode_faktur VARCHAR(20),
kode_barang VARCHAR(20),
qty INT, 
FOREIGN KEY (kode_faktur) REFERENCES 
tbl_faktur(kode_faktur),
FOREIGN KEY (kode_barang) REFERENCES
tbl_barang (kode_barang))