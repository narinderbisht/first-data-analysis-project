/*
# create table 
# Row ID,Order ID,Order Date,Ship Date,Ship Mode,Customer ID,Customer Name,Segment,Country,City,State,Postal Code,Region,Product ID,Category,Sub-Category,Product Name,Sales
*/

CREATE TABLE IF NOT EXISTS sales (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    OrderId VARCHAR(20) NOT NULL,
    OrderDate DATE NOT NULL,
    ShipDate DATE,
    ShipMode VARCHAR(50),
    CustomerId VARCHAR(20),
    CustomerName VARCHAR(200),
    Sagment VARCHAR(100),
    Country VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(10),
    Region VARCHAR(20),
    ProductId VARCHAR(20),
    ProductName VARCHAR(200),
    Category VARCHAR(100),
    SubCategory VARCHAR(100),
    Sales FLOAT(15,2)
);

/*
# Overall Sales Performance: What is the total sales and profit?
*/

SELECT COUNT(OrderId) as TotalSales, SUM(Sales) as TotalSalesProfit FROM sales;

/*
# Regional Trends: Which region has the highest and lowest sales?
*/

SELECT Region, MAX(Sales) MaxSalesRegion, MIN(Sales) as MinSalesRegion FROM sales 
GROUP BY Region;

/*
# Top-Selling Products: Which product categories and subcategories contribute the most to sales?
*/

SELECT MAX(sales) as MaxSalesCategory FROM sales 
GROUP BY Category, SubCategory ORDER BY MaxSalesCategory DESC LIMIT 0, 1 

/*
# Customer Insights: Which customer segment brings in the most profit?
*/

SELECT MAX(sales) as MaxSalesSegment FROM sales 
GROUP BY Segment ORDER BY MaxSalesSegment DESC LIMIT 0, 1

/*
# Monthly Trends: How do sales and profit vary over months and years?
*/

SELECT CONCAT(MONTH(OrderDate) , '-', YEAR(OrderDate)) as MonthYear , 
COUNT(OrderId) as TotalSales, SUM(Sales) as TotalSalesProfit 
FROM sales GROUP BY MonthYear;