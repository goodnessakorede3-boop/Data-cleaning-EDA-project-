SELECT TOP 5 * 
FROM dbo.OnlineRetail;

SELECT COUNT(*) AS NumberofRows
FROM dbo.OnlineRetail

SELECT COUNT(*) AS Numberofcolumns
from sys.columns
WHERE object_id =
OBJECT_ID('dbo.OnlineRetail')

SELECT 
    c.name AS ColumnName,
    t.name AS DataType 
FROM sys.columns c
JOIN sys.types t
ON C.user_type_id = t.user_type_id
WHERE c.object_id =
OBJECT_ID('dbo.OnlineRetail');

Numerical features
int
smallint
float 
datetime2

Categorical features
nvarchar

Possible uniques identifiers (Primary Key)
InvoiceNo + StockCode (composite primary key)

SELECT
    SUM(CASE WHEN InvoiceNo IS NULL THEN 1 ELSE 0 END) AS MissingInvoiceNo,
    SUM(CASE WHEN StockCode IS NULL THEN 1 ELSE 0 END) AS MissingStockCode,
    SUM(CASE WHEN Description IS NULL THEN 1 ELSE 0 END) AS MissingDescription,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS MissingQuantity,
    SUM(CASE WHEN InvoiceDate IS NULL THEN 1 ELSE 0 END) AS MissingInvoiceDate,
    SUM(CASE WHEN Unitprice IS NULL THEN 1 ELSE 0 END) AS MissingUnitPrice,
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS MissingCustomerID,
    SUM(CASE WHEN Country IS NULL THEN 1 ELSE 0 END) AS MissingCountry
FROM dbo.OnlineRetail;

SELECT
         InvoiceNo,
         StockCode,
         Description, 
         Quantity,
         Invoicedate, 
         UnitPrice,
         CustomerID,
         Country,
       COUNT(*) AS DuplicateCount
FROM OnlineRetail
GROUP BY 
           InvoiceNo,
         StockCode,
         Description, 
         Quantity,
         Invoicedate, 
         UnitPrice,
         CustomerID,
         Country
HAVING COUNT(*) > 1;

WITH DuplicateCTE AS
(
     SELECT *,
            ROW_NUMBER() OVER ( PARTITION BY InvoiceNo, StockCode, Description, Quantity, InvoiceDate,
            UnitPrice, CustomerID, Country
ORDER BY InvoiceNo ) AS rn
FROM OnlineRetail )
DELETE FROM DuplicateCTE
WHERE rn > 1;

SELECT 
    InvoiceNO,
    StockCode,
    COUNT(*) AS DuplicateCount
FROM OnlineRetail
GROUP BY
     InvoiceNo,
     StockCode
HAVING COUNT(*) >1;

UPDATE OnlineRetail
SET Country = UPPER( Country);

 SELECT TOP 20 InvoiceDate
 FROM OnlineRetail;

SELECT DISTINCT Country 
FROM OnlineRetail;

SELECT DISTINCT Description 
FROM OnlineRetail;

UPDATE OnlineRetail
SET Description = UPPER(TRIM(Description));

SELECT *
FROM OnlineRetail
WHERE Quantity < 0;

SELECT *
FROM OnlineRetail
WHERE UnitPrice < 0;

SELECT DISTINCT Country 
FROM OnlineRetail;

SELECT *
FROM OnlineRetail
ORDER BY UnitPrice DESC;

SELECT *
FROM OnlineRetail
ORDER BY Quantity DESC;

SELECT TOP 10 *
FROM OnlineRetail
ORDER BY Quantity DESC;

SELECT TOP 10 *
FROM OnlineRetail
ORDER BY Quantity DESC;

SELECT 
     MIN(UnitPrice) AS MinPrice,
     MAX(UnitPrice) AS MaxPrice
FROM OnlineRetail;

SELECT * 
FROM OnlineRetail
WHERE UnitPrice <= 0;

SELECT COUNT(*) AS ZeroPriceRows
FROM OnlineRetail
WHERE UnitPrice = 0;

SELECT 
MIN(Quantity) AS MinQuantity,
MAX(Quantity) AS MaxQuantity
FROM OnlineRetail;

SELECT COUNT(*) AS NegativeQuantity
FROM OnlineRetail
WHERE Quantity < 0;

SELECT TOP 20 * 
FROM OnlineRetail 
WHERE Quantity < 0;

SELECT COUNT (*) AS NegativePrice 
FROM OnlineREtail 
WHERE UnitPrice < 0;

SELECT 
MIN(InvoiceDate) AS EarliestDate,
MAX( InvoiceDate) AS LastestDate
FROM OnlineRetail;

SELECT DISTINCT Country 
FROM OnlineRetail
ORDER BY Country;

SELECT COUNT(*) AS MissingCustomerID
FROM OnlineRetail
WHERE CustomerID IS NULL;

SELECT COUNT(*) AS TotalRecords
FROM OnlineRetail;

SELECT COUNT(DISTINCT CustomerID) AS UniqueCustomers 
FROM OnlineRetail;

SELECT COUNT(DISTINCT StockCode) AS UniqueProducts
FROM OnlineRetail;

SELECT SUM(Quantity * UnitPrice) AS TotalSales 
FROM OnlineRetail;

SELECT AVG(unitPrice) AS AverageUnitPrice 
FROM OnlineRetail;

SELECT 
MIN(UnitPrice) AS MinimumPrice,
MAX(UnitPrice) AS MaximumPrice
FROM OnlineRetail;

SELECT AVG(Quantity) AS AverageQuantity 
FROM OnlineRetail;

SELECT 
MIN(Quantity) AS MinimumQuantity,
MAX(Quantity) AS MaximumQuantity
FROM OnlineRetail;

SELECT 
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Unitprice)
OVER() AS Median_UnitPrice
FROM OnlineRetail;

SELECT 
STDEV(UnitPrice) AS StdDev_UnitPrice
FROM OnlineRetail;

SELECT TOP 10 
Description, 
SUM(Quantity) AS TotalSold
FROM OnlineRetail
GROUP BY Description
ORDER BY TotalSold DESC;

SELECT Country, 
SUM(Quantity * UnitPrice) AS Revenue 
FROM OnlineRetail
GROUP BY Country 
ORDER BY Revenue Desc;

SELECT
YEAR(InvoiceDate) AS Year,
MONTH(InvoiceDate) AS Month,
SUM(Quantity * UnitPrice) as sales 
FROM OnlineRetail
GROUP BY Year(InvoiceDate),
Month(InvoiceDate)
ORDER BY Year, Month;

SELECT TOP 10 
Description,
COUNT(*) AS TimesPurchased
FROM OnlineRetail
GROUP BY Description 
ORDER BY TimesPurchased DESC;

SELECT TOP 10 CustomerID,
SUM(Quantity * UnitPrice) AS TotalSpent 
FROM OnlineRetail
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID 
ORDER BY TotalSpent DESC; 

SELECT *
FROM OnlineRetail;