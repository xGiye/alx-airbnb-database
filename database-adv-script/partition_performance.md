# Booking Table Partitioning Report

## Objective

Improve query performance on the large `Booking` table by implementing **range partitioning** based on the `start_date` column.

## Implementation

- Partitioned `Booking` into sub-tables by year (`Booking_2023`, `Booking_2024`, `Booking_2025`).
- Used PostgreSQL's `PARTITION BY RANGE` feature.
- Migrated existing data from `Booking_old` to the new partitioned table.

## Query Tested

```sql
SELECT *
FROM Booking
WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
```
