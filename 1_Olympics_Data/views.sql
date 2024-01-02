


-- USES of a view:
--1) A view can be used to simplify a query. 
--   Mainly when sharing a sql query with a stakeholder a view can be shared instead of the complex sql query that may be too technical for some stakeholders.



CREATE or REPLACE view most_Gold_medals
AS 
SELECT
    distinct p.full_name as Name,
    nr.region_name as Country,
    COUNT(medal_name) as total_Gold_medal
From
    person p
    Inner join games_competitor gc on gc.person_id = p.id
    inner join competitor_event ce on gc.id = ce.competitor_id
    Inner join medal m on m.id = ce.medal_id
    inner join person_region pr on pr.person_id = p.id
    Inner join noc_region nr on nr.id = pr.region_id
Where
    m.medal_name = 'Gold'
Group by 1,2
Order by 
    total_Gold_medal DESC;

-- USE the view for later use: 


SELECT * 
from most_Gold_medals;


