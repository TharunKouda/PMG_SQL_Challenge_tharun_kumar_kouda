create table marketing_data (
 date datetime,
 campaign_id varchar(50),
 geo varchar(50),
 cost float,
 impressions float,
 clicks float,
 conversions float
);

create table website_revenue (
 date datetime,
 campaign_id varchar(50),
 state varchar(2),
 revenue float
);


CREATE TABLE campaign_info (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50),
    status VARCHAR(50),
    last_updated_date DATETIME,
    revenue FLOAT
);
