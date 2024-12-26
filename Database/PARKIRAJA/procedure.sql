DELIMITER $$

CREATE PROCEDURE AddBooking (
    IN userId INT,
    IN slotId INT,
    IN bookingDate DATE,
    IN startTime TIME,
    IN endTime TIME
)
BEGIN
    -- Validasi apakah slot tersedia
    IF (SELECT is_available FROM slots WHERE slot_id = slotId) = 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Slot is not available.';
    ELSE
        -- Menambahkan pemesanan
        INSERT INTO bookings (user_id, slot_id, booking_date, start_time, end_time, status)
        VALUES (userId, slotId, bookingDate, startTime, endTime, 'pending');
        
        -- Update ketersediaan slot
        UPDATE parking_slots SET is_available = 0 WHERE slot_id = slotId;
    END IF;
END $$

DELIMITER ;
