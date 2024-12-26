-- Menggunakan subquery untuk menghitung total pendapatan per lokasi
SELECT 
    location_name,
    total_revenue
FROM (
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
) AS revenue_per_location
ORDER BY 
    total_revenue DESC
LIMIT 1;
