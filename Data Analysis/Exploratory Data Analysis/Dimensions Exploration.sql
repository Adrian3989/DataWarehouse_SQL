

/*
===============================================================================
Dimensions Exploration
===============================================================================
Purpose:
    - To explore the structure of dimension tables.
	
SQL Functions Used:
    - DISTINCT
    - ORDER BY
===============================================================================
*/

-- List of Distinct Countries
SELECT DISTINCT 
    country 
FROM gold.dim_customers
ORDER BY country;

-- List of DISTINCT Categories, Subcategories and products.
SELECT DISTINCT 
    category, 
    subcategory, 
    product_name 
FROM gold.dim_products
ORDER BY category, subcategory, product_name;
