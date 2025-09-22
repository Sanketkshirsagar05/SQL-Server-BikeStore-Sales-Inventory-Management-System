# SQL Server BikeStore Sales & Inventory Management System  

## 📌 Project Overview  
This project is a **SQL Server-based database system** designed to manage and analyze sales, customers, products, staff, and inventory for a retail company (BikeStore).  
It includes **schemas, tables, relationships, queries, views, and stored procedures** to simulate a real-world company database environment.  

The database supports:  
- Managing customers, staff, stores, products, brands, and categories  
- Handling sales orders and order items  
- Tracking stock levels across stores  
- Performing sales analysis through views and stored procedures  

---

## 🏗️ Database Schema  
The database is divided into **two schemas**:  

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

1. **Schema & Table Creation**  
   - Normalized structure with primary/foreign keys  
   - Cascading updates & deletes for referential integrity  

2. **Sample Data Insertion**  
   - Brands, categories, products, customers, orders, order items, and stock  

3. **Views**  
   - `vw_active_orders` → Displays active orders with customer & staff details  

4. **Stored Procedures**  
   - `usp_sales_by_year` → Returns total sales revenue for a given year  

5. **Business Queries**  
   - Top-selling products  
   - Revenue by store  
   - Customer purchase history  
   - Inventory status  


```sql
SELECT * FROM sales.vw_active_orders;
