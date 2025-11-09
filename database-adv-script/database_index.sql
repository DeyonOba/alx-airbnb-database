USE airbnb_clone_db;

-- Create index on User email for faster lookups
CREATE INDEX idx_user_email ON User(email);

-- Create index on Property location and price_per_night for optimized search queries
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_propetry_price_per_night ON Property(price_per_night);

-- Create index on Booking user_id and property_id for efficient booking retrieval
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Create index on Review property_id and user_id for quick access to reviews
CREATE INDEX idx_review_property_id ON Review(property_id);
CREATE INDEX idx_review_user_id ON Review(user_id);
CREATE INDEX idx_review_rating ON Review(rating);

-- Create index on Payment booking_id for faster payment lookups
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- Composite index on Booking start_date and end_date for date range queries
CREATE INDEX idx_booking_date_range ON Booking(start_date, end_date);

-- Composite index on Message sender_id and receiver_id for efficient message retrieval
CREATE INDEX idx_message_sender_recipient ON Message(sender_id, recipient_id);
