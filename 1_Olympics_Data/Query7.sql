-- 7) Which Sports were just played only once in the olympics?
with
    t1 as (
        SELECT
            DISTINCT g.games_name as games,
            sport_name as sport
        FROM
            sport s
            inner Join event e on s.id = e.sport_id
            inner join competitor_event c on c.event_id = e.id
            inner JOIN games_competitor gc on gc.id = c.competitor_id
            inner JOIN games g on g.id = gc.games_id
        order by
            2 asc
    ),
    t2 as (
        SELECT
            sport,
            COUNT(1) as no_of_games
        From
            t1
        group by
            sport
    )
Select
    t2.*,
    t1.games
from
    t2
    join t1 on t1.sport = t2.sport
where
    t2.no_of_games = 1
order by
    t1.sport;