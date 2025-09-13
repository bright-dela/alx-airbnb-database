/*Inner join */
SELECT b.id AS booking_id, u.id AS user_id, u.name, b.start_date, b.end_date
FROM Bookings b
INNER JOIN Users u ON b.user_id = u.id;

/* Left join */
SELECT p.id AS property_id, p.name AS property_name, r.id AS review_id, r.rating, r.comment
FROM Properties p
LEFT JOIN Reviews r ON p.id = r.property_id;

/* Full outer join */
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.start_date
FROM Users u
LEFT JOIN Bookings b ON u.id = b.user_id
UNION
SELECT u.id AS user_id, u.name, b.id AS booking_id, b.start_date
FROM Users u
RIGHT JOIN Bookings b ON u.id = b.user_id
WHERE u.id IS NULL;
