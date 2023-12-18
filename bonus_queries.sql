----- 11. What are the top 5 most winning countries in olympics ? The more the medals the higher the country. 
with
    t1 as (
        SELECT
            DISTINCT region_name as countries,
            COUNT(medal_name) as total_medals
        FROM
            noc_region nr
            inner join person_region pr on pr.region_id = nr.id
            inner join person p on p.id = pr.person_id
            inner join games_competitor gc on gc.person_id = p.id
            inner join competitor_event ce on ce.competitor_id = gc.id
            inner join medal m on m.id = ce.medal_id
        Where
            m.medal_name in ('Gold', 'Silver', 'Bronze') -- excluded NA values 
        group by
            1
        order by
            2 DESC
    )
Select
    t1.*,
    DENSE_RANK() over ( order by t1.total_medals DESC) as ranking
from
    t1;
