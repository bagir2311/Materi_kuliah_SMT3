CREATE TABLE reviews (
review_id INT AUTO_INCREMENT PRIMARY KEY,
location_id INT NOT NULL,
user_id INT NOT NULL,
rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5),
comment TEXT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (location_id) REFERENCES lokasi_parkir(lokasi_id) ON DELETE CASCADE,
FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE)