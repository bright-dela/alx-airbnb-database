# Airbnb Database - Sample Data (Seed)

This script (`seed.sql`) populates the database with **sample data** for testing the Airbnb clone project.

## 📌 Entities Covered
- **Users** – Guests and hosts  
- **Properties** – Listings available for booking  
- **Bookings** – Reservation details  
- **Payments** – Records of transactions  
- **Reviews** – Guest feedback after stays  

## 🚀 Usage
1. Ensure you have already created the schema using:
   ```bash
   psql -U <username> -d <database_name> -f ../database-script-0x01/schema.sql
