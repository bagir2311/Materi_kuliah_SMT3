CREATE TABLE bookings(
booking_id INT NOT NULL,
user_id INT NOT NULL,
slot_id INT NOT NULL,
booking_date DATE NOT NULL,
start_time TIME NOT NULL,
end_time TIME NOT NULL,
STATUS VARCHAR(20) NOT NULL,
ccreated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
FOREIGN KEY (slot_id) REFERENCES parking_slots(slot_id) ON DELETE CASCADE)