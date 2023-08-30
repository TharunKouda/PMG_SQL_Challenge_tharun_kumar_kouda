SELECT TOP 3 [state], 
       SUM([revenue]) as TotalRevenue
FROM [PMG_SQL_Task].[dbo].[website_revenue]
GROUP BY [state]
ORDER BY TotalRevenue DESC;
