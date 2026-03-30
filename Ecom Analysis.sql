SELECT * FROM ecommerce_analysis.business_data;
SELECT COUNT(order_id) From ecommerce_analysis.business_data;

CREATE DATABASE CEO_DASH;
USE CEO_DASH;

CREATE TABLE CEO_DATA (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_status VARCHAR(50),
    order_purchase_timestamp TEXT,
    purchase_year INT,
    purchase_month INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    price FLOAT,
    freight_value FLOAT,
    payment_type VARCHAR(50),
    payment_value FLOAT,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10)
);

SELECT COUNT(order_id) From CEO_DATA;


SELECT ROUND(SUM(payment_value),2) AS total_revenue
FROM CEO_DATA;

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM CEO_DATA;

SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM CEO_DATA;

SELECT ROUND(SUM(payment_value) / COUNT(DISTINCT order_id),2) AS avg_order_value
FROM CEO_DATA;

SELECT customer_state,
ROUND(SUM(payment_value),2) AS state_revenue
FROM CEO_DATA
GROUP BY customer_state
ORDER BY revenue DESC;

SELECT payment_type,
SUM(payment_value) AS type_revenue
FROM CEO_DATA
GROUP BY payment_type
ORDER BY revenue DESC;

SELECT purchase_year,
COUNT(DISTINCT order_id) AS yearly_orders
FROM CEO_DATA
GROUP BY purchase_year
ORDER BY purchase_year;

SELECT purchase_year, purchase_month,
COUNT(DISTINCT order_id) AS monthly_orders
FROM CEO_DATA
GROUP BY purchase_year, purchase_month
ORDER BY purchase_year, purchase_month;

SELECT purchase_year, purchase_month,
ROUND(SUM(payment_value),2) AS monthly_revenue
FROM CEO_DATA
GROUP BY purchase_year, purchase_month
ORDER BY purchase_year, purchase_month;

SELECT customer_state,
COUNT(DISTINCT order_id) AS state_orders
FROM CEO_DATA
GROUP BY customer_state
ORDER BY state_orders DESC
LIMIT 10;

SELECT customer_city,
ROUND(SUM(payment_value),2) AS city_revenue
FROM CEO_DATA
GROUP BY customer_city
ORDER BY city_revenue DESC
LIMIT 10;

SELECT payment_type,
ROUND(SUM(payment_value) / COUNT(DISTINCT order_id),2) AS payment_avg_order_value
FROM CEO_DATA
GROUP BY payment_type
ORDER BY payment_avg_order_value DESC;

