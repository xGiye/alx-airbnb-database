# alx-airbnb-database

# Airbnb Database Schema

## Overview

This project contains the SQL schema for a relational database that powers an Airbnb-like application. The goal is to create a scalable, normalized, and well-structured relational database that supports core functionalities such as user management, property listings, bookings, payments, messaging, and reviews.

## Technologies Used

- SQL (PostgreSQL-compatible syntax)
- UUIDs for primary keys
- CHECK constraints for data validation
- Indexing for performance optimization

## Database Structure

The database includes six core tables:

### 1. `users`

Stores user information such as names, contact details, roles, and login credentials.

### 2. `properties`

Stores listings created by hosts, including descriptions, locations, and pricing.

### 3. `bookings`

Tracks reservation information, linking users to properties over a specific period.

### 4. `payments`

Captures payment details for each confirmed booking, including amount and method.

### 5. `reviews`

Allows guests to leave ratings and comments for properties after their stay.

### 6. `messages`

Enables communication between users (guests and hosts) through a simple messaging system.

## 🔗 Relationships

- A `user` can be a `host`, `guest`, or `admin`.
- A `host` can create multiple `properties`.
- A `guest` can create multiple `bookings`.
- Each `booking` is linked to a single `property` and results in one `payment`.
- `users` can leave multiple `reviews` for `properties`.
- `users` can exchange multiple `messages` with each other.

## Schema Features

- All tables are normalized to **Third Normal Form (3NF)** to eliminate redundancy.
- Appropriate **foreign key constraints** ensure data integrity across related tables.
- **Indexes** are created on frequently queried fields to improve performance.
- **Constraints** such as `NOT NULL`, `UNIQUE`, and `CHECK` ensure valid data entry.

## File Content

- `schema.sql`: Contains all `CREATE TABLE` statements, constraints, and indexes.

## Future Improvements

- Add triggers for automatic cleanup or audit logs.
- Integrate views for analytics and reporting.
- Create stored procedures for common operations (e.g., confirm booking).

## How to Use

1. Connect to your PostgreSQL database.
2. Run the `schema.sql` script to create all tables and relationships.

```bash
psql -U your_user -d your_database -f schema.sql

```
