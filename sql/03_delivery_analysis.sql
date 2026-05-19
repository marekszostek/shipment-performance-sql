-- =========================================
-- DELIVERY & OPERATIONAL ANALYSIS
-- =========================================

-- Delivery status overview

SELECT
    "Delivery Status",

    COUNT(*) AS total_shipments

FROM supply_chain_data

GROUP BY "Delivery Status"

ORDER BY total_shipments DESC;

-- Shipping mode performance

SELECT
    "Shipping Mode",

    ROUND(AVG("Days for shipping (real)")::numeric, 2)
        AS avg_real_shipping_days,

    ROUND(AVG("Days for shipment (scheduled)")::numeric, 2)
        AS avg_scheduled_shipping_days,

    COUNT(*) AS total_shipments

FROM supply_chain_data

GROUP BY "Shipping Mode"

ORDER BY avg_real_shipping_days DESC;

-- Regions with highest late delivery risk

SELECT
    "Order Region",

    ROUND(AVG("Late_delivery_risk")::numeric, 2)
        AS avg_late_delivery_risk,

    COUNT(*) AS total_shipments

FROM supply_chain_data

GROUP BY "Order Region"

ORDER BY avg_late_delivery_risk DESC;

-- Top regions by shipment volume

SELECT
    "Order Region",

    COUNT(*) AS shipment_volume

FROM supply_chain_data

GROUP BY "Order Region"

ORDER BY shipment_volume DESC;