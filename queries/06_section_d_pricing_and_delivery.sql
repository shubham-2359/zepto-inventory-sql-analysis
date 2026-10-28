USE zepto_inventory;

-- SECTION D: PRICING & DELIVERY EFFICIENCY
-- Scenario: the category and logistics teams want to understand price levels and the cost of handling heavy items.
-- ====================================================================================================================

-- Q12. How are products spread across price tiers (Low / Mid / Premium)?
SELECT CASE
         WHEN discounted_selling_price < 100 THEN 'Low'
         WHEN discounted_selling_price < 500 THEN 'Mid'
         ELSE 'Premium'
       END AS price_tier,
       COUNT(*) AS total_products,
       SUM(available_quantity) AS total_stock,
       ROUND(100 * SUM(out_of_stock = 'TRUE') / COUNT(*), 2) AS stockout_pct
FROM zepto
GROUP BY price_tier
ORDER BY MIN(discounted_selling_price);

-- Q13. Which heavy products give the lowest value per gram?
SELECT DISTINCT name, weight_in_gms, discounted_selling_price,
       ROUND(discounted_selling_price / weight_in_gms, 4) AS price_per_gram
FROM zepto
WHERE weight_in_gms >= 1000
ORDER BY price_per_gram ASC
LIMIT 15;
