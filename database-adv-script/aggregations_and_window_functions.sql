USE airbnb_clone_db;

-- Query to get the total number of bookings made by each user
SELECT u.user_id, COUNT(b.user_id) as count
FROM User u
LEFT JOIN Booking b
    ON u.user_id = b.user_id
GROUP BY u.user_id;

-- Query to get the rank and row number of properties based on the number of bookings
SELECT
    p.property_id,
    COUNT(b.property_id) AS total_booking,
    RANK() OVER (ORDER BY COUNT(b.property_id) DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.property_id) DESC) AS booking_row_number
FROM Property AS p
JOIN Booking AS b
    ON p.property_id = b.property_id
GROUP BY p.property_id;
