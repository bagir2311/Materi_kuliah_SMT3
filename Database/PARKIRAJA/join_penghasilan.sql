SELECT 
    l.name AS location_name,
    SUM(p.amount) AS total_revenue
FROM 
    payments p
JOIN 
    bookings b ON p.booking_id = b.booking_id
JOIN 
    parking_slots s ON b.slot_id = s.slot_id
JOIN 
    parking_locations l ON s.location_id = l.location_id
WHERE 
    p.status = 'completed'
GROUP BY 
    l.name
ORDER BY 
    total_revenue DESC;
