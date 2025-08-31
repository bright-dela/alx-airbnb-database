# Database Normalization for AirBnB Schema

## Objective
The goal of this document is to apply **normalization principles** to ensure the AirBnB database schema is in **Third Normal Form (3NF)**.  
Normalization eliminates redundancy, ensures data integrity, and improves efficiency in data operations.

---

## Step 1: First Normal Form (1NF)
**Requirements:**
- Each column must contain atomic (indivisible) values.
- Each record must be unique.
- No repeating groups or arrays.

**Application:**
- All attributes in the schema are atomic (e.g., `first_name`, `last_name`, `email` are not grouped together).
- Each table has a primary key (`user_id`, `property_id`, `booking_id`, etc.).
- No repeating groups or multi-valued attributes.

✅ **The schema satisfies 1NF.**

---

## Step 2: Second Normal Form (2NF)
**Requirements:**
- Must be in 1NF.
- No partial dependency (i.e., no non-key attribute depends on only part of a composite primary key).

**Application:**
- Each table uses a **single-column primary key** (`UUID`) instead of a composite key.
- All non-key attributes depend entirely on their table’s primary key.  
  - Example: `email`, `role`, etc. depend only on `user_id`.
  - Example: `price_per_night` depends only on `property_id`.

✅ **The schema satisfies 2NF.**

---

## Step 3: Third Normal Form (3NF)
**Requirements:**
- Must be in 2NF.
- No transitive dependencies (non-key attributes should not depend on other non-key attributes).

**Review of Entities:**

### User
- Attributes depend only on `user_id`.  
- No transitive dependencies.  
✅ Already in 3NF.

### Property
- Attributes (`name`, `description`, `location`, `price_per_night`) depend only on `property_id`.  
- `host_id` correctly references a **User**.  
✅ In 3NF.

### Booking
- Attributes (`start_date`, `end_date`, `total_price`, `status`) depend only on `booking_id`.  
- `user_id` and `property_id` are valid foreign keys (no derived values stored).  
✅ In 3NF.

### Payment
- Attributes (`amount`, `payment_date`, `payment_method`) depend only on `payment_id`.  
- `booking_id` is a valid foreign key.  
✅ In 3NF.

### Review
- Attributes (`rating`, `comment`, `created_at`) depend only on `review_id`.  
- `user_id` and `property_id` are valid references.  
✅ In 3NF.

### Message
- Attributes (`message_body`, `sent_at`) depend only on `message_id`.  
- `sender_id` and `recipient_id` are foreign keys.  
✅ In 3NF.

---

## Conclusion
The AirBnB database schema already satisfies **Third Normal Form (3NF)**:
- No repeating groups (1NF).
- No partial dependencies (2NF).
- No transitive dependencies (3NF).

This design avoids redundancy and ensures data integrity while supporting efficient queries.

---

## Deliverable
- This file: **`normalization.md`**
- Confirms that all entities (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`) meet the requirements of **3NF**.
