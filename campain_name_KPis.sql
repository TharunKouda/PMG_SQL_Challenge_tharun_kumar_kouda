with table_1 as 
(SELECT 
    md.campaign_id AS CampaignID,
	ci.name as Campaignname,
    SUM(md.[cost]) AS TotalCost,
    SUM(md.[impressions]) AS TotalImpressions,
    SUM(md.[clicks]) AS TotalClicks 
FROM  [marketing_data] md
inner join campaign_info as ci on ci.id=md.campaign_id
GROUP BY  md.campaign_id ,ci.name
 ),

table_2 as 
(SELECT wr.campaign_id AS CampaignID,
	ci.name as Campaignname,
	SUM(wr.revenue) as Total_Revenue
    
FROM  [website_revenue] wr
inner join campaign_info as ci on ci.id=wr.campaign_id
GROUP BY  wr.campaign_id ,ci.name
 )



select t1.CampaignID,t1.Campaignname,TotalCost,TotalImpressions,TotalClicks,Total_Revenue
from table_2 t2
inner join table_1 t1 on t1.CampaignID=t2.CampaignID
order by t1.CampaignID ;