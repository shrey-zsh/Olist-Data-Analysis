-- Product Category Revenue
WITH product_catt AS (SELECT product_id, product_category_name_english AS product_category
            FROM products AS p
            INNER JOIN product_category_name_translation AS pct
            ON p.product_category_name = pct.product_category_name)

            SELECT pc.product_category, SUM(o.price) AS revenue 
            FROM order_items AS o
            
            INNER JOIN product_catt AS pc
            ON o.product_id = pc.product_id
            GROUP BY pc.product_category
            ORDER BY revenue DESC;

-- Monthly Revenue 
WITH order_value AS (SELECT order_id,SUM(payment_value) AS payment
                                          FROM order_payments
                                          GROUP BY order_id) 
                    SELECT TO_CHAR(o.order_purchase_timestamp, 'YYYY-MM') AS purchase_date, SUM(ov.payment) AS revenue
                    FROM orders AS o
                    INNER JOIN order_value AS ov
                    ON o.order_id = ov.order_id
                    WHERE o.order_status != 'canceled'
                    GROUP BY TO_CHAR(o.order_purchase_timestamp, 'YYYY-MM')
                    ORDER BY purchase_date ASC;           