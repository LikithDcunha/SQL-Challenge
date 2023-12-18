--1)  What are the number of games played in all summer olympics.

-- using CTE 

WITH t1 as (   
    SELECT  s.sport_name, COUNT(DISTINCT(g.games_name)) as num_games_where_played
    FROM games g
    inner Join games_competitor gc on g.id = gc.games_id
    inner Join competitor_event ce on gc.id = ce.competitor_id
    inner join event ev on ce.event_id = ev.id
    inner Join sport s on ev.sport_id = s.id 
    where g.season = 'Summer'
    GROUP BY 1 
    ORDER BY 2 DESC ) , 
t2 as 
    (select COUNT(g.games_name) as total_summer_games
    from games g 
    where season = 'Summer')

SELECT * 
from t1 
Join t2 on t2.total_summer_games = t1.num_games_where_played ;