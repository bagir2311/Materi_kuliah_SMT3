DELIMITER $$

CREATE TRIGGER after_booking_delete
AFTER DELETE ON bookings
FOR EACH ROW
BEGIN
    -- Update ketersediaan slot menjadi tersedia
    UPDATE slots 
    SET is_available = 1
    WHERE slot_id = OLD.slot_id;
END $$

DELIMITER ;
