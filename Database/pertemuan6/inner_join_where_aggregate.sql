SELECT tbl_detailtransaksi.kode_faktur,
tbl_detailtransaksi.kode_barang,
tbl_barang.nama_barang, tbl_barang.harga,
tbl_detailtransaksi.qty,
tbl_barang.harga * tbl_detailtransaksi.qty AS jumlah_harga
FROM tbl_detailtransaksi INNER JOIN
tbl_barang ON tbl_barang.kode_barang = tbl_detailtransaksi.kode_barang
WHERE tbl_detailtransaksi.kode_faktur = "KD_002"