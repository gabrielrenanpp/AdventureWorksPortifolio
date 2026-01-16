USE AdventureWorksDW2025;

WITH SalesByPerson AS (
    SELECT
        E.EmployeeKey,
        E.FirstName + ' ' + E.LastName AS Salesperson,
        SUM(S.SalesAmount)            AS TotalSales,
        SUM(S.OrderQuantity)          AS TotalQuantity,
        COUNT(DISTINCT S.SalesOrderNumber) AS TotalOrders
    FROM FactResellerSales S
    INNER JOIN DimEmployee E 
ON E.EmployeeKey = S.EmployeeKey
    GROUP BY 
        E.EmployeeKey,
        E.FirstName,
        E.LastName
)

SELECT TOP 5
    Salesperson,
    TotalSales,
    TotalQuantity,
    TotalOrders
FROM SalesByPerson
ORDER BY TotalSales ASC;
