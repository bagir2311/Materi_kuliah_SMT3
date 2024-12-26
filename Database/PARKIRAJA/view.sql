CREATE VIEW booking_details_view AS
SELECT 
    b.booking_id,
    u.name AS user_name,
    u.email AS user_email,
    l.name AS location_name,
    s.slot_number,
    b.booking_date,
    b.start_time,
    b.end_time,
    p.amount AS payment_amount,
    p.payment_method,
    p.status AS payment_status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    parking_slots s ON b.slot_id = s.slot_id
JOIN 
    parking_locations l ON s.location_id = l.location_id
LEFT JOIN 
    payments p ON b.booking_id = p.booking_id;