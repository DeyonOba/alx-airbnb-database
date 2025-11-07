USE airbnb_clone_db;

-- Query to find properties with an average rating greater than 4
SELECT r.property_id, r.rating
FROM (
    SELECT property_id, AVG(rating) AS rating
    FROM Review
    GROUP BY property_id
) AS r
WHERE r.rating > 4.0;

-- Query to find users who have made more than 3 bookings
SELECT user_id, first_name, last_name
FROM User
WHERE (
    SELECT COUNT(*)
    FROM Booking AS b
    WHERE b.user_id = User.user_id
) > 3;