#Function Diskon 10% untuk pembelian > 100.000
DELIMITER $$
CREATE FUNCTION hitung_diskon(total_pembelian INT)
RETURNS INT
DETERMINISTIC -- Menjamin hasil yang sama untuk input yang sama
BEGIN
    -- Logika atau operasi
    DECLARE diskon INT;
    IF total_pembelian > 100000 THEN
    	SET diskon = total_pembelian * 0.1;
    ELSE
    	SET diskon = 0;
   END IF;
    RETURN diskon;
END$$
DELIMITER ;
