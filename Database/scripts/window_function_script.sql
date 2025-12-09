SELECT 
    order_id,
    customer_id,
    order_date,
    ROW_NUMBER() OVER (ORDER BY order_date DESC) AS order_rank
FROM orders;


SELECT 
    customer_id,
    SUM(total_amount) AS total_spent,
    RANK() OVER (ORDER BY SUM(total_amount) DESC) AS spend_rank,
    DENSE_RANK() OVER (ORDER BY SUM(total_amount) DESC) AS spend_dense_rank
FROM orders
GROUP BY customer_id;


SELECT
    customer_id,
    order_id,
    total_amount,
    LAG(total_amount, 1, 0) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS previous_order_total
FROM orders;


SELECT
    customer_id,
    order_id,
    total_amount,
    LEAD(total_amount, 1, NULL) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS next_order_total
FROM orders;


SELECT
    customer_id,
    order_id,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS order_number_for_customer
FROM orders;


SELECT
    customer_id,
    order_id,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date
    ) AS running_total
FROM orders;
