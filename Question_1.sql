--- Write a query to get the sum of impressions by day.



SELECT [date], 
       SUM([impressions]) as TotalImpressions
FROM [PMG_SQL_Task].[dbo].[marketing_data]
GROUP BY [date]
ORDER BY [date];


--------------------------


SELECT 
     DATENAME(weekday, [date]) AS DayName,  -- Convert datetime to date to group by days
    SUM([impressions]) AS TotalImpressions
FROM [marketing_data]
GROUP BY DATENAME(weekday, [date])
ORDER BY DATENAME(weekday, [date]);













