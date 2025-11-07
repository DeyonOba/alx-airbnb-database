USE airbnb_clone_db;

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date,
    b.created_at AS booking_created_at,
    b.property_id,
    b.total_price,
    b.status
FROM User AS u
INNER JOIN Booking AS b 
    ON u.user_id = b.user_id;


SELECT
    p.property_id,
    p.host_id,
    p.name AS property_name,
    p.location,
    p.price_per_night,
    r.review_id,
    r.rating,
    r.comment
FROM Property AS p
LEFT JOIN Review AS r
    ON p.property_id = r.property_id
ORDER BY r.rating DESC;

SELECT * FROM User FULL OUTER JOIN Booking ON User.user_id = Booking.user_id;