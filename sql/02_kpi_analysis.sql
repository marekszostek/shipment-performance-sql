-- =========================================
-- KPI ANALYSIS
-- =========================================

-- Overall business KPIs

SELECT
    ROUND(SUM("Sales")::numeric, 2) AS total_sales,

    ROUND(AVG("Sales")::numeric, 2) AS average_sales,

    ROUND(SUM("Order Profit Per Order")::numeric, 2) AS total_profit,

    COUNT(DISTINCT "Order Id") AS total_orders

FROM supply_chain_data;

-- Revenue by region

SELECT
    "Order Region",

    ROUND(SUM("Sales")::numeric, 2) AS revenue,

    COUNT(DISTINCT "Order Id") AS total_orders

FROM supply_chain_data

GROUP BY "Order Region"

ORDER BY revenue DESC;

-- Top product categories by profit

SELECT
    "Category Name",

    ROUND(SUM("Order Profit Per Order")::numeric, 2) AS total_profit,

    ROUND(SUM("Sales")::numeric, 2) AS total_sales

FROM supply_chain_data

GROUP BY "Category Name"

ORDER BY total_profit DESC;