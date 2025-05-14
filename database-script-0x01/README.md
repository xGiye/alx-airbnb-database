# Airbnb SQL Schema Creation

## Overview

This SQL script defines the relational database schema for an Airbnb-like platform. It includes `CREATE TABLE` statements for all core entities, along with constraints and indexing to ensure data integrity, performance, and normalization.

## What’s Included

The script creates the following tables:

- **users**: Stores user information (guests, hosts, admins).
- **properties**: Listings posted by hosts.
- **bookings**: Reservation records between users and properties.
- **payments**: Payment details for bookings.
- **reviews**: Feedback from users about properties.
- **messages**: Direct messages exchanged between users.

## Features

- **Primary Keys**: UUIDs ensure globally unique identifiers.
- **Foreign Keys**: Define relationships across tables (e.g., bookings linked to users and properties).
- **Constraints**: Includes `NOT NULL`, `UNIQUE`, `CHECK`, and `ENUM`-like behavior for robust validation.
- **Indexes**: Added to critical columns like `email`, `property_id`, and `booking_id` for faster queries.

## Usage

To set up the database schema:

```bash
psql -U your_user -d your_database -f schema.sql
```
