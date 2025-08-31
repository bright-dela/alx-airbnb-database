# Airbnb Database Schema - Script 0x01

## Overview
This directory contains the SQL schema definition for the **Airbnb database** project.  
It defines entities, relationships, and constraints based on the ERD and normalization steps.

## Files
- **schema.sql** → Contains all `CREATE TABLE` statements, constraints, and indexes.
- **README.md** → Explains the schema structure and design decisions.

## Entities & Relationships
1. **Users**
   - Attributes: user_id, full_name, email, phone_number, role, created_at
   - Relationships: Can be a `host` (owns properties) or `guest` (books properties).

2. **Properties**
   - Attributes: property_id, host_id, title, description, location, price_per_night
   - Relationships: Each property belongs to one host.

3. **Bookings**
   - Attributes: booking_id, property_id, guest_id, check_in, check_out, total_price, status
   - Relationships: Each booking is linked to one property and one guest.

4. **Reviews**
   - Attributes: review_id, booking_id, reviewer_id, rating, comment
   - Relationships: A review is tied to a booking and the reviewing user.

5. **Payments**
   - Attributes: payment_id, booking_id, amount, payment_date, method, status
   - Relationships: Each payment corresponds to one booking.

## Indexes
- Users → `email` for quick lookups.
- Properties → `location` for filtering/searching.
- Bookings → `guest_id` and `property_id` for performance.
- Payments → `booking_id` for quick access.

## How to Use
1. Connect to your PostgreSQL database.
2. Run:
   ```bash
   psql -U <username> -d <database> -f schema.sql
