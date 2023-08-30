SELECT 
    md.geo AS State,
    SUM(md.conversions) AS TotalConversions
FROM marketing_data md
JOIN campaign_info ci ON md.campaign_id = ci.id
WHERE ci.name = 'Campaign5'
GROUP BY md.geo
ORDER BY TotalConversions DESC;
