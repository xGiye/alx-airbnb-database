# Airbnb Database Normalization to 3NF

This document outlines how the Airbnb database schema adheres to the principles of **Third Normal Form (3NF)** by eliminating redundancy and ensuring data integrity.

---

## What is 3NF?

A table is in **Third Normal Form (3NF)** if:

1. It is in **Second Normal Form (2NF)**
2. It has **no transitive functional dependencies** (i.e., non-key attributes should not depend on other non-key attributes)

---

## Normalization Process

### 1NF – First Normal Form

- Ensured that **each column contains atomic values** (no multiple values or repeating groups).
- All records are **uniquely identified** using UUID primary keys.

**Example:**

- `phone_number` is a single value per user (no array of numbers).
- `payment_method` is stored as an ENUM (single value per transaction).

---

### 2NF – Second Normal Form

- All **non-key attributes** are fully functionally dependent on the **entire primary key**.
- There are **no partial dependencies** since:
  - All tables have a single-column primary key (UUIDs).
  - Composite keys are not used, so no partial dependency violations exist.

**Example:**

- In `Booking`, `start_date`, `end_date`, `status`, and `total_price` all depend on `booking_id`.

---

### 3NF – Third Normal Form

- Eliminated **transitive dependencies** where a non-key attribute depends on another non-key attribute.
- Carefully separated data into distinct, related tables.

**Examples:**

1. **User Table:**

   - `role` is stored as an ENUM instead of a separate table (acceptable for small, unchanging categories).
   - No fields like `city`, `country`, etc., that would need to be separated into location tables to avoid transitive dependencies.

2. **Property Table:**

   - `host_id` is a foreign key — all other fields describe the property directly.
   - `location` is stored as a single string — if detailed location data were added (e.g., `city`, `country`), consider creating a `Location` table.

3. **Booking Table:**

   - Depends only on `booking_id`.
   - No indirect dependencies; all fields relate directly to the booking.

4. **Payment Table:**

   - Each payment is linked to exactly one booking (1:1 relationship).
   - `amount` and `payment_method` directly relate to the payment itself.

5. **Review Table:**

   - Contains only the fields relevant to a review.
   - Ratings are atomic and constrained.

6. **Message Table:**
   - Self-referencing foreign keys (`sender_id`, `recipient_id`) correctly model user-to-user messaging.

---

## Improvements (Optional)

While the schema meets 3NF, further **denormalization or restructuring** could be considered based on app performance and usage:

- Introduce a `Location` table if properties will be searched by detailed geolocation.
- Add a `Role` reference table if user roles expand in the future.
- Split `User` table into `Guest` and `Host` profiles if role-specific fields are introduced.

---

## Conclusion

The current schema:

- Is in **Third Normal Form (3NF)**
- Avoids redundancy and update anomalies
- Maintains integrity through proper use of primary and foreign keys

This design ensures a scalable and clean foundation for building the Airbnb MVP.
