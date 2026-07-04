WITH order_value AS (SELECT order_id,SUM(payment_value) AS payment
                                          FROM order_payments
                                          GROUP BY order_id) 
        SELECT c.customer_unique_id AS customer, COUNT(o.order_id) AS frequency, SUM(ov.payment) AS monetary_value,
               MAX(o.order_purchase_timestamp) AS last_order_date
                    FROM orders AS o
                    INNER JOIN order_value AS ov
                    ON o.order_id = ov.order_id
                    INNER JOIN customers AS c
                    ON o.customer_id = c.customer_id
                    WHERE o.order_status != 'canceled'
                    GROUP BY c.customer_unique_id; 