WITH product_catt AS (SELECT product_id, product_category_name_english AS product_category
                                            FROM products AS p
                                            INNER JOIN product_category_name_translation AS pct
                                            ON p.product_category_name = pct.product_category_name)
                        SELECT pc.product_category, ROUND(AVG(orv.review_score),2) AS rating , COUNT(DISTINCT oi.order_id) AS orders
                        FROM order_items as oi
                        INNER JOIN order_reviews AS orv
                        ON oi.order_id = orv.order_id
                        INNER JOIN product_catt AS pc
                        ON oi.product_id = pc.product_id
                        GROUP BY pc.product_category
                        HAVING COUNT(DISTINCT oi.order_id) >= 30
                        ORDER BY rating DESC;