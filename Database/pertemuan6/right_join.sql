SELECT tbl_detailtransaksi.kode_faktur,
tbl_detailtransaksi.kode_barang,
tbl_barang.nama_barang, tbl_barang.harga
FROM tbl_detailtransaksi RIGHT JOIN
tbl_barang ON
tbl_detailtransaksi.kode_barang = tbl_barang.kode_barang
WHERE
tbl_detailtransaksi.kode_faktur = "KD_002"