SELECT 
    s.slot_number,
    l.name AS location_name,
    b.start_time,
    b.end_time,
    u.name AS reserved_by
FROM 
    bookings b
JOIN 
    parking_slots s ON b.slot_id = s.slot_id
JOIN 
    parking_locations l ON s.location_id = l.location_id
JOIN 
    users u ON b.user_id = u.user_id
WHERE 
    NOW() BETWEEN b.start_time AND b.end_time
ORDER BY 
    l.name, s.slot_number;
