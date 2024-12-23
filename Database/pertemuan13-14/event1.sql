-- Cek Event SCHEDULER
SHOW VARIABLES LIKE 'event_scheduler';
-- Set Event SCHEDULER
SET GLOBAL event_scheduler = ON;

-- cek waktu eksekusi sesuai time_zone Mysql
SELECT @@global.time_zone, @@session.time_zone;

-- Menjadwalkan Event untuk Menghapus Data Lama > 10 Tahun
CREATE EVENT hapus_transaksi_lama
ON SCHEDULE EVERY 1 DAY
DO
    DELETE FROM tbl_transaksi WHERE tgl_transaksi < NOW() - INTERVAL 10 YEAR;
