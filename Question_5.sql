--- In your opinion, which campaign was the most efficient, and why?


WITH CampaignCPA AS (
    SELECT 
        ci.id AS CampaignID,
        ci.name AS CampaignName,
        SUM(md.cost) / NULLIF(SUM(md.conversions), 0) AS CPA
    FROM campaign_info ci
    LEFT JOIN marketing_data md ON ci.id = md.campaign_id
    GROUP BY ci.id, ci.name
),

CampaignRevenue AS (
           SELECT campaign_id 
,
        SUM(revenue) as TotalRevenue
    FROM website_revenue
    GROUP BY campaign_id
)

SELECT 
    cpa.CampaignName,
    (cr.TotalRevenue - SUM(md.cost)) / NULLIF(SUM(md.cost), 0) * 100 AS ROI_Percentage,cpa.CPA
    
FROM CampaignCPA cpa
LEFT JOIN marketing_data md ON cpa.CampaignID = md.campaign_id
LEFT JOIN CampaignRevenue cr ON cpa.CampaignID = cr.campaign_id
GROUP BY cpa.CampaignName, cpa.CPA, cr.TotalRevenue
ORDER BY ROI_Percentage DESC, CPA ASC;  -- Prioritize higher ROI and then lower CPA
