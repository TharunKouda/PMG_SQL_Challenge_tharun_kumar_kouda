---  Write a query to get the top three revenue-generating states in order of best to worst. How much revenue did the third best state generate?

SELECT TOP 3 [state], 
       SUM([revenue]) as TotalRevenue
FROM [PMG_SQL_Task].[dbo].[website_revenue]
GROUP BY [state]
ORDER BY TotalRevenue DESC;
