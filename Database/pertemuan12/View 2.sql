#Membuat View stok < rata2
CREATE VIEW stok_dibawah_rata2 AS 
SELECT * FROM tbl_barang WHERE 
stok < 
      (SELECT AVG(stok) FROM 
		tbl_barang);  
