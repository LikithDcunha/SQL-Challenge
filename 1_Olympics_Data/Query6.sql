------6. Fetch the top 5 athletes who have won the most gold medals.
------
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

------
------6.2) Fetch the top 5 athletes who have won the most medals (gold,silver,bronze).


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
    m.medal_name in ('Gold', 'Silver', 'Bronze')
Group by 1,2
Order by 
    total_Gold_medal DESC
Limit 10;

