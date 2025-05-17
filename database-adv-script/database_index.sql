-- User table
CREATE INDEX idx_user_email ON Users(email);

-- Booking table
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Property table
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_host_id ON Property(host_id);

-- Review table
CREATE INDEX idx_review_property_id ON Review(property_id);


-- Before indexing
EXPLAIN ANALYZE
SELECT 
    u.first_name, u.last_name, b.booking_id, p.name
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.status = 'confirmed';

-- After adding indexes, rerun the same query
EXPLAIN ANALYZE
SELECT 
    u.first_name, u.last_name, b.booking_id, p.name
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.status = 'confirmed';
