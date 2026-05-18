-- =========================================
-- DATA CLEANING & DATA QUALITY CHECKS
-- =========================================

-- Total number of rows

SELECT COUNT(*)
FROM supply_chain_data;

-- Column names inspection

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'supply_chain_data';

-- NULL analysis

SELECT
    COUNT(*) AS total_rows,

    COUNT("Type") AS type_not_null,
    COUNT("Order Id") AS order_id_not_null,
    COUNT("order date (DateOrders)") AS order_date_not_null,
    COUNT("Sales") AS sales_not_null,
    COUNT("Order Profit Per Order") AS profit_not_null

FROM supply_chain_data;

-- Duplicate check

SELECT
    "Order Id",
    COUNT(*)

FROM supply_chain_data

GROUP BY "Order Id"

HAVING COUNT(*) > 1

ORDER BY COUNT(*) DESC;