USE zepto_inventory;

-- SECTION C: DISCOUNT STRATEGY & MARGIN
-- Scenario: the pricing team wants to know where discounts are costing the most money.
-- =======================================================================================

-- Q8. Which categories depend most on discounts?
SELECT category,
       ROUND(AVG(discount_percent), 2) AS avg_discount_pct,
       ROUND(SUM((mrp - discounted_selling_price) * available_quantity), 2) AS total_discount_given
FROM zepto
WHERE out_of_stock = 'FALSE'
GROUP BY category
ORDER BY total_discount_given DESC;

-- Q9. Which products have a discount above 40% and still hold a lot of stock?
SELECT DISTINCT name, discount_percent, available_quantity,
       ROUND((mrp - discounted_selling_price) * available_quantity, 2) AS discount_value
FROM zepto
WHERE discount_percent > 40
  AND out_of_stock = 'FALSE'
ORDER BY discount_value DESC
LIMIT 15;

-- Q10. Which in-stock products have no discount but a lot of stock?
SELECT DISTINCT name, mrp, available_quantity
FROM zepto
WHERE discount_percent = 0
  AND out_of_stock = 'FALSE'
ORDER BY available_quantity DESC
LIMIT 15;

-- Q11. Which expensive products (MRP above Rs 500) have a discount below 10%?
SELECT DISTINCT name, mrp, discount_percent, out_of_stock
FROM zepto
WHERE mrp > 500
  AND discount_percent < 10
ORDER BY mrp DESC;
