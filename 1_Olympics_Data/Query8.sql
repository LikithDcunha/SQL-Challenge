-- 8. What are the total no of sports played in each olympic games?
with
    t1 as (
        SELECT
            DISTINCT g.games_name,
            s.sport_name,
            COUNT(s.sport_name) as sports
        From
            games g
            inner join games_competitor gc on g.id = gc.games_id
            INNER JOIN competitor_event c on c.competitor_id = gc.id
            Inner join event e on e.id = c.event_id
            inner join sport s on s.id = e.sport_id
        Group by
            1,
            2
    ),
    t2 as (
        select
            DISTINCT t1.games_name,
            COUNT(distinct t1.sport_name) as total_sport
        From
            t1
        Group by
            t1.games_name
    )
Select
    *
From
    t2
ORDER by
    2 DESC;
