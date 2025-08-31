-- Insert sample Users
INSERT INTO Users (user_id, name, email, phone, created_at)
VALUES
(1, 'Alice Johnson', 'alice@example.com', '+233201234567', '2025-01-05'),
(2, 'Bob Smith', 'bob@example.com', '+233209876543', '2025-02-12'),
(3, 'Charlie Adams', 'charlie@example.com', '+233507654321', '2025-03-01');

-- Insert sample Properties
INSERT INTO Properties (property_id, host_id, title, description, location, price_per_night, created_at)
VALUES
(1, 1, 'Beachfront Villa', 'Luxury villa with ocean view', 'Cape Coast', 120.00, '2025-02-01'),
(2, 2, 'Accra City Apartment', 'Modern apartment in the heart of Accra', 'Accra', 80.00, '2025-02-15'),
(3, 1, 'Kumasi Garden House', 'Cozy house with private garden', 'Kumasi', 60.00, '2025-03-10');

-- Insert sample Bookings
INSERT INTO Bookings (booking_id, property_id, guest_id, start_date, end_date, status, created_at)
VALUES
(1, 1, 2, '2025-03-20', '2025-03-25', 'confirmed', '2025-03-01'),
(2, 2, 3, '2025-04-05', '2025-04-10', 'pending', '2025-03-18'),
(3, 3, 2, '2025-05-01', '2025-05-03', 'cancelled', '2025-04-01');

-- Insert sample Payments
INSERT INTO Payments (payment_id, booking_id, amount, payment_date, method, status)
VALUES
(1, 1, 600.00, '2025-03-05', 'credit_card', 'completed'),
(2, 2, 400.00, '2025-03-20', 'mobile_money', 'pending'),
(3, 3, 120.00, '2025-04-02', 'credit_card', 'refunded');

-- Insert sample Reviews
INSERT INTO Reviews (review_id, booking_id, rating, comment, created_at)
VALUES
(1, 1, 5, 'Amazing stay! Highly recommend.', '2025-03-28'),
(2, 2, 4, 'Great location, but a bit noisy at night.', '2025-04-12');
