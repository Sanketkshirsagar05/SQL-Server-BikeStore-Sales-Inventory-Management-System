# SQL Server BikeStore Sales & Inventory Management System  

## 📌 Project Overview  
This project is a **SQL Server-based database system** that simulates a real-world retail company (BikeStore).  
It is designed to handle **sales, customers, staff, products, inventory, and order management** while also supporting **business insights** through views and stored procedures.  

---

## 🏗️ Database Schema  
The database is divided into **two schemas** for better organization:  

- **Production Schema**  
  - Categories  
  - Brands  
  - Products  
  - Stocks  

- **Sales Schema**  
  - Customers  
  - Stores  
  - Staffs  
  - Orders  
  - Order Items  

---

## ⚙️ Features Implemented  

- **Schema & Table Creation**  
  - Designed normalized tables with relationships using primary and foreign keys  
  - Implemented cascading updates & deletes for referential integrity  

- **Sample Data Insertion**  
  - Added customers, staff, stores, products, brands, categories, orders, and inventory  

- **Views**  
  - Created reusable views such as `vw_active_orders` to simplify business reporting  

- **Stored Procedures**  
  - Developed procedures such as `usp_sales_by_year` to calculate sales revenue by year  

- **Business Insights**  
  - Revenue by year, store, and product  
  - Customer purchase history  
  - Inventory and stock tracking  

---

## 🚀 How to Run  

1. Install **SQL Server** (2019 or later recommended).  
2. Open **SQL Server Management Studio (SSMS)**.  
3. Create a new database (e.g., `BikeStoreDB`).  
4. Run the provided schema creation script.  
5. Insert sample data using the data script.  
6. Explore views, stored procedures, and queries for analysis.  

---
