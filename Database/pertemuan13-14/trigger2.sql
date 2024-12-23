-- Membuat Update Stok Otomatis di tbl_barang setelah ada transaksi di Tbl_detailPengadaan
DELIMITER $$
CREATE TRIGGER after_insert_pengadaan
AFTER INSERT ON tbl_detail_pengadaan
FOR EACH ROW
BEGIN
    -- Update stok barang di tbl_barang
    UPDATE tbl_barang
    SET stok = stok + NEW.jumlah, 
    harga_pengadaan = NEW.total_harga/(NEW.jumlah*40)
    WHERE kode_barang = NEW.kode_barang;
END$$
DELIMITER ;


