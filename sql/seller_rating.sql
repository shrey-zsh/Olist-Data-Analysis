-- Seller Rating Vs Revenue
SELECT oi.seller_id, ROUND(AVG(orv.review_score),2) AS seller_rating, SUM(oi.price) AS revenue
                   FROM order_items AS oi
                   INNER JOIN order_reviews AS orv
                   ON oi.order_id = orv.order_id
                   GROUP BY oi.seller_id; 