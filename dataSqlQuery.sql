/*
# create table 
# Row ID,Order ID,Order Date,Ship Date,Ship Mode,Customer ID,Customer Name,Segment,Country,City,State,Postal Code,Region,Product ID,Category,Sub-Category,Product Name,Sales,Quantity,Discount,Profit
*/

CREATE TABLE IF NOT EXISTS super_stores (
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
    Sales FLOAT(15,2),
    Quantity INT,
    Discount FLOAT(5,2),
    Profit FLOAT(15,2)

);

/*
# Overall Sales Performance: What is the total sales and profit?
*/

SELECT SUM(Sales) as TotalSales, SUM(Profit) as TotalProfit FROM super_stores;

/*
# Regional Trends: Which region has the highest and lowest sales?
*/

SELECT Region, MAX(Sale) MaxSalesRegion, MIN(Sales) as MinSalesRegion 
FROM super_stores GROUP BY Region;

/*
# Top-Selling Products: Which product categories and subcategories contribute the most to sales?
*/

SELECT Category, SubCategory, MAX(Sales) as MaxSalesCategory FROM super_stores 
GROUP BY Category, SubCategory ORDER BY MaxSalesCategory DESC;

/*
# Customer Insights: Which customer segment brings in the most profit?
*/

SELECT Sagment, MAX(Profit) as MaxProfitSagment FROM super_stores 
GROUP BY Sagment ORDER BY MaxProfitSagment DESC;

/*
# Monthly Trends: How do sales and profit vary over months and years?
*/

SELECT CONCAT(YEAR(OrderDate) , '-', MONTH(OrderDate)) as MonthYear , 
SUM(Sales) as TotalSales, SUM(Profit) as TotalProfit 
FROM super_stores GROUP BY MonthYear DESC;