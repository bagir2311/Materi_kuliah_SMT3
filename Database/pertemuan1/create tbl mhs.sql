/*Membuat Tabel Matakuliah*/
CREATE TABLE mahasiswa(
id_mahasiswa INT PRIMARY KEY auto_increment,
nama VARCHAR(100),
nim VARCHAR(15) UNIQUE,
jurusan VARCHAR(50),
angkatan YEAR );
