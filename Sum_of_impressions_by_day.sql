SELECT [date], 
       SUM([impressions]) as TotalImpressions
FROM [PMG_SQL_Task].[dbo].[marketing_data]
GROUP BY [date]
ORDER BY [date];
