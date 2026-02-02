/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

--Total Sales
SELECT SUM(sales_amount) AS total_sales FROM gold.fact_sales

--Sold Items
SELECT SUM(quantity) AS total_quantity FROM gold.fact_sales;

--Average Selling Price
SELECT AVG(price) AS avg_price FROM gold.fact_sales;

--Total n° of Orders
SELECT COUNT(order_number) AS total_orders FROM gold.fact_sales;
SELECT COUNT(DISTINCT order_number) AS real_total_orders FROM gold.fact_sales;

--Total n° of products
SELECT COUNT(product_number) AS total_products FROM gold.dim_products;
SELECT COUNT(DISTINCT product_number) AS total_products FROM gold.dim_products; --They're are the same

--Total n° of customers
SELECT COUNT(DISTINCT customer_key) FROM gold.dim_customers;

--Number of Customers that have placed an order
SELECT COUNT(DISTINCT customer_key) FROM gold.fact_sales;

--Report with all the key metrics of the business
SELECT 'Total Sales' as measure_name,SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity' as measure_name,SUM(quantity) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Average Price' as measure_name,AVG(price) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total N° of Orders' as measure_name,COUNT(DISTINCT order_number) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total N° of Products' as measure_name,COUNT(DISTINCT product_number) AS measure_value FROM gold.dim_products
UNION ALL
SELECT 'Total N° of Customers' as measure_name,COUNT(DISTINCT customer_key) AS measure_value FROM gold.dim_customers 

