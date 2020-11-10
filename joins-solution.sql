-- 1. Get all customers and their addresses.
SELECT "customers".first_name, "customers".last_name, "addresses".street, 
"addresses".city, "addresses".state, "addresses".zip
FROM "customers", "addresses"
WHERE "customers".id = "addresses".customer_id
GROUP BY "customers".id, "addresses".customer_id, "addresses".street, "addresses".city, "addresses".state, "addresses".zip
ORDER BY "customers".last_name asc;

-- 2. Get all orders and their line items (orders, quantity, and product).
SELECT "orders".id as "order_id", "line_items".quantity, "products".description
FROM "orders", "line_items", "products"
WHERE "orders".id = "line_items".order_id AND "line_items".product_id = "products".id
GROUP BY "orders".id, "line_items".quantity, "products".description
ORDER BY "orders".id;

-- 3. Which warehouses have cheetos?
SELECT "warehouse".warehouse 
FROM "warehouse", "warehouse_product"
WHERE "warehouse".id = "warehouse_product".warehouse_id AND "warehouse_product".product_id = 5;

-- 4. Which warehouses have diet pepsi?
SELECT "warehouse".warehouse 
FROM "warehouse", "warehouse_product"
WHERE "warehouse".id = "warehouse_product".warehouse_id AND "warehouse_product".product_id = 6;

-- 5. Get the number of orders for each customer. 
--    NOTE: It is okay if those without orders are not included in the results.
-- I have no clue.

-- 6. How many customers do we have?
SELECT count(*)
FROM "customers";

-- 7. How many products do we carry?
SELECT count(*)
FROM "products";

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand)
FROM "warehouse_product"
WHERE product_id = 6;

