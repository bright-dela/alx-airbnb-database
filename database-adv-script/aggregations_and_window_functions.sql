/* Aggregations */
SELECT user_id, COUNT(*) AS total_bookings
FROM Bookings
GROUP BY user_id
ORDER BY total_bookings DESC;

/* Window Function */
SELECT 
    property_id, 
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS booking_rank
FROM Bookings
GROUP BY property_id
ORDER BY total_bookings DESC;

