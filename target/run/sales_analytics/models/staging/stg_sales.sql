

  create or replace view `sales-analytics-453721`.`sales_dataset`.`stg_sales`
  OPTIONS()
  as 

SELECT
    order_id,
    product_name,
    amount,
    country,
    order_date,
    
    CASE 
        WHEN DATE(order_date) >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH) THEN 'recent'
        ELSE 'historical'
    END AS partition_group
  -- Dynamic partitioning
FROM sales-analytics-453721.sales_dataset.raw_sales;

