USE zepto_inventory;

-- SECTION E: PRODUCT PERFORMANCE (ADVANCED LEVEL)
-- Scenario: the management team wants to know which products and categories matter the most.
-- ===================================================================================================

-- Q14. What are the top 3 products by estimated revenue in each category?
-- The first CTE removes duplicate listings, the second ranks the products.
WITH products AS (
    SELECT DISTINCT category, name, discounted_selling_price, available_quantity
    FROM zepto
    WHERE out_of_stock = 'FALSE'
),
ranked AS (
    SELECT category, name,
           ROUND(discounted_selling_price * available_quantity, 2) AS est_revenue,
           DENSE_RANK() OVER (PARTITION BY category
                              ORDER BY discounted_selling_price * available_quantity DESC) AS rnk
    FROM products
)
SELECT category, name, est_revenue, rnk
FROM ranked
WHERE rnk <= 3
ORDER BY category, rnk;
 
-- Q15. Which categories together make up 80% of the total inventory value? (Pareto)
WITH category_value AS (
    SELECT category,
           SUM(discounted_selling_price * available_quantity) AS total_value
    FROM zepto
    WHERE out_of_stock = 'FALSE'
    GROUP BY category
)
SELECT category,
       ROUND(total_value, 2) AS total_value,
       ROUND(100 * SUM(total_value) OVER (ORDER BY total_value DESC)
             / SUM(total_value) OVER (), 2) AS cumulative_pct
FROM category_value
ORDER BY total_value ASC;
