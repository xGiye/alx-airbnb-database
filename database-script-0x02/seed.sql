-- Airbnb Database Seed Script

-- Populate User table
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('uuid-guest-001', 'Alice', 'Smith', 'alice@example.com', 'hashed_pw1', '1234567890', 'guest'),
  ('uuid-host-001', 'Bob', 'Johnson', 'bob@example.com', 'hashed_pw2', '0987654321', 'host'),
  ('uuid-admin-001', 'Admin', 'User', 'admin@example.com', 'hashed_pw3', NULL, 'admin');

-- Populate Property table
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('uuid-prop-001', 'uuid-host-001', 'Cozy Studio Downtown', 'A small, clean studio in the city center.', 'Lagos, Nigeria', 50.00),
  ('uuid-prop-002', 'uuid-host-001', 'Beachside Bungalow', 'Relaxing bungalow with ocean view.', 'Lekki, Nigeria', 120.00);

-- Populate Booking table
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('uuid-booking-001', 'uuid-prop-001', 'uuid-guest-001', '2025-06-01', '2025-06-05', 200.00, 'confirmed'),
  ('uuid-booking-002', 'uuid-prop-002', 'uuid-guest-001', '2025-07-10', '2025-07-12', 240.00, 'pending');

-- Populate Payment table
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
  ('uuid-payment-001', 'uuid-booking-001', 200.00, 'credit_card'),
  ('uuid-payment-002', 'uuid-booking-002', 240.00, 'paypal');

-- Populate Review table
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
  ('uuid-review-001', 'uuid-prop-001', 'uuid-guest-001', 5, 'Great stay, clean and well-located!'),
  ('uuid-review-002', 'uuid-prop-002', 'uuid-guest-001', 4, 'Nice view but a bit noisy at night.');

-- Populate Message table
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
  ('uuid-msg-001', 'uuid-guest-001', 'uuid-host-001', 'Hi Bob, is the studio available this weekend?'),
  ('uuid-msg-002', 'uuid-host-001', 'uuid-guest-001', 'Hi Alice, yes it is! Let me know if you need anything.');
