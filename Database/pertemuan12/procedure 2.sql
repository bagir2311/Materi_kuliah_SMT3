#mencari Stok barang per kode barang
DELIMITER $$
CREATE PROCEDURE cek_stok_berdsarkan_kodebrg(
    IN kode_barang_in VARCHAR(10),
    OUT nama_barang_out VARCHAR(100),
    OUT stok_out INT)
BEGIN
    SELECT nama_barang, stok 
    INTO nama_barang_out, stok_out
    FROM tbl_barang WHERE kode_barang = kode_barang_in;
END$$
DELIMITER ;
#Memanggil Procedure cek_stok_berdsarkan_kodebrg
CALL cek_stok_berdsarkan_kodebrg("BRG_003", 
@nama_barang_out, @stok_out);
SELECT @nama_barang_out AS nama_barang, 
@stok_out AS stok;