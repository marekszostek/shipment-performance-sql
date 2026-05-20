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

-- Top customers within each region using DENSE_RANK()

SELECT *

FROM (

    SELECT
        "Order Region",

        "Customer Id",

        ROUND(SUM("Sales")::numeric, 2) AS total_sales,

        DENSE_RANK() OVER(
            PARTITION BY "Order Region"
            ORDER BY SUM("Sales") DESC
        ) AS regional_rank

    FROM supply_chain_data

    GROUP BY
        "Order Region",
        "Customer Id"

) ranked_customers

WHERE regional_rank <= 3

ORDER BY
    "Order Region",
    regional_rank;

-- Monthly sales trend analysis

SELECT
    DATE_TRUNC(
        'month',
        TO_TIMESTAMP(
            "order date (DateOrders)",
            'MM/DD/YYYY HH24:MI'
        )
    ) AS sales_month,

    ROUND(SUM("Sales")::numeric, 2) AS monthly_sales

FROM supply_chain_data

GROUP BY sales_month

ORDER BY sales_month;

-- Moving average of monthly sales

WITH monthly_sales AS (

    SELECT
        DATE_TRUNC(
            'month',
            TO_TIMESTAMP(
                "order date (DateOrders)",
                'MM/DD/YYYY HH24:MI'
            )
        ) AS sales_month,

        ROUND(SUM("Sales")::numeric, 2) AS monthly_sales

    FROM supply_chain_data

    GROUP BY sales_month

)

SELECT
    sales_month,

    monthly_sales,

    ROUND(
        AVG(monthly_sales) OVER(
            ORDER BY sales_month
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
        )::numeric,
        2
    ) AS moving_avg_3_months

FROM monthly_sales

ORDER BY sales_month;