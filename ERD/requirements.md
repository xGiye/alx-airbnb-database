# Airbnb Clone Database

This project involves designing and implementing a relational database schema for an Airbnb-like booking platform. The schema supports user management, property listings, bookings, payments, reviews, and messaging between users.

## Entities and Attributes

![Entity Relationship Diagram](/Entity_Relationship_Diagram.png)

---

### User

- `user_id` (UUID, Primary Key)
- `first_name` (VARCHAR, NOT NULL)
- `last_name` (VARCHAR, NOT NULL)
- `email` (VARCHAR, UNIQUE, NOT NULL)
- `password_hash` (VARCHAR, NOT NULL)
- `phone_number` (VARCHAR, nullable)
- `role` (ENUM: `guest`, `host`, `admin`)
- `created_at` (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)

### Property

- `property_id` (UUID, Primary Key)
- `host_id` (UUID, Foreign Key → User)
- `name` (VARCHAR, NOT NULL)
- `description` (TEXT, NOT NULL)
- `location` (VARCHAR, NOT NULL)
- `pricepernight` (DECIMAL, NOT NULL)
- `created_at` (TIMESTAMP)
- `updated_at` (TIMESTAMP)

### Booking

- `booking_id` (UUID, Primary Key)
- `property_id` (UUID, Foreign Key → Property)
- `user_id` (UUID, Foreign Key → User)
- `start_date` (DATE, NOT NULL)
- `end_date` (DATE, NOT NULL)
- `total_price` (DECIMAL, NOT NULL)
- `status` (ENUM: `pending`, `confirmed`, `canceled`)
- `created_at` (TIMESTAMP)

### Payment

- `payment_id` (UUID, Primary Key)
- `booking_id` (UUID, Foreign Key → Booking)
- `amount` (DECIMAL, NOT NULL)
- `payment_date` (TIMESTAMP)
- `payment_method` (ENUM: `credit_card`, `paypal`, `stripe`)

### Review

- `review_id` (UUID, Primary Key)
- `property_id` (UUID, Foreign Key → Property)
- `user_id` (UUID, Foreign Key → User)
- `rating` (INTEGER, CHECK: 1–5)
- `comment` (TEXT, NOT NULL)
- `created_at` (TIMESTAMP)

### Message

- `message_id` (UUID, Primary Key)
- `sender_id` (UUID, Foreign Key → User)
- `recipient_id` (UUID, Foreign Key → User)
- `message_body` (TEXT, NOT NULL)
- `sent_at` (TIMESTAMP)

## Entity Relationships

- **User → Property**: One-to-Many (a host owns multiple properties)
- **User → Booking**: One-to-Many (a guest makes many bookings)
- **Property → Booking**: One-to-Many
- **Booking → Payment**: One-to-One
- **User → Review**: One-to-Many (a user can leave multiple reviews)
- **Property → Review**: One-to-Many (a property can receive many reviews)
- **User ↔ User (Message)**: Many-to-Many via messages

---

---

This database structure supports the core functionality required for an MVP version of an Airbnb-style application.
