-- Brazilian E-Commerce Sales Analysis Project
-- SQL Analysis Queries


-- 1. Total Revenue

SELECT 
    SUM(payment_value) AS total_revenue
FROM order_payments;



-- 2. Order Status Analysis

SELECT
    order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;



-- 3. Top Product Categories by Sales Volume

SELECT
    p.product_category_name,
    COUNT(oi.product_id) AS total_sold
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY total_sold DESC
LIMIT 10;



-- 4. Payment Method Analysis

SELECT
    payment_type,
    COUNT(*) AS transactions,
    SUM(payment_value) AS revenue
FROM order_payments
GROUP BY payment_type
ORDER BY revenue DESC;



-- 5. Average Customer Review Score

SELECT
    AVG(review_score) AS average_rating
FROM order_reviews;



-- 6. Top Product Categories by Revenue

SELECT
    p.product_category_name,
    SUM(oi.price) AS revenue
FROM products p
JOIN order_items oi
ON p.product_id = oi.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 10;



-- 7. Top Sellers by Revenue

SELECT
    s.seller_id,
    s.seller_city,
    s.seller_state,
    SUM(oi.price) AS revenue
FROM sellers s
JOIN order_items oi
ON s.seller_id = oi.seller_id
GROUP BY s.seller_id, s.seller_city, s.seller_state
ORDER BY revenue DESC
LIMIT 10;



-- 8. Monthly Revenue Trend

SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
    SUM(op.payment_value) AS revenue
FROM orders o
JOIN order_payments op
ON o.order_id = op.order_id
GROUP BY month
ORDER BY month;



-- 9. Average Delivery Time

SELECT
    AVG(
        DATEDIFF(
            order_delivered_customer_date,
            order_purchase_timestamp
        )
    ) AS avg_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;



-- 10. Review Score Distribution

SELECT
    review_score,
    COUNT(*) AS number_of_reviews
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;