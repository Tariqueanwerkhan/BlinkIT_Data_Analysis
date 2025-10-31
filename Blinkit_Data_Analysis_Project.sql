CREATE TABLE blinkit_data (
    Item_Fat_Content       VARCHAR(50),
    Item_Identifier        VARCHAR(50),
    Item_Type              VARCHAR(50),
    Outlet_Establishment_Year INT,
    Outlet_Identifier      VARCHAR(50),
    Outlet_Location_Type   VARCHAR(50),
    Outlet_Size            VARCHAR(50),
    Outlet_Type            VARCHAR(50),
    Item_Visibility        FLOAT,
    Item_Weight            FLOAT,
    Total_Sales            FLOAT NULL,
    Rating                 FLOAT
);


select * from blinkit_data;


-- Data Cleaning (Item_Fat_Content):
-- To ensure consistency and reliability in data analysis, the Item_Fat_Content field was cleaned and standardized. 
-- This step was essential because the dataset contained multiple representations of the same category 
-- (for example, “LF”, “low fat”, and “Low Fat”). Such inconsistencies can lead to inaccurate aggregations, 
-- misleading reports, and difficulties in filtering data. By unifying these variations into a consistent format,
-- the overall data quality was enhanced, enabling more accurate analysis and better insights.

UPDATE blinkit_data
SET item_fat_content = 
CASE
	WHEN item_fat_content in ('LF', 'low fat') THEN 'Low Fat'
	WHEN item_fat_content = 'reg' THEN 'Regular'
	ELSE item_fat_content
END;

SELECT DISTINCT item_fat_content
FROM blinkit_data;



-- Total Number of Sales
SELECT CAST(SUM(total_sales) / 1000000.0 as DECIMAL(10,2)) AS Total_Sales_in_Millions
FROM blinkit_data;
-- WHERE item_fat_content = 'Regular';
-- WHERE item_fat_content = 'Low Fat';


-- Average Sales
select CAST(AVG(total_sales) as INT) AS Avg_Sales
from blinkit_data;


-- Number of Items
select count(*) as Number_of_Orders
from blinkit_data
-- where outlet_establishment_year = 2020;


-- Average Rating
select cast(AVG(rating) as decimal(10, 1)) as avg_Rating
from blinkit_data;



-- Total Sales by Fat Content
SELECT item_fat_content, 
		CAST(SUM(total_sales) as DECIMAL(10,2)) AS total_sales,
		CAST(SUM(total_sales) / 1000000.0 as DECIMAL(10,2)) AS Total_Sales_in_Millions,
		CAST(AVG(total_sales) as INT) AS Avg_Sales,
		count(*) as Number_of_Orders,
		cast(AVG(rating) as decimal(10, 1)) as avg_Rating
FROM blinkit_data
-- where outlet_establishment_year = 2020
GROUP BY item_fat_content
ORDER BY total_sales DESC;



-- Total Sales by Item Type
SELECT item_type, 
		CAST(SUM(total_sales) as DECIMAL(10,2)) AS total_sales,
		CAST(AVG(total_sales) as INT) AS Avg_Sales,
		count(*) as Number_of_Orders,
		cast(AVG(rating) as decimal(10, 1)) as avg_Rating
FROM blinkit_data
GROUP BY item_type
ORDER BY total_sales DESC
-- LIMIT 5;




-- For SQL Server
SELECT outlet_location_type,
	ISNULL([Low Fat], 0) AS Low_Fat,
	ISNULL([Regular], 0) AS Regular
FROM(
	SELECT outlet_location_type, item_fat_content,
		CAST(SUM(total_sales) as DECIMAL(10,2)) AS total_sales
	FROM blinkit_data
	GROUP BY outlet_location_type, item_fat_content
) as SourceTable
CROSSTAB(
	SUM(total_sales)
	FOR item_fat_content IN([Low_Fat], [Regular])
) AS CROSSTAB
ORDER BY outlet_location_type;




CREATE EXTENSION IF NOT EXISTS tablefunc;

-- For PostgreSQL
-- Fat Content by Outlet for Total Sales
SELECT *
FROM crosstab(
    $$
    SELECT outlet_location_type, item_fat_content, 
           CAST(SUM(total_sales) as DECIMAL(10,2)) AS total_sales
    FROM blinkit_data
    GROUP BY outlet_location_type, item_fat_content
    ORDER BY outlet_location_type, item_fat_content
    $$,
    $$ VALUES ('Low Fat'), ('Regular') $$
) AS ct(
    outlet_location_type TEXT,
    "Low Fat" DECIMAL(10,2),
    "Regular" DECIMAL(10,2)
);



-- Total Sales by Outlet Establishment
SELECT outlet_establishment_year,
		CAST(SUM(total_sales) as DECIMAL(10,2)) AS total_sales,
		CAST(AVG(total_sales) as INT) AS Avg_Sales,
		count(*) as Number_of_Orders,
		cast(AVG(rating) as decimal(10, 1)) as avg_Rating
from blinkit_data
GROUP BY outlet_establishment_year
ORDER BY outlet_establishment_year ASC;


-- Percentage of Sales by Outlet Size:
-- 	Objective: Analyze the correlation between outlet size and total sales.
SELECT outlet_size,
		CAST(SUM(total_sales) as DECIMAL(10,2)) AS total_sales,
		CAST((SUM(total_sales) * 100.0 / SUM(SUM(total_sales)) over()) as DECIMAL(10,2)) AS Sales_Percentage 
FROM blinkit_data
GROUP BY outlet_size
order by total_sales DESC;


-- Sales by Outlet Location:
-- 	Objective: Assess the geographic distribution of sales across different locations.
SELECT outlet_location_type,
		CAST(SUM(total_sales) as DECIMAL(10,2)) AS Total_sales,
		CAST((SUM(total_sales) * 100.0 / SUM(SUM(total_sales)) over()) as DECIMAL(10,2)) AS Sales_Percentage,
		CAST(AVG(total_sales) as INT) AS Avg_Sales,
		count(*) as Number_of_Orders,
		cast(AVG(rating) as decimal(10, 1)) as avg_Rating
FROM blinkit_data
GROUP BY outlet_location_type
order by Total_sales DESC;




-- All Metrics by Outlet Type:
-- 	Objective: Provide a comprehensive view of all key metrics (Total Sales, sales percentage, Average Sales, Number of Items, Average Rating) broken down by different outlet types.
SELECT outlet_type,
		CAST(SUM(total_sales) as DECIMAL(10,2)) AS Total_sales,
		CAST((SUM(total_sales) * 100.0 / SUM(SUM(total_sales)) over()) as DECIMAL(10,2)) AS Sales_Percentage,
		CAST(AVG(total_sales) as INT) AS Avg_Sales,
		COUNT(*) as Number_of_Items,
		CAST(AVG(rating) as decimal(10, 1)) as avg_Rating,
		CAST(AVG(item_visibility) as Decimal(10,2)) AS Avg_Item_Visibility
FROM blinkit_data
GROUP BY outlet_type
order by Total_sales DESC;



