SELECT
	a.kode_faktur,
	a.kode_barang,
	b.nama_barang,
	b.harga,
	a.qty,
	(b.harga * a.qty) AS jumlah_harga,
	(SELECT SUM(b2.harga * a2.qty)
		FROM tbl_detailtransaksi a2
		INNER JOIN tbl_barang b2 ON b2.kode_barang = a2.kode_barang
		WHERE a2.kode_faktur = a.kode_faktur) AS jumlah_tagihan
FROM
	tbl_detailtransaksi a
INNER JOIN 
	tbl_barang b ON b.kode_barang = a.kode_barang
WHERE
	a.kode_faktur = "KD_002";