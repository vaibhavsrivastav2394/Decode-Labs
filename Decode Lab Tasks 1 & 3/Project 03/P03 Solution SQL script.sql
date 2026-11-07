-- DECODELABS - PROJECT 3: SQL DATA ANALYSIS

--  CREATE DATABASE
CREATE DATABASE IF NOT EXISTS vai;

USE vai;

SELECT * FROM vai.dataset_for_data_analytics;
show tables;

-- Query 1: Total Revenue and Order by Product
SELECT 
    Product, 
    COUNT(OrderID) AS TotalOrders, 
    ROUND(SUM(TotalPrice), 2) AS TotalRevenue,
    ROUND(AVG(TotalPrice), 2) AS AverageOrderValue
FROM dataset_for_data_analytics
GROUP BY Product
ORDER BY TotalRevenue DESC;

SELECT * FROM vai.dataset_for_data_analytics;
DESCRIBE dataset_for_data_analytics;
-- Query 2: Filtering High-Value Shipped Orders
SELECT 
    OrderID, 
    CustomerID, 
    Product, 
    PaymentMethod, 
    ROUND(TotalPrice, 2) AS TotalPrice
FROM dataset_for_data_analytics
WHERE OrderStatus = 'Shipped' AND TotalPrice > 2500
ORDER BY TotalPrice DESC;

SELECT * FROM vai.dataset_for_data_analytics;
DESCRIBE dataset_for_data_analytics;


-- Query 3: Filtering Aggregated Buckets using HAVING (Average Quantity > 2.9)
SELECT 
    Product, 
    COUNT(*) AS OrderCount, 
    ROUND(AVG(Quantity), 2) AS AvgQuantity
FROM dataset_for_data_analytics
GROUP BY Product
HAVING AVG(Quantity) > 2.9
ORDER BY AvgQuantity DESC;

SELECT * FROM vai.dataset_for_data_analytics;
DESCRIBE dataset_for_data_analytics;


-- Query 4: Payment Method Performance Breakdown (COUNT, SUM)
SELECT 
    PaymentMethod, 
    COUNT(OrderID) AS TransactionCount, 
    ROUND(SUM(TotalPrice), 2) AS GrossRevenue
FROM dataset_for_data_analytics
GROUP BY PaymentMethod
ORDER BY GrossRevenue DESC;

SELECT * FROM vai.dataset_for_data_analytics;
DESCRIBE dataset_for_data_analytics;