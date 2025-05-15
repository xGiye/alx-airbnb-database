--A query using INNER JOIN to retrieve all bookings and respective users who made those bookings

SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    b.created_at AS booking_created_at,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM 
    Booking b 
INNER JOIN 
    Users u ON b.user_id = u.user_id;


--A query using LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    p.name AS property_name,
    p.description,
    p.location,
    p.pricepernight,
    p.created_at AS property_created_at,
    r.user_id,
    r.rating,
    r.comment,
    r.created_at AS review_created_at
FROM
    Property p
LEFT JOIN 
    Review r ON p.property_id = r.property_id
ORDER BY
    p.name ASC, r.created_at DESC;


-- A query using a FULL OUTER JOIN to retrieve all users and bookings, 
-- including uer who have never made a booking and bookings that are not linked to any user

SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM
    Users u
FULL OUTER JOIN
    Booking b ON u.user_id = b.user_id