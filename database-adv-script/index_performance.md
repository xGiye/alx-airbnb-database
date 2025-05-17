# Indexes and Performance Optimization

## Purpose of Indexing

Indexes are essential for optimizing query performance in relational databases. They provide quick access to rows, especially in large tables, by reducing the number of disk I/O operations required to locate data. This is particularly useful for columns used frequently in `WHERE`, `JOIN`, and `ORDER BY` clauses.

## Indexed Columns

The following columns were identified as high-usage and had indexes created to optimize performance:

| Table      | Column        | Reason for Indexing               |
| ---------- | ------------- | --------------------------------- |
| `User`     | `email`       | Frequently filtered (e.g., login) |
| `Booking`  | `user_id`     | Used in JOINs with User table     |
| `Booking`  | `property_id` | Used in JOINs with Property table |
| `Property` | `host_id`     | Used in JOINs with User table     |
| `Review`   | `property_id` | Used in JOINs with Property table |

## Performance Testing

To evaluate the impact of indexing, we used the `EXPLAIN` and `ANALYZE` commands to measure query execution plans before and after indexing.

### Example Query Tested

```sql
SELECT u.first_name, u.last_name, b.start_date, b.end_date
FROM Booking b
JOIN User u ON b.user_id = u.user_id
WHERE u.email = 'jane.doe@example.com';
```
