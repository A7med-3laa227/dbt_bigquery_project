SELECT
    country,
    product_name,
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_revenue,
    
    CASE 
        WHEN DATE(order_date) >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH) THEN 'recent'
        ELSE 'historical'
    END AS partition_group
 
FROM `sales-analytics-453721`.`sales_dataset`.`stg_sales`
GROUP BY 1, 2, 5