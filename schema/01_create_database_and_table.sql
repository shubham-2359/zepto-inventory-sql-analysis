CREATE DATABASE zepto_inventory;
USE zepto_inventory;

CREATE TABLE zepto(
    sku_id                    INT AUTO_INCREMENT PRIMARY KEY,
    category                  VARCHAR(120),
    name                      VARCHAR(150) NOT NULL,
    mrp                       DECIMAL(8,2),
    discount_percent          DECIMAL(5,2),
    available_quantity        INT,
    discounted_selling_price  DECIMAL(8,2),
    weight_in_gms             INT,
    out_of_stock              VARCHAR(5),
    quantity                  INT
);
