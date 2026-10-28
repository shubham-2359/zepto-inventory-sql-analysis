# 🛒 Zepto Inventory Analysis Using SQL

A practical SQL project focused on analyzing Zepto’s product inventory, pricing, discounts, and stock availability using MySQL. <br>
It transforms raw product data into meaningful business insights to support inventory planning, pricing decisions, and warehouse efficiency.

The project demonstrates hands-on skills in database design, data import, data exploration, data cleaning, and SQL-based business analysis.
It also highlights how SQL can be used to investigate real-world retail and e-commerce problems.

--- 

## 🎯 Project Objective

The primary objective of this project is to analyze Zepto's inventory dataset using MySQL and answer business questions related to stock availability, inventory 
value, discount strategy, pricing, delivery efficiency, and product performance.

The project demonstrates how SQL can be used to:

- Identify stockout patterns and products requiring replenishment.
- Evaluate inventory value across product categories.
- Analyze discount strategies and their potential financial impact.
- Compare product price tiers and value per gram.
- Identify high-value product listings and apply Pareto analysis to inventory value.

This project showcases practical skills in database design, data cleaning, exploratory data analysis (EDA), and business problem-solving.

---

## 📁 Repository Structure

```
zepto-inventory-sql-analysis/
│
├── README.md
│
├── schema/
│   └── 01_create_database_and_table.sql
│
├── queries/
│   ├── 02_data_exploration_and_cleaning.sql
│   ├── 03_section_a_stock_availability.sql
│   ├── 04_section_b_inventory_value.sql
│   ├── 05_section_c_discount_strategy.sql
│   ├── 06_section_d_pricing_and_delivery.sql
│   └── 07_section_e_product_performance.sql
│
├── output_screenshots/
│   ├── section_a_q01
│   ├── section_b_q05
│   ├── section_c_q08
│   ├── section_d_12
│   └── section_e_14
│
├── zepto_sql_business_questions.pdf
│
├── zepto_inventory_dataset.csv
│
└── key_insights_and_recommendations.pdf
```
---

## 🗂 Dataset Overview

📌 Data Source: The dataset used in this project is the [Zepto Inventory Dataset]( https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset) from Kaggle. 

It contains product-level inventory data, including category, name, MRP, discount percentage, available quantity, discounted selling price, weight, 
stock status and pack quantity.

### Dataset Summary

| Dataset Metric | Details |
|---|---|
| Original CSV Records | 3,732 |
| Records Used for Analysis | 3,727 |
| Product Categories | 14 |
| Original CSV Columns | 9 |
| SQL Table Columns | 10 (including the `sku_id` primary key) |

### Key Data Fields

| Column Name | Description |
|---|---|
| `sku_id` | Unique identifier for each listing in the SQL table. |
| `category` | Product category. |
| `name` | Product name. |
| `mrp` | Maximum retail price in ₹. |
| `discount_percent` | Discount percentage applied to the product. |
| `available_quantity` | Number of units currently available in stock. |
| `discounted_selling_price` | Product selling price after discount, in ₹. |
| `weight_in_gms` | Product or pack weight in grams. |
| `out_of_stock` | Stock availability flag (`TRUE` or `FALSE`). |
| `quantity` | Pack quantity associated with the product listing. |
<br>

**Important dataset limitation:** The dataset does not contain actual sales or cost data. 
Therefore, inventory value is calculated as selling price × available quantity, while potential revenue is an estimate based on the same formula. 
Neither measure represents actual sales revenue or profit.

---

## 💼 Business Problems

This project addresses 15 business questions organized into five analytical sections. 
Each section focuses on a practical inventory, pricing, or product management challenge.

For the complete list of questions and their business purposes, refer to the [Zepto SQL Business Questions](zepto_sql_business_questions.pdf) (PDF).

### 📦 Section A: Stock Availability
**Scenario:** The supply team wants to identify products that are frequently out of stock and determine where inventory replenishment may be needed.

### 💰 Section B: Inventory Value & Warehouse Efficiency
**Scenario:** The finance and warehouse teams want to understand how inventory value is distributed across categories and identify products with high stock levels 
but relatively low inventory value.

### 🏷️ Section C: Discount Strategy & Margin
**Scenario:** The pricing team wants to analyze discount patterns, identify heavily discounted products with high stock levels, and determine which categories 
have the largest total discount value.

### 🚚 Section D: Pricing & Delivery Efficiency
**Scenario:** The category and logistics teams want to understand stockout patterns across different price ranges and identify heavy products with low value per 
gram.

### 📈 Section E: Product Performance (Advanced Analysis)
**Scenario:** The management team wants to identify products with the highest potential revenue and determine which categories contribute the most to total 
inventory value.

---

## 🛠️ Tools Used

- **MySQL 8.0+:**  Database creation, data cleaning, exploratory analysis, and business queries.
- **MySQL Workbench:**  Database management, SQL query execution, and CSV data import.
- **Git & GitHub:**  Version control, project documentation, and portfolio presentation.

---

## ⚙️ Project Workflow

### 🗄️ A. Database & Schema Design

Created a MySQL database and a `zepto` table to store inventory data in a structured format.

The table contains 10 columns, including a unique `sku_id` primary key and nine inventory-related fields. <br>
Appropriate data types were selected for identifiers, product names, categories, prices, discounts, quantities, weights, and stock status.

The schema was designed to support product-level analysis, inventory calculations, and category-wise comparisons.

### 📥 B. Data Import Using MySQL Workbench

Imported the supplied CSV dataset into the previously created `zepto` table using MySQL Workbench.

**Steps followed:**

1. Connected to the MySQL server using MySQL Workbench.
2. Executed the database and table creation script located in [schema/01_create_database_and_table.sql](schema/01_create_database_and_table.sql).
3. Verified that the target `zepto` table existed.
4. Right-clicked the target table and selected **Table Data Import Wizard**.
5. Selected `zepto_inventory_dataset.csv` from the root directory of the project.
6. Chose the existing `zepto` table as the destination.
7. Mapped the CSV columns to the corresponding table columns.
8. Configured `sku_id` to be generated automatically if the table uses an `AUTO_INCREMENT` primary key.
9. Reviewed the column mapping and completed the import.
10. Verified the imported records using SQL queries.

### 🔎 C. Exploratory Data Analysis (EDA)

Performed initial SQL queries to understand the dataset's structure, distribution, and data quality before conducting business analysis.

The exploratory analysis included:

1. **Record Count:** Counted the total number of records in the table.
2. **Schema Inspection:** Reviewed column names, data types, and table structure.
3. **Category Analysis:** Identified unique product categories.
4. **Category-Wise Distribution:** Counted product listings within each category.
5. **Stock Availability:** Compared in-stock and out-of-stock products.
6. **Repeated Product Analysis:** Identified product names associated with multiple SKUs and ranked them by frequency.
7. **Descriptive Statistics:** Calculated minimum, maximum, and average values for key numerical columns, including prices, discounts, quantities, and weights.
8. **Missing-Value Checks:** Checked for `NULL` values and incomplete records across relevant columns.

These checks helped establish an initial understanding of the dataset and identify issues requiring further investigation.

### 🧹 D. Data Cleaning & Validation

The dataset was reviewed and cleaned to improve consistency and reliability before business analysis.

- **Invalid Pricing:** Identified records containing zero or invalid price values and removed them where appropriate.
- **Price Standardization:** Converted price values from paise to rupees where required.
- **Text Standardization:** Removed unnecessary leading and trailing spaces from product names and categories.
- **Missing Values:** Checked important columns for NULL values and evaluated incomplete records.
- **Data Validation:** Reviewed stock status, quantities, discount percentages, and pricing consistency.
- **Post-Cleaning Verification:** Rechecked the row count and key columns to validate the cleaned dataset.
  
---

## 💡 Key Business Questions Answered

The following SQL queries demonstrate selected analyses from the project. All 15 business questions are organized by section in the [`queries/`](queries/) folder.

### 1. Which categories have the highest stockout percentage?

**Business purpose:** Identify categories with the greatest stock availability challenges and prioritize replenishment.

```sql
SELECT
    category,
    COUNT(*) AS total_products,
    SUM(out_of_stock = 'TRUE') AS out_of_stock_count,
    ROUND(
        100.0 * SUM(out_of_stock = 'TRUE') / COUNT(*),
        2
    ) AS stockout_pct
FROM zepto
GROUP BY category
ORDER BY stockout_pct DESC;
```

This analysis helps identify categories where stock availability needs attention.

### 2. Which categories hold the most inventory value?

**Business purpose:** Determine which categories account for the largest value of currently available inventory.

```sql
SELECT
    category,
    ROUND(
        SUM(discounted_selling_price * available_quantity),
        2
    ) AS inventory_value
FROM zepto
WHERE out_of_stock = 'FALSE'
GROUP BY category
ORDER BY inventory_value DESC;
```

This helps the business prioritize inventory monitoring based on the value of available stock.

### 3. Which products have a discount above 40% and still hold a lot of stock?

**Business purpose:** Identify heavily discounted products with remaining inventory and evaluate the discount amount associated with those units.

```sql
SELECT DISTINCT
    name,
    discount_percent,
    available_quantity,
    ROUND(
        (mrp - discounted_selling_price) * available_quantity,
        2
    ) AS discount_amount
FROM zepto
WHERE discount_percent > 40
  AND out_of_stock = 'FALSE'
ORDER BY discount_amount DESC
LIMIT 15;
```

This helps flag products for pricing review. The calculated discount amount is not actual profit loss because the dataset does not contain product costs or sales 
data.

### 4. How are products distributed across price tiers?

**Business purpose:** Compare product counts, stock quantities, and stockout rates across Low, Mid, and Premium price tiers.

```sql
SELECT
    CASE
        WHEN discounted_selling_price < 100 THEN 'Low'
        WHEN discounted_selling_price < 500 THEN 'Mid'
        ELSE 'Premium'
    END AS price_tier,
    COUNT(*) AS total_products,
    SUM(available_quantity) AS total_stock,
    ROUND(
        100.0 * SUM(out_of_stock = 'TRUE') / COUNT(*),
        2
    ) AS stockout_pct
FROM zepto
GROUP BY price_tier
ORDER BY MIN(discounted_selling_price);
```

This analysis highlights differences in stock availability across product price segments.

### 5. What are the top three products by potential revenue in each category?

**Business purpose:** Identify product listings with the highest estimated value based on selling price and available stock.

```sql
WITH products AS (
    SELECT DISTINCT
        category,
        name,
        discounted_selling_price,
        available_quantity
    FROM zepto
    WHERE out_of_stock = 'FALSE'
),
ranked AS (
    SELECT
        category,
        name,
        ROUND(
            discounted_selling_price * available_quantity,
            2
        ) AS potential_revenue,
        DENSE_RANK() OVER (
            PARTITION BY category
            ORDER BY
                discounted_selling_price * available_quantity DESC
        ) AS product_rank
    FROM products
)
SELECT
    category,
    name,
    potential_revenue,
    product_rank
FROM ranked
WHERE product_rank <= 3
ORDER BY category, product_rank;
```

This query uses a common table expression (CTE) and a window function to rank products within each category.

**Note:** Potential revenue is an estimate based on available stock, not actual sales revenue. Because `DENSE_RANK()` includes ties, a category may return more 
than three products.

---

## 🔍 Key Insights

The following findings are drawn from the project's key_insights_and_recommendations pdf file.

For the complete findings, supporting details and limitations, refer to the [Key Insights and Recommendations](key_insights_and_recommendations.pdf) (PDF).

### 1. Stock Availability Varies by Price Tier

Products priced below ₹100 have a stockout rate of **17.84%**, compared with 6.96% for products priced between ₹100 and ₹500 and 1.79% for products priced at ₹500 
or above.

### 2. Biscuits Has the Highest Stockout Rate

Biscuits records a stockout rate of **28.57%**, followed by Dairy, Bread & Batter and Beverages at 21.71% each. These categories may require closer replenishment 
monitoring.

### 3. Inventory Value Is Concentrated in a Few Categories

Cooking Essentials and Munchies each account for approximately **₹3.37 lakh** in available inventory value. Together, they represent around 30% of the total 
inventory value reported in the analysis.

### 4. A Few Products Account for a Large Share of Discount Value

Among the top 15 heavily discounted products, Borges Extra Light Olive Oil accounts for approximately **₹7,206 out of ₹18,780** in total discount value.

### 5. Heavy, Low-Value Products Present Delivery Challenges

Salt, onions, potatoes, and atta have relatively low selling value per gram among heavy products. Their low value relative to weight may create challenges for 
delivery economics.

---

## 🚀  Business Recommendations

Based on the inventory patterns identified in this analysis, the following recommendations could help improve inventory planning, pricing decisions, and delivery 
efficiency. These are suggested actions derived from the available dataset and should be validated using actual sales, cost, and operational data before 
implementation.

### 1. Prioritize Replenishment for High-Stockout Categories

Review replenishment requirements for Biscuits, Dairy, Bread & Batter, and Beverages. Set suitable safety-stock levels using stockout patterns, historical demand, 
and supplier lead times.

### 2. Introduce Low-Stock Alerts

Flag products when only one or two units remain, prioritizing critical and higher-priced products. Refine reorder thresholds using actual sales velocity and 
supplier lead times.

### 3. Monitor High-Value Inventory Categories

Review Cooking Essentials and Munchies regularly because they account for a substantial share of available inventory value. Prioritize inventory planning 
according to product importance, demand, and stock levels.

### 4. Review Discounting by Monetary Impact

Evaluate the total discount amount in rupees rather than focusing only on discount percentages. Consider targeted or time-limited promotions for selected products 
and assess their impact using actual sales and cost data.

### 5. Improve Delivery Economics for Heavy Products

Evaluate product bundles, minimum order values, or delivery fees where commercially appropriate for heavy, low-value staples. Validate these options against 
delivery costs and customer behavior before implementation.

---

## 🔮 Future Improvements

- **Sales and Cost Integration:** Incorporate transaction-level sales and product costs to analyze actual revenue, gross margin, and profitability.
- **Inventory Dashboard:** Connect SQL outputs to Power BI or Tableau to visualize stockout rates, inventory value, discounts, and category performance.
- **Demand-Based Replenishment:** Use historical sales and supplier lead times to estimate reorder points and safety-stock requirements.

---

## 👨‍💻 Author

👤 Shubham Maurya

I created this project to strengthen my SQL skills and demonstrate how structured data analysis can support practical inventory and retail business decisions.

Skills demonstrated: MySQL | SQL Queries | Data Cleaning | Exploratory Data Analysis | Inventory Analysis | Business Insights
<p>
  <a href="https://www.linkedin.com/in/shubham-maurya-a53b57c59/">
    <img src="https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn Profile"/>
  </a>
</p>

---

<p align="center">
  <em>⭐ If you find this project useful, feel free to explore the SQL scripts and analysis documentation in this repository.⭐</em>
</p>
