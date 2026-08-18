CREATE DATABASE customer_order_db;
USE customer_order_db;
CREATE TABLE customers (
    customer_id varchar(100),
    customer_name varchar(100),
    city varchar(50),
    email varchar(100)
);
INSERT INTO customers(customer_id, customer_name, city, email) VALUES
(1, 'Rahul', 'Delhi', 'rahul@gmail.com'),
(2, 'Aman', 'Mumbai', 'aman@gmail.com'),
(3, 'Priya', 'Delhi', 'priya@gmail.com'),
(4, 'Neha', 'Bangalore', 'neha@gmail.com'),
(5, 'Rohit', 'Mumbai', 'rohit@gmail.com'),
(6, 'Sneha', 'Pune', 'sneha@gmail.com'),
(7, 'Vikas', 'Delhi', 'vikas@gmail.com'),
(8, 'Anjali', 'Jaipur', 'anjali@gmail.com');
CREATE TABLE orders (order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_amount DECIMAL(10,2)

);
INSERT INTO orders VALUES
(101, 1, '2026-01-10', 5000),
(102, 2, '2026-01-15', 3000),
(103, 1, '2026-02-05', 2500),
(104, 3, '2026-02-12', 7000),
(105, 4, '2026-02-20', 4500),
(106, 2, '2026-03-03', 6000),
(107, 5, '2026-03-10', 8000),
(108, 3, '2026-03-15', 3500),
(109, 1, '2026-04-01', 9000),
(110, 5, '2026-04-10', 4000),
(111, 7, '2026-04-20', 2000),
(112, 4, '2026-05-05', 10000);
SELECT * FROM orders;
select count(*) as total_customers from customers;
select sum(order_amount) as total_sales from orders;
select AVG(order_amount) AS average_order_amount from orders;
SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.order_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

SELECT c.city,SUM(o.order_amount) AS total_sales
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.city
ORDER BY total_sales DESC;

SELECT c.customer_id,c.customer_name,c.city
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

SELECT YEAR(order_date) AS year,MONTH(order_date) AS month,SUM(order_amount) AS monthly_sales
FROM orders
GROUP BY YEAR(order_date),MONTH(order_date)
ORDER BY year,month;

SELECT order_id,customer_id,order_date,order_amount
FROM orders
ORDER BY order_amount DESC
LIMIT 1;

SELECT order_id,customer_id,order_date,order_amount
FROM orders
ORDER BY order_amount DESC
LIMIT 1;