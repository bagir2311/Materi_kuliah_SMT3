SELECT
	a.kode_faktur,
	a.kode_barang,
	b.nama_barang,
	b.harga,
	a.qty,
	b.harga * a.qty AS jumlah_harga,
	SUM(b.harga * a.qty) OVER
	(PARTITION BY a.kode_faktur) AS jumlah_tagihan
FROM
	tbl_detailtransaksi a
INNER JOIN 
	tbl_barang b ON b.kode_barang = a.kode_barang
WHERE
	a.kode_faktur = "KD_002";