CREATE PROCEDURE total_penjualan_barang()
BEGIN
    SELECT kode_barang, SUM(qty),
	 SUM(qty*harga_jual) AS total_harga
	 FROM tbl_detailtransaksi
	 GROUP BY kode_barang
END;