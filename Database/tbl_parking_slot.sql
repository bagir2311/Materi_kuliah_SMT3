CREATE TABLE parking_slots (
slot_id INT AUTO_INCREMENT PRIMARY KEY,
location_id INT NOT NULL,
slot_number VARCHAR(10) NOT NULL,
is_available VARCHAR(10) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (location_id) REFERENCES lokasi_parkir(lokasi_id))