USE airbnb_clone_db;

-- DESCRIBE SELECT * FROM USER WHERE email = "johndoe@gmail.com";
-- SELECT * FROM USER WHERE email = "johndoe@gmail.com";

-- -- Query to get the rank and row number of properties based on the number of bookings
-- EXPLAIN
-- SELECT
--     p.property_id,
--     COUNT(b.property_id) AS total_booking,
--     RANK() OVER (ORDER BY COUNT(b.property_id) DESC) AS booking_rank,
--     ROW_NUMBER() OVER (ORDER BY COUNT(b.property_id) DESC) AS booking_row_number
-- FROM Property AS p
-- JOIN Booking AS b
--     ON p.property_id = b.property_id
-- GROUP BY p.property_id;

EXPLAIN ANALYZE
SELECT
    p.property_id,
    COUNT(b.property_id) AS total_booking,
    RANK() OVER (ORDER BY COUNT(b.property_id) DESC) AS booking_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.property_id) DESC) AS booking_row_number
FROM Property AS p
JOIN Booking AS b
    ON p.property_id = b.property_id
GROUP BY p.property_id;