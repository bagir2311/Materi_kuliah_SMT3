/* Menambah Kolom Email di Tabel Mahasiswa */
ALTER TABLE mahasiswa 
ADD COLUMN email VARCHAR(100);

/*Merubah nama Tabel */
ALTER TABLE matakuliah RENAME TO mahasiswa;


