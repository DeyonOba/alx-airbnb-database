USE airbnb_clone_db;

CREATE TABLE IF NOT EXISTS Booking (
    booking_id VARCHAR(50) PRIMARY KEY,
    property_id VARCHAR(50) NOT NULL,
    user_id VARCHAR(50) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) CHECK (`status` IN ('pending', 'confirmed', 'cancelled')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES User(user_id) ON DELETE CASCADE
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p02023 VALUES LESS THAN 2024,
    PARTITION p02024 VALUES LESS THAN 2025,
    PARTITION p02025 VALUES LESS THAN 2026
);