SELECT orv.review_score, o.order_delivered_customer_date AS dd,o.order_estimated_delivery_date AS edt
        FROM orders AS o
        INNER JOIN order_reviews AS orv
        ON o.order_id = orv.order_id
        WHERE o.order_status = 'delivered';