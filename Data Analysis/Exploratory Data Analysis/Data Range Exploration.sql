/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

--Information of the first and last Order
SELECT MIN(order_date) first_order_date, MAX(order_date) AS last_order_date, DATEDIFF(year,MIN(order_date),MAX(order_date)) AS order_range_years FROM gold.fact_sales

--Find youngest and oldest Customer
SELECT DATEDIFF(YEAR,MIN(birthdate),GETDATE()) AS oldest_age, DATEDIFF(YEAR,MAX(birthdate),GETDATE()) AS youngest_age FROM gold.dim_customers
