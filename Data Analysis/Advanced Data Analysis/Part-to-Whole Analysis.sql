/*
===============================================================================
Part-to-Whole Analysis
===============================================================================
Purpose:
    - To compare performance or metrics across dimensions or time periods.
    - To evaluate differences between categories.
    - Useful for A/B testing or regional comparisons.

SQL Functions Used:
    - SUM(), AVG(): Aggregates values for comparison.
    - Window Functions: SUM() OVER() for total calculations.
===============================================================================
*/

--Which categories contribute most to overall sales?
WITH temporary_CTE AS (
SELECT p.category, SUM(sales_amount) AS sales FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON s.product_key=p.product_key
GROUP BY p.category)
SELECT
category,
sales,
SUM(sales) OVER() AS Total_sales,
CONCAT(ROUND((CAST(sales AS FLOAT)/SUM(sales) OVER()) *100,2),'%') AS percentage_of_total
FROM temporary_CTE
ORDER BY sales DESC