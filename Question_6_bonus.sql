----Write a query that showcases the best day of the week (e.g., Sunday, Monday, Tuesday, etc.) to run ads.

WITH DaywiseData AS (
    SELECT 
        DATEPART(weekday, md.date) AS DayOfWeek,
        SUM(md.cost) AS TotalCost,
        SUM(md.conversions) AS TotalConversions
    FROM marketing_data md
    GROUP BY DATEPART(weekday, md.date)
),

DaywiseRevenue AS (
    SELECT 
        DATEPART(weekday, date) AS DayOfWeek,
        SUM(revenue) as TotalRevenue
    FROM website_revenue
    GROUP BY DATEPART(weekday, date)
)

SELECT 
    DATENAME(weekday, dd.DayOfWeek) AS DayName,
    dd.TotalCost,
    dd.TotalConversions,
    dr.TotalRevenue,
    dd.TotalCost/dd.TotalConversions  AS CPA,
    (dr.TotalRevenue - dd.TotalCost) / NULLIF(dd.TotalCost, 0) * 100 AS ROI_Percentage
FROM DaywiseData dd
LEFT JOIN DaywiseRevenue dr ON dd.DayOfWeek = dr.DayOfWeek
ORDER BY  ROI_Percentage DESC;  
