#Membuat View untuk menampilkan 
#Stok Barang yang habis Stok = o
CREATE VIEW cek_stok AS 
SELECT * FROM tbl_barang WHERE 
stok=0;
