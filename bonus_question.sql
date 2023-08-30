SELECT 
    DATENAME(WEEKDAY, md.date) AS DayOfWeek,
    SUM(md.conversions) AS TotalConversions
FROM marketing_data md
GROUP BY DATENAME(WEEKDAY, md.date)
ORDER BY TotalConversions DESC;
