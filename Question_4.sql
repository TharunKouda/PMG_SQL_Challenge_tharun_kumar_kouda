--- Write a query to get the number of conversions of Campaign5 by state. Which state generated the most conversions for this campaign?


SELECT 
    md.geo AS State,
    SUM(md.conversions) AS TotalConversions
FROM marketing_data md
JOIN campaign_info ci ON md.campaign_id = ci.id
WHERE ci.name = 'Campaign5'
GROUP BY md.geo
ORDER BY TotalConversions DESC;
