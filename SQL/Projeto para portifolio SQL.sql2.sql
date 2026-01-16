


USE AdventureWorksDW2025;

--TOTAL EMPLOYERS

SELECT 
COUNT(DISTINCT(S.EmployeeKey)) As TOTAL_EMPLOYERS

FROM FactResellerSales S


--TOTAL SALES BY PRODUCT

SELECT DISTINCT

S.ProductKey,
E.FirstName,
S.SalesAmount
FROM FactResellerSales S
INNER JOIN DimEmployee E ON E.EmployeeKey = S.EmployeeKey 
ORDER BY E.FirstName


--TOTAL SALES BY EMPLOYERS

SELECT
    E.FirstName + ' ' + E.LastName AS Salesperson,
    SUM(S.SalesAmount)            AS TotalSales,
    SUM(S.OrderQuantity)          AS TotalQuantity
FROM FactResellerSales S
INNER JOIN DimEmployee E ON E.EmployeeKey = S.EmployeeKey
GROUP BY 
    E.FirstName,
    E.LastName
ORDER BY 
    TotalSales DESC;

--TOP 5 BEST SELLERS
    SELECT TOP 5
    E.FirstName + ' ' + E.LastName AS Salesperson,
    SUM(S.SalesAmount)            AS TotalSales,
    SUM(S.OrderQuantity)          AS TotalQuantity
FROM FactResellerSales S
INNER JOIN DimEmployee E ON E.EmployeeKey = S.EmployeeKey
GROUP BY 
    E.FirstName,
    E.LastName
ORDER BY 
    TotalSales DESC;


--COUNTRY OF THE BEST SELLERS


 SELECT TOP 5
    E.FirstName + ' ' + E.LastName AS Salesperson,
    SUM(S.SalesAmount)            AS TotalSales,
    SUM(S.OrderQuantity)          AS TotalQuantity,
    ST.SalesTerritoryCountry
FROM FactResellerSales S
INNER JOIN DimEmployee E ON E.EmployeeKey = S.EmployeeKey
INNER JOIN DimSalesTerritory ST ON ST.SalesTerritoryKey = S.SalesTerritoryKey
GROUP BY 
    E.FirstName,
    E.LastName,
    ST.SalesTerritoryCountry
ORDER BY 
    TotalSales DESC;
