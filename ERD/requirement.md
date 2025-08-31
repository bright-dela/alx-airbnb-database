# AirBnB Database ERD Requirements

## Objective
Design an Entity-Relationship (ER) diagram for the AirBnB database system.  
The diagram must capture all entities, their attributes, and relationships, and serve as the foundation for database schema implementation.

---

## Entities and Attributes

### **User**
- **user_id**: UUID, Primary Key, Indexed
- **first_name**: VARCHAR, NOT NULL
- **last_name**: VARCHAR, NOT NULL
- **email**: VARCHAR, UNIQUE, NOT NULL
- **password_hash**: VARCHAR, NOT NULL
- **phone_number**: VARCHAR, NULL
- **role**: ENUM(`guest`, `host`, `admin`), NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### **Property**
- **property_id**: UUID, Primary Key, Indexed
- **host_id**: Foreign Key → User(user_id)
- **name**: VARCHAR, NOT NULL
- **description**: TEXT, NOT NULL
- **location**: VARCHAR, NOT NULL
- **price_per_night**: DECIMAL, NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **updated_at**: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP

---

### **Booking**
- **booking_id**: UUID, Primary Key, Indexed
- **property_id**: Foreign Key → Property(property_id)
- **user_id**: Foreign Key → User(user_id)
- **start_date**: DATE, NOT NULL
- **end_date**: DATE, NOT NULL
- **total_price**: DECIMAL, NOT NULL
- **status**: ENUM(`pending`, `confirmed`, `canceled`), NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### **Payment**
- **payment_id**: UUID, Primary Key, Indexed
- **booking_id**: Foreign Key → Booking(booking_id)
- **amount**: DECIMAL, NOT NULL
- **payment_date**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
- **payment_method**: ENUM(`credit_card`, `paypal`, `stripe`), NOT NULL

---

### **Review**
- **review_id**: UUID, Primary Key, Indexed
- **property_id**: Foreign Key → Property(property_id)
- **user_id**: Foreign Key → User(user_id)
- **rating**: INTEGER (1–5), NOT NULL
- **comment**: TEXT, NOT NULL
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

### **Message**
- **message_id**: UUID, Primary Key, Indexed
- **sender_id**: Foreign Key → User(user_id)
- **recipient_id**: Foreign Key → User(user_id)
- **message_body**: TEXT, NOT NULL
- **sent_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP

---

## Relationships

- **User (1) → (M) Property**  
  A host can own multiple properties.

- **User (1) → (M) Booking**  
  A guest can make multiple bookings.

- **Property (1) → (M) Booking**  
  A property can have multiple bookings.

- **Booking (1) → (M) Payment**  
  A booking can have multiple payments.

- **Property (1) → (M) Review**  
  A property can have multiple reviews.

- **User (1) → (M) Review**  
  A guest can write multiple reviews.

- **User (1) → (M) Message**  
  A user can send and receive multiple messages.

---

## Constraints
- **User**
  - `email` must be unique.
  - Required fields: first_name, last_name, email, password_hash, role.
- **Property**
  - `host_id` must reference a valid user with role `host`.
- **Booking**
  - `status` must be `pending`, `confirmed`, or `cancelled`.
  - `start_date < end_date`.
- **Payment**
  - Must reference a valid booking.
- **Review**
  - `rating` must be between 1 and 5.
- **Message**
  - `sender_id` and `recipient_id` must reference valid users.

---

## Deliverable
- A **visual ER diagram** created using **Draw.io (diagrams.net)** or similar tool.
- Export diagram in both:
  - **`.drawio` format** (for editing)
  - **`.png` format** (for documentation preview)

Both diagram files should be stored inside the `ERD/` directory of the repository alongside this `requirements.md` file.

