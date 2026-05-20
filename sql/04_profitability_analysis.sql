-- PROFITABILITY ANALYSIS
-- =========================================

-- Revenue vs Profit by category

SELECT
    "Category Name",

    ROUND(SUM("Sales")::numeric, 2) AS total_sales,

    ROUND(SUM("Order Profit Per Order")::numeric, 2)
        AS total_profit,

    ROUND(
        (
            SUM("Order Profit Per Order")
            / NULLIF(SUM("Sales"), 0)
        )::numeric * 100,
        2
    ) AS profit_margin_percentage

FROM supply_chain_data

GROUP BY "Category Name"

ORDER BY profit_margin_percentage DESC;

-- Most profitable regions

SELECT
    "Order Region",

    ROUND(SUM("Sales")::numeric, 2) AS total_sales,

    ROUND(SUM("Order Profit Per Order")::numeric, 2)
        AS total_profit,

    ROUND(
        AVG("Order Profit Per Order")::numeric,
        2
    ) AS avg_profit_per_order

FROM supply_chain_data

GROUP BY "Order Region"

ORDER BY total_profit DESC;

-- Customers generating highest profit

SELECT
    "Customer Id",

    ROUND(SUM("Order Profit Per Order")::numeric, 2)
        AS total_profit,

    ROUND(SUM("Sales")::numeric, 2)
        AS total_sales,

    COUNT(*) AS total_orders

FROM supply_chain_data

GROUP BY "Customer Id"

ORDER BY total_profit DESC

LIMIT 10;

-- Products with high sales but low profitability

SELECT
    "Product Name",

    ROUND(SUM("Sales")::numeric, 2)
        AS total_sales,

    ROUND(SUM("Order Profit Per Order")::numeric, 2)
        AS total_profit,

    ROUND(
    (
        SUM("Order Profit Per Order")
        / NULLIF(SUM("Sales"),0)
    )::numeric * 100,
    2
) AS profit_margin_percentage

FROM supply_chain_data

GROUP BY "Product Name"

HAVING SUM("Sales") > 50000

ORDER BY profit_margin_percentage ASC

LIMIT 20;