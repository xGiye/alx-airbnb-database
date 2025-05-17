# ALX Airbnb Database - Advanced SQL Scripts

This repository contains advanced SQL scripts and performance enhancements for the Airbnb clone project. It demonstrates expert-level database management skills including complex joins, subqueries, aggregations, indexing, optimization, and partitioning for large datasets.

---

## Repository Structure

### database-adv-script/

&#8211;&#8211;&#8211; **joins_queries.sql** - Complex JOIN queries (INNER, LEFT, FULL OUTER)  
&#8211;&#8211;&#8211; **subqueries.sql** - Correlated and non-correlated subqueries  
&#8211;&#8211;&#8211; **aggregations_and_window_functions.sql** - Aggregates and window functions (RANK, ROW_NUMBER)  
&#8211;&#8211;&#8211; **database_index.sql** - Index creation for performance improvement  
&#8211;&#8211;&#8211; **index_performance.md** - Report on indexing performance impact  
&#8211;&#8211;&#8211; **perfomance.sql** - Optimized complex queries with EXPLAIN ANALYZE  
&#8211;&#8211;&#8211; **optimization_report.md** - Summary of query inefficiencies and optimizations  
&#8211;&#8211;&#8211; **partitioning.sql** - Table partitioning on Booking.start_date  
&#8211;&#8211;&#8211; **partition_performance.md** - Performance test report on partitioned table  
&#8211;&#8211;&#8211; **performance_monitoring.md** - Monitoring and refinement strategies with EXPLAIN  
&#8211;&#8211;&#8211; **README.md** - This documentation file

---

## Queries Overview

### 0. **Complex Joins**

- `INNER JOIN`: Retrieves bookings and their corresponding users.
- `LEFT JOIN`: Gets all properties, including those with no reviews.
- `FULL OUTER JOIN`: Combines all users and bookings, regardless of matching.

File: `joins_queries.sql`

---

### 1. **Subqueries**

- **Non-Correlated**: Find properties with average rating > 4.0.
- **Correlated**: Find users with more than 3 bookings.

File: `subqueries.sql`

---

### 2. **Aggregations & Window Functions**

- Count bookings per user.
- Rank properties based on total bookings using `RANK` and `ROW_NUMBER`.

File: `aggregations_and_window_functions.sql`

---

### 3. **Indexes for Optimization**

- Indexes added to `Booking`, `User`, and `Property` tables based on usage in `WHERE`, `JOIN`, and `ORDER BY` clauses.
- Performance analyzed with `EXPLAIN`.

Files: `database_index.sql`, `index_performance.md`

---

### 4. **Optimized Complex Queries**

- Retrieves bookings along with user, property, and payment details.
- Original and optimized versions compared using `EXPLAIN ANALYZE`.

Files: `perfomance.sql`, `optimization_report.md`

---

### 5. **Table Partitioning**

- Partitioned the `Booking` table by `start_date` to speed up date-based queries.
- Evaluated improvement through sample queries.

Files: `partitioning.sql`, `partition_performance.md`

---

### 6. **Monitoring and Refinement**

- Used `EXPLAIN ANALYZE` to inspect query plans.
- Identified bottlenecks and applied schema/index changes.
- Documented findings and improvements.

File: `performance_monitoring.md`

---

## How to Use

1. **Setup PostgreSQL or MySQL** as your database engine.
2. Run the SQL files in the order of tasks.
3. Use `EXPLAIN` or `ANALYZE` to inspect query performance.
4. Compare execution time and query plans before and after optimization.
5. Refer to the `.md` report files for performance summaries.

---

## Notes

- Make sure to **load sample data** before running these queries.
- Indexes can greatly **improve performance** but may slow down `INSERT`/`UPDATE` operations—use them wisely.
- Partitioning is beneficial for **large historical data** tables but requires careful planning of future inserts.

---

## Contributors

Developed as part of the **ALX Software Engineering Program**.

---
