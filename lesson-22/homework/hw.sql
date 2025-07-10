1) SELECT 
    customer_id,
    customer_name,
    order_date,
    total_amount,
    SUM(total_amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS running_total
FROM sales_data;
2) SELECT 
    product_category,
    COUNT(*) AS number_of_orders
FROM sales_data
GROUP BY product_category;
3) SELECT 
    product_category,
    MAX(total_amount) AS max_total_amount
FROM sales_data
GROUP BY product_category;
4) SELECT 
    product_category,
    MIN(unit_price) AS min_unit_price
FROM sales_data
GROUP BY product_category;
5) SELECT 
    order_date,
    customer_id,
    total_amount,
    AVG(total_amount) OVER (
        ORDER BY order_date 
        ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
    ) AS moving_avg_3_day
FROM sales_data;
6) SELECT 
    region,
    SUM(total_amount) AS total_sales
FROM sales_data
GROUP BY region;
7) SELECT 
    customer_id,
    customer_name,
    SUM(total_amount) AS total_purchase,
    RANK() OVER (ORDER BY SUM(total_amount) DESC) AS customer_rank
FROM sales_data
GROUP BY customer_id, customer_name;
8) SELECT 
    customer_id,
    customer_name,
    order_date,
    total_amount,
    total_amount - LAG(total_amount) OVER (
        PARTITION BY customer_id ORDER BY order_date
    ) AS amount_difference
FROM sales_data;
9) SELECT *
FROM (
    SELECT 
        product_category,
        product_name,
        unit_price,
        RANK() OVER (
            PARTITION BY product_category ORDER BY unit_price DESC
        ) AS rank_within_category
    FROM sales_data
) AS ranked_products
WHERE rank_within_category <= 3;
10) SELECT 
    region,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY region ORDER BY order_date
    ) AS cumulative_sales
FROM sales_data;
11) SELECT 
    product_category,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY product_category 
        ORDER BY order_date
    ) AS cumulative_revenue
FROM sales_data
ORDER BY product_category, order_date;
12) SELECT 
    product_category,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY product_category 
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
    ) AS sum_of_previous_values
FROM sales_data
ORDER BY product_category, order_date;
13) SELECT 
    value,
    SUM(value) OVER (
        ORDER BY value 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM OneColumn;
14) SELECT 
    customer_id,
    customer_name,
    COUNT(DISTINCT product_category) AS category_count
FROM sales_data
GROUP BY customer_id, customer_name
HAVING COUNT(DISTINCT product_category) > 1;
15) SELECT 
    customer_id,
    customer_name,
    region,
    SUM(total_amount) AS customer_total,
    AVG(SUM(total_amount)) OVER (PARTITION BY region) AS regional_avg
FROM sales_data
GROUP BY customer_id, customer_name, region
HAVING SUM(total_amount) > AVG(SUM(total_amount)) OVER (PARTITION BY region);
16) SELECT 
    region,
    customer_id,
    customer_name,
    SUM(total_amount) AS total_spent,
    RANK() OVER (
        PARTITION BY region 
        ORDER BY SUM(total_amount) DESC
    ) AS rank_in_region
FROM sales_data
GROUP BY region, customer_id, customer_name;
17) SELECT 
    customer_id,
    customer_name,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date
    ) AS cumulative_sales
FROM sales_data
ORDER BY customer_id, order_date;
18) WITH monthly_sales AS (
    SELECT 
        DATE_TRUNC('month', order_date) AS month,
        SUM(total_amount) AS monthly_total
    FROM sales_data
    GROUP BY DATE_TRUNC('month', order_date)
)
SELECT 
    month,
    monthly_total,
    LAG(monthly_total) OVER (ORDER BY month) AS previous_month_total,
    ROUND(
        (monthly_total - LAG(monthly_total) OVER (ORDER BY month)) * 100.0
        / NULLIF(LAG(monthly_total) OVER (ORDER BY month), 0),
        2
    ) AS growth_rate_percentage
FROM monthly_sales;
19) SELECT 
    customer_id,
    customer_name,
    order_date,
    total_amount,
    LAG(total_amount) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date
    ) AS previous_order_amount
FROM sales_data
WHERE total_amount > LAG(total_amount) OVER (
    PARTITION BY customer_id 
    ORDER BY order_date
);
20) 
