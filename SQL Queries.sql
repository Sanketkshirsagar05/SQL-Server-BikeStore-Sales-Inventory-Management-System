-- 1. List all products with their brand and category
SELECT p.product_name, b.brand_name, c.category_name, p.model_year, p.list_price
FROM production.products p
JOIN production.brands b ON p.brand_id = b.brand_id
JOIN production.categories c ON p.category_id = c.category_id;

-- 2. Get all customers from 'New York'
SELECT customer_id, first_name, last_name, email, city
FROM sales.customers
WHERE city = 'New York';

-- 3. Count total products in stock
SELECT SUM(quantity) AS total_stock
FROM production.stocks;

-- 4. Find top 5 most expensive products
SELECT TOP 5 product_name, list_price
FROM production.products
ORDER BY list_price DESC;

-- 5. List orders with customer and staff details
SELECT o.order_id, o.order_date, o.order_status,
       c.first_name + ' ' + c.last_name AS customer_name,
       s.first_name + ' ' + s.last_name AS staff_name
FROM sales.orders o
JOIN sales.customers c ON o.customer_id = c.customer_id
JOIN sales.staffs s ON o.staff_id = s.staff_id;

-- 6. Find number of orders per store
SELECT st.store_name, COUNT(o.order_id) AS total_orders
FROM sales.orders o
JOIN sales.stores st ON o.store_id = st.store_id
GROUP BY st.store_name;

-- 7. Calculate total sales revenue per year
SELECT YEAR(order_date) AS Year, SUM(oi.quantity * oi.list_price * (1 - oi.discount/100)) AS Revenue
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY YEAR(order_date)
ORDER BY Year;

-- 8. Find best-selling products
SELECT TOP 10 p.product_name, SUM(oi.quantity) AS total_sold
FROM sales.order_items oi
JOIN production.products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

-- 9. Customer lifetime value (total amount spent by each customer)
SELECT c.customer_id, c.first_name, c.last_name,
       SUM(oi.quantity * oi.list_price * (1 - oi.discount/100)) AS total_spent
FROM sales.customers c
JOIN sales.orders o ON c.customer_id = o.customer_id
JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_spent DESC;

-- 10. Sales by staff per month
SELECT s.first_name + ' ' + s.last_name AS staff_name,
       FORMAT(o.order_date, 'yyyy-MM') AS month,
       SUM(oi.quantity * oi.list_price * (1 - oi.discount/100)) AS sales
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN sales.staffs s ON o.staff_id = s.staff_id
GROUP BY s.first_name, s.last_name, FORMAT(o.order_date, 'yyyy-MM')
ORDER BY month;

-- 11. Products low in stock (less than 10 units per store)
SELECT st.store_name, p.product_name, s.quantity
FROM production.stocks s
JOIN sales.stores st ON s.store_id = st.store_id
JOIN production.products p ON s.product_id = p.product_id
WHERE s.quantity < 10;

-- 12. Show product details along with brand and category
SELECT p.product_name, b.brand_name, c.category_name, p.model_year, p.list_price
FROM production.products p
JOIN production.brands b ON p.brand_id = b.brand_id
JOIN production.categories c ON p.category_id = c.category_id;

-- 13. Find all customers with Gmail or Hotmail email addresses
SELECT customer_id, first_name, last_name, email
FROM sales.customers
WHERE email LIKE '%@gmail.com%' OR email LIKE '%@hotmail.com%';

-- 14. List all orders and show status in text form
SELECT order_id,
       CASE order_status
           WHEN 1 THEN 'Pending'
           WHEN 2 THEN 'Processing'
           WHEN 3 THEN 'Rejected'
           WHEN 4 THEN 'Completed'
       END AS status_text,
       order_date, shipped_date
FROM sales.orders;

-- 15. Calculate order value (including discount) for each order item
SELECT oi.order_id, oi.item_id, p.product_name,
       oi.quantity, oi.list_price, oi.discount,
       (oi.quantity * oi.list_price * (1 - oi.discount)) AS order_value
FROM sales.order_items oi
JOIN production.products p ON oi.product_id = p.product_id;

-- 16. Total revenue by store
SELECT st.store_id, st.store_name,
       SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_revenue
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN sales.stores st ON o.store_id = st.store_id
GROUP BY st.store_id, st.store_name;

-- 17. Customers and their total number of orders
SELECT c.customer_id, c.first_name, c.last_name,
       COUNT(o.order_id) AS total_orders
FROM sales.customers c
LEFT JOIN sales.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- 18. Find products not yet ordered
SELECT p.product_id, p.product_name
FROM production.products p
LEFT JOIN sales.order_items oi ON p.product_id = oi.product_id
WHERE oi.product_id IS NULL;

-- 19. Top 3 most recent orders
SELECT TOP 3 order_id, customer_id, order_date, shipped_date
FROM sales.orders
ORDER BY order_date DESC;

-- 20. Orders delayed in shipping
SELECT order_id, order_date, required_date, shipped_date
FROM sales.orders
WHERE shipped_date > required_date;

-- 21. Staff performance (total sales handled by each staff)
SELECT s.staff_id, s.first_name + ' ' + s.last_name AS staff_name,
       SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_sales
FROM sales.orders o
JOIN sales.staffs s ON o.staff_id = s.staff_id
JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY s.staff_id, s.first_name, s.last_name;

-- 22. Best-selling category by quantity
SELECT c.category_name, SUM(oi.quantity) AS total_sold
FROM sales.order_items oi
JOIN production.products p ON oi.product_id = p.product_id
JOIN production.categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY total_sold DESC;

-- 23. Average discount applied on orders
SELECT AVG(discount) AS avg_discount
FROM sales.order_items;

-- 24. Yearly sales summary
SELECT YEAR(order_date) AS sales_year,
       SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS yearly_sales
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY YEAR(order_date)
ORDER BY sales_year;

-- 25. Customers with no orders
SELECT c.customer_id, c.first_name, c.last_name, c.email
FROM sales.customers c
LEFT JOIN sales.orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;











-- . Create a view: Active orders with customer & staff
GO
CREATE VIEW sales.vw_active_orders
AS
SELECT o.order_id, o.order_date, o.required_date, o.order_status,
       c.first_name + ' ' + c.last_name AS customer_name,
       s.first_name + ' ' + s.last_name AS staff_name
FROM sales.orders o
JOIN sales.customers c ON o.customer_id = c.customer_id
JOIN sales.staffs s ON o.staff_id = s.staff_id
WHERE o.order_status IN (1, 2);
GO

-- . Create a stored procedure: Get sales by year
GO
CREATE PROCEDURE sales.usp_sales_by_year @year INT
AS
BEGIN
    SELECT YEAR(o.order_date) AS Year, 
           SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS Revenue
    FROM sales.orders o
    JOIN sales.order_items oi ON o.order_id = oi.order_id
    WHERE YEAR(o.order_date) = @year
    GROUP BY YEAR(o.order_date);
END;
GO

-- Get active orders for a specific customer
SELECT * 
FROM sales.vw_active_orders
WHERE customer_name LIKE '%Martin%';

-- Execute procedure
EXEC sales.usp_sales_by_year 2016;

-- For All Year
SELECT YEAR(o.order_date) AS Year, 
       SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS Revenue
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY YEAR(o.order_date);

-- Drop the view if it exists
IF OBJECT_ID('sales.vw_active_orders', 'V') IS NOT NULL
    DROP VIEW sales.vw_active_orders;
GO

-- Drop the stored procedure if it exists
IF OBJECT_ID('sales.usp_sales_by_year', 'P') IS NOT NULL
    DROP PROCEDURE sales.usp_sales_by_year;
GO