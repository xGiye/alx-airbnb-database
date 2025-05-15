# SQL JOIN Queries - Airbnb Database

This directory contains SQL queries demonstrating the use of `JOIN` operations on the **Airbnb-like relational database schema**. These queries help retrieve meaningful insights by combining data across multiple related tables.

## Files

- `inner_join.sql`: Retrieve bookings along with the users who made them.
- `left_join.sql`: Retrieve all properties and their reviews, including properties that have no reviews.
- `full_outer_join.sql`: Retrieve all users and bookings, including users without bookings and bookings without linked users.

## JOIN Query Descriptions

### INNER JOIN: Bookings and Users

```sql
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
```

### LEFT JOIN: Property and Reviews

```sql
SELECT
    p.host_id,
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
    Review r ON p.property_id = r.property_id;

```

### FULL OUTER JOIN: Users and Bookings

```sql
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

```
