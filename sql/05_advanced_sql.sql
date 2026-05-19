-- =========================================
-- ADVANCED SQL ANALYSIS
-- =========================================

-- Top customers by revenue using RANK()

SELECT
    "Customer Id",

    ROUND(SUM("Sales")::numeric, 2) AS total_revenue,

    RANK() OVER(
        ORDER BY SUM("Sales") DESC
    ) AS revenue_rank

FROM supply_chain_data

GROUP BY "Customer Id"

ORDER BY total_revenue DESC

LIMIT 10;

-- Running total of sales by order date

SELECT
    DATE(
        TO_TIMESTAMP(
            "order date (DateOrders)",
            'MM/DD/YYYY HH24:MI'
        )
    ) AS order_date,

    ROUND(SUM("Sales")::numeric, 2) AS daily_sales,

    ROUND(
        SUM(SUM("Sales")) OVER(
            ORDER BY DATE(
                TO_TIMESTAMP(
                    "order date (DateOrders)",
                    'MM/DD/YYYY HH24:MI'
                )
            )
        )::numeric,
        2
    ) AS running_total_sales

FROM supply_chain_data

GROUP BY DATE(
    TO_TIMESTAMP(
        "order date (DateOrders)",
        'MM/DD/YYYY HH24:MI'
    )
)

ORDER BY order_date;

-- Top product categories by profit using ROW_NUMBER()

SELECT *

FROM (

    SELECT
        "Category Name",

        ROUND(SUM("Order Profit Per Order")::numeric, 2)
            AS total_profit,

        ROW_NUMBER() OVER(
            ORDER BY SUM("Order Profit Per Order") DESC
        ) AS row_num

    FROM supply_chain_data

    GROUP BY "Category Name"

) ranked_categories

WHERE row_num <= 10;

-- Average sales by customer segment

WITH customer_segment_analysis AS (

    SELECT
        "Customer Segment",

        ROUND(AVG("Sales")::numeric, 2) AS avg_sales,

        ROUND(SUM("Sales")::numeric, 2) AS total_sales,

        COUNT(*) AS total_orders

    FROM supply_chain_data

    GROUP BY "Customer Segment"

)

SELECT *

FROM customer_segment_analysis

ORDER BY total_sales DESC;