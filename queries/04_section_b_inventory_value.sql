USE zepto_inventory;

-- SECTION B: INVENTORY VALUE & WAREHOUSE EFFICIENCY
-- Scenario: the finance and warehouse teams want to know where money and space are tied up.
-- ===========================================================================================

-- Q5. Which categories hold the most inventory value?
SELECT category,
       ROUND(SUM(discounted_selling_price * available_quantity), 2) AS inventory_value
FROM zepto
WHERE out_of_stock = 'FALSE'
GROUP BY category
ORDER BY inventory_value DESC;

-- Q6. Which in-stock products have a very large stock but a low price?
SELECT DISTINCT name, available_quantity, discounted_selling_price
FROM zepto
WHERE out_of_stock = 'FALSE'
ORDER BY available_quantity DESC, discounted_selling_price ASC
LIMIT 15;

-- Q7. How many products are unavailable in each category, and what is their listed value?
SELECT category,
       COUNT(*) AS out_of_stock_products,
       ROUND(SUM(discounted_selling_price), 2) AS unavailable_listing_value
FROM zepto
WHERE out_of_stock = 'TRUE'
GROUP BY category
ORDER BY unavailable_listing_value DESC;
