-- ============================================
-- Brazilian E-Commerce Project
-- Database Setup File
-- Create Database + Tables + Import CSV Data
-- ============================================


-- Create Database

CREATE DATABASE brazil_ecommerce;

USE brazil_ecommerce;



-- ============================================
-- CREATE TABLES
-- ============================================


-- Customers Table

CREATE TABLE customers (
    customer_id VARCHAR(50),
    customer_unique_id VARCHAR(50),
    customer_zip_code_prefix INT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);



-- Orders Table

CREATE TABLE orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_status VARCHAR(20),
    order_purchase_timestamp DATETIME,
    order_approved_at DATETIME,
    order_delivered_carrier_date DATETIME,
    order_delivered_customer_date DATETIME,
    order_estimated_delivery_date DATETIME
);



-- Order Items Table

CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date DATETIME,
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2)
);



-- Order Payments Table

CREATE TABLE order_payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(50),
    payment_installments INT,
    payment_value DECIMAL(10,2)
);



-- Products Table

CREATE TABLE products (
    product_id VARCHAR(50),
    product_category_name VARCHAR(100),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);



-- Sellers Table

CREATE TABLE sellers (
    seller_id VARCHAR(50),
    seller_zip_code_prefix INT,
    seller_city VARCHAR(100),
    seller_state VARCHAR(10)
);



-- Order Reviews Table

CREATE TABLE order_reviews (
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date DATETIME,
    review_answer_timestamp DATETIME
);



-- ============================================
-- LOAD CSV FILES
-- Replace C:/path/ with your actual CSV folder path
-- ============================================



-- Customers Import

LOAD DATA LOCAL INFILE 'C:/path/olist_customers_dataset.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- Orders Import

LOAD DATA LOCAL INFILE 'C:/path/olist_orders_dataset.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- Order Items Import

LOAD DATA LOCAL INFILE 'C:/path/olist_order_items_dataset.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- Order Payments Import

LOAD DATA LOCAL INFILE 'C:/path/olist_order_payments_dataset.csv'
INTO TABLE order_payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- Products Import

LOAD DATA LOCAL INFILE 'C:/path/olist_products_dataset.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- Sellers Import

LOAD DATA LOCAL INFILE 'C:/path/olist_sellers_dataset.csv'
INTO TABLE sellers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- Reviews Import

LOAD DATA LOCAL INFILE 'C:/path/olist_order_reviews_dataset.csv'
INTO TABLE order_reviews
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



-- ============================================
-- VERIFY TABLES
-- ============================================

SHOW TABLES;


-- Check row counts

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM order_payments;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM sellers;
SELECT COUNT(*) FROM order_reviews;