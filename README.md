# Shipment Performance & Profitability Analysis

## Business Problem

The goal of the project was to analyze shipment performance, operational efficiency, revenue and profitability within a supply chain environment.

The analysis main goals were to identify:
- operational bottlenecks,
- risks of late delivery,
- regions and products differences in profit,
- customer behaviour,
- shipping trends.

The project was a simulation of a real-world analytics workflow using PostgreSQL, SQL and Python. 


## Dataset

The project uses the DataCo Smart Supply Chain dataset. It contains over 180,000 records related to:
- customer orders and product categories,
- shipment information and modes, 
- delivery performance, 
- sales and profit metrics,
- regional operations. 

The dataset is a simulation of real-world supply chain data and includes operational, financial and customer-related data which are used to conduct business analysis.

## Tech Stack

- PostgreSQL & SQL - data storage and cleaning, KPI analysis and advanced analytics
- Python - ETL process and CSV import
- Pandas - data loading and preparation,
- SQLAlchemy - PostgreSQL connection and automated data import
- Git & GitHub - version control and project documentation
- VS Code - project development and management 

## Project Workflow

1. Data import and ETL process using Python, Pandas and PostgreSQL
2. Data cleaning and validation: 
- NULL values analysis, 
- duplicate check, 
- schema inspection, 
- date formatting 
3. KPI and operational analysis: 
- revenue and profitability analysis,
- delivery performance analysis,
- shipping efficiency evaluation,
- regional performance analysis
4. Advanced SQL analysis:
- window functions,
- CTEs,
- ranking analysis,
- moving averages and trend analysis. 
5. Profitability deep analysis: 
- margin analysis,
- high revenue / low profit products,
- customer profitability analysis

## Key Business Questions

- Which regions generate the highest revenue and profit?
- Which products and categories are the most profitable?
- Which shipping modes are the least efficient?
- What is the risk of late deliveries depending on the region?
- Which customer generate the highest income?
- Are there products with high revenue but low profitability?
- How does shipment performance change over time?
- What operational bottlenecks can be identified?

## Key Insights

- Golf Bags & Carts was the product category with the highest profit margin percentage (17,46%), then Fitness Accessories (14,77%) and Toys (14,75%)
- The Consumer segment generated most of total orders
- Most shipments experienced delivery delays, but more than 20% of shipments were delivered faster than scheduled
- Central Africa, South of USA and Southeast Asia are the regions with the highest late delivery risk
- Standard Class shipping had the highest shipment volume and longest delivery time, but was the most reliable mode and was used the most. 
- First and Second Class shipping modes were used less frequently and were more often out of scheduled, but they were still faster modes than Standard Class
- Western Europe generated the highest total revenue and shipment volume exceeding 10,000 orders. Central America ranked second, just behind Western Europe. The rest of regions generated much lower revenue. 
- Customer ID 2641 generated the highest overall profit despite not having the most orders, indicating high customer value and high profitability per order. 

## Analytical Techniques Used

- SQL aggregations and KPI analysis
- Common Table Expressions (CTEs)
- Window functions:
  - RANK()
  - DENSE_RANK()
  - ROW_NUMBER()
  - running totals
  - moving averages
- Date parsing and trend analysis using TO_TIMESTAMP() and DATE_TRUNC()
- Profit margin calculations and NULL handling using NULLIF()
- ETL workflow using Python and Pandas
- CSV import automation with SQLAlchemy
- Data cleaning and preprocessing
- Customer and regional ranking analysis
- Operational and profitability analytics

## Future Improvements

- Build an interactive Power BI dashboard for operational and profitability monitoring
- Add sales and delivery forecasting analysis
- Automate the ETL pipeline for regular database updates
- Expand customer segmentation and profitability analysis