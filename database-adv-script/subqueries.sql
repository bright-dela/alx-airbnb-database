/* Non-correlated Subquery */
SELECT p.id, p.name
FROM Properties p
WHERE p.id IN (
    SELECT property_id
    FROM Reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

/* Correlated Subquery */
SELECT u.id, u.name
FROM Users u
WHERE (
    SELECT COUNT(*)
    FROM Bookings b
    WHERE b.user_id = u.id
) > 3;
