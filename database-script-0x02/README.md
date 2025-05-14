## Entities Seeded

The script includes sample data for the following tables:

- **users**: 3 users (a guest, a host, and an admin)
- **properties**: 2 properties listed by the host
- **bookings**: Bookings made by the guest on listed properties
- **payments**: Payment records corresponding to the bookings
- **reviews**: Guest reviews for properties after booking
- **messages**: Messages exchanged between guest and host

## How to Use

Run the script using your PostgreSQL client or through the terminal:

```bash
psql -U your_user -d your_database -f seed.sql
```
