USE superstore_db;
SHOW TABLES;
SELECT COUNT(*) AS Total_Records
FROM superstore_sales;
DESCRIBE superstore_sales;
SHOW TABLES;
SELECT *
FROM superstore_sales;
DESCRIBE superstore_sales;
SELECT 
COUNT(*) AS total_rows,
COUNT(`Profit`) AS profit_values,
COUNT(`Sales`) AS sales_values
FROM superstore_sales;
SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT
    City,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    State,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    `Customer Name`,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    `Product Name`,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    Region,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Region
ORDER BY Total_Sales DESc;
SELECT
    City,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Category;
-- ----------------------------------------------------------
-- Query 3.1 : Which category generated the highest sales?
-- ----------------------------------------------------------

SELECT
    Category,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT
    City,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    State,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY State
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    `Customer Name`,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY `Customer Name`
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    `Product Name`,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY `Product Name`
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT
    `Ship Mode`,
    SUM(Sales) AS Total_Sales
FROM superstore_sales
GROUP BY `Ship Mode`
ORDER BY Total_Sales DESC;
SELECT COUNT(DISTINCT `Customer ID`) AS Total_Customers
FROM superstore_sales;
SELECT
    ROUND(AVG(Sales),2) AS Average_Sales
FROM superstore_sales;
SELECT *
FROM superstore_sales
WHERE Discount > 0;
SELECT
    `Order ID`,
    `Product Name`,
    Sales,
    Profit
FROM superstore_sales
WHERE Profit < 0;
SELECT
    Category,
    AVG(Sales) AS Average_Sales
FROM superstore_sales
GROUP BY Category
HAVING AVG(Sales) > 250;
SELECT
    Category,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY Category
ORDER BY Total_Profit DESC;
SELECT
    Region,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY Region
ORDER BY Total_Profit DESC;
SELECT
    State,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY State
ORDER BY Total_Profit DESC
LIMIT 10;
SELECT
    State,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY State
ORDER BY Total_Profit ASC
LIMIT 10;
SELECT
    `Product Name`,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY `Product Name`
ORDER BY Total_Profit DESC
LIMIT 10;
SELECT
    `Product Name`,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY `Product Name`
ORDER BY Total_Profit ASC
LIMIT 10;
SELECT
    City,
    Sales
FROM superstore_sales
WHERE Sales > (
    SELECT AVG(Sales)
    FROM superstore_sales
)
ORDER BY Sales DESC;
SELECT
    `Order ID`,
    Sales,
    CASE
        WHEN Sales >= 500 THEN 'High Sales'
        WHEN Sales >= 100 THEN 'Medium Sales'
        ELSE 'Low Sales'
    END AS Sales_Category
FROM superstore_sales;
SELECT
    `Customer Name`,
    SUM(Sales) AS Total_Sales,
    RANK() OVER (
        ORDER BY SUM(Sales) DESC
    ) AS Customer_Rank
FROM superstore_sales
GROUP BY `Customer Name`
LIMIT 5;
SELECT
    `Order Date`,
    Sales,
    SUM(Sales) OVER (
        ORDER BY `Order Date`
    ) AS Running_Total
FROM superstore_sales;
WITH CategorySales AS
(
    SELECT
        Category,
        SUM(Sales) AS Total_Sales
    FROM superstore_sales
    GROUP BY Category
)

SELECT *
FROM CategorySales
ORDER BY Total_Sales DESC;
SELECT
    `Sub-Category`,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY `Sub-Category`
ORDER BY Total_Profit DESC;
SELECT
    `Sub-Category`,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY `Sub-Category`
ORDER BY Total_Profit ASC;
SELECT
    ROUND(AVG(Profit),2) AS Average_Profit
FROM superstore_sales;
CREATE VIEW Sales_Summary AS
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM superstore_sales
GROUP BY Category;
SELECT *
FROM Sales_Summary;
DELIMITER //

CREATE PROCEDURE GetTopCustomers()
BEGIN
    SELECT
        `Customer Name`,
        SUM(Sales) AS Total_Sales
    FROM superstore_sales
    GROUP BY `Customer Name`
    ORDER BY Total_Sales DESC
    LIMIT 10;
END //

DELIMITER ;
CALL GetTopCustomers();


    




































