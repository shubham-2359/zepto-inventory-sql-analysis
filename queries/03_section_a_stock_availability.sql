USE zepto_inventory;

-- SECTION A: STOCK AVAILABILITY
-- Scenario: The supply team wants to know where products are missing from the shelves.
-- ========================================================================================

-- Q1. Which categories have the highest stockout percentage?
SELECT category,
       COUNT(*) AS total_products,
       SUM(out_of_stock = 'TRUE') AS out_of_stock_count,
       ROUND(100 * SUM(out_of_stock = 'TRUE') / COUNT(*), 2) AS stockout_pct
FROM zepto
GROUP BY category
ORDER BY stockout_pct DESC;

-- Q2. Which high-priced products are out of stock? (restock priority)
SELECT DISTINCT name, mrp, discounted_selling_price
FROM zepto
WHERE out_of_stock = 'TRUE'
ORDER BY mrp DESC
LIMIT 10;

-- Q3. Which in-stock products are almost finished?
SELECT DISTINCT name, available_quantity, discounted_selling_price
FROM zepto
WHERE out_of_stock = 'FALSE'
  AND available_quantity <= 1
ORDER BY available_quantity ASC;

-- Q4. Do products with higher discounts go out of stock less often?
SELECT CASE
         WHEN discount_percent < 10 THEN '0-10%'
         WHEN discount_percent < 25 THEN '10-25%'
         WHEN discount_percent < 40 THEN '25-40%'
         ELSE '40%+'
       END AS discount_band,
       COUNT(*) AS total_products,
       ROUND(100 * SUM(out_of_stock = 'TRUE') / COUNT(*), 2) AS stockout_pct
FROM zepto
GROUP BY discount_band
ORDER BY MIN(discount_percent);
