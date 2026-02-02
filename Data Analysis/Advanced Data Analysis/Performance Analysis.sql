/*
===============================================================================
Performance Analysis (Year-over-Year, Month-over-Month)
===============================================================================
Purpose:
    - To measure the performance of products, customers, or regions over time.
    - For benchmarking and identifying high-performing entities.
    - To track yearly trends and growth.

SQL Functions Used:
    - LAG(): Accesses data from previous rows.
    - AVG() OVER(): Computes average values within partitions.
    - CASE: Defines conditional logic for trend analysis.
===============================================================================
*/

/* Analyze the yearly performance of products by comparing their sales
SELECT 
years,
product_name,
current_sales,
AVG(current_sales) OVER(PARTITION BY product_name) AS avg_sales,
current_sales-AVG(current_sales) OVER(PARTITION BY product_name) AS diff_avg,
CASE
	WHEN current_sales-AVG(current_sales) OVER(PARTITION BY product_name)>0 THEN 'Above Average'
	WHEN current_sales-AVG(current_sales) OVER(PARTITION BY product_name)<0 THEN 'Below Average'
	ELSE 'Average'
END AS avg_comparison,
--Year over year Analysis
LAG(current_sales) OVER(PARTITION BY product_name ORDER BY years) AS previous_year_sales,
current_sales-LAG(current_sales) OVER(PARTITION BY product_name ORDER BY years) AS diff_previous_year,
CASE
	WHEN current_sales-LAG(current_sales) OVER(PARTITION BY product_name ORDER BY years)>0 THEN 'Increase'
	WHEN current_sales-LAG(current_sales) OVER(PARTITION BY product_name ORDER BY years)<0 THEN 'Decrease'
	ELSE 'Equal'
END AS previous_year_comparison
FROM(
SELECT
YEAR(s.order_date) AS years,
p.product_name,
SUM(s.sales_amount) AS current_sales
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON p.product_key=s.product_key
WHERE s.order_date IS NOT NULL
GROUP BY YEAR(s.order_date),p.product_name
)t
ORDER BY product_name,years