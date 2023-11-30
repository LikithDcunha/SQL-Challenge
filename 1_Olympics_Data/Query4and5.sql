--4) Mention the total no of nations who participated in each olympics game
SELECT
    g.games_name as olympics_Name,
    COUNT(distinct(n.region_name)) as total_countries
From
    games g
    LEFT JOIN games_competitor gcomp on g.id = gcomp.games_id
    LEFT JOIN person p on gcomp.person_id = p.id
    LEFT JOIN person_region pr on p.id = pr.person_id
    LEFT JOIN noc_region n on pr.region_id = n.id
group by
    1
order by
    1 
    
    
--5) Give me the games which had the 5 highest number of countries participated -- taking into account from result of query 4 we can aggregate the count using CTE 

with
    t1 as (
        SELECT
            g.games_name as olympics_Name,
            COUNT(distinct(n.region_name)) as total_countries
        From
            games g
            LEFT JOIN games_competitor gcomp on g.id = gcomp.games_id
            LEFT JOIN person p on gcomp.person_id = p.id
            LEFT JOIN person_region pr on p.id = pr.person_id
            LEFT JOIN noc_region n on pr.region_id = n.id
        group by
            1
        order by
            1
    )
SELECT
    t1.olympics_Name,
    t1.total_countries
from
    t1
ORDER BY
    2 DESC
LIMIT
    5;
