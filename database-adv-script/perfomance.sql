-- Initial query: Fetch all bookings with user, property, and payment details

EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    p.pricepernight,
    pay.payment_id,
    pay.amount,
    pay.payment_method,
    pay.payment_date
FROM 
    Booking b
JOIN 
    Users u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
LEFT JOIN 
    Payment pay ON b.booking_id = pay.booking_id;


-- Refactored query: Only essential fields, assume indexes are already created
-- Step 1: Use EXPLAIN ANALYZE to evaluate query performance
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,

    u.first_name,
    u.last_name,
    u.email,

    p.name AS property_name,
    p.location,

    pay.amount,
    pay.payment_method

FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id

-- Apply WHERE clause for a common filter (e.g., recent bookings)
WHERE b.start_date >= '2024-01-01'
  AND b.status = 'confirmed'

-- Optional: sort for reporting or UI purposes
ORDER BY b.start_date DESC;



-- For JOIN and filter optimization
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- For WHERE clause optimization
CREATE INDEX idx_booking_start_status ON Booking(start_date, status);

