USE zepto_inventory;

-- DATA EXPLORATION --
-- Total rows 
SELECT COUNT(*) AS total_rows FROM zepto;

-- See the data
SELECT * FROM zepto LIMIT 10;

-- Column names and data types
DESCRIBE zepto;

-- Unique categories
SELECT DISTINCT category FROM zepto ORDER BY category;

-- Products per category
SELECT category, COUNT(*) AS total_products
FROM zepto
GROUP BY category
ORDER BY total_products DESC;

-- In stock vs out of stock
SELECT out_of_stock, COUNT(*) AS products
FROM zepto
GROUP BY out_of_stock;

-- Products with multiple SKUs, sorted by highest count
SELECT name, count(sku_id)
FROM zepto
GROUP BY name
HAVING count(sku_id) > 1
ORDER BY count(sku_id) desc;

-- Min, max, average of key columns
SELECT MIN(mrp) AS min_mrp, MAX(mrp) AS max_mrp, ROUND(AVG(mrp), 2) AS avg_mrp,
       MIN(discount_percent) AS min_disc, MAX(discount_percent) AS max_disc,
       MIN(available_quantity) AS min_qty, MAX(available_quantity) AS max_qty
FROM zepto;

-- NULL / missing values
SELECT * FROM zepto
WHERE category IS NULL OR name IS NULL OR mrp IS NULL
   OR discount_percent IS NULL OR available_quantity IS NULL
   OR discounted_selling_price IS NULL OR weight_in_gms IS NULL
   OR out_of_stock IS NULL OR quantity IS NULL;
 
 -- DATA CLEANING
-- Invalid values: check first, then delete
SELECT * FROM zepto WHERE mrp = 0 OR discounted_selling_price = 0;
SELECT * FROM zepto WHERE discounted_selling_price > mrp;
SELECT * FROM zepto WHERE discount_percent < 0 OR discount_percent > 100;

DELETE FROM zepto WHERE mrp = 0 OR discounted_selling_price = 0;

-- Convert price from paise to rupees
SELECT name, mrp, discounted_selling_price FROM zepto LIMIT 10;

UPDATE zepto
SET mrp = mrp / 100,
    discounted_selling_price = discounted_selling_price / 100;
    
-- Extra spaces in text columns
UPDATE zepto
SET category = TRIM(category),
    name     = TRIM(name);
